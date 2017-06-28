<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmReleaseAuthorizationGA.aspx.vb" Inherits="Payroll_frmReleaseAuthorizationGA"
    Title=".:HRS:Release Authorization GA:." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlListResignedEmp" runat="server" Width="60%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="4">
                                <div class="widget-title">
                                    Release Authorization Report General Admin</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Select Resigned Employee
                            </td>
                            <td>
                                <asp:DropDownList ID="drpResignedEmpList" runat="server" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Report Format
                            </td>
                            <td>
                                <asp:DropDownList ID="drpReportFormat" runat="server" CssClass="inputtxtbox">
                                    <asp:ListItem Text="RichText" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="WordForWindows" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="Excel" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="PorttableDocFormat" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="ExcelRecord" Value="8"></asp:ListItem>
                                </asp:DropDownList>
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
                                <asp:Button ID="btnExportReport" runat="server" CssClass="styled-button-1" Text="Export" />
                                &nbsp;<asp:Button ID="btnPFStatement" runat="server" CssClass="styled-button-1" 
                                    Text="PF Statement" />
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
