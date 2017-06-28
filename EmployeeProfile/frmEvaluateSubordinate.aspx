<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/EmployeeProfile/MasterEmpProfile.master"
    AutoEventWireup="false" CodeFile="frmEvaluateSubordinate.aspx.vb" Inherits="EmployeeProfile_frmEvaluateSubordinate"
    Title=".:HRM:Evaluate Subordinate:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Css/grid.css" rel="stylesheet" type="text/css" />

    <script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>

    <script language="JavaScript" type="text/javascript">
        function openWindow(windowURL, windowName, windowWidth, windowHeight) {

            var left = (screen.width / 2) - (windowWidth / 2);
            var top = (screen.height / 2) - (windowHeight / 2);



            window.name = 'parentWnd';
            newWindow = window.open(windowURL, windowName, 'top=' + top + ',left=' + left + ',width=' + windowWidth + ',height=' + windowHeight + ',toolbar=0,location=no,directories=0, status=0,menuBar=0,scrollBars=1,resizable=1');
            newWindow.focus();
        }
    </script>

    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Panel ID="pnlSubordinateEvaluation" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="6">
                                <div class="widget-title">
                                    Evaluation Form</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                                <asp:RequiredFieldValidator ID="reqFldEvaluationTo" runat="server" ControlToValidate="txtEvaluationTo"
                                    Display="None" ErrorMessage="Required: Evaluation To Date" ValidationGroup="Evaluate"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldEvaluationTo_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldEvaluationTo" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td style="width: 250px">
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                                <asp:RequiredFieldValidator ID="reqFldEvaluationFrom" runat="server" ControlToValidate="txtEvaluationFrom"
                                    Display="None" ErrorMessage="Required: Evaluation From Date" ValidationGroup="Evaluate"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldEvaluationFrom_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldEvaluationFrom" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldRemraks" runat="server" ControlToValidate="txtRemarks"
                                    Display="None" ErrorMessage="Required: Remarks" ValidationGroup="Evaluate"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldRemraks_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldRemraks" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Select An Employee
                            </td>
                            <td>
                                <asp:DropDownList ID="drpSubOrdinateList" runat="server" Width="200px" AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Evaluation Year
                            </td>
                            <td>
                                <asp:DropDownList ID="drpEvaluationYear" runat="server" CssClass="InputTxtBox">
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
                                    <asp:ListItem>2017</asp:ListItem>
                                    <asp:ListItem>2018</asp:ListItem>
                                    <asp:ListItem>2019</asp:ListItem>
                                    <asp:ListItem>2020</asp:ListItem>
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                                Evaluation Period Starts
                            </td>
                            <td>
                                <asp:TextBox ID="txtEvaluationFrom" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtEvaluationFrom_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtEvaluationFrom">
                                </cc1:CalendarExtender>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Evaluation Period Ends
                            </td>
                            <td>
                                <asp:TextBox ID="txtEvaluationTo" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtEvaluationTo_calExtender" runat="server" Enabled="True"
                                    TargetControlID="txtEvaluationTo">
                                </cc1:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                            </td>
                            <td>
                                <asp:TextBox ID="txtRemarks" runat="server" CssClass="InputTxtBox"
                                    TextMode="MultiLine" Width="200px" Visible="False">.</asp:TextBox>
                            </td>
                            <td class="label">
                            </td>
                            <td class="label">
                            </td>
                            <td>
                                <asp:DropDownList ID="drpRecForBonus" runat="server" CssClass="InputTxtBox" Visible="False">
                                    <asp:ListItem>NO</asp:ListItem>
                                    <asp:ListItem>YES</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                            </td>
                            <td>
                                <asp:DropDownList ID="drpOverallPerformance" runat="server" CssClass="InputTxtBox"
                                    Width="200px" Visible="False">
                                </asp:DropDownList>
                            </td>
                            <td class="label">
                            </td>
                            <td class="label">
                                <asp:CompareValidator ID="dateValidatorEvalFrom" runat="server" 
                                    ControlToValidate="txtEvaluationFrom" ErrorMessage="Invalid Date" 
                                    Operator="DataTypeCheck" Type="Date" ValidationGroup="Evaluate">
                                </asp:CompareValidator>
                            </td>
                            <td>
                                <asp:CompareValidator ID="dateValidatorEvalTo" runat="server" 
                                    ControlToValidate="txtEvaluationTo" ErrorMessage="Invalid Date" 
                                    Operator="DataTypeCheck" Type="Date" ValidationGroup="Evaluate">
                                </asp:CompareValidator>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlEvaluationForm" runat="server" SkinID="pnlInner">
                    <div>
                        <asp:GridView ID="grdEvaluationForm" runat="server" AutoGenerateColumns="False" CssClass="mGrid">
                            <Columns>
                                <asp:TemplateField HeaderText="PerformanceFactorID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPerformanceFactorID" runat="server" Text='<%# Bind("PerformanceFactorID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PerformancePart" ItemStyle-Width="150px" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("PerformancePart") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="150px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Explanation" ItemStyle-Width="300px">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" CssClass="label" Text='<%# Bind("PerformanceTitle") %>'></asp:Label>
                                        &nbsp;
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Explanation") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="300px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Evaluation Grade" ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <asp:RadioButtonList ID="rdbtnEvaluationGrade" runat="server">
                                        </asp:RadioButtonList>
                                        <asp:RequiredFieldValidator ID="reqFldEvaluationGrade" runat="server" ControlToValidate="rdbtnEvaluationGrade"
                                            Display="None" ErrorMessage="Required: Evaluation Grading" ValidationGroup="Evaluate">
                                        </asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="reqFldEvaluationGrade_ValidatorCalloutExtender"
                                            runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                            Enabled="True" TargetControlID="reqFldEvaluationGrade" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                        </cc1:ValidatorCalloutExtender>
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
                <asp:Panel ID="pnlPrimaryEvaluation" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="4">
                                <div class="widget-title">
                                    Evaluate</div>
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
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Recommendation For Promotion</td>
                            <td>
                                <asp:DropDownList ID="drpRecForProgression" runat="server" CssClass="InputTxtBox"
                                    Height="22px">
                                    <asp:ListItem>NO</asp:ListItem>
                                    <asp:ListItem>YES</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Button ID="btnSubmit" runat="server" CssClass="styled-button-1" 
                                    Text="Evaluate" ValidationGroup="Evaluate" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlSecondaryEvaluation" runat="server" SkinID="pnlInner">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <div class="widget-title">
                                    Secondary Evaluation Pending List</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="max-height:300px;max-width:100%;overflow:auto" >
                                <asp:GridView ID="grdSecEvalPendingList" runat="server" AutoGenerateColumns="False"
                                    CssClass="mGrid" EmptyDataText="No List Available">
                                    <Columns>
                                        <asp:TemplateField HeaderText="EmpEvaluationSummaryID" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEmpEvaluationSummaryID" runat="server" Text='<%# Bind("EmpEvaluationSummaryID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="EmployeeName">
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="EvaluationFrom">
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("EvaluationFrom") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="EvaluationTo">
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("EvaluationTo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remarks">
                                            <ItemTemplate>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="PrimaryEvaluator">
                                            <ItemTemplate>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("PrimaryEvaluator") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText=" Evaluate ">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkbtnSecEvaluation" runat="server" CausesValidation="False"
                                                    CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("EmpEvaluationSummaryID","openWindow(""../EmployeeProfile/frmEmpSecEvaluation.aspx?EmpEvaluationSummaryID={0}"",""Popup"",1000,1100);") %>'
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
        </tr>
        <tr>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
