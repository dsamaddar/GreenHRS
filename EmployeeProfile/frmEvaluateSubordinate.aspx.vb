Imports System.Net
Imports System.IO

Partial Class EmployeeProfile_frmEvaluateSubordinate
    Inherits System.Web.UI.Page

    Dim PerfFactorData As New clsPerformanceFactorDataAccess()
    Dim EvalGradingData As New clsEvaluationGradingDataAccess()
    Dim EvalSummaryData As New clsEvaluationSummaryDataAccess()
    Dim EmpValData As New clsEmpEvalInfoDataAccess()
    Dim EmpInfoData As New clsEmployeeInfoDataAccess()
    Dim EmployeeData As New clsEmpBasicProfileDataAccess()
    Dim PerformanceRating As New clsPerformanceRating()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowSubOrdinateList(Session("UniqueUserID"))
            GetPendingSecEvaluation(Session("UniqueUserID"))

            Dim ToWhomProShow As String = Session("ToWhomProShow")
            getBasicProfileInfo(ToWhomProShow)
            GetPerformanceRating()
            txtEvaluationFrom.Text = "1/1/" + Now.Year.ToString()
            txtEvaluationTo.Text = "12/31/" + Now.Year.ToString()
            drpEvaluationYear.SelectedValue = Now.Year.ToString()
        Else
            GetPendingSecEvaluation(Session("UniqueUserID"))
        End If

    End Sub

    Protected Sub GetPendingSecEvaluation(ByVal EmployeeID As String)
        grdSecEvalPendingList.DataSource = EvalSummaryData.fnGetSecEvalPendingList(EmployeeID)
        grdSecEvalPendingList.DataBind()
    End Sub

    Protected Sub GetEvaluationForm(ByVal EmployeeID As String)
        grdEvaluationForm.DataSource = PerfFactorData.fnGetEvaluationForm(EmployeeID).Tables(0)
        grdEvaluationForm.DataBind()

        PopulatePrimaryEvalGrading()
    End Sub

    Protected Sub GetPerformanceRating()
        drpOverallPerformance.DataTextField = "PerformanceRating"
        drpOverallPerformance.DataValueField = "PerformanceRatingID"
        drpOverallPerformance.DataSource = PerformanceRating.fnGetPerformanceRating()
        drpOverallPerformance.DataBind()
    End Sub

    Protected Sub PopulatePrimaryEvalGrading()
        Dim rdbtnEvaluationGrade As New RadioButtonList()
        Dim EvalGrading As New clsEvaluationGrading()

        For Each rw As GridViewRow In grdEvaluationForm.Rows
            EvalGrading.GradeType = "Primary"
            rdbtnEvaluationGrade = rw.FindControl("rdbtnEvaluationGrade")
            rdbtnEvaluationGrade.DataTextField = "GradeText"
            rdbtnEvaluationGrade.DataValueField = "EvaluationGradingID"
            rdbtnEvaluationGrade.DataSource = EvalGradingData.fnGetEvalGradeByType(EvalGrading)
            rdbtnEvaluationGrade.DataBind()
        Next

    End Sub

    Protected Sub getBasicProfileInfo(ByVal EmployeeId As String)
        Dim EmpBasicProfile As New EmpBasicInfo()
        EmpBasicProfile = EmployeeData.fnGetBasicProfile(EmployeeId)

        Dim pnlEmpSummary As Panel
        Master.FindControl("pnlEmpSummary")
        pnlEmpSummary = Master.FindControl("pnlEmpSummary")

        Dim lblEmployeeName, lblEmployeeID, lblOfficialDesignation, lblFunctionalDesignation, lblDepartment, lblSupervisorName, lblEmployeeType, lblServiceLength, lblLocation As Label
        Dim imgEmployee As Image
        Dim hpLnkCanProfile As New HyperLink

        lblEmployeeName = pnlEmpSummary.FindControl("lblEmployeeName")
        lblEmployeeID = pnlEmpSummary.FindControl("lblEmployeeID")
        lblOfficialDesignation = pnlEmpSummary.FindControl("lblOfficialDesignation")
        lblFunctionalDesignation = pnlEmpSummary.FindControl("lblFunctionalDesignation")
        lblDepartment = pnlEmpSummary.FindControl("lblDepartment")
        lblSupervisorName = pnlEmpSummary.FindControl("lblSupervisorName")
        lblEmployeeType = pnlEmpSummary.FindControl("lblEmployeeType")
        lblServiceLength = pnlEmpSummary.FindControl("lblServiceLength")
        lblLocation = pnlEmpSummary.FindControl("lblLocation")
        imgEmployee = pnlEmpSummary.FindControl("imgEmployee")
        hpLnkCanProfile = pnlEmpSummary.FindControl("hpLnkCanProfile")

        lblEmployeeName.Text = EmpBasicProfile.Name
        lblEmployeeID.Text = EmpBasicProfile.EmpCode
        lblOfficialDesignation.Text = EmpBasicProfile.OfficialDesignation
        lblFunctionalDesignation.Text = EmpBasicProfile.FunctionalDesignation
        lblDepartment.Text = EmpBasicProfile.DepartmentName
        lblSupervisorName.Text = EmpBasicProfile.CurrentSupervisor
        lblEmployeeType.Text = EmpBasicProfile.EmployeeTypeName
        lblServiceLength.Text = EmpBasicProfile.ServiceLength
        lblLocation.Text = EmpBasicProfile.ULCBranchName
        hpLnkCanProfile.NavigateUrl = "../RecuitmentCVView.aspx?CandidateID=" + EmpBasicProfile.CandidateID

        If EmpBasicProfile.Attachment = "" Then
            imgEmployee.ImageUrl = ""
        Else
            ShowImage(ConfigurationManager.AppSettings("AttachmentsShow") & EmpBasicProfile.Attachment, "imgEmployee")
        End If

    End Sub

    Protected Sub ShowImage(ByVal UrlStr As String, ByVal ControlName As String)
        Dim tClient As WebClient = New WebClient
        Dim memStrmPic As MemoryStream = New MemoryStream(tClient.DownloadData(UrlStr))
        Dim bytesPic As Byte() = memStrmPic.ToArray()
        Dim base64StringPic As String = Convert.ToBase64String(bytesPic, 0, bytesPic.Length)

        Dim imgCtrl As System.Web.UI.WebControls.Image = Master.FindControl(ControlName)
        imgCtrl.ImageUrl = "data:image/png;base64," & base64StringPic
        memStrmPic.Dispose()
    End Sub

    Protected Sub ShowSubOrdinateList(ByVal EmployeeID As String)
        drpSubOrdinateList.DataTextField = "EmployeeName"
        drpSubOrdinateList.DataValueField = "EmployeeID"
        drpSubOrdinateList.DataSource = EmpInfoData.fnGetSubOrdinateList(EmployeeID)
        drpSubOrdinateList.DataBind()

        Dim A As New ListItem
        A.Text = "N\A"
        A.Value = "N\A"
        drpSubOrdinateList.Items.Insert(0, A)

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        Dim EvalSummary As New clsEvaluationSummary()
        Dim EmpEvaluationSummaryID As String = ""
        Dim rdbtnEvaluationGrade As New RadioButtonList()
        Dim lblPerformanceFactorID As New Label()
        Dim Check As Integer = 0
        Dim EmpEvalInfo As New clsEmpEvalInfo()
        Dim Existing As Boolean = False

        If drpSubOrdinateList.SelectedValue = "N\A" Then
            MessageBox("Select An Employee First.")
            Exit Sub
        End If

        ' Chq for Existing Evaluation
        Existing = EvalSummaryData.fnChqForExistingEvaluation(Session("ToWhomProShow"), Convert.ToDateTime(txtEvaluationFrom.Text), Convert.ToDateTime(txtEvaluationTo.Text))

        If Existing = 1 Then
            MessageBox("Evaluation Already Exists For Employee With in This Period")
            Exit Sub
        End If

        EvalSummary.EmployeeID = drpSubOrdinateList.SelectedValue
        EvalSummary.EvaluationFrom = Convert.ToDateTime(txtEvaluationFrom.Text) ' "1/1/" + drpEvaluationYear.SelectedValue.ToCharArray()
        EvalSummary.EvaluationTo = Convert.ToDateTime(txtEvaluationTo.Text) ' "12/31/" + drpEvaluationYear.SelectedValue.ToString()
        EvalSummary.EvaluationYear = Convert.ToInt32(drpEvaluationYear.SelectedValue)
        EvalSummary.Remarks = txtRemarks.Text
        EvalSummary.PerformanceRatingID = drpOverallPerformance.SelectedValue

        If drpRecForBonus.SelectedValue = "YES" Then
            EvalSummary.RecForBonus = True
        Else
            EvalSummary.RecForBonus = False
        End If

        If drpRecForProgression.SelectedValue = "YES" Then
            EvalSummary.RecForProgression = True
        Else
            EvalSummary.RecForProgression = False
        End If

        EvalSummary.PrimaryEvaluator = Session("UniqueUserID")

        EmpEvaluationSummaryID = EvalSummaryData.fnInsertEmpEvaluationSummary(EvalSummary)

        If EmpEvaluationSummaryID = "" Then
            MessageBox("Error Found While Creating Summary Evaluation")
            Exit Sub
        Else
            For Each rw As GridViewRow In grdEvaluationForm.Rows
                rdbtnEvaluationGrade = rw.FindControl("rdbtnEvaluationGrade")
                lblPerformanceFactorID = rw.FindControl("lblPerformanceFactorID")

                EmpEvalInfo.EmpEvaluationSummaryID = EmpEvaluationSummaryID
                EmpEvalInfo.PerformanceFactorID = lblPerformanceFactorID.Text
                EmpEvalInfo.PrimaryEvalGrading = rdbtnEvaluationGrade.SelectedValue

                Check = EmpValData.fnInsertPrimaryEmpEvaluationInfo(EmpEvalInfo)

                If Check = 0 Then
                    MessageBox("Error Found.")
                End If

            Next
            MessageBox("Evaluation Done.")
            ClearForm()
        End If


    End Sub

    Protected Sub ClearForm()
        Response.Redirect("frmEvaluateSubordinate.aspx")
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub drpSubOrdinateList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSubOrdinateList.SelectedIndexChanged
        GetEvaluationForm(drpSubOrdinateList.SelectedValue)
    End Sub

End Class
