<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmLoanApproval.aspx.vb" Inherits="Payroll_frmLoanApproval"
    Title=".:HRS:Loan Approval:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .DButton
        {
            background-image: url(       '../EmployeeProfile/Icons/green_button.png' );
            background-repeat: repeat-x;
            height: 30px;
            font-weight: bold;
            font-family: Arial, Helvetica, sans-serif;
        }
        .style1
        {
            height: 19px;
        }
    </style>
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
        <tr>
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlApproveLoanApp" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <div class="widget-title">
                                    Approve Loan Request<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div>
                                    <asp:GridView ID="grdAppliedLoanApplication" runat="server" AutoGenerateColumns="False"
                                        CssClass="mGrid" EmptyDataText="No Loan Applied">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                                        Text="Select"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="BenefitID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBenefitID" runat="server" Text='<%# Bind("BenefitID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="EmployeeID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmployeeID" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Employee">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmployeeName" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="EmpCode">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmpCode" runat="server" Text='<%# Bind("EmpCode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Designation" HeaderText="Designation" />
                                            <asp:BoundField DataField="Department" HeaderText="Department" />
                                            <asp:BoundField DataField="Branch" HeaderText="Branch" />
                                            <asp:TemplateField HeaderText="BenefitTypeID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBenefitTypeID" runat="server" Text='<%# Bind("BenefitTypeID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Benefit Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBenefitType" runat="server" Text='<%# Bind("BenefitType") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Reimbursement Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblReimbursementDate" runat="server" Text='<%# Bind("ReimbursementDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("Amount","{0:N2}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBenefitStatus" runat="server" Text='<%# Bind("BenefitStatus") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Recommendation">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Recommendation") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Attachment">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="hpDocument" runat="server" CssClass="linkbtn" NavigateUrl='<%# ConfigurationManager.AppSettings("AttachmentsShow")+ Eval("Attachment") %>'
                                                        Target="_blank">View</asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Entry Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("EntryDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Details" ShowHeader="True" Visible="True">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkbtnBenefitDetailsView" runat="server" CausesValidation="False"
                                                        CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("BenefitID","openWindow(""../EmployeeProfile/frmBenefitDetailsView.aspx?BenefitID={0}"",""Popup"",600,600);") %>'
                                                        Text=" Details ">
                                                    </asp:LinkButton>
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
        <tr>
            <td>
            </td>
            <td>
                <asp:Panel runat="server" SkinID="pnlInner" ID="pnlMakeMobileSchedule">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="5" class="style1">
                                <div class="widgettitle">
                                    Mobile Loan Amortization
                                </div>
                            </td>
                        </tr>
                        <tr>
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
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Loan Amount
                            </td>
                            <td>
                                <asp:TextBox runat="server" CssClass="InputTxtBox" ID="txtMobileLoanAmntSch"></asp:TextBox>
                                &#160;&#160;<asp:RequiredFieldValidator runat="server" ControlToValidate="txtMobileLoanAmntSch"
                                    ErrorMessage="Required: Amortization Amount" Display="None" ValidationGroup="Amortization"
                                    ID="reqFldMobileLoanAmntSch"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender runat="server" WarningIconImageUrl="~/Sources/images/Valwarning.png"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldMobileLoanAmntSch" ID="valCallreqFldMobileLoanAmntSch0">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td class="label">
                                Depreciation In Months
                            </td>
                            <td>
                                <asp:TextBox runat="server" CssClass="InputTxtBox" Width="100px" ID="txtMobileDepreciationYear"></asp:TextBox>
                                &#160;&#160;<asp:RequiredFieldValidator runat="server" ControlToValidate="txtMobileDepreciationYear"
                                    ErrorMessage="Required: Depreciation Year" Display="None" ValidationGroup="Amortization"
                                    ID="reqFldMobileDepreciationYear"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender runat="server" WarningIconImageUrl="~/Sources/images/Valwarning.png"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldMobileDepreciationYear" ID="reqFldMobileDepreciationYear_ValidatorCalloutExtender0">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Adjustable From Salary
                            </td>
                            <td>
                                <asp:CheckBox runat="server" AutoPostBack="True" Text="Yes" ID="chkIsAdjustableFromSalary">
                                </asp:CheckBox>
                            </td>
                            <td class="label">
                                Interest Rate
                            </td>
                            <td>
                                <asp:TextBox runat="server" CssClass="InputTxtBox" Width="100px" ID="txtMobileIntRate"></asp:TextBox>
                                &#160;&#160;<asp:RequiredFieldValidator runat="server" ControlToValidate="txtMobileIntRate"
                                    ErrorMessage="Required: Interest Rate" Display="None" ValidationGroup="Amortization"
                                    ID="reqFldMobieLoanIntRate"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender runat="server" WarningIconImageUrl="~/Sources/images/Valwarning.png"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldMobieLoanIntRate" ID="reqFldMobieLoanIntRate_ValidatorCalloutExtender0">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Abatement Applicable
                            </td>
                            <td>
                                <asp:CheckBox runat="server" AutoPostBack="True" Text="Yes" ID="chkIsAbatementApplicable">
                                </asp:CheckBox>
                            </td>
                            <td class="label">
                                Reimbursement Date
                            </td>
                            <td>
                                <asp:TextBox runat="server" CssClass="InputTxtBox" Width="100px" ID="txtMobileAmortizationStartDate"></asp:TextBox>
                                <cc1:CalendarExtender runat="server" Enabled="True" TargetControlID="txtMobileAmortizationStartDate"
                                    ID="txtMobileAmortizationStartDate_CalendarExtender0">
                                </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMobileAmortizationStartDate"
                                    ErrorMessage="Required: Amortization Start Date" Display="None" ValidationGroup="Amortization"
                                    ID="reqFldMobileLoanReimbursementDate"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender runat="server" WarningIconImageUrl="~/Sources/images/Valwarning.png"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldMobileLoanReimbursementDate" ID="reqFldMobileLoanReimbursementDate_ValidatorCalloutExtender0">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Depreciate Payment
                            </td>
                            <td>
                                <asp:CheckBox runat="server" AutoPostBack="True" Text="Yes" ID="chkIsDepreciatePmntAutomatically">
                                </asp:CheckBox>
                            </td>
                            <td class="label">
                                Linear Amortization
                            </td>
                            <td>
                                <asp:CheckBox runat="server" Text="Yes" ID="chkIsLinearAmortization"></asp:CheckBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button runat="server" Text="Show Schedule" ValidationGroup="Amortization" CssClass="DButton"
                                    ID="btnMakeMobileSchedule"></asp:Button>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td>
                                &#160;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Panel runat="server" SkinID="pnlInner" ID="pnlShowMobileSchedule">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="2">
                                <div class="widgettitle">
                                    Amortization</div>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <div style="max-width: 900px; max-height: 200px; overflow: auto">
                                    <asp:GridView runat="server" AutoGenerateColumns="False" ShowFooter="True" CssClass="mGrid"
                                        ID="grdMobileSchedule">
                                        <Columns>
                                            <asp:TemplateField HeaderText="SL">
                                                <ItemTemplate>
                                                    <b>
                                                        <%#CType(Container, GridViewRow).RowIndex + 1%></b>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Payment Date">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PaymentDate") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("PaymentDate", "{0:d}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Payment Amount">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PaymentAmount","{0:N2}") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPaymentAmount" runat="server" Text='<%# Bind("PaymentAmount", "{0:N2}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Principal Payment">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("PrincipalPayment") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPrincipalPayment" runat="server" Text='<%# Bind("PrincipalPayment", "{0:N2}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Interest Payment">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("InterestPayment") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInterestPayment" runat="server" Text='<%# Bind("InterestPayment", "{0:N2}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Abatement">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Abatement") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAbatement" runat="server" Text='<%# Bind("Abatement") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="URPA">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("URPA", "{0:N2}") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("URPA", "{0:N2}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                            <td valign="top">
                                <div style="max-height: 200px; max-width: 200px; overflow: auto">
                                    <asp:GridView runat="server" AutoGenerateColumns="False" ShowFooter="True" CssClass="mGrid"
                                        ID="grdMobileAbatement">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Month">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("AbatementMonth") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("AbatementMonth") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Rate Of Abatement">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("RateOfAbatement") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("RateOfAbatement") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                        <tr>
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
        <tr>
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlFinalizeAmortization" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td style="width: 100px">
                                &nbsp;
                            </td>
                            <td class="label" style="width: 200px">
                                Remarks
                            </td>
                            <td>
                                <asp:TextBox ID="txtRemarks" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="250px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldRemarks" runat="server" ControlToValidate="txtRemarks"
                                    Display="None" ErrorMessage="Required: Remarks" ValidationGroup="Rejection"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldRemarks_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldRemarks" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
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
                                <asp:Button ID="btnFinalizeMobileAmortization" runat="server" CssClass="DButton"
                                    Enabled="False" OnClientClick="if (!confirm('Are you Sure to Finalize The Schedule ?')) return false"
                                    Text="Finalize Amortization" ValidationGroup="Amortization" />
                                &nbsp;<asp:Button ID="btnReject" runat="server" CssClass="styled-button-1" OnClientClick="return confirm('Are you sure you want to Reject?');"
                                    Text="Reject" ValidationGroup="Rejection" />
                                &nbsp;<asp:Button ID="btnCancelMobileAmortization" runat="server" CssClass="DButton"
                                    Text="Cancel" />
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
    </table>
</asp:Content>
