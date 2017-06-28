<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmDisparityCalculation.aspx.vb" Inherits="Payroll_frmDisparityCalculation"
    Title=".:HRS:Disparity Calculation:." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlSearchPanel" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="5">
                                <div class="widget-title">
                                    Disparity Report</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
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
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Select Designation
                            </td>
                            <td>
                                <asp:DropDownList ID="drpSelectDesignation" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td class="label">
                                Select Department
                            </td>
                            <td>
                                <asp:DropDownList ID="drpSelectDepartment" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Select Branch
                            </td>
                            <td>
                                <asp:DropDownList ID="drpULCBranch" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
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
                                <asp:Button ID="btnShowReport" runat="server" CssClass="styled-button-1" Text="Show Report" />
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
                <asp:Panel ID="pnlDisparityInfo" runat="server" Width="100%" SkinID="pnlInner">
                    <asp:GridView ID="grdDisparity" runat="server" AutoGenerateColumns="False" 
                        CssClass="mGrid">
                        <Columns>
                            <asp:BoundField DataField="EmpCode" HeaderText="EmpCode" />
                            <asp:BoundField DataField="EmployeeName" HeaderText="Employee" />
                            <asp:BoundField DataField="Designation" HeaderText="Designation" />
                            <asp:BoundField DataField="Department" HeaderText="Department" />
                            <asp:BoundField DataField="Branch" HeaderText="Branch" />
                            <asp:BoundField DataField="JoiningDate" HeaderText="Joining Date" />
                            <asp:BoundField DataField="BasicSalary" HeaderText="BasicSalary" />
                            <asp:BoundField DataField="ExpWithCompany" HeaderText="Exp. With Company" />
                            <asp:BoundField DataField="PromotionHistory" HeaderText="Promotion History" />
                            <asp:BoundField DataField="Age" HeaderText="Age" />
                            <asp:BoundField DataField="LastPromotionSince" 
                                HeaderText="Last Promotion Since" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
