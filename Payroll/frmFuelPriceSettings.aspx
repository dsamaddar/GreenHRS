<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmFuelPriceSettings.aspx.vb" Inherits="Payroll_frmFuelPriceSettings"
    Title=".:HRS:Fuel Price Settings:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlFuelPriceSettings" runat="server" Width="60%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="4">
                                <div class="widget-title">
                                    Fuel Price Settings<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:HiddenField ID="hdFldFuelPriceID" runat="server" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Effective Date
                            </td>
                            <td>
                                <asp:TextBox ID="txtEffectiveDate" runat="server" CssClass="InputTxtBox" Width="150px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtEffectiveDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtEffectiveDate">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldEffectiveDate" runat="server" ControlToValidate="txtEffectiveDate"
                                    Display="None" ErrorMessage="Required: Effective Date" ValidationGroup="FuelPrice"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="valCallreqFldMobileLoanAmntSch0" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldEffectiveDate" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Fuel Price/Ltr
                            </td>
                            <td>
                                <asp:TextBox ID="txtFuelPrice" runat="server" CssClass="InputTxtBox" Width="100px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldFuelPrice" runat="server" ControlToValidate="txtFuelPrice"
                                    Display="None" ErrorMessage="Required: Fuel Price" ValidationGroup="FuelPrice"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldFuelPrice_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldFuelPrice" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="btnInsertFuelPrice" runat="server" CssClass="styled-button-1" 
                                    Text="Insert" ValidationGroup="FuelPrice" />
                                &nbsp;<asp:Button ID="btnUpdateFuelPrice" runat="server" CssClass="styled-button-1"
                                    Text="Update" ValidationGroup="FuelPrice" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" Text="Cancel" />
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
                <asp:Panel ID="pnlFuelPriceList" runat="server" Width="60%" SkinID="pnlInner">
                    <div>
                        <asp:GridView ID="grdFuelPriceList" runat="server" CssClass="mGrid" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                            Text="Select"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="FuelPriceID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFuelPriceID" runat="server" Text='<%# Bind("FuelPriceID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Dated">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDated" runat="server" Text='<%# Bind("Dated") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PricePerLtr">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPricePerLtr" runat="server" Text='<%# Bind("PricePerLtr") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="EntryBy" HeaderText="EntryBy" />
                                <asp:BoundField DataField="EntryDate" HeaderText="EntryDate" />
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
