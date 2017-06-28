<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmRecruitmentWindow.aspx.vb" Inherits="Recruitment_frmRecruitmentWindow"
    Title=".:HRM:HR-Assessment:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        window.onload = function() {
            var strCook = document.cookie;
            if (strCook.indexOf("!~") != 0) {
                var intS = strCook.indexOf("!~");
                var intE = strCook.indexOf("~!");
                var strPos = strCook.substring(intS + 2, intE);
                document.getElementById("divIntComPletedCandidates").scrollTop = strPos;
                }
        }
        function SetDivPosition() {
            var intY = document.getElementById("divIntComPletedCandidates").scrollTop;
            document.title = intY;
            document.cookie = "yPos=!~" + intY + "~!";
        }
    </script>

    <script language="JavaScript" type="text/javascript">
        function openWindow(windowURL,windowName,windowWidth,windowHeight) {

        var left = (screen.width/2)-(windowWidth/2);
        var top = (screen.height/2)-(windowHeight/2);

        window.name = 'parentWnd';
        newWindow = window.open(windowURL,windowName,'top='+ top +',left='+ left +',width='+windowWidth+',height='+windowHeight+',toolbar=0,location=no,directories=0, status=0,menuBar=0,scrollBars=1,resizable=1');
        newWindow.focus();
        }

        function  GetCircularID()
        {
             
           var e = document.getElementById('<%= txtCircularID.ClientID %>');
           var strUser = e.Options.value;
           return strUser;
        }
        
        function  GetCandidateID(ClietnID)
        {
        
          // var strUser = document.getElementById(ClietnID);
          // var strValue = strUser.Text;
           return ClietnID;
        }
    </script>

    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlSearchByIntGrade" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" colspan="3">
                                <div class="widgettitle">
                                    Recruitment Window<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                Select Interview Grade
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpApplicantGrade" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
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
                <asp:Panel ID="pnlInterviewCompleted" runat="server" Width="100%" SkinID="pnlInner">
                    <div id="divIntComPletedCandidates" onscroll="SetDivPosition()" style="max-height: 250px;
                        max-width: 100%; overflow: auto">
                        <asp:GridView ID="grdInterviewCompletedCandidates" runat="server" AutoGenerateColumns="False"
                            EmptyDataText="No Data Available" CssClass="mGrid">
                            <Columns>
                                <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" CssClass="linkbtn" runat="server" CausesValidation="False"
                                            CommandName="Select" Text="Select"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="AppliedJobID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAppliedJobID" runat="server" Text='<%# Bind("AppliedJobID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="IntCandidateID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblIntCandidateID" runat="server" Text='<%# Bind("IntCandidateID") %>'></asp:Label>
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
                                <asp:TemplateField HeaderText="CandidateName">
                                    <ItemTemplate>
                                        <asp:Label ID="lblReviewCandidateName" runat="server" Text='<%# Bind("CandidateName") %>'></asp:Label>
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
                                <asp:BoundField DataField="Department" HeaderText="Department" />
                                <asp:BoundField DataField="Branch" HeaderText="Branch" />
                                <asp:BoundField DataField="Observations" HeaderText="Observations" />
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
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlAssessmentInfo" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <asp:LinkButton ID="lnkBtnExamInfo" runat="server" CssClass="linkbtn" OnClientClick='javascript:openWindow("frmShowExamScore.aspx","Popup",900,400);'>Exam Score</asp:LinkButton>
                                <asp:TextBox ID="txtCandidateID" runat="server" Visible="False" Width="20px"></asp:TextBox>
                                <asp:TextBox ID="txtCircularID" runat="server" Visible="False" Width="20px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:LinkButton ID="lnkbtnInterviewAssessment" runat="server" CssClass="linkbtn"
                                    OnClientClick='javascript:openWindow("frmShowInterviewAssessment.aspx","Popup",900,400);'>Interview 
                                Assessment</asp:LinkButton>
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
                            <td class="label">
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
                            <td class="label">
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
                            <td class="label">
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
                            <td class="label">
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
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</cc1:MaskedEditValidator>
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
                                <asp:DropDownList ID="drpEmployeeType" runat="server" CssClass="InputTxtBox" DataSourceID="dsEmployeeType"
                                    DataTextField="EmployeeTypeName" DataValueField="EmployeeTypeID" Width="200px">
                                </asp:DropDownList>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldEmployeeType" runat="server" ControlToValidate="drpEmployeeType"
                                    Display="None" ErrorMessage="Required" ValidationGroup="HRAssessment"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldEmployeeType_ValidatorCalloutExtender" runat="server"
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
                                <cc1:CalendarExtender ID="txtEffectiveDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtEffectiveDate">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldEffectiveDate" runat="server" ControlToValidate="txtEffectiveDate"
                                    Display="None" ErrorMessage="Required" ValidationGroup="HRAssessment"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldEffectiveDate_ValidatorCalloutExtender" runat="server"
                                    Enabled="True" TargetControlID="reqFldEffectiveDate" CloseImageUrl="~/Sources/images/valClose.png"
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
                                <cc1:CalendarExtender ID="txtEffectiveTo_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtEffectiveTo">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldEffectiveTo" runat="server" ControlToValidate="txtEffectiveTo"
                                    Display="None" ErrorMessage="Effective To Required" 
                                    ValidationGroup="HRAssessment"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldEffectiveTo_ValidatorCalloutExtender" runat="server"
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
                                <cc1:ValidatorCalloutExtender ID="reqFldObservations_ValidatorCalloutExtender" runat="server"
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
                                <cc1:ValidatorCalloutExtender ID="reqFldLetterFormat_ValidatorCalloutExtender" runat="server"
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
                                <asp:SqlDataSource ID="dsEmployeeType" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="SELECT EmployeeTypeID, EmployeeTypeName FROM tblEmployeeType WHERE (isActive = 1)">
                                </asp:SqlDataSource>
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
        <tr align="center">
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
     <script language="javascript" type="text/javascript">
        $(document).ready(function(){
            var elem = document.getElementById('<%=grdInterviewCompletedCandidates.ClientID%>');
            $(elem).tablesorter();
         }); 
    </script>
</asp:Content>
