Imports System.Net.Mail

Partial Class frmCandidateMsgReply
    Inherits System.Web.UI.Page

    Dim ContactUsData As New clsContactUsDataAccess()

    Protected Sub grdMessages_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdMessages.SelectedIndexChanged
        Dim lblContactUsID As New System.Web.UI.WebControls.Label()
        Dim ContactUsID As String
        lblContactUsID = grdMessages.SelectedRow.FindControl("lblContactUsID")
        ContactUsID = lblContactUsID.Text

        Dim lblEmail As New System.Web.UI.WebControls.Label()
        Dim Email As String
        lblEmail = grdMessages.SelectedRow.FindControl("lblEmail")
        Email = lblEmail.Text
        txtEmail.Text = Email

        btnInsert.Enabled = True
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim EntryBy As String
            EntryBy = Session("LoginUserID")
            btnInsert.Enabled = False

            getMessageList()
        End If
    End Sub
    Protected Sub getMessageList()
        grdMessages.DataSource = ContactUsData.fnGetCandidateMessageList()
        grdMessages.DataBind()
    End Sub
    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsert.Click
        Dim ContactUs As New clsContactUs()

        Dim lblContactUsID As New System.Web.UI.WebControls.Label()
        lblContactUsID = grdMessages.SelectedRow.FindControl("lblContactUsID")
        ContactUs.ContactUsID = lblContactUsID.Text

        ContactUs.RepMessage = Common.CheckAsciiValue(txtReply.Text)

        ContactUs.EntryBy = Session("LoginUserID")


        Dim lblEmail As New System.Web.UI.WebControls.Label()
        lblEmail = grdMessages.SelectedRow.FindControl("lblEmail")
        ContactUs.Email = lblEmail.Text

        Dim Check As Integer = ContactUsData.fnInsertReplyedMsg(ContactUs)

        Dim CandidateName As String
        Dim lblName As New System.Web.UI.WebControls.Label()
        lblName = grdMessages.SelectedRow.FindControl("lblName")

        CandidateName = lblName.Text


        Dim lblMessage As New System.Web.UI.WebControls.Label()
        lblMessage = grdMessages.SelectedRow.FindControl("lblMessage")
        ContactUs.Message = lblMessage.Text

        If Check = 1 Then
            
            Dim sb As StringBuilder = New StringBuilder()
            Dim mail As New Net.Mail.MailMessage()

            'mail.To.Add("Career@ulc.com.bd")
            mail.To.Add(ContactUs.Email)

            mail.Bcc.Add("Debayan@ulc.com")
            mail.Bcc.Add("tahmed1@ulc.com")
            'mail.From = New MailAddress(ContactUs.Email)
            mail.From = New MailAddress("Career@ulc.com.bd")
            mail.Subject = "Feedback Reply"
            sb.Append("Dear <b>")
            sb.Append(CandidateName + ",</b></br></br>")
            sb.Append("<b>Message From You:</b></br><html><head></head><table style='border-width:.5px;border-style:solid' >")
            sb.Append("<tr>")
            sb.Append("<th>Message</th>")
            sb.Append("</tr>")
            sb.Append("<tr><td></td></tr>")
            sb.Append("<td>" + ContactUs.Message + "</td></tr>")
            sb.Append("<tr><td></td></tr>")
            sb.Append("</table>")
            sb.Append("</br></br>")
            sb.Append("<b>Feedback: </b></br><table style='border-width:.5px;border-style:solid' >")
            sb.Append("<tr>")
            sb.Append("<th>Feedback</th>")
            sb.Append("</tr>")
            sb.Append("<tr><td></td></tr>")
            sb.Append("<td>" + ContactUs.RepMessage + "</td></tr>")
            sb.Append("<tr><td></td></tr></br>")
            sb.Append("<tr><td>")
            sb.Append("</table>")
            sb.Append("<body><table border=0> <tr><td></br>")
            sb.Append("Regards,</td></tr><tr><td>")
            sb.Append("Human Resource</td></tr>")
            sb.Append("<tr><td>United Finance</td></br></br></tr>")
            sb.Append("<tr><td></td></tr>")
            sb.Append("<tr><td><b>NOTE: THIS MESSAGE IS SYSTEM GENERATED.  YOU CANNOT REPLY TO THIS MESSAGE.</b></td></tr>")

            sb.Append("</body></html>")
            mail.Body = sb.ToString()
            mail.IsBodyHtml = True
            Dim smtp As New SmtpClient("192.168.1.242", 25)
            smtp.Send(mail)
            ClearData()
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub ClearData()
        txtEmail.Text = ""
        txtReply.Text = ""
        btnInsert.Enabled = False
        grdMessages.SelectedIndex = -1
        getMessageList()

    End Sub
End Class
