<%@ Page Language="VB" Theme="CommonSkin" AutoEventWireup="false" CodeFile="frmForgotPassword.aspx.vb"
    Inherits="frmForgotPassword" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>.:HRM:Retrieve Password:.</title>

    <script language="javascript" type="text/javascript">
        window.history.forward(1);

        document.oncontextmenu = function() { // Use document as opposed to window for IE8 compatibility
            alert("This Function Is Not Allowed In ULC JOB Application Process.")
            return false;
        };


        function onKeyDown() {

            // current pressed key
            var pressedKey = String.fromCharCode(event.keyCode).toLowerCase();

            if (event.ctrlKey && (pressedKey == "c" ||
                        pressedKey == "v")) {
                // <strong class="highlight">disable</strong> key press porcessing
                event.returnValue = false;
            }

        } // onKeyDown

        function DisableCopyPaste() {
            alert('This functionality has been disabled !');
            window.clipboardData.clearData('Text'); //for cleaning up the clipboard
            // Cancel default behavior
            event.returnValue = false;
        }

    </script>

    <style type="text/css">
        .protected
        {
            -moz-user-select: none;
            -webkit-user-select: none;
            user-select: none;
        }
        .style1
        {
            height: 16px;
        }
    </style>
    <link href="Sources/css/Frontstyle.css" rel="stylesheet" type="text/css" />
    <link href="Sources/css/ValidatorStyle.css" rel="stylesheet" type="text/css" />
