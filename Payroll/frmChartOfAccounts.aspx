<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmChartOfAccounts.aspx.vb" Inherits="Payroll_frmChartOfAccounts" Title=".:Chart Of Accounts:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlCOADefinition" runat="server" Width="800px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="4">
                                <div class="widgettitle">
                                    Define Chart Of Accounts<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 250px">
                            </td>
                            <td>
                                <asp:HiddenField ID="hdFldAccountCode" runat="server" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Ledger Name
                            </td>
                            <td>
                                <asp:TextBox ID="txtLedgerName" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldLedgerName" runat="server" ControlToValidate="txtLedgerName"
                                    Display="None" ErrorMessage="Required: Ledger Name" ValidationGroup="LedgerName"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldLedgerName_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                        CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldLedgerName"
                                        WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Parent Ledger
                            </td>
                            <td>
                                <asp:DropDownList ID="drpParentAccount" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Ledger Code
                            </td>
                            <td>
                                <asp:TextBox ID="txtLedgerCode" runat="server" CssClass="InputTxtBox" Width="100px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldLedgerCode" runat="server" ControlToValidate="txtLedgerCode"
                                    Display="None" ErrorMessage="Required: Ledger Code" ValidationGroup="LedgerName"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldLedgerCode_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                        CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldLedgerCode"
                                        WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Is Bank Account
                            </td>
                            <td>
                                <asp:CheckBox ID="chkIsBankAccount" runat="server" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Balance Type
                            </td>
                            <td>
                                <asp:DropDownList ID="drpBalanceType" runat="server" Width="100px" CssClass="InputTxtBox">
                                    <asp:ListItem Value="D">Debit</asp:ListItem>
                                    <asp:ListItem Value="C">Credit</asp:ListItem>
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
                                <asp:Button ID="btnInsertLedgerName" runat="server" Text="Insert" CssClass="styled-button-1"
                                    ValidationGroup="LedgerName" />
                                &nbsp;<asp:Button ID="btnUpdate" runat="server" CssClass="styled-button-1" Text="Update" />
                                &nbsp;<asp:Button ID="btnCancelLedgerName" runat="server" Text="Cancel" CssClass="styled-button-1" />
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
                <asp:Panel ID="pnlDetailsCOAList" runat="server" Width="800px" SkinID="pnlInner">
                    <div style="max-width: 100%; max-height: 400px; overflow: auto">
                        <asp:GridView ID="grdCOAList" runat="server" AutoGenerateColumns="False" CssClass="mGrid">
                            <Columns>
                                <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                            Text="Select"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Account Code">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAccountCode" runat="server" Text='<%# Bind("AccountCode") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ledger Head">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLedgerName" runat="server" Text='<%# Bind("LedgerName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Parent Head">
                                    <ItemTemplate>
                                        <asp:Label ID="lblParentCode" runat="server" Text='<%# Bind("ParentCode") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Bank A/C">
                                    <ItemTemplate>
                                        <asp:Label ID="lblIsBankAccount" runat="server" Text='<%# Bind("IsBankAccount") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Balance Type">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBalanceType" runat="server" Text='<%# Bind("BalanceType") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Entry By">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEntryBy" runat="server" Text='<%# Bind("EntryBy") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Entry Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEntryDate" runat="server" Text='<%# Bind("EntryDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
