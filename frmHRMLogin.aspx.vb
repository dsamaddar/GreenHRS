Imports System.Net.Dns

Partial Class frmHRMLogin
    Inherits System.Web.UI.Page

    Dim Cypher As New clsCaesarCypher()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("LoginUserID") = ""
            Session("UserName") = ""
            Session("UniqueUserID") = ""
            Session("UserType") = ""
            Session("Message") = ""
            Session("RegistrationID") = ""

            Dim strHostName As String = ""
            Dim strIPAddress As String = ""

            strHostName = System.Net.Dns.GetHostName()
            strIPAddress = System.Net.Dns.GetHostByName(strHostName).AddressList(0).ToString()

            'lblIpAddress.Text = strIPAddress.ToString()

        End If

        'Response.Redirect("ErrorPage.aspx")

    End Sub

    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogin.Click
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

        UserID = txtUserName.Text
        Password = txtPassword.Text
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
            Session("PermittedMenus") = PermittedMenus

            If UserType = "Registered" Or UserType = "Candidate" Then
                Dim RegistrationID As String = Common.GetRegistrationID(UserID, Password)
                Session("RegistrationID") = RegistrationID
                count = Common.CandidateCount(RegistrationID)

                If count <> 0 Then
                    CandidateID = Common.GetCandidateID(RegistrationID)
                    Session("CandidateID") = CandidateID

                Else
                    Session("CandidateID") = ""
                End If

                Dim Check As Integer = Common.SubmitUserLogInfo(UserID, Password, "192.168.1.242", RegistrationID)

                If Check = 0 Then

                End If

                'Response.Redirect("~/frmCandidateHome.aspx")
                Response.Redirect("http://career.unitedfinance.com.bd:8080/CandidateApp/frmHRMLogin.aspx")
            ElseIf UserType = "Admin" Then
                Session("EmployeeID") = UniqueUserID
                'DefaultPage = "~/EmployeeInfo/Default.aspx"
                Response.Redirect("~/EmployeeInfo/Default.aspx")
            Else
                Session("EmployeeID") = UniqueUserID

                UniqueUserID = Cypher.Encrypt(UniqueUserID)
                Response.Redirect("~/EmployeeProfile/frmEmployeeDetails.aspx?EmployeeID=" & UniqueUserID)
            End If

            End If
    End Sub
End Class
