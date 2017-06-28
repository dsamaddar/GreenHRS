<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmEmpTaxAdvance.aspx.vb" Inherits="Payroll_frmEmpTaxAdvance" Title=".:HRM:Advance Tax:." %>

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
        <tr>
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlAssignExam" runat="server" SkinID="pnlInner" Width="100%">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="6" align="left">
                                <div class="widgettitle">
                                    Search Employee<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
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
                                Name/Code
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmpIDOrName" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label" style="width: 20px">
                            </td>
                            <td class="label">
                                Select Department
                            </td>
                            <td>
                                <asp:DropDownList ID="drpSelectDepartment" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
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
                        </tr>
                        <tr align="left">
                            <td class="label" style="width: 20px">
                            </td>
                            <td class="label">
                                District
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlPerDistrict" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Select Branch
                            </td>
                            <td>
                                <asp:DropDownList ID="drpULCBranch" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td tyle="width:20px">
                            </td>
                            <td class="label">
                                Gender
                            </td>
                            <td align="left">
                                <asp:RadioButtonList ID="rdbtnGender" runat="server" class="label" CssClass="rbdText"
                                    RepeatDirection="Horizontal" TabIndex="9">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                    <asp:ListItem>Others</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Blood Group
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlBloodGrp" runat="server" CssClass="InputTxtBox" TabIndex="11"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td tyle="width:20px">
                                &nbsp;
                            </td>
                            <td class="label">
                                Emplyee Type
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpEmployeeType" runat="server" CssClass="InputTxtBox" Width="200px">
                                    <asp:ListItem Value="N\A">N\A</asp:ListItem>
                                    <asp:ListItem Value="EMP">Regular Employee</asp:ListItem>
                                    <asp:ListItem Value="DA"></asp:ListItem>
                                    <asp:ListItem Value="OA">Office Assistant</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                                <b>Employee Status</b>&nbsp;
                            </td>
                            <td>
                                <asp:DropDownList ID="drpEmployeeStatus" runat="server" CssClass="InputTxtBox" Width="80px">
                                    <asp:ListItem Value="1">Active</asp:ListItem>
                                    <asp:ListItem Value="0">In-Active</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td tyle="width:20px">
                                &nbsp;
                            </td>
                            <td class="label">
                                &nbsp;
                            </td>
                            <td align="left">
                                <asp:Button ID="btnSearch" runat="server" CssClass="styled-button-1" Text="Search" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" Text="Cancel" />
                            </td>
                            <td>
                            </td>
                            <td class="label">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label" style="width: 20px">
                            </td>
                            <td class="label">
                            </td>
                            <td align="left">
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
                <asp:Panel ID="pnlFoundEmpList" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%">
                        <tr align="left">
                            <td>
                                <div class="widget-title">
                                    Employee List</div>
                            </td>
                            <td>
                                <div class="widget-title">
                                    Tax Advance</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 30%" valign="top">
                                <div id="divEmpList" onscroll="SetDivPosition()" style="max-height: 200px; max-width: 100%;
                                    overflow: auto">
                                    <asp:GridView ID="grdEmployeeList" runat="server" AutoGenerateColumns="False" CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                                        Text="Select"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="EmployeeID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmployeeID" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Employee">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                            <td valign="top" align="left">
                                <asp:Panel ID="pnlTaxAdvance" runat="server" SkinID="pnlInner">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td style="width: 20px">
                                            </td>
                                            <td style="width: 150px">
                                            </td>
                                            <td>
                                                <asp:HiddenField ID="hdFldEmployeeID" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td class="label">
                                                Advance Tax Amount
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtAdvTaxAmount" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                                                &nbsp;
                                                <asp:RequiredFieldValidator ID="reqFldEmpCode" runat="server" ControlToValidate="txtAdvTaxAmount"
                                                    Display="None" ErrorMessage="Required: Employee Code" ValidationGroup="TaxAdvance"></asp:RequiredFieldValidator>
                                                <cc1:ValidatorCalloutExtender ID="reqFldEmpCode_ValidatorCalloutExtender" runat="server"
                                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                                    TargetControlID="reqFldEmpCode" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                </cc1:ValidatorCalloutExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td class="label">
                                                Issue Date
                                            </td>
                                            <td class="label">
                                                <asp:TextBox ID="txtIssueDate" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                                                &nbsp;
                                                <cc1:CalendarExtender ID="txtIssueDate_CalendarExtender" runat="server" Enabled="True"
                                                    TargetControlID="txtIssueDate">
                                                </cc1:CalendarExtender>
                                                &nbsp;(MM/DD/YYYY)
                                                <asp:CompareValidator ID="dateValidatorIssueDate" runat="server" ControlToValidate="txtIssueDate"
                                                    ErrorMessage="Invalid Date" Operator="DataTypeCheck" Type="Date" ValidationGroup="TaxAdvance">
                                                </asp:CompareValidator>
                                                <asp:RequiredFieldValidator ID="reqFldIssueDate" runat="server" ControlToValidate="txtIssueDate"
                                                    ErrorMessage="Required: Issue Date" ValidationGroup="TaxAdvance" Display="None"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                                        ID="reqFldIssueDate_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="reqFldIssueDate"
                                                        CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                    </cc1:ValidatorCalloutExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td class="label">
                                                Remarks
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtAdvTaxRemarks" runat="server" CssClass="InputTxtBox" Height="50px"
                                                    TextMode="MultiLine" Width="300px"></asp:TextBox>
                                                &nbsp;
                                                <asp:RequiredFieldValidator ID="reqTaxAdvRemarks" runat="server" ControlToValidate="txtAdvTaxRemarks"
                                                    Display="None" ErrorMessage="Required: Remarks For Tax Advance" ValidationGroup="TaxAdvance"></asp:RequiredFieldValidator>
                                                <cc1:ValidatorCalloutExtender ID="reqTaxAdvRemarks_ValidatorCalloutExtender" runat="server"
                                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                                    TargetControlID="reqTaxAdvRemarks" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                </cc1:ValidatorCalloutExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnSubmitAdvTax" runat="server" CssClass="styled-button-1" Text="Submit"
                                                    ValidationGroup="TaxAdvance" />
                                                &nbsp;<asp:Button ID="btnCancelTaxAdvance" runat="server" CssClass="styled-button-1"
                                                    Text="Cancel" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
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
                <asp:Panel ID="pnlTaxAdvanceInfo" runat="server" SkinID="pnlInner">
                    <div>
                        <asp:GridView ID="grdAdvanceTax" runat="server" CssClass="mGrid" AutoGenerateColumns="False"
                            EmptyDataText="No Tax Advance Available">
                            <Columns>
                                <asp:TemplateField HeaderText="TaxAdvanceID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("TaxAdvanceID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tax Advance">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("TaxAdvance") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tax Advance Adjusted">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("TaxAdvanceAdjusted") %>'></asp:Label>
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
    </table>
</asp:Content>
