<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmComponentDefinition.aspx.vb" Inherits="Payroll_frmComponentDefinition"
    Title=".:HRM:Component Definition:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlComponentDefinition" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="5">
                                <div class="widget-title">
                                    Component Definition</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                                <asp:HiddenField ID="hdFldComponentID" runat="server" />
                            </td>
                            <td>
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                                Component Name
                            </td>
                            <td>
                                <asp:TextBox ID="txtCompName" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldCompName" runat="server" ControlToValidate="txtCompName"
                                    Display="None" ErrorMessage="Required : Component Name" ValidationGroup="CompDefinition"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldCompName_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldCompName" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td class="label">
                                Component Code
                            </td>
                            <td>
                                <asp:TextBox ID="txtComponentCode" runat="server" CssClass="InputTxtBox" Width="120px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldCompCode" runat="server" ControlToValidate="txtComponentCode"
                                    Display="None" ErrorMessage="Required: Component Code" ValidationGroup="CompDefinition"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldCompCode_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldCompCode" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                                Component Value
                            </td>
                            <td>
                                <asp:TextBox ID="txtCompValue" runat="server" CssClass="InputTxtBox" Width="120px"></asp:TextBox>
                                &nbsp;
                                <asp:CompareValidator ID="numValidatorCompValue" runat="server" ControlToValidate="txtCompValue"
                                    ErrorMessage="Invalid Value" Operator="DataTypeCheck" Type="Double" ValidationGroup="CompDefinition">
                                </asp:CompareValidator>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldCompValue" runat="server" ControlToValidate="txtCompValue"
                                    Display="None" ErrorMessage="Required: Component Value" ValidationGroup="CompDefinition"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldCompValue_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldCompValue" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td class="label">
                                Is Gross Component
                            </td>
                            <td>
                                <asp:CheckBox ID="chkIsGrossComponent" runat="server" AutoPostBack="True" CssClass="label"
                                    Text="(Check If YES)" />
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Component Dependent On
                            </td>
                            <td>
                                <asp:DropDownList ID="drpCompDependency" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                    Width="120px">
                                    <asp:ListItem>N\A</asp:ListItem>
                                    <asp:ListItem>Basic</asp:ListItem>
                                    <asp:ListItem>Gross</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="label">
                                Is Taxable
                            </td>
                            <td>
                                <asp:CheckBox ID="chkIsTaxable" runat="server" CssClass="label" Text="(Check If YES)" />
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Component Ratio
                            </td>
                            <td>
                                <asp:TextBox ID="txtCompRatio" runat="server" CssClass="InputTxtBox" Width="120px"></asp:TextBox>
                                &nbsp;
                                <asp:CompareValidator ID="numValidatorCompRatio" runat="server" ControlToValidate="txtCompRatio"
                                    ErrorMessage="Invalid Value" Operator="DataTypeCheck" Type="Double" ValidationGroup="CompDefinition">
                                </asp:CompareValidator>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldCompRatio" runat="server" ControlToValidate="txtCompRatio"
                                    Display="None" ErrorMessage="Required : Component Ratio" ValidationGroup="CompDefinition"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldCompRatio_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldCompRatio" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td class="label">
                                Monthly Component
                            </td>
                            <td>
                                <asp:CheckBox ID="chkIsMonthlyComponent" runat="server" CssClass="label" Text="(Check If YES)" />
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Consolidated
                            </td>
                            <td>
                                <asp:TextBox ID="txtCompConsolidated" runat="server" CssClass="InputTxtBox" Width="120px"></asp:TextBox>
                                &nbsp;
                                <asp:CompareValidator ID="numValidatorCompConsolidated" runat="server" ControlToValidate="txtCompConsolidated"
                                    ErrorMessage="Invalid Value" Operator="DataTypeCheck" Type="Double" ValidationGroup="CompDefinition">
                                </asp:CompareValidator>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldCompConsolidated" runat="server" ControlToValidate="txtCompConsolidated"
                                    Display="None" ErrorMessage="Required : Consolidated Amount" ValidationGroup="CompDefinition"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldCompConsolidated_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldCompConsolidated" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td class="label">
                                State
                            </td>
                            <td>
                                <asp:DropDownList ID="drpCompState" runat="server" CssClass="InputTxtBox">
                                    <asp:ListItem>Positive</asp:ListItem>
                                    <asp:ListItem>Negative</asp:ListItem>
                                    <asp:ListItem>Hidden</asp:ListItem>
                                    <asp:ListItem Value="Festival Bonus">Festival Bonus</asp:ListItem>
                                    <asp:ListItem Value="Performance Bonus">Performance Bonus</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Tax Exemption Limit
                            </td>
                            <td>
                                <asp:TextBox ID="txtTaxExemptionLimit" runat="server" CssClass="InputTxtBox" Width="120px"></asp:TextBox>
                                &nbsp;<asp:CompareValidator ID="numValidatorCompExemption" runat="server" ControlToValidate="txtTaxExemptionLimit"
                                    ErrorMessage="Invalid Value" Operator="DataTypeCheck" Type="Double" ValidationGroup="CompDefinition"></asp:CompareValidator>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldExemptionLimit" runat="server" ControlToValidate="txtTaxExemptionLimit"
                                    Display="None" ErrorMessage="Required : Exemption Limit" ValidationGroup="CompDefinition"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldExemptionLimit_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldExemptionLimit" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td class="label">
                                Account Code
                            </td>
                            <td>
                                <asp:DropDownList ID="drpAccountCodeList" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
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
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnAddComponent" runat="server" CssClass="styled-button-1" Text="Add Component"
                                    ValidationGroup="CompDefinition" />
                                &nbsp;<asp:Button ID="btnUpdateComponent" runat="server" CssClass="styled-button-1"
                                    Text="Update" ValidationGroup="CompDefinition" />
                                &nbsp;<asp:Button ID="btnCancelCompDefinition" runat="server" CssClass="styled-button-1"
                                    Text="Cancel" />
                            </td>
                            <td>
                            </td>
                            <td>
                                &nbsp;
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
                <asp:Panel ID="pnlListedComponents" runat="server" Width="100%" SkinID="pnlInner">
                    <div style="max-height: 400px; max-width: 100%; overflow: auto">
                        <asp:GridView ID="grdAvailableComponents" runat="server" CssClass="mGrid" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                            Text="Select"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ComponentID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblComponentID" runat="server" Text='<%# Bind("ComponentID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Component">
                                    <ItemTemplate>
                                        <asp:Label ID="lblComponentName" runat="server" Text='<%# Bind("ComponentName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Component Code">
                                    <ItemTemplate>
                                        <asp:Label ID="lblComponentCode" runat="server" Text='<%# Bind("ComponentCode") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Comp. Value">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCompValue" runat="server" Text='<%# Bind("CompValue") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Dependent On">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCompValDependentOn" runat="server" Text='<%# Bind("CompValDependentOn") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Comp. Ratio">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCompRatio" runat="server" Text='<%# Bind("CompRatio") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Consolidated">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Consolidated") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblConsolidated" runat="server" Text='<%# Bind("Consolidated") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="GrossComponent">
                                    <ItemTemplate>
                                        <asp:Label ID="lblGrossComponent" runat="server" Text='<%# Bind("GrossComponent") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Taxable">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTaxable" runat="server" Text='<%# Bind("Taxable") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Monthly Component">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMonthlyComponent" runat="server" Text='<%# Bind("MonthlyComponent") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tax Exemption">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTaxExemptionLimit" runat="server" Text='<%# Bind("TaxExemptionLimit") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Component State">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCompState" runat="server" Text='<%# Bind("CompState") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="AccountCode">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAccountCode" runat="server" Text='<%# Bind("AccountCode") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EntryBy">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEntryBy" runat="server" Text='<%# Bind("EntryBy") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </td>
        </tr>
        <tr align="left">
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
