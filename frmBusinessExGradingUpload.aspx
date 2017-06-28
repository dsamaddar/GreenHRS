<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmBusinessExGradingUpload.aspx.vb" Inherits="frmBusinessExGradingUpload"
    Title=".:HRM:Employee Evaluation Upload:." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlEvaluationUploader" runat="server" Width="70%" SkinID="pnlInner">
                    <table style="width: 100%">
                        <tr>
                            <td colspan="4">
                                <div class="widget-title">
                                    Employee Evaluation Upload</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 120px">
                            </td>
                            <td style="width: 150px;">
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 120px">
                                &nbsp;
                            </td>
                            <td style="width: 150px;" class="label">
                                Evaluation Year
                            </td>
                            <td>
                                <asp:DropDownList ID="drpEvaluationYear" runat="server" CssClass="InputTxtBox">
                                    <asp:ListItem>2007</asp:ListItem>
                                    <asp:ListItem>2008</asp:ListItem>
                                    <asp:ListItem>2009</asp:ListItem>
                                    <asp:ListItem>2010</asp:ListItem>
                                    <asp:ListItem>2011</asp:ListItem>
                                    <asp:ListItem>2012</asp:ListItem>
                                    <asp:ListItem>2013</asp:ListItem>
                                    <asp:ListItem>2014</asp:ListItem>
                                    <asp:ListItem>2015</asp:ListItem>
                                    <asp:ListItem>2016</asp:ListItem>
                                    <asp:ListItem>2017</asp:ListItem>
                                    <asp:ListItem>2018</asp:ListItem>
                                    <asp:ListItem>2019</asp:ListItem>
                                    <asp:ListItem>2020</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Select File To Upload
                            </td>
                            <td>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Has Header
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rbHDR" runat="server" RepeatDirection="Horizontal" 
                                    CssClass="rbdText">
                                    <asp:ListItem Selected="True" Text="Yes" Value="Yes">
                                    </asp:ListItem>
                                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnUpload" runat="server" CssClass="styled-button-1" OnClick="btnUpload_Click"
                                    Text="Preview" />
                                &nbsp;<asp:Button ID="btnUploadInformation" runat="server" CssClass="styled-button-1"
                                    Text="Upload" />
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                    <br />
                </asp:Panel>
            </td>
            <td>
            </td>
        </tr>
        <tr align="center">
            <td>
            </td>
            <td>
                <div style="max-height: 500px; max-width: 80%">
                    <asp:GridView ID="grdBusinessExGrad" runat="server" CssClass="mGrid">
                    </asp:GridView>
                </div>
            </td>
            <td>
            </td>
        </tr>
        <tr align="center">
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
