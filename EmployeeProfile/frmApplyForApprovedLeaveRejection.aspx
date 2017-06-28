<%@ Page Title="GreenHRS: Approved Leave Rejection" Language="VB" MasterPageFile="~/EmployeeProfile/MasterEmpProfile.master"
    AutoEventWireup="false" CodeFile="frmApplyForApprovedLeaveRejection.aspx.vb"
    Theme="CommonSkin" Inherits="EmployeeProfile_frmApplyForApprovedLeaveRejection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Panel ID="pnlApprovedLeave" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td class="widget-title">
                                Apply For Rejection of Approved Leave
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="max-height: 300px; max-width: 100%; overflow: auto">
                                    <asp:GridView ID="grdApprovedLeave" runat="server" AutoGenerateColumns="False" CellPadding="0"
                                        CssClass="mGrid" DataKeyNames="LeaveRequestID" EmptyDataText="No Records Available"
                                        Font-Names="Arial" Font-Size="12px" PageSize="20" ShowFooter="True">
                                        <Columns>
                                            <asp:CommandField ShowSelectButton="True" />
                                            <asp:TemplateField HeaderText="LeaveRequestID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLeaveRequestID" runat="server" Text='<%# Bind("LeaveRequestID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="LeaveType">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("LeaveType") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Leave From" SortExpression="LeaveFrom">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("LeaveFrom") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Leave To" SortExpression="LeaveTo">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("LeaveTo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total Days" SortExpression="TotalDays">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTotalDays" runat="server" Text='<%# Bind("TotalDays") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total Working Days" SortExpression="TotalWorkingDays">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTotalWorkingDays" runat="server" Text='<%# Bind("TotalWorkingDays") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Requested Date" SortExpression="EntryDate">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("EntryDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Approved Date" SortExpression="ApprovalDate">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("ApprovalDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Purpose">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("PurposeOfLeave") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="LeaveStatus">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLeaveStatus" runat="server" Text='<%# Bind("LeaveStatus") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtRemarks" runat="server" Height="50px" TextMode="MultiLine" Width="250px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldRemarks" runat="server" ControlToValidate="txtRemarks"
                                    ErrorMessage="*" ValidationGroup="LRejectionReq"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnLeaveRejectionRequest" runat="server" CssClass="styled-button-1"
                                    Text="Leave Rejection Request" ValidationGroup="LRejectionReq" />
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
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
</asp:Content>