</head>
<body class="protected">
    <form id="form1" runat="server">
    <table style="width: 100%;">
        <tr>
            <td style="height:100px"></td>
        </tr>
        <tr align="center">
            <td align="left">
                <div id="wrap">
                    <div id="top">
                    </div>
                    <div id="content">
                        <div class="header">
                            <h1>
                                <a href="#">Retrieve Credentials Panel</a>
                            </h1>
                            <h2>
                            </h2>
                        </div>
                        <div class="breadcrumbs">
                            <a href="frmHRMLogin.aspx">Login Panel</a>
                        </div>
                        <div class="middle">
                            <h2>
                                Provide Required Information</h2>
                            <asp:Panel ID="pnlMessageForUser" runat="server" Width="800px" SkinID="pnlInner"
                                Visible="false">
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                                            </asp:ScriptManager>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Verdana"
                                                Font-Overline="False" Font-Size="Large"></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:Panel ID="pnlUserIDPasswdRetrieve" runat="server" Width="800px" 
                                SkinID="pnlInner">
                                <table style="width: 100%;">
                                    <tr align="left">
                                        <td style="width: 20px">
                                            &nbsp;
                                        </td>
                                        <td style="width: 300px" class="label">
                                            &nbsp;
                                        </td>
                                        <td style="width: 250px;">
                                            &nbsp;
                                        </td>
                                        <td style="width: 130px">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td style="width: 20px">
                                            &nbsp;
                                        </td>
                                        <td class="label" style="width: 300px">
                                            Please type your Mail/Alternate Mail address
                                        </td>
                                        <td style="width: 250px;">
                                            <asp:TextBox ID="txtMailAddress" runat="server" CssClass="InputTxtBox" Width="230px"></asp:TextBox>
                                        </td>
                                        <td style="width: 20px">
                                            <asp:RequiredFieldValidator ID="reqFldMailAddress" runat="server" ControlToValidate="txtMailAddress"
                                                ErrorMessage="Mail/Alternate Mail address Required" Display="None" ValidationGroup="RetrieveCredential"></asp:RequiredFieldValidator>
                                            <cc1:ValidatorCalloutExtender ID="reqFldMailAddress_ValidatorCalloutExtender" runat="server"
                                                Enabled="True" TargetControlID="reqFldMailAddress" CssClass="customCalloutStyle"
                                                CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                            </cc1:ValidatorCalloutExtender>
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td class="label">
                                            Date of birth
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="drpMonth" runat="server" CssClass="InputTxtBox" Font-Bold="True"
                                                Font-Names="verdana" Width="90px">
                                                <asp:ListItem>MM</asp:ListItem>
                                                <asp:ListItem Value="1">January</asp:ListItem>
                                                <asp:ListItem Value="2">February</asp:ListItem>
                                                <asp:ListItem Value="3">March</asp:ListItem>
                                                <asp:ListItem Value="4">April</asp:ListItem>
                                                <asp:ListItem Value="5">May</asp:ListItem>
                                                <asp:ListItem Value="6">June</asp:ListItem>
                                                <asp:ListItem Value="7">July</asp:ListItem>
                                                <asp:ListItem Value="8">August</asp:ListItem>
                                                <asp:ListItem Value="9">September</asp:ListItem>
                                                <asp:ListItem Value="10">October</asp:ListItem>
                                                <asp:ListItem Value="11">November</asp:ListItem>
                                                <asp:ListItem Value="12">December</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="drpDay" runat="server" CssClass="InputTxtBox" Font-Bold="True"
                                                Font-Names="Verdana" Width="60px">
                                                <asp:ListItem>DD</asp:ListItem>
                                                <asp:ListItem>1</asp:ListItem>
                                                <asp:ListItem>2</asp:ListItem>
                                                <asp:ListItem>3</asp:ListItem>
                                                <asp:ListItem>4</asp:ListItem>
                                                <asp:ListItem>5</asp:ListItem>
                                                <asp:ListItem>6</asp:ListItem>
                                                <asp:ListItem>7</asp:ListItem>
                                                <asp:ListItem>8</asp:ListItem>
                                                <asp:ListItem>9</asp:ListItem>
                                                <asp:ListItem>10</asp:ListItem>
                                                <asp:ListItem>11</asp:ListItem>
                                                <asp:ListItem>12</asp:ListItem>
                                                <asp:ListItem>13</asp:ListItem>
                                                <asp:ListItem>14</asp:ListItem>
                                                <asp:ListItem>15</asp:ListItem>
                                                <asp:ListItem>16</asp:ListItem>
                                                <asp:ListItem>17</asp:ListItem>
                                                <asp:ListItem>18</asp:ListItem>
                                                <asp:ListItem>19</asp:ListItem>
                                                <asp:ListItem>20</asp:ListItem>
                                                <asp:ListItem>21</asp:ListItem>
                                                <asp:ListItem>22</asp:ListItem>
                                                <asp:ListItem>23</asp:ListItem>
                                                <asp:ListItem>24</asp:ListItem>
                                                <asp:ListItem>25</asp:ListItem>
                                                <asp:ListItem>26</asp:ListItem>
                                                <asp:ListItem>27</asp:ListItem>
                                                <asp:ListItem>28</asp:ListItem>
                                                <asp:ListItem>29</asp:ListItem>
                                                <asp:ListItem>30</asp:ListItem>
                                                <asp:ListItem>31</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="drpYear" runat="server" CssClass="InputTxtBox" Font-Bold="True"
                                                Font-Names="Verdana" Width="80px">
                                                <asp:ListItem>YYYY</asp:ListItem>
                                                <asp:ListItem>1960</asp:ListItem>
                                                <asp:ListItem>1961</asp:ListItem>
                                                <asp:ListItem>1962</asp:ListItem>
                                                <asp:ListItem>1963</asp:ListItem>
                                                <asp:ListItem>1964</asp:ListItem>
                                                <asp:ListItem>1965</asp:ListItem>
                                                <asp:ListItem>1966</asp:ListItem>
                                                <asp:ListItem>1967</asp:ListItem>
                                                <asp:ListItem>1968</asp:ListItem>
                                                <asp:ListItem>1969</asp:ListItem>
                                                <asp:ListItem>1970</asp:ListItem>
                                                <asp:ListItem>1971</asp:ListItem>
                                                <asp:ListItem>1972</asp:ListItem>
                                                <asp:ListItem>1973</asp:ListItem>
                                                <asp:ListItem>1974</asp:ListItem>
                                                <asp:ListItem>1975</asp:ListItem>
                                                <asp:ListItem>1976</asp:ListItem>
                                                <asp:ListItem>1977</asp:ListItem>
                                                <asp:ListItem>1978</asp:ListItem>
                                                <asp:ListItem>1979</asp:ListItem>
                                                <asp:ListItem>1980</asp:ListItem>
                                                <asp:ListItem>1981</asp:ListItem>
                                                <asp:ListItem>1982</asp:ListItem>
                                                <asp:ListItem>1983</asp:ListItem>
                                                <asp:ListItem>1984</asp:ListItem>
                                                <asp:ListItem>1985</asp:ListItem>
                                                <asp:ListItem>1986</asp:ListItem>
                                                <asp:ListItem>1987</asp:ListItem>
                                                <asp:ListItem>1988</asp:ListItem>
                                                <asp:ListItem>1989</asp:ListItem>
                                                <asp:ListItem>1990</asp:ListItem>
                                                <asp:ListItem>1991</asp:ListItem>
                                                <asp:ListItem>1992</asp:ListItem>
                                                <asp:ListItem>1993</asp:ListItem>
                                                <asp:ListItem>1994</asp:ListItem>
                                                <asp:ListItem>1995</asp:ListItem>
                                                <asp:ListItem>1996</asp:ListItem>
                                                <asp:ListItem>1997</asp:ListItem>
                                                <asp:ListItem>1998</asp:ListItem>
                                                <asp:ListItem>1999</asp:ListItem>
                                                <asp:ListItem>2000</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td class="label">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Image ID="imgValidation" runat="server" Height="45px" Width="235px" />
                                        </td>
                                        <td>
                                            <asp:ImageButton ID="imgBtnRefreshCode" runat="server" ImageUrl="~/Sources/images/refresh_code.gif"
                                                ToolTip="Try Another Code" />
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td class="label">
                                            Type the code shown
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtValidationCode" runat="server" CssClass="InputTxtBox" Width="230px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="reqFldValidationCode" runat="server" ControlToValidate="txtValidationCode"
                                                ErrorMessage="Type the code shown" Display="None" ValidationGroup="RetrieveCredential"></asp:RequiredFieldValidator>
                                            <cc1:ValidatorCalloutExtender ID="reqFldValidationCode_ValidatorCalloutExtender"
                                                runat="server" TargetControlID="reqFldValidationCode" CloseImageUrl="~/Sources/images/valClose.png"
                                                CssClass="customCalloutStyle" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                            </cc1:ValidatorCalloutExtender>
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:Button ID="btnSubmit" runat="server" CssClass="styled-button-1" Text="Submit"
                                                ValidationGroup="RetrieveCredential" />
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </div>
                        <div id="clear">
                        </div>
                    </div>
                    <div id="bottom">
                    </div>
                </div>
            </td>
        </tr>
        </table>
    </form>
</body>
</html>
