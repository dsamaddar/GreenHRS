<%@ Page Language="VB" Theme="CommonSkin"  MasterPageFile="~/EmployeeServices.master" AutoEventWireup="false" CodeFile="frmTrainingInfo.aspx.vb" Inherits="Training_frmTrainingInfo" title=".:HRM:Training Info:." %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    
    <table style="width:100%;">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center" >
            <td>
                &nbsp;</td>
            <td>
                <asp:Panel ID="pnlTrainingInfo" runat="server" Width="700px" SkinID="pnlInner" >
                    <table style="width:100%;">
                        <tr align="center" >
                            <td align="left" class="label" style="width:20px;" >
                                &nbsp;</td>
                            <td  align="left" class="label" >
                                &nbsp;</td>
                            <td  align="left" >
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr align="center">
                            <td align="left" class="label" style="width:20px;">
                                &nbsp;</td>
                            <td align="left" class="label">
                                Training Details<span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtTrainingDetails" runat="server" 
                                    class="validate[required,custom[integer],min[0]]" CssClass="InputTxtBox" 
                                    Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldTrainingDetails" runat="server" 
                                    ControlToValidate="txtTrainingDetails" Display="None" ErrorMessage="Required" 
                                    ValidationGroup="AddTraining"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldTrainingDetails_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldTrainingDetails" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr align="center">
                            <td align="left" class="label" >
                                &nbsp;</td>
                            <td align="left" class="label">
                                <b>Training Subject</b></td>
                            <td align="left">
                                <asp:DropDownList ID="drpAvailableTrngSubject" runat="server" 
                                    CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr align="center">
                            <td align="left"  class="label" >
                                &nbsp;</td>
                            <td align="left" class="label">
                                <b>Training Type</b></td>
                            <td align="left">
                                <asp:DropDownList ID="drpAvailableTrainingType" runat="server" 
                                    CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr align="center">
                            <td align="left" class="label" >
                                &nbsp;</td>
                            <td align="left" class="label">
                                <b>Course Level</b></td>
                            <td align="left">
                                <asp:DropDownList ID="drpAvailableCourseLevel" runat="server" 
                                    CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr align="center">
                            <td align="left" class="label" >
                                &nbsp;</td>
                            <td align="left" class="label" >
                                Training Initiated By</td>
                            <td align="left">
                                <asp:DropDownList ID="drpTrainingInitiatedBy" runat="server" 
                                    CssClass="InputTxtBox" Width="200px">
                                    <asp:ListItem>Institution Offered</asp:ListItem>
                                    <asp:ListItem>Regulatory Body</asp:ListItem>
                                    <asp:ListItem>Human Resource Department</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr align="center">
                            <td align="left" class="label" >
                                &nbsp;</td>
                            <td align="left"  class="label" >
                                Course Duration<span class="RequiredLabel">*</span></td>
                            <td align="left" class="label">
                                <asp:TextBox ID="txtCourseDuration" runat="server" CssClass="InputTxtBox" 
                                    Width="50px"></asp:TextBox>
                                &nbsp;(hrs.)&nbsp;<asp:RequiredFieldValidator ID="reqFldCourseDuration" runat="server" 
                                    ControlToValidate="txtCourseDuration" ErrorMessage="Required" 
                                    ValidationGroup="AddTraining" Display="None"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldCourseDuration_ValidatorCalloutExtender" 
                                    runat="server" Enabled="True" TargetControlID="reqFldCourseDuration" 
                                    CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                                &nbsp;<asp:RegularExpressionValidator ID="regExpCourseDuration" runat="server" 
                                    ControlToValidate="txtCourseDuration" ErrorMessage="Numeric" 
                                    ValidationExpression="^[-+]?[0-9]*\.?[0-9]+$" ValidationGroup="AddTraining"></asp:RegularExpressionValidator>
