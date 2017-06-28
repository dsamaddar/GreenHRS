<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmBankBranchInfo.aspx.vb" Inherits="BankInfo_frmBankBranchInfo" Title=".:HRM:Bank & Branch Info:." %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlBankInfo" runat="server" Width="700px" SkinID="pnlInner">
                    <table style="width: 100%;" width="700">
                        <tr align="left">
                            <td colspan="4">
                                <div class="widget-title">
                                    Bank Info<asp:ScriptManager ID="ScriptManager1" runat="server">
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
                            <td class="label">
                                Available Bank</td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td style="width: 150px" class="label">
                                Bank Name
                            </td>
                            <td>
                                <asp:TextBox ID="txtBankName" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;
                            </td>
                            <td>
                                <asp:DropDownList ID="drpAvailableBankInfo" runat="server" 
                                    CssClass="InputTxtBox" Width="200px" AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label" style="width: 150px">
                                Is Active</td>
                            <td>
                                <asp:CheckBox ID="chkIsBankActive" runat="server" CssClass="label" 
                                    Text="(Check If YES)" />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldBankName" runat="server" 
                                    ControlToValidate="txtBankName" Display="None" 
                                    ErrorMessage="Required : Bank Name" ValidationGroup="BankInfo"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldBankName_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldBankName" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnInsertBank" runat="server" CssClass="styled-button-1" 
                                    Text="Submit" ValidationGroup="BankInfo" />
                                &nbsp;<asp:Button ID="btnCancelInsertBankInfo" runat="server" CssClass="styled-button-1"
                                    Text="Cancel" />
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
                <asp:Panel ID="pnlBranchInfo" runat="server" Width="700px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="4">
                                <div class="widget-title">
                                    Branch Info</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td style="width: 150px" class="label">
                                </td>
                            <td>
                                </td>
                            <td class="label">
                                Available Branch
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td class="label">
                                Select Bank
                            </td>
                            <td>
                                <asp:DropDownList ID="drpSelectBank" runat="server" CssClass="InputTxtBox" 
                                    Width="200px" AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpAvailableBranch" runat="server" CssClass="InputTxtBox" 
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td class="label">
                                Branch Name
                            </td>
                            <td>
                                <asp:TextBox ID="txtBranchName" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldBranchInfo" runat="server" 
                                    ControlToValidate="txtBranchName" Display="None" 
                                    ErrorMessage="Required : Branch Name" ValidationGroup="BranchInfo"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldBranchInfo_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldBranchInfo" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Is Active</td>
                            <td>
                                <asp:CheckBox ID="chkBranchIsActive" runat="server" CssClass="label" 
                                    Text="(Check If YES)" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnInsertBranchInfo" runat="server" CssClass="styled-button-1" 
                                    Text="Submit" ValidationGroup="BranchInfo" />
                                &nbsp;<asp:Button ID="btnCancelInsertBranchInfo" runat="server" CssClass="styled-button-1"
                                    Text="Cancel" />
                            </td>
                            <td>
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
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
