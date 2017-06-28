<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ErrorPage.aspx.vb" Inherits="ErrorPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Label ID="lblMessage" runat="server" Font-Size="70pt" ForeColor="#CC0000" 
        Text="Timeout!!"></asp:Label>
    <asp:LinkButton Font-Size="50pt" ForeColor="Green" ID="lnkBtnLoginPage" PostBackUrl="~/frmHRMLogin.aspx" runat="server">Go To Login Page</asp:LinkButton>
    </form>
</body>
</html>
