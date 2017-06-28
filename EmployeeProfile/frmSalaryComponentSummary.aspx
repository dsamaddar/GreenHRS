<%@ Page Language="VB" MasterPageFile="~/EmployeeProfile/MasterEmpProfile.master"
    Theme="CommonSkin" AutoEventWireup="false" CodeFile="frmSalaryComponentSummary.aspx.vb"
    Inherits="EmployeeProfile_frmSalaryComponentSummary" Title=".:HRM:Salary Component Summary:." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Panel ID="pnlSelectParameters" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="6">
                                <div class="widget-title">
                                    Salary Component Summary Report</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td style="width: 150">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Selary Component
                            </td>
                            <td>
                                <asp:DropDownList ID="drpSalaryComponents" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td class="label">
                                Fiscal Year
                            </td>
                            <td>
                                <asp:DropDownList ID="drpTaxYear" runat="server" CssClass="InputTxtBox" Width="90px">
                                    <asp:ListItem Text="2013-2014" Value="2013-2014"></asp:ListItem>
                                    <asp:ListItem Text="2014-2015" Value="2014-2015"></asp:ListItem>
                                    <asp:ListItem Text="2015-2016" Value="2015-2016"></asp:ListItem>
                                    <asp:ListItem Text="2016-2017" Value="2016-2017"></asp:ListItem>
                                    <asp:ListItem Text="2017-2018" Value="2017-2018"></asp:ListItem>
                                    <asp:ListItem Text="2018-2019" Value="2018-2019"></asp:ListItem>
                                    <asp:ListItem Text="2019-2020" Value="2019-2020"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Button ID="btnProcessReport" runat="server" CssClass="styled-button-1" Text="Process Report" />
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
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlSalSumReport" runat="server" SkinID="pnlInner">
                    <div>
                        <asp:GridView ID="grdSalSumRpt" runat="server" AutoGenerateColumns="False" CssClass="mGrid">
                            <Columns>
                                <asp:BoundField DataField="SalaryYear" HeaderText="SalaryYear" />
                                <asp:BoundField DataField="SalaryMonth" HeaderText="SalaryMonth" />
                                <asp:TemplateField HeaderText="Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("Amount","{0:n}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Dated" HeaderText="Dated" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
