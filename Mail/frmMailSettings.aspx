<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmMailSettings.aspx.vb" Inherits="Mail_frmMailSettings" Theme="CommonSkin"
    Title="::Mail Settings::" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center" style="height: 30px;">
            <td>
            </td>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td>
            </td>
        </tr>
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlDepartmentSettings" runat="server" Width="650px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" class="label" colspan="4">
                                <div class="widgettitle">
                                    Mail Type Settings</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                            </td>
                            <td align="left" class="label">
                            </td>
                            <td align="left">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Type Name<span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtTypeName" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldTypeName" runat="server" ControlToValidate="txtTypeName"
                                    Display="None" ErrorMessage="Required" ValidationGroup="Input"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldTypeName_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                        CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldTypeName"
                                        WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Is Active
                            </td>
                            <td align="left">
                                <asp:CheckBox ID="chkIsActive" runat="server" CssClass="chkText" Text="         Is Active  " />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td align="left">
                                <asp:Button ID="btnInsertMailType" runat="server" CssClass="styled-button-1" Text="Insert"
                                    ValidationGroup="Input" />
                                &nbsp;<asp:Button ID="btnCancelSelection" runat="server" CssClass="styled-button-1"
                                    Text="Cancel" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Available Mail Type</b>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpAvailableMailType" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                            </td>
                            <td align="left">
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:Panel ID="Panel1" runat="server" Width="650px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" class="label" colspan="4">
                                <div class="widgettitle">
                                    Mail Property Settings</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                            </td>
                            <td align="left" class="label">
                            </td>
                            <td align="left">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Mail Type Name<span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpMailType" runat="server" CssClass="InputTxtBox" Width="200px" AutoPostBack ="true" >
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Mail Subject<span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtMailSubject" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldMailSubject" runat="server" ControlToValidate="txtMailSubject"
                                    Display="None" ErrorMessage="Required" ValidationGroup="InputProperty"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldMailSubject_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                        CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldMailSubject"
                                        WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Mail Body<span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtMailBody" runat="server" CssClass="InputTxtBox" TextMode="MultiLine"
                                    Width="200px" Height="50px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldMailBody" runat="server" ControlToValidate="txtMailBody"
                                    Display="None" ErrorMessage="Required" ValidationGroup="InputProperty"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldMailBody_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                        CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldMailBody"
                                        WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Mail From<span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtMailFrom" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldMailFrom" runat="server" ControlToValidate="txtMailFrom"
                                    Display="None" ErrorMessage="Required" ValidationGroup="InputProperty"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldMailFrom_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                        CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldMailFrom"
                                        WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                                       &nbsp;<asp:RegularExpressionValidator ID="regExpMailFrom" runat="server" ControlToValidate="txtMailFrom"
                                        ErrorMessage="Input Correct E-mail Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        ValidationGroup="InputProperty" Display="None"></asp:RegularExpressionValidator><cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" 
                                        runat="server" Enabled="True" TargetControlID="regExpMailFrom" CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                E-Mail Address
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldEmailAddress" runat="server" ControlToValidate="txtEmailAddress"
                                    Display="None" ErrorMessage="Required" ValidationGroup="InputADD"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldEmailAddress_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                        CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldEmailAddress"
                                        WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                                    &nbsp;<asp:RegularExpressionValidator ID="regExpEmailAddress" runat="server" ControlToValidate="txtEmailAddress"
                                        ErrorMessage="Input Correct E-mail Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        ValidationGroup="InputADD" Display="None"></asp:RegularExpressionValidator><cc1:ValidatorCalloutExtender ID="regExpEmailAddress_ValidatorCalloutExtender" 
                                        runat="server" Enabled="True" TargetControlID="regExpEmailAddress" CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;</td>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left">
                                <asp:Button ID="btnAddTo" runat="server" CssClass="styled-button-1" 
                                    Text="To -&gt;" ValidationGroup="InputADD" />
                                &nbsp;<asp:Button ID="btnAddBCC" runat="server" CssClass="styled-button-1" 
                                    Text="BCC -&gt;" ValidationGroup="InputADD" />
                                &nbsp;<asp:Button ID="btnAddCC" runat="server" CssClass="styled-button-1" 
                                    Text="CC -&gt;" ValidationGroup="InputADD" />
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Mail To<span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtMailTo" runat="server" CssClass="InputTxtBox" Width="200px" TextMode="MultiLine"
                                    Height="50px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldMailTo" runat="server" ControlToValidate="txtMailTo"
                                    Display="None" ErrorMessage="Required" ValidationGroup="InputProperty"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldMailTo_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                        CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldMailTo" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                            <td align="left">
                                &nbsp;
                                <asp:Button ID="btnToCancel" runat="server" Text="Clear" 
                                    CssClass="styled-button-1" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Mail CC
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtCC" runat="server" CssClass="InputTxtBox" Width="200px" TextMode="MultiLine"
                                    Height="50px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                                <asp:Button ID="btnCancelCC" runat="server" Text="Clear" 
                                    CssClass="styled-button-1" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Mail BCC
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtBCC" runat="server" CssClass="InputTxtBox" Width="200px" TextMode="MultiLine"
                                    Height="50px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                                <asp:Button ID="btnCancelBCC" runat="server" Text="Clear" 
                                    CssClass="styled-button-1" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Mail Header
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtMailHeader" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Mail Footer
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtMailFooter" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Is Automated
                            </td>
                            <td align="left">
                                <asp:CheckBox ID="IsAutomated" runat="server" CssClass="chkText" Text="         Is Automated  " />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Is Active
                            </td>
                            <td align="left">
                                <asp:CheckBox ID="IsPropertyActive" runat="server" CssClass="chkText" Text="         Is Active  " />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td align="left">
                                <asp:Button ID="btnPropertyAdd" runat="server" CssClass="styled-button-1" Text="Insert"
                                    ValidationGroup="InputProperty" />
                                &nbsp;<asp:Button ID="btnPropertyCancel" runat="server" CssClass="styled-button-1"
                                    Text="Cancel" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
