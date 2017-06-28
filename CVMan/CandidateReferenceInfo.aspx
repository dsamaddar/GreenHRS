<%@ Page Language="VB" MasterPageFile="~/CVMan/HRMCVMaster.master" AutoEventWireup="false"
    CodeFile="CandidateReferenceInfo.aspx.vb" Inherits="CandidateReferenceInfo" Title=".:HRM:Can. Reference Info:."
    Theme="CommonSkin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
    <link href="../Sources/css/ValidatorStyle.css" rel="stylesheet" type="text/css" />

    <script src="../Sources/js/jquery.min.js" type="text/javascript"></script>

    <script src="../Sources/js/MaxLength.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            //Specifying the Character Count control explicitly
            $("[id*=txtAddress1]").MaxLength(
            {
                MaxLength: 400,
                CharacterCountControl: $('#counter')
            });
            
               //Specifying the Character Count control explicitly
            $("[id*=txtOrganizationName1]").MaxLength(
            {
                MaxLength: 200,
                CharacterCountControl: $('#counter2')
            });
           
        });
    </script>

    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Label ID="lblRedirectMsg" runat="server" Width="100%" Height="25px" BackColor="#195227"
                    ForeColor="Red" CssClass="blinkytext"></asp:Label>
            </td>
        </tr>
        <tr align="center">
            <td style="margin-left: 40px">
                <asp:Panel ID="pnlCanReferenceInfo" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" colspan="3">
                                <div class="widget-title">
                                    Reference Information[Please Save Before Leaving This Page]<asp:ScriptManager ID="ScriptManager1"
                                        runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                            </td>
                            <td align="left">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                            </td>
                            <td align="left" class="label">
                                <b>Name</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtName1" runat="server" CssClass="InputTxtBox" Width="250px">
                                </asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldName" runat="server" ControlToValidate="txtName1"
                                    ErrorMessage="Name Required" ValidationGroup="AddRef" Display="None"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldName_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="reqFldName"
                                        CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                <b>Organization Name</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <div id="counter2" style="color: Red; font-family: Verdana">
                                </div>
                                <asp:TextBox ID="txtOrganizationName1" runat="server" CssClass="InputTxtBox" Width="250px">
                                </asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="ReqFldOrganizationName" runat="server" ControlToValidate="txtOrganizationName1"
                                    ErrorMessage="Organization Name Required" ValidationGroup="AddRef" Display="None"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="ReqFldOrganizationName_ValidatorCalloutExtender" runat="server" Enabled="True"
                                        TargetControlID="ReqFldOrganizationName" CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png"
                                        WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Designation
                            </td>
                            <td>
                                <asp:TextBox ID="txtDesignation" CssClass="InputTxtBox" runat="server" Width="250px"> </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td class="label">
                                Relationship Type<span class="RequiredLabel">*</span>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlRelationShipWith" runat="server" CssClass="InputTxtBox"
                                    DataSourceID="dsRelationShipWith" DataTextField="RefRelationName" DataValueField="RefRelationID"
                                    Width="250px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Address<span class="RequiredLabel">*</span>
                            </td>
                            <td>
                                <div id="counter" style="color: Red; font-family: Verdana">
                                </div>
                                <asp:TextBox ID="txtAddress1" runat="server" CssClass="InputTxtBox" Width="250px"
                                    Height="45px" TextMode="MultiLine"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="ReqFldAddress" runat="server" ControlToValidate="txtAddress1"
                                    ErrorMessage="Address Required" ValidationGroup="AddRef" Display="None"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="ReqFldAddress_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="ReqFldAddress"
                                        CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Mobile<span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtMobile1" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="ReqFldMobile" runat="server" ControlToValidate="txtMobile1"
                                    ErrorMessage="Mobile No. Required" ValidationGroup="AddRef" Display="None"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="ReqFldMobile_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="ReqFldMobile"
                                        CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Email
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmail1" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:TextBox>
                                &nbsp;<asp:RegularExpressionValidator ID="regExpEmailAddress" runat="server" ControlToValidate="txtEmail1"
                                    ErrorMessage="Input Correct E-mail Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ValidationGroup="AddRef"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnAddRef" runat="server" CssClass="styled-button-1" Text="ADD" ValidationGroup="AddRef"
                                    Width="100px" />
                                &nbsp;<asp:Button ID="btnSave" runat="server" CssClass="styled-button-1" Text="Save"
                                    ValidationGroup="SubmitCanDef" Width="100px" />
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:SqlDataSource ID="dsRelationShipWith" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="SELECT DISTINCT [RefRelationName], [RefRelationID] FROM [tblReferenceRelationType] where isActive=1 ORDER BY [RefRelationName]">
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlR" runat="server" Width="100%" SkinID="pnlInner">
                    <div style="max-height: 200px; max-width: 100%; overflow: auto">
                        <asp:GridView ID="grdReference" runat="server" AutoGenerateColumns="False" SkinID="grdNoFooter"
                            Width="100%" CssClass="mGrid">
                            <Columns>
                                <asp:TemplateField HeaderText="Sl">
                                    <ItemTemplate>
                                        <b>
                                            <%#CType(Container, GridViewRow).RowIndex + 1%></b>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Designation">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDesignation" runat="server" Text='<%# Bind("Designation") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Organization">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOrganizationName" runat="server" Text='<%# Bind("OrganizationName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="RefRelationID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRefRelationID" runat="server" Text='<%# Bind("RefRelationID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Relationship">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRefRelationName" runat="server" Text='<%# Bind("RefRelationName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Address">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mobile">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMobileNo" runat="server" Text='<%# Bind("MobileNo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete">
                                    <ItemTemplate>
                                        <asp:ImageButton Width="40" ID="imgDelete" CommandName="Delete" runat="server" OnClientClick="return confirm('Are You Sure You Want to Delete?')"
                                            ImageUrl="~/img/delete.jpg" CausesValidation="False" />
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
