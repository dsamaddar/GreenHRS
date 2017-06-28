<%@ Page Language="VB" AutoEventWireup="false" CodeFile="frmShowTrainingDetails.aspx.vb" Inherits="Training_frmShowTrainingDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>.:HRM: Training Details:.</title>
    <link href="../Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table style="width:100%;">
        <tr align="center" >
            <td>
                &nbsp;</td>
            <td>
                <asp:Panel ID="pnlTrngDetails" runat="server" Width="800px">
                    <table style="width:100%;">
                        <tr align="center" class="label" >
                            <td align="left">
                                Subject</td>
                            <td align="left" >
                                <asp:Label ID="lblTrngSubject" runat="server" Font-Bold="True" 
                                    Font-Overline="False" Font-Size="Larger" Font-Strikeout="False" 
                                    ForeColor="#3366FF"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="center" class="label">
                            <td align="left">
                                Training Details</td>
                            <td align="left" >
                                <asp:TextBox ID="txtTrainingDetails" runat="server" CssClass="InputTxtBox" 
                                    TextMode="MultiLine" Width="400px" Height="60px" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="center" class="label">
                            <td align="left" >
                                Training Type</td>
                            <td  align="left" >
                                <asp:Label ID="lblTrngType" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="center" class="label">
                            <td align="left">
                                Course Level</td>
                            <td  align="left" >
                                <asp:Label ID="lblCourseLevel" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="center" class="label">
                            <td align="left">
                                Initiated By</td>
                            <td  align="left" >
                                <asp:Label ID="lblInitiatedBy" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="center" class="label">
                            <td align="left">
                                Course Duration</td>
                            <td  align="left" >
                                <asp:Label ID="lblCourseDuration" runat="server"></asp:Label>
                                &nbsp;(Hrs.)</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="center" class="label">
                            <td align="left">
                                Duration</td>
                            <td  align="left" >
                                <asp:Label ID="lblDuration" runat="server"></asp:Label>
                                &nbsp;(Weeks)</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="center" class="label">
                            <td align="left">
                                Classes Starts On</td>
                            <td  align="left" >
                                <asp:Label ID="lblClassesStartsOn" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="center" class="label">
                            <td align="left">
                                Last Date Of Registration</td>
                            <td  align="left" >
                                <asp:Label ID="lblLastDateOfRegistration" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="center" class="label">
                            <td align="left">
                                Class Schedule</td>
                            <td  align="left" >
                                <asp:TextBox ID="txtClasschedule" runat="server" CssClass="InputTxtBox" 
                                    TextMode="MultiLine" Width="400px" Height="60px" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="center" class="label">
                            <td align="left">
                                Highlights Of The program</td>
                            <td align="left">
                                <asp:TextBox ID="txtHighlightsOfTheProgram" runat="server" 
                                    CssClass="InputTxtBox" Height="60px" ReadOnly="True" TextMode="MultiLine" 
                                    Width="400px"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="center" class="label">
                            <td align="left">
                                Course Outline</td>
                            <td align="left">
                                <asp:TextBox ID="txtCourseOutline" runat="server" CssClass="InputTxtBox" 
                                    Height="60px" ReadOnly="True" Width="400px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="center" class="label">
                            <td align="left">
                                Expected Benefits</td>
                            <td align="left">
                                <asp:TextBox ID="txtExpectedBenefits" runat="server" CssClass="InputTxtBox" 
                                    Height="60px" ReadOnly="True" TextMode="MultiLine" Width="400px"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="center" class="label">
                            <td align="left">
                                How To Apply</td>
                            <td align="left">
                                <asp:TextBox ID="txtHowToApply" runat="server" CssClass="InputTxtBox" 
                                    Height="60px" ReadOnly="True" Width="400px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="center" class="label">
                            <td align="left">
                                Fees Per Attendees (BDT)</td>
                            <td align="left">
                                <asp:Label ID="lblFeesPerAttendees" runat="server"></asp:Label>
                                &nbsp;(TK.)</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="center" class="label">
                            <td align="left">
                                Resource Person</td>
                            <td align="left">
                                <asp:Label ID="lblResourcePerson" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="center" class="label">
                            <td align="left">
                                Resource Person&#39;s Profile</td>
                            <td align="left">
                                <asp:TextBox ID="txtResourcePersonsProfile" runat="server" 
                                    CssClass="InputTxtBox" Height="60px" ReadOnly="True" Width="400px" 
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="center" class="label">
                            <td align="left">
                                Organized By</td>
                            <td align="left">
                                <asp:Label ID="lblOrganizedBy" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="center" class="label">
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                <asp:Button ID="btnApplyNow" runat="server" CssClass="styled-button-1" 
                                    Text="Apply Now" />
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</form>
</body>
</html>
