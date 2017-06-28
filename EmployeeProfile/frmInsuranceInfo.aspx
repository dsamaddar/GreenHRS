<%@ Page Language="VB" MasterPageFile="~/EmployeeProfile/MasterEmpProfile.master" Theme="CommonSkin" 
    AutoEventWireup="false" CodeFile="frmInsuranceInfo.aspx.vb" Inherits="EmployeeProfile_frmInsuranceInfo"
    Title=".:HRS:Insurance Info:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlEmpLoanAccounts" runat="server" Width="100%" SkinID="pnlInner">
                    <div class="widget-title">
                        Loan/Benefits<asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                    </div>
                    <div>
                        <asp:GridView ID="grdEmpLoanAcc" runat="server" AutoGenerateColumns="False" CssClass="mGrid"
                            ShowFooter="True">
                            <Columns>
                                <asp:CommandField HeaderText="Select" ShowSelectButton="True" />
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
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EmployeeID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEmployeeID" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="BenefitID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBenefitID" runat="server" Text='<%# Bind("BenefitID") %>'></asp:Label>
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
                                <asp:TemplateField HeaderText="Details" ShowHeader="True" Visible="True">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkbtnBenefitDetailsView" runat="server" CausesValidation="False"
                                            CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("BenefitID","openWindow(""../EmployeeProfile/frmBenefitDetailsView.aspx?BenefitID={0}"",""Popup"",600,600);") %>'
                                            Text=" Details ">
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="View" ShowHeader="False">
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
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Panel runat="server" SkinID="pnlInner" ID="pnlVehicleInsuranceInfo">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="6">
                                <div class="widgettitle">
                                    &nbsp;Insurance Info</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 200px">
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Type Insurance
                            </td>
                            <td>
                                <asp:DropDownList runat="server" CssClass="InputTxtBox" Width="200px" ID="drpInsuranceType">
                                    <asp:ListItem>1st Party</asp:ListItem>
                                    <asp:ListItem>3rd Party</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Insurance&nbsp; With
                            </td>
                            <td>
                                <asp:TextBox runat="server" CssClass="InputTxtBox" Width="200px" ID="txtInsuranceWith"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator runat="server" ControlToValidate="txtInsuranceWith"
                                    ErrorMessage="Required: Insurance With" Display="None" ValidationGroup="AddInsurance"
                                    ID="reqFldInsuranceWith"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender runat="server" WarningIconImageUrl="~/Sources/images/Valwarning.png"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldInsuranceWith" ID="reqFldInsuranceWith_ValidatorCalloutExtender0">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Insurance No
                            </td>
                            <td>
                                <asp:TextBox runat="server" CssClass="InputTxtBox" Width="200px" ID="txtInsuranceNo"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator runat="server" ControlToValidate="txtInsuranceNo"
                                    ErrorMessage="Required: Insurance No" Display="None" ValidationGroup="AddInsurance"
                                    ID="reqFldInsuranceNo"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender runat="server" WarningIconImageUrl="~/Sources/images/Valwarning.png"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldInsuranceNo" ID="reqFldInsuranceNo_ValidatorCalloutExtender0">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Insured Value
                            </td>
                            <td>
                                <asp:TextBox runat="server" CssClass="InputTxtBox" Width="200px" ID="txtInsuranceValue"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator runat="server" ControlToValidate="txtInsuranceValue"
                                    ErrorMessage="Required: Insurance Value" Display="None" ValidationGroup="AddInsurance"
                                    ID="reqFldInsuranceValue"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender runat="server" WarningIconImageUrl="~/Sources/images/Valwarning.png"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldInsuranceValue" ID="reqFldInsuranceValue_ValidatorCalloutExtender0">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Insurance Start Date
                            </td>
                            <td>
                                <asp:TextBox runat="server" CssClass="InputTxtBox" Width="200px" ID="txtInsuranceStartDate"></asp:TextBox>
                                <cc1:CalendarExtender runat="server" Enabled="True" TargetControlID="txtInsuranceStartDate"
                                    ID="txtInsuranceStartDate_CalendarExtender0">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator runat="server" ControlToValidate="txtInsuranceStartDate"
                                    ErrorMessage="Required: Insurance Start date" Display="None" ValidationGroup="AddInsurance"
                                    ID="reqFldInsuranceStartDate"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender runat="server" WarningIconImageUrl="~/Sources/images/Valwarning.png"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldInsuranceStartDate" ID="reqFldInsuranceStartDate_ValidatorCalloutExtender0">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Insurance Renewal Date
                            </td>
                            <td>
                                <asp:TextBox runat="server" CssClass="InputTxtBox" Width="200px" ID="txtInsuranceRenewalDate"></asp:TextBox>
                                <cc1:CalendarExtender runat="server" Enabled="True" TargetControlID="txtInsuranceRenewalDate"
                                    ID="txtInsuranceRenewalDate_CalendarExtender0">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator runat="server" ControlToValidate="txtInsuranceRenewalDate"
                                    ErrorMessage="Required: Insurance Renewal date" Display="None" ValidationGroup="AddInsurance"
                                    ID="reqFldInsuranceRenewalDate"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender runat="server" WarningIconImageUrl="~/Sources/images/Valwarning.png"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldInsuranceRenewalDate" ID="reqFldInsuranceRenewalDate_ValidatorCalloutExtender0">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Insurance Attachments
                            </td>
                            <td>
                                <asp:FileUpload runat="server" ID="flUpInsurance"></asp:FileUpload>
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
                            <td>
                            </td>
                            <td>
                                <asp:Button runat="server" Text="ADD Insurance" ValidationGroup="AddInsurance" CssClass="DButton"
                                    ID="btnAddInsurance"></asp:Button>
                                &nbsp;<asp:Button runat="server" Text="Cancel" CssClass="DButton" ID="btnCancelToAddInsurance">
                                </asp:Button>
                            </td>
                            <td>
                            </td>
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
                <asp:GridView runat="server" AutoGenerateColumns="False" CssClass="mGrid" ID="grdInsuranceInfo">
                    <Columns>
                        <asp:TemplateField HeaderText="MobileBenefitID" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="lblInsuranceID" runat="server" Text='<%# Bind("InsuranceID") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("InsuranceID") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Insurance Type">
                            <ItemTemplate>
                                <asp:Label ID="Label18" runat="server" Text='<%# Bind("InsuranceType") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("InsuranceType") %>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Insurance With">
                            <ItemTemplate>
                                <asp:Label ID="Labe1l3" runat="server" Text='<%# Bind("InsuranceWith") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("InsuranceWith") %>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Insurance No">
                            <ItemTemplate>
                                <asp:Label ID="Label14" runat="server" Text='<%# Bind("InsuranceNo") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("InsuranceNo") %>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Insured Value">
                            <ItemTemplate>
                                <asp:Label ID="Label15" runat="server" Text='<%# Bind("InsuredValue") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("InsuredValue") %>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Start Date">
                            <ItemTemplate>
                                <asp:Label ID="Label16" runat="server" Text='<%# Bind("InsuranceStartDate") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("InsuranceStartDate") %>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Renewal Date">
                            <ItemTemplate>
                                <asp:Label ID="Label17" runat="server" Text='<%# Bind("InsuranceRenewalDate") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("InsuranceRenewalDate") %>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
