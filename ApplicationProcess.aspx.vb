
Partial Class ApplicationProcess
    Inherits System.Web.UI.Page

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        Try
            Dim ProcessName As String
            Dim ProcessDescription As String
            Dim Stage As Integer
            Dim loginid As String

            loginid = Session("LoginUserID")
            ProcessName = txtProcessName.Text
            ProcessDescription = txtDescription.Text
            Stage = txtStage.Text

            Dim count As Integer = Common.InsertApplicationProcess(ProcessName, ProcessDescription, Stage, loginid)
            If count = 1 Then
                MessageBox("Successfully Inserted")
                dsAppProcess.DataBind()
                grdAppProcess.DataBind()
                ClearAll()
            End If
            'MessageBox("Successfully Inserted")
            'dsAppProcess.DataBind()
            'grdAppProcess.DataBind()
            'ClearAll()
        Catch ex As Exception
            MessageBox("Error Found")
        End Try
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Private Sub ClearAll()
        txtProcessName.Text = ""
        txtDescription.Text = ""
        txtStage.Text = ""
    End Sub

    Protected Sub grdAppProcess_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles grdAppProcess.RowDeleted
        If e.Exception IsNot Nothing Then
            MessageBox("Can not be Deleted")
            e.ExceptionHandled = True
        Else
            MessageBox("Successfully Deleted")
            ClearAll()
            dsAppProcess.DataBind()
            grdAppProcess.DataBind()

        End If
    End Sub

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        ClearAll()
    End Sub


    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Try
            Dim ProcessName As String
            Dim Description As String
            Dim Stage As Integer
            Dim loginid As String
            Dim AppProcessID As String

            AppProcessID = grdAppProcess.SelectedDataKey.Value
            loginid = Session("LoginUserID")
            ProcessName = txtProcessName.Text
            Description = txtDescription.Text
            Stage = txtStage.Text

            Common.UpdateApplicationProcess(AppProcessID, ProcessName, Description, Stage)

            MessageBox("Successfully Updated")
            dsAppProcess.DataBind()
            grdAppProcess.DataBind()
            ClearAll()
        Catch ex As Exception
            MessageBox("Failed to Update")
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub grdAppProcess_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdAppProcess.SelectedIndexChanged
        Try
            Dim AppProcessID As String
            Dim ProcessName As String = ""
            Dim Description As String = ""
            Dim Stage As Integer

            AppProcessID = grdAppProcess.SelectedDataKey.Value


            Common.GetApplicationProcess(AppProcessID, ProcessName, Description, Stage)

            txtProcessName.Text = ProcessName
            txtDescription.Text = Description
            txtStage.Text = Stage

            btnUpdate.Enabled = True
            btnSave.Enabled = False
        Catch ex As Exception

        End Try
    End Sub
End Class
