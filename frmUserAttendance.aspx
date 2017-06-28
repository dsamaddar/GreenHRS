<%@ Page Language="VB" Theme="CommonSkin"  AutoEventWireup="false" CodeFile="frmUserAttendance.aspx.vb" Inherits="frmUserAttendance" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>.:HRM:User Attendance:.</title>
    <link href="Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table style="width:100%;">
        <tr align="center" style="height:200px" >
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center" >
            <td>
                &nbsp;</td>
            <td>
                <asp:Panel ID="pnlUserAttendance" runat="server" Width="470px" 
                    SkinID="pnlInner" >
                    <table style="width:100%;">
                        <tr>
                            <td style="width:20px">
                                &nbsp;</td>
                            <td colspan="2" align="center" ><h2 style="color:Gray">ULC Attendance Register</h2></td>
                            <td style="width:20px">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width:20px" >
                                &nbsp;</td>
                            <td style="width:150px">
                                &nbsp;</td>
                            <td style="width:280px" >
                                &nbsp;</td>
                            <td style="width:20px">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" >
                                &nbsp;</td>
                            <td align="left" class="label" >
                                User Name</td>
                            <td align="left" class="label" >
                                <asp:Label ID="lblUserName" runat="server"></asp:Label>
                            </td>
                            <td align="left" class="label">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" >
                                &nbsp;</td>
                            <td align="left" class="label" >
                                Login Time</td>
                            <td align="left" class="label" >
                                <asp:Label ID="lblLogInTime" runat="server"></asp:Label>
                                </td>
                            <td align="left" class="label">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left" class="label">
                                Work Station</td>
                            <td align="left" class="label">
                                <asp:Label ID="lblWorkStation" runat="server"></asp:Label>
                            </td>
                            <td align="left" class="label">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" >
                                &nbsp;</td>
                            <td align="left" class="label" >
                                Ip Address</td>
                            <td align="left" class="label">
                                <asp:Label ID="lblIpAddress" runat="server"></asp:Label>
                            </td>
                            <td align="left" class="label">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left" class="label">
                                Late Attendance Type</td>
                            <td align="left">
                                <asp:DropDownList ID="drpLateAttendanceCause" runat="server" 
                                    CssClass="InputTxtBox" Width="250px">
                                </asp:DropDownList>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left" class="label">
                                Remarks</td>
                            <td align="left">
                                <asp:TextBox ID="txtRemarks" runat="server" CssClass="InputTxtBox" 
                                    Height="50px" TextMode="MultiLine" Width="250px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="btnSubmitAttendance" runat="server" CssClass="styled-button-1" 
                                    Text="Submit" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
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
        <tr align="center" >
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
