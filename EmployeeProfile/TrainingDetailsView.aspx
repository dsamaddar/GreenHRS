<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TrainingDetailsView.aspx.vb"
    Inherits="EmployeeProfile_TrainingDetailsView" Theme="CommonSkin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>::Training Details::</title>
    <link href="../Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .DescriptiveLabel
        {
            color: #4169E1;
            font-family: Cambria,Palatino, "Palatino Linotype" , "Palatino LT STD" ,Georgia,serif;
            font-size: 13px;
            font-weight: bold;
        }
        .ImportantField
        {
            color: #078E19;
            font-family: Cambria,Palatino, "Palatino Linotype" , "Palatino LT STD" ,Georgia,serif;
            font-size: 13px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table style="width: 100%;">
        <tr>
            <td>
                &nbsp;
            </td>
            <td align="center">
                &nbsp;
            </td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr align="center" id="idPanel" runat="server">
            <td>
                &nbsp;
            </td>
            <td id="Showable" runat="server">
                <asp:Panel ID="pnlJobCircularInfo" runat="server" Width="900px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label" style="width: 130px">
                                &nbsp;
                            </td>
                            <td align="left" style="width: 250px">
                                &nbsp;
                            </td>
                            <td align="left" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label" style="width: 150px">
                                &nbsp;
                            </td>
                            <td align="left" style="width: 250px">
                                &nbsp;
                            </td>
                            <td align="left" style="width: 20px">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Training Type</b>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblTrainingType" runat="server" Width="250px" CssClass="DescriptiveLabel"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Training Name</b>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblTrainingName" runat="server" Width="250px" CssClass="DescriptiveLabel"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Training On</b>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblTrainingOn" runat="server" Width="250px" CssClass="DescriptiveLabel"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Organized By</b>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblOrganizedBy" runat="server" Width="250px" CssClass="DescriptiveLabel"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;
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
                                <asp:Label ID="lblLocation" runat="server" Width="250px" CssClass="DescriptiveLabel"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>County</b>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblCountry" runat="server" Width="250px" CssClass="DescriptiveLabel"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Training Course Outline</b>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblCourseOutline" runat="server" Width="250px" CssClass="DescriptiveLabel"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Resource Person Details</b>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblResourcePDetail" runat="server" Width="250px" CssClass="DescriptiveLabel"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Training Status</b>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblTrainingStatus" runat="server" Width="250px" CssClass="DescriptiveLabel"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Your Experience</b>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblYourExperience" runat="server" Width="250px" CssClass="DescriptiveLabel"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Duration From</b>
                            </td>
                            <td align="left">
                                <div style="max-height: 100px; overflow: auto">
                                    <asp:Label ID="lblFrom" runat="server"  CssClass="ImportantField"></asp:Label>
                                </div>
                            </td>
                            <td align="left" class ="label">
                                To
                            </td>
                            <td colspan="2" align="left">
                                <asp:Label ID="lblTo" runat="server" Width="250px" CssClass="ImportantField"></asp:Label>
                            </td>
                            <td align="left" class="ImportantField">
                                &nbsp;
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
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="left" class="label">
            </td>
            <td align="center">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
