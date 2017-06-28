Imports System.Net.Dns
Imports Microsoft.VisualBasic

Partial Class frmUserAttendance
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim strHostName As String = ""
            Dim strIPAddress As String = ""

            strHostName = System.Net.Dns.GetHostName()
            strIPAddress = System.Net.Dns.GetHostByName(strHostName).AddressList(0).ToString()

            lblUserName.Text = Replace(Request.LogonUserIdentity.Name, "ULC\", "")
            'lblUserName.Text = System.Web.HttpContext.Current.User.Identity.Name.ToString()
            lblLogInTime.Text = System.DateTime.Now
            lblIpAddress.Text = strIPAddress.ToString()
            lblWorkStation.Text = strHostName.ToString()

        End If
    End Sub



End Class
