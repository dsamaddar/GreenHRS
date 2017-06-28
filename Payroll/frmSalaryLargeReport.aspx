<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmSalaryLargeReport.aspx.vb" Inherits="Payroll_frmSalaryLargeReport"
    Title=".:HRS:Salary Large Report:." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlSalaryLargeReportParam" runat="server" Width="50%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="5">
                                <div class="widget-title">
                                    Salary Large Report Generation</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
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
                                Select Year
                            </td>
                            <td>
                                <asp:DropDownList ID="drpSalaryYear" runat="server" CssClass="InputTxtBox" Width="80px">
                                    <asp:ListItem>2010</asp:ListItem>
                                    <asp:ListItem>2011</asp:ListItem>
                                    <asp:ListItem>2012</asp:ListItem>
                                    <asp:ListItem>2013</asp:ListItem>
                                    <asp:ListItem>2014</asp:ListItem>
                                    <asp:ListItem>2015</asp:ListItem>
                                    <asp:ListItem>2016</asp:ListItem>
                                    <asp:ListItem>2017</asp:ListItem>
                                    <asp:ListItem>2018</asp:ListItem>
                                    <asp:ListItem>2019</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="label">
                                Select Month
                            </td>
                            <td>
                                <asp:DropDownList ID="drpSalaryMonth" runat="server" CssClass="InputTxtBox" Width="120px">
                                    <asp:ListItem Value="1">January</asp:ListItem>
                                    <asp:ListItem Value="2">February</asp:ListItem>
                                    <asp:ListItem Value="3">March</asp:ListItem>
                                    <asp:ListItem Value="4">April</asp:ListItem>
                                    <asp:ListItem Value="5">May</asp:ListItem>
                                    <asp:ListItem Value="6">June</asp:ListItem>
                                    <asp:ListItem Value="7">July</asp:ListItem>
                                    <asp:ListItem Value="8">August</asp:ListItem>
                                    <asp:ListItem Value="9">September</asp:ListItem>
                                    <asp:ListItem Value="10">October</asp:ListItem>
                                    <asp:ListItem Value="11">November</asp:ListItem>
                                    <asp:ListItem Value="12">December</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="btnShowReport" runat="server" CssClass="styled-button-1" Text="Show Report" />
                            </td>
                            <td>
                                <asp:ImageButton ID="imgBtnExport" runat="server" ImageUrl="~/Sources/images/excel2.jpg"
                                    Width="30px" />
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
                                &nbsp;
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
                &nbsp;
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlResultSet" runat="server" SkinID="pnlInner" Width="100%">
                    <div style="max-width: 1000px; max-height: 500px; overflow: auto">
                        <asp:GridView ID="grdSalLargeReport" runat="server" AutoGenerateColumns="False" CssClass="mGrid">
                            <Columns>
                                <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeName" />
                                <asp:BoundField DataField="EmpCode" HeaderText="EmpCode" />
                                <asp:BoundField DataField="Designation" HeaderText="Designation" />
                                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" Visible="False" />
                                <asp:TemplateField HeaderText="Basic">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBasicSal" runat="server" Text='<%# Bind("BasicSal") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="House Rent">
                                    <ItemTemplate>
                                        <asp:Label ID="lblHouseRent" runat="server" Text='<%# Bind("HouseRent") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mobile Allowance">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMobileAllowance" runat="server" Text='<%# Bind("MobileAllowance") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Local Conveyance">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLocalConveyance" runat="server" Text='<%# Bind("LocalConveyance") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Transport">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTransport" runat="server" Text='<%# Bind("Transport") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Arrear">
                                    <ItemTemplate>
                                        <asp:Label ID="lblArrear" runat="server" Text='<%# Bind("Arrear") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Festival Allowance">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFestivalAllowance" runat="server" Text='<%# Bind("FestivalAllowance") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Medical Allowance">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMedicalAllowance" runat="server" Text='<%# Bind("MedicalAllowance") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Motorbike Allowance">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMotorbikeAllowance" runat="server" Text='<%# Bind("MotorbikeAllowance") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Professional Allowance">
                                    <ItemTemplate>
                                        <asp:Label ID="lblProfessionalAllowance" runat="server" Text='<%# Bind("ProfessionalAllowance") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Special Allowance">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSpecialAllowance" runat="server" Text='<%# Bind("SpecialAllowance") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Festival">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFestival" runat="server" Text='<%# Bind("Festival") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Performance">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPerformance" runat="server" Text='<%# Bind("Performance") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="TotalBenefit">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTotalBenefit" runat="server" Text='<%# Bind("TotalBenefit") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="AccountRecoverable">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAccountRecoverable" runat="server" Text='<%# Bind("AccountRecoverable") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PF">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPF" runat="server" Text='<%# Bind("PF") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="INSPF">
                                    <ItemTemplate>
                                        <asp:Label ID="lblINSPF" runat="server" Text='<%# Bind("INSPF") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="INSCAR">
                                    <ItemTemplate>
                                        <asp:Label ID="lblINSCAR" runat="server" Text='<%# Bind("INSCAR") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="INSGEN">
                                    <ItemTemplate>
                                        <asp:Label ID="lblINSGEN" runat="server" Text='<%# Bind("INSGEN") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Other">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOther" runat="server" Text='<%# Bind("Other") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tax">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTax" runat="server" Text='<%# Bind("Tax") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="TotalDeduction">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTotalDeduction" runat="server" Text='<%# Bind("TotalDeduction") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTotal" runat="server" Text='<%# Bind("Total") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
