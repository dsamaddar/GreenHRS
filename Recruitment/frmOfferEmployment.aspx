<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmOfferEmployment.aspx.vb" Inherits="Recruitment_frmOfferEmployment"
    Title=".:HRM:Offer Employment:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td style="margin-left: 80px">
                <asp:Panel ID="pnlOfferEmployment" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <div class="widget-title">
                                    Short Listed Candidate<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="grdShortListedCandidate" runat="server" AutoGenerateColumns="False"
                                    CssClass="mGrid" EmptyDataText="No Candidate Available">
                                    <Columns>
                                        <asp:CommandField HeaderText="Select" ShowSelectButton="True" />
                                        <asp:TemplateField HeaderText="IntCandidateID" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblIntCandidateID" runat="server" Text='<%# Bind("IntCandidateID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="CircularID" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCircularID" runat="server" Text='<%# Bind("CircularID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="CandidateID" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCandidateID" runat="server" Text='<%# Bind("CandidateID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Candidate">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCandidate" runat="server" Text='<%# Bind("Candidate") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="RecruitmentType">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRecruitmentType" runat="server" Text='<%# Bind("RecruitmentType") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Location">
                                            <ItemTemplate>
                                                <asp:Label ID="lblULCBranchName" runat="server" Text='<%# Bind("ULCBranchName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlHRUseOnly" runat="server" SkinID="pnlInner" Width="100%">
                    <table width="100%">
                        <tr align="left">
                            <td align="left" colspan="6">
                                <div class="widgettitle">
                                    HR Offer</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 300px">
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Department
                            </td>
                            <td>
                                <asp:DropDownList ID="drpRecommendedDepartment" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldDepartment" runat="server" ControlToValidate="drpRecommendedDepartment"
                                    Display="None" ErrorMessage="Required" ValidationGroup="HRAssessment"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldDepartment_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldDepartment" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td class="label">
                            </td>
                            <td class="label">
                                Probation/Contractual Period (In Months)
                            </td>
                            <td>
                                <asp:TextBox ID="txtPeriodInMonths" runat="server" CssClass="InputTxtBox" Width="120px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldPeriodInMonths" runat="server" ControlToValidate="txtPeriodInMonths"
                                    ErrorMessage="Period In Month Required" ValidationGroup="HRAssessment" Display="None"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldPeriodInMonths_ValidatorCalloutExtender"
                                    runat="server" Enabled="True" TargetControlID="reqFldPeriodInMonths" CloseImageUrl="~/Sources/images/valClose.png"
                                    CssClass="customCalloutStyle" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Position
                            </td>
                            <td>
                                <asp:DropDownList ID="drpRecommendedPosition" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="reqFldPosition" runat="server" ControlToValidate="drpRecommendedPosition"
                                    Display="None" ErrorMessage="Required" ValidationGroup="HRAssessment"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldPosition_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldPosition" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Location
                            </td>
                            <td>
                                <asp:DropDownList ID="drpRecommendedLocation" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldLocation" runat="server" ControlToValidate="drpRecommendedLocation"
                                    ErrorMessage="*" ValidationGroup="HRAssessment"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldLocation_ValidatorCalloutExtender" runat="server"
                                    Enabled="True" TargetControlID="reqFldLocation" CloseImageUrl="~/Sources/images/valClose.png"
                                    CssClass="customCalloutStyle" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Expected Joining Date
                            </td>
                            <td>
                                <asp:TextBox ID="txtExpectedJoiningDate" runat="server" CssClass="InputTxtBox" Width="120px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtExpectedJoiningDate_CalendarExtender" runat="server"
                                    Enabled="True" TargetControlID="txtExpectedJoiningDate">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldExpectedJoiningDate" runat="server" ControlToValidate="txtExpectedJoiningDate"
                                    Display="None" ErrorMessage="Required" ValidationGroup="HRAssessment"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldExpectedJoiningDate_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldExpectedJoiningDate" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Salary
                            </td>
                            <td>
                                <asp:TextBox ID="txtSalary" runat="server" CssClass="InputTxtBox" Width="120px">0</asp:TextBox>
                                <cc1:MaskedEditExtender ID="MskEdtSalary" runat="server" AcceptNegative="Left" ErrorTooltipEnabled="True"
                                    InputDirection="RightToLeft" Mask="999999.99" MaskType="Number" MessageValidatorTip="true"
                                    TargetControlID="txtSalary" />
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldSalary" runat="server" ControlToValidate="txtSalary"
                                    Display="None" ErrorMessage="Salary Required" ValidationGroup="HRAssessment"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldSalary_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldSalary" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                                <cc1:MaskedEditValidator ID="MskEdtValSalary" runat="server" ControlExtender="MskEdtSalary"
                                    ControlToValidate="txtSalary" EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers"
                                    IsValidEmpty="false" MaximumValue="1000000" MaximumValueMessage=" &lt; 11" MinimumValue="0"
                                    MinimumValueMessage=" &gt; -1" ToolTip="Enter values from 0 to 999999.99" ValidationGroup="HRAssessment">
                                &nbsp;
                                </cc1:MaskedEditValidator>
                                <cc1:ValidatorCalloutExtender ID="MskEdtValSalary_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="MskEdtValSalary" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label">
                            </td>
                            <td class="label">
                                Employee Type
                            </td>
                            <td>
                                <asp:DropDownList ID="drpEmployeeType" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldEmployeeType" runat="server" ControlToValidate="drpEmployeeType"
                                    Display="None" ErrorMessage="Required" ValidationGroup="HRAssessment"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldEmployeeType_ValidatorCalloutExtender0" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldEmployeeType" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td class="label">
                            </td>
                            <td class="label">
                                Effective From
                            </td>
                            <td class="label">
                                <asp:TextBox ID="txtEffectiveDate" runat="server" CssClass="InputTxtBox" Width="120px"
                                    AutoPostBack="True"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtEffectiveDate_CalendarExtender0" runat="server" Enabled="True"
                                    TargetControlID="txtEffectiveDate">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldEffectiveDate" runat="server" ControlToValidate="txtEffectiveDate"
                                    Display="None" ErrorMessage="Required" ValidationGroup="HRAssessment"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldEffectiveDate_ValidatorCalloutExtender0"
                                    runat="server" Enabled="True" TargetControlID="reqFldEffectiveDate" CloseImageUrl="~/Sources/images/valClose.png"
                                    CssClass="customCalloutStyle" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                            </td>
                            <td class="label">
                                Effective To
                            </td>
                            <td>
                                <asp:TextBox ID="txtEffectiveTo" runat="server" CssClass="InputTxtBox" ValidationGroup="NMP"
                                    Width="120px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtEffectiveTo_CalendarExtender0" runat="server" Enabled="True"
                                    TargetControlID="txtEffectiveTo">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldEffectiveTo" runat="server" ControlToValidate="txtEffectiveTo"
                                    Display="None" ErrorMessage="Effective To Required" ValidationGroup="HRAssessment"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldEffectiveTo_ValidatorCalloutExtender0" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldEffectiveTo" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
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
                                    TextMode="MultiLine" Width="300px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldObservations" runat="server" ControlToValidate="txtRemarks"
                                    Display="None" ErrorMessage="Required" ValidationGroup="HRAssessment"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldObservations_ValidatorCalloutExtender0" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldObservations" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td class="label">
                            </td>
                            <td class="label">
                                Appointment Letter Format
                            </td>
                            <td class="label">
                                <asp:DropDownList ID="drpAppointLetterFormat" runat="server" AutoPostBack="True"
                                    CssClass="InputTxtBox" Width="200px">
                                    <asp:ListItem Value="AppointmentContract.rpt">Contractual</asp:ListItem>
                                    <asp:ListItem Value="AppointmentProbationary.rpt">Probation</asp:ListItem>
                                    <asp:ListItem Value="TraineeWithoutPayment.rpt">Intern With Out Payment</asp:ListItem>
                                    <asp:ListItem Value="TraineeWithPayment.rpt">Intern With Payment</asp:ListItem>
                                    <asp:ListItem Value="AppointmentPermanent.rpt">Permanent</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldLetterFormat" runat="server" ControlToValidate="drpAppointLetterFormat"
                                    Display="None" ErrorMessage="Required" ValidationGroup="HRAssessment"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldLetterFormat_ValidatorCalloutExtender0" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldLetterFormat" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Select Status
                            </td>
                            <td>
                                <asp:DropDownList ID="drpExChangeStatus" runat="server" CssClass="InputTxtBox" Width="200px">
                                    <asp:ListItem>N\A</asp:ListItem>
                                    <asp:ListItem>Reviewed</asp:ListItem>
                                    <asp:ListItem>Rejected</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td>
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
                                <asp:Button ID="btnHROffer" runat="server" CssClass="styled-button-1" OnClientClick="if (!confirm('Are you Sure to Make Recruitment ?')) return false"
                                    Text="HR Offer" ValidationGroup="HRAssessment" />
                                &nbsp;<asp:Button ID="btnChangeStatus" runat="server" CssClass="styled-button-1"
                                    Text="Change Status" />
                                &nbsp;<asp:Button ID="btnCancelSelection" runat="server" CssClass="styled-button-1"
                                    Text="Cancel" />
                            </td>
                            <td>
                            </td>
                            <td>
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
