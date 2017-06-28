<%@ Page Theme="CommonSkin" Language="VB" AutoEventWireup="false" CodeFile="frmEmpResignationHRDetails.aspx.vb"
    Inherits="frmEmpResignationHRDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>.:HRM:Resignation Details:.</title>
    <link href="Sources/css/GridStyle.css" rel="stylesheet" type="text/css" />
    <link href="Sources/css/Title.css" rel="stylesheet" type="text/css" />
    <link href="Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
    <link href="Sources/css/ValidatorStyle.css" rel="stylesheet" type="text/css" />
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
                                    Resignation Acceptance Form<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 250px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td valign="top">
                                &nbsp;</td>
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
                            <td rowspan="8" valign="top" align="center" >
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
                                    ForeColor="#009933"></asp:Label>
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
                                Effective Date By Employee</td>
                            <td>
                                <asp:Label ID="lblResignationEffectiveDate" runat="server" CssClass="label" 
                                    ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Effective Date By Supervisor</td>
                            <td>
                                <asp:Label ID="lblResignationEffectiveDateBySupervisor" runat="server" 
                                    CssClass="label" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Reason For Resignation
                            </td>
                            <td>
                                <asp:TextBox ID="txtReasonForResignation" runat="server" Height="50px" 
                                    TextMode="MultiLine" Width="400px"
                                    CssClass="InputTxtBox" ReadOnly="True"></asp:TextBox>
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
                                <asp:TextBox ID="txtFeedBack" runat="server" CssClass="InputTxtBox" 
                                    Height="50px" ReadOnly="True" TextMode="MultiLine" Width="400px"></asp:TextBox>
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
                                    Width="400px" CssClass="InputTxtBox" ReadOnly="True"></asp:TextBox>
                                &nbsp;
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
                                <asp:Button ID="btnAccept" runat="server" CssClass="styled-button-1" OnClientClick="if (!confirm('Are you Sure to Accept Resignation Request ?')) return false"
                                    Text="Accept &amp; Inactive Employee" ValidationGroup="Resignation" />
                                &nbsp;<asp:Button ID="btnReject" runat="server" CssClass="styled-button-1" OnClientClick="if (!confirm('Are you Sure to Reject Resignation Request ?')) return false"
                                    Text="Reject" ValidationGroup="Resignation" />
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
