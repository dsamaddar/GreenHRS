<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmEmpAbsentReportAll.aspx.vb" Inherits="LeaveManagement_frmEmpAbsentReportAll"
    Title=".:HRM:All Emp. Absent Report:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script src="../Sources/js/jquery-1.10.2.js" type="text/javascript"></script>

    <script src="../Sources/js/jquery.ui.core.min.js" type="text/javascript"></script>

    <script src="../Sources/js/jquery.tablesorter.min.js" type="text/javascript"></script>

    <table style="width: 100%;">
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlEmpAttendanceStatus" runat="server" SkinID="pnlInner" Width="70%">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="4">
                                <div class="widget-title">
                                    Attendance Report<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
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
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Select Date
                            </td>
                            <td class="label" align="left">
                                <asp:TextBox ID="txtAbsentDate" runat="server" CssClass="InputTxtBox" Width="120px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtAbsentDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtAbsentDate">
                                </cc1:CalendarExtender>
                                &nbsp;(MM/DD/YYYY)
                            </td>
                            <td class="label">
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                            </td>
                            <td class="label">
                                <asp:RequiredFieldValidator ID="reqFldDateFrom" runat="server" ControlToValidate="txtAbsentDate"
                                    Display="None" ErrorMessage="" ValidationGroup="ProcessReport"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldDateFrom_ValidatorCalloutExtender1" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldDateFrom" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                                &nbsp;<asp:CompareValidator ID="dateValidatorJoining" runat="server" ControlToValidate="txtAbsentDate"
                                    ErrorMessage="Invalid Date" Operator="DataTypeCheck" Type="Date" ValidationGroup="ProcessReport"></asp:CompareValidator>
                            </td>
                            <td class="label">
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td align="left">
                                <asp:Button ID="btnProcessReport" runat="server" CssClass="styled-button-1" Text="Process Report"
                                    ValidationGroup="ProcessReport" />
                                &nbsp;<asp:Button ID="btnExport" runat="server" CssClass="styled-button-1" Text="Export"
                                    ValidationGroup="ShowReport" Enabled="False" />
                            </td>
                            <td>
                                &nbsp;
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
                <asp:Panel ID="pnlAbsentReportData" runat="server" SkinID="pnlInner" Width="90%">
                    <div style="max-height: 500px; max-width: 100%; overflow: auto">
                        <asp:GridView ID="grdAbsentReport" runat="server" AutoGenerateColumns="False" CssClass="mGrid">
                            <Columns>
                                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" Visible="False" />
                                <asp:BoundField DataField="EmployeeName" HeaderText="Employee" />
                                <asp:BoundField DataField="EmpCode" HeaderText="EmpCode" />
                                <asp:BoundField DataField="Department" HeaderText="Department" />
                                <asp:BoundField DataField="Branch" HeaderText="Branch" />
                                <asp:BoundField DataField="ContactNumber" HeaderText="ContactNumber" />
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
            var elem = document.getElementById('<%=grdAbsentReport.ClientID%>');
            $(elem).tablesorter();
         }); 
    </script>

</asp:Content>
