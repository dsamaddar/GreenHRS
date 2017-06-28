<%@ Page Language="VB" Theme="CommonSkin" AutoEventWireup="false" CodeFile="frmRegisterUser.aspx.vb"
    Inherits="frmRegisterUser" Title=".:HRM : Register User:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>:HRM:Int. Registration:</title>
    <link href="Sources/css/Frontstyle.css" rel="stylesheet" type="text/css" />
    <link href="Sources/css/ValidatorStyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .protected
        {
            -moz-user-select: none;
            -webkit-user-select: none;
            user-select: none;
        }
        p.MsoNormal
        {
            margin-bottom: .0001pt;
            font-size: 10.0pt;
            font-family: "Trebuchet MS" , "sans-serif";
            margin-left: 0in;
            margin-right: 0in;
            margin-top: 0in;
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

        function DisableCopyPaste() {
            alert('This functionality has been disabled !');
            window.clipboardData.clearData('Text'); //for cleaning up the clipboard
            // Cancel default behavior
            event.returnValue = false;
        }

    </script>

    <script language="javascript" type="text/javascript">
        window.history.forward(1);

        document.oncontextmenu = function() { // Use document as opposed to window for IE8 compatibility
            alert("This Function Is Not Allowed In ULC JOB Application Process.")
            return false;
        };
    </script>

</head>
<body onkeydown="onKeyDown()">
    <form id="form1" runat="server">
    <div>
        <table style="width: 100%;" class="protected">
            <tr align="center">
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr align="center">
                <td align="left">
                    <div id="wrap">
                        <div id="top">
                        </div>
                        <div id="content">
                            <div class="header">
                                <h1>
                                    <a href="#">User Registration Panel</a>
                                </h1>
                                <h2>
                                </h2>
                            </div>
                            <div class="breadcrumbs">
                                <a href="frmHRMLogin.aspx">Login Panel</a>
                            </div>
                            <div class="middle">
                                <h2>
                                    Provide Registration Information</h2>
                                <asp:Panel ID="pnlRegistrationInstruction" runat="server" Width="800px" SkinID="pnlInner">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                                </asp:ScriptManager>
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
                                                <asp:Label ID="lblRegistrationInstrcution" runat="server" ForeColor="Black" Font-Bold="True"
                                                    Font-Italic="True" Font-Size="13pt"></asp:Label>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr align="center">
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/frmHRMLogin.aspx" Style="font-size: 15px;
                                                    font-family: Verdana; font-weight: bold; color: Blue">[Login]</asp:HyperLink>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Panel ID="pnlRegisterUser" runat="server" Width="800px" SkinID="pnlInner">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td style="width: 20px">
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                &nbsp;
                                            </td>
                                            <td align="left" class="label" style="width: 150px">
                                                Your Name
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtUserName" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                &nbsp;<asp:RequiredFieldValidator ID="reqFldUserName" runat="server" ControlToValidate="txtUserName"
                                                    ErrorMessage="User Name Required" ValidationGroup="Register" Display="None"></asp:RequiredFieldValidator>
                                                <cc1:ValidatorCalloutExtender ID="reqFldUserName_ValidatorCalloutExtender" runat="server"
                                                    Enabled="True" TargetControlID="reqFldUserName" CssClass="customCalloutStyle"
                                                    CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png"></cc1:ValidatorCalloutExtender>
                                                &nbsp;<asp:RegularExpressionValidator ID="regExpUserName" runat="server" ControlToValidate="txtUserName"
                                                    Display="None" ErrorMessage="Validates a name. Allows up to 40 uppercase and lowercase characters and a few special characters that are common to some names."
                                                    ValidationExpression="^[a-zA-Z''-'\s-.]{1,40}$" ValidationGroup="Register"></asp:RegularExpressionValidator>
                                                <cc1:ValidatorCalloutExtender ID="regExpUserName_ValidatorCalloutExtender" runat="server"
                                                    Enabled="True" TargetControlID="regExpUserName" CssClass="customCalloutStyle"
                                                    CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png"></cc1:ValidatorCalloutExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="font-size: 15px; font-family: Verdana; font-weight: bold">
                                                &nbsp;
                                            </td>
                                            <td align="left" class="label">
                                                User ID
                                            </td>
                                            <td align="left" class="label">
                                                <asp:TextBox ID="txtUserID" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                                    Width="200px"></asp:TextBox>
                                                &nbsp;<asp:RequiredFieldValidator ID="reqFldUserID" runat="server" ControlToValidate="txtUserID"
                                                    ErrorMessage="User ID Required" ValidationGroup="Register" Display="None"></asp:RequiredFieldValidator>
                                                <cc1:ValidatorCalloutExtender ID="reqFldUserID_ValidatorCalloutExtender" runat="server"
                                                    Enabled="True" TargetControlID="reqFldUserID" CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png"
                                                    WarningIconImageUrl="~/Sources/images/Valwarning.png"></cc1:ValidatorCalloutExtender>
                                                &nbsp;[ min 6 and max 15 characters &amp; avoid blank spaces]
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="label">
                                                &nbsp;
                                            </td>
                                            <td align="left" class="label">
                                                Password
                                            </td>
                                            <td align="left" class="label">
                                                <asp:TextBox ID="txtPassword" runat="server" CssClass="InputTxtBox" TextMode="Password"
                                                    Width="200px" onkeydown="onKeyDown()"></asp:TextBox>
                                                &nbsp;<asp:RequiredFieldValidator ID="reqFldPassword" runat="server" ControlToValidate="txtPassword"
                                                    ErrorMessage="Password Required" ValidationGroup="Register" Display="None"></asp:RequiredFieldValidator>
                                                <cc1:ValidatorCalloutExtender ID="reqFldPassword_ValidatorCalloutExtender" runat="server"
                                                    Enabled="True" TargetControlID="reqFldPassword" CssClass="customCalloutStyle"
                                                    CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png"></cc1:ValidatorCalloutExtender>
                                                &nbsp;[ min 6 and max 15 characters &amp; avoid blank spaces]
                                                <asp:RegularExpressionValidator ID="regExpPassword" runat="server" ControlToValidate="txtPassword"
                                                    Display="None" ErrorMessage="Validates a strong password. It must be between 6 and 15 characters, contain at least one digit and one alphabetic character, and must not contain special characters."
                                                    ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{6,15})$" ValidationGroup="Register"></asp:RegularExpressionValidator>
                                                <cc1:ValidatorCalloutExtender ID="regExpPassword_ValidatorCalloutExtender" runat="server"
                                                    Enabled="True" TargetControlID="regExpPassword" CssClass="customCalloutStyle"
                                                    CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png"></cc1:ValidatorCalloutExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                            </td>
                                            <td align="left" class="label">
                                                Confirm Password
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="InputTxtBox" TextMode="Password"
                                                    Width="200px" onkeydown="onKeyDown()"></asp:TextBox>
                                                &nbsp;<asp:RequiredFieldValidator ID="reqFldConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword"
                                                    ErrorMessage="Confirm Password Required" ValidationGroup="Register" Display="None"></asp:RequiredFieldValidator>
                                                <cc1:ValidatorCalloutExtender ID="reqFldConfirmPassword_ValidatorCalloutExtender"
                                                    runat="server" Enabled="True" TargetControlID="reqFldConfirmPassword" CssClass="customCalloutStyle"
                                                    CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png"></cc1:ValidatorCalloutExtender>
                                                &nbsp;<asp:RegularExpressionValidator ID="regExpConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword"
                                                    Display="None" ErrorMessage="Validates a strong password. It must be between 6 and 15 characters, contain at least one digit and one alphabetic character, and must not contain special characters."
                                                    ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{6,15})$" ValidationGroup="Register"></asp:RegularExpressionValidator>
                                                <cc1:ValidatorCalloutExtender ID="regExpConfirmPassword_ValidatorCalloutExtender"
                                                    runat="server" Enabled="True" TargetControlID="regExpConfirmPassword" CssClass="customCalloutStyle"
                                                    CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png"></cc1:ValidatorCalloutExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td align="left" class="label">
                                                E-Mail
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtEMail" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                &nbsp;<asp:RequiredFieldValidator ID="reqFldEmail" runat="server" ControlToValidate="txtEMail"
                                                    ErrorMessage="E-Mail Required" ValidationGroup="Register" Display="None"></asp:RequiredFieldValidator>
                                                <cc1:ValidatorCalloutExtender ID="reqFldEmail_ValidatorCalloutExtender" runat="server"
                                                    Enabled="True" TargetControlID="reqFldEmail" CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png"
                                                    WarningIconImageUrl="~/Sources/images/Valwarning.png"></cc1:ValidatorCalloutExtender>
                                                &nbsp;<asp:RegularExpressionValidator ID="regExpEmailAddress" runat="server" ControlToValidate="txtEMail"
                                                    ErrorMessage="Input Correct E-mail Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                    ValidationGroup="Register" Display="None"></asp:RegularExpressionValidator>
                                                <cc1:ValidatorCalloutExtender ID="regExpEmailAddress_ValidatorCalloutExtender" runat="server"
                                                    Enabled="True" TargetControlID="regExpEmailAddress" CssClass="customCalloutStyle"
                                                    CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png"></cc1:ValidatorCalloutExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="label">
                                                &nbsp;
                                            </td>
                                            <td align="left" class="label">
                                                Date Of Birth
                                            </td>
                                            <td align="left">
                                                <asp:DropDownList ID="drpMonth" runat="server" CssClass="InputTxtBox" Width="70px"
                                                    Font-Bold="False" Font-Names="verdana">
                                                    <asp:ListItem Value="MM" Text="MM"></asp:ListItem>
                                                    <asp:ListItem Value="1" Text="January"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="February"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="March"></asp:ListItem>
                                                    <asp:ListItem Value="4" Text="April"></asp:ListItem>
                                                    <asp:ListItem Value="5" Text="May"></asp:ListItem>
                                                    <asp:ListItem Value="6" Text="June"></asp:ListItem>
                                                    <asp:ListItem Value="7" Text="July"></asp:ListItem>
                                                    <asp:ListItem Value="8" Text="August"></asp:ListItem>
                                                    <asp:ListItem Value="9" Text="September"></asp:ListItem>
                                                    <asp:ListItem Value="10" Text="October"></asp:ListItem>
                                                    <asp:ListItem Value="11" Text="November"></asp:ListItem>
                                                    <asp:ListItem Value="12" Text="December"></asp:ListItem>
                                                </asp:DropDownList>
                                                &nbsp;<asp:DropDownList ID="drpDay" runat="server" CssClass="InputTxtBox" Width="50px"
                                                    Font-Bold="False" Font-Names="Verdana">
                                                    <asp:ListItem Value="DD" Text="DD"></asp:ListItem>
                                                    <asp:ListItem Value="1" Text="1"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="2"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="3"></asp:ListItem>
                                                    <asp:ListItem Value="4" Text="4"></asp:ListItem>
                                                    <asp:ListItem Value="5" Text="5"></asp:ListItem>
                                                    <asp:ListItem Value="6" Text="6"></asp:ListItem>
                                                    <asp:ListItem Value="7" Text="7"></asp:ListItem>
                                                    <asp:ListItem Value="8" Text="8"></asp:ListItem>
                                                    <asp:ListItem Value="9" Text="9"></asp:ListItem>
                                                    <asp:ListItem Value="10" Text="10"></asp:ListItem>
                                                    <asp:ListItem Value="11" Text="11"></asp:ListItem>
                                                    <asp:ListItem Value="12" Text="12"></asp:ListItem>
                                                    <asp:ListItem Value="13" Text="13"></asp:ListItem>
                                                    <asp:ListItem Value="14" Text="14"></asp:ListItem>
                                                    <asp:ListItem Value="15" Text="15"></asp:ListItem>
                                                    <asp:ListItem Value="16" Text="16"></asp:ListItem>
                                                    <asp:ListItem Value="17" Text="17"></asp:ListItem>
                                                    <asp:ListItem Value="18" Text="18"></asp:ListItem>
                                                    <asp:ListItem Value="19" Text="19"></asp:ListItem>
                                                    <asp:ListItem Value="20" Text="20"></asp:ListItem>
                                                    <asp:ListItem Value="21" Text="21"></asp:ListItem>
                                                    <asp:ListItem Value="22" Text="22"></asp:ListItem>
                                                    <asp:ListItem Value="23" Text="23"></asp:ListItem>
                                                    <asp:ListItem Value="24" Text="24"></asp:ListItem>
                                                    <asp:ListItem Value="25" Text="25"></asp:ListItem>
                                                    <asp:ListItem Value="26" Text="26"></asp:ListItem>
                                                    <asp:ListItem Value="27" Text="27"></asp:ListItem>
                                                    <asp:ListItem Value="28" Text="28"></asp:ListItem>
                                                    <asp:ListItem Value="29" Text="29"></asp:ListItem>
                                                    <asp:ListItem Value="30" Text="30"></asp:ListItem>
                                                    <asp:ListItem Value="31" Text="31"></asp:ListItem>
                                                </asp:DropDownList>
                                                &nbsp;<asp:DropDownList ID="drpYear" runat="server" CssClass="InputTxtBox" Width="70px"
                                                    Font-Bold="False" Font-Names="Verdana">
                                                    <asp:ListItem Value="YYYY" Text="YYYY"></asp:ListItem>
                                                    <asp:ListItem Value="1960" Text="1960"></asp:ListItem>
                                                    <asp:ListItem Value="1961" Text="1961"></asp:ListItem>
                                                    <asp:ListItem Value="1962" Text="1962"></asp:ListItem>
                                                    <asp:ListItem Value="1963" Text="1963"></asp:ListItem>
                                                    <asp:ListItem Value="1964" Text="1964"></asp:ListItem>
                                                    <asp:ListItem Value="1965" Text="1965"></asp:ListItem>
                                                    <asp:ListItem Value="1966" Text="1966"></asp:ListItem>
                                                    <asp:ListItem Value="1967" Text="1967"></asp:ListItem>
                                                    <asp:ListItem Value="1968" Text="1968"></asp:ListItem>
                                                    <asp:ListItem Value="1969" Text="1969"></asp:ListItem>
                                                    <asp:ListItem Value="1970" Text="1970"></asp:ListItem>
                                                    <asp:ListItem Value="1971" Text="1971"></asp:ListItem>
                                                    <asp:ListItem Value="1972" Text="1972"></asp:ListItem>
                                                    <asp:ListItem Value="1973" Text="1973"></asp:ListItem>
                                                    <asp:ListItem Value="1974" Text="1974"></asp:ListItem>
                                                    <asp:ListItem Value="1975" Text="1975"></asp:ListItem>
                                                    <asp:ListItem Value="1976" Text="1976"></asp:ListItem>
                                                    <asp:ListItem Value="1977" Text="1977"></asp:ListItem>
                                                    <asp:ListItem Value="1978" Text="1978"></asp:ListItem>
                                                    <asp:ListItem Value="1979" Text="1979"></asp:ListItem>
                                                    <asp:ListItem Value="1980" Text="1980"></asp:ListItem>
                                                    <asp:ListItem Value="1981" Text="1981"></asp:ListItem>
                                                    <asp:ListItem Value="1982" Text="1982"></asp:ListItem>
                                                    <asp:ListItem Value="1983" Text="1983"></asp:ListItem>
                                                    <asp:ListItem Value="1984" Text="1984"></asp:ListItem>
                                                    <asp:ListItem Value="1985" Text="1985"></asp:ListItem>
                                                    <asp:ListItem Value="1986" Text="1986"></asp:ListItem>
                                                    <asp:ListItem Value="1987" Text="1987"></asp:ListItem>
                                                    <asp:ListItem Value="1988" Text="1988"></asp:ListItem>
                                                    <asp:ListItem Value="1989" Text="1989"></asp:ListItem>
                                                    <asp:ListItem Value="1990" Text="1990"></asp:ListItem>
                                                    <asp:ListItem Value="1991" Text="1991"></asp:ListItem>
                                                    <asp:ListItem Value="1992" Text="1992"></asp:ListItem>
                                                    <asp:ListItem Value="1993" Text="1993"></asp:ListItem>
                                                    <asp:ListItem Value="1994" Text="1994"></asp:ListItem>
                                                    <asp:ListItem Value="1995" Text="1995"></asp:ListItem>
                                                    <asp:ListItem Value="1996" Text="1996"></asp:ListItem>
                                                    <asp:ListItem Value="1997" Text="1997"></asp:ListItem>
                                                    <asp:ListItem Value="1998" Text="1998"></asp:ListItem>
                                                    <asp:ListItem Value="1999" Text="1999"></asp:ListItem>
                                                    <asp:ListItem Value="2000" Text="2000"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr align="left">
                                            <td>
                                            </td>
                                            <td class="label">
                                                Mobile Number
                                            </td>
                                            <td align="left" class="label">
                                                <asp:TextBox ID="txtMobileNumberPrefix" runat="server" CssClass="InputTxtBox" Enabled="False"
                                                    EnableTheming="True" Width="30px">+88</asp:TextBox>
                                                &nbsp;&nbsp;<asp:TextBox ID="txtMobileNumber" runat="server" CssClass="InputTxtBox"
                                                    Width="150px"></asp:TextBox>
                                                &nbsp;e.g. 01730000007&nbsp;<asp:RequiredFieldValidator ID="reqFldMobileNumber" runat="server"
                                                    ControlToValidate="txtMobileNumber" ErrorMessage="Mobile Number Required" ValidationGroup="Register"
                                                    Display="None"></asp:RequiredFieldValidator>
                                                <cc1:ValidatorCalloutExtender ID="reqFldMobileNumber_ValidatorCalloutExtender" runat="server"
                                                    Enabled="True" TargetControlID="reqFldMobileNumber" CssClass="customCalloutStyle"
                                                    CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png"></cc1:ValidatorCalloutExtender>
                                                <asp:RegularExpressionValidator ID="regExpMobileNumber" runat="server" ControlToValidate="txtMobileNumber"
                                                    ErrorMessage="Invalid [Only Numeric Value]" ValidationExpression="^([0-9]*)$"
                                                    ValidationGroup="Register"></asp:RegularExpressionValidator>
                                                <cc1:ValidatorCalloutExtender ID="regExpMobileNumber_ValidatorCalloutExtender" runat="server"
                                                    Enabled="True" TargetControlID="regExpMobileNumber" CssClass="customCalloutStyle"
                                                    CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png"></cc1:ValidatorCalloutExtender>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr align="left">
                                            <td>
                                            </td>
                                            <td align="left" class="label">
                                                National ID/Birth Reg. No</td>
                                            <td align="left">
                                                <asp:TextBox ID="txtNationalID" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                &nbsp;
                                                <asp:RegularExpressionValidator ID="regExpNationalID" runat="server" ControlToValidate="txtNationalID"
                                                    ErrorMessage="Invalid [Only Numeric Value &amp; Can't Start With 0]" ValidationExpression="^([0-9]*)$"
                                                    ValidationGroup="Register" Display="None"></asp:RegularExpressionValidator>
                                                <cc1:ValidatorCalloutExtender ID="regExpNationalID_ValidatorCalloutExtender" runat="server"
                                                    Enabled="True" TargetControlID="regExpNationalID" CssClass="customCalloutStyle"
                                                    CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png"></cc1:ValidatorCalloutExtender>
                                                <asp:RequiredFieldValidator ID="reqFldNationalID" runat="server" ControlToValidate="txtNationalID"
                                                    Display="None" ErrorMessage="Requied: National ID" ValidationGroup="Register"></asp:RequiredFieldValidator>
                                                <cc1:ValidatorCalloutExtender ID="reqFldNationalID_ValidatorCalloutExtender" runat="server"
                                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                                    TargetControlID="reqFldNationalID" WarningIconImageUrl="~/Sources/images/Valwarning.png"></cc1:ValidatorCalloutExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="label">
                                            </td>
                                            <td align="left" class="label">
                                                &nbsp;
                                            </td>
                                            <td align="left">
                                                <asp:Image ID="imgValidation" runat="server" Height="45px" Width="200px" />
                                                &nbsp;&nbsp;<asp:ImageButton ID="imgBtnRefreshCode" runat="server" ImageUrl="~/Sources/images/refresh_code.gif"
                                                    ToolTip="Try Another Code" />
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td align="left" class="label">
                                                Type The Code Shown
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtImageCode" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                &nbsp;<asp:RequiredFieldValidator ID="reqFldImageValidation" runat="server" ControlToValidate="txtImageCode"
                                                    ErrorMessage="Type The Code Shown" ValidationGroup="Register" Display="None"></asp:RequiredFieldValidator>
                                                <cc1:ValidatorCalloutExtender ID="reqFldImageValidation_ValidatorCalloutExtender"
                                                    runat="server" Enabled="True" TargetControlID="reqFldImageValidation" CssClass="customCalloutStyle"
                                                    CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png"></cc1:ValidatorCalloutExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td align="left">
                                                <asp:Button ID="btnRegister" runat="server" CssClass="styled-button-1" Text="Register"
                                                    ValidationGroup="Register" />
                                                &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" Text="Cancel" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td colspan="2" align="left" style="color: Red">
                                                <p class="MsoNormal">
                                                    [All fields are mandatory]</p>
                                                <p class="MsoNormal">
                                                    Please provide correct information. Any wrong information will dismiss your application
                                                    during recruitment process.
                                                </p>
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
            <tr align="center">
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr align="center">
                <td>
                </td>
            </tr>
            <tr align="center">
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
