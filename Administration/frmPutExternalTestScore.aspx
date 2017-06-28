<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmPutExternalTestScore.aspx.vb" Inherits="Administration_frmPutExternalTestScore"
    Title=".:HRM:External Test Score:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="left">
            <td width="5%">
                &nbsp;
            </td>
            <td colspan="2" style="width: 90%">
                <div class="widget-title">
                    External Test Score Input<asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </div>
            </td>
            <td width="5%">
                &nbsp;
            </td>
        </tr>
        <tr align="center">
            <td width="5%">
            </td>
            <td width="35%" valign="top">
                <asp:Panel ID="pnlSearchExamTaker" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 100px">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                ID/Name
                            </td>
                            <td>
                                <asp:TextBox ID="txtIDorName" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="styled-button-1" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td width="55%">
                <asp:Panel ID="pnlSearchResult" runat="server" Width="100%" SkinID="pnlInner">
                    <div style="max-height: 200px; max-width: 100%; overflow: auto">
                        <asp:GridView ID="grdSearchResult" runat="server" AutoGenerateColumns="False" CssClass="mGrid"
                            EmptyDataText="No Data Found">
                            <Columns>
                                <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                            Text="Select"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="UniqueUserID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblUniqueUserID" runat="server" Text='<%# Bind("UniqueUserID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="User">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="User Type">
                                    <ItemTemplate>
                                        <asp:Label ID="lblUserType" runat="server" Text='<%# Bind("UserType") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Contact No">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("ContactNo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </td>
            <td width="5%">
            </td>
        </tr>
        <tr align="center">
            <td width="5%">
            </td>
            <td colspan="2">
                <asp:Panel ID="pnlPutTestScore" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldObtainedMarks" runat="server" ControlToValidate="txtObtainedMarks"
                                    Display="None" ErrorMessage="Required : Obtained Marks" ValidationGroup="ExtTestScore"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldObtainedMarks_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldObtainedMarks" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldMarksOutOf" runat="server" ControlToValidate="txtMarksOutOf"
                                    Display="None" ErrorMessage="Required : Marks Out Of" ValidationGroup="ExtTestScore"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldMarksOutOf_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldMarksOutOf" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Test Type
                            </td>
                            <td>
                                <asp:DropDownList ID="drpTestType" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td class="label">
                                Exam Taken On
                            </td>
                            <td>
                                <asp:TextBox ID="txtExamTakenOn" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtExamTakenOn_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtExamTakenOn">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldExamTakenOn" runat="server" ControlToValidate="txtExamTakenOn"
                                    Display="None" ErrorMessage="Required : Exam Taken On" ValidationGroup="ExtTestScore"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldExamTakenOn_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldExamTakenOn" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Obtained marks
                            </td>
                            <td class="label">
                                <asp:TextBox ID="txtObtainedMarks" runat="server" CssClass="InputTxtBox" Width="50px"></asp:TextBox>
                                &nbsp;Out Of
                                <asp:TextBox ID="txtMarksOutOf" runat="server" CssClass="InputTxtBox" Width="50px"></asp:TextBox>
                            </td>
                            <td class="label">
                                Grading
                            </td>
                            <td>
                                <asp:DropDownList ID="drpGrading" runat="server" CssClass="InputTxtBox" Width="200px">
                                    <asp:ListItem>Fail</asp:ListItem>
                                    <asp:ListItem>Close Fail</asp:ListItem>
                                    <asp:ListItem>Satisfactory</asp:ListItem>
                                    <asp:ListItem>Average</asp:ListItem>
                                    <asp:ListItem>Very Good</asp:ListItem>
                                    <asp:ListItem>Excellent
                                    </asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Remarks
                            </td>
                            <td>
                                <asp:TextBox ID="txtRemarks" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                            <td class="label">
                                Attachment
                            </td>
                            <td>
                                <asp:FileUpload ID="flupAttachment" runat="server" />
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldRemarks" runat="server" ControlToValidate="txtRemarks"
                                    Display="None" ErrorMessage="Required : Remarks" ValidationGroup="ExtTestScore"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldRemarks_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldRemarks" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td class="label">
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldGrading" runat="server" ControlToValidate="drpGrading"
                                    Display="None" ErrorMessage="Required : Grading" ValidationGroup="ExtTestScore"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldGrading_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldGrading" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                            </td>
                            <td>
                                <asp:Button ID="btnSubmit" runat="server" CssClass="styled-button-1" Text="Submit"
                                    ValidationGroup="ExtTestScore" />
                                &nbsp;<asp:Button ID="btnUpdate" runat="server" CssClass="styled-button-1" Text="Update"
                                    ValidationGroup="ExtTestScore" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" Text="Cancel" />
                            </td>
                            <td class="label">
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td width="5%">
            </td>
        </tr>
        <tr align="center">
            <td width="5%">
            </td>
            <td colspan="2">
                <asp:Panel ID="pnlTestScoreOfUsers" runat="server" SkinID="pnlInner">
                    <asp:GridView ID="grdTestScoreOfUsers" runat="server" CssClass="mGrid" EmptyDataText="No Test Score Available"
                        AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="ExternalTestScoreID" HeaderText="ExternalTestScoreID"
                                Visible="False" />
                            <asp:BoundField DataField="Topic" HeaderText="Topic" />
                            <asp:BoundField DataField="ExamTakenOn" HeaderText="ExamTakenOn" />
                            <asp:BoundField DataField="Marks" HeaderText="Marks" />
                            <asp:BoundField DataField="Grading" HeaderText="Grading" />
                            <asp:BoundField DataField="Remarks" HeaderText="Remarks" />
                            <asp:TemplateField HeaderText="Attachment">
                                <ItemTemplate>
                                    <asp:HyperLink ID="hpDocument" runat="server" CssClass="linkbtn" NavigateUrl='<%#"~/Attachments/"+ Eval("Attachment") %>'
                                        Target="_blank">View</asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="EntryBy" HeaderText="EntryBy" />
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </td>
            <td width="5%">
            </td>
        </tr>
    </table>
</asp:Content>
