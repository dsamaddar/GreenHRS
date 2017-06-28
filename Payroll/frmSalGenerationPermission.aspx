<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmSalGenerationPermission.aspx.vb" Inherits="Payroll_frmSalGenerationPermission"
    Title=".:HRS:Salary Generation Permission:." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlSalGenPermission" runat="server" Width="600px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="4">
                                <div class="widget-title">
                                    Salary Generation Permission</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 70px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 70px">
                            </td>
                            <td style="width: 150px" class="label">
                                New Employee</td>
                            <td style="width: 200px">
                                <asp:DropDownList ID="drpUserList" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Button ID="btnAddEmpToSalGenPer" runat="server" CssClass="styled-button-1" Text="Add" />
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Select Employee</td>
                            <td>
                                <asp:DropDownList ID="drpEmpList" runat="server" CssClass="InputTxtBox" Width="200px"
                                    AutoPostBack="True">
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
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
            </td>
        </tr>
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlPermittedDesignation" runat="server" Width="600px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td>
                                <div class="widget-title">
                                    Already Permitted</div>
                            </td>
                            <td>
                            </td>
                            <td>
                                <div class="widget-title">
                                    New Permission</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:ListBox ID="lstBxPermittedDesignation" runat="server" Width="250px" Height="250px">
                                </asp:ListBox>
                            </td>
                            <td>
                                <asp:Button ID="btnAdd" runat="server" CssClass="styled-button-1" Text="&lt;&lt;" />
                                <br />
                                <asp:Button ID="btnRemove" runat="server" CssClass="styled-button-1" Text="&gt;&gt;" />
                            </td>
                            <td>
                                <asp:ListBox ID="lstBxYetToAddDesignation" runat="server" Width="250px" Height="250px">
                                </asp:ListBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
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
