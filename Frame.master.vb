
Partial Class Frame
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim UserID As String
            'Dim P As WebControls.Panel
            Dim mnu As New Menu
            If (Request.IsAuthenticated) Then

                UserID = Session("LoginUserID")
                mnu = Me.LoginView1.FindControl("Menu1")


               

            End If
        End If
    End Sub
End Class

