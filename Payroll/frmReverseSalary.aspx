<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmReverseSalary.aspx.vb" Inherits="Payroll_frmReverseSalary"
    Title=".:HRS:Salary Reverse Option:." %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlFinalizeSalary" runat="server" Width="700px" 
                    SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="4">
                                <div class="widget-title">
                                    Finalize Salary<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 300px">
                                <asp:RequiredFieldValidator ID="reqFldFinalizeSalaryEntryPoint" runat="server" 
                                    ControlToValidate="drpFinalizeEntryPoints" Display="None" 
                                    ErrorMessage="Required: Entry Point" ValidationGroup="FinalizeSalary"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldFinalizeSalaryEntryPoint_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldFinalizeSalaryEntryPoint" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Select Entry Point
                            </td>
                            <td>
                                <asp:DropDownList ID="drpFinalizeEntryPoints" runat="server" CssClass="InputTxtBox"
                                    Width="300px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Button ID="btnFinalizeSalary" runat="server" Text="Finalize Salary" 
                                    CssClass="styled-button-1" ValidationGroup="FinalizeSalary" />
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
                <asp:Panel ID="pnlReverseSalary" runat="server" Width="700px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="4">
                                <div class="widget-title">
                                    Reverse Salary</div>
                            </td>
                        </tr>
                        <tr align="left" >
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 300px">
                                <asp:RequiredFieldValidator ID="reqFldReverseSalaryEntryPoint" runat="server" 
                                    ControlToValidate="drpReverseSalaryEntryPoint" Display="None" 
                                    ErrorMessage="Required: Entry Point" ValidationGroup="ReverseSalary"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldReverseSalaryEntryPoint_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldReverseSalaryEntryPoint" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Select Entry Point
                            </td>
                            <td>
                                <asp:DropDownList ID="drpReverseSalaryEntryPoint" runat="server" CssClass="InputTxtBox"
                                    Width="300px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Button ID="btnReverseSalary" runat="server" Text="Reverse Salary" 
                                    CssClass="styled-button-1" ValidationGroup="ReverseSalary" />
                            </td>
                        </tr>
                        <tr align="left">
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
            <td>
            </td>
        </tr>
        <tr align="center">
            <td>
            </td>
            <td>
                &nbsp;
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
