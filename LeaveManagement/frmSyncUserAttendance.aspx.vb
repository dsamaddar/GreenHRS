Imports System.Data

Partial Class LeaveManagement_frmSyncUserAttendance
    Inherits System.Web.UI.Page

    Dim UsrAttData As New clsUserAttendanceDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Try
                ShowPendingAttendance()
            Catch ex As Exception
                MessageBox(ex.Message)
            End Try
        End If
    End Sub

    Protected Sub ShowPendingAttendance()
        Dim UsrAtt As clsUserAttendance = UsrAttData.fnUsrAttLogIndex()
        Dim dtAtt As DataTable = UsrAttData.fnGetUsrAttInfo(UsrAtt).Tables(0)
        grdPendingUsrAttendance.DataSource = dtAtt
        grdPendingUsrAttendance.DataBind()

    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnSynchronize_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSynchronize.Click
        Try
            Dim UsrAtt As clsUserAttendance = UsrAttData.fnUsrAttLogIndex()
            Dim dtAtt As DataTable = UsrAttData.fnGetUsrAttInfo(UsrAtt).Tables(0)
            Dim Check As Integer = 0
            For Each rw As DataRow In dtAtt.Rows
                UsrAtt.LogIndex = rw.Item("logindex")
                UsrAtt.AttendanceID = rw.Item("userid")
                UsrAtt.LogTime = rw.Item("logtime")
                UsrAtt.NodeID = rw.Item("nodeid")
                Check = UsrAttData.fnInsertUserAttendance(UsrAtt)
            Next

            If Check = 1 Then
                MessageBox("Synchronization Done.")
                ShowPendingAttendance()
            Else
                MessageBox("Error Found.")
            End If

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub
End Class
