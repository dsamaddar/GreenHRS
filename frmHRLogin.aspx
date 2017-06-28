<%@ Page Language="VB" Theme="CommonSkin"  MasterPageFile="~/HRMMaster.master" AutoEventWireup="false" CodeFile="frmHRLogin.aspx.vb" Inherits="frmHRLogin" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr align="center" >
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr  align="center" >
            <td>
                &nbsp;</td>
            <td>
                <asp:Panel ID="pnlUserLogin" runat="server" Width="400px" SkinID="pnlInner">
                    <table style="width:100%;">
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="label" align="left" >
                                UserID</td>
                            <td align="left">
                                <asp:TextBox ID="txtUserID" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="label" align="left">
                                Password</td>
                            <td align="left">
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="InputTxtBox" 
                                    Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left" >
                                <asp:Button ID="btnLogin" runat="server" Text="Login" 
                                    CssClass="styled-button-1" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                                    CssClass="styled-button-1" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left" class="label">
                                New Here ?
                                <asp:HyperLink ID="hpLnkSineUp" runat="server" 
                                    NavigateUrl="~/frmRegisterUser.aspx">Sign Up</asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center" >
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

