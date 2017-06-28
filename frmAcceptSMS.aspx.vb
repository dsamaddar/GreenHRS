
Partial Class frmAcceptSMS
    Inherits System.Web.UI.Page

    Dim SMSData As New clsSMSServiceDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowHRSPendingSMS()
        End If
    End Sub

    Protected Sub ShowHRSPendingSMS()
        Dim SMS As New clsSMSService()
        SMS.Dept = "HR"
        grdPendingSMS.DataSource = SMSData.fnGetPendingHRSSMS(SMS)
        grdPendingSMS.DataBind()
    End Sub

    Protected Sub btnAccept_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAccept.Click
        Dim chkPendingSMS As New CheckBox
        Dim lblMessageID As New Label
        Dim MessageIDList As String = ""

        For Each rw As GridViewRow In grdPendingSMS.Rows
            chkPendingSMS = rw.FindControl("chkPendingSMS")
            If chkPendingSMS.Checked = True Then
                lblMessageID = rw.FindControl("lblMessageID")
                MessageIDList += lblMessageID.Text + ","
            End If
        Next

        If MessageIDList <> "" Then
            MessageIDList = MessageIDList.Remove(Len(MessageIDList) - 1, 1)
        Else
            MessageBox("Select Message From The List.")
            Exit Sub
        End If

        Dim SMS As New clsSMSService()
        SMS.Dept = "HR"
        SMS.MessageIDList = MessageIDList
        Dim Check As Integer = SMSData.fnAcceptPendingHRSMS(SMS)

        If Check = 1 Then
            MessageBox("Accepted.")
            ShowHRSPendingSMS()
        Else
            MessageBox("Error Found.")
        End If


    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnReject_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReject.Click
        Dim chkPendingSMS As New CheckBox
        Dim lblMessageID As New Label
        Dim MessageIDList As String = ""

        For Each rw As GridViewRow In grdPendingSMS.Rows
            chkPendingSMS = rw.FindControl("chkPendingSMS")
            If chkPendingSMS.Checked = True Then
                lblMessageID = rw.FindControl("lblMessageID")
                MessageIDList += lblMessageID.Text + ","
            End If
        Next

        If MessageIDList <> "" Then
            MessageIDList = MessageIDList.Remove(Len(MessageIDList) - 1, 1)
        Else
            MessageBox("Select Message From The List.")
            Exit Sub
        End If

        Dim SMS As New clsSMSService()
        SMS.Dept = "HR"
        SMS.MessageIDList = MessageIDList
        Dim Check As Integer = SMSData.fnRejectPendingHRSMS(SMS)

        If Check = 1 Then
            MessageBox("Rejected.")
            ShowHRSPendingSMS()
        Else
            MessageBox("Error Found.")
        End If
    End Sub

End Class
