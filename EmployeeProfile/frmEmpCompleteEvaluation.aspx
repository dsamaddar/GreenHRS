<%@ Page Language="VB" AutoEventWireup="false" CodeFile="frmEmpCompleteEvaluation.aspx.vb"
    Inherits="EmployeeProfile_frmEmpCompleteEvaluation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>.:HRM:Secondary Evaluation:.</title>
    <link href="Css/GridStyle.css" rel="stylesheet" type="text/css" />
    <link href="Css/Title.css" rel="stylesheet" type="text/css" />
    <link href="../Sources/css/ValidatorStyle.css" rel="stylesheet" type="text/css" />
    <link href="../Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table style="width: 100%;">
        <tr>
            <td colspan="3">
                <div class="widget-title">
                    Secondary Evaluation Form
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </div>
            </td>
        </tr>
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:Panel ID="Panel1" runat="server">
                    <asp:GridView ID="grdSecEvaluationForm" runat="server" AutoGenerateColumns="False"
                        CssClass="mGrid">
                        <Columns>
                            <asp:TemplateField HeaderText="EmpEvaluationID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmpEvaluationID" runat="server" Text='<%# Bind("EmpEvaluationID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PerformancePart" ItemStyle-Width="150px" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("PerformancePart") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Explanation" ItemStyle-Width="250px">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" CssClass="label" Text='<%# Bind("PerformanceTitle") %>'></asp:Label>
                                    &nbsp;
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Explanation") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="300px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Primary Evaluation" ItemStyle-Width="150px">
                                <ItemTemplate>
                                    <asp:RadioButtonList ID="rdbtnEvaluationGrade" runat="server" Enabled="false">
                                    </asp:RadioButtonList>
                                    <asp:RequiredFieldValidator ID="reqFldEvaluationGrade" runat="server" ControlToValidate="rdbtnEvaluationGrade"
                                        Display="None" ErrorMessage="Required: Evaluation Grading" ValidationGroup="Evaluate">
                                    </asp:RequiredFieldValidator>
                                    <cc1:ValidatorCalloutExtender ID="reqFldEvaluationGrade_ValidatorCalloutExtender"
                                        runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                        Enabled="True" TargetControlID="reqFldEvaluationGrade" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                                </ItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Secondary Evaluation" ItemStyle-Width="150px">
                                <ItemTemplate>
                                    <asp:RadioButtonList ID="rdbtnSecEvaluationGrade" runat="server" Enabled="false">
                                    </asp:RadioButtonList>
                                    <asp:RequiredFieldValidator ID="reqFldSecEvaluationGrade" runat="server" ControlToValidate="rdbtnSecEvaluationGrade"
                                        Display="None" ErrorMessage="Required: Evaluation Grading" ValidationGroup="Evaluate">
                                    </asp:RequiredFieldValidator>
                                    <cc1:ValidatorCalloutExtender ID="reqFldSecEvaluationGrade_ValidatorCalloutExtender"
                                        runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                        Enabled="True" TargetControlID="reqFldSecEvaluationGrade" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                                </ItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </td>
            <td>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
