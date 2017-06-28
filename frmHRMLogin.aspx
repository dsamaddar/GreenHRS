<%@ Page Language="VB" AutoEventWireup="false" CodeFile="frmHRMLogin.aspx.vb" Inherits="frmHRMLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>..:United Finance App:..</title>
    <link href="Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
    <link href="Sources/css/Cloud.css" rel="stylesheet" type="text/css" />
    <link href="Sources/css/LoginhrsCss.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .LoginHeader
        {
            font-family: Cambria, Palatino, "Palatino Linotype" , "Palatino LT STD" , Georgia, serif;
            background: #e0e3ec url(Sources/images/bg_header.gif) repeat top left;
            font-size: 13px;
            color: #393b40;
            overflow-y: none;
        }
    </style>
    <style type="text/css">
        .protected
        {
            -moz-user-select: none;
            -webkit-user-select: none;
            user-select: none;
        }
        .style1
        {
            width: 11px;
        }
        .style2
        {
            width: 69px;
        }
    </style>

    <script language="javascript" type="text/javascript">
    
     function onKeyDown() {

    // current pressed key
     var pressedKey = String.fromCharCode(event.keyCode).toLowerCase();

        if (event.ctrlKey && (pressedKey == "c" || 
                        pressedKey == "v")) {
        // <strong class="highlight">disable</strong> key press porcessing
        event.returnValue = false;
         }

        } // onKeyDown
        
    function DisableCopyPaste()
    {
        alert('This functionality has been disabled !');   
        window.clipboardData.clearData('Text'); //for cleaning up the clipboard
        // Cancel default behavior
        event.returnValue = false;
    }

    </script>

    <script language="javascript" type="text/javascript">
        window.history.forward(1);
        
        document.oncontextmenu = function () { // Use document as opposed to window for IE8 compatibility
           alert("This Function Is Not Allowed In ULC JOB Application Process.")
           return false;
        };
    </script>

