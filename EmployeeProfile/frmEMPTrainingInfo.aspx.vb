Imports System.Net
Imports System.IO

Partial Class EmployeeProfile_frmEMPTrainingInfo
    Inherits System.Web.UI.Page

    Dim TrngSubData As New clsTrngSubjectDataAccess()
    Dim TrngTypeData As New clsTrainingTypeDataAccess()
    Dim EmpTrngData As New clsEmpTrngDataAccess()
    Dim EducationInformation As New clsEmployeeAllInfoDataAccess()
    Dim EmployeeData As New clsEmpBasicProfileDataAccess()
    Dim OrgBranchData As New clsOrgBranchData()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowTrngSubList()
            ShowTrngTypeList()
            getTrainingTopic(drpAvailableTrngSubject.SelectedValue)
            ClearForm()

            Dim LoginUserId As String = Session("UniqueUserID")
            Dim ToWhomProShow As String = Session("ToWhomProShow")
            lblHolder.Text = ToWhomProShow
            ShowEmpTrngInfo(ToWhomProShow)
            getBasicProfileInfo(ToWhomProShow)

            If LoginUserId = ToWhomProShow Then
                Dim Check As Boolean = EducationInformation.CheckPermissionForOwnInfo(LoginUserId)
                If Check = True Then
                    pnlAssignTraining.Visible = True
                Else
                    pnlAssignTraining.Visible = False
                End If
            Else
                Dim Check As Boolean = EducationInformation.CheckPermissionForOthers(LoginUserId)
                If Check = True Then
                    pnlAssignTraining.Visible = True
                Else
                    pnlAssignTraining.Visible = False
                End If
            End If

            btnSubmitFeedBack.Enabled = False
            btnCancelTrng.Enabled = False
            pnlTrngFeedBack.Visible = False
            rdbtnTrngStatusChanged()
            ShowOrganizationList(drpCountry.SelectedValue)
        End If
    End Sub

    Protected Sub ShowEmpTrngInfo(ByVal EmployeeID As String)
        grdAssignedTraining.DataSource = EmpTrngData.fnShowEmpTrngInfo(EmployeeID)
        grdAssignedTraining.DataBind()
    End Sub

    Protected Sub ShowTrngTypeList()
        drpAvailableTrainingType.DataTextField = "TrngType"
        drpAvailableTrainingType.DataValueField = "TrngTypeID"
        drpAvailableTrainingType.DataSource = TrngTypeData.fnShowTrngType()
        drpAvailableTrainingType.DataBind()
    End Sub

    Protected Sub ShowTrngSubList()
        drpAvailableTrngSubject.DataTextField = "TrngSubName"
        drpAvailableTrngSubject.DataValueField = "TrngSubjectID"
        drpAvailableTrngSubject.DataSource = TrngSubData.fnShowTrngSubjects()
        drpAvailableTrngSubject.DataBind()
    End Sub

    Protected Sub ShowOrganizationList(ByVal CountryName As String)
        ddlOrganizedBy.DataTextField = "OrgName"
        ddlOrganizedBy.DataValueField = "OrganizationID"
        ddlOrganizedBy.DataSource = TrngTypeData.fnShowOrganizationList(CountryName)
        ddlOrganizedBy.DataBind()

        If ddlOrganizedBy.Items.Count > 0 Then
            ddlOrganizedBy.SelectedIndex = 0
            ShowOrgWiseBranchList(ddlOrganizedBy.SelectedValue)
        End If

    End Sub

    Protected Sub ClearForm()

        rdbtnTrngStatus.SelectedValue = "0"

        txtEvaluationOfTheProgram.Enabled = True
        txtEvaluationOfTheTrainer.Enabled = True
        txtTrngFBackEndDate.Enabled = True
        txtTrngFBackStartDate.Enabled = True
        txtYourExperience.Enabled = True

        txtTrngCancellationCause.Enabled = False

        btnSubmitFeedBack.Enabled = True
        btnCancelFeedBack.Enabled = False

        txtTrngCourseOutline.Text = ""
        txtTrngStartsOn.Text = ""
        txtTrngEndsOn.Text = ""
        txtResourcePersonDetails.Text = ""
        txtTrainingDetails.Text = ""
        txtTrngFBackEndDate.Text = ""
        txtTrngFBackStartDate.Text = ""

        ddlOrganizedBy.SelectedIndex = 0
        drpAvailableTrainingType.SelectedIndex = -1
        drpAvailableTrngSubject.SelectedIndex = -1
        drpCountry.SelectedIndex = -1

        txtEvaluationOfTheProgram.Text = ""
        txtEvaluationOfTheTrainer.Text = ""
        txtYourExperience.Text = ""
        txtTrngCancellationCause.Text = ""

        grdAssignedTraining.DataSource = ""
        grdAssignedTraining.DataBind()

    End Sub

    Protected Sub rdbtnTrngStatus_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdbtnTrngStatus.SelectedIndexChanged
        rdbtnTrngStatusChanged()
    End Sub

    Protected Sub rdbtnTrngStatusChanged()
        If rdbtnTrngStatus.SelectedValue = "1" Then
            txtEvaluationOfTheProgram.Enabled = False
            txtEvaluationOfTheTrainer.Enabled = False
            txtTrngFBackEndDate.Enabled = False
            txtTrngFBackStartDate.Enabled = False
            txtYourExperience.Enabled = False

            txtTrngCancellationCause.Enabled = True

            btnCancelTrng.Enabled = True
            btnSubmitFeedBack.Enabled = False
        Else
            txtEvaluationOfTheProgram.Enabled = True
            txtEvaluationOfTheTrainer.Enabled = True
            txtTrngFBackEndDate.Enabled = True
            txtTrngFBackStartDate.Enabled = True
            txtYourExperience.Enabled = True

            txtTrngCancellationCause.Enabled = False

            btnSubmitFeedBack.Enabled = True
            btnCancelTrng.Enabled = False

        End If
    End Sub

    Protected Sub btnAssignTrng_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAssignTrng.Click

        Dim ToWhomProShow As String = Session("ToWhomProShow")

        Dim folder As String = ""
        Dim DocExt As String = ""
        Dim DocFullName As String = ""
        Dim FileSize As Integer = 0
        Dim DocFileNameConf As String = ""
        Dim DocFullNameEva As String = ""
        Dim DocFileNameEva As String = ""

        Dim EmpTrngInfo As New clsEmpTrngInfo()

        Try

            If Convert.ToDateTime(txtTrngStartsOn.Text) > Convert.ToDateTime(txtTrngEndsOn.Text) Then
                MessageBox("End Session Can't Be Greater")
                Exit Sub
            End If
            EmpTrngInfo.EmployeeID = ToWhomProShow
            EmpTrngInfo.TrngTypeID = drpAvailableTrainingType.SelectedValue
            EmpTrngInfo.TrainingName = txtTrainingDetails.Text
            EmpTrngInfo.TrngSubjectID = drpAvailableTrngSubject.SelectedValue
            EmpTrngInfo.TrngTopicID = ddlTrainingTopic.SelectedValue
            EmpTrngInfo.OrganizedBy = ddlOrganizedBy.SelectedValue
            EmpTrngInfo.BranchID = drpOrgBranchList.SelectedValue
            EmpTrngInfo.Location = ""
            EmpTrngInfo.Country = drpCountry.SelectedValue
            EmpTrngInfo.StartsOn = txtTrngStartsOn.Text & " " & drpSHour.SelectedValue & ":" & drpSMin.SelectedValue & ":00" & " " & drpSAMPM.SelectedValue
            EmpTrngInfo.EndsOn = txtTrngEndsOn.Text & " " & drpEHour.SelectedValue & ":" & drpEMin.SelectedValue & ":00" & " " & drpEAMPM.SelectedValue
            EmpTrngInfo.CourseOutline = txtTrngCourseOutline.Text
            EmpTrngInfo.ResourcePerson = txtResourcePersonDetails.Text
            EmpTrngInfo.EntryBy = Session("LoginUserID")


            If drpCountry.SelectedValue = "-Select-" Then
                MessageBox("Please Select Country name")
                Exit Sub
            End If

            If ddlOrganizedBy.SelectedValue = "" Then
                MessageBox("Please Select Organized By")
                Exit Sub
            End If

            If flupTrngAttachment.HasFile Then
                folder = Server.MapPath("~/Attachments/")

                FileSize = flupTrngAttachment.PostedFile.ContentLength()
                If FileSize > 512000 Then
                    MessageBox("File size should be within 500KB")
                    Exit Sub
                End If

                DocExt = System.IO.Path.GetExtension(flupTrngAttachment.FileName)
                DocFileNameConf = "EMP_Trng_Doc_" & DateTime.Now.ToString("ddMMyyHHmmss") & DocExt
                DocFullName = folder & DocFileNameConf
                flupTrngAttachment.SaveAs(DocFullName)

                EmpTrngInfo.Attachment = DocFileNameConf
            Else
                EmpTrngInfo.Attachment = ""
            End If


            Dim check As Integer = EmpTrngData.fnInsertEmpTrngInfo(EmpTrngInfo)

            If check = 1 Then
                MessageBox("Training Assigned Successfully.")
                ClearForm()
                ShowEmpTrngInfo(ToWhomProShow)
            Else
                MessageBox("Error Found.")

            End If

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

    Protected Sub btnCancelTrng_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelTrng.Click
        Dim lblEmpTrngInfoID As Label
        Dim EmpTrngInfo As New clsEmpTrngInfo()
        Dim ToWhomProShow As String = Session("ToWhomProShow")

        lblEmpTrngInfoID = grdAssignedTraining.SelectedRow.FindControl("lblEmpTrngInfoID")

        hdFldEmpTrngID.Value = lblEmpTrngInfoID.Text

        EmpTrngInfo.EmpTrngInfoID = hdFldEmpTrngID.Value
        EmpTrngInfo.CancellationCause = txtTrngCancellationCause.Text
        EmpTrngInfo.CancellationDate = Date.Today()
        EmpTrngInfo.CancelledBy = Session("LoginUserID")

        Dim check As Integer = EmpTrngData.fnCancelTraining(EmpTrngInfo)

        If check = 1 Then
            MessageBox("Training Canceled.")
            ClearForm()
            ShowEmpTrngInfo(ToWhomProShow)
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub grdAssignedTraining_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdAssignedTraining.SelectedIndexChanged
        Dim lblEmpTrngInfoID, lblStartsOn, lblEndsOn, lblIsTrngDone, lblIsCanceled As Label
        Dim EmpTrngInfo As New clsEmpTrngInfo()
        Dim ToWhomProShow As String = Session("ToWhomProShow")

        lblEmpTrngInfoID = grdAssignedTraining.SelectedRow.FindControl("lblEmpTrngInfoID")
        lblStartsOn = grdAssignedTraining.SelectedRow.FindControl("lblStartsOn")
        lblEndsOn = grdAssignedTraining.SelectedRow.FindControl("lblEndsOn")
        lblIsTrngDone = grdAssignedTraining.SelectedRow.FindControl("lblIsTrngDone")
        lblIsCanceled = grdAssignedTraining.SelectedRow.FindControl("lblIsCanceled")

        txtTrngFBackStartDate.Text = Convert.ToDateTime(lblStartsOn.Text).ToShortDateString()
        txtTrngFBackEndDate.Text = Convert.ToDateTime(lblEndsOn.Text).ToShortDateString()


        If lblIsTrngDone.Text = "Accepted" Or lblIsCanceled.Text = "YES" Then
            MessageBox("Already Status Changed")
            pnlTrngFeedBack.Visible = False
            Exit Sub
        Else
            pnlTrngFeedBack.Visible = True
        End If

        If Session("UniqueUserID") = Session("ToWhomProShow") Then
            pnlTrngFeedBack.Visible = True
        Else
            MessageBox("You Can Not Access")
            pnlTrngFeedBack.Visible = False
        End If

    End Sub

    Protected Sub btnSubmitFeedBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmitFeedBack.Click
        Dim lblEmpTrngInfoID As Label
        Dim EmpTrngInfo As New clsEmpTrngInfo()

        Try
            Dim ToWhomProShow As String = Session("ToWhomProShow")
            lblEmpTrngInfoID = grdAssignedTraining.SelectedRow.FindControl("lblEmpTrngInfoID")
            hdFldEmpTrngID.Value = lblEmpTrngInfoID.Text

            EmpTrngInfo.EmpTrngInfoID = hdFldEmpTrngID.Value
            EmpTrngInfo.StartsOn = txtTrngFBackStartDate.Text & " " & drpFBSHour.SelectedValue & ":" & drpFBSMin.SelectedValue & ":00" & " " & drpFBSAMPM.SelectedValue
            EmpTrngInfo.EndsOn = txtTrngFBackEndDate.Text & " " & drpFBEHour.SelectedValue & ":" & drpFBEMin.SelectedValue & ":00" & " " & drpFBEAMPM.SelectedValue
            EmpTrngInfo.EvalProgram = txtEvaluationOfTheProgram.Text
            EmpTrngInfo.EvalTrainer = txtEvaluationOfTheTrainer.Text
            EmpTrngInfo.YourExperience = txtYourExperience.Text

            Dim check As Integer = EmpTrngData.fnAcceptEmpTraining(EmpTrngInfo)

            If check = 1 Then
                MessageBox("Training Accepted.")
                ClearForm()
                ShowEmpTrngInfo(ToWhomProShow)
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
        
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

    Protected Sub drpCountry_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpCountry.SelectedIndexChanged
        ShowOrganizationList(drpCountry.SelectedValue)
    End Sub

    Protected Sub drpAvailableTrngSubject_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpAvailableTrngSubject.SelectedIndexChanged
        getTrainingTopic(drpAvailableTrngSubject.SelectedValue)
    End Sub

    Protected Sub getTrainingTopic(ByVal TrngSubjectID As String)
        ddlTrainingTopic.DataTextField = "TrngTopic"
        ddlTrainingTopic.DataValueField = "TrainingTopicID"
        ddlTrainingTopic.DataSource = TrngTypeData.fnShowTrngTopicBySubjectID(TrngSubjectID)
        ddlTrainingTopic.DataBind()
    End Sub

    Protected Sub ddlOrganizedBy_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlOrganizedBy.SelectedIndexChanged
        ShowOrgWiseBranchList(ddlOrganizedBy.SelectedValue)
    End Sub

    Protected Sub ShowOrgWiseBranchList(ByVal OrganizationID As String)
        drpOrgBranchList.DataTextField = "BranchName"
        drpOrgBranchList.DataValueField = "BranchID"
        drpOrgBranchList.DataSource = OrgBranchData.fnGetOrgWiseBranchInfo(OrganizationID)
        drpOrgBranchList.DataBind()

        Dim A As New ListItem
        A.Text = "N\A"
        A.Value = "N\A"

        drpOrgBranchList.Items.Insert(0, A)
    End Sub

End Class
