<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmManageULCBankAccount.aspx.vb" Inherits="BankInfo_frmManageULCBankAccount"
    Title=".:HRM:Manage ULC Bank Account:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>
            </td>
            <td align="center">
                <asp:Panel ID="pnlManageULCBankAcc" runat="server" Width="800px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="5">
                                <div class="widget-title">
                                    Manage Bank Account<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 250px">
                                <asp:HiddenField ID="hdfldULCBankAccID" runat="server" />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldBankAccount" runat="server" 
                                    ControlToValidate="txtAccountNo" Display="None" 
                                    ErrorMessage="Required : Bank Account No" ValidationGroup="MngULCBank"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldBankAccount_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldBankAccount" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldAddressingPerson" runat="server" 
                                    ControlToValidate="txtAddressingPerson" Display="None" 
                                    ErrorMessage="Required : Addressing Person" ValidationGroup="MngULCBank"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldAddressingPerson_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldAddressingPerson" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                                Select Bank
                            </td>
                            <td>
                                <asp:DropDownList ID="drpSelectBank" runat="server" CssClass="InputTxtBox" Width="250px"
                                    AutoPostBack="True">
                                </asp:DropDownList>
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
                                Account No
                            </td>
                            <td>
                                <asp:TextBox ID="txtAccountNo" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;
                            </td>
                            <td class="label">
                                Account Code</td>
                            <td>
                                <asp:DropDownList ID="drpAccountCodeList" runat="server" CssClass="InputTxtBox" 
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Account Type
                            </td>
                            <td>
                                <asp:DropDownList ID="drpAccountType" runat="server" CssClass="InputTxtBox" Width="200px">
                                    <asp:ListItem>Current Account</asp:ListItem>
                                    <asp:ListItem>Savings Account</asp:ListItem>
                                </asp:DropDownList>
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
                                Branch
                            </td>
                            <td>
                                <asp:DropDownList ID="drpBranchInfo" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
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
                                Addressing Person
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddressingPerson" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                House No
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddressHouseNo" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldHouseNo" runat="server" ControlToValidate="txtAddressHouseNo"
                                    Display="None" ErrorMessage="Required : House No" ValidationGroup="MngULCBank"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldHouseNo_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldHouseNo" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Road No
                            </td>
                            <td>
                                <asp:TextBox ID="txtRoadNo" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldRoadNo" runat="server" ControlToValidate="txtRoadNo"
                                    Display="None" ErrorMessage="Required : Road No" ValidationGroup="MngULCBank"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldRoadNo_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldRoadNo" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Post
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddressPost" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldPost" runat="server" ControlToValidate="txtAddressPost"
                                    Display="None" ErrorMessage="Required : Post" ValidationGroup="MngULCBank"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldPost_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldPost" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Is Active
                            </td>
                            <td>
                                <asp:CheckBox ID="chkIsActive" runat="server" CssClass="label" Text="(Check If YES)" />
                            </td>
                            <td>
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
                                <asp:Button ID="btnSubmitBankAccInfo" runat="server" CssClass="styled-button-1" Text="Submit"
                                    ValidationGroup="MngULCBank" />
                                &nbsp;<asp:Button ID="btnUpdateBankAccount" runat="server" CssClass="styled-button-1"
                                    Text="Update" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" Text="Cancel" />
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
                <div style="max-width: 800px; max-height: 250px; overflow: auto">
                    <asp:GridView ID="grdBankAccounts" runat="server" CssClass="mGrid" AutoGenerateColumns="False">
                        <Columns>
                            <asp:CommandField HeaderText="Select" ShowSelectButton="True" />
                            <asp:TemplateField HeaderText="ULCBankAccID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblULCBankAccID" runat="server" Text='<%# Bind("ULCBankAccID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="BankID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblBankID" runat="server" Text='<%# Bind("BankID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Bank">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Bank") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="BranchID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblBranchID" runat="server" Text='<%# Bind("BranchID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Branch">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Branch") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="AccountNo">
                                <ItemTemplate>
                                    <asp:Label ID="lblAccountNo" runat="server" Text='<%# Bind("AccountNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Account Type">
                                <ItemTemplate>
                                    <asp:Label ID="lblAccountType" runat="server" Text='<%# Bind("AccountType") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Addressing Person">
                                <ItemTemplate>
                                    <asp:Label ID="lblAddressingPerson" runat="server" Text='<%# Bind("AddressingPerson") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="House No">
                                <ItemTemplate>
                                    <asp:Label ID="lblAddress_HouseNo" runat="server" Text='<%# Bind("Address_HouseNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Road No">
                                <ItemTemplate>
                                    <asp:Label ID="lblAddress_RoadNo" runat="server" Text='<%# Bind("Address_RoadNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Post">
                                <ItemTemplate>
                                    <asp:Label ID="lblAddress_Post" runat="server" Text='<%# Bind("Address_Post") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Active">
                                <ItemTemplate>
                                    <asp:Label ID="lblActive" runat="server" Text='<%# Bind("Active") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="AccountCode">
                                <ItemTemplate>
                                    <asp:Label ID="lblAccountCode" runat="server" Text='<%# Bind("AccountCode") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="EntryBy">
                                <ItemTemplate>
                                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("EntryBy") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
