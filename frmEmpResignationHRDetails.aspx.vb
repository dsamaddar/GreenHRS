Imports System.Net.Mail

Partial Class frmEmpResignationHRDetails
    Inherits System.Web.UI.Page

    Dim ResignationData As New clsResignationDataAccess()
    Dim ResignationMailData As New clsResignationMailDataAccess()
    Public MasterEmpID As String = ""
    Public Shared OnceReviewed As Boolean = False

    Protected Sub btnAccept_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAccept.Click

        Dim Resignation As New clsResignation()

        Resignation.EmployeeID = MasterEmpID
        Resignation.ResignationID = Request.QueryString("ResignationID")

        Resignation.Status = "Accepted"

        Dim Check As Integer = ResignationData.fnHRAcceptResignation(Resignation)

        If Check = 1 Then
            OnceReviewed = True
            MessageBox("Resignation Accepted")
            SendResigMailToICT(Resignation)
            ClearForm()
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub SendResigMailToICT(ByVal Resignation As clsResignation)
        Dim sb As StringBuilder = New StringBuilder()
        Dim mail As New Net.Mail.MailMessage()

        Try
            Dim ResignationMail As clsResignationMail = ResignationMailData.fnGetMailAddressByEmpID(Resignation.EmployeeID)
            mail.CC.Add(ResignationMail.EmpMailAdr)
            mail.To.Add("sysadmin@ulc.com")
            mail.Bcc.Add("Debayan@ulc.com")
            mail.From = New MailAddress("HR@ulc.com")
            mail.Subject = "GreenHRS: Resignation Accepted By HR "
            sb.Append("</br></br><html><head></head><table style='border-width:2px;border-style:solid' >")
            sb.Append("<tr><td colspan='4'>" + ResignationMail.EmployeeName + " has resigned and the resignation has been accepted. Accordingly the person has been updated as INACTIVE in system.Please take necessary step from your end for the followings:</td></tr>")
            sb.Append("<tr><td></td><td colspan='3'></td><tr>")
            sb.Append("<tr><td>1)</td><td colspan='3'>Delete E-Mail ID</td><tr>")
            sb.Append("<tr><td>2)</td><td colspan='3'>Revoke all software access</td><tr>")
            sb.Append("<tr><td>3)</td><td colspan='3'>Collect Laptop (if any)</td><tr>")
            sb.Append("<tr><td>4)</td><td colspan='3'>Collect any other technology device (if any)</td><tr>")
            sb.Append("</table>")
            sb.Append("</html>")
            mail.Body = sb.ToString()
            mail.IsBodyHtml = True
            Dim smtp As New SmtpClient("192.168.1.232", 25)
            smtp.Send(mail)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub ClearForm()
        txtSupervisorComment.Text = ""
        btnAccept.Enabled = False
        btnReject.Enabled = False
    End Sub

  

    Protected Sub btnReject_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReject.Click
        Dim Resignation As New clsResignation()

        Resignation.ResignationID = Request.QueryString("ResignationID")
        Resignation.Status = "Rejected"

        Dim Check As Integer = ResignationData.fnHRAcceptResignation(Resignation)

        If Check = 1 Then
            OnceReviewed = True
            MessageBox("Resignation Rejected")
            ClearForm()
        Else
            MessageBox("Error Found.")
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Try
                Dim Resignation As New clsResignation()
                Resignation.ResignationID = Request.QueryString("ResignationID")

                Resignation = ResignationData.fnGetResignationDetails(Resignation)

                MasterEmpID = Resignation.EmployeeID
                lblEmpName.Text = Resignation.EmployeeName
                lblEmpCode.Text = Resignation.EmpCode
                lblDateOfJoining.Text = Resignation.DateOfJoining.ToString("dddd, dd MMMM yyyy")
                lblDateOfConfirmation.Text = Resignation.DateOfConfirmation.ToString("dddd, dd MMMM yyyy")
                lblDepartment.Text = Resignation.Department
                lblSupervisor.Text = Resignation.Supervisor
                lblBranch.Text = Resignation.Branch
                lblDateOfBirth.Text = Resignation.DateOfBirth.ToString("dddd, dd MMMM yyyy")
                lblResignationEffectiveDate.Text = Resignation.EffectiveDate.ToString("dddd, dd MMMM yyyy")
                lblResignationEffectiveDateBySupervisor.Text = Resignation.ProposedEffectiveDate.ToString("dddd, dd MMMM yyyy")
                txtReasonForResignation.Text = Resignation.ReasonOfResignation
                txtFeedBack.Text = Resignation.FeedbackAboutCompany
                txtSupervisorComment.Text = Resignation.SupervisorComment
                imgEmp.ImageUrl = "~/Attachments/" + Resignation.Photo
            Catch ex As Exception
                MessageBox(ex.Message)
            End Try

        End If

        'If OnceReviewed = True Then
        '    btnAccept.Enabled = False
        '    btnReject.Enabled = False
        'End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub



End Class
