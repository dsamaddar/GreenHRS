Imports System.Net.Mail

Partial Class EmployeeProfile_frmEmpResignationDetails
    Inherits System.Web.UI.Page

    Dim ResignationData As New clsResignationDataAccess()
    Dim ResignationMailData As New clsResignationMailDataAccess()
    Public Shared MasterEmpID As String = ""
    Dim OnceReviewed As Boolean = False

    Protected Sub btnAccept_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAccept.Click

        Dim Resignation As New clsResignation()
        Try
            Resignation.EmployeeID = MasterEmpID
            Resignation.ResignationID = Request.QueryString("ResignationID")
            Resignation.SupervisorComment = txtSupervisorComment.Text
            Resignation.ProposedEffectiveDate = Convert.ToDateTime(txtProposedEffectiveDate.Text)

            Resignation.Status = "Accepted"

            Dim Check As Integer = ResignationData.fnSupervisorAcceptResignation(Resignation)

            If Check = 1 Then
                OnceReviewed = True
                MessageBox("Resignation Accepted")
                Resignation.EffectiveDate = Convert.ToDateTime(lblResignationEffectiveDate.Text)
                Resignation.ReasonOfResignation = txtReasonForResignation.Text
                Resignation.FeedbackAboutCompany = txtFeedBack.Text
                Resignation.SupervisorComment = txtSupervisorComment.Text
                SendResignationReqAcceptedMail(Resignation)
                ClearForm()
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub ClearForm()
        txtSupervisorComment.Text = ""
        btnAccept.Enabled = False
        btnReject.Enabled = False
    End Sub

    Protected Sub SendResignationReqAcceptedMail(ByVal Resignation As clsResignation)
        Dim sb As StringBuilder = New StringBuilder()
        Dim mail As New Net.Mail.MailMessage()

        Try
            Dim ResignationMail As clsResignationMail = ResignationMailData.fnGetMailAddressByEmpID(Resignation.EmployeeID)

            mail.CC.Add(ResignationMail.EmpMailAdr)
            mail.To.Add("HR@ulc.com")
            mail.CC.Add("mmhaque@unitedfinance.com.bd")
            mail.Bcc.Add("Debayan@ulc.com")
            mail.From = New MailAddress(ResignationMail.SupervisorMailAdr)
            mail.Subject = "GreenHRS: Resignation Accepted By Supervisor (" + Session("UserName") + ")"
            sb.Append("</br></br><html><head></head><table style='border-width:2px;border-style:solid' >")
            sb.Append("<tr>")
            sb.Append("<th>Employee</th>")
            sb.Append("<th>Effective Date</th>")
            sb.Append("<th>Reason Of Resignatoin</th>")
            sb.Append("<th>Feedback About Company</th>")
            sb.Append("<th>Supervisor Comment</th>")
            sb.Append("</tr>")
            sb.Append("<tr><td></td><td></td><td></td><td></td></tr>")
            sb.Append("<tr><td>" + ResignationMail.EmployeeName + "</td>")
            sb.Append("<td>" + Resignation.EffectiveDate.ToString("dddd, dd MMMM yyyy") + "</td>")
            sb.Append("<td>" + Resignation.ReasonOfResignation + "</td>")
            sb.Append("<td>" + Resignation.FeedbackAboutCompany + "</td>")
            sb.Append("<td>" + Resignation.SupervisorComment + "</td></tr>")
            sb.Append("<tr><td></td><td></td><td></td><td></td></tr>")
            sb.Append("</table>")
            sb.Append("</html>")
            mail.Body = sb.ToString()
            mail.IsBodyHtml = True
            Dim smtp As New SmtpClient("192.168.1.242", 25)
            smtp.Send(mail)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
      
    End Sub

    Protected Sub btnReject_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReject.Click
        Dim Resignation As New clsResignation()

        Try
            Resignation.ResignationID = Request.QueryString("ResignationID")
            Resignation.SupervisorComment = txtSupervisorComment.Text
            If txtProposedEffectiveDate.Text = "" Then
                Resignation.ProposedEffectiveDate = "1/1/1900"
            Else
                Resignation.ProposedEffectiveDate = Convert.ToDateTime(txtProposedEffectiveDate.Text)
            End If

            Resignation.Status = "Rejected"

            Dim Check As Integer = ResignationData.fnSupervisorAcceptResignation(Resignation)

            If Check = 1 Then
                OnceReviewed = True
                MessageBox("Resignation Rejected")
                ClearForm()
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
        
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
                lblResignationEffectiveDate.Text = Resignation.EffectiveDate
                txtProposedEffectiveDate.Text = Resignation.EffectiveDate
                txtReasonForResignation.Text = Resignation.ReasonOfResignation
                txtFeedBack.Text = Resignation.FeedbackAboutCompany
                imgEmp.ImageUrl = "~/Attachments/" + Resignation.Photo
            Catch ex As Exception
                MessageBox(ex.Message)
            End Try

        End If

        If OnceReviewed = True Then
            btnAccept.Enabled = False
            btnReject.Enabled = False
        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

  

End Class
