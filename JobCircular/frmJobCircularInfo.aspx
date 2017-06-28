<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmJobCircularInfo.aspx.vb" Inherits="JobCircular_frmJobCircularInfo"
    Title=".:HRM:Input Circular:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlAvailableJobCircular" runat="server" SkinID="pnlInner" Width="800px">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="5" align="left">
                                <div class="widgettitle">
                                    Available Circular</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Available Job Circular
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpAvailableJobCircular" runat="server" AutoPostBack="true"
                                    CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td align="left">
                                <asp:Button ID="btnReCreate" runat="server" CssClass="styled-button-1" Text="Re Publish" />
                            </td>
                            <td align="left">
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
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr id="idTr" runat="server">
                            <td align="center">
                            </td>
                            <td align="center" colspan="4">
                                <asp:Label ID="idLabel" runat="server" BackColor="Red " Font-Bold="true" title=""> </asp:Label>
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
                <asp:Panel ID="pnlJobCircularInfo" runat="server" Width="800px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" colspan="6">
                                <div class="widgettitle">
                                    Define New Circular</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left"style="width:20px">
                            </td>
                            <td align="left" style="width:150px">
                            </td>
                            <td align="left" style="width:200px">
                            </td>
                            <td align="left" style="width:20px">
                            </td>
                            <td align="left" Style="width:150px">
                            </td>
                            <td align="left" style="width:200px">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Job Title
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtJobTitle" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldJobTitle" runat="server" ControlToValidate="txtJobTitle"
                                    ErrorMessage="*" ValidationGroup="InsertJobCircular"></asp:RequiredFieldValidator>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Circular Code
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtCircularCode" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldCircularCode" runat="server" ControlToValidate="txtCircularCode"
                                    ErrorMessage="*" ValidationGroup="InsertJobCircular"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Duty Schedule
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtDutySchedule" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Job Location
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtJobLocation" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldJobLocation" runat="server" ControlToValidate="txtJobLocation"
                                    ErrorMessage="*" ValidationGroup="InsertJobCircular"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Salary &amp; Benefits
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtSalaryAndBenefits" runat="server" CssClass="InputTxtBox" Width="200px"
                                    Height="50px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Organization
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpOrganizations" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="reqFldOrganization" runat="server" ControlToValidate="drpOrganizations"
                                    ErrorMessage="*" ValidationGroup="InsertJobCircular"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Vacancies&nbsp;
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtVacancies" runat="server" CssClass="InputTxtBox" Width="50px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MskEdtVacancies" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="999" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtVacancies" />
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldVacancies" runat="server" ControlToValidate="txtVacancies"
                                    ErrorMessage="*" ValidationGroup="InsertJobCircular"> </asp:RequiredFieldValidator>
                                <cc1:MaskedEditValidator ID="MskEdtValVacancies" runat="server" ControlExtender="MskEdtVacancies"
                                    ControlToValidate="txtVacancies" EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers"
                                    IsValidEmpty="false" MaximumValue="500" MaximumValueMessage="Number must be less than 500"
                                    MinimumValue="0" MinimumValueMessage="Number must be greater than -1" ToolTip="Enter values from 0 to 500"
                                    ValidationGroup="InsertJobCircular">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </cc1:MaskedEditValidator>
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Maximum Applicant
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtMaximumApplicant" runat="server" CssClass="InputTxtBox" Width="50px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MskEdtMaximumApplicant" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="99999" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtMaximumApplicant" />
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldMaximumApplicant" runat="server" ControlToValidate="txtMaximumApplicant"
                                    ErrorMessage="*" ValidationGroup="InsertJobCircular"></asp:RequiredFieldValidator>
                                <cc1:MaskedEditValidator ID="MskEdtValMaximumApplicant" runat="server" ControlExtender="MskEdtMaximumApplicant"
                                    ControlToValidate="txtMaximumApplicant" EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers"
                                    IsValidEmpty="false" MaximumValue="99999" MaximumValueMessage="Number must be less than 99999"
                                    MinimumValue="0" MinimumValueMessage="Number must be greater than -1" ToolTip="Enter values from 0 to 99999"
                                    ValidationGroup="InsertJobCircular">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </cc1:MaskedEditValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Department
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpDepartment" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldDepartment" runat="server" ControlToValidate="drpDepartment"
                                    ErrorMessage="*" ValidationGroup="InsertJobCircular"></asp:RequiredFieldValidator>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Competencies
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtCompetencies" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Job Description
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtJobDescription" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldJobDescription" runat="server" ControlToValidate="txtJobDescription"
                                    ErrorMessage="*" ValidationGroup="InsertJobCircular"></asp:RequiredFieldValidator>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Communication Skill
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtCommunicationSkill" runat="server" CssClass="InputTxtBox" Width="200px"
                                    Height="50px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Job Responsibility
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtJobResponsibility" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldJobResponsibility" runat="server" ControlToValidate="txtJobResponsibility"
                                    ErrorMessage="*" ValidationGroup="InsertJobCircular"></asp:RequiredFieldValidator>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Min Age Limit
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtMinAgeLimit" runat="server" CssClass="InputTxtBox" Width="50px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MskEdtMinAgeLimit" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="99" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtMinAgeLimit" />
                                <cc1:MaskedEditValidator ID="MskEdtValMinAgeLimit" runat="server" ControlExtender="MskEdtMinAgeLimit"
                                    ControlToValidate="txtMinAgeLimit" EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers"
                                    IsValidEmpty="false" MaximumValue="60" MaximumValueMessage="Number must be less than 60"
                                    MinimumValue="20" MinimumValueMessage="Number must be greater than -1" ToolTip="Enter values from 20 to 60"
                                    ValidationGroup="InsertJobCircular">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </cc1:MaskedEditValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Special Skills Required
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtSpecialSkillsRequired" runat="server" CssClass="InputTxtBox"
                                    Height="50px" TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Max Age Limit
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtMaxAgeLimit" runat="server" CssClass="InputTxtBox" Width="50px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MskEdtMaxAgeLimit" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="99" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtMaxAgeLimit" />
                                <cc1:MaskedEditValidator ID="MskEdtValMaxAgeLimit" runat="server" ControlExtender="MskEdtMaxAgeLimit"
                                    ControlToValidate="txtMaxAgeLimit" EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers"
                                    IsValidEmpty="false" MaximumValue="60" MaximumValueMessage="Number must be less than 60"
                                    MinimumValue="20" MinimumValueMessage="Number must be greater than -1" ToolTip="Enter values from 20 to 60"
                                    ValidationGroup="InsertJobCircular">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </cc1:MaskedEditValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Additional Job Requirement
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtAdditionalJobRequiremnt" runat="server" CssClass="InputTxtBox"
                                    Height="50px" TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Reportable To
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtReportableTo" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Educationals Requirement
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtEducationalRequirement" runat="server" CssClass="InputTxtBox"
                                    Width="200px" Height="50px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                How To Apply
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtHowToApply" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Experience Required (In Years)&nbsp;
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtExperienceRequired" runat="server" CssClass="InputTxtBox" Width="50px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldExperienceRequired" runat="server" ControlToValidate="txtExperienceRequired"
                                    ErrorMessage="*" ValidationGroup="InsertJobCircular"></asp:RequiredFieldValidator>
                                <cc1:MaskedEditExtender ID="MskEdtExperienceRequired" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="99" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtExperienceRequired" />
                                <cc1:MaskedEditValidator ID="MskEdtValExperienceRequired" runat="server" ControlExtender="MskEdtExperienceRequired"
                                    ControlToValidate="txtExperienceRequired" EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers"
                                    IsValidEmpty="false" MaximumValue="30" MaximumValueMessage="Number must be less than 30"
                                    MinimumValue="0" MinimumValueMessage="Number must be greater than -1" ToolTip="Enter values from 0 to 20"
                                    ValidationGroup="InsertJobCircular">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </cc1:MaskedEditValidator>
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Company Address
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtCompanyAddress" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Closing Date
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtClosingDate" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtClosingDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtClosingDate">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldClosingDate" runat="server" ControlToValidate="txtClosingDate"
                                    ErrorMessage="*" ValidationGroup="InsertJobCircular"></asp:RequiredFieldValidator>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Terms Of References
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtTermsOfReferences" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Header Note
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtHeaderNote" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Footer Note
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtFooterNote" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Header Image
                            </td>
                            <td align="left">
                                <asp:FileUpload ID="flupHeaderImage" runat="server" CssClass="InputTxtBox" Width="200px" />
                                <asp:HyperLink ID="hpHeaderImage" runat="server" Target="_blank">Image</asp:HyperLink>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Footer Image
                            </td>
                            <td align="left">
                                <asp:FileUpload ID="flupFooterImage" runat="server" CssClass="InputTxtBox" Width="200px" />
                                <asp:HyperLink ID="hpFooterImage" runat="server" Target="_blank">Image</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Middle Image
                            </td>
                            <td align="left">
                                <asp:FileUpload ID="flupMiddleImage" runat="server" CssClass="InputTxtBox" Width="200px" />
                                <asp:HyperLink ID="hpMiddleImage" runat="server" Target="_blank">Image</asp:HyperLink>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Attachment
                            </td>
                            <td align="left">
                                <asp:FileUpload ID="flupAttachment" runat="server" CssClass="InputTxtBox" Width="200px" />
                                <asp:HyperLink ID="hpAttachment" runat="server" Target="_blank">Image</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                            </td>
                            <td align="left">
                                <asp:Button ID="btnInsertCircularInfo" runat="server" CssClass="styled-button-1"
                                    Text="Insert" ValidationGroup="InsertJobCircular" />
                                &nbsp;<asp:Button ID="btnCancelSelection" runat="server" CssClass="styled-button-1"
                                    Text="Cancel" />
                                &nbsp;<asp:Button ID="btnUpdateCircular" runat="server" CssClass="styled-button-1"
                                    Text="Update" />
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
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
