
Partial Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("LoginUserID") = ""
            Session("UserName") = ""
            Session("UniqueUserID") = ""
            Session("UserType") = ""
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim UserID As String
        Dim Password As String
        Dim UserName As String
        Dim isLogin As Integer
        Dim DefaultPage As String
        Dim IP As String
        Dim count As Integer
        Dim CandidateID As String
        Dim UniqueUserID As String = ""
        Dim UserType As String = ""
        Dim PermittedMenus As String = ""
        'Dim EmployeeID As String = ""

        Dim ApplicationId As String = ""

        UserID = Login1.UserName
        Password = Login1.Password
        IP = Request.ServerVariables("REMOTE_ADDR")


        UserName = ""
        DefaultPage = ""
        isLogin = Common.isLogin(UserID, Password, IP, UserName, DefaultPage, UniqueUserID, UserType, PermittedMenus)

        'DefaultPage = "/Default2.aspx"
        If isLogin = 1 Then
            FormsAuthentication.RedirectFromLoginPage(UserID, False)
            Session("LoginUserID") = UserID
            Session("UserName") = UserName
            Session("UniqueUserID") = UniqueUserID
            Session("UserType") = UserType


            If UserType = "Registered" Or UserType = "Candidate" Then
                count = Common.CandidateCount(UserID)


                'DefaultPage = "/Default2.aspx"

                If count <> 0 Then
                    CandidateID = Common.GetCandidateID(UserID)
                    Session("CandidateID") = CandidateID

                Else
                    Session("CandidateID") = ""
                End If

                Response.Redirect("~/JobCircular/frmViewJobAdvertisement.aspx")
            End If

            If UserType = "User" Then
                Session("EmployeeID") = UniqueUserID
                'DefaultPage = "~/EmployeeInfo/Default.aspx"
                Response.Redirect("~/EmployeeInfo/Default.aspx")
            End If
        End If
    End Sub
End Class
