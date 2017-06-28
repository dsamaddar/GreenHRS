Imports System.Net.Mail
Imports System.Net
Imports System.IO

Partial Class EmployeeProfile_frmEmpResignationForm
    Inherits System.Web.UI.Page

    Dim ResignationData As New clsResignationDataAccess()
    Dim ResignationMailData As New clsResignationMailDataAccess()
    Dim EmployeeData As New clsEmpBasicProfileDataAccess()

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        Dim Resignation As New clsResignation()
        Try
            Resignation.EmployeeID = Session("UniqueUserID")
            Resignation.EffectiveDate = Convert.ToDateTime(txtEffectiveDate.Text)
            Resignation.ReasonOfResignation = txtReasonForResignation.Text
            Resignation.FeedbackAboutCompany = txtFeedbackAboutCompany.Text
            Resignation.EntryBy = Session("LoginUserID")

            Dim Check As Integer = ResignationData.fnInsertResignationInfo(Resignation)

            If Check = 1 Then
                MessageBox("Submitted Successfully.")
                ClearForm()
                ShowResignationInfo()
                SendResignationReqMail(Resignation)
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub SendResignationReqMail(ByVal Resignation As clsResignation)
        Dim sb As StringBuilder = New StringBuilder()
        Dim mail As New Net.Mail.MailMessage()

        Dim ResignationMail As clsResignationMail = ResignationMailData.fnGetMailAddressByEmpID(Resignation.EmployeeID)

        mail.To.Add(ResignationMail.SupervisorMailAdr)
        mail.Bcc.Add("Debayan@ulc.com")
        mail.From = New MailAddress(ResignationMail.EmpMailAdr)
        mail.Subject = "GreenHRS: Resignation Request"
        sb.Append("</br></br><html><head></head><table style='border-width:2px;border-style:solid' >")
        sb.Append("<tr>")
        sb.Append("<th>Employee</th>")
        sb.Append("<th>Effective Date</th>")
        sb.Append("<th>Reason Of Resignatoin</th>")
        sb.Append("<th>Feedback About Company</th>")
        sb.Append("</tr>")
        sb.Append("<tr><td></td><td></td><td></td><td></td></tr>")
        sb.Append("<tr><td>" + Session("UserName") + "</td>")
        sb.Append("<td>" + Convert.ToDateTime(Resignation.EffectiveDate).Date + "</td>")
        sb.Append("<td>" + Resignation.ReasonOfResignation + "</td>")
        sb.Append("<td>" + Resignation.FeedbackAboutCompany + "</td></tr>")
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

    Protected Sub ClearForm()
        txtEffectiveDate.Text = ""
        txtFeedbackAboutCompany.Text = ""
        txtReasonForResignation.Text = ""
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearForm()
    End Sub

    Protected Sub ShowResignationInfo()
        grdSubmittedResignation.DataSource = ResignationData.fnShowResignationInfo(Session("UniqueUserID"))
        grdSubmittedResignation.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowResignationInfo()
            Dim ToWhomProShow As String = Session("ToWhomProShow")
            getBasicProfileInfo(ToWhomProShow)
        End If
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
