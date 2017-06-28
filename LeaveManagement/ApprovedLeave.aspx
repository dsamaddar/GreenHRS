<%@ Page Language="VB" MasterPageFile="~/EmployeeServices.master" AutoEventWireup="false"
    CodeFile="ApprovedLeave.aspx.vb" Inherits="LeaveManagement_ApprovedLeave" Title="::Approved Leave::"
    Theme="CommonSkin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <link href="../Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
    <table width="100%">
        <tr>
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
        <tr>
            <td>
                &nbsp;
            </td>
            <td align="center">
                <asp:Panel ID="pnlSearchByIntGrade" runat="server" Width="800px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" class="label">
                                Approval date from
                            </td>
                            <td>
                                <asp:TextBox ID="dtDateFrom" runat="server" TabIndex="10" CssClass="InputTxtBox"
                                    Width="100px"></asp:TextBox>
                                <cc1:CalendarExtender ID="dtTrainingDate_CalendarExtender" Format="dd-MMM-yy" runat="server"
                                    Enabled="True" TargetControlID="dtDateFrom">
                                </cc1:CalendarExtender>
                                &nbsp To
                            </td>
                            <td align="left">
                                <asp:TextBox ID="dtDateTo" runat="server" TabIndex="10" CssClass="InputTxtBox" Width="100px"></asp:TextBox>
                                <cc1:CalendarExtender ID="Calendarextender1" Format="dd-MMM-yy" runat="server" Enabled="True"
                                    TargetControlID="dtDateTo">
                                </cc1:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                Leave Type
                            </td>
                            <td colspan="2" align ="left" >
                                <asp:DropDownList ID="ddlLeaveType" runat="server" CssClass="InputTxtBox " Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
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
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="styled-button-1" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
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
                            <td colspan="3" align="center">
                                <asp:GridView ID="grdLeave" Font-Names="Arial" Font-Size="12px" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="LeaveRequestID" CellPadding="5" CellSpacing="3" AllowPaging="True"
                                    PageSize="20" EmptyDataText="No Records Available">
                                    <Columns>
                                        <asp:BoundField DataField="LeaveFrom" HeaderText="Leave From" SortExpression="LeaveFrom" />
                                        <asp:BoundField DataField="LeaveTo" HeaderText="Leave To" ReadOnly="True" SortExpression="LeaveTo" />
                                        <asp:BoundField DataField="TotalDays" HeaderText="Total Days" ReadOnly="True" SortExpression="TotalDays" />
                                        <asp:BoundField DataField="TotalWorkingDays" HeaderText="Total Working Days" ReadOnly="True"
                                            SortExpression="TotalWorkingDays" />
                                        <asp:BoundField DataField="EntryDate" HeaderText="Requested Date" ReadOnly="True"
                                            SortExpression="EntryDate" />
                                        <asp:BoundField DataField="ApprovalDate" HeaderText="Approved Date" ReadOnly="True"
                                            SortExpression="ApprovalDate" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
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
