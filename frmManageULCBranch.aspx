﻿<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmManageULCBranch.aspx.vb" Inherits="frmManageULCBranch"
    Title=".:HRM:Manage Branch:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlManageULCBranch" runat="server" Width="80%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="4">
                                <div class="widget-title">
                                    Manage ULC Branch<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:HiddenField ID="hdFldULCBranchID" runat="server" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Branch Name
                            </td>
                            <td>
                                <asp:TextBox ID="txtBranchName" runat="server" Width="200px" CssClass="InputTxtBox"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldBranchName" runat="server" ControlToValidate="txtBranchName"
                                    Display="None" ErrorMessage="Required: Branch Name" ValidationGroup="ULCBranch"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldBranchName_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldBranchName" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Branch Location
                            </td>
                            <td>
                                <asp:TextBox ID="txtBranchLocation" runat="server" Height="50px" TextMode="MultiLine"
                                    Width="200px" CssClass="InputTxtBox"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldBranchLocation" runat="server" ControlToValidate="txtBranchLocation"
                                    Display="None" ErrorMessage="Required: Branch Location" ValidationGroup="ULCBranch"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldBranchLocation_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldBranchLocation" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Region
                            </td>
                            <td>
                                <asp:DropDownList ID="drpRegionList" runat="server" CssClass="InputTxtBox" Width="80px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Active
                            </td>
                            <td>
                                <asp:CheckBox ID="chkIsActive" runat="server" CssClass="chkText" />
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
                                <asp:Button ID="btnSubmit" runat="server" CssClass="styled-button-1" Text="Submit"
                                    ValidationGroup="ULCBranch" />
                                &nbsp;<asp:Button ID="btnUpdate" runat="server" CssClass="styled-button-1" Text="Update" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" Text="Cancel" />
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
                <asp:Panel ID="pnlBranchList" runat="server" SkinID="pnlInner" Width="80%">
                    <div style="max-width: 100%; max-height: 250px; overflow: auto">
                        <asp:GridView ID="grdULCBranch" runat="server" AutoGenerateColumns="False" CssClass="mGrid">
                            <Columns>
                                <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                            Text="Select"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ULCBranchID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblULCBranchID" runat="server" Text='<%# Bind("ULCBranchID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Branch">
                                    <ItemTemplate>
                                        <asp:Label ID="lblULCBranchName" runat="server" Text='<%# Bind("ULCBranchName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Location">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBranchLocation" runat="server" Text='<%# Bind("BranchLocation") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Region">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Region") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Active">
                                    <ItemTemplate>
                                        <asp:Label ID="lblisActive" runat="server" Text='<%# Bind("isActive") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EntryBy">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("EntryBy") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EntryDate">
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("EntryDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="RegionID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRegionID" runat="server" Text='<%# Bind("RegionID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
