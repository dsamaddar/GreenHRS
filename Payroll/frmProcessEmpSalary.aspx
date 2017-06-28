<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmProcessEmpSalary.aspx.vb" Inherits="Payroll_frmProcessEmpSalary"
    Title=".:HRM:Process Employee Salary:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlSalaryProcessingParameter" runat="server" Width="90%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="6">
                                <div class="widget-title">
                                    Salary Process<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td>
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td>
                                <asp:Button ID="btnCloseorOpenAccess" runat="server" Font-Bold="True" 
                                    Font-Names="Verdana" Font-Size="Medium" ForeColor="White" Height="40px" 
                                    Text="Close All Employee Access" />
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Processing Entry Point
                            </td>
                            <td>
                                <asp:TextBox ID="txtProcessingEntryPoint" runat="server" CssClass="InputTxtBox" 
                                    Width="200px" ReadOnly="True"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldProcessingEntryPoint" runat="server" 
                                    ControlToValidate="txtProcessingEntryPoint" Display="None" 
                                    ErrorMessage="Required: Processing Entry Point" ValidationGroup="ProcessSalary"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldProcessingEntryPoint_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldProcessingEntryPoint" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Salary Year
                            </td>
                            <td>
                                <asp:DropDownList ID="drpSalaryYear" runat="server" CssClass="InputTxtBox" Width="120px">
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
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Effective Date
                            </td>
                            <td class="label">
                                <asp:TextBox ID="txtEffectiveDate" runat="server" CssClass="InputTxtBox" Width="120px"></asp:TextBox>
                                <cc1:CalendarExtender ID="calExtSalEffectiveDate" runat="server" Enabled="True" TargetControlID="txtEffectiveDate">
                                </cc1:CalendarExtender>
                                &nbsp;(MM/DD/YYYY)
                                <asp:CompareValidator ID="cmpValSalEffectiveDate" runat="server" ControlToValidate="txtEffectiveDate"
                                    ErrorMessage="Invalid Date" Operator="DataTypeCheck" Type="Date" ValidationGroup="ProcessSalary"></asp:CompareValidator>
                                <asp:RequiredFieldValidator ID="reqFldSalEffectiveDate" runat="server" ControlToValidate="txtEffectiveDate"
                                    ErrorMessage="Required: Salary Effective Date" ValidationGroup="ProcessSalary"
                                    Display="None"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender ID="reqFldSalEffectiveDate_ValidatorCalloutExtender"
                                        runat="server" Enabled="True" TargetControlID="reqFldSalEffectiveDate" CloseImageUrl="~/Sources/images/valClose.png"
                                        CssClass="customCalloutStyle" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
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
                            </td>
                            <td class="label">
                                Start Date
                            </td>
                            <td class="label">
                                <asp:TextBox ID="txtSalStartDate" runat="server" CssClass="InputTxtBox" Width="120px"></asp:TextBox>
                                <cc1:CalendarExtender ID="calExtSalStartDate" runat="server" Enabled="True" TargetControlID="txtSalStartDate">
                                </cc1:CalendarExtender>
                                &nbsp;(MM/DD/YYYY)
                                <asp:CompareValidator ID="cmpValSalStartDate" runat="server" ControlToValidate="txtSalStartDate"
                                    ErrorMessage="Invalid Date" Operator="DataTypeCheck" Type="Date" ValidationGroup="ProcessSalary"></asp:CompareValidator>
                                <asp:RequiredFieldValidator ID="reqFldSalStartDate" runat="server" ControlToValidate="txtSalStartDate"
                                    ErrorMessage="Required: Salary Start Date" ValidationGroup="ProcessSalary" Display="None">
                                </asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="valCallSalStartDate" runat="server" Enabled="True"
                                    TargetControlID="reqFldSalStartDate" CloseImageUrl="~/Sources/images/valClose.png"
                                    CssClass="customCalloutStyle" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                End Date
                            </td>
                            <td class="label">
                                <asp:TextBox ID="txtSalEndDate" runat="server" CssClass="InputTxtBox" Width="120px"></asp:TextBox>
                                <cc1:CalendarExtender ID="calExtSalEndDate" runat="server" Enabled="True" TargetControlID="txtSalEndDate">
                                </cc1:CalendarExtender>
                                &nbsp;(MM/DD/YYYY)
                                <asp:CompareValidator ID="cmpValSalaryEndDate" runat="server" ControlToValidate="txtSalEndDate"
                                    ErrorMessage="Invalid Date" Operator="DataTypeCheck" Type="Date" ValidationGroup="ProcessSalary"></asp:CompareValidator>
                                <asp:RequiredFieldValidator ID="reqFldSalEndDate" runat="server" ControlToValidate="txtSalEndDate"
                                    ErrorMessage="Required: Salary End Date" ValidationGroup="ProcessSalary" Display="None">
                                </asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="valCallSalEndDate" runat="server" Enabled="True"
                                    TargetControlID="reqFldSalEndDate" CloseImageUrl="~/Sources/images/valClose.png"
                                    CssClass="customCalloutStyle" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Full Monthly Salary
                            </td>
                            <td>
                                <asp:CheckBox ID="chkFullMonthlySalary" runat="server" CssClass="label" 
                                    Text="(Check if YES)" Checked="True" />
                            </td>
                            <td>
                            </td>
                            <td class="label">
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
                <asp:Panel ID="pnlSelectEmployees" runat="server" Width="90%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td style="width: 50%">
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="width: 20px">
                                        </td>
                                        <td class="label">
                                            Select Type of Employee
                                        </td>
                                        <td>
                                            <asp:RadioButtonList ID="rblEmpType" runat="server" AutoPostBack="true" CssClass="rbdText"
                                                RepeatDirection="Vertical">
                                                <asp:ListItem Value="EMP"> Regular Employee
                                                </asp:ListItem>
                                                <asp:ListItem Value="DA"> Deposit Associate</asp:ListItem>
                                                <asp:ListItem Value="OA"> Office Assistant</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%">
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td style="max-height: 300px">
                                <div style="max-height: 300px; overflow: auto">
                                    <asp:CheckBox ID="chkSelectAllEmployees" runat="server" AutoPostBack="True" CssClass="label"
                                        Text="Select All" />
                                    <asp:CheckBoxList ID="chkEmpList" runat="server" CssClass="label">
                                    </asp:CheckBoxList>
                                </div>
                            </td>
                            <td>
                                <asp:CheckBox ID="chkProcessWithSalary" runat="server" CssClass="label" Text="Salary" />
                                <br />
                                <asp:CheckBox ID="chkDeductTax" runat="server" CssClass="label" 
                                    Text="Deduct Tax" Checked="True" />
                                <br />
                                <asp:CheckBox ID="chkProcessWithFestBonus" runat="server" CssClass="label" Text="Festival Bonus" />
                                <br />
                                <asp:CheckBox ID="chkProcessWithPerformanceBonus" runat="server" CssClass="label"
                                    Text="Performance Bonus" />
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;<asp:Button ID="btnCheckSystem" runat="server" CssClass="styled-button-1" 
                                    Text="Check System" />
                                &nbsp;<asp:Button ID="btnProcessSalary" runat="server" CssClass="styled-button-1" 
                                    Text="Process Salary" ValidationGroup="ProcessSalary" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" 
                                    Text="Cancel" />
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
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
