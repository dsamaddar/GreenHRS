<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" Theme="CommonSkin" AutoEventWireup="false"
    CodeFile="frmSubjectDefinition.aspx.vb" Inherits="frmSubjectDefinition" Title=".:HRM:Subject Definition:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td>
            </td>
        </tr>
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlSubjectDefinition" runat="server" Width="800px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="5" align="left">
                                <div class="widgettitle">Subject Definition</div>
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
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                            </td>
                            <td align="left" class="label" style="width: 150px">
                                Subject Name<span class="RequiredLabel">*</span>
                            </td>
                            <td align="left" style="width: 200px">
                                <asp:TextBox ID="txtSubjectName" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldSubjectName" runat="server" ControlToValidate="txtSubjectName"
                                    ErrorMessage="Required:Subject Name" ValidationGroup="AddSubjects" Display="None"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldSubjectName_ValidatorCalloutExtender" runat="server"
                                    Enabled="True" TargetControlID="reqFldSubjectName" CssClass="customCalloutStyle"
                                    CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                                &nbsp;
                            </td>
                            <td align="left" class="label" style="width: 150px">
                                Available Subjects
                            </td>
                            <td align="left" style="width: 200px">
                                <asp:DropDownList ID="drpAvailableSubjects" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Subject Code<span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtSubjectCode" runat="server" CssClass="InputTxtBox" Width="100px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldSubjectCode" runat="server" ControlToValidate="txtSubjectCode"
                                    ErrorMessage="Required:Subject Code" ValidationGroup="AddSubjects" Display="None"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldSubjectCode_ValidatorCalloutExtender" runat="server"
                                    Enabled="True" TargetControlID="reqFldSubjectCode" CssClass="customCalloutStyle"
                                    CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left">
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
                                &nbsp;
                            </td>
                            <td align="left">
                                <asp:Button ID="btnInsertSubjects" runat="server" CssClass="styled-button-1" Text="Insert"
                                    ValidationGroup="AddSubjects" />
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
                            <td align="left">
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
