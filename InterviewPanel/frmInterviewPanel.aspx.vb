Imports System
Imports System.Data

Partial Class InterviewPanel_frmInterviewPanel
    Inherits System.Web.UI.Page

    Dim DeptData As New clsDepartmentDataAccess()
    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()
    Dim IntManQuesData As New clsIntManQuestionDataAccess()
    Dim IntGradeData As New clsIntGradeDataAccess()
    Dim IntCandidateData As New clsInterviewCandidateDataAccess()
    Dim dataCanBasicInfo As New clsCanBasicDataAccess()
    Dim IntCanAssessmentData As New clsIntCandidateAssessmentDataAccess()
    Dim IntPanelData As New clsInterviewPanelDataAccess()
    Dim RecTypeData As New clsRecruitmentTypeDataAccess()
    Dim CanTagData As New clsCanRecruitmentTagDataAccess()


    Protected Sub GetRecTypeList()
        chkLstSuitForRecruitment.DataTextField = "RecruitmentType"
        chkLstSuitForRecruitment.DataValueField = "RecruitmentTypeID"
        chkLstSuitForRecruitment.DataSource = RecTypeData.fnGetRecTypeList()
        chkLstSuitForRecruitment.DataBind()
    End Sub

    Protected Sub btnMakeAssessment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMakeAssessment.Click

        Dim lblIntManQuestionID As New System.Web.UI.WebControls.Label()
        Dim chkIntManQuestion As New System.Web.UI.WebControls.CheckBox()
        Dim AskedManQuestions As String = ""
        Dim IntCanAssessmentInfo As New clsIntCandidateAssessment()
        Dim EmployeeID As String = Session("UniqueUserID")
        Dim AttendeeList As String = ""

        Dim lblIntCandidateID As New System.Web.UI.WebControls.Label()
        lblIntCandidateID = grdInterviewCandidate.SelectedRow.FindControl("lblIntCandidateID")


        IntCanAssessmentInfo.IntCandidateID = lblIntCandidateID.Text
        IntCanAssessmentInfo.IntGradeID = drpApplicantGrade.SelectedValue
        IntCanAssessmentInfo.DesignationID = drpRecommendedPosition.SelectedValue
        IntCanAssessmentInfo.DepartmentID = drpRecommendedDepartment.SelectedValue
        IntCanAssessmentInfo.ULCBranchID = drpRecommendedLocation.SelectedValue
        IntCanAssessmentInfo.Observations = txtObservation.Text
        IntCanAssessmentInfo.MarksObtained = Convert.ToDouble(txtMarksObtained.Text)
        IntCanAssessmentInfo.MarksOutOf = Convert.ToDouble(txtMarksOutOf.Text)
        IntCanAssessmentInfo.IntTakerID = EmployeeID

        For Each rw As GridViewRow In grdMandatoryIntQuestions.Rows
            chkIntManQuestion = rw.FindControl("chkIntManQuestion")
            If chkIntManQuestion.Checked = True Then
                lblIntManQuestionID = rw.FindControl("lblIntManQuestionID")
                AskedManQuestions += lblIntManQuestionID.Text + ","
            End If
        Next

        If AskedManQuestions <> "" Then
            AskedManQuestions = AskedManQuestions.Remove(Len(AskedManQuestions) - 1, 1)
            IntCanAssessmentInfo.IntManQuestionIDList = AskedManQuestions
        Else
            IntCanAssessmentInfo.IntManQuestionIDList = ""
        End If

        Dim lblEmployeeID As Label
        For Each rw As GridViewRow In grdActualAttendees.Rows
            lblEmployeeID = rw.FindControl("lblActualIntAttEmployeeID")
            AttendeeList = AttendeeList & lblEmployeeID.Text & "~|"
        Next

        If AttendeeList <> "" Then
            IntCanAssessmentInfo.AttendeeList = AttendeeList
        Else
            IntCanAssessmentInfo.AttendeeList = ""
        End If

        Dim isSuitableForRec As Boolean = False
        Dim SuitableForRec As String = ""
        For Each itm As ListItem In chkLstSuitForRecruitment.Items
            If itm.Selected = True Then
                isSuitableForRec = True
                SuitableForRec = SuitableForRec & itm.Value & ","
            End If
        Next

        If SuitableForRec <> "" Then
            SuitableForRec = SuitableForRec.Remove(Len(SuitableForRec) - 1, 1)
        End If

        IntCanAssessmentInfo.SuitableForRec = SuitableForRec

        Dim check As Integer = IntCanAssessmentData.fnInsertIntAssessment(IntCanAssessmentInfo)

        If check = 1 Then
            MessageBox("Assessment Done.")
            ClearIntAssessmentForm()
            GetAvailableIntCandidats()
        Else
            MessageBox("Error Found While Making Assessment.")
        End If

    End Sub

    Protected Sub btnCancelSelection_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelSelection.Click
        ClearIntAssessmentForm()
    End Sub

    Protected Sub ClearIntAssessmentForm()

        txtName.Text = ""
        txtFatherName.Text = ""
        txtFarherOccupation.Text = ""
        txtMotherName.Text = ""
        txtMotherOccupation.Text = ""
        txtSpouseName.Text = ""
        txtSpouseOccupation.Text = ""
        txtgender.Text = ""
        txtNationality.Text = ""
        txtReligion.Text = ""
        txtNoofChildrenAndAge.Text = ""
        txtPresentSalary.Text = ""
        txtPreSalDrawndate.Text = ""
        txtPreSalDrawndate.Text = ""
        txtEmployeer.Text = ""
        txtExpectedSalary.Text = ""
        txtPreferredJobLocation.Text = ""
        txtRelationshipStatus.Text = ""
        imgValidation.ImageUrl = ""

        Session("CandidateID") = ""

        ' Claring Assess Info.
        grdInterviewCandidate.SelectedIndex = -1
        txtObservation.Text = ""
        txtMarksObtained.Text = "0"
        drpApplicantGrade.SelectedIndex = -1
        drpRecommendedDepartment.SelectedIndex = -1
        drpRecommendedLocation.SelectedIndex = -1
        drpRecommendedPosition.SelectedIndex = -1

        Dim chkIntManQuestion As New System.Web.UI.WebControls.CheckBox()
        For Each rw As GridViewRow In grdMandatoryIntQuestions.Rows
            chkIntManQuestion = rw.FindControl("chkIntManQuestion")
            If chkIntManQuestion.Checked = True Then
                chkIntManQuestion.Checked = False
            End If
        Next

        grdPanelMembers.DataSource = ""
        grdPanelMembers.DataBind()

        btnMakeAssessment.Enabled = False

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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            GetActiveIntManQuestions()
            GetRecTypeList()
            ShowIntCanGradeList()
            ShowULCBranch()
            ShowDepertment()
            ShowDesignationOfficial()
            GetAvailableIntCandidats()
            btnMakeAssessment.Enabled = False

            pnlInterviewAttendees.Visible = False
            pnlCredentials.Visible = False
            txtMarksObtained.Text = String.Format("{0:N2}", 0)
            txtMarksOutOf.Text = String.Format("{0:N2}", 0)

            Dim dtIntAttendee As DataTable
            dtIntAttendee = FormatActualAttendee()
            Session("IntAttendee") = dtIntAttendee

        End If
    End Sub

    Protected Sub GetAvailableIntCandidats()
        Dim EmployeeID As String = Session("UniqueUserID")
        grdInterviewCandidate.DataSource = IntCandidateData.fnGetIntCandidatesByIntTaker(EmployeeID)
        grdInterviewCandidate.DataBind()
    End Sub

    Protected Sub ShowIntCanGradeList()
        drpApplicantGrade.DataTextField = "GradeName"
        drpApplicantGrade.DataValueField = "IntGradeID"
        drpApplicantGrade.DataSource = IntGradeData.fnShowIntGradeList()
        drpApplicantGrade.DataBind()
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub GetActiveIntManQuestions()
        grdMandatoryIntQuestions.DataSource = IntManQuesData.fnShowActiveIntManQuestion(True)
        grdMandatoryIntQuestions.DataBind()
    End Sub

    Protected Sub ShowTeamWiseMemberInfo(ByVal IntTeamID As String)
        Dim IntPanelInfo As New clsInterviewPanel()
        IntPanelInfo.IntTeamID = IntTeamID
        grdPanelMembers.DataSource = IntPanelData.fnGetIntPanelwiseMemberInfo(IntPanelInfo)
        grdPanelMembers.DataBind()
    End Sub

    Protected Sub grdInterviewCandidate_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdInterviewCandidate.RowDataBound
        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(2).Text = "Total:"
            e.Row.Cells(3).Text = grdInterviewCandidate.Rows.Count.ToString()
        End If
    End Sub

    Protected Function FormatTable() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("RecruitmentTypeID", System.Type.GetType("System.String"))
        Return dt
    End Function

    Protected Sub grdInterviewCandidate_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdInterviewCandidate.SelectedIndexChanged

        pnlInterviewAttendees.Visible = True

        Dim lblCandidateID, lblIntTeamID As New System.Web.UI.WebControls.Label()
        lblCandidateID = grdInterviewCandidate.SelectedRow.FindControl("lblCandidateID")
        lblIntTeamID = grdInterviewCandidate.SelectedRow.FindControl("lblIntTeamID")

        ShowTeamWiseMemberInfo(lblIntTeamID.Text)

        Dim dtIntAttendee As DataTable
        dtIntAttendee = Session("IntAttendee")

        Dim lblParentEmpID As Label
        Dim ChildEmpID As String = ""
        Dim flag As Boolean = False
        Dim i As Integer = 0
        Dim Str(100) As String
        For Each rwChild As DataRow In dtIntAttendee.Rows
            ChildEmpID = rwChild.Item("EmployeeID") 'rwChild.FindControl("lblActualIntAttEmployeeID")

            For Each rw As GridViewRow In grdPanelMembers.Rows
                lblParentEmpID = rw.FindControl("lblEmployeeIDIntAttendee")
                If lblParentEmpID.Text = ChildEmpID Then
                    flag = True
                    Exit For
                Else
                    flag = False
                End If
            Next

            If flag = False Then
                Str(i) = ChildEmpID
                i += 1
            End If
        Next

        '' Delete Emp. From Actual Attendee.
        i = 0
        'For i = 0 To Str.Length
        While i <= Str.Length And Str(i) <> Nothing
            For Each rw As DataRow In dtIntAttendee.Rows
                If rw.Item("EmployeeID") = Str(i) Then
                    dtIntAttendee.Rows.Remove(rw)
                    dtIntAttendee.AcceptChanges()
                    Exit For
                End If
            Next
            i += 1
        End While
        'Next

        grdPanelMembers.SelectedIndex = -1

        grdActualAttendees.DataSource = dtIntAttendee
        grdActualAttendees.DataBind()


        Session("CandidateID") = lblCandidateID.Text
        Dim CandidateID As String

        CandidateID = Session("CandidateID")

        Dim BasicInfo As New CanBasicInfo()

        BasicInfo = dataCanBasicInfo.fnGetCandidateDetailsViewForRecuitment(CandidateID)

        txtName.Text = BasicInfo.Name
        txtFatherName.Text = BasicInfo.FatherName
        txtFarherOccupation.Text = BasicInfo.FathersOccupation
        txtMotherName.Text = BasicInfo.MotherName
        txtMotherOccupation.Text = BasicInfo.MothersOccupation
        txtSpouseName.Text = BasicInfo.SpouseName
        txtSpouseOccupation.Text = BasicInfo.SpouseOccupation
        txtgender.Text = BasicInfo.Gender
        txtNationality.Text = BasicInfo.Nationality
        txtReligion.Text = BasicInfo.Religion
        txtNoofChildrenAndAge.Text = BasicInfo.NoOfChildrenAge
        txtPresentSalary.Text = BasicInfo.PresentSalary

        If BasicInfo.LastDrawnDate = "01 Jan 1911" Then
            txtPreSalDrawndate.Text = ""
        Else
            txtPreSalDrawndate.Text = BasicInfo.LastDrawnDate
        End If
        txtEmployeer.Text = BasicInfo.Employeer
        txtExpectedSalary.Text = BasicInfo.ExpectedSalary
        txtPreferredJobLocation.Text = BasicInfo.PreferredJobLocation
        txtRelationshipStatus.Text = BasicInfo.RelationshipStatus

        imgValidation.ImageUrl = "~/Attachments/" + BasicInfo.Attachment

        btnMakeAssessment.Enabled = True

        '' Get Already Tagged Data
        Dim dt As DataTable = FormatTable()
        lblCandidateID = grdInterviewCandidate.SelectedRow.FindControl("lblCandidateID")
        dt = CanTagData.fnGetRecTagByCandidate(lblCandidateID.Text).Tables(0)

        For Each dr As DataRow In dt.Rows
            Dim indx As Integer = chkLstSuitForRecruitment.Items.IndexOf(chkLstSuitForRecruitment.Items.FindByValue(dr.Item("RecruitmentTypeID")))
            If indx <> -1 Then
                chkLstSuitForRecruitment.Items(indx).Selected = True
                chkLstSuitForRecruitment.Items(indx).Attributes.Add("style", "font:bold")
            End If
        Next

    End Sub

    Protected Sub lnkBtnCandidateCVDetails_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkBtnCandidateCVDetails.Click
        Try
            Dim lblCandidateID As New System.Web.UI.WebControls.Label()

            lblCandidateID = grdInterviewCandidate.SelectedRow.FindControl("lblCandidateID")

            Dim lbl As New System.Web.UI.WebControls.Label()
            lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                       & "openWindow('../RecuitmentCVView.aspx?CandidateID=" & lblCandidateID.Text & "','Popup',1000,900);</script>"
            Page.Controls.Add(lbl)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
      
    End Sub

    Protected Sub grdPanelMembers_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdPanelMembers.SelectedIndexChanged
        Dim lblEmployeeIDIntAttendee, lblEmployeeNameIntAttendee As Label

        txtAttendeeUserID.Text = ""
        txtAttendeePassword.Text = ""

        lblEmployeeIDIntAttendee = grdPanelMembers.SelectedRow.FindControl("lblEmployeeIDIntAttendee")
        lblEmployeeNameIntAttendee = grdPanelMembers.SelectedRow.FindControl("lblEmployeeNameIntAttendee")

        Dim flag As Boolean = 0
        Dim lbl As Label
        For Each rw As GridViewRow In grdActualAttendees.Rows
            lbl = rw.FindControl("lblActualIntAttEmployeeID")
            If lbl.Text = lblEmployeeIDIntAttendee.Text Then
                flag = 1
                Exit For
            End If
        Next

        If flag = True Then
            MessageBox("Attendee is Already in the List.")
            pnlCredentials.Visible = False
        Else
            lblEmployeeID.Text = lblEmployeeIDIntAttendee.Text
            lblInterviewAttendee.Text = lblEmployeeNameIntAttendee.Text
            pnlCredentials.Visible = True
        End If

    End Sub

    Protected Sub btnAddAttendees_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddAttendees.Click
        If Trim(txtAttendeeUserID.Text) = "" Or Trim(txtAttendeePassword.Text) = "" Then
            MessageBox("UserID/Password Can't be Empty.")
            Exit Sub
        End If

        Dim dtIntAttendee As DataTable
        dtIntAttendee = Session("IntAttendee")

        Dim Authenticated As Integer = IntPanelData.fnAuthenticateIntAttendee(lblEmployeeID.Text, txtAttendeeUserID.Text, txtAttendeePassword.Text)

        If Authenticated = 1 Then
            Dim dr As DataRow
            dr = dtIntAttendee.NewRow()
            dr("EmployeeID") = lblEmployeeID.Text
            dr("EmployeeName") = lblInterviewAttendee.Text
            dtIntAttendee.Rows.Add(dr)
            dtIntAttendee.AcceptChanges()

            Session("IntAttendee") = dtIntAttendee
            grdActualAttendees.DataSource = dtIntAttendee
            grdActualAttendees.DataBind()
            lblInterviewAttendee.Text = ""
            lblEmployeeID.Text = ""
            grdPanelMembers.SelectedIndex = -1
            pnlCredentials.Visible = False
        Else
            MessageBox("Please Provide Correct UserID/Password")

        End If

        txtAttendeeUserID.Text = ""
        txtAttendeePassword.Text = ""

    End Sub

    Protected Function FormatActualAttendee() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("EmployeeID", System.Type.GetType("System.String"))
        dt.Columns.Add("EmployeeName", System.Type.GetType("System.String"))
        Return dt
    End Function

End Class
