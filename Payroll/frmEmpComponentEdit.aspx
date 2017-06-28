<%@ Page Language="VB" Theme="CommonSkin" AutoEventWireup="false" CodeFile="frmEmpComponentEdit.aspx.vb"
    Inherits="Payroll_frmEmpComponentEdit" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .widget-title, .widgettitle
        {
            background: linear-gradient(-90deg, #D7D7D7, #A9A9A9) repeat scroll 0 0 transparent;
            border-bottom: 1px solid #848484;
            border-top: 1px solid #F5F5F5;
            box-shadow: 0 1px 1px rgba(0, 0, 0, 0.15);
            color: #000000;
            display: block;
            font: bold 14px/110% Cambria,Palatino, "Palatino Linotype" , "Palatino LT STD" ,Georgia,serif; /*
      font: bold 14px/110% "Lucida Grande",Arial,"Lucida Sans Unicode",sans-serif;
      left: -18px;
      top: -16px;
      border-top-left-radius: 8px;
      border-top-right-radius: 8px;
      color: #333333;
    */
            margin: 0 0 -5px;
            padding: 6px 18px 7px; /*position: relative;*/
            text-shadow: 0 1px 0 rgba(255, 255, 255, 0.7);
            width: auto;
            z-index: -1 !important;
        }
        .label
        {
            color: #464646;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 13px;
            font-weight: bold;
        }
        .InputTxtBox
        {
            background-image: url('../Sources/images/form_bg.jpg');
            background-repeat: repeat-x;
            border: 1px solid #B3B3B3;
            height: 24px;
            padding-top: 2px;
            padding-left: 5px;
            padding-bottom: 0px;
            color: #141414;
            font: normal 12px/150% Arial, Helvetica, sans-serif;
            vertical-align: baseline;
            border-radius: 3px;
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
        }
        .styled-button-1
        {
            background-image: url('../Sources/images/green_button.png');
            background-repeat: repeat-x;
            height: 30px;
            font-weight: bold;
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlComponentDefinition" runat="server" Width="700px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="4">
                                <div class="widget-title">
                                    Employee Component Definition/Edit</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 250px">
                                <asp:HiddenField ID="hdFldComponentID" runat="server" />
                            </td>
                            <td>
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                                Component Name
                            </td>
                            <td>
                                <asp:TextBox ID="txtCompName" runat="server" CssClass="InputTxtBox" Width="200px"
                                    Enabled="False"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldCompName" runat="server" ControlToValidate="txtCompName"
                                    Display="None" ErrorMessage="Required : Component Name" ValidationGroup="CompDefinition"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldCompName_ValidatorCalloutExtender0" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldCompName" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                                Component Value
                            </td>
                            <td>
                                <asp:TextBox ID="txtCompValue" runat="server" CssClass="InputTxtBox" Width="120px"></asp:TextBox>
                                &nbsp;
                                <asp:CompareValidator ID="numValidatorCompValue" runat="server" ControlToValidate="txtCompValue"
                                    ErrorMessage="Invalid Value" Operator="DataTypeCheck" Type="Double" ValidationGroup="CompDefinition">
                                </asp:CompareValidator>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldCompValue" runat="server" ControlToValidate="txtCompValue"
                                    Display="None" ErrorMessage="Required: Component Value" ValidationGroup="CompDefinition"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldCompValue_ValidatorCalloutExtender0" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldCompValue" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Component Dependent On
                            </td>
                            <td>
                                <asp:DropDownList ID="drpCompDependency" runat="server" CssClass="InputTxtBox" Width="120px">
                                    <asp:ListItem>N\A</asp:ListItem>
                                    <asp:ListItem>Basic</asp:ListItem>
                                    <asp:ListItem>Gross</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Component Ratio
                            </td>
                            <td>
                                <asp:TextBox ID="txtCompRatio" runat="server" CssClass="InputTxtBox" Width="120px"></asp:TextBox>
                                &nbsp;
                                <asp:CompareValidator ID="numValidatorCompRatio" runat="server" ControlToValidate="txtCompRatio"
                                    ErrorMessage="Invalid Value" Operator="DataTypeCheck" Type="Double" ValidationGroup="CompDefinition">
                                </asp:CompareValidator>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldCompRatio" runat="server" ControlToValidate="txtCompRatio"
                                    Display="None" ErrorMessage="Required : Component Ratio" ValidationGroup="CompDefinition"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldCompRatio_ValidatorCalloutExtender0" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldCompRatio" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Consolidated
                            </td>
                            <td>
                                <asp:TextBox ID="txtCompConsolidated" runat="server" CssClass="InputTxtBox" Width="120px"></asp:TextBox>
                                &nbsp;
                                <asp:CompareValidator ID="numValidatorCompConsolidated" runat="server" ControlToValidate="txtCompConsolidated"
                                    ErrorMessage="Invalid Value" Operator="DataTypeCheck" Type="Double" ValidationGroup="CompDefinition">
                                </asp:CompareValidator>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldCompConsolidated" runat="server" ControlToValidate="txtCompConsolidated"
                                    Display="None" ErrorMessage="Required : Consolidated Amount" ValidationGroup="CompDefinition"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldCompConsolidated_ValidatorCalloutExtender0"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldCompConsolidated" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Is Monthly Component
                            </td>
                            <td>
                                <asp:CheckBox ID="chkIsMonthlyComponent" runat="server" CssClass="label" Text="(Check If YES)" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Is Gross Component
                            </td>
                            <td>
                                <asp:CheckBox ID="chkIsGrossComponent" runat="server" CssClass="label" Text="(Check If YES)" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Is Taxable
                            </td>
                            <td>
                                <asp:CheckBox ID="chkIsTaxable" runat="server" CssClass="label" Text="(Check If YES)" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Tax Exemption Limit
                            </td>
                            <td>
                                <asp:TextBox ID="txtTaxExemptionLimit" runat="server" CssClass="InputTxtBox" Width="120px"></asp:TextBox>
                                &nbsp;<asp:CompareValidator ID="numValidatorCompExemption" runat="server" ControlToValidate="txtTaxExemptionLimit"
                                    ErrorMessage="Invalid Value" Operator="DataTypeCheck" Type="Double" ValidationGroup="CompDefinition"></asp:CompareValidator>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldExemptionLimit" runat="server" ControlToValidate="txtTaxExemptionLimit"
                                    Display="None" ErrorMessage="Required : Exemption Limit" ValidationGroup="CompDefinition"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldExemptionLimit_ValidatorCalloutExtender0"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldExemptionLimit" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                State
                            </td>
                            <td>
                                <asp:DropDownList ID="drpCompState" runat="server" CssClass="InputTxtBox" Enabled="False">
                                    <asp:ListItem Value="Positive" Text="Positive"></asp:ListItem>
                                    <asp:ListItem Value="Negative" Text="Negative"></asp:ListItem>
                                    <asp:ListItem Value="Hidden" Text="Hidden"></asp:ListItem>
                                    <asp:ListItem Value="Festival Bonus" Text="Festival Bonus"></asp:ListItem>
                                    <asp:ListItem Value="Performance Bonus" Text="Performance Bonus"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                                Is Active
                            </td>
                            <td>
                                <asp:CheckBox ID="chkIsActive" runat="server" CssClass="label" Text="Is Active" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="btnUpdateEmpComponent" runat="server" CssClass="styled-button-1"
                                    Text="Update" ValidationGroup="CompDefinition" />
                                &nbsp;<asp:Button ID="btnCancelCompDefinition" runat="server" CssClass="styled-button-1"
                                    Text="Cancel" />
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
        <tr align="center">
            <td>
            </td>
            <td>
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
    </form>
</body>
</html>
