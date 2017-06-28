Imports System.Net.Mail

Partial Class frmSendMailAndRejectCV
    Inherits System.Web.UI.Page

    Dim CanScrInterviewData As New clsScreeningInterviewDataAccess()
    Dim CanResData As New clsCandidateResponseDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            ShowDefaultCV()
        End If
    End Sub

    Protected Sub ShowDefaultCV()
        grdDefaultCV.DataSource = CanScrInterviewData.fnGetDefaultCV()
        grdDefaultCV.DataBind()
    End Sub

    Protected Sub grdDefaultCV_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdDefaultCV.SelectedIndexChanged
        Dim lblgrdCandidateName, lblgrdAlternateEmail, lblgrdEmail, lblgrdCandidateID As Label

        Try
            lblgrdAlternateEmail = grdDefaultCV.SelectedRow.FindControl("lblgrdAlternateEmail")
            lblgrdEmail = grdDefaultCV.SelectedRow.FindControl("lblgrdEmail")
            lblgrdCandidateName = grdDefaultCV.SelectedRow.FindControl("lblgrdCandidateName")
            lblgrdCandidateID = grdDefaultCV.SelectedRow.FindControl("lblgrdCandidateID")

            hdFldCandidateID.Value = lblgrdCandidateID.Text
            lblEMail.Text = lblgrdEmail.Text
            lblAlternateEmail.Text = lblgrdAlternateEmail.Text
            lblCandidateName.Text = lblgrdCandidateName.Text
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

    Protected Sub btnSendMail_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSendMail.Click

        If grdDefaultCV.SelectedIndex = -1 Then
            MessageBox("Select A Candidate First.")
            Exit Sub
        End If

        Dim CanRes As New clsCandidateResponse()

        CanRes.CandidateID = hdFldCandidateID.Value
        CanRes.CommunicationMethod = "Email"
        CanRes.Options = "N\A"
        CanRes.Remarks = txtMailBody.Text
        CanRes.AssessedBy = Session("LoginUserID")

        Dim Check As Integer = CanResData.fnInsertCanResponse(CanRes)

        If Check = 1 Then

            Dim sb As StringBuilder = New StringBuilder()
            Dim mail As New Net.Mail.MailMessage()

            'mail.To.Add("Career@ulc.com.bd")
            mail.To.Add(lblEMail.Text)
            If lblAlternateEmail.Text <> "" Then
                mail.To.Add(lblAlternateEmail.Text)
            End If

            mail.Bcc.Add("Debayan@ulc.com")
            mail.From = New MailAddress("Career@ulc.com.bd")
            mail.Subject = "United Leasing Recruitment Services"
            sb.Append("<html><head></head><body><table border=0> <tr><td><b>")
            sb.Append("Dear " & lblCandidateName.Text & ",")
            sb.Append("</b></td></br></br></tr>")
            sb.Append("<tr><td></td></tr>")
            sb.Append("<tr><td></td></tr>")
            sb.Append("<tr><td>")
            sb.Append(txtMailBody.Text)
            sb.Append("</td></br></br></tr>")
            sb.Append("<tr><td></td></tr>")
            sb.Append("<tr><td></td></tr>")
            sb.Append("<tr><td>")
            sb.Append("Regards,</td></tr><tr><td>")
            sb.Append("Human Resource</td></tr>")
            sb.Append("<tr><td>United Finance</td></br></br></tr>")
            sb.Append("<tr><td></td></tr>")
            sb.Append("<tr><td><b>NOTE: THIS MESSAGE IS SYSTEM GENERATED.  YOU CANNOT REPLY TO THIS MESSAGE.</b></td></tr>")
            sb.Append("</body></html>")
            mail.Body = sb.ToString()
            mail.IsBodyHtml = True

            Try
                Dim smtp As New SmtpClient("192.168.1.242", 25)
                smtp.Send(mail)
            Catch ex As Exception
                MessageBox("Error Found In Sending Mail.")
            End Try
          
            ClearForm()
            MessageBox("Message Sent.")
        Else
            MessageBox("Error Found.")
        End If


    End Sub

    Protected Sub ClearForm()
        lblAlternateEmail.Text = ""
        lblCandidateName.Text = ""
        lblEMail.Text = ""
        txtMailBody.Text = ""
        grdDefaultCV.SelectedIndex = -1

        ShowDefaultCV()

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearForm()
    End Sub

    Protected Sub btnRejectCV_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRejectCV.Click
        If grdDefaultCV.SelectedIndex = -1 Then
            MessageBox("Select A Candidate First.")
            Exit Sub
        End If

        Dim CanRes As New clsCandidateResponse()

        CanRes.CandidateID = hdFldCandidateID.Value
        CanRes.Remarks = txtMailBody.Text
        CanRes.AssessedBy = Session("LoginUserID")

        Dim Check As Integer = CanResData.fnRejectCVForNoResponse(CanRes)

        If Check = 1 Then
            MessageBox("Candidate Rejected.")
            ClearForm()
        Else
            MessageBox("Error Found While Candidate Rejection.")
        End If

    End Sub

End Class
