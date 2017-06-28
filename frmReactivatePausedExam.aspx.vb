
Partial Class frmReactivatePausedExam
    Inherits System.Web.UI.Page

    Dim PausedExamsStatData As New clsPausedExamStatusDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            ShowExamsToReactivate()
        End If
    End Sub

    Protected Sub ShowExamsToReactivate()
        grdExamsToReactivate.DataSource = PausedExamsStatData.fnGetPausedExams()
        grdExamsToReactivate.DataBind()
    End Sub

    Protected Sub grdExamsToReactivate_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdExamsToReactivate.SelectedIndexChanged
        Dim lblExamRollNo As New Label()

        lblExamRollNo = grdExamsToReactivate.SelectedRow.FindControl("lblExamRollNo")

        Dim Check As Integer = PausedExamsStatData.fnReactiveExam(lblExamRollNo.Text)

        If Check = 1 Then
            MessageBox("Exam Reactivated Successfully.")
            ShowExamsToReactivate()
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

End Class
