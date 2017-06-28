<%@ Page Theme="CommonSkin" Language="VB" AutoEventWireup="false" CodeFile="frmEmpResignationDetails.aspx.vb"
    Inherits="EmployeeProfile_frmEmpResignationDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>.:HRM:Resignation Details:.</title>
    <link href="Css/GridStyle.css" rel="stylesheet" type="text/css" />
    <link href="Css/Title.css" rel="stylesheet" type="text/css" />
    <link href="../Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
    <link href="../Sources/css/ValidatorStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlResignationSubmissionForm" runat="server" Width="800px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="5">
                                <div class="widget-title">
                                    Resignation Acceptance Form (Supervisor)<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">
                               
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Name
                            </td>
                            <td>
                                <asp:Label ID="lblEmpName" runat="server" CssClass="label"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td rowspan="7" valign="top">
                                <asp:Image ID="imgEmp" runat="server" Height="160px" />
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                ID
                            </td>
                            <td>
                                <asp:Label ID="lblEmpCode" runat="server" CssClass="label"></asp:Label>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Date Of Joining
                            </td>
                            <td>
                                <asp:Label ID="lblDateOfJoining" runat="server" CssClass="label"></asp:Label>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Date Of Confirmation
                            </td>
                            <td>
                                <asp:Label ID="lblDateOfConfirmation" runat="server" CssClass="label"></asp:Label>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Department
                            </td>
                            <td>
                                <asp:Label ID="lblDepartment" runat="server" CssClass="label" 
                                    ForeColor="#009900"></asp:Label>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Supervisor
                            </td>
                            <td>
                                <asp:Label ID="lblSupervisor" runat="server" CssClass="label" 
                                    ForeColor="#009933"></asp:Label>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Branch
                            </td>
                            <td>
                                <asp:Label ID="lblBranch" runat="server" CssClass="label"></asp:Label>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Date Of Birth
                            </td>
                            <td>
                                <asp:Label ID="lblDateOfBirth" runat="server" CssClass="label"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
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
                <asp:Panel ID="pnlResignationDetails" runat="server" Width="800px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 250px">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Resignation Effective Date
                            </td>
                            <td>
                                <asp:Label ID="lblResignationEffectiveDate" runat="server" CssClass="label" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Proposed Effective Date
                            </td>
                            <td>
                                <asp:TextBox ID="txtProposedEffectiveDate" runat="server" CssClass="InputTxtBox"
                                    Width="220px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtProposedEffectiveDate_CalendarExtender" runat="server"
                                    Enabled="True" TargetControlID="txtProposedEffectiveDate">
                                </cc1:CalendarExtender>
                                <asp:CompareValidator ID="dateValidatorConfirmation" runat="server" ControlToValidate="txtProposedEffectiveDate"
                                    ErrorMessage="Invalid Date" Operator="DataTypeCheck" Type="Date" ValidationGroup="Resignation">
                                </asp:CompareValidator>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Reason For Resignation
                            </td>
                            <td>
                                <asp:TextBox ID="txtReasonForResignation" runat="server" Height="50px" TextMode="MultiLine"
                                    Width="400px" CssClass="InputTxtBox" ReadOnly="True"></asp:TextBox>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Feedback about your service with the<br />
                                Company
                            </td>
                            <td>
                                <asp:TextBox ID="txtFeedBack" runat="server" CssClass="InputTxtBox" Height="50px"
                                    ReadOnly="True" TextMode="MultiLine" Width="400px"></asp:TextBox>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlSupervisorComments" runat="server" Width="800px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 250px">
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
                                Comment From Supervisor
                            </td>
                            <td>
                                <asp:TextBox ID="txtSupervisorComment" runat="server" Height="50px" TextMode="MultiLine"
                                    Width="400px" CssClass="InputTxtBox"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="reqFldSupervisorComment" runat="server" ControlToValidate="txtSupervisorComment"
                                    Display="None" ErrorMessage="Required: Supervisor Comment" ValidationGroup="Resignation"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldSupervisorComment_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldSupervisorComment" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnAccept" runat="server" CssClass="styled-button-1"
                                    Text="Accept" ValidationGroup="Resignation"
                                    OnClientClick="if (!confirm('Are you Sure to Accept The Resignation ?')) return false" 
                                     />
                                &nbsp;<asp:Button ID="btnReject" runat="server" CssClass="styled-button-1"
                                    Text="Reject" ValidationGroup="Resignation"
                                    OnClientClick="if (!confirm('Are you Sure to Reject The Resignation ?')) return false" 
                                     />
                            </td>
                            <td>
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
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
