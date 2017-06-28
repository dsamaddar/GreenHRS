<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmIntMandatoryQuestion.aspx.vb" Inherits="InterviewPanel_frmIntMandatoryQuestion"
    Title=".:HRM:Int. Mandatory Question:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
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
                <asp:Panel ID="pnlIntManQuestionMaker" runat="server" Width="700px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" class="label" colspan="3">
                                <div class="widgettitle">
                                    Define Interview Mandatory Question</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                            </td>
                            <td align="left" class="label">
                            </td>
                            <td align="left">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Mandatory Question
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtMandatoryQuestion" runat="server" CssClass="InputTxtBox" Width="300px"
                                    Height="50px" TextMode="MultiLine"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldIntManQuestion" runat="server" ControlToValidate="txtMandatoryQuestion"
                                    Display="None" ErrorMessage="Required" ValidationGroup="MakeIntManQuestion"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldIntManQuestion_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldIntManQuestion" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Question Order
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtQuestionOrder" runat="server" CssClass="InputTxtBox" Width="80px"></asp:TextBox>
                                &nbsp;
                                <cc1:MaskedEditExtender ID="MskEdtQuestionOrder" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="999" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtQuestionOrder" />
                                <cc1:MaskedEditValidator ID="MskEdtValQuestionOrder" runat="server" ControlExtender="MskEdtQuestionOrder"
                                    ControlToValidate="txtQuestionOrder" EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers"
                                    IsValidEmpty="false" MaximumValue="999" MaximumValueMessage=" &lt; 1000" MinimumValue="0"
                                    MinimumValueMessage=" &gt; -1" ToolTip="Enter values from -1 to 999" ValidationGroup="MakeIntManQuestion">
                                </cc1:MaskedEditValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Question Status
                            </td>
                            <td align="left">
                                <asp:CheckBox ID="chkIntManQuestionIsActive" runat="server" CssClass="chkText" Text=" Is Active" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td align="left">
                                <asp:Button ID="btnSubmitQuestion" runat="server" CssClass="styled-button-1" Text="Submit"
                                    ValidationGroup="MakeIntManQuestion" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" Text="Cancel" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td align="left">
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
                &nbsp;
            </td>
            <td>
                <asp:Panel ID="pnlAvailableIntManQuestion" runat="server" Width="700px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:GridView ID="grdAvailableIntManQuestions" runat="server" AutoGenerateColumns="False"
                                    CssClass="mGrid">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                                    Text="Select"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="IntManQuestionID" Visible="false">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("IntManQuestionID") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblIntManQuestionID" runat="server" Text='<%# Bind("IntManQuestionID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Question">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Question") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Question") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="QuestionOrder">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("QuestionOrder") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("QuestionOrder") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="IsActive">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("IsActive") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("IsActive") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                            <td>
                                &nbsp;
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
    </table>
</asp:Content>
