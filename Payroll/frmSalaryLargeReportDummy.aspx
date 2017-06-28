<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmSalaryLargeReportDummy.aspx.vb" Inherits="Payroll_frmSalaryLargeReportDummy"
    Title=".:HRS:Salary Large Report:." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlSalaryLargeReportParam" runat="server" Width="70%" 
                    SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="5">
                                <div class="widget-title">
                                    Salary Large Report Generation</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
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
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                <asp:CheckBox ID="chkWithFestivalBonus" runat="server" CssClass="chkText" 
                                    Text="With Festival Bonus" />
                            </td>
                            <td>
                                <asp:CheckBox ID="chkWithPerformanceBonus" runat="server" CssClass="chkText" 
                                    Text="With Performance Bonus" />
                            </td>
                            <td class="label">
                                <asp:Button ID="btnShowReport" runat="server" CssClass="styled-button-1" 
                                    Text="Show Report" />
                            </td>
                            <td>
                                <asp:ImageButton ID="imgBtnExport" runat="server" 
                                    ImageUrl="~/Sources/images/excel2.jpg" Width="30px" />
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlResultSet" runat="server" SkinID="pnlInner" Width="100%">
                    <div style="max-width: 1000px; max-height: 500px; overflow: auto">
                        <asp:GridView ID="grdSalLargeReport" runat="server" CssClass="mGrid">
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
