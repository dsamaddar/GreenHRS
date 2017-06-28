<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmEmpWiseSalary.aspx.vb" Inherits="Payroll_frmEmpWiseSalary" Title=":HRM:Employee Wise Salary Info:." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="JavaScript" type="text/javascript">
    function openWindow(windowURL,windowName,windowWidth,windowHeight) {
        var left = (screen.width/2)-(windowWidth/2);
        var top = (screen.height/2)-(windowHeight/2);
        window.name = 'parentWnd';
        newWindow = window.open(windowURL,windowName,'top='+ top +',left='+ left +',width='+windowWidth+',height='+windowHeight+',toolbar=0,location=no,directories=0, status=0,menuBar=0,scrollBars=1,resizable=1');
        newWindow.focus();
    }
    </script>

    <table style="width: 100%;">
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlSalaryParameters" runat="server" SkinID="pnlInner" Width="90%">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="6">
                                <div class="widget-title">
                                    View Salary Info</div>
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
                            <td>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                EmployeeID
                            </td>
                            <td>
                                <asp:DropDownList ID="drpEmployeeList" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Salary Year
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
                            <td>
                            </td>
                            <td class="label">
                                Salary Month
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
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="btnViewSalaryInfo" runat="server" CssClass="styled-button-1" Text="View Salary" />
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnProcessReport" runat="server" BackColor="Blue" 
                                    ForeColor="White" Text="Export Payslip" />
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
                <asp:Panel ID="pnlSalSummary" runat="server" SkinID="pnlInner" Width="90%">
                    <table style="width: 100%;">
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
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Department
                            </td>
                            <td>
                                <asp:Label ID="lblDepartment" runat="server" CssClass="label"></asp:Label>
                            </td>
                            <td class="label">
                                Designation
                            </td>
                            <td>
                                <asp:Label ID="lblDesignation" runat="server" CssClass="label"></asp:Label>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Org. Branch
                            </td>
                            <td>
                                <asp:Label ID="lblOrgBranch" runat="server" CssClass="label"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Bank
                            </td>
                            <td>
                                <asp:Label ID="lblBank" runat="server" CssClass="label" ForeColor="#009933"></asp:Label>
                            </td>
                            <td class="label">
                                Bank Branch
                            </td>
                            <td>
                                <asp:Label ID="lblBankBranch" runat="server" CssClass="label" ForeColor="#009933"></asp:Label>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Account No
                            </td>
                            <td>
                                <asp:Label ID="lblBankAccNo" runat="server" CssClass="label" ForeColor="#009933"></asp:Label>
                            </td>
                            <td class="label">
                                Salary
                            </td>
                            <td>
                                <asp:Label ID="lblSalary" runat="server" CssClass="label" ForeColor="#3366FF"></asp:Label>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Loan Settlement
                            </td>
                            <td>
                                <asp:Label ID="lblLoanSettlement" runat="server" CssClass="label" ForeColor="#CC0000"></asp:Label>
                            </td>
                            <td class="label">
                                Tax Deduction
                            </td>
                            <td>
                                <asp:Label ID="lblTaxDeduction" runat="server" CssClass="label" ForeColor="#CC0000"></asp:Label>
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
                <asp:Panel ID="pnlSalaryComponents" runat="server" SkinID="pnlInner" Width="90%">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td style="width: 50%" valign="top">
                                <asp:GridView ID="grdPositiveComponent" runat="server" AutoGenerateColumns="False"
                                    CssClass="mGrid" EmptyDataText="No Positive Component Available">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Positive Component">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ComponentName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPositiveSalValue" runat="server" Text='<%# Bind("SalValue","{0:N2}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:GridView ID="grdBonusComponent" runat="server" AutoGenerateColumns="False" CssClass="mGrid"
                                    EmptyDataText="No Bonus Available">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Bonus">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ComponentName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("SalValue","{0:N2}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                            <td style="width: 50%" valign="top">
                                <asp:GridView ID="grdNegativeComponent" runat="server" AutoGenerateColumns="False"
                                    CssClass="mGrid" EmptyDataText="No Deduction Available">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Negative Component">
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("ComponentName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblNegativeSalValue" runat="server" Text='<%# Bind("SalValue","{0:N2}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:GridView ID="grdHiddenComponent" runat="server" AutoGenerateColumns="False"
                                    CssClass="mGrid" EmptyDataText="No Hidden Component Available">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Hidden Component">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ComponentName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblHiddenSalValue" runat="server" Text='<%# Bind("SalValue","{0:N2}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
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
            <td align="center">
                <asp:Panel ID="pnlTaxAdvanceAdjustment" runat="server" Width="90%" SkinID="pnlInner">
                    <div class="widget-title" style="text-align: left">
                        Tax Advance Adjustment</div>
                    <div>
                        <asp:GridView ID="grdAdvanceTax" runat="server" AutoGenerateColumns="False" CssClass="mGrid"
                            EmptyDataText="No Tax Advance Available">
                            <Columns>
                                <asp:TemplateField HeaderText="TaxAdvanceID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("TaxAdvanceID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tax Advance">
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("TaxAdvance","{0:N2}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tax Advance Adjusted">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("TaxAdvanceAdjusted","{0:N2}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Is Adjusted">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("IsAdjusted") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Adjustment Date">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("AdjustmentDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Remarks">
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EntryBy">
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("EntryBy") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Adjustment History">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbtnResponseCount" runat="server" CausesValidation="False"
                                            CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("TaxAdvanceID","openWindow(""frmTaxAdvAdjHistory.aspx?TaxAdvanceID={0}"",""Popup"",800,800);") %>'
                                            Text="Adjustment History"></asp:LinkButton>
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
        <tr align="center">
            <td>
            </td>
            <td align="center">
                <asp:Panel ID="pnlTaxDeductionDetails" runat="server" Width="90%" SkinID="pnlInner">
                    <table width="100%">
                        <tr align="left">
                            <td colspan="2">
                                <div class="widget-title">
                                    Tax Deduction Info</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%">
                                <div style="max-height: 200px; overflow: auto">
                                    <asp:GridView ID="grdSalTaxableIncome" runat="server" AutoGenerateColumns="False"
                                        CssClass="mGrid" ShowFooter="True">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Component">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ComponentName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Taxable-Income(After Exemption)">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTaxableIncome" runat="server" Text='<%# Bind("TaxableIncome","{0:N2}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="TaxExemption">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("TaxExemption","{0:N2}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                            <td style="width: 50%">
                                <div style="max-height: 200px; overflow: auto">
                                    <asp:GridView ID="grdTaxCalculation" runat="server" AutoGenerateColumns="False" CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Event">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("EventName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Value">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("Value","{0:N2}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
