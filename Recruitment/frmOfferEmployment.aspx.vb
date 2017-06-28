Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Partial Class Recruitment_frmOfferEmployment
    Inherits System.Web.UI.Page

    Dim ShortListedCanData As New clsShortListedCanDataAccess()
    Dim IntGradeData As New clsIntGradeDataAccess()
    Dim DeptData As New clsDepartmentDataAccess()
    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()
    Dim CVSelectionData As New clsCVSelectionDataAccess()
    Dim RecruitmentPropoData As New clsRecruitmentProposalDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If
        Try
            If Not IsPostBack Then
                GetShortListedCandidate()
                ShowULCBranch()
                ShowDepertment()
                ShowDesignationOfficial()
                ShowEmployeeType()
            End If

            If grdShortListedCandidate.Rows.Count > 0 Then
                'This replaces <td> with <th> and adds the scope attribute
                grdShortListedCandidate.UseAccessibleHeader = True
                'This will add the <thead> and <tbody> elements
                grdShortListedCandidate.HeaderRow.TableSection = TableRowSection.TableHeader
                'This adds the <tfoot> element.Remove if you don't have a footer row
                grdShortListedCandidate.FooterRow.TableSection = TableRowSection.TableFooter
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub ShowEmployeeType()
        drpEmployeeType.DataTextField = "EmployeeTypeName"
        drpEmployeeType.DataValueField = "EmployeeTypeID"
        drpEmployeeType.DataSource = EmployeeInfoData.fnGetEmployeeType()
        drpEmployeeType.DataBind()
    End Sub

    Protected Sub GetShortListedCandidate()
        grdShortListedCandidate.DataSource = ShortListedCanData.fnGetShortListedCandidate()
        grdShortListedCandidate.DataBind()
    End Sub

    Protected Sub ShowULCBranch()
        drpRecommendedLocation.DataTextField = "ULCBranchName"
        drpRecommendedLocation.DataValueField = "ULCBranchID"
        drpRecommendedLocation.DataSource = EmployeeInfoData.fnGetULCBranch()
        drpRecommendedLocation.DataBind()

        Dim A As New ListItem()
        A.Text = "N\A"
        A.Value = "N\A"
        drpRecommendedLocation.Items.Insert(0, A)
    End Sub

    Protected Sub ShowDepertment()
        drpRecommendedDepartment.DataTextField = "DeptName"
        drpRecommendedDepartment.DataValueField = "DepartmentID"
        drpRecommendedDepartment.DataSource = DeptData.fnGetDeptList()
        drpRecommendedDepartment.DataBind()

        Dim A As New ListItem()
        A.Text = "N\A"
        A.Value = "N\A"
        drpRecommendedDepartment.Items.Insert(0, A)
    End Sub

    Protected Sub ShowDesignationOfficial()
        drpRecommendedPosition.DataTextField = "DesignationName"
        drpRecommendedPosition.DataValueField = "DesignationID"
        drpRecommendedPosition.DataSource = EmployeeInfoData.fnGetOfficialDesignation()
        drpRecommendedPosition.DataBind()

        Dim A As New ListItem()
        A.Text = "N\A"
        A.Value = "N\A"
        drpRecommendedPosition.Items.Insert(0, A)
    End Sub

    Protected Sub btnHROffer_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnHROffer.Click
        If drpRecommendedDepartment.SelectedValue = "N\A" Then
            MessageBox("Select A Valid Department First.")
            Exit Sub
        End If

        If drpRecommendedLocation.SelectedValue = "N\A" Then
            MessageBox("Select A Valid Branch First.")
            Exit Sub
        End If

        If drpRecommendedPosition.SelectedValue = "N\A" Then
            MessageBox("Select A Valid Designation First.")
            Exit Sub
        End If

        Dim lblCircularID, lblCandidateID, lblIntCandidateID As New Label()

        lblCandidateID = grdShortListedCandidate.SelectedRow.FindControl("lblCandidateID")
        lblCircularID = grdShortListedCandidate.SelectedRow.FindControl("lblCircularID")
        lblIntCandidateID = grdShortListedCandidate.SelectedRow.FindControl("lblIntCandidateID")

        Dim RecruitmentPropo As New clsRecruitmentProposal()

        RecruitmentPropo.IntCandidateID = lblIntCandidateID.Text
        RecruitmentPropo.CandidateID = lblCandidateID.Text
        RecruitmentPropo.CircularID = lblCircularID.Text
        RecruitmentPropo.DepartmentID = drpRecommendedDepartment.SelectedValue
        RecruitmentPropo.ULCBranchID = drpRecommendedLocation.SelectedValue
        RecruitmentPropo.DesignationID = drpRecommendedPosition.SelectedValue
        RecruitmentPropo.EmployeeTypeID = drpEmployeeType.SelectedValue
        RecruitmentPropo.Salary = Convert.ToDouble(txtSalary.Text)
        RecruitmentPropo.ExpectedJoiningDate = Convert.ToDateTime(txtExpectedJoiningDate.Text)
        RecruitmentPropo.EffectiveFrom = Convert.ToDateTime(txtEffectiveDate.Text)
        If txtEffectiveTo.Text = "" Then
            RecruitmentPropo.EffectiveTo = "1/1/1900"
        Else
            RecruitmentPropo.EffectiveTo = Convert.ToDateTime(txtEffectiveTo.Text)
        End If
        RecruitmentPropo.Period = Convert.ToInt32(txtPeriodInMonths.Text)
        RecruitmentPropo.Remarks = txtRemarks.Text
        RecruitmentPropo.EntryBy = Session("LoginUserID")

        Try
            Dim myReport As New ReportDocument()
            Dim folder As String
            Dim f As String
            Dim repName As String

            f = "~/Reports/"

            folder = Server.MapPath(f)
            repName = folder & drpAppointLetterFormat.SelectedValue.ToString()
            myReport.Load(repName)

            Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]
            Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionStringRpt").ConnectionString
            Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

            retArr = conStr.Split(";")
            serverArr = retArr(0).Split("=")
            dbArr = retArr(1).Split("=")
            usrArr = retArr(2).Split("=")
            pwdArr = retArr(3).Split("=")

            serverName = serverArr(1)
            uid = usrArr(1)
            pwd = pwdArr(1)
            dbName = dbArr(1)

            myReport.SetDatabaseLogon(uid, pwd, serverName, dbName)

            Dim parameters As CrystalDecisions.Web.Parameter = New CrystalDecisions.Web.Parameter()

            myReport.SetParameterValue("@IntCandidateID", RecruitmentPropo.IntCandidateID)
            myReport.SetParameterValue("@CandidateID", RecruitmentPropo.CandidateID)
            myReport.SetParameterValue("@CircularID", RecruitmentPropo.CircularID)
            myReport.SetParameterValue("@DepartmentID", RecruitmentPropo.DepartmentID)
            myReport.SetParameterValue("@ULCBranchID", RecruitmentPropo.ULCBranchID)
            myReport.SetParameterValue("@DesignationID", RecruitmentPropo.DesignationID)
            myReport.SetParameterValue("@EmployeeTypeID", RecruitmentPropo.EmployeeTypeID)
            myReport.SetParameterValue("@Salary", RecruitmentPropo.Salary)
            myReport.SetParameterValue("@ExpectedJoiningDate", RecruitmentPropo.ExpectedJoiningDate)
            myReport.SetParameterValue("@EffectiveFrom", RecruitmentPropo.EffectiveFrom)
            myReport.SetParameterValue("@EffectiveTo", RecruitmentPropo.EffectiveTo)
            myReport.SetParameterValue("@Period", RecruitmentPropo.Period)
            myReport.SetParameterValue("@Remarks", RecruitmentPropo.Remarks)
            myReport.SetParameterValue("@EntryBy", RecruitmentPropo.EntryBy)
            myReport.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, True, "ExportedReport")
            MessageBox("Prposal Submitted.")
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnCancelSelection_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelSelection.Click
        ClearHRAssessmentForm()
    End Sub

    Protected Sub ClearHRAssessmentForm()
        drpRecommendedDepartment.SelectedIndex = -1
        drpRecommendedLocation.SelectedIndex = -1
        drpRecommendedPosition.SelectedIndex = -1

        txtExpectedJoiningDate.Text = ""
        txtSalary.Text = ""
        txtRemarks.Text = ""
    End Sub

    Protected Sub grdShortListedCandidate_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdShortListedCandidate.SelectedIndexChanged

        Dim lblCircularID, lblCandidateID As New Label()

        lblCandidateID = grdShortListedCandidate.SelectedRow.FindControl("lblCandidateID")
        lblCircularID = grdShortListedCandidate.SelectedRow.FindControl("lblCircularID")

        Session("RecCandidateID") = lblCandidateID.Text
        Session("RecCircularID") = lblCircularID.Text
    End Sub

    Protected Sub drpAppointLetterFormat_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpAppointLetterFormat.SelectedIndexChanged

        If drpAppointLetterFormat.SelectedItem.Text = "Intern With Out Payment" Or drpAppointLetterFormat.SelectedItem.Text = "Intern With Payment" Then
            reqFldEffectiveTo.ValidationGroup = "HRAssessment"

            If drpAppointLetterFormat.SelectedItem.Text = "Intern With Out Payment" Then
                txtSalary.Text = "0"
                txtSalary.Enabled = False
            Else
                txtSalary.Enabled = True
            End If
        Else

        End If

        SetFocus(btnHROffer)
    End Sub

    Protected Sub txtEffectiveDate_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtEffectiveDate.TextChanged

        If txtPeriodInMonths.Text <> "" Then
            txtEffectiveTo.Text = Convert.ToDateTime(txtEffectiveDate.Text).AddMonths(Convert.ToInt32(txtPeriodInMonths.Text))
        End If
        SetFocus(btnHROffer)
    End Sub

    Protected Sub btnChangeStatus_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnChangeStatus.Click
        Dim lblAppliedJobID As New Label()

        If grdShortListedCandidate.SelectedIndex = -1 Then
            MessageBox("Select An Applicant Frist.")
            Exit Sub
        End If

        Try
            lblAppliedJobID = grdShortListedCandidate.SelectedRow.FindControl("lblAppliedJobID")

            If lblAppliedJobID.Text = "" Then
                MessageBox("Select A Candidate First.")
                Exit Sub
            End If

            If drpExChangeStatus.SelectedValue = "N\A" Then
                MessageBox("Select Desired Status For The Candidate")
                Exit Sub
            End If

            Dim check As Integer = CVSelectionData.fnReviewApplicant(lblAppliedJobID.Text, drpExChangeStatus.SelectedValue, Session("LoginUserID"))

            If check = 1 Then
                MessageBox("Status Changed Successfully.")
                ClearHRAssessmentForm()
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

End Class
