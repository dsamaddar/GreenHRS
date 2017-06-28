<%@ Page Language="VB" Theme="CommonSkin" AutoEventWireup="false" CodeFile="frmHRMContactUsInitial.aspx.vb"
    Inherits="frmHRMContactUsInitial" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <style type="text/css">
        .clabel
        {
            font: 13px/160% Trebuchet MS,Arial,Helvetica,Sans-Serif;
            font-weight: bold;
            color: rgb(51, 51, 51);
            text-align: center;
        }
        .hlabel
        {
            font: 15pt/160% Trebuchet MS,Arial,Helvetica,Sans-Serif;
            font-weight: bold;
            color: rgb(51, 51, 51);
            text-align: center;
        }
    </style>
    <link href="Sources/css/Frontstyle.css" rel="stylesheet" type="text/css" />
    <link href="Sources/css/ValidatorStyle.css" rel="stylesheet" type="text/css" />

    <script src="Sources/js/jquery.min.js" type="text/javascript"></script>

    <script src="Sources/js/MaxLength.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            //Specifying the Character Count control explicitly
            $("[id*=txtMessage]").MaxLength(
            {
                MaxLength: 300,
                CharacterCountControl: $('#counter')
            });
        });
    </script>

</head>
<body>
    <form id="frmContactUsInitialDS" runat="server">
    <table style="width: 100%;">
        <tr align="center">
            <td style="width: 50px">
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
                                Contact Us<a href="#"> Panel</a>
                            </h1>
                            <h2>
                            </h2>
                        </div>
                        <div class="breadcrumbs">
                            <a href="frmHRMLogin.aspx">Login Panel</a>
                        </div>
                        <div id="middle">
                            <table>
                                <tr>
                                    <td valign="top">
                                        <asp:Panel ID="pnlContactUs" runat="server" BackImageUrl="~/Sources/images/form_bg_contactus.jpg"
                                            Height="390px" SkinID="pnlInner" Width="540px">
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td style="width: 20px">
                                                    </td>
                                                    <td style="width: 200px">
                                                    </td>
                                                    <td style="width: 10px">
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
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
                                                        &nbsp;
                                                    </td>
                                                    <td>
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
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td class="clabel">
                                                        Name<span class="RequiredLabel">*</span>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td class="clabel">
                                                        Message<span class="RequiredLabel">*</span>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtName" runat="server" CssClass="InputTxtBox" TabIndex="1" Width="180px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="reqFldGender" runat="server" ControlToValidate="txtName"
                                                            ErrorMessage="*" ValidationGroup="SubmitCanDef">
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td align="left" colspan="2" rowspan="5" valign="top">
                                                        <div id="counter" style="color: Red; font-family: Verdana">
                                                        </div>
                                                        <asp:TextBox ID="txtMessage" runat="server" CssClass="InputTxtBox" Height="120px"
                                                            TabIndex="5" TextMode="MultiLine" Width="240px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMessage"
                                                            ErrorMessage="*" ValidationGroup="SubmitCanDef">
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td class="clabel">
                                                        E-mail<span class="RequiredLabel">*</span>
                                                    </td>
                                                    <td>
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
                                                    <td align="left">
                                                        <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="InputTxtBox" TabIndex="2"
                                                            Width="180px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmailAddress"
                                                            ErrorMessage="*" ValidationGroup="SubmitCanDef">
                                                        </asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="regExpEmailAddress" runat="server" ControlToValidate="txtEmailAddress"
                                                            ErrorMessage="Rectify" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                            ValidationGroup="SubmitCanDef"></asp:RegularExpressionValidator>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td class="clabel">
                                                        Phone#<span class="RequiredLabel">*</span>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="InputTxtBox" TabIndex="3"
                                                            Width="180px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPhoneNumber"
                                                            ErrorMessage="*" ValidationGroup="SubmitCanDef">
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td align="left" valign="top">
                                                        <asp:Image ID="imgValidation" runat="server" Height="45px" Width="185px" />
                                                    </td>
                                                    <td align="left">
                                                        <asp:ImageButton ID="imgBtnRefreshCode" runat="server" ImageUrl="~/Sources/images/refresh_code.gif"
                                                            ToolTip="Try Another Code" />
                                                    </td>
                                                    <td align="center">
                                                        <asp:ImageButton ID="imgBtnSendMessage" runat="server" ImageUrl="~/Sources/images/form_save.gif"
                                                            TabIndex="5" ValidationGroup="SubmitCanDef" />
                                                    </td>
                                                    <td>
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
                                                    <td class="clabel">
                                                        Enter The Code Above Here<span class="RequiredLabel">*</span>
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
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtImageCode" runat="server" CssClass="InputTxtBox" TabIndex="4"
                                                            Width="180px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtImageCode"
                                                            ErrorMessage="*" ValidationGroup="SubmitCanDef">
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
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
                                                    <td>
                                                    </td>
                                                    <td>
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
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
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
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                    <td valign="top">
                                        <asp:Panel ID="pnlContactInformation" runat="server" BorderWidth="0px" Width="280px">
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>
                                                        <h1 class="hlabel">
                                                            Contact</h1>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="clabel">
                                                        For an immediate consultation, at no charge, by phone or in person.
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <h3 class="hlabel">
                                                            Address</h3>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="clabel">
                                                        Camellia House (Ground Floor) 22 Kazi Nazrul Islam Avenue Dhaka-1000, Bangladesh.
                                                        URL: <a href="http://www.ulc.com.bd" style="color: Green">www.ulc.com.bd</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="clabel">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
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
            <td style="width: 50px">
                &nbsp;
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
