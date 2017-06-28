Imports System.Net.Mail

Partial Class frmNotifyExamSchedule
    Inherits System.Web.UI.Page

    Dim ExamData As New clsExamDataAccess()
    Dim SMSServiceData As New clsSMSServiceDataAccess()
    Dim CandidateResData As New clsCandidateResponseDataAccess()

    Protected Sub chkLstCommMethod_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkLstCommMethod.SelectedIndexChanged

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            GetAvailableExams()
        End If
    End Sub

    Protected Sub ClearForm()
        'txtEMailContent.Text = ""
        'txtSMSContent.Text = ""
        grdAvailableExamAttendee.DataSource = ""
        grdAvailableExamAttendee.DataBind()

        'For Each Chkbx As ListItem In chkLstCommMethod.Items
        '    If Chkbx.Selected = True Then
        '        Chkbx.Selected = False
        '    End If
        'Next

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        Dim SMSService As New clsSMSService()
        Dim SMSContentList As String = ""
        Dim chkSelectExamTaker As New CheckBox
        Dim CanResponse As New clsCandidateResponse()
        Dim lblExamRollNo, lblExamTakerID, lblUserName, lblContactNo, lblEmail, lblAlternateEmail As New Label
        If chkLstCommMethod.SelectedValue = "SMS" And Trim(txtSMSContent.Text) = "" Then
            MessageBox("SMS Content Can't Be Empty.")
            Exit Sub
        End If

        If chkLstCommMethod.SelectedValue = "EMail" And Trim(txtEMailContent.Text) = "" Then
            MessageBox("Email Content Can't Be Empty.")
            Exit Sub
        End If

        Dim RollNoList As String = ""
        For Each rw As GridViewRow In grdAvailableExamAttendee.Rows
            chkSelectExamTaker = rw.FindControl("chkSelectExamTaker")

            If chkSelectExamTaker.Checked = True Then
                lblExamRollNo = rw.FindControl("lblExamRollNo")
                RollNoList = RollNoList & lblExamRollNo.Text & ","
            End If
        Next

        RollNoList = RollNoList.Remove(Len(RollNoList) - 1)

        Dim CanRes As Integer = 0

        CanResponse.Options = "Interview Notification"
        CanResponse.AssessedBy = Session("LoginUserID")

        For Each chkbx As System.Web.UI.WebControls.ListItem In chkLstCommMethod.Items
            If chkbx.Selected = True Then
                If chkbx.Text = "SMS" Then
                    For Each rw As GridViewRow In grdAvailableExamAttendee.Rows
                        chkSelectExamTaker = rw.FindControl("chkSelectExamTaker")

                        If chkSelectExamTaker.Checked = True Then
                            lblUserName = rw.FindControl("lblUserName")
                            lblExamTakerID = rw.FindControl("lblExamTakerID")
                            lblContactNo = rw.FindControl("lblContactNo")
                            CanResponse.CandidateID = lblExamTakerID.Text
                            SMSContentList = SMSContentList & lblUserName.Text & "~" & lblExamTakerID.Text & "~" & lblContactNo.Text & "~" & txtSMSContent.Text & "~|"
                        End If
                    Next

                    SMSService.SMSContentList = SMSContentList
                    SMSService.Participant = RollNoList
                    '' Send SMS
                    Dim Check As Integer = SMSServiceData.fnInsertSMSContentList(SMSService)
                    If Check = 1 Then
                        Dim chk As Integer = SMSServiceData.fnInsertSMSContentList_SMS(SMSService)

                        If chk = 1 Then
                            CanResponse.CommunicationMethod = "SMS"
                            CanResponse.Remarks = txtSMSContent.Text
                            CanRes = CandidateResData.fnInsertCanResponse(CanResponse)
                            MessageBox("SMS Sent Successfully.")
                        Else
                            MessageBox("Error While SMS Sent.")
                        End If
                    End If
                End If

                If chkbx.Text = "EMail" Then


                    Dim sb As StringBuilder = New StringBuilder()

                    Dim mail As New Net.Mail.MailMessage()

                    mail.Bcc.Add("Debayan@ulc.com")
                    mail.From = New MailAddress("Career@ulc.com.bd")
                    mail.Subject = "United Leasing Recruitment Services"

                    For Each rw As GridViewRow In grdAvailableExamAttendee.Rows
                        chkSelectExamTaker = rw.FindControl("chkSelectExamTaker")

                        If chkSelectExamTaker.Checked = True Then
                            lblExamRollNo = rw.FindControl("lblExamRollNo")
                            lblUserName = rw.FindControl("lblUserName")
                            lblEmail = rw.FindControl("lblEmail")
                            lblAlternateEmail = rw.FindControl("lblAlternateEmail")
                            lblExamTakerID = rw.FindControl("lblExamTakerID")

                            CanResponse.CandidateID = lblExamTakerID.Text
                            CanResponse.CommunicationMethod = "EMail"
                            CanResponse.Remarks = txtEMailContent.Text
                            CanRes = CandidateResData.fnInsertCanResponse(CanResponse)

                            If lblEmail.Text <> "" Then ' Original E-Mail Addr
                                mail.To.Add(lblEmail.Text)
                            End If
                            If lblAlternateEmail.Text <> "" Then ' Alternate E-Mail Addr
                                mail.To.Add(lblAlternateEmail.Text)
                            End If

                            sb.Append("<html><head></head><body><table border=0> <tr><td><b>")
                            sb.Append("Dear " + lblUserName.Text + ",")
                            sb.Append("</b></td></br></br></tr>")
                            sb.Append("<tr><td></td></tr>")
                            sb.Append("<tr><td></td></tr>")
                            sb.Append("<tr><td>")
                            sb.Append("" + txtEMailContent.Text + "")
                            sb.Append("</td></tr>")
                            sb.Append("<tr><td>")
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
                            Dim smtp As New SmtpClient("192.168.1.242", 25)
                            smtp.Send(mail)
                            sb.Remove(0, sb.Length)
                        End If
                    Next



                End If
            End If

        Next
     

        ClearForm()
        ShowAvailableExamAttendees(drpAvailableExams.SelectedValue)

    End Sub

    Protected Sub GetAvailableExams()
        drpAvailableExams.DataTextField = "ExamName"
        drpAvailableExams.DataValueField = "ExamID"
        drpAvailableExams.DataSource = ExamData.fnGetAvailableExams()
        drpAvailableExams.DataBind()

        Dim A As New ListItem
        A.Text = "----- Choose Exam -----"
        A.Value = "N\A"
        drpAvailableExams.Items.Insert(0, A)

    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub ShowAvailableExamAttendees(ByVal ExamID As String)
        grdAvailableExamAttendee.DataSource = ExamData.fnAvailableExamAttendee(ExamID)
        grdAvailableExamAttendee.DataBind()
    End Sub

    Protected Sub drpAvailableExams_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpAvailableExams.SelectedIndexChanged

        If drpAvailableExams.SelectedIndex > 0 Then
            ShowAvailableExamAttendees(drpAvailableExams.SelectedValue)
        Else
            MessageBox("Select An Exam from The List.")
        End If


    End Sub
End Class
