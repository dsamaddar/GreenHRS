<%@ Page Language="VB" MasterPageFile="~/Frame.master" AutoEventWireup="false" CodeFile="Login.aspx.vb"
    Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />

    <asp:Login ID="Login1" runat="server" FailureText="Failed to Login" Width="100%">
        <LayoutTemplate>
            <table width="100%" border="0">
                <tr >
                    <td align="center">
                        <table height="400px">
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="332">
                                                <%--<img src="../img/LoginTop.jpg" border="0" width="332" height="61" alt="">--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="332">
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td width="332">
                                                <asp:Panel ID="pnlLogin" runat="server" Width="400px">
                                                    <table style="width:100%;">
                                                        <tr>
                                                            <td>
                                                                &nbsp;</td>
                                                            <td>
                                                                &nbsp;</td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" >
                                                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Verdana" 
                                                                    Font-Size="13pt" ForeColor="#7F7F7F" SkinID="lblNoEffect" Text="User ID"></asp:Label>
                                                            </td>
                                                            <td align="left">
                                                                <asp:TextBox ID="UserName" runat="server" Font-Names="Verdana" Font-Size="15pt" 
                                                                    SkinID="txtNoEffect" Width="200px" CssClass="InputTxtBox" Height="30px"></asp:TextBox>
                                                                &nbsp;<asp:RequiredFieldValidator ID="reqFldUserID" runat="server" 
                                                                    ControlToValidate="UserName" ErrorMessage="*" ValidationGroup="LoginGrp"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Verdana" 
                                                                    Font-Size="13pt" ForeColor="#7F7F7F" SkinID="lblNoEffect" Text="Password"></asp:Label>
                                                            </td>
                                                            <td align="left">
                                                                <asp:TextBox ID="Password" runat="server" Font-Size="15pt" TextMode="Password" 
                                                                    Width="200px" CssClass="InputTxtBox" Font-Names="Verdana" 
                                                                    Font-Strikeout="False" Height="30px"></asp:TextBox>
                                                                &nbsp;<asp:RequiredFieldValidator ID="reqFldPassword" runat="server" 
                                                                    ErrorMessage="*" ControlToValidate="Password" ValidationGroup="LoginGrp"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;</td>
                                                            <td align="left">
                                                                <asp:Label ID="FailureText" runat="server" Font-Bold="true" Font-Names="Arial" 
                                                                    Font-Size="7" ForeColor="#cc3300" SkinID="lblNoEffect" Text=""></asp:Label>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                            </td>
                                                            <td align="left">
                                                                <asp:ImageButton ID="Button1" runat="server" CommandName="Login" 
                                                                    ImageUrl="~/Sources/images/login.jpg" OnClick="Button1_Click" 
                                                                    Width="100px" ValidationGroup="LoginGrp" />
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;</td>
                                                            <td align="left"><a id="A1" href="frmRegisterUser.aspx" runat="server">New User ?</a></td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        <tr width="332">
                                            <td align="center">
                                                <table cellpadding="0" cellspacing="0" border="0">
                                                    <tr>
                                                        <td style="padding-left: 40">
                                                            &nbsp;</td>
                                                        <td rowspan="7" align="center" width="100px">
                                                            <%--<asp:Image ID="Image2" runat="server" ImageUrl="~/img/icon.gif" />--%><br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 40">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 40">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 40">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-left: 40">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
        <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
    </asp:Login>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
