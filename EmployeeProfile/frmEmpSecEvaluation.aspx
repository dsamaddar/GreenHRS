<%@ Page Language="VB" AutoEventWireup="false" CodeFile="frmEmpSecEvaluation.aspx.vb"
    Theme="CommonSkin" Inherits="EmployeeProfile_frmEmpSecEvaluation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>.:HRM:Secondary Evaluation:.</title>
    <link href="Css/GridStyle.css" rel="stylesheet" type="text/css" />
    <link href="Css/Title.css" rel="stylesheet" type="text/css" />
    <link href="../Sources/css/ValidatorStyle.css" rel="stylesheet" type="text/css" />
    <link href="../Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" language="Javascript">

        function RefreshParent() {
            if (window.opener != null && !window.opener.closed) {
                window.opener.location.reload();
            }
        }
            
        //window.onbeforeunload = function() { RefreshParent(); }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <table style="width: 100%;">
        <tr>
            <td>
                <div class="widget-title">
                    Secondary Evaluation Form
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </div>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlEvalSummary" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="3" class="titleBackGround">
                                Overall Performance (Primary)
                            </td>
                            <td style="width: 100px">
                                <asp:CheckBox ID="chkIsAgree" runat="server" AutoPostBack="True" CssClass="chkText"
                                    Text="Agree" />
                            </td>
                            <td class="titleBackGround">
                                Overall Performance (Secondary)
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                            </td>
                            <td>
                                <asp:DropDownList ID="drpOverallPerformance" runat="server" CssClass="InputTxtBox"
                                    Enabled="False" Visible="False" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpRecForBonusSec" runat="server" CssClass="InputTxtBox" Visible="False">
                                    <asp:ListItem>NO</asp:ListItem>
                                    <asp:ListItem>YES</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpOverallPerformanceSec" runat="server" CssClass="InputTxtBox"
                                    Visible="False" Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Recommendation For Promotion
                            </td>
                            <td>
                                <asp:DropDownList ID="drpRecForProgression" runat="server" CssClass="InputTxtBox"
                                    Height="22px" Enabled="False">
                                    <asp:ListItem>NO</asp:ListItem>
                                    <asp:ListItem>YES</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpRecForBonus" runat="server" CssClass="InputTxtBox" Enabled="False"
                                    Visible="False">
                                    <asp:ListItem>NO</asp:ListItem>
                                    <asp:ListItem>YES</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpRecForProgressionSec" runat="server" CssClass="InputTxtBox"
                                    Height="22px">
                                    <asp:ListItem>NO</asp:ListItem>
                                    <asp:ListItem>YES</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <table width="100%">
                    <tr>
                        <td>
                            <asp:Panel ID="pnlEmpDisagreement" runat="server" SkinID="pnlInner">
                                <table style="width: 100%;">
                                    <tr align="left">
                                        <td colspan="3">
                                            <div class="widget-title">
                                                Employee disagreement</div>
                                        </td>
                                    </tr>
                                    <tr align="left">
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
                                            Disagreement In :
                                        </td>
                                        <td>
                                            <asp:Label ID="lblEmpDisagreement" runat="server" CssClass="label"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="Panel1" runat="server" SkinID="pnlInner">
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
                                                <asp:RadioButtonList ID="rdbtnSecEvaluationGrade" runat="server">
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
                    </tr>
                </table>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Button ID="btnEvaluate" runat="server" Text="Evaluate" ValidationGroup="Evaluate""
                    CssClass="styled-button-1" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
