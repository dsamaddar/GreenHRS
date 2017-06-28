<%@ Page Language="VB" MasterPageFile="~/EmployeeProfile/MasterEmpProfile.master"
    AutoEventWireup="false" CodeFile="frmEmpLoanAccounts.aspx.vb" Inherits="EmployeeProfile_frmEmpLoanAccounts"
    Title=".:HRM:Employee Benefit/Loan:." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
            </td>
            <td align="left">
                <asp:Panel ID="pnlEmpLoanAccounts" runat="server" Width="100%">
                    <div class="widget-title">
                        Loan/Benefits</div>
                    <div>
                        <asp:GridView ID="grdEmpLoanAcc" runat="server" AutoGenerateColumns="False" CssClass="mGrid"
                            ShowFooter="True">
                            <Columns>
                                <asp:TemplateField HeaderText="Sl">
                                    <ItemTemplate>
                                        <font style="font-size: 12px">
                                            <%#CType(Container, GridViewRow).RowIndex + 1%>
                                        </font>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EmpLoanAccountID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEmpLoanAccountID" runat="server" Text='<%# Bind("EmpLoanAccountID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EmployeeID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEmployeeID" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="BenefitID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("BenefitID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Benefit Type">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("BenefitType") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Loan Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLoanAmount" runat="server" Text='<%# Bind("LoanAmount","{0:N2}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tenure">
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Tenure") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Interest Rate">
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("InterestRate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Dursement Date">
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("ReimbursementDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Salary Adjustment">
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("SalaryAdjustment") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Abatement Applicable">
                                    <ItemTemplate>
                                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("AbatementApplicable") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Depreciable">
                                    <ItemTemplate>
                                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("Depreciable") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Loan Status">
                                    <ItemTemplate>
                                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("LoanStatus") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Outstanding">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOutstanding" runat="server" Text='<%# Bind("Outstanding","{0:N2}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Description" ShowHeader="True" Visible="True">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbtnPrimaryBenefitDetailsView" runat="server" CausesValidation="False"
                                            CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("BenefitID","openWindow(""frmBenefitDetailsView.aspx?BenefitID={0}"",""Popup"",600,600);") %>'
                                            Text=" View ">
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="View" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbtnViewAmortization" runat="server" CausesValidation="False"
                                            CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("EmpLoanAccountID","openWindow(""frmEmpLoanAmortizationInfo.aspx?EmpLoanAccountID={0}"",""Popup"",1000,800);") %>'
                                            Text="View"></asp:LinkButton>
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
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
