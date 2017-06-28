<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/EmployeeInfo/EmployeeMasterPage.master"
    AutoEventWireup="false" CodeFile="frmEmpRelatives.aspx.vb" Inherits="EmployeeInfo_frmEmpRelatives"
    Title=".:HRM:Employee Relatives:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Label ID="lblMsg" runat="server" Width="800px" Height="25px" BackColor="Green"
                    ForeColor="Yellow" Text="Please save your information before exiting this page"
                    CssClass="NotificationBar"></asp:Label>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Label ID="lblRedirectMsg" runat="server" Width="800px" Height="25px" BackColor="Green"
                    ForeColor="Red" Text="" CssClass="blinkytext"></asp:Label>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Panel ID="pnlRelativeInput" runat="server" Width="800px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td style="width: 20px; height: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 310px" align="left">
                                <asp:HiddenField ID="hdfldRelativeID" runat="server" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Select Relation</b> <span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpSelectRelativeType" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldSelectRelation" runat="server" ControlToValidate="drpSelectRelativeType"
                                    ErrorMessage="*" ValidationGroup="InsertRelative"></asp:RequiredFieldValidator>&nbsp;
                                <asp:Button ID="btnNewRelationType" runat="server" CssClass="styled-button-1" OnClientClick="return confirm('Are You Sure To Insert New Relation Type ??')"
                                    Text="..." />
                            </td>
                            <td align="left">
                                <asp:Button ID="btnCancelInsertNewRelationType" runat="server" CssClass="styled-button-1"
                                    Text="Cancel" />
                                &nbsp;<asp:Label ID="lblNewRelationType" runat="server" CssClass="label">
                                    <asp:TextBox ID="txtRelationType" runat="server" CssClass="InputTxtBox" ValidationGroup="RelationType"
                                        Width="180px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqFldDocumentType" runat="server" ControlToValidate="txtRelationType"
                                        ErrorMessage="*" ValidationGroup="DocType"></asp:RequiredFieldValidator>
                                    <asp:CheckBox ID="chkRelationTypeIsActive" CssClass="chkText" runat="server" Text=" Is Active" />
                                </asp:Label></td>
                        </tr>
                        <tr>
                            <td align="left">
                            </td>
                            <td align="left" class="label">
                                <b>Name Of Relative</b> <span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtNameOfRelative" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldNameOfRelative" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtNameOfRelative" ValidationGroup="InsertRelative"></asp:RequiredFieldValidator></td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td align="left" class="label">
                                <b>Date Of Birth</b> <span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtDateOfBirth" runat="server" CssClass="InputTxtBox" Width="80px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtDateOfBirth_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtDateOfBirth">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldDateOfBirth" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtDateOfBirth" ValidationGroup="InsertRelative"></asp:RequiredFieldValidator></td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td align="left" class="label">
                                <b>Address</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtAddress" runat="server" CssClass="InputTxtBox" Height="50px"
                                    Width="300px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td align="left" class="label">
                                <b>Details</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtDetails" runat="server" CssClass="InputTxtBox" Height="50px"
                                    Width="300px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;
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
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td align="center">
                                <asp:Button ID="btnInsertRelative" runat="server" CssClass="styled-button-1" Text="Insert"
                                    ValidationGroup="InsertRelative" OnClientClick="if (!confirm('Are you Sure to Make Change ?')) return false" />
                                &nbsp;<asp:Button ID="btnCancelSelection" runat="server" CssClass="styled-button-1"
                                    Text="Cancel" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td align="center">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr align="center">
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
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Panel ID="pnlRelativesInfo" runat="server" Width="800px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <div style="max-height: 400px; max-width: 100%; overflow: auto">
                                    <asp:GridView ID="grdRelativesInfo" runat="server" SkinID="grdNoFooter" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" CssClass="linkbtn" runat="server" CausesValidation="False"
                                                        CommandName="Select" Text="Select"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText=" RelativeID" Visible="False">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RelativeID") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRelativeID" runat="server" Text='<%# Bind("RelativeID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="RelationTypeID" Visible="False">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("RelationTypeID") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRelationTypeID" runat="server" Text='<%# Bind("RelationTypeID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Relation Type">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("RelationType") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("RelationType") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Name of Relative">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("NameOfRelative") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNameOfRelative" runat="server" Text='<%# Bind("NameOfRelative") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Date of Birth">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("DateOfBirth") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDateOfBirth" runat="server" Text='<%# Bind("DateOfBirth") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Age">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Age") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Age") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Address">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("RelAddress") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRelAddress" runat="server" Text='<%# Bind("RelAddress") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Details">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Details") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDetails" runat="server" Text='<%# Bind("Details") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Entry By" Visible="False">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("EntryBy") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("EntryBy") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr align="center">
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
    </table>
</asp:Content>
