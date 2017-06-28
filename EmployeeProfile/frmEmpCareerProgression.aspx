<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/EmployeeProfile/MasterEmpProfile.master"
    AutoEventWireup="false" CodeFile="frmEmpCareerProgression.aspx.vb" Inherits="EmployeeProfile_frmEmpCareerProgression"
    Title=".:HRM:Career Progression:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>
                <div class="widgettitle">
                    Confirmation Evaluation</div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel runat="server" SkinID="pnlInner" ID="pnlConfirmationEvaluation">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="6">
                                <%--  Confirmation Evaluation--%>
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                                <asp:Label ID="lblHolder" runat="server" Text="" Visible="false"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="label" style="width: 20px">
                            </td>
                            <td class="label" style="width: 150px">
                                Confrimation Evaluation Summary<span class="RequiredLabel">*</span>
                            </td>
                            <td class="label" style="width: 200px">
                                <asp:TextBox runat="server" CssClass="InputTxtBox" TextMode="MultiLine" Height="50px"
                                    Width="200px" ID="txtConfirmationEvaluationSummary"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldConfirmationEvaluationSummary" runat="server"
                                    ControlToValidate="txtConfirmationEvaluationSummary" ErrorMessage="Summary Required"
                                    ValidationGroup="SubmitConEva" Display="None">
                                </asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender ID="reqFldConfirmationEvaluationSummary_ValidatorCalloutExtender"
                                    runat="server" Enabled="True" TargetControlID="reqFldConfirmationEvaluationSummary"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td class="label" style="width: 20px">
                            </td>
                            <td class="label" style="width: 150px">
                                Joining&#160; Designation<span class="RequiredLabel">*</span>
                            </td>
                            <td class="label" style="width: 200px">
                                <asp:DropDownList runat="server" CssClass="InputTxtBox" Width="200px" ID="ddlJoiningDesignation">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                &nbsp;
                            </td>
                            <td class="label">
                                Decision Of Confirmation<span class="RequiredLabel">*</span>
                            </td>
                            <td class="label">
                                <asp:DropDownList runat="server" CssClass="InputTxtBox" Width="200px" ID="drpDecisionOfConfirmation">
                                    <asp:ListItem>-Select-</asp:ListItem>
                                    <asp:ListItem>Confirmed</asp:ListItem>
                                    <asp:ListItem>Yet Not Decided</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="label">
                                &#160;
                            </td>
                            <td class="label">
                                Confirmation Designation<span class="RequiredLabel">*</span>
                            </td>
                            <td class="label">
                                <asp:DropDownList runat="server" CssClass="InputTxtBox" Width="200px" ID="ddlConfirmationDesignation">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                &nbsp;
                            </td>
                            <td class="label">
                                Effective Date<span class="RequiredLabel">*</span>
                            </td>
                            <td class="label">
                                <asp:TextBox runat="server" CssClass="InputTxtBox" Width="200px" ID="txtConfirmationEvaluationDate"></asp:TextBox>
                                <cc1:CalendarExtender runat="server" Enabled="True" TargetControlID="txtConfirmationEvaluationDate"
                                    ID="txtConfirmationEvaluationDate_CalendarExtender0">
                                </cc1:CalendarExtender>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Approval Attachment
                            </td>
                            <td class="label">
                                <asp:FileUpload runat="server" ID="flUpConfirmationApp"></asp:FileUpload>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                            </td>
                            <td class="label">
                                <asp:Button ID="btnInsertConfirmation" runat="server" Text="Insert" CssClass="styled-button-1"
                                    ValidationGroup="SubmitConEva" />
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Evaluation Attachment
                            </td>
                            <td class="label">
                                <asp:FileUpload runat="server" ID="flUpConfirmationEva"></asp:FileUpload>
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
        </tr>
        <tr>
            <td class="label">
                <asp:Panel runat="server" SkinID="pnlInner" ID="Panel1">
                    <div style="max-height: 250px; max-width: 900px; overflow: auto;">
                        <asp:GridView ID="grdConfirmation" runat="server" SkinID="grdNoFooter" AutoGenerateColumns="false"
                            EmptyDataText="No Data Available" CssClass="mGrid">
                            <Columns>
                                <asp:TemplateField HeaderText="ConfirmationEvaID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblConfirmationEvaID" runat="server" Text='<%# Bind("ConfirmationEvaID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Evaluation Summary">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEvaluationSummary" runat="server" Text='<%# Bind("EvaluationSummary") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Decision Of Confirmation">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDecisionOfConfirmation" runat="server" Text='<%# Bind("DecisionOfConfirmation") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Joining Designation">
                                    <ItemTemplate>
                                        <asp:Label ID="lblJoiningDesignation" runat="server" Text='<%# Bind("JoiningDesignationName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Confirmation Designation">
                                    <ItemTemplate>
                                        <asp:Label ID="lblConfirmationDesignation" runat="server" Text='<%# Bind("ConfirmationDesignationName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Effective Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEffectiveDate" runat="server" Text='<%# Bind("EffectiveDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Approval Attachment">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="hpDocument" CssClass="linkbtn" runat="server" NavigateUrl='<%# ConfigurationManager.AppSettings("AttachmentsShow") + Eval("ApprovalAttachment") %>'
                                            Target="_blank">View</asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Evaluation Attachment">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="hpDocument1" CssClass="linkbtn" runat="server" NavigateUrl='<%# ConfigurationManager.AppSettings("AttachmentsShow") + Eval("EvaluationAttachment") %>'
                                            Target="_blank">View</asp:HyperLink>
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
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <div class="widgettitle">
                    Contract Renewal</div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel runat="server" SkinID="pnlInner" ID="pnlContractRen">
                    <table style="width: 100%;">
                        <tr>
                            <td class="label" style="width: 20px">
                            </td>
                            <td class="label" style="width: 150px">
                                Contract Renewal Summary
                            </td>
                            <td class="label" style="width: 200px">
                                <asp:TextBox ID="txtContractRenewalSummary" runat="server" CssClass="InputTxtBox"
                                    TextMode="MultiLine" Height="50px" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldContractRenewalSummary" runat="server"
                                    ControlToValidate="txtContractRenewalSummary" ErrorMessage="Summary Required"
                                    ValidationGroup="SubmitConRen" Display="None">
                                </asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender ID="reqFldContractRenewalSummary_ValidatorCalloutExtender"
                                    runat="server" Enabled="True" TargetControlID="reqFldContractRenewalSummary"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td class="label" style="width: 20px">
                            </td>
                            <td class="label" style="width: 150px">
                            </td>
                            <td class="label" style="width: 200px">
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                &nbsp;
                            </td>
                            <td class="label">
                                Decision Of Contract Renewal Period
                            </td>
                            <td class="label">
                                <asp:DropDownList ID="drpRenewalPeriod" runat="server" CssClass="InputTxtBox" Width="60px">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>11</asp:ListItem>
                                    <asp:ListItem>12</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="label">
                                &nbsp;
                            </td>
                            <td class="label">
                                Approval Attachment
                            </td>
                            <td class="label">
                                <asp:FileUpload ID="flUpAppConRen" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                &nbsp;
                            </td>
                            <td class="label">
                                Effective Date
                            </td>
                            <td class="label">
                                <asp:TextBox ID="txtConRenewalEffectiveDate" runat="server" CssClass="InputTxtBox"
                                    Width="200px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtConRenewalEffectiveDate_CalendarExtender" runat="server"
                                    Enabled="True" TargetControlID="txtConRenewalEffectiveDate">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldConRenewalEffectiveDate" runat="server"
                                    ControlToValidate="txtConRenewalEffectiveDate" ErrorMessage="Date Required" ValidationGroup="SubmitConRen"
                                    Display="None">
                                </asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender ID="reqFldConRenewalEffectiveDate_ValidatorCalloutExtender"
                                    runat="server" Enabled="True" TargetControlID="reqFldConRenewalEffectiveDate"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td class="label">
                                &nbsp;
                            </td>
                            <td class="label">
                                Evaluation Attachment
                            </td>
                            <td class="label">
                                <asp:FileUpload ID="flUpEvaConRen" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                <asp:Button ID="btnConRenewalInsert" runat="server" Text="Insert" CssClass="styled-button-1"
                                    ValidationGroup="SubmitConRen" />
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
        <tr>
            <td class="label">
                <asp:Panel runat="server" SkinID="pnlInner" ID="pnlContractRenewal">
                    <div style="max-height: 250px; max-width: 900px; overflow: auto;">
                        <asp:GridView ID="grdContractRenewal" runat="server" SkinID="grdNoFooter" AutoGenerateColumns="false"
                            EmptyDataText="No Data Available" CssClass="mGrid">
                            <Columns>
                                <asp:TemplateField HeaderText="ContractRenewalID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblContractRenewalID" runat="server" Text='<%# Bind("ContractRenewalID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Renewal Summary">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRenewalSummary" runat="server" Text='<%# Bind("RenewalSummary") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="RenewalPeriod">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRenewalPeriod" runat="server" Text='<%# Bind("RenewalPeriod") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Effective Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEffectiveDate" runat="server" Text='<%# Bind("EffectiveDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Approval Attachment">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="hpDocument" CssClass="linkbtn" runat="server" NavigateUrl='<%# ConfigurationManager.AppSettings("AttachmentsShow") + Eval("ApprovalAttachment") %>'
                                            Target="_blank">View</asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Evaluation Attachment">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="hpDocument1" CssClass="linkbtn" runat="server" NavigateUrl='<%# ConfigurationManager.AppSettings("AttachmentsShow") + Eval("EvaluationAttachment") %>'
                                            Target="_blank">View</asp:HyperLink>
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
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <div class="widgettitle">
                    Promotion History</div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel runat="server" SkinID="pnlInner" ID="pnlPromotionHistory">
                    <table style="width: 100%;">
                        <tr>
                            <td class="label" style="width: 20px">
                            </td>
                            <td class="label" style="width: 150px">
                                Promotion Evaluation Summary
                            </td>
                            <td class="label" style="width: 200px">
                                <asp:TextBox ID="txtPromotionEvaluationSummary" runat="server" CssClass="InputTxtBox"
                                    Height="50px" Width="200px" TextMode="MultiLine"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldPromotionEvaluationSummary" runat="server"
                                    ControlToValidate="txtPromotionEvaluationSummary" ErrorMessage="Summary Required"
                                    ValidationGroup="SubmitPromotion" Display="None">
                                </asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender ID="reqFldPromotionEvaluationSummary_ValidatorCalloutExtender"
                                    runat="server" Enabled="True" TargetControlID="reqFldPromotionEvaluationSummary"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td class="label" style="width: 20px">
                            </td>
                            <td class="label" style="width: 150px">
                            </td>
                            <td class="label" style="width: 200px">
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Earlier Designation
                            </td>
                            <td class="label">
                                <asp:DropDownList ID="ddlEarlierDesignation" runat="server" CssClass="InputTxtBox"
                                    Width="200px" Enabled="false">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Promoted Designation
                            </td>
                            <td class="label">
                                <asp:DropDownList ID="ddlPromotedDesignation" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Effective Date
                            </td>
                            <td class="label">
                                <asp:TextBox ID="txtPromotionEffectiveDate" runat="server" CssClass="InputTxtBox"
                                    Width="200px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtPromotionEffectiveDate_CalendarExtender" runat="server"
                                    Enabled="True" TargetControlID="txtPromotionEffectiveDate">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldPromotionEffectiveDate" runat="server"
                                    ControlToValidate="txtPromotionEffectiveDate" ErrorMessage="Date Required" ValidationGroup="SubmitPromotion"
                                    Display="None">
                                </asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender ID="reqFldPromotionEffectiveDate_ValidatorCalloutExtender"
                                    runat="server" Enabled="True" TargetControlID="reqFldPromotionEffectiveDate"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Approval Attachment
                            </td>
                            <td class="label">
                                <asp:FileUpload ID="flUpPromotion" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                <asp:Button ID="btnPromoitonInsert" runat="server" Text="Insert" CssClass="styled-button-1"
                                    ValidationGroup="SubmitPromotion" />
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
                            <td>
                            </td>
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
        </tr>
        <tr>
            <td class="label">
                <asp:Panel runat="server" SkinID="pnlInner" ID="pnlPromotionHis">
                    <div style="max-height: 250px; max-width: 900px; overflow: auto;">
                        <asp:GridView ID="grdPromotionHis" runat="server" SkinID="grdNoFooter" AutoGenerateColumns="False"
                            EmptyDataText="No Data Available" CssClass="mGrid">
                            <Columns>
                                <asp:TemplateField HeaderText="PromoHistID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPromoHistID" runat="server" Text='<%# Bind("PromoHistID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Evaluation Summary">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEvaluationSummary" runat="server" Text='<%# Bind("EvaluationSummary") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="New Designation">
                                    <ItemTemplate>
                                        <asp:Label ID="lbNewDesignationName" runat="server" Text='<%# Bind("NewDesignationName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Old Designation">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOldDesignationName" runat="server" Text='<%# Bind("OldDesignationName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Effective Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEffectiveDate" runat="server" Text='<%# Bind("EffectiveDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Approval Attachment">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="hpDocument" CssClass="linkbtn" runat="server" NavigateUrl='<%# ConfigurationManager.AppSettings("AttachmentsShow") + Eval("ApprovalAttachment") %>'
                                            Target="_blank">View</asp:HyperLink>
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
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <div class="widgettitle">
                    Functional Designation History</div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel runat="server" SkinID="pnlInner" ID="pnlFuncDesig">
                    <table style="width: 100%;">
                        <tr>
                            <td class="label">
                                &nbsp;
                            </td>
                            <td class="label">
                                Evaluation Summary
                            </td>
                            <td class="label">
                                <asp:TextBox ID="txtFunctionalEvaSum" runat="server" CssClass="InputTxtBox" TextMode="MultiLine"
                                    Height="50px" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFunctionalEvaSum" runat="server" ControlToValidate="txtFunctionalEvaSum"
                                    ErrorMessage="Summary Required" ValidationGroup="SubmitFuncDesig" Display="None">
                                </asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender ID="reqFunctionalEvaSum_ValidatorCalloutExtender"
                                    runat="server" Enabled="True" TargetControlID="reqFunctionalEvaSum" CloseImageUrl="~/Sources/images/valClose.png"
                                    CssClass="customCalloutStyle" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
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
                                Earlier Functional Designation
                            </td>
                            <td class="label">
                                <asp:DropDownList ID="ddlEarFuncDesig" runat="server" CssClass="InputTxtBox" Width="200px"
                                    Enabled="false">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                New Functional Designation
                            </td>
                            <td class="label">
                                <asp:DropDownList ID="ddlNewFuncDesig" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Effective Date
                            </td>
                            <td class="label">
                                <asp:TextBox ID="txtFuncDesigEffectiveDate" runat="server" CssClass="InputTxtBox"
                                    Width="200px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtFuncDesigEffectiveDate_CalendarExtender" runat="server"
                                    Enabled="True" TargetControlID="txtFuncDesigEffectiveDate">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldFuncDesigEffectiveDate" runat="server"
                                    ControlToValidate="txtFuncDesigEffectiveDate" ErrorMessage="Date Required" ValidationGroup="SubmitFuncDesig"
                                    Display="None">
                                </asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender ID="reqFldFuncDesigEffectiveDate_ValidatorCalloutExtender"
                                    runat="server" Enabled="True" TargetControlID="reqFldFuncDesigEffectiveDate"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Approval Attachment
                            </td>
                            <td>
                                <asp:FileUpload ID="flUpFuncDesig" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                <asp:Button ID="btnSubmitfuncDesig" runat="server" Text="Insert" CssClass="styled-button-1"
                                    ValidationGroup="SubmitFuncDesig" />
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
                            <td>
                            </td>
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
        </tr>
        <tr>
            <td class="label">
                <asp:Panel runat="server" SkinID="pnlInner" ID="pnlFuncDesigGrid">
                    <div style="max-height: 250px; max-width: 900px; overflow: auto;">
                        <asp:GridView ID="grdFuncDesig" runat="server" SkinID="grdNoFooter" AutoGenerateColumns="False"
                            EmptyDataText="No Data Available" CssClass="mGrid">
                            <Columns>
                                <asp:TemplateField HeaderText="PromoHistID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPromoHistID" runat="server" Text='<%# Bind("FuncDesigHistID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Evaluation Summary">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEvaluationSummary" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="New Designation">
                                    <ItemTemplate>
                                        <asp:Label ID="lbNewDesignationName" runat="server" Text='<%# Bind("NewDesignationName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Old Designation">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOldDesignationName" runat="server" Text='<%# Bind("OldDesignationName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Effective Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEffectiveDate" runat="server" Text='<%# Bind("EffectiveDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Approval Attachment">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="hpDocument" CssClass="linkbtn" runat="server" NavigateUrl='<%# ConfigurationManager.AppSettings("AttachmentsShow") + Eval("ApprovalAttachment") %>'
                                            Target="_blank">View</asp:HyperLink>
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
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <div class="widgettitle">
                    Transfer Of Department</div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel runat="server" SkinID="pnlInner" ID="pnlTransferOfDepartment">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="6">
                            </td>
                        </tr>
                        <tr>
                            <td class="label" style="width: 20px">
                            </td>
                            <td class="label" style="width: 150px">
                                Current Department
                            </td>
                            <td style="width: 200px">
                                <asp:DropDownList ID="drpTrnsOfDeptCurrentDept" runat="server" CssClass="InputTxtBox"
                                    Width="200px" Enabled="false">
                                </asp:DropDownList>
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td class="label" style="width: 150px">
                                Current Supervisor
                            </td>
                            <td style="width: 200px">
                                <asp:DropDownList ID="drpTrnsOfDeptCurrentSupervisor" runat="server" CssClass="InputTxtBox"
                                    Width="200px" Enabled="false">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                &nbsp;
                            </td>
                            <td class="label">
                                New Department
                            </td>
                            <td>
                                <asp:DropDownList ID="drpTrnsOfDeptNewDept" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                                New Supervisor
                            </td>
                            <td>
                                <asp:DropDownList ID="drpTrnsOfDeptNewSupervisor" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                &nbsp;
                            </td>
                            <td class="label">
                                Effective Date
                            </td>
                            <td>
                                <asp:TextBox ID="txtDeptTransEffectiveDate" runat="server" CssClass="InputTxtBox"
                                    Width="200px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtDeptTransEffectiveDate_CalendarExtender" runat="server"
                                    Enabled="True" TargetControlID="txtDeptTransEffectiveDate">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldDeptTransEffectiveDate" runat="server"
                                    ControlToValidate="txtDeptTransEffectiveDate" ErrorMessage="Date Required" ValidationGroup="SubmitDeptTrans"
                                    Display="None">
                                </asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender ID="reqFldDeptTransEffectiveDate_ValidatorCalloutExtender"
                                    runat="server" Enabled="True" TargetControlID="reqFldDeptTransEffectiveDate"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="btnDepartmentInsert" runat="server" Text="Insert" CssClass="styled-button-1"
                                    ValidationGroup="SubmitDeptTrans" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                &nbsp;
                            </td>
                            <td class="label">
                                &nbsp;
                            </td>
                            <td>
                            </td>
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
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="label">
                <asp:Panel runat="server" SkinID="pnlInner" ID="pnlDeptTransfer">
                    <div style="max-height: 250px; max-width: 900px; overflow: auto;">
                        <asp:GridView ID="grdDeptTransfer" runat="server" SkinID="grdNoFooter" AutoGenerateColumns="False"
                            EmptyDataText="No Data Available" CssClass="mGrid">
                            <Columns>
                                <asp:TemplateField HeaderText="DeptTransferID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDeptTransferID" runat="server" Text='<%# Bind("DeptTransferID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="New Department">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNewDepartmentName" runat="server" Text='<%# Bind("NewDepartmentName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Old Department">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOldDepartmentName" runat="server" Text='<%# Bind("OldDepartmentName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="New Supervisor">
                                    <ItemTemplate>
                                        <asp:Label ID="lbNewSupervisorName" runat="server" Text='<%# Bind("NewSupervisorName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Previous Supervisor">
                                    <ItemTemplate>
                                        <asp:Label ID="lbPrevSupervisorName" runat="server" Text='<%# Bind("PrevSupervisorName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Effective Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEffectiveDate" runat="server" Text='<%# Bind("EffectiveDate") %>'></asp:Label>
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
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel runat="server" SkinID="pnlInner" ID="pnlTransferOfLocation">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="6">
                                <div class="widgettitle">
                                    Transfer Of Location</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                                &nbsp;
                            </td>
                            <td class="label" style="width: 150px">
                                &nbsp;
                            </td>
                            <td style="width: 200px">
                                &nbsp;
                            </td>
                            <td style="width: 20px">
                                &nbsp;
                            </td>
                            <td class="label" style="width: 150px">
                                &nbsp;
                            </td>
                            <td style="width: 200px">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td class="label" style="width: 150px">
                                Current Branch
                            </td>
                            <td style="width: 200px">
                                <asp:DropDownList runat="server" CssClass="InputTxtBox" Width="200px" ID="drpTrnsLocationCurrentBranch"
                                    Enabled="false">
                                </asp:DropDownList>
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td class="label" style="width: 150px">
                                Current Supervisor
                            </td>
                            <td style="width: 200px">
                                <asp:DropDownList ID="drpTrnsOfLocCurrentSupervisor" runat="server" CssClass="InputTxtBox"
                                    Width="200px" Enabled="false">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td class="label" style="width: 150px">
                                New Branch
                            </td>
                            <td style="width: 200px">
                                <asp:DropDownList ID="drpTrnsLocationNewBranch" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                                New Supervisor
                            </td>
                            <td>
                                <asp:DropDownList ID="drpTrnsOfLocNewSupervisor" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                            </td>
                            <td class="label">
                                Effective Date
                            </td>
                            <td>
                                <asp:TextBox ID="txtTrnsLocationEffectiveDate" runat="server" CssClass="InputTxtBox"
                                    Width="200px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtTrnsLocationEffectiveDate_CalendarExtender" runat="server"
                                    Enabled="True" TargetControlID="txtTrnsLocationEffectiveDate">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldTrnsLocationEffectiveDate" runat="server"
                                    ControlToValidate="txtTrnsLocationEffectiveDate" Display="None" ErrorMessage="Date Required"
                                    ValidationGroup="SubmitLocationTrans">
                                </asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldTrnsLocationEffectiveDate_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldTrnsLocationEffectiveDate" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnLocationTransfer" runat="server" CssClass="styled-button-1" Text="Insert"
                                    ValidationGroup="SubmitLocationTrans" />
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="label">
                <asp:Panel runat="server" SkinID="pnlInner" ID="pnlLocationTransfer">
                    <div style="max-height: 250px; max-width: 900px; overflow: auto;">
                        <asp:GridView ID="grdLocationTransfer" runat="server" SkinID="grdNoFooter" AutoGenerateColumns="False"
                            EmptyDataText="No Data Available" CssClass="mGrid">
                            <Columns>
                                <asp:TemplateField HeaderText="BranchTransferID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBranchTransferID" runat="server" Text='<%# Bind("BranchTransferID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="New Branch">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNewBranch" runat="server" Text='<%# Bind("NewBranch") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Old Branch">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOldBranch" runat="server" Text='<%# Bind("OldBranch") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="New Supervisor">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNewSupervisorName" runat="server" Text='<%# Bind("NewSupervisorName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Previous Supervisor">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPrevSupervisorName" runat="server" Text='<%# Bind("PrevSupervisorName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Effective Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEffectiveDate" runat="server" Text='<%# Bind("EffectiveDate") %>'></asp:Label>
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
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlSupervisorChange" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="6">
                                <div class="widgettitle">
                                    Supervisor Change</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 200px">
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Current Supervisor
                            </td>
                            <td>
                                <asp:DropDownList ID="drpSupervisorChngCurrentSupervisor" runat="server" CssClass="InputTxtBox"
                                    Enabled="false" Width="200px" ValidationGroup="SupervisorChange">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                New Supervisor
                            </td>
                            <td>
                                <asp:DropDownList ID="drpSupervisorchngNewSupervisor" runat="server" CssClass="InputTxtBox"
                                    Width="200px" ValidationGroup="SupervisorChange">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Effective Date
                            </td>
                            <td>
                                <asp:TextBox ID="txtSuperVisorChngEffectiveDate" runat="server" CssClass="InputTxtBox"
                                    Width="200px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtSuperVisorChngEffectiveDate_CalendarExtender" runat="server"
                                    Enabled="True" TargetControlID="txtSuperVisorChngEffectiveDate">
                                </cc1:CalendarExtender>
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
                            <td>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldSupervisorChngEffectiveDate" runat="server"
                                    ControlToValidate="txtSuperVisorChngEffectiveDate" Display="None" ErrorMessage="Date Required"
                                    ValidationGroup="SupervisorChange"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldSupervisorChngEffectiveDate_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldSupervisorChngEffectiveDate" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnChangeSupervisor" runat="server" CssClass="DButton" Text="Insert"
                                    ValidationGroup="SupervisorChange" />
                            </td>
                            <td>
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
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlSupervisorChngHistory" runat="server" SkinID="pnlInner">
                    <asp:GridView ID="grdSupervisorChngHistory" runat="server" CssClass="mGrid" AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField HeaderText="New Supervisor">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("NewSupervisor") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Prev Supervisor">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("PrevSupervisor") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Effective Date">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("EffectiveDate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