&nbsp;</td>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr align="center">
                            <td align="left"  class="label" >
                                &nbsp;</td>
                            <td align="left" class="label">
                                Duration<span class="RequiredLabel">*</span></td>
                            <td align="left" class="label">
                                <asp:TextBox ID="txtDuration" runat="server" CssClass="InputTxtBox" 
                                    Width="50px"></asp:TextBox>
                                &nbsp;(Weeks.)&nbsp;<asp:RequiredFieldValidator ID="reqFldDuration" runat="server" 
                                    ControlToValidate="txtDuration" ErrorMessage="Required" 
                                    ValidationGroup="AddTraining" Display="None"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldDuration_ValidatorCalloutExtender" 
                                    runat="server" Enabled="True" TargetControlID="reqFldDuration" 
                                    CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                                &nbsp;
                                <asp:RegularExpressionValidator ID="regExpDuration" runat="server" 
                                    ControlToValidate="txtDuration" ErrorMessage="Numeric" 
                                    ValidationExpression="^[-+]?[0-9]*\.?[0-9]+$" ValidationGroup="AddTraining"></asp:RegularExpressionValidator>
                                &nbsp;</td>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr align="center">
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                Classes Starts On<span class="RequiredLabel">*</span></td>
                            <td align="left">
                                <asp:TextBox ID="txtClassesStartsOn" runat="server" 
                                    CssClass="InputTxtBox" Width="150px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtClassesStartsOn_CalendarExtender" 
                                    runat="server" Enabled="True" TargetControlID="txtClassesStartsOn">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldClassesStartsOn" 
                                    runat="server" ControlToValidate="txtClassesStartsOn" ErrorMessage="Required" 
                                    ValidationGroup="AddTraining" Display="None"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldClassesStartsOn_ValidatorCalloutExtender" 
                                    runat="server" Enabled="True" TargetControlID="reqFldClassesStartsOn" 
                                    CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr align="center">
                            <td align="left" class="label" >
                                &nbsp;</td>
                            <td align="left" class="label">
                                Last Date Of Registration<span class="RequiredLabel">*</span></td>
                            <td align="left">
                                <asp:TextBox ID="txtLastDateOfRegistration" runat="server" 
                                    CssClass="InputTxtBox" Width="150px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtLastDateOfRegistration_CalendarExtender" 
                                    runat="server" Enabled="True" TargetControlID="txtLastDateOfRegistration">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldLastDateOfRegistration" runat="server" 
                                    ControlToValidate="txtLastDateOfRegistration" ErrorMessage="Required" 
                                    ValidationGroup="AddTraining" Display="None"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldLastDateOfRegistration_ValidatorCalloutExtender" 
                                    runat="server" Enabled="True" 
                                    TargetControlID="reqFldLastDateOfRegistration" CssClass="customCalloutStyle" 
                                    CloseImageUrl="~/Sources/images/valClose.png" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr align="center">
                            <td align="left" class="label" >
                                &nbsp;</td>
                            <td align="left" class="label">
                                Class Schedule<span class="RequiredLabel">*</span></td>
                            <td align="left">
                                <asp:TextBox ID="txtClassSchedule" runat="server" 
                                    CssClass="InputTxtBox" Height="50px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldClassSchedule" runat="server" 
                                    ControlToValidate="txtClassSchedule" Display="None" ErrorMessage="Required" 
                                    ValidationGroup="AddTraining"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldClassSchedule_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldClassSchedule" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr align="center">
                            <td align="left" class="label" >
                                &nbsp;</td>
                            <td align="left" class="label">
                                Highlights Of The program</td>
                            <td align="left">
                                <asp:TextBox ID="txtHighLightsOfTheProgram" runat="server" CssClass="InputTxtBox" 
                                    Height="50px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr align="center">
                            <td align="left" class="label" >
                                &nbsp;</td>
                            <td align="left" class="label">
                                Course Outline</td>
                            <td align="left">
                                <asp:TextBox ID="txtCourseOutLine" runat="server" CssClass="InputTxtBox" 
                                    Height="50px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr align="center">
                            <td align="left" class="label" >
                                &nbsp;</td>
                            <td align="left" class="label">
                                Expected Benefits</td>
                            <td align="left">
                                <asp:TextBox ID="txtExpectedBenefits" runat="server" CssClass="InputTxtBox" 
                                    Height="50px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr align="center">
                            <td align="left" class="label" >
                                &nbsp;</td>
                            <td align="left" class="label">
                                How To Apply</td>
                            <td align="left">
                                <asp:TextBox ID="txtHowToApply" runat="server" CssClass="InputTxtBox" 
                                    Width="300px" Height="50px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr align="center">
                            <td align="left" class="label" >
                                &nbsp;</td>
                            <td align="left" class="label">
                                Fees Per Attendees (BDT)<span class="RequiredLabel">*</span></td>
                            <td align="left">
                                <asp:TextBox ID="txtFees" runat="server" CssClass="InputTxtBox" 
                                    Width="150px"></asp:TextBox>
                                &nbsp;&nbsp;<asp:RequiredFieldValidator ID="reqFldFees" runat="server" 
                                    ControlToValidate="txtFees" Display="None" ErrorMessage="Required" 
                                    ValidationGroup="AddTraining"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldFees_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldFees" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                                <asp:RegularExpressionValidator ID="regExpValFees" runat="server" 
                                    ControlToValidate="txtFees" ErrorMessage="Numeric" 
                                    ValidationExpression="^[-+]?[0-9]*\.?[0-9]+$" ValidationGroup="AddTraining"></asp:RegularExpressionValidator>
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr align="center">
                            <td align="left" class="label" >
                                &nbsp;</td>
                            <td align="left" class="label">
                                Resource Person<span class="RequiredLabel">*</span></td>
                            <td align="left">
                                <asp:TextBox ID="txtResourcePerson" runat="server" 
                                    CssClass="InputTxtBox" Width="300px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldResourcePerson" runat="server" 
                                    ControlToValidate="txtResourcePerson" Display="None" ErrorMessage="Required" 
                                    ValidationGroup="AddTraining"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldResourcePerson_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldResourcePerson" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr align="center">
                            <td align="left" class="label" >
                                &nbsp;</td>
                            <td align="left" class="label">
                                Resource Person&#39;s Profile</td>
                            <td align="left">
                                <asp:TextBox ID="txtResourcePersonsProfile" runat="server" 
                                    CssClass="InputTxtBox" Height="50px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr align="center">
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                Organized By<span class="RequiredLabel">*</span></td>
                            <td align="left">
                                <asp:DropDownList ID="drpOrganizedBy" runat="server" CssClass="InputTxtBox" 
                                    Width="300px">
                                </asp:DropDownList>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldOrganizedBy" runat="server" 
                                    ControlToValidate="drpOrganizedBy" Display="None" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldOrganizedBy_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldOrganizedBy" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr align="center">
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                <asp:Button ID="btnAddTraining" runat="server" CssClass="styled-button-1" 
                                    Text="ADD" ValidationGroup="AddTraining" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" 
                                    Text="Cancel" />
                            </td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

