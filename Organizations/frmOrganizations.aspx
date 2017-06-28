<%@ Page Language="VB" Theme="CommonSkin"  MasterPageFile="~/HRMMaster.master" AutoEventWireup="false" CodeFile="frmOrganizations.aspx.vb" Inherits="Training_frmOrganizations" title=".:HRM : Org Input:." %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
--%><asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr align="center" >
            <td>
                &nbsp;</td>
            <td>
                <asp:Panel ID="pnlInputFormOrg" runat="server" SkinID="pnlInner" Width="100%">
                    <table style="width:100%;">
                        <tr>
                            <td colspan="4" align="left">
                                <div class="widgettitle">Organization Settings<asp:ScriptManager 
                                        ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:20px">
                                </td>
                            <td>
                                </td>
                            <td >
                            </td>
                            <td>
                                </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                Organization Name<span class="RequiredLabel">*</span></td>
                            <td align="left" >
                                <asp:TextBox ID="txtOrganizationName" runat="server" CssClass="InputTxtBox" 
                                    Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldOrganizationName" runat="server" 
                                    ControlToValidate="txtOrganizationName" ErrorMessage="Required" 
                                    ValidationGroup="AddOrg" Display="None"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldOrganizationName_ValidatorCalloutExtender" 
                                    runat="server" Enabled="True" TargetControlID="reqFldOrganizationName" 
                                    CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                Details<span class="RequiredLabel">*</span></td>
                            <td align="left" >
                                <asp:TextBox ID="txtOrgDetails" runat="server" CssClass="InputTxtBox" 
                                    Height="70px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldOrgDetails" runat="server" 
                                    ControlToValidate="txtOrgDetails" Display="None" ErrorMessage="Required" 
                                    ValidationGroup="AddOrg"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldOrgDetails_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldOrgDetails" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                Country </td>
                            <td align="left" >
                                <asp:DropDownList ID="drpCountry" runat="server" CssClass="InputTxtBox" 
                                    Width="200px">
                                    <asp:ListItem>Bangladesh</asp:ListItem>
                                    <asp:ListItem>India</asp:ListItem>
                                    <asp:ListItem>Pakistan</asp:ListItem>
                                    <asp:ListItem>Srilanka</asp:ListItem>
                                    <asp:ListItem>Singapore</asp:ListItem>
                                    <asp:ListItem>Maldives</asp:ListItem>
                                    <asp:ListItem>Malaysia</asp:ListItem>
                                    <asp:ListItem>Indonesia</asp:ListItem>
                                    <asp:ListItem>Nepal</asp:ListItem>
                                    <asp:ListItem>Thailand</asp:ListItem>
                                    <asp:ListItem>Vhutan</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                Address<span class="RequiredLabel">*</span></td>
                            <td align="left">
                                <asp:TextBox ID="txtAddress" runat="server" CssClass="InputTxtBox" 
                                    Width="300px" Height="50px" TextMode="MultiLine"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldAddress" runat="server" 
                                    ControlToValidate="txtAddress" ErrorMessage="Required" 
                                    ValidationGroup="AddOrg" Display="None"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldAddress_ValidatorCalloutExtender" 
                                    runat="server" Enabled="True" TargetControlID="reqFldAddress" 
                                    CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                Telephone<span class="RequiredLabel">*</span></td>
                            <td align="left">
                                <asp:TextBox ID="txtTelephone" runat="server" CssClass="InputTxtBox" 
                                    Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldTelephone" runat="server" 
                                    ControlToValidate="txtTelephone" Display="None" ErrorMessage="Required" 
                                    ValidationGroup="AddOrg"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldTelephone_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldTelephone" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                Fax</td>
                            <td align="left">
                                <asp:TextBox ID="txtFax" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                Mobile<span class="RequiredLabel">*</span></td>
                            <td align="left" >
                                <asp:TextBox ID="txtMobile" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldMobile" runat="server" 
                                    ControlToValidate="txtMobile" Display="None" ErrorMessage="Required" 
                                    ValidationGroup="AddOrg"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldMobile_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldMobile" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                                <asp:Button ID="btnAddOrganization" runat="server" CssClass="styled-button-1" 
                                    Text="ADD" ValidationGroup="AddOrg" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" 
                                    Text="Cancel" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center" >
            <td>
                &nbsp;</td>
            <td>
                <asp:Panel ID="pnlOrgInfo" runat="server" Width="100%" SkinID="pnlInner">
                    <div style="max-height:300px;max-width:100%;overflow:auto">
                        <asp:GridView ID="grdOrgDetails" runat="server" AutoGenerateColumns="False" 
                            CssClass="mGrid">
                            <Columns>
                                <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                            CommandName="Select" Text="Select"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="OrganizationID" Visible="False">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("OrganizationID") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblOrganizationID" runat="server" Text='<%# Bind("OrganizationID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Organization">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("OrgName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblOrgName" runat="server" Text='<%# Bind("OrgName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Details">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("OrgProfile") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblOrgProfile" runat="server" Text='<%# Bind("OrgProfile") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Country">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Country") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountry" runat="server" Text='<%# Bind("Country") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Address">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Telephone">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Telephone") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblTelephone" runat="server" Text='<%# Bind("Telephone") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fax">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Fax") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblFax" runat="server" Text='<%# Bind("Fax") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mobile">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Mobile") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblMobile" runat="server" Text='<%# Bind("Mobile") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EntryBy" Visible="False">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("EntryBy") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblEntryBy" runat="server" Text='<%# Bind("EntryBy") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EntryDate" Visible="False">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("EntryDate") %>'></asp:TextBox>
                                    </EditItemTemplate>
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
                &nbsp;</td>
        </tr>
        <tr align="center" >
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

