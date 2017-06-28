<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmRecruitmentTypeDef.aspx.vb" Inherits="Administration_frmRecruitmentTypeDef"
    Title=".:HRM:Recruitment Type Definition:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlRecTypeDef" runat="server" Width="80%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="5">
                                <div class="widget-title">
                                    Recruitment Type Definition<asp:ScriptManager ID="ScriptManager1" runat="server">
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
                                <asp:RequiredFieldValidator ID="reqFldRecruitmentType" runat="server" ControlToValidate="txtRecruitmentType"
                                    Display="None" ErrorMessage="Required : Recruitment Type" ValidationGroup="RecruitmentType"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldRecruitmentType_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldRecruitmentType" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldRecruitmentTypeCode" runat="server" ControlToValidate="txtRecruitmentTypeCode"
                                    Display="None" ErrorMessage="Required : Code" ValidationGroup="RecruitmentType"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldRecruitmentTypeCode_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldRecruitmentTypeCode" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Recruitment Type
                            </td>
                            <td>
                                <asp:TextBox ID="txtRecruitmentType" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                            </td>
                            <td class="label">
                                Code
                            </td>
                            <td>
                                <asp:TextBox ID="txtRecruitmentTypeCode" runat="server" CssClass="InputTxtBox" Width="80px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Prerequisite
                            </td>
                            <td>
                                <asp:TextBox ID="txtPrerequisite" runat="server" CssClass="InputTxtBox" Height="50px"
                                    Width="200px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="label">
                                Sourcing
                            </td>
                            <td>
                                <asp:TextBox ID="txtSourcing" runat="server" CssClass="InputTxtBox" Height="50px"
                                    Width="200px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Interview Panel
                            </td>
                            <td>
                                <asp:TextBox ID="txtInterviewPanel" runat="server" CssClass="InputTxtBox" Height="50px"
                                    Width="200px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="label">
                                Is Active
                            </td>
                            <td>
                                <asp:CheckBox ID="chkIsActive" runat="server" CssClass="chkText" Text="(Check If YES)" />
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldInterviewPanel" runat="server" ControlToValidate="txtInterviewPanel"
                                    Display="None" ErrorMessage="Required : Interview Panel" ValidationGroup="RecruitmentType"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldInterviewPanel_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldInterviewPanel" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldPrerequisite" runat="server" ControlToValidate="txtPrerequisite"
                                    Display="None" ErrorMessage="Required : Prerequisite" ValidationGroup="RecruitmentType"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldPrerequisite_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldPrerequisite" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldSourcing" runat="server" ControlToValidate="txtSourcing"
                                    Display="None" ErrorMessage="Required : Sourcing" ValidationGroup="RecruitmentType"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldSourcing_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldSourcing" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnSubmit" runat="server" CssClass="styled-button-1" 
                                    Text="Submit" ValidationGroup="RecruitmentType" />
                                &nbsp;<asp:Button ID="btnUpdate" runat="server" CssClass="styled-button-1" 
                                    Text="Update" ValidationGroup="RecruitmentType" />
                            </td>
                            <td>
                                <asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" Text="Cancel" />
                            </td>
                            <td>
                                <asp:HiddenField ID="hdFldRecruitmentTypeID" runat="server" />
                            </td>
                        </tr>
                        <tr align="left">
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
        <tr align="center">
            <td>
                <asp:Panel ID="pnlRecruitmentTypeDetails" runat="server" Width="80%" SkinID="pnlInner">
                    <div>
                        <asp:GridView ID="grdRecruitmentTypeDef" runat="server" AutoGenerateColumns="False"
                            CssClass="mGrid">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                            CommandName="Select" Text="Select"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="RecruitmentTypeID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRecruitmentTypeID" runat="server" Text='<%# Bind("RecruitmentTypeID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Recruitment Type">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRecruitmentType" runat="server" Text='<%# Bind("RecruitmentType") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Code">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRecruitmentTypeCode" runat="server" Text='<%# Bind("RecruitmentTypeCode") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Prerequisite">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPrerequisite" runat="server" Text='<%# Bind("Prerequisite") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sourcing">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSourcing" runat="server" Text='<%# Bind("Sourcing") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Interview Panel">
                                    <ItemTemplate>
                                        <asp:Label ID="lblInterviewPanel" runat="server" Text='<%# Bind("InterviewPanel") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="IsActive">
                                    <ItemTemplate>
                                        <asp:Label ID="lblIsActive" runat="server" Text='<%# Bind("IsActive") %>'></asp:Label>
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
        <tr align="center">
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
