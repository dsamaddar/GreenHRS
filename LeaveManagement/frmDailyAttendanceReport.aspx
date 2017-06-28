<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmDailyAttendanceReport.aspx.vb" Inherits="LeaveManagement_frmDailyAttendanceReport"
    Title=".:HRM:Daily Attendance Report:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                <asp:Panel ID="pnlAttendanceReportParam" runat="server" Width="90%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="5">
                                <div class="widget-title">
                                    Daily Attendance Report<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                                &nbsp;
                            </td>
                            <td style="width: 200px;" align="left">
                                &nbsp;
                            </td>
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
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td align="left" style="width: 200px;">
                                <asp:Button ID="btnSyncOLDAttSystem" runat="server" CssClass="styled-button-1" Text="Sync. OLD Att." />
                            </td>
                            <td>
                                <asp:HyperLink ID="hplnkThumbDetectionSystem" runat="server" Target="_blank" NavigateUrl="http://192.168.1.232/HRSExtra/frmSyncUserAttendance.aspx">Sync. 
                                Thumb Detection</asp:HyperLink>
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
                                Report Date
                            </td>
                            <td>
                                <asp:TextBox ID="txtReportDate" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                                &nbsp;
                                <cc1:CalendarExtender ID="txtReportDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtReportDate">
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
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td style="margin-left: 40px">
                                <asp:Button ID="btnShowReport" runat="server" CssClass="styled-button-1" Text="Show Report"
                                    ValidationGroup="ShowReport" />
                                &nbsp;<asp:Button ID="btnExport" runat="server" CssClass="styled-button-1" Text="Export"
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
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlAttReport" runat="server" Width="90%" SkinID="pnlInner">
                    <div style="max-height: 500px; max-width: 100%; overflow: auto">
                        <asp:GridView ID="grdAttReport" runat="server" AutoGenerateColumns="False" CssClass="mGrid">
                            <Columns>
                                <asp:TemplateField HeaderText="UserAttendanceID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("UserAttendanceID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Employee">
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EmpCode">
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("EmpCode") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="UserID">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("UserID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="AttendanceID">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("AttendanceID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Designation">
                                    <ItemTemplate>
                                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("Designation") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Department">
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Department") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Branch">
                                    <ItemTemplate>
                                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("Branch") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="WorkStation">
                                    <ItemTemplate>
                                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("WorkStation") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="LogTime">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("LogTime") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Remarks">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
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
     <script language="javascript" type="text/javascript">
        $(document).ready(function(){
            var elem = document.getElementById('<%=grdAttReport.ClientID%>');
            $(elem).tablesorter();
         }); 
    </script>
</asp:Content>
