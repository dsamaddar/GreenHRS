
Partial Class ErrorPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("LoginUserID") = ""
        Session("UserName") = ""
        Session("UniqueUserID") = ""
        Session("UserType") = ""
        Session("PermittedMenus") = ""
    End Sub
End Class
