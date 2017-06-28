<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="frmHRMContactUs.aspx.vb" Inherits="frmHRMContactUs" Title=".: HRM::Contact Us :." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
        .InputTxtBox
        {
            background-image: url(Sources/images/form_bg.jpg);
            background-repeat: repeat-x;
            border: 1px solid #B3B3B3;
            height: 24px;
            padding-top: 2px;
            padding-left: 5px;
            padding-bottom: 0px;
            color: #141414;
            font: 13px/160% Trebuchet MS,Arial,Helvetica,Sans-Serif; /*font-family:Cambria,Palatino,"Palatino Linotype","Palatino LT STD",Georgia,serif;*/ /*font-family: Arial, Helvetica, sans-serif;*/
            font-size: 11pt;
            vertical-align: baseline;
            border-radius: 3px;
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
        }
    </style>

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

    <table style="width: 100%;">
        <tr align="center">
            <td style="width: 50px">
                &nbsp;
            </td>
            <td>
            </td>
            <td>
            </td>
            <td style="width: 50px">
                &nbsp;
            </td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td valign="top" align="left">
                <asp:Panel ID="pnlContactInformation" runat="server" Width="450px" BorderWidth="0px">
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
                                URL: <a style="color: Green" href="http://www.ulc.com.bd">www.ulc.com.bd</a>
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
            <td valign="top" align="left">
                <asp:Panel ID="pnlContactUs" runat="server" Height="400px" Width="540px" SkinID="pnlInner"
                    BackImageUrl="~/Sources/images/form_bg_contactus.jpg">
                    <table style="width: 100%;">
                        <tr>
                            <td style="width: 20px">
                                &nbsp;
                            </td>
                            <td style="width: 230px">
                                &nbsp;
                            </td>
                            <td style="width: 10px">
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
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="clabel">
                                Name<span class="RequiredLabel">*</span>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td class="clabel">
                                Message<span class="RequiredLabel">*</span>
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
                                <asp:TextBox ID="txtName" runat="server" CssClass="InputTxtBox" TabIndex="1" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFldGender" runat="server" ControlToValidate="txtName"
                                    ErrorMessage="*" ValidationGroup="SubmitCanDef">
                                </asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;
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
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="InputTxtBox" TabIndex="2"
                                    Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmailAddress"
                                    ErrorMessage="*" ValidationGroup="SubmitCanDef">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regExpEmailAddress" runat="server" ControlToValidate="txtEmailAddress"
                                    ErrorMessage="Rectify" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ValidationGroup="SubmitCanDef"></asp:RegularExpressionValidator>
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
                                Phone#<span class="RequiredLabel">*</span>
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
                                <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="InputTxtBox" TabIndex="3"
                                    Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPhoneNumber"
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
                            <td align="left" valign="top">
                                <asp:Image ID="imgValidation" runat="server" Height="45px" Width="205px" />
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
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtImageCode" runat="server" CssClass="InputTxtBox" TabIndex="4"
                                    Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtImageCode"
                                    ErrorMessage="*" ValidationGroup="SubmitCanDef">
                                </asp:RequiredFieldValidator>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
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
                        </tr>
                    </table>
                </asp:Panel>
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
</asp:Content>
