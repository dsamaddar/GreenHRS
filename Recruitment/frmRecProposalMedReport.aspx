<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmRecProposalMedReport.aspx.vb" Inherits="Recruitment_frmRecProposalMedReport"
    Title=".:HRM:Medical Report:." Theme="CommonSkin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Panel ID="pnlInterviewCompleted" runat="server" Width="100%" SkinID="pnlInner">
                    <table width="100%">
                        <tr>
                            <td align="left">
                                <div class="widgettitle">
                                    Proposed Employee</div>
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="max-height: 250px; max-width: 100%; overflow: auto">
                                    <asp:GridView ID="grdInterviewCompletedCandidates" runat="server" AutoGenerateColumns="False"
                                        EmptyDataText="No Data Available" CssClass="mGrid" AllowSorting="True">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" CssClass="linkbtn" runat="server" CausesValidation="False"
                                                        CommandName="Select" Text="Select"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ProposalID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblProposalID" runat="server" Text='<%# Bind("ProposalID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CandidateID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCandidateID" runat="server" Text='<%# Bind("CandidateID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="EntryDate">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("EntryDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CircularID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCircularID" runat="server" Text='<%# Bind("CircularID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Candidate">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblReviewCandidateName" runat="server" Text='<%# Bind("CandidateName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Exp. Joining" SortExpression="ExpectedJoiningDate">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("ExpectedJoiningDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="PreDistrict">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPreDistrict0" runat="server" Text='<%# Bind("PreDistrictName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="PerDistrict">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPerDistrict0" runat="server" Text='<%# Bind("PerDistrictName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="HighestDegree">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblHighestDegree0" runat="server" Text='<%# Bind("HighestDegree") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Major">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMajor0" runat="server" Text='<%# Bind("Major") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="InstitutionName">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInstitutionName0" runat="server" Text='<%# Bind("InstitutionName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="JobTitle">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJobTitle0" runat="server" Text='<%# Bind("JobTitle") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Age">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Age") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Gender">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText=" CV Details " ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkChooseCVDetailsBtn" CssClass="linkbtn" Font-Size="14px" runat="server"
                                                        CausesValidation="False" OnClientClick='<%# Eval("CandidateID","openWindow(""../RecuitmentCVView.aspx?CandidateID={0}"",""Popup"",1000,1100);") %>'
                                                        Text=" View ">
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlGenerateReport" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td style="width: 200px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 200px">
                                <asp:HiddenField ID="hdFldCandidateID" runat="server" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Reference No
                            </td>
                            <td>
                                <asp:TextBox ID="txtReferenceNo" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldRefNo" runat="server" ControlToValidate="txtReferenceNo"
                                    Display="None" ErrorMessage="Required : Ref. No" ValidationGroup="GenerateReport"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldRefNo_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldRefNo" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Appointment Ref. No
                            </td>
                            <td>
                                <asp:TextBox ID="txtAppointmentRefNo" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldAppointmentRefNo" runat="server" ControlToValidate="txtAppointmentRefNo"
                                    Display="None" ErrorMessage="Required : Appointment Ref No" ValidationGroup="GenerateReport"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldAppointmentRefNo_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldAppointmentRefNo" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Select Doctor
                            </td>
                            <td>
                                <asp:DropDownList ID="drpMedOffList" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Appointment Date
                            </td>
                            <td>
                                <asp:TextBox ID="txtAppointmentDate" runat="server" CssClass="InputTxtBox" Width="120px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtAppointmentDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtAppointmentDate">
                                </cc1:CalendarExtender>
                                <asp:CompareValidator ID="cmpValAppointmentDate" runat="server" ControlToValidate="txtAppointmentDate"
                                    ErrorMessage="Invalid Date" Operator="DataTypeCheck" Type="Date" ValidationGroup="GenerateReport">
                                </asp:CompareValidator>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldAppointmentDate" runat="server" ControlToValidate="txtAppointmentDate"
                                    Display="None" ErrorMessage="Required : Appointment Date" ValidationGroup="GenerateReport"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldAppointmentDate_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldAppointmentDate" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
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
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="btnProcessMedToEmp" runat="server" CssClass="styled-button-1" Text="Med. To Emp"
                                    ValidationGroup="GenerateReport" />
                                &nbsp;&nbsp;
                            </td>
                            <td>
                                <asp:Button ID="btnProcessMedToDoc" runat="server" CssClass="styled-button-1" Text="Med. To Doc"
                                    ValidationGroup="GenerateReport" />
                                &nbsp;&nbsp;<asp:Button ID="btnJoiningLetter" runat="server" CssClass="styled-button-1"
                                    Text="Joining Letter" ValidationGroup="GenerateReport" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
