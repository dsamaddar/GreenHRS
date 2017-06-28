<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmFundTransferToBank.aspx.vb" Inherits="Payroll_frmFundTransferToBank"
    Title=".:HRM:Fund Transfer Request:." %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlFundTransferParameter" runat="server" SkinID="pnlInner" Width="90%">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="6">
                                <div class="widget-title">
                                    Fund Transfer Request<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td class="label" style="width: 150px">
                            </td>
                            <td style="width: 300px">
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td class="label">
                                </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td class="label" style="width: 150px">
                                Report Options</td>
                            <td style="width: 300px">
                                <asp:CheckBox ID="chkProcessWithSalary" runat="server" Checked="True" 
                                    CssClass="chkText" Text="Process With Salary" />
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td class="label">
                                <asp:CheckBox ID="chkProcessWithFB" runat="server" CssClass="chkText" 
                                    Text="Process With FB" />
                            </td>
                            <td>
                                <asp:CheckBox ID="chkProcessWithPB" runat="server" CssClass="chkText" 
                                    Text="Process With PB" />
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td class="label" style="width: 150px">
                            </td>
                            <td style="width: 300px">
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td class="label">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td class="label" style="width: 150px">
                                Select Bank
                            </td>
                            <td style="width: 300px">
                                <asp:DropDownList ID="drpBanlAccList" runat="server" CssClass="InputTxtBox" 
                                    Width="250px">
                                </asp:DropDownList>
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td class="label">
                                Payment Date</td>
                            <td>
                                <asp:TextBox ID="txtPaymentDate" runat="server" CssClass="InputTxtBox" 
                                    Width="120px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtPaymentDate_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="txtPaymentDate">
                                </cc1:CalendarExtender>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="reqFldPaymentDate" runat="server" 
                                    ControlToValidate="txtPaymentDate" Display="None" 
                                    ErrorMessage="Required: Payment Date" ValidationGroup="ProcessReport"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldPaymentDate_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldPaymentDate" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Salary Year
                            </td>
                            <td>
                                <asp:DropDownList ID="drpSalaryYear" runat="server" CssClass="InputTxtBox" 
                                    Width="80px">
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
                            </td>
                            <td class="label">
                                Salary Month
                            </td>
                            <td>
                                <asp:DropDownList ID="drpSalaryMonth" runat="server" CssClass="InputTxtBox" 
                                    Width="120px">
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
                                Report Format</td>
                            <td>
                                <asp:DropDownList ID="drpReportFormat" runat="server" CssClass="inputtxtbox">
                                    <asp:ListItem Text="RichText" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="WordForWindows" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="Excel" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="PorttableDocFormat" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="ExcelRecord" Value="8"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="label">
                            </td>
                            <td class="label">
                                Employee Group</td>
                            <td>
                                <asp:CheckBoxList ID="chkEmployeeGroup" runat="server" CssClass="chkText">
                                </asp:CheckBoxList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                &nbsp;<asp:Button ID="btnShowDetails" runat="server" CssClass="styled-button-1" 
                                    Text="Show Details" />
                                &nbsp;<asp:Button ID="btnProcessReport" runat="server" CssClass="styled-button-1" 
                                    Text="Process Report" />
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
                <asp:Panel ID="pnlSalaryDetails" runat="server" SkinID="pnlInner" Width="90%">
                    <div style="max-height:300px;max-width:70%;overflow:auto">
                        <asp:GridView ID="grdSalaryDetails" runat="server" AutoGenerateColumns="False" 
                            CssClass="mGrid" ShowFooter="True" EmptyDataText="No Data Found">
                            <Columns>
                                <asp:TemplateField HeaderText="Employee">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("EmpName") %>'></asp:Label>
                                    </ItemTemplate>
                                
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Bank Account No">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("BankAccountNo") %>'></asp:Label>
                                    </ItemTemplate>
                                  
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Salary">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSalary" runat="server" Text='<%# Bind("Salary","{0:N2}") %>'></asp:Label>
                                    </ItemTemplate>
                                   
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
            </td>
        </tr>
        <tr align="center">
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
