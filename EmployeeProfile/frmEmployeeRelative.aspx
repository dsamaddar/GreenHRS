<%@ Page Language="VB" MasterPageFile="~/EmployeeProfile/MasterEmpProfile.master"
    AutoEventWireup="false" CodeFile="frmEmployeeRelative.aspx.vb" Inherits="EmployeeProfile_frmEmployeeRelative"
    Title="::Employee Relatives::" Theme="CommonSkin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../Sources/css/ValidatorStyle.css" rel="stylesheet" type="text/css" />
    <link href="Css/GridStyle.css" rel="stylesheet" type="text/css" />
    <table style="width: 100%;">
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Panel ID="pnlRelativeInput" runat="server" Width="900px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="4">
                                <div class="widgettitle">
                                    Family Member Information</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px; height: 20px">
                            </td>
                            <td style="width: 150px">
                                <asp:Label ID="lblHolder" runat="server" Text="" Visible="false"></asp:Label>
                            </td>
                            <td align="left" style="width: 310px">
                                <asp:HiddenField ID="hdfldRelativeID" runat="server" />
                            </td>
                            <td align="left">
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td align="left" class="label">
                                Base Insurance No.
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtBaseInsuNo" runat="server" CssClass="InputTxtBox" ReadOnly="true"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td align="left" class="label">
                                Select Family Member<span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpSelectRelativeType" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldSelectRelation" runat="server" ControlToValidate="drpSelectRelativeType"
                                    ErrorMessage="*" ValidationGroup="InsertRelative"></asp:RequiredFieldValidator>&nbsp;
                                <asp:Button ID="btnNewRelationType" runat="server" CssClass="styled-button-1" OnClientClick="return confirm('Are You Sure To Insert New Relation Type ??')"
                                    Text="..." Visible="False" />
                            </td>
                            <td align="left">
                                <asp:Button ID="btnCancelInsertNewRelationType" runat="server" CssClass="styled-button-1"
                                    Text="Cancel" />
                                &nbsp;<asp:Label ID="lblNewRelationType" runat="server" CssClass="label">
                                    <asp:TextBox ID="txtRelationType" runat="server" CssClass="InputTxtBox" ValidationGroup="RelationType"
                                        Width="180px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqFldDocumentType" runat="server" ControlToValidate="txtRelationType"
                                        ErrorMessage="*" ValidationGroup="DocType"></asp:RequiredFieldValidator>
                                    <asp:CheckBox ID="chkRelationTypeIsActive" runat="server" CssClass="chkText" Text=" Is Active" />
                                </asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                            </td>
                            <td align="left" class="label">
                                Name Of Member<span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtNameOfRelative" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="reqFldNameOfRelative" runat="server" ControlToValidate="txtNameOfRelative"
                                    Display="None" ErrorMessage="Name Required" ValidationGroup="InsertRelative">
                                </asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldNameOfRelative_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldNameOfRelative" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td align="left" class="label">
                                Date Of Birth<span class="RequiredLabel">*</span>
                            </td>
                            <td align="left" class="label"> 
                                <asp:TextBox ID="txtDateOfBirth" runat="server" CssClass="InputTxtBox" Width="100px"></asp:TextBox>
                                &nbsp;(MM/DD/YYYY)
                                <asp:CompareValidator ID="dateValidatorDOB" runat="server" ControlToValidate="txtDateOfBirth"
                                    ErrorMessage="Invalid Date" Operator="DataTypeCheck" Type="Date" ValidationGroup="InsertRelative">
                                </asp:CompareValidator>
                                <cc1:CalendarExtender ID="txtDateOfBirth_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtDateOfBirth">
                                </cc1:CalendarExtender>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldDateOfBirth" runat="server" ControlToValidate="txtDateOfBirth"
                                    Display="None" ErrorMessage="Date Of Birth Required" ValidationGroup="InsertRelative">
                                </asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldDateOfBirth_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldDateOfBirth" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td align="left" class="label">
                                Gender<span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:RadioButtonList ID="rdbtnGender" runat="server" class="label" CssClass="rbdText"
                                    RepeatDirection="Horizontal">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td align="left">
                                <asp:RequiredFieldValidator ID="reqFldGender" runat="server" ControlToValidate="rdbtnGender"
                                    Display="None" ErrorMessage="Gender Required" ValidationGroup="InsertRelative">
                                </asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldGender_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldGender" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td align="left" class="label">
                                Address<span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtAddress" runat="server" CssClass="InputTxtBox" Width="300px"
                                    Height="50px" TextMode="MultiLine"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldAddress" runat="server" ControlToValidate="txtAddress"
                                    ErrorMessage="Address Required" ValidationGroup="InsertRelative" Display="None">
                                </asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender ID="reqFldAddress_ValidatorCalloutExtender"
                                    runat="server" Enabled="True" TargetControlID="reqFldAddress" CloseImageUrl="~/Sources/images/valClose.png"
                                    CssClass="customCalloutStyle" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td align="left" class="label">
                                Family Member's Insurance No.<span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtFamilyInsuNo" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldFamilyInsuNo" runat="server" ControlToValidate="txtFamilyInsuNo"
                                    Display="None" ErrorMessage="Insurance No. Required" ValidationGroup="InsertRelative">
                                </asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender ID="reqFldFamilyInsuNo_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldFamilyInsuNo" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td align="left">
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td align="left" class="label">
                                Contact Number
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtContactNumber" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDetails" runat="server" CssClass="InputTxtBox" Visible="False"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFldDetails" runat="server" ControlToValidate="txtDetails"
                                    Display="None" ErrorMessage="Details Required"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldDetails_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldDetails" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td align="left">
                                <asp:Button ID="btnInsertRelative" runat="server" CssClass="styled-button-1" OnClientClick="if (!confirm('Are you Sure to Make Change ?')) return false"
                                    Text="Insert" ValidationGroup="InsertRelative" />
                                &nbsp;<asp:Button ID="btnCancelSelection" runat="server" CssClass="styled-button-1"
                                    Text="Cancel" />
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
                <asp:Panel ID="pnlRelativesInfo" runat="server" Width="900px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <div style="max-height: 400px; max-width: 100%; overflow: auto">
                                    <asp:GridView ID="grdRelativesInfo" runat="server" SkinID="grdNoFooter" AutoGenerateColumns="False"
                                        EmptyDataText="No Data Available" CssClass="mGrid">
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
                                            <asp:TemplateField HeaderText="Family Member">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("RelationType") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRelationType" runat="server" Text='<%# Bind("RelationType") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="RelationTypeID" Visible="False">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("RelationTypeID") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRelationTypeID" runat="server" Text='<%# Bind("RelationTypeID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Name of Member">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("NameOfRelative") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNameOfRelative" runat="server" Text='<%# Bind("NameOfRelative") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Date Of Birth">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("DateOfBirth") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDateOfBirth" runat="server" Text='<%# Bind("DateOfBirth") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Gender">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Gender") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGender" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
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
                                            <asp:TemplateField HeaderText="Contact Number">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ContactNumber") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ContactNumber") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Insurance No.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFamilyInsuranceNo" runat="server" Text='<%# Bind("FamilyInsuranceNo") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("FamilyInsuranceNo") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Details" Visible="False">
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
