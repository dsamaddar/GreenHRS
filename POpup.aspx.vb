
Partial Class POpup
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim AppProcessID As String = Request.QueryString("AppProcessID")

            Dim Description As String

            Common.GetApplicationDescription(AppProcessID, Description)

            TextBox1.Text = Description


        End If
    End Sub
End Class