</head>
<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
    <form runat="server" id="hrmloginfrm">
    <div class="backColor_main" style="width: auto; height: 100%;">
        <table style="width: 100%;" class="protected">
            <tr>
                <td colspan="2">
                    <div align="center" style="width: auto; height: 20%; border-bottom: 1px solid #1E1E1E;
                        overflow: hidden;">
                        <asp:Image ID="imgLoginBanner" runat="server" ImageUrl="~/Sources/images/LoginBanner.jpg"
                            Width="100%" />
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2" valign="middle" align="left">
                    <div style="width: 100%; height: 15%;">
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2" valign="middle" align="left">
                    <div style="width: 100%; height: 55px;">
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width: 50%">
                    <table width="100%">
                        <tr>
                            <td>
                                <div style="width: 100%; height: 150px; border-right: 1px solid#787878; float: left;">
                                    <table style="width: 100%">
                                        <tr>
                                            <td>
                                                <img align="right" src="Sources/images/HRMLogo.png" style="padding-top: 30px; padding-right: 30px;
                                                    height: 90px; width: auto;">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div style="font-family: Arial, Helvetica, sans-serif; color: #1D1D1D; font-size: 17px;
                                                    font-weight: bold; text-shadow: 1px 1px #5F5F5F; text-align: right; padding-right: 45px;">
                                                    Welcome to United Finance Job Application Center
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 50%">
                    <asp:Panel ID="pnlLogin" runat="server" Width="600px">
                        <table style="width: 100%;">
                            <tr>
                                <td width="5%" height="28">
                                </td>
                                <td width="60%" style="font-family: Arial, Helvetica, sans-serif; color: #171717;
                                    font-size: 14px; font-weight: bold; text-shadow: 1px 1px #5F5F5F; background-color: #4B4B4B;
                                    padding-left: 5px;" colspan="2" align="left">
                                    Existing User? - Please Login
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td align="left" style="font-family: Arial, Helvetica, sans-serif; color: #1D1D1D;
                                    font-size: 14px; font-weight: bold; text-shadow: 1px 1px #5F5F5F; border-bottom: 1px solid #1d1d1d;
                                    box-shadow: 0px 1px #5f5f5f" colspan="2">
                                    Log In
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                </td>
                                <td style="font-family: Arial, Helvetica, sans-serif; color: #1D1D1D; font-size: 13px;
                                    font-weight: bold; text-shadow: 1px 1px #5F5F5F;" class="style2">
                                </td>
                                <td align="left" class="style1">
                                    &nbsp;
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                </td>
                                <td style="font-family: Arial, Helvetica, sans-serif; color: #1D1D1D; font-size: 13px;
                                    font-weight: bold; text-shadow: 1px 1px #5F5F5F;" class="style2">
                                    User Name
                                </td>
                                <td align="left" class="style1">
                                    <asp:TextBox ID="txtUserName" runat="server" CssClass="inputText"></asp:TextBox>
                                    &nbsp;<asp:RequiredFieldValidator ID="reqFldUserID" runat="server" ControlToValidate="txtUserName"
                                        ErrorMessage="*" ValidationGroup="LoginGrp"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                </td>
                                <td style="font-family: Arial, Helvetica, sans-serif; color: #1D1D1D; font-size: 13px;
                                    font-weight: bold; text-shadow: 1px 1px #5F5F5F;" class="style2">
                                    Password
                                </td>
                                <td align="left" class="style1">
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="inputText" TextMode="Password"
                                        Width="200px"></asp:TextBox>
                                    &nbsp;<asp:RequiredFieldValidator ID="reqFldPassword" runat="server" ControlToValidate="txtPassword"
                                        ErrorMessage="*" ValidationGroup="LoginGrp"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td class="style2">
                                    &nbsp;
                                </td>
                                <td align="left" class="style1">
                                    <asp:Label ID="FailureText" runat="server" Font-Bold="true" Font-Names="Arial" Font-Size="7"
                                        ForeColor="#cc3300" SkinID="lblNoEffect" Text=""></asp:Label>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td class="style2">
                                    &nbsp;
                                </td>
                                <td align="left" class="style1">
                                    <asp:Button ID="btnLogin" runat="server" CssClass="loginButton" Text="Login" ValidationGroup="LoginGrp"
                                        Width="200px" />
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td class="style2">
                                    &nbsp;
                                </td>
                                <td align="left" class="style1">
                                    &nbsp;
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td class="style2">
                                    &nbsp;
                                </td>
                                <td align="left">
                                    <%--<a id="A1" runat="server" class="LinkText" href="frmRegisterUser.aspx">New User ? Create
                                        Your ID</a>--%>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td class="style2">
                                    &nbsp;
                                </td>
                                <td align="left">
                                   <%-- <a id="fPassword" runat="server" class="LinkText" href="frmForgotPassword.aspx">Forgot
                                        UserID Or Password?</a>--%>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td align="left">
                                   <%-- <a id="ContactUsInitially" runat="server" class="LinkText" href="frmHRMContactUsInitial.aspx">
                                        Contact Us </a>--%>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td class="style2">
                                    &nbsp;
                                </td>
                                <td align="left" class="style1">
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td class="style2">
                                </td>
                                <td align="left" class="style1">
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td class="style2">
                                </td>
                                <td align="left" class="style1">
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td class="style2">
                                </td>
                                <td align="left" class="style1">
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr align="center">
                <td align="center" colspan="2" style="background-color:Green">
                    <div style="font-family: Verdana; width:100%; font-size: 14px; color: White; float: left; align: center">
                        <marquee scrollamount="5" width="40">&lt;&lt;&lt;</marquee>
                        For better visual experience use update version of FireFox/Chrome<marquee scrollamount="5"
                            direction="right" width="40">&gt;&gt;&gt;</marquee>
                    </div>
                </td>
            </tr>
            <tr style="height: 100%">
                <td colspan="2" align="center">
                    <div style="width: 100%; height: 88px; background-color: #666; border-top: 2px solid #1E1E1E;
                        bottom: 75px; color: #333; font-size: 13pt; text-align: center; padding-top: 15px;
                        left: 12px;">
                        This is developed by development department of United Finance.
                    </div>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
