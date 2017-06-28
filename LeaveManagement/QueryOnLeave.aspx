<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="QueryOnLeave.aspx.vb" Inherits="LeaveManagement_QueryOnLeave" Title="::Query On Leave::"
    Theme="CommonSkin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
    <table width="100%">
        <tr>
            <td>
                &nbsp;
            </td>
            <td align="center">
                <asp:Panel ID="pnlSearchByIntGrade" runat="server" Width="80%" 
                    SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="5" align="left">
                                <div class="widgettitle">Leave Report<asp:ScriptManager ID="ScriptManager1" 
                                        runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Leave Type
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlLeaveType" runat="server" CssClass="InputTxtBox " Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td align="left" class="label">
                                Leave Year
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpLeaveYear" runat="server" CssClass="InputTxtBox" 
                                    Width="100px">
                                    <asp:ListItem>All</asp:ListItem>
                                    <asp:ListItem>2005</asp:ListItem>
                                    <asp:ListItem>2006</asp:ListItem>
                                    <asp:ListItem>2007</asp:ListItem>
                                    <asp:ListItem>2008</asp:ListItem>
                                    <asp:ListItem>2009</asp:ListItem>
                                    <asp:ListItem>2010</asp:ListItem>
                                    <asp:ListItem>2011</asp:ListItem>
                                    <asp:ListItem>2012</asp:ListItem>
                                    <asp:ListItem>2013</asp:ListItem>
                                    <asp:ListItem>2014</asp:ListItem>
                                    <asp:ListItem>2015</asp:ListItem>
                                    <asp:ListItem>2016</asp:ListItem>
                                    <asp:ListItem>2017</asp:ListItem>
                                    <asp:ListItem>2018</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Employee Name
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlEmployeeName" runat="server" CssClass="InputTxtBox " Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td></td>
                            <td>
                                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="styled-button-1" />
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
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
                <asp:Panel ID="pnlLeaveRpt" runat="server" SkinID="pnlInner">
                    <div style="max-height:400px;max-width:100%;overflow:auto">
                        <asp:GridView ID="grdLeave" runat="server" AutoGenerateColumns="False" 
                            CssClass="mGrid" DataKeyNames="LeaveRequestID" 
                            EmptyDataText="No Records Available" Font-Names="Arial" Font-Size="12px" 
                            PageSize="20">
                            <Columns>
                                <asp:BoundField DataField="LeaveType" HeaderText="LeaveType" />
                                <asp:BoundField DataField="EmployeeName" HeaderText="Employee" 
                                    SortExpression="EmployeeName" />
                                <asp:BoundField DataField="LeaveFrom" HeaderText="Leave From" 
                                    SortExpression="LeaveFrom" />
                                <asp:BoundField DataField="LeaveTo" HeaderText="Leave To" ReadOnly="True" 
                                    SortExpression="LeaveTo" />
                                <asp:BoundField DataField="TotalDays" HeaderText="Total Days" ReadOnly="True" 
                                    SortExpression="TotalDays" />
                                <asp:BoundField DataField="TotalWorkingDays" HeaderText="Total Working Days" 
                                    ReadOnly="True" SortExpression="TotalWorkingDays" />
                                <asp:BoundField DataField="LeaveStatus" HeaderText="Leave Status" 
                                    ReadOnly="True" SortExpression="LeaveStatus" />
                                <asp:BoundField DataField="EntryDate" HeaderText="Requested Date" 
                                    ReadOnly="True" SortExpression="EntryDate" />
                                <asp:BoundField DataField="ApprovalDate" HeaderText="Approved Date" 
                                    ReadOnly="True" SortExpression="ApprovalDate" />
                                <asp:BoundField DataField="EmergencyAddress" HeaderText="EmergencyAddress" />
                                <asp:BoundField DataField="EmergencyContactNo" 
                                    HeaderText="EmergencyContactNo" />
                                <asp:BoundField DataField="EmergencyMailAddress" 
                                    HeaderText="EmergencyMailAddress" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
