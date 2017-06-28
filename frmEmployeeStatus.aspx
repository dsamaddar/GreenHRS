<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmEmployeeStatus.aspx.vb" Inherits="frmEmployeeStatus" Title="::Employee Status::" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 133px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script src="../Sources/js/jquery-1.10.2.js" type="text/javascript"></script>

    <script src="../Sources/js/jquery.ui.core.min.js" type="text/javascript"></script>

    <script src="../Sources/js/jquery.tablesorter.min.js" type="text/javascript"></script>

    <table style="width: 100%;">
        <tr>
            <td>
            </td>
            <td align="center">
                <asp:Panel ID="pnlAttendanceReportParam" runat="server" Width="800px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="5">
                                <div class="widget-title">
                                    Employee Status Report<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td class="style1">
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Joining Date From
                            </td>
                            <td>
                                <asp:TextBox ID="txtJoiningDtFrom" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                                &nbsp;
                                <cc1:CalendarExtender ID="txtJoiningDtFrom_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtJoiningDtFrom" Format ="dd-MMM-yyyy">
                                </cc1:CalendarExtender>
                                
                                To
                                <asp:TextBox ID="txtJoiningDtTo" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                                &nbsp;
                                <cc1:CalendarExtender ID="txtJoiningDtTo_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtJoiningDtTo" Format ="dd-MMM-yyyy">
                                </cc1:CalendarExtender>
                                
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Employee Type
                            </td>
                            <td>
                                 <asp:DropDownList ID="ddlEmpType" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td class="label">
                                Branch
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        
                        <tr align="left">
                            <td colspan="5">
                                <div style="max-width:100%; max-height: 150px; overflow: auto">
                                    <asp:CheckBoxList ID="chkListBranch" runat="server" CssClass="chkText" 
                                        RepeatColumns="4">
                                    </asp:CheckBoxList>
                                </div>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                As on Date
                            </td>
                            <td>
                                <asp:TextBox ID="txtReportDate" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                                &nbsp;
                                <cc1:CalendarExtender ID="txtReportDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtReportDate" Format ="dd-MMM-yyyy">
                                </cc1:CalendarExtender>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="reqFldReportDate" runat="server" ControlToValidate="txtReportDate"
                                    Display="None" ErrorMessage="Required: Report Date" ValidationGroup="ShowReport"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldReportDate_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldReportDate" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                               Gender
                            </td>
                            <td align="left" style="float: left">
                                <asp:RadioButtonList ID="rdbtnGender" runat="server" class="label" CssClass="rbdText"
                                    RepeatDirection="Horizontal">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="style1">
                            </td>
                            <td style="margin-left: 40px">
                                <asp:Button ID="btnShowReport" runat="server" CssClass="styled-button-1" Text="Show Report"
                                    ValidationGroup="ShowReport" />
                                
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
