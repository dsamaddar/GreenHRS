
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If
        If Not IsPostBack Then
            lblEmpLoggedInUser.Text = "Welcome " + Session("UserName") + " ! "

            If Session("LoginUserID") = "" Then
                Response.Redirect("~/frmHRMLogin.aspx")
            End If
            If Session("UserName") = "" Then
                Response.Redirect("~/frmHRMLogin.aspx")
            End If
            If Session("UniqueUserID") = "" Then
                Response.Redirect("~/frmHRMLogin.aspx")
            End If
            If Session("UserType") = "" Then
                Response.Redirect("~/frmHRMLogin.aspx")
            End If
        End If
    End Sub
End Class

