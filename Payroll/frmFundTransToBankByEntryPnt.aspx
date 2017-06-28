<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmFundTransToBankByEntryPnt.aspx.vb" Inherits="Payroll_frmFundTransToBankByEntryPnt"
    Title=".:HRM:Fund Transfer Request:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlFundTransferParameter" runat="server" SkinID="pnlInner" Width="95%">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="6">
                                <div class="widget-title">
                                    Fund Transfer Request<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td class="label" style="width: 150px">
                                Select Entry Point
                            </td>
                            <td style="width: 300px">
                                <div style="max-height: 300px">
                                    <asp:CheckBoxList ID="chkBxSalEntryPoint" runat="server" CssClass="label" Width="400px"
                                        AutoPostBack="True">
                                    </asp:CheckBoxList>
                                </div>
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td class="label">
                                Payment Date
                            </td>
                            <td>
                                <asp:TextBox ID="txtPaymentDate" runat="server" CssClass="InputTxtBox" Width="120px"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="reqFldPaymentDate" runat="server" ControlToValidate="txtPaymentDate"
                                    Display="None" ErrorMessage="Required: Payment Date" ValidationGroup="ProcessReport"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldPaymentDate_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldPaymentDate" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Select Bank
                            </td>
                            <td>
                                <asp:DropDownList ID="drpBanlAccList" runat="server" CssClass="InputTxtBox" Width="250px">
                                </asp:DropDownList>
                            </td>
                            <td class="label">
                            </td>
                            <td class="label">
                            </td>
                            <td>
                                <asp:DropDownList ID="drpHiddenList" runat="server" Visible="False">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                &nbsp;<asp:Button ID="btnShowDetails" runat="server" CssClass="styled-button-1" Text="Show Details" />
                                &nbsp;<asp:Button ID="btnProcessReport" runat="server" CssClass="styled-button-1"
                                    Text="Process Report" />
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
        <tr align="center">
            <td>
                <asp:Panel ID="pnlSalaryDetails" runat="server" SkinID="pnlInner" Width="95%">
                    <div style="max-height: 300px; max-width: 70%; overflow: auto">
                        <asp:GridView ID="grdSalaryDetails" runat="server" AutoGenerateColumns="False" CssClass="mGrid"
                            ShowFooter="True">
                            <Columns>
                                <asp:TemplateField HeaderText="Sl">
                                    <ItemTemplate>
                                        <font style="font-size: 12px">
                                            <%#CType(Container, GridViewRow).RowIndex + 1%>
                                        </font>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Employee">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("EmpName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Bank Account No">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("BankAccountNo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Salary">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSalary" runat="server" Text='<%# Bind("Salary","{0:N2}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
            </td>
        </tr>
        <tr align="center">
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
