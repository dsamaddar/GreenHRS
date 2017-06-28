<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/EmployeeProfile/MasterEmpProfile.master"
    AutoEventWireup="false" CodeFile="frmEmpManageResponsibility.aspx.vb" Inherits="EmployeeProfile_frmEmpManageResponsibility"
    Title=".:HRM:Assign Responsibility:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Css/GridStyle.css" rel="stylesheet" type="text/css" />
    <table style="width: 100%;">
        <tr>
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlAssignResponsibility" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="6">
                                <div class="widgettitle">
                                    Assign Responsibility</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                                <asp:Label ID="lblHolder" runat="server" Text="" Visible="false"></asp:Label>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px" class="label">
                                Department
                            </td>
                            <td style="width: 250px">
                                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldDepartment" runat="server" ControlToValidate="ddlDepartment"
                                    Display="None" ErrorMessage="Required: Major Task" ValidationGroup="AssignRes"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldDepartment_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                        CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldDepartment"
                                        WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px" class="label">
                                Effective Date
                            </td>
                            <td style="width: 250px">
                                <asp:TextBox ID="txtEffectiveDate" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtEffectiveDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtEffectiveDate">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldEffectiveDate" runat="server" ControlToValidate="txtEffectiveDate"
                                    Display="None" ErrorMessage="Required: Effective Date" ValidationGroup="AssignRes"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldEffectiveDate_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                        CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldEffectiveDate"
                                        WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Official Designation
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlOfficialDesignation" runat="server" CssClass="InputTxtBox"
                                    TabIndex="3" Width="200px">
                                </asp:DropDownList>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldOfficialDesignation" runat="server" ControlToValidate="ddlOfficialDesignation"
                                    Display="None" ErrorMessage="Required: Major Task" ValidationGroup="AssignRes"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldOfficialDesignation_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                        CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldOfficialDesignation"
                                        WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                            <td class="label">
                            </td>
                            <td class="label">
                                Functional Designation
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlFunctionalDesignation" runat="server" CssClass="InputTxtBox"
                                    TabIndex="5" Width="200px">
                                </asp:DropDownList>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldFunctionalDesignation" runat="server"
                                    ControlToValidate="ddlFunctionalDesignation" Display="None" ErrorMessage="Required: Major Task"
                                    ValidationGroup="AssignRes"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldFunctionalDesignation_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                        CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldFunctionalDesignation"
                                        WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Major Task
                            </td>
                            <td>
                                <asp:TextBox ID="txtMajorTask" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="250px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldMajorTask" runat="server" ControlToValidate="txtMajorTask"
                                    Display="None" ErrorMessage="Required: Major Task" ValidationGroup="AssignRes"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldMajorTask_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                        CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldMajorTask"
                                        WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                            <td class="label">
                            </td>
                            <td class="label">
                                Remarks
                            </td>
                            <td>
                                <asp:TextBox ID="txtRemarks" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="250px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldRemarks" runat="server" ControlToValidate="txtRemarks"
                                    Display="None" ErrorMessage="Required: Remarks" ValidationGroup="AssignRes"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldRemarks_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                        CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldRemarks"
                                        WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="btnAssignResponsibility" runat="server" CssClass="styled-button-1"
                                    Text="Assign Responsibility" ValidationGroup="AssignRes" OnClientClick="if (!confirm(' Are You Sure To Assign The Responsibility ?')) return false" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" Text="Cancel" />
                            </td>
                            <td>
                            </td>
                            <td>
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
            <td>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Panel ID="pnlAssignedResponsibility" runat="server" SkinID="pnlInner">
                    <table width="100%">
                        <tr>
                            <td>
                                <div class="widgettitle">
                                    Assigned Responsibility</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div>
                                    <asp:GridView ID="grdAssignedResponsibility" runat="server" AutoGenerateColumns="False"
                                        EmptyDataText="No Data Available" CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                                        CssClass="chkText" Text="Select"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="EmpResponsibilityID" Visible="False">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EmpResponsibilityID") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmpResponsibilityID" runat="server" Text='<%# Bind("EmpResponsibilityID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Department">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Department") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Department") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Official Designation">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("OfficialDesignation") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("OfficialDesignation") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Functional Designation">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("FunctionalDesignation") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("FunctionalDesignation") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Effective Date">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("EffectiveDate") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("EffectiveDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Major Task">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("MajorTask") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("MajorTask") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Remarks">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="IsRevoked">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("IsRevoked") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIsRevoked" runat="server" Text='<%# Bind("IsRevoked") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Revoked By">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("RevokedBy") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("RevokedBy") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Revoked Cause">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("RevokedCause") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("RevokedCause") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Revoked Date">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("RevokedDate") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("RevokedDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlRevokeResponsibility" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="6">
                                <div class="widgettitle">Revoke Responsibility</div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:HiddenField ID="hdFldAssignedResponsibilityID" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 250px">
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Revoke Cause
                            </td>
                            <td>
                                <asp:TextBox ID="txtRevokeCause" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="250px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldRevokeCause" runat="server" ControlToValidate="txtRevokeCause"
                                    Display="None" ErrorMessage="Required: Major Task" ValidationGroup="RevokeRes"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldRevokeCause_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                        CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldRevokeCause"
                                        WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                            <td class="label">
                                &nbsp;
                            </td>
                            <td class="label">
                                Revoke Date
                            </td>
                            <td>
                                <asp:TextBox ID="txtRevokeDate" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtRevokeDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtRevokeDate">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldRevokeDate" runat="server" ControlToValidate="txtRevokeDate"
                                    Display="None" ErrorMessage="Required: Major Task" ValidationGroup="RevokeRes"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldRevokeDate_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                        CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldRevokeDate"
                                        WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnRevokeResponsibility" runat="server" Text="Revoke Responsibility"
                                    CssClass="styled-button-1" OnClientClick="if (!confirm(' Are You Sure To Revoke The Responsibility ?')) return false"
                                    ValidationGroup="RevokeRes" />
                                &nbsp;<asp:Button ID="btnCancelRevokeRes" runat="server" CssClass="styled-button-1"
                                    Text="Cancel" />
                            </td>
                            <td>
                            </td>
                            <td>
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
