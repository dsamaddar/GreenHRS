Imports System.Net.Mail
Imports System.Net
Imports System.IO

Partial Class EmployeeProfile_EmpJD
    Inherits System.Web.UI.Page

    Dim CurrentJD As New clsJobDescriptionDataAccess()
    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()
    Dim EducationInformation As New clsEmployeeAllInfoDataAccess()
    Dim EmpJDAssignData As New clsEmpJDAssignDataAccess()
    Dim EmpJDData As New clsEmployeeJDDataAccess()
    Dim EmployeeData As New clsEmpBasicProfileDataAccess()
    Dim ResignationMailData As New clsResignationMailDataAccess()


    Protected Sub btnAssign_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAssign.Click
        Dim EmpJDAssign As New clsEmpJDAssign()
        Dim ToWhomProShow As String = Request.QueryString("")
        Try

            If drpJD.SelectedIndex = 0 Then
                MessageBox("Select Proper JD First.")
                Exit Sub
            End If

            '' Chq. If JD is Already Assigned.
            Dim Assigned As Boolean = False
            Dim EmpJD As New clsEmployeeJD()
            EmpJD.EmployeeID = ToWhomProShow
            EmpJD.JobDescriptionID = drpJD.SelectedValue
            Assigned = EmpJDData.fnChqEmpJDAlreadyAssigned(EmpJD)
            If Assigned = True Then
                MessageBox("JD Already Assigned.")
                Exit Sub
            End If
            ''

            EmpJDAssign.JobDescriptionID = drpJD.SelectedValue
            EmpJDAssign.IssueDate = txtIssueDate.Text
            EmpJDAssign.EffectiveDate = txtEffectiveDate.Text
            EmpJDAssign.EmployeeID = lblHolder.Text
            EmpJDAssign.AssignedBy = Session("LoginUserID")

            Dim Check As Integer = EmpJDAssignData.fnInsertEmpJDAssign(EmpJDAssign)

            If Check = 1 Then
                MessageBox("Assigned Successfully.")
                SendJDAssignmentMail()
                ShowJDS(lblHolder.Text)
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
       

    End Sub

    Protected Sub SendJDAssignmentMail()
        Dim sb As StringBuilder = New StringBuilder()
        Dim mail As New Net.Mail.MailMessage()

        Dim ResignationMail As clsResignationMail = ResignationMailData.fnGetMailAddressByEmpID(Session("ToWhomProShow"))

        mail.To.Add(ResignationMail.EmpMailAdr)
        mail.CC.Add(ResignationMail.SupervisorMailAdr)
        mail.Bcc.Add("Debayan@ulc.com")

        Dim JDAssignee As clsResignationMail = ResignationMailData.fnGetMailAddressByEmpID(Session("UniqueUserID"))
        mail.From = New MailAddress(JDAssignee.EmpMailAdr)
        mail.Subject = "GreenHRS: JD Assigned"
        sb.Append("</br></br><html><head></head>")
        sb.Append("You have been assigned a JD from your supervisor. Please review the assigned JD through your personal account in GreenHRS and accept accordingly. For any confusion regarding the JD, you can communicate with your supervisor.")
        sb.Append("<table style='border-width:2px;border-style:solid' >")
        sb.Append("<tr>")
        sb.Append("<th>Employee</th>")
        sb.Append("<th>Assigned JD</th>")
        sb.Append("<th>Issue Date</th>")
        sb.Append("<th>Effective Date</th>")

        sb.Append("</tr>")
        sb.Append("<tr><td></td><td></td><td></td><td></td></tr>")
        sb.Append("<tr><td>" + ResignationMail.EmployeeName + "</td>")
        sb.Append("<td>" + drpJD.SelectedItem.ToString() + "</td>")
        sb.Append("<td>" + Convert.ToDateTime(txtIssueDate.Text).Date + "</td>")
        sb.Append("<td>" + Convert.ToDateTime(txtEffectiveDate.Text).Date + "</td></tr>")
        sb.Append("<tr><td></td><td></td><td></td><td></td></tr>")
        sb.Append("</table>")
        sb.Append("</html>")
        mail.Body = sb.ToString()
        mail.IsBodyHtml = True
        Dim smtp As New SmtpClient("192.168.1.242", 25)
        smtp.Send(mail)
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim LoginUserId As String = Session("UniqueUserID")
            Dim ToWhomProShow As String = Session("ToWhomProShow")
            lblHolder.Text = ToWhomProShow

            getBasicProfileInfo(lblHolder.Text)


            If LoginUserId = ToWhomProShow Then
                Dim Check As Boolean = EducationInformation.CheckPermissionForOwnInfo(LoginUserId)
                If Check = True Then
                    pnlUploadLetters.Visible = True
                Else
                    pnlUploadLetters.Visible = False
                End If
            Else
                Dim Check As Boolean = EducationInformation.CheckPermissionForOthers(LoginUserId)
                If Check = True Then
                    pnlUploadLetters.Visible = True
                Else
                    pnlUploadLetters.Visible = False
                End If
            End If

            ShowJDNo()

            ShowJDS(ToWhomProShow)

        End If
    End Sub

    Protected Sub ShowJDS(ByVal ToWhomProShow As String)
        grdActiveJDList.DataSource = EmpJDData.fnGetEmpJDByIDByStatus(ToWhomProShow, True)
        grdActiveJDList.DataBind()

        grdInActiveJDList.DataSource = EmpJDData.fnGetEmpJDByIDByStatus(ToWhomProShow, False)
        grdInActiveJDList.DataBind()
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        drpJD.SelectedIndex = -1
        txtEffectiveDate.Text = ""
        txtIssueDate.Text = ""
    End Sub

    Protected Sub ShowJDNo()
        drpJD.DataTextField = "JDName"
        drpJD.DataValueField = "JobDescriptionID"
        drpJD.DataSource = EmployeeInfoData.fnGetJDList()
        drpJD.DataBind()
        drpJD.Items.Insert(0, "-Select-")
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

End Class
