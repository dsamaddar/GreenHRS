<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmLeaveSettings.aspx.vb" Inherits="LeaveManagement_frmLeaveSettings"
    Title=".:HRM:Leave Settings:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlLeaveType" runat="server" Width="700px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="4" align="left">
                                <div class="widgettitle">
                                    Define Leave Type<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px; height: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 230px">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Leave Type
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtLeaveType" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldLeaveType" runat="server" ControlToValidate="txtLeaveType"
                                    ErrorMessage="Leave Type Required" ValidationGroup="LeaveType" Display="None"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldLeaveType_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="reqFldLeaveType"
                                        CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Applicable For
                            </td>
                            <td align="left">
                                <asp:CheckBox ID="chkOnlyForMale" runat="server" Text="  Only For Male" CssClass="chkText" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                <asp:CheckBox ID="chkOnlyForFemale" runat="server" Text=" Only For Female" CssClass="chkText" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Is Deductible
                            </td>
                            <td align="left">
                                <asp:CheckBox ID="chkIsDeductibleFromLeaveBalance" runat="server" CssClass="chkText"
                                    Text=" Is Deductible From Leave Balance" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td align="left" class="label">
                                Active
                            </td>
                            <td align="left">
                                <asp:CheckBox ID="chkIsLeaveTypeActive" runat="server" CssClass="chkText" Text=" Is Active" />
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
                                &nbsp;
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="btnInsertLeaveType" runat="server" CssClass="styled-button-1" Text="Insert"
                                    ValidationGroup="LeaveType" />
                                &nbsp;
                                <asp:Button ID="btnUpdate" runat="server" CssClass="styled-button-1" Text="Update"
                                    ValidationGroup="LeaveType" />
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
                <asp:Panel ID="pnlAvailableLeaveType" runat="server" SkinID="pnlInner" Width="700px">
                    <table style="width: 100%;">
                        <tr align="center">
                            <td>
                            </td>
                            <td>
                                <div style="max-height: 300px; max-width: 680px; overflow: auto">
                                    <asp:GridView ID="grdLeaveType" runat="server" SkinID="grdNoFooter" AutoGenerateColumns="False"
                                        CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" CssClass="linkbtn" runat="server" CausesValidation="False"
                                                        CommandName="Select" Text="Select"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="LeaveTypeID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLeaveTypeID" runat="server" Text='<%# Bind("LeaveTypeID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Leave Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("LeaveType") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Only For Male">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("OnlyForMale") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Only For Female">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("OnlyForFemale") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="IsDedFrmLeaveBalance" HeaderText="Deductible From Leave" />
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
                                        </Columns>
                                    </asp:GridView>
                                </div>
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
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
