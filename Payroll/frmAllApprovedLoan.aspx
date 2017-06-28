<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmAllApprovedLoan.aspx.vb" Inherits="Payroll_frmAllApprovedLoan" Title=".:HRS:All Approved Loan A/C:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
                <asp:Panel ID="pnlFilterParameters" runat="server" Width="70%" 
                    SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="6">
                                <div class="widget-title">
                                    Filter Approved Loan Application<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;</td>
                            </tr>
                            <tr align="left">
                                <td>
                                    &nbsp;
                                </td>
                                <td class="label">
                                    Benefity Type
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpBenefitType" runat="server" CssClass="InputTxtBox" Width="200px">
                                    </asp:DropDownList>
                                </td>
                                <td class="label">
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr align="left">
                                <td>
                                </td>
                            <td class="label">
                                Start Date
                            </td>
                            <td>
                                <asp:TextBox ID="txtStartDate" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtStartDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtStartDate">
                                </cc1:CalendarExtender>
                            </td>
                            <td class="label">
                                End Date
                            </td>
                            <td>
                                <asp:TextBox ID="txtEndDate" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtEndDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtEndDate">
                                </cc1:CalendarExtender>
                            </td>
                                <td>
                                    <asp:Button ID="btnMobileEntitlementRpt" runat="server" 
                                        CssClass="styled-button-1" Text="Mobile Entitlement Report" />
                                </td>
                        </tr>
                            <tr align="left">
                                <td>
                                </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnFilter" runat="server" CssClass="styled-button-1" Text="Filter" />
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                                <td>
                                    &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlEmpLoanAccounts" runat="server" Width="100%" SkinID="pnlInner">
                    <div class="widget-title">
                        Loan/Benefits</div>
                    <div style="max-height: 500px; max-width: 100%; overflow: auto">
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
                                <asp:TemplateField HeaderText="Employee">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EmpCode">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEmpCode" runat="server" Text='<%# Bind("EmpCode") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Designation">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDesignation" runat="server" Text='<%# Bind("Designation") %>'></asp:Label>
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
                                <asp:TemplateField HeaderText="Attachment">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="hpAttachment" runat="server" CssClass="linkbtn" NavigateUrl='<%# ConfigurationManager.AppSettings("AttachmentsShow") + Eval("Attachment") %>'
                                            Target="_blank">View</asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="App. Details" ShowHeader="True" Visible="True">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbtnBenefitDetailsView" runat="server" CausesValidation="False"
                                            CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("BenefitID","openWindow(""../EmployeeProfile/frmBenefitDetailsView.aspx?BenefitID={0}"",""Popup"",600,600);") %>'
                                            Text=" Details "> </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Amortization" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbtnViewAmortization" runat="server" CausesValidation="False"
                                            CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("EmpLoanAccountID","openWindow(""../EmployeeProfile/frmEmpLoanAmortizationInfo.aspx?EmpLoanAccountID={0}"",""Popup"",1000,800);") %>'
                                            Text="View"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="grdMobEntRpt" runat="server" CssClass="mGrid" 
                    EmptyDataText="No Data Found">
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
