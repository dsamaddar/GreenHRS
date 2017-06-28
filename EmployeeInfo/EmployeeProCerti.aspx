<%@ Page Language="VB" MasterPageFile="~/EmployeeInfo/EmployeeMasterPage.master"
    AutoEventWireup="false" CodeFile="EmployeeProCerti.aspx.vb" Inherits="EmployeeInfo_EmployeeProCerti"
    Title=".:HRM:Emp. Pro. Certification:." Theme="CommonSkin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
    <table style="width: 100%;">
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Label ID="lblMsg" runat="server" Width="800px" Height="25px" BackColor="Green"
                    ForeColor="Yellow" Text="Please save your information before exiting this page" CssClass="NotificationBar"></asp:Label>
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
                <asp:Panel ID="pnlEmpProCertificationInfo" runat="server" Width="800px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label" style="width: 150px">
                                &nbsp;
                            </td>
                            <td align="left" style="width: 230px" class="label">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Certification</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtCertificationName" runat="server" Width="230px" CssClass="InputTxtBox"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFldCompanyName" runat="server" ControlToValidate="txtCertificationName"
                                    ErrorMessage="*" ValidationGroup="SubmitCan"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Issuing Authority</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtInstitutionName" runat="server" Width="230px" CssClass="InputTxtBox"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtInstitutionName"
                                    ErrorMessage="*" ValidationGroup="SubmitCan"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Location</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtLocation" runat="server" Width="230px" CssClass="InputTxtBox"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Issuing Date</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="dtDateFrom" runat="server" Width="80px" CssClass="InputTxtBox">
                                </asp:TextBox>
                                <cc1:CalendarExtender ID="dtDateFrom_CalendarExtender" Format="dd-MMM-yy" runat="server"
                                    Enabled="True" TargetControlID="dtDateFrom">
                                </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="dtDateFrom"
                                    ErrorMessage="*" ValidationGroup="SubmitCan"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Expire Date</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="dtDateTo" runat="server" CssClass="InputTxtBox" Width="80px">
                                </asp:TextBox>
                                <cc1:CalendarExtender ID="dtDateTo_CalendarExtender" runat="server" Enabled="True"
                                    Format="dd-MMM-yy" TargetControlID="dtDateTo">
                                </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="dtDateTo"
                                    ErrorMessage="*" ValidationGroup="SubmitCan"></asp:RequiredFieldValidator>
                                &nbsp;
                                <asp:CheckBox ID="chkNeverExpire" runat="server" AutoPostBack="true" />Never Expire
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left">
                                <asp:Button ID="btnAddCerti" runat="server" CssClass="styled-button-1" Text="ADD"
                                    ValidationGroup="SubmitCan" />
                                &nbsp;<asp:Button ID="btnSubmit" runat="server" CssClass="styled-button-1" Text="Save"
                                    ValidationGroup="SubmitCanDef" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="height: 12px">
                            </td>
                            <td align="left" class="label" style="height: 12px">
                            </td>
                            <td align="left" style="height: 12px">
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
                <asp:Panel ID="pnlCertification" runat="server" Width="800px" SkinID="pnlInner">
                    <div style="max-height: 400px; max-width: 100%; overflow: auto">
                        <asp:GridView ID="grdCertification" runat="server" AutoGenerateColumns="False" SkinID="grdNoFooter">
                            <Columns>
                                <asp:TemplateField HeaderText="Sl">
                                    <ItemTemplate>
                                        <b>
                                            <%#CType(Container, GridViewRow).RowIndex + 1%></b>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Certification Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCertificationName" runat="server" Text='<%# Bind("CertificationName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CertificationName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Issuing Authority">
                                    <ItemTemplate>
                                        <asp:Label ID="lblInstituteName" runat="server" Text='<%# Bind("InstituteName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("InstituteName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Location">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Location") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Issuing Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDateFrom" runat="server" Text='<%#Eval("IssuingDate", "{0:D}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%#Eval("IssuingDate", "{0:D}") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Expire Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDateTo" runat="server" Text='<%#Eval("ExpireDate", "{0:D}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%#Eval("ExpireDate", "{0:D}") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNeverExpire" runat="server" Text='<%#Eval("NeverExpire") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%#Eval("NeverExpire") %>'></asp:TextBox>
                                    </EditItemTemplate>
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
            <td>
                &nbsp;
            </td>
        </tr>
        <%--<%#CType(Container, GridViewRow).RowIndex + 1%>
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Panel ID="pnlbuttons" runat="server" Width="700px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="center">
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>--%>
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
