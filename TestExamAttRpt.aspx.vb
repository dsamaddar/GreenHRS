
Partial Class TestExamAttRpt
    Inherits System.Web.UI.Page

    Dim ExamData As New clsExamDataAccess()

    Protected Sub btnShowReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShowReport.Click
        Try
            If Convert.ToDateTime(txtStartDate.Text) > Convert.ToDateTime(txtEndDate.Text) Then
                Dim a As DateTime = txtStartDate.Text
                txtStartDate.Text = txtEndDate.Text
                txtEndDate.Text = a
            End If

            GridView1.DataSource = ExamData.fnExamAttendeeReport(Convert.ToDateTime(txtStartDate.Text), Convert.ToDateTime(txtEndDate.Text))
            GridView1.DataBind()
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


End Class
