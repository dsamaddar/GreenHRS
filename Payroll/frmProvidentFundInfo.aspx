<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmProvidentFundInfo.aspx.vb" Inherits="Payroll_frmProvidentFundInfo"
    Title=".:HRS:Provident Fund Input Options:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlEmpPFInfo" runat="server" Width="850px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="4">
                                <div class="widget-title">
                                    Provident Fund Input Option<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td class="label">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:TextBox ID="txtDateFrom" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtDateFrom_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="txtDateFrom">
                                </cc1:CalendarExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Select An Employee
                            </td>
                            <td>
                                <asp:DropDownList ID="drpUserList" runat="server" AutoPostBack="True" 
                                    CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDateTo" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtDateTo_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="txtDateTo">
                                </cc1:CalendarExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="btnPFStatement" runat="server" CssClass="styled-button-1" 
                                    Text="PF Statement" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlPF" runat="server" Width="850px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 250px">
                                <asp:HiddenField ID="hdFldProvidentFundID" runat="server" />
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
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
                            <td class="label">
                                &nbsp;
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
                                Employee Contribution
                                <asp:RequiredFieldValidator ID="reqFldEmpContribution" runat="server" ControlToValidate="txtEmpContribution"
                                    Display="None" ErrorMessage="Required: Employee Contribution" ValidationGroup="PF"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldEmpContribution_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldEmpContribution" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmpContribution" runat="server" CssClass="InputTxtBox" Width="150px"></asp:TextBox>
                                &nbsp;<br />
                                <asp:RegularExpressionValidator ID="regExpEmpContribution" runat="server" ControlToValidate="txtEmpContribution"
                                    ErrorMessage="Input Numeric Data" ValidationExpression="^[0-9]\d*(\.\d+)?$" ValidationGroup="PF"></asp:RegularExpressionValidator>
                            </td>
                            <td class="label">
                                &nbsp;
                            </td>
                            <td class="label">
                                Credited Interest (Emp.)
                                <asp:RequiredFieldValidator ID="reqFldCreditedIntEmp" runat="server" ControlToValidate="txtCreditedIntEmp"
                                    Display="None" ErrorMessage="Required: Credited Int. Emp" ValidationGroup="PF"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldCreditedIntEmp_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldCreditedIntEmp" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCreditedIntEmp" runat="server" CssClass="InputTxtBox" Width="150px"></asp:TextBox>
                                &nbsp;
                                <asp:RegularExpressionValidator ID="regExpEmpContribution0" runat="server" ControlToValidate="txtCreditedIntEmp"
                                    ErrorMessage="Input Numeric Data" ValidationExpression="^[0-9]\d*(\.\d+)?$" ValidationGroup="PF"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Company Contribution
                                <asp:RequiredFieldValidator ID="reqFldCmpContribution" runat="server" ControlToValidate="txtCmpContribution"
                                    Display="None" ErrorMessage="Required: Company Contribution" ValidationGroup="PF"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldCmpContribution_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldCmpContribution" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCmpContribution" runat="server" CssClass="InputTxtBox" Width="150px"></asp:TextBox>
                                <br />
                                <asp:RegularExpressionValidator ID="regExpEmpContribution1" runat="server" ControlToValidate="txtCmpContribution"
                                    ErrorMessage="Input Numeric Data" ValidationExpression="^[0-9]\d*(\.\d+)?$" ValidationGroup="PF"></asp:RegularExpressionValidator>
                            </td>
                            <td class="label">
                            </td>
                            <td class="label">
                                Credited Interest (Cmp.)
                                <asp:RequiredFieldValidator ID="reqFldCreditedIntCmp" runat="server" ControlToValidate="txtCreditedIntCmp"
                                    Display="None" ErrorMessage="Required: Credited Int. Company" ValidationGroup="PF"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldCreditedIntCmp_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldCreditedIntCmp" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCreditedIntCmp" runat="server" CssClass="InputTxtBox" Width="150px"></asp:TextBox>
                                &nbsp;<br />
                                <asp:RegularExpressionValidator ID="regExpEmpContribution2" runat="server" ControlToValidate="txtCreditedIntCmp"
                                    ErrorMessage="Input Numeric Data" ValidationExpression="^[0-9]\d*(\.\d+)?$" ValidationGroup="PF"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Remarks
                                <asp:RequiredFieldValidator ID="reqFldRemarks" runat="server" ControlToValidate="txtRemarks"
                                    Display="None" ErrorMessage="Required: Remarks" ValidationGroup="PF"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldRemarks_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldRemarks" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtRemarks" runat="server" CssClass="InputTxtBox" Height="50px"
                                    Width="200px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Processing Date
                            </td>
                            <td>
                                <asp:TextBox ID="txtProcessingDate" runat="server" CssClass="InputTxtBox" Width="150px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtProcessingDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtProcessingDate">
                                </cc1:CalendarExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                            </td>
                            <td>
                                <asp:Button ID="btnSubmit" runat="server" CssClass="styled-button-1" Text="Submit"
                                    ValidationGroup="PF" />
                                &nbsp;<asp:Button ID="btnUpdate" runat="server" CssClass="styled-button-1" Text="Update"
                                    ValidationGroup="PF" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" Text="Cancel" />
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldProcessingDate" runat="server" ControlToValidate="txtProcessingDate"
                                    Display="None" ErrorMessage="Required: Processing Date" ValidationGroup="PF"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldProcessingDate_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldProcessingDate" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
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
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlProvidentFundInfo" runat="server" SkinID="pnlInner" Width="850px">
                    <div style="max-height: 300px; max-width: 100%; overflow: auto">
                        <asp:GridView ID="grdPFDetails" runat="server" AutoGenerateColumns="False" CssClass="mGrid">
                            <Columns>
                                <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                            Text="Select" CssClass="chkText"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ProvidentFundID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblProvidentFundID" runat="server" Text='<%# Bind("ProvidentFundID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sal. Year">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSalYear" runat="server" Text='<%# Bind("SalYear") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sal. Month">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSalMonth" runat="server" Text='<%# Bind("SalMonth") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Emp Contribution">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEmpContribution" runat="server" Text='<%# Bind("EmpContribution","{0:N2}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Emp. Credited Int.">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCreditedIntEmp" runat="server" Text='<%# Bind("CreditedIntEmp","{0:N2}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cmp. Contribution">
                                    <ItemTemplate>
                                        <asp:Label ID="lblComContribution" runat="server" Text='<%# Bind("ComContribution","{0:N2}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cmp. Credited Int.">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCreditedIntCom" runat="server" Text='<%# Bind("CreditedIntCom","{0:N2}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Process Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblProcessDate" runat="server" Text='<%# Bind("ProcessDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Remarks">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRemarks" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
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
