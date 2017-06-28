Imports System.Net.Mail

Partial Class frmCandidateInterviewResult
    Inherits System.Web.UI.Page

    Dim SMSServiceData As New clsSMSServiceDataAccess()
    Dim IntData As New clsInterviewCandidateDataAccess()
    Dim CandidateResData As New clsCandidateResponseDataAccess()
    Dim CVSelectionData As New clsCVSelectionDataAccess()

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        Try
            ShowCandidates()
            If grdIntCandidates.Rows.Count > 0 Then
                'This replaces <td> with <th> and adds the scope attribute
                grdIntCandidates.UseAccessibleHeader = True
                'This will add the <thead> and <tbody> elements
                grdIntCandidates.HeaderRow.TableSection = TableRowSection.TableHeader
                'This adds the <tfoot> element.Remove if you don't have a footer row
                grdIntCandidates.FooterRow.TableSection = TableRowSection.TableFooter
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ShowCandidates()
        grdIntCandidates.DataSource = IntData.fnGetIntCandidatesResult(Convert.ToDateTime(txtStartDate.Text), Convert.ToDateTime(txtEndDate.Text))
        grdIntCandidates.DataBind()
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtStartDate.Text = Now.Date
            txtEndDate.Text = Now.Date.AddDays(1)
        End If

        If grdIntCandidates.Rows.Count > 0 Then
            'This replaces <td> with <th> and adds the scope attribute
            grdIntCandidates.UseAccessibleHeader = True
            'This will add the <thead> and <tbody> elements
            grdIntCandidates.HeaderRow.TableSection = TableRowSection.TableHeader
            'This adds the <tfoot> element.Remove if you don't have a footer row
            grdIntCandidates.FooterRow.TableSection = TableRowSection.TableFooter
        End If

    End Sub

    Protected Sub grdIntCandidates_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdIntCandidates.RowDataBound
        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(4).Text = "Total:"
            e.Row.Cells(5).Text = grdIntCandidates.Rows.Count.ToString()
        End If
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Dim SMSService As New clsSMSService()
        Dim SMSContentList As String = ""
        Dim MailProp As New clsMailProperty()
        Dim lblIntCandidateID, lblCandidateName, lblCandidateID, lblContactNo As New Label()
        Dim chkSelectIntCandidate As New CheckBox
        Dim CanResponse As New clsCandidateResponse()

        If chkLstCommMethod.SelectedValue = "SMS" And Trim(txtSMSContent.Text) = "" Then
            MessageBox("SMS Content Can't Be Empty.")
            Exit Sub
        End If

        If chkLstCommMethod.SelectedValue = "EMail" And Trim(txtEMailContent.Text) = "" Then
            MessageBox("Email Content Can't Be Empty.")
            Exit Sub
        End If

        For Each rw As GridViewRow In grdIntCandidates.Rows
            chkSelectIntCandidate = rw.FindControl("chkSelectIntCandidate")

            If chkSelectIntCandidate.Checked = True Then

                lblIntCandidateID = rw.FindControl("lblIntCandidateID")
                lblCandidateID = rw.FindControl("lblCandidateID")
                lblCandidateName = rw.FindControl("lblCandidateName")
                lblContactNo = rw.FindControl("lblContactNo")

                For Each chkbx As System.Web.UI.WebControls.ListItem In chkLstCommMethod.Items
                    If chkbx.Selected = True Then
                        If chkbx.Text = "SMS" Then
                            CanResponse.CandidateID = lblCandidateID.Text
                            SMSContentList = SMSContentList & lblCandidateName.Text & "~" & lblCandidateID.Text & "~" & lblContactNo.Text & "~" & txtSMSContent.Text & "~|"

                            SMSService.SMSContentList = SMSContentList
                            '' Send SMS
                            Dim chk As Integer = SMSServiceData.fnInsertSMSContentList_SMS(SMSService)

                            If chk = 1 Then
                                CanResponse.CandidateID = lblCandidateID.Text
                                CanResponse.CommunicationMethod = "SMS"
                                CanResponse.Remarks = txtSMSContent.Text
                                CanResponse.Options = "Interview Response"
                                CanResponse.AssessedBy = Session("LoginUserID")
                                Dim CanRes As Integer = CandidateResData.fnInsertCanResponse(CanResponse)
                            Else
                                MessageBox("Error While SMS Sent.")
                            End If

                        End If

                        If chkbx.Text = "EMail" Then
                            MailProp = IntData.fnGetIntNotificationMailInfo(lblIntCandidateID.Text, txtEMailContent.Text)
                            CanResponse.CandidateID = lblCandidateID.Text
                            CanResponse.CommunicationMethod = "EMail"
                            CanResponse.Remarks = txtEMailContent.Text
                            CanResponse.Options = "Interview Response"
                            CanResponse.AssessedBy = Session("LoginUserID")
                            Dim CanRes As Integer = CandidateResData.fnInsertCanResponse(CanResponse)
                            SendMail(MailProp)

                        End If
                    End If

                Next

                If chkCandidateRejection.Checked = True Then
                    Dim IntCan As New clsInterviewCandidate()
                    IntCan.IntCandidateID = lblIntCandidateID.Text
                    IntCan.RejectedBy = Session("LoginUserID")
                    Dim check As Integer = IntData.fnRejectCanAfterInterview(IntCan)

                    If check = 1 Then
                        CanResponse.CandidateID = lblCandidateID.Text
                        CanResponse.CommunicationMethod = "Rejected"
                        CanResponse.Remarks = "Rejected"
                        CanResponse.Options = "Interview Response"
                        CanResponse.AssessedBy = Session("LoginUserID")
                        Dim CanRes As Integer = CandidateResData.fnInsertCanResponse(CanResponse)
                    End If

                End If

            End If
        Next

        ClearForm()
        ShowCandidates()
        MessageBox("Nofiticatin Sent")

    End Sub

    Protected Sub SendMail(ByVal MailProp As clsMailProperty)
        Dim mail As New Net.Mail.MailMessage()
        Try
            mail.From = New MailAddress(MailProp.MailFrom)
            mail.To.Add(MailProp.MailTo)
            mail.CC.Add(MailProp.MailCC)
            mail.Bcc.Add(MailProp.MailBCC)
            mail.Subject = MailProp.MailSubject
            mail.Body = MailProp.MailBody
            mail.IsBodyHtml = True
            Dim smtp As New SmtpClient("192.168.1.242", 25)
            smtp.Send(mail)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnCancelSelection_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelSelection.Click
        ClearForm()
    End Sub

    Protected Sub ClearForm()
        Dim chkSelectIntCandidate As New CheckBox
        chkCandidateRejection.Checked = False
        For Each chkbx As System.Web.UI.WebControls.ListItem In chkLstCommMethod.Items
            If chkbx.Selected = True Then
                chkbx.Selected = False
            End If
        Next

        If grdIntCandidates.Rows.Count > 0 Then
            For Each rw As GridViewRow In grdIntCandidates.Rows
                chkSelectIntCandidate = rw.FindControl("chkSelectIntCandidate")
                If chkSelectIntCandidate.Checked = True Then
                    chkSelectIntCandidate.Checked = False
                End If
            Next
        End If

    End Sub

End Class
