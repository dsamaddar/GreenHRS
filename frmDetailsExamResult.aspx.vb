
Partial Class frmDetailsExamResult
    Inherits System.Web.UI.Page

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        txtExamRollNo.Text = ""
    End Sub

    Protected Sub btnShowDetailsExamResult_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShowDetailsExamResult.Click
        Dim page As Page = CType(HttpContext.Current.Handler, Page)

        Dim url As String = page.ResolveClientUrl("/HRM/CVMan/frmShowCanDetailsResult.aspx?ExamRollNo=" + txtExamRollNo.Text)

        Dim script As String

        script = "window.open(""{0}"", ""{1}"");"

        script = String.Format(script, url, "_blank", "")

        ScriptManager.RegisterStartupScript(page, GetType(Page), "Redirect", script, True)

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

        End If
    End Sub
End Class
