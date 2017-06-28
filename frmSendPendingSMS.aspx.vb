Imports System.Xml

Partial Class frmSendPendingSMS
    Inherits System.Web.UI.Page

    Dim SMSData As New clsSMSServiceDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowPendingSMS()
            tmrSMSThrow.Enabled = True
        End If
    End Sub

    Protected Sub ShowPendingSMS()
        grdPendingSMS.DataSource = SMSData.fnGetPendingSMSToThrow()
        grdPendingSMS.DataBind()
    End Sub

    Protected Sub SendSMS(ByVal MessageID As Int32, ByVal MobileNo As String, ByVal SMSBody As String)
        Dim dox = New XmlDocument()
        Dim CompanyName As String = "ULC"
        Dim Check As Integer = 0
        Dim resPeram As String()
        Dim smppURI As String = "http://service.aaqa.co/SMSPro.asmx/AaqaSMSProApi?username=" & "unitedleasing" & "&pass=" & "XuzGR" & "&SMSType=" & "0" & "&MobNo=" & MobileNo & "&Sender=" & CompanyName & "&msg=" & Server.UrlEncode(SMSBody) & "&SendMethod=0&AddPPrefix=0"
        dox.Load(smppURI)
        Dim res As String = dox.InnerText
        resPeram = res.Split("|"c)

        If resPeram(0) = "1701" Then
            Check = SMSData.fnUpdateThrownSMS(MessageID, "Success")
            If Check = 0 Then
                MessageBox("Failed Sending Message:" & MessageID)
            End If
        Else
            Check = SMSData.fnUpdateThrownSMS(MessageID, "Failed")
        End If

    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub tmrSMSThrow_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles tmrSMSThrow.Tick
        Dim lblMessageID, lblContactNumber, lblMessage As New Label()

        ShowPendingSMS()

        If grdPendingSMS.Rows.Count = 0 Then
            Exit Sub
        End If

        Try
            For Each rw As GridViewRow In grdPendingSMS.Rows
                lblMessageID = rw.FindControl("lblMessageID")
                lblContactNumber = rw.FindControl("lblContactNumber")
                lblMessage = rw.FindControl("lblMessage")

                If lblContactNumber.Text = "" Or lblMessage.Text = "" Then
                    SMSData.fnUpdateThrownSMS(lblMessageID.Text, "Failed")
                Else
                    SendSMS(lblMessageID.Text, lblContactNumber.Text, lblMessage.Text)
                End If
            Next
            ShowPendingSMS()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
      
    End Sub

End Class
