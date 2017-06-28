<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmExamDefinition.aspx.vb" Inherits="frmExamDefinition" Title=".::HRM : Exam Definition::." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlExamDefinition" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" class="label" colspan="5">
                                <div class="widgettitle">
                                    Exam Definition<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 150px">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                            </td>
                            <td align="left" class="label">
                                Choose Exam
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpAvailableExams" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label">
                            </td>
                            <td class="label">
                                Name Of The Exam
                            </td>
                            <td>
                                <asp:TextBox ID="txtExamName" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldNameOfTheExam" runat="server" ControlToValidate="txtExamName"
                                    ErrorMessage="*" ValidationGroup="SubmitExamDef"></asp:RequiredFieldValidator>
                            </td>
                            <td class="label">
                                Dynamic Question Gneration
                            </td>
                            <td>
                                <asp:CheckBox ID="chkIsDynamicQuestionGeneration" runat="server" CssClass="chkText"
                                    Text="Is Dynamic" AutoPostBack="True" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Exam Code
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtExamCode" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="reqFldExamCode" runat="server" ControlToValidate="txtExamCode"
                                    ErrorMessage="*" ValidationGroup="SubmitExamDef">
                                </asp:RequiredFieldValidator>
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
                                Positive Marking/Question
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtPositiveMarkingPerQuestion" runat="server" CssClass="InputTxtBox"
                                    Width="80px"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="reqFldPositiveMarkingPerQuestion" runat="server"
                                    ControlToValidate="txtPositiveMarkingPerQuestion" ErrorMessage="*" ValidationGroup="SubmitExamDef">
                                </asp:RequiredFieldValidator>
                                <cc1:MaskedEditExtender ID="MskEdtPositiveMarkingPerQuestion" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="99.99" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtPositiveMarkingPerQuestion" />
                                <cc1:MaskedEditValidator ID="MskEdtValPositiveMarkingPerQuestion" runat="server"
                                    ControlExtender="MskEdtPositiveMarkingPerQuestion" ControlToValidate="txtPositiveMarkingPerQuestion"
                                    EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers" IsValidEmpty="false"
                                    MaximumValue="10" MaximumValueMessage=" &lt; 11" MinimumValue="0" MinimumValueMessage=" &gt; -1"
                                    ToolTip="Enter values from 0 to 10" ValidationGroup="SubmitExamDef">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </cc1:MaskedEditValidator>
                                <asp:CheckBox ID="chkPositiveMarkingAsDefault" runat="server" AutoPostBack="True"
                                    CssClass="chkText" Text=" Set As Default" />
                            </td>
                            <td align="left" class="label">
                                Total Question
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtTotalNoOfQuestion" runat="server" CssClass="InputTxtBox" Width="80px"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="reqFldTotalNoOfQuestion" runat="server" ControlToValidate="txtTotalNoOfQuestion"
                                    ErrorMessage="*" ValidationGroup="SubmitExamDef">
                                </asp:RequiredFieldValidator>
                                <cc1:MaskedEditExtender ID="MskEdtTotalNoOfQuestion" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="999" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtTotalNoOfQuestion" />
                                <cc1:MaskedEditValidator ID="MskEdtValTotalNoOfQuestion" runat="server" ControlExtender="MskEdtTotalNoOfQuestion"
                                    ControlToValidate="txtTotalNoOfQuestion" EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers"
                                    IsValidEmpty="false" MaximumValue="999" MaximumValueMessage=" &lt; 1000" MinimumValue="1"
                                    MinimumValueMessage=" &gt; 0" ToolTip="Enter values from 1 to 999" ValidationGroup="SubmitExamDef">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </cc1:MaskedEditValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Negative Marking/Question
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtNegativeMarkingPerQuestion" runat="server" CssClass="InputTxtBox"
                                    Width="80px"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="reqFldNegativeMarkingPerQuestion" runat="server"
                                    ControlToValidate="txtNegativeMarkingPerQuestion" ErrorMessage="*" ValidationGroup="SubmitExamDef">
                                </asp:RequiredFieldValidator>
                                <cc1:MaskedEditExtender ID="MskEdtNegativeMarkingPerQuestion" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="99.99" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtNegativeMarkingPerQuestion" />
                                <cc1:MaskedEditValidator ID="MskEdtValNegativeMarkingPerQuestion" runat="server"
                                    ControlExtender="MskEdtNegativeMarkingPerQuestion" ControlToValidate="txtNegativeMarkingPerQuestion"
                                    EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers" IsValidEmpty="false"
                                    MaximumValue="10" MaximumValueMessage=" &lt; 11" MinimumValue="0" MinimumValueMessage=" &gt; -1"
                                    ToolTip="Enter values from 0 to 10" ValidationGroup="SubmitExamDef">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </cc1:MaskedEditValidator>
                                <asp:CheckBox ID="chkNegativeMarkingAsDefault" runat="server" AutoPostBack="True"
                                    CssClass="chkText" Text=" Set As Default" />
                            </td>
                            <td align="left" class="label">
                                Total Marks
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtTotalMarks" runat="server" CssClass="InputTxtBox" Width="80px"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="reqFldTotalmarks" runat="server" ControlToValidate="txtTotalMarks"
                                    ErrorMessage="*" ValidationGroup="SubmitExamDef">
                                </asp:RequiredFieldValidator>
                                <cc1:MaskedEditExtender ID="MskEdtTotalMarks" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="999" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtTotalMarks" />
                                <cc1:MaskedEditValidator ID="MskEdtValTotalMarks" runat="server" ControlExtender="MskEdtTotalMarks"
                                    ControlToValidate="txtTotalMarks" EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers"
                                    IsValidEmpty="false" MaximumValue="999" MaximumValueMessage=" &lt; 1000" MinimumValue="1"
                                    MinimumValueMessage=" &gt; 0" ToolTip="Enter values from 1 to 999" ValidationGroup="SubmitExamDef">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </cc1:MaskedEditValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Skip Marking/Question
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtSkipMarkingPerQuestion" runat="server" CssClass="InputTxtBox"
                                    Width="80px">0</asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="reqFldSkipMarkingPerQuestion" runat="server" ControlToValidate="txtSkipMarkingPerQuestion"
                                    ErrorMessage="*" ValidationGroup="SubmitExamDef">
                                </asp:RequiredFieldValidator>
                                <cc1:MaskedEditExtender ID="MskEdtSkipMarkingPerQuestion" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="99.99" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtSkipMarkingPerQuestion" />
                                <cc1:MaskedEditValidator ID="MskEdtValSkipMarkingPerQuestion" runat="server" ControlExtender="MskEdtSkipMarkingPerQuestion"
                                    ControlToValidate="txtSkipMarkingPerQuestion" EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers"
                                    IsValidEmpty="false" MaximumValue="10" MaximumValueMessage=" &lt; 11" MinimumValue="0"
                                    MinimumValueMessage=" &gt; -1" ToolTip="Enter values from 0 to 10" ValidationGroup="SubmitExamDef">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </cc1:MaskedEditValidator>
                                <asp:CheckBox ID="chkSkipMarkingAsDefault" runat="server" AutoPostBack="True" CssClass="chkText"
                                    Text=" Set As Default" />
                            </td>
                            <td align="left" class="label">
                                Total Time (Min)
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtTotalTime" runat="server" CssClass="InputTxtBox" Width="80px"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="reqFldTotalTime" runat="server" ControlToValidate="txtTotalTime"
                                    ErrorMessage="*" ValidationGroup="SubmitExamDef">
                                </asp:RequiredFieldValidator>
                                <cc1:MaskedEditExtender ID="MskEdtTotalTime" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="999" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtTotalTime" />
                                <cc1:MaskedEditValidator ID="MskEdtValTotalTime" runat="server" ControlExtender="MskEdtTotalTime"
                                    ControlToValidate="txtTotalTime" EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers"
                                    IsValidEmpty="false" MaximumValue="999" MaximumValueMessage=" &lt; 1000" MinimumValue="1"
                                    MinimumValueMessage=" &gt; 0" ToolTip="Enter values from 1 to 999" ValidationGroup="SubmitExamDef">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </cc1:MaskedEditValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Not Answered Marking/Question
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtNotAnsweredPerQuestion" runat="server" CssClass="InputTxtBox"
                                    Width="80px">0</asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="reqFldNotAnsweredMarkingPerQuestion" runat="server"
                                    ControlToValidate="txtNotAnsweredPerQuestion" ErrorMessage="*" ValidationGroup="SubmitExamDef">
                                </asp:RequiredFieldValidator>
                                <cc1:MaskedEditExtender ID="MskEdtNotAnsweredPerQuestion" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="99.99" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtNotAnsweredPerQuestion" />
                                <cc1:MaskedEditValidator ID="MskEdtValNotAnsweredPerQuestion" runat="server" ControlExtender="MskEdtSkipMarkingPerQuestion"
                                    ControlToValidate="txtNotAnsweredPerQuestion" EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers"
                                    IsValidEmpty="false" MaximumValue="10" MaximumValueMessage=" &lt; 11" MinimumValue="0"
                                    MinimumValueMessage=" &gt; -1" ToolTip="Enter values from 0 to 10" ValidationGroup="SubmitExamDef">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </cc1:MaskedEditValidator>
                                <asp:CheckBox ID="chkNotAnsweredAsDefault" runat="server" AutoPostBack="True" CssClass="chkText"
                                    Text=" Set As Default" />
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
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
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlSubjectWiseMarksDistribution" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" class="label" colspan="5">
                                <div class="widgettitle">
                                    Define Subjects For The Exam</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                            </td>
                            <td align="left" class="label">
                                Choose Subject
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpSubjectList" runat="server" AutoPostBack="True" 
                                    CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td align="left" class="label">
                                Active Q:
                                <asp:Label ID="lblNoOfActiveQuestions" runat="server" CssClass="label" 
                                    ForeColor="#009900"></asp:Label>
                            </td>
                            <td class="label">
                                In-Active Q:
                                <asp:Label ID="lblNoOfInactiveQuestions" runat="server" CssClass="label" 
                                    ForeColor="#CC0000"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left">
                                <asp:Label ID="lblDifficultyLevelStr" runat="server" CssClass="label" 
                                    ForeColor="#009900"></asp:Label>
                            </td>
                            <td align="left" class="label" colspan="2">
                                <asp:Label ID="lblErrorMessage" runat="server" CssClass="Mandatorylabel"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Positive Marking/Question
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtSubWisePositiveMarkingPerQusetion" runat="server" CssClass="InputTxtBox"
                                    Width="80px"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="reqFldSubwisePositiveMarkingPerQuestion" runat="server"
                                    ControlToValidate="txtSubWisePositiveMarkingPerQusetion" ErrorMessage="*" ValidationGroup="AddSub">
                                </asp:RequiredFieldValidator>
                                <cc1:MaskedEditExtender ID="MskEdtSubWisePositiveMarkingPerQusetion" runat="server"
                                    AcceptNegative="Left" ErrorTooltipEnabled="True" InputDirection="RightToLeft"
                                    Mask="99.99" MaskType="Number" MessageValidatorTip="true" TargetControlID="txtSubWisePositiveMarkingPerQusetion" />
                                <cc1:MaskedEditValidator ID="MskEdtValSubWisePositiveMarkingPerQusetion" runat="server"
                                    ControlExtender="MskEdtSubWisePositiveMarkingPerQusetion" ControlToValidate="txtSubWisePositiveMarkingPerQusetion"
                                    EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers" IsValidEmpty="false"
                                    MaximumValue="10" MaximumValueMessage=" &lt; 11" MinimumValue="0" MinimumValueMessage=" &gt; -1"
                                    ToolTip="Enter values from 0 to 10" ValidationGroup="AddSub">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </cc1:MaskedEditValidator>
                            </td>
                            <td align="left" class="label">
                                Skip Marking/Question
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtSubWiseSkipMarkingPerQuestion" runat="server" CssClass="InputTxtBox"
                                    Width="80px">0</asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="reqFldSubWiseSkipMarkingPerQuestion" runat="server"
                                    ControlToValidate="txtSkipMarkingPerQuestion" ErrorMessage="*">
                                </asp:RequiredFieldValidator>
                                <cc1:MaskedEditExtender ID="MskEdtSubWiseSkipMarkingPerQuestion" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="99.99" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtSubWiseSkipMarkingPerQuestion" />
                                <cc1:MaskedEditValidator ID="MskEdtValSubWiseSkipMarkingPerQuestion" runat="server"
                                    ControlExtender="MskEdtSubWiseSkipMarkingPerQuestion" ControlToValidate="txtSubWiseSkipMarkingPerQuestion"
                                    EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers" IsValidEmpty="false"
                                    MaximumValue="10" MaximumValueMessage=" &lt; 11" MinimumValue="0" MinimumValueMessage=" &gt; -1"
                                    ToolTip="Enter values from 0 to 10" ValidationGroup="AddSub">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </cc1:MaskedEditValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Negative Marking/Question
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtSubWiseNegativeMarkingPerQuestion" runat="server" CssClass="InputTxtBox"
                                    Width="80px"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="reqFldSubWiseNegativeMarkingPerQuestion" runat="server"
                                    ControlToValidate="txtSubWiseNegativeMarkingPerQuestion" ErrorMessage="*" ValidationGroup="AddSub">
                                </asp:RequiredFieldValidator>
                                <cc1:MaskedEditExtender ID="MskEdtSubWiseNegativeMarkingPerQuestion" runat="server"
                                    AcceptNegative="Left" ErrorTooltipEnabled="True" InputDirection="RightToLeft"
                                    Mask="99.99" MaskType="Number" MessageValidatorTip="true" TargetControlID="txtSubWiseNegativeMarkingPerQuestion" />
                                <cc1:MaskedEditValidator ID="MskEdtValSubWiseNegativeMarkingPerQuestion" runat="server"
                                    ControlExtender="MskEdtSubWiseSkipMarkingPerQuestion" ControlToValidate="txtSubWiseNegativeMarkingPerQuestion"
                                    EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers" IsValidEmpty="false"
                                    MaximumValue="10" MaximumValueMessage=" &lt; 11" MinimumValue="0" MinimumValueMessage=" &gt; -1"
                                    ToolTip="Enter values from 0 to 10" ValidationGroup="AddSub">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </cc1:MaskedEditValidator>
                            </td>
                            <td align="left" class="label">
                                Not Answered Marking/Question
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtSubWiseNotAnsweredPerQuestion" runat="server" CssClass="InputTxtBox"
                                    Width="80px">0</asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="reqFldSubWiseNotAnsweredMarkingPerQuestion" runat="server"
                                    ControlToValidate="txtSubWiseNotAnsweredPerQuestion" ErrorMessage="*">
                                </asp:RequiredFieldValidator>
                                <cc1:MaskedEditExtender ID="MskEdtSubWiseNotAnsweredPerQuestion" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="99.99" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtSubWiseNotAnsweredPerQuestion" />
                                <cc1:MaskedEditValidator ID="MskEdtValSubWiseNotAnsweredPerQuestion" runat="server"
                                    ControlExtender="MskEdtSubWiseNotAnsweredPerQuestion" ControlToValidate="txtSubWiseNotAnsweredPerQuestion"
                                    EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers" IsValidEmpty="false"
                                    MaximumValue="10" MaximumValueMessage=" &lt; 11" MinimumValue="0" MinimumValueMessage=" &gt; -1"
                                    ToolTip="Enter values from 0 to 10" ValidationGroup="AddSub">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </cc1:MaskedEditValidator>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Question Pick Percentage
                            </td>
                            <td>
                                <asp:TextBox ID="txtQuestionPickPercentage" runat="server" CssClass="InputTxtBox"
                                    Width="80px"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="reqFldQuePickPercentage" runat="server" ControlToValidate="txtQuestionPickPercentage"
                                    ErrorMessage="*" ValidationGroup="AddSubN"></asp:RequiredFieldValidator>
                            </td>
                            <td class="label">
                                Difficulty Level
                            </td>
                            <td>
                                <asp:DropDownList ID="drpDifficultyLevel" runat="server" CssClass="InputTxtBox">
                                    <asp:ListItem>N\A</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                            </td>
                            <td align="left">
                                <asp:Button ID="btnAddSubject" runat="server" CssClass="styled-button-1" Text="ADD"
                                    ValidationGroup="AddSub" />
                            </td>
                            <td align="left">
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
                <asp:Panel ID="pnlChoosenSubjects" runat="server" Width="100%" SkinID="pnlInner">
                    <div>
                        <asp:GridView ID="grdExamWiseSubject" runat="server" AutoGenerateColumns="False"
                            CssClass="mGrid">
                            <Columns>
                                <asp:TemplateField HeaderText="Sl">
                                    <ItemTemplate>
                                        <font style="font-size: 12px"><b>
                                            <%#CType(Container, GridViewRow).RowIndex + 1%></b> </font>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SubjectID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSubjectID" runat="server" Text='<%# Bind("SubjectID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SubjectName">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSubjectName" runat="server" Text='<%# Bind("SubjectName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Positive">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPositiveMarkingPerQuestion" runat="server" Text='<%# Bind("PositiveMarkingPerQuestion") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Negative">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNegativeMarkingPerQuestion" runat="server" Text='<%# Bind("NegativeMarkingPerQuestion") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Skip">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSkipMarkingPerQuestion" runat="server" Text='<%# Bind("SkipMarkingPerQuestion") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Not-Answered">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNotAnsweredMarkingPerQuestion" runat="server" Text='<%# Bind("NotAnsweredMarkingPerQuestion") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Percentage">
                                    <ItemTemplate>
                                        <asp:Label ID="lblQuePickPercentage" runat="server" Text='<%# Bind("QuePickPercentage") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="AllocatedQuestion">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAllocatedQuestion" runat="server" Text='<%# Bind("AllocatedQuestion") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DifficultyLevel">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDifficultyLevel" runat="server" Text='<%# Bind("DifficultyLevel") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnDelete" Width="15px" ImageUrl="~/Sources/images/erase.png"
                                            OnClientClick="if (!confirm('Are you Sure to Delete The Item From The List ?')) return false"
                                            CommandName="Delete" runat="server" ValidationGroup="na" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlGradingSystem" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="4" align="left">
                                <div class="widgettitle">
                                    Define Grading System
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td align="left" class="label">
                                Grading System
                            </td>
                            <td align="left" style="float: left">
                                <asp:RequiredFieldValidator ID="reqFldGradingSystem" runat="server" ControlToValidate="rdbtnGradingSystem"
                                    ErrorMessage="*" ValidationGroup="SubmitExamDef">
                                </asp:RequiredFieldValidator>
                                <asp:RadioButtonList ID="rdbtnGradingSystem" runat="server" AutoPostBack="True" class="label"
                                    RepeatDirection="Horizontal">
                                    <asp:ListItem>Default</asp:ListItem>
                                    <asp:ListItem>Customized</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:DropDownList ID="drpGradSysType" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td valign="top">
                                <div style="max-height: 250px; max-width: 300px; overflow: auto">
                                    <asp:GridView ID="grdDefaultGradingSystem" runat="server" AutoGenerateColumns="False"
                                        CssClass="mGrid" EmptyDataText="No Data Available">
                                        <Columns>
                                            <asp:TemplateField HeaderText="SL">
                                                <ItemTemplate>
                                                    <font style="font-size: 12px"><b>
                                                        <%#CType(Container, GridViewRow).RowIndex + 1%></b> </font>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="FromPercentage">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDefFromPercentage" runat="server" Text='<%# Bind("FromPercentage") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ToPercentage">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDefToPercentage" runat="server" Text='<%# Bind("ToPercentage") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="LetterGrade">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDefLetterGrade" runat="server" Text='<%# Bind("LetterGrade") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="GradePoint">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDefGradePoint" runat="server" Text='<%# Bind("GradePoint") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="GradingExplanation" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDefGradingExplanation" runat="server" Text='<%# Bind("GradingExplanation") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                            <td>
                                <asp:Panel ID="pnlCustomizedGrading" runat="server" SkinID="pnlInner" Width="600px">
                                    <table style="width: 100%;">
                                        <tr align="left">
                                            <td style="width: 20px">
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
                                        <tr align="left">
                                            <td style="width: 20px">
                                            </td>
                                            <td class="label">
                                                Percentage From
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtPercentageFrom" runat="server" CssClass="InputTxtBox" Width="80px"></asp:TextBox>
                                                &nbsp;
                                                <asp:RequiredFieldValidator ID="reqFldPercentageFrom" runat="server" ControlToValidate="txtPercentageFrom"
                                                    ErrorMessage="*" ValidationGroup="AddGrading"></asp:RequiredFieldValidator>
                                                &nbsp;
                                                <cc1:MaskedEditExtender ID="MskEdtPercentageFrom" runat="server" AcceptNegative="Left"
                                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="999" MaskType="Number"
                                                    MessageValidatorTip="true" TargetControlID="txtPercentageFrom" />
                                                <cc1:MaskedEditValidator ID="MskEdtValPercentageFrom" runat="server" ControlExtender="MskEdtPercentageFrom"
                                                    ControlToValidate="txtPercentageFrom" EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers"
                                                    IsValidEmpty="false" MaximumValue="100" MaximumValueMessage=" &lt; 101" MinimumValue="0"
                                                    MinimumValueMessage=" &gt; -1" ToolTip="Enter values from 0 to 10" ValidationGroup="AddGrading"></cc1:MaskedEditValidator>
                                            </td>
                                            <td class="label">
                                                Letter Grade
                                            </td>
                                            <td align="left">
                                                <asp:DropDownList ID="drpLetterGrade" runat="server" CssClass="InputTxtBox" Width="80px">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="label">
                                            </td>
                                            <td align="left" class="label">
                                                Percentage To
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtPercentageTo" runat="server" CssClass="InputTxtBox" Width="80px"></asp:TextBox>
                                                &nbsp;
                                                <asp:RequiredFieldValidator ID="reqFldPercentageTo" runat="server" ControlToValidate="txtPercentageTo"
                                                    ErrorMessage="*" ValidationGroup="AddGrading"></asp:RequiredFieldValidator>
                                                <cc1:MaskedEditExtender ID="MskEdtPercentageTo" runat="server" AcceptNegative="Left"
                                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="999" MaskType="Number"
                                                    MessageValidatorTip="true" TargetControlID="txtPercentageTo" />
                                                <cc1:MaskedEditValidator ID="MskEdtValPercentageTo" runat="server" ControlExtender="MskEdtPercentageTo"
                                                    ControlToValidate="txtPercentageTo" EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers"
                                                    IsValidEmpty="false" MaximumValue="100" MaximumValueMessage=" &lt; 101" MinimumValue="0"
                                                    MinimumValueMessage=" &gt; -1" ToolTip="Enter values from 0 to 10" ValidationGroup="AddGrading"></cc1:MaskedEditValidator>
                                                &nbsp;
                                            </td>
                                            <td align="left" class="label">
                                                Grade Point
                                            </td>
                                            <td align="left">
                                                <asp:DropDownList ID="drpGradePoint" runat="server" CssClass="InputTxtBox" Width="80px">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td align="left">
                                                <asp:Button ID="btnAddGrade" runat="server" CssClass="styled-button-1" Text="ADD"
                                                    ValidationGroup="AddGrading" />
                                            </td>
                                            <td align="left" class="label">
                                                Explanation
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtGradeExplanation" runat="server" CssClass="InputTxtBox" Height="50px"
                                                    TextMode="MultiLine" Width="200px">N\A</asp:TextBox>
                                                &nbsp;<asp:RequiredFieldValidator ID="reqFldGradingExplanation" runat="server" ControlToValidate="txtGradeExplanation"
                                                    ErrorMessage="*" ValidationGroup="AddGrading"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td colspan="4">
                                                &nbsp;<asp:GridView ID="grdExamWiseGradingSystem" runat="server" AutoGenerateColumns="False"
                                                    CssClass="mGrid">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="SL">
                                                            <ItemTemplate>
                                                                <b>
                                                                    <%#CType(Container, GridViewRow).RowIndex + 1%></b>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="FromPercentage">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("FromPercentage") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFromPercentage" runat="server" Text='<%# Bind("FromPercentage") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="ToPercentage">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ToPercentage") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblToPercentage" runat="server" Text='<%# Bind("ToPercentage") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="LetterGrade">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("LetterGrade") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblLetterGrade" runat="server" Text='<%# Bind("LetterGrade") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="GradePoint">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("GradePoint") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblGradePoint" runat="server" Text='<%# Bind("GradePoint") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="GradingExplanation">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("GradingExplanation") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("GradingExplanation") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imgbtnDelete" Width="15px" ImageUrl="~/Sources/images/erase.png"
                                                                    OnClientClick="if (!confirm('Are you Sure to Delete The Item From The List ?')) return false"
                                                                    CommandName="Delete" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
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
        <tr align="center">
            <td>
                <asp:Panel ID="pnlExamInstructions" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Exam Instructions
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtExamInstructions" runat="server" CssClass="InputTxtBox" Height="80px"
                                    TextMode="MultiLine" Width="400px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldExamInstructions" runat="server" ControlToValidate="txtExamInstructions"
                                    ErrorMessage="*" ValidationGroup="SubmitExamDef"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlbuttons" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="center">
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClientClick="if (!confirm('Are you Sure to Submit. ?')) return false"
                                    CssClass="styled-button-1" ValidationGroup="SubmitExamDef" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="styled-button-1" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
