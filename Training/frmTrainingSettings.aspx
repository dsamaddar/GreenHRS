<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmTrainingSettings.aspx.vb" Inherits="Training_frmTrainingSettings"
    Title=".:HRM : Settings>>Settings:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlTrainingSettings" runat="server" Width="100%" 
                    SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td class="label" colspan="5">
                                <div class="widgettitle">
                                    Training Subject<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label" style="width: 20px">
                            </td>
                            <td class="label" style="width: 150px">
                            </td>
                            <td align="left" style="width: 250px">
                            </td>
                            <td class="label" style="width: 150px">
                            </td>
                            <td style="width: 230px">
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label" style="width: 20px">
                            </td>
                            <td class="label" style="width: 150px">
                                Training Subject<span class="RequiredLabel">*</span>
                            </td>
                            <td align="left" style="width: 250px">
                                <asp:TextBox ID="txtTrngSubject" runat="server" CssClass="InputTxtBox" 
                                    Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldTrainingSubject" runat="server" 
                                    ControlToValidate="txtTrngSubject" Display="None" ErrorMessage="Required" 
                                    ValidationGroup="AddTrngSubject"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldTrainingSubject_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldTrainingSubject" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td class="label" style="width: 150px">
                                <b>Available Subjects</b>
                            </td>
                            <td style="width: 230px">
                                <asp:DropDownList ID="drpAvailableTrngSubject" runat="server" 
                                    AutoPostBack="True" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Description<span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtTrngDescription" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="250px"></asp:TextBox>
                                &nbsp;&nbsp;<asp:RequiredFieldValidator ID="reqFldSubjectDescription" runat="server"
                                    ControlToValidate="txtTrngDescription" Display="None" ErrorMessage="Required"
                                    ValidationGroup="AddTrngSubject"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldSubjectDescription_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldSubjectDescription" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Objectives<span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtTrngObjectives" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="250px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldSubjectObjectives" runat="server" ControlToValidate="txtTrngObjectives"
                                    Display="None" ErrorMessage="Required" ValidationGroup="AddTrngSubject"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldSubjectObjectives_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldSubjectObjectives" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td align="left">
                                <asp:Button ID="btnAddSubject" runat="server" CssClass="styled-button-1" Text="ADD"
                                    ValidationGroup="AddTrngSubject" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" Text="Cancel" />
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
                <asp:Panel ID="pnlTrainingTopic" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td class="label" colspan="5">
                                <div class="widgettitle">
                                    Training Topic</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label" style="width: 20px">
                                &nbsp;</td>
                            <td class="label" style="width: 150px">
                                &nbsp;</td>
                            <td style="width: 200px">
                                &nbsp;</td>
                            <td class="label" style="width: 150px">
                                &nbsp;</td>
                            <td style="width: 200px">
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td class="label" style="width: 20px">
                            </td>
                            <td class="label" style="width: 150px">
                                Training Subject<span class="RequiredLabel">*</span></td>
                            <td style="width: 200px">
                                <asp:DropDownList ID="ddlTrainingSubject" runat="server" CssClass="InputTxtBox" 
                                    Width="200px" AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                            <td class="label" style="width: 150px">
                                Training Topic<span class="RequiredLabel">*</span></td>
                            <td style="width: 200px">
                                <asp:TextBox ID="txtTrainingTopic" runat="server" CssClass="InputTxtBox" 
                                    Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldTrainingTopic" runat="server" 
                                    ControlToValidate="txtTrainingTopic" Display="None" ErrorMessage="Required" 
                                    ValidationGroup="AddTrainingTopic"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldTrainingTopic_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldTrainingTopic" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="label" style="width: 20px">
                            </td>
                            <td class="label" style="width: 150px">
                                Available Training Topic<span class="RequiredLabel">*</span>
                            </td>
                            <td style="width: 200px">
                                <asp:DropDownList ID="ddlTrngTopic" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td align="left">
                                <asp:Button ID="btnTrainingTopic" runat="server" CssClass="styled-button-1" Text="ADD"
                                    ValidationGroup="AddTrainingTopic" />
                                &nbsp;<asp:Button ID="btnTrainingCancel" runat="server" CssClass="styled-button-1"
                                    Text="Cancel" />
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
                <asp:Panel ID="pnlTrainingLevel" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td class="label" colspan="5">
                                <div class="widgettitle">
                                    Training Level</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                                &nbsp;</td>
                            <td class="label" style="width: 150px">
                                &nbsp;</td>
                            <td style="width: 200px">
                            </td>
                            <td class="label" style="width: 150px">
                                &nbsp;</td>
                            <td style="width: 200px">
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td class="label" style="width: 150px">
                                Training Type<span class="RequiredLabel">*</span>
                            </td>
                            <td style="width: 200px">
                                <asp:TextBox ID="txtTrainingType" runat="server" CssClass="InputTxtBox" 
                                    Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldTrainingType" runat="server" 
                                    ControlToValidate="txtTrainingType" Display="None" ErrorMessage="Required" 
                                    ValidationGroup="AddTrainingType"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldTrainingType_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldTrainingType" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                                &nbsp;
                            </td>
                            <td class="label" style="width: 150px">
                                Available Training Type<span class="RequiredLabel">*</span>
                            </td>
                            <td style="width: 200px">
                                <asp:DropDownList ID="drpAvailableTrainingType" runat="server" 
                                    CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td align="left">
                                <asp:Button ID="btnAddTrainingType" runat="server" CssClass="styled-button-1" Text="ADD"
                                    ValidationGroup="AddTrainingType" />
                                &nbsp;<asp:Button ID="btnCancelTrainingType" runat="server" CssClass="styled-button-1"
                                    Text="Cancel" />
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
                <asp:Panel ID="pnlCourseLevel" runat="server" SkinID="pnlInner" Width="100%">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td align="left" class="label" colspan="5">
                                <div class="widgettitle">Course Level</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label" style="width: 20px;">
                            </td>
                            <td class="label" style="width: 150px;">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td class="label" style="width: 150px">
                            </td>
                            <td style="width: 200px">
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px;">
                            </td>
                            <td align="left" class="label">
                                Course Level<span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtCourseLevel" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldCourseLevel" runat="server" ControlToValidate="txtCourseLevel"
                                    Display="None" ErrorMessage="Required" ValidationGroup="AddCourseLevel"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldCourseLevel_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldCourseLevel" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td align="left" class="label">
                                <b>Available Course Level</b>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpAvailableCourseLevel" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td align="left">
                                <asp:Button ID="btnAddCourseLevel" runat="server" CssClass="styled-button-1" Text="ADD"
                                    ValidationGroup="AddCourseLevel" />
                                &nbsp;<asp:Button ID="btnCancelCourseLevel" runat="server" CssClass="styled-button-1"
                                    Text="Cancel" />
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
        </table>
</asp:Content>
