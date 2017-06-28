<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmGenerateExternalTA.aspx.vb" Inherits="Payroll_frmGenerateExternalTA"
    Title=".:HRS:Generate External TA:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlGenExternalTA" runat="server" Width="80%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="6">
                                <div class="widget-title">
                                    Generate Transport Allowance<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 200px">
                                &nbsp;
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Salary Year
                            </td>
                            <td>
                                <asp:DropDownList ID="drpSalaryYear" runat="server" CssClass="InputTxtBox" Width="100px">
                                    <asp:ListItem Value="2007" Text="2007"></asp:ListItem>
                                    <asp:ListItem Value="2008" Text="2008"></asp:ListItem>
                                    <asp:ListItem Value="2009" Text="2009"></asp:ListItem>
                                    <asp:ListItem Value="2010" Text="2010"></asp:ListItem>
                                    <asp:ListItem Value="2011" Text="2011"></asp:ListItem>
                                    <asp:ListItem Value="2012" Text="2012"></asp:ListItem>
                                    <asp:ListItem Value="2013" Text="2013"></asp:ListItem>
                                    <asp:ListItem Value="2014" Text="2014"></asp:ListItem>
                                    <asp:ListItem Value="2015" Text="2015"></asp:ListItem>
                                    <asp:ListItem Value="2016" Text="2016"></asp:ListItem>
                                    <asp:ListItem Value="2017" Text="2017"></asp:ListItem>
                                    <asp:ListItem Value="2018" Text="2018"></asp:ListItem>
                                    <asp:ListItem Value="2019" Text="2019"></asp:ListItem>
                                    <asp:ListItem Value="2020" Text="2020"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Salary Month
                            </td>
                            <td>
                                <asp:DropDownList ID="drpSalaryMonth" runat="server" CssClass="InputTxtBox" Width="100px">
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
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Format</td>
                            <td>
                                &nbsp;</td>
                            <td>
                            </td>
                            <td class="label">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpReportFormat" runat="server">
                                    <asp:ListItem Text="RichText" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="WordForWindows" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="Excel" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="PorttableDocFormat" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="ExcelRecord" Value="8"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Button ID="btnDetailsCalculation" runat="server" 
                                    CssClass="styled-button-1" Text="Detail Calculation" />
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnTransferSummary" runat="server" CssClass="styled-button-1" 
                                    Text="Transfer Summary" />
                            </td>
                            <td>
                                <asp:Button ID="btnFundTransferLetter" runat="server" 
                                    CssClass="styled-button-1" Text="Fund Transfer Report" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlEmpListToSelect" runat="server" Width="80%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td align="left" >
                                <div style="max-height: 300px; max-width: 400px; overflow: auto">
                                    <asp:CheckBox ID="chkSelectAllEmployees" runat="server" AutoPostBack="True"
                                        Text="Select All" CssClass="chkText" />
                                    <asp:CheckBoxList ID="chkEmpList" runat="server" CssClass="label">
                                    </asp:CheckBoxList>
                                </div>
                            </td>
                            <td align="left" >
                               <asp:Button ID="btnCheckAll" runat="server" CssClass="styled-button-1" Text="Check All" />
                                &nbsp;<asp:Button ID="btnProcessTA" runat="server" Text="Process" CssClass="styled-button-1" />
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        </table>
</asp:Content>
