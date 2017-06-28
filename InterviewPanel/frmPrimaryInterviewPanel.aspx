<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmPrimaryInterviewPanel.aspx.vb" Inherits="InterviewPanel_frmPrimaryInterviewPanel"
    Title=".:HRM:Primary Interview Panel:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .modalBackground
        {
            background-color: ButtonHighlight;
            filter: alpha(opacity=60);
            opacity: 1.00;
        }
        .modalPopup
        {
            background-color: #FFFFFF;
            width: 300px;
            border: 3px solid #0DA9D0;
            border-radius: 12px;
            padding: 0;
        }
        .modalPopup .header
        {
            background-color: #2FBDF1;
            height: 30px;
            color: White;
            line-height: 30px;
            text-align: center;
            font-weight: bold;
            border-top-left-radius: 6px;
            border-top-right-radius: 6px;
        }
        .modalPopup .body
        {
            min-height: 50px;
            line-height: 30px;
            text-align: center;
            font-weight: bold;
        }
        .modalPopup .footer
        {
            padding: 6px;
        }
        .modalPopup .yes, .modalPopup .no
        {
            height: 23px;
            color: White;
            line-height: 23px;
            text-align: center;
            font-weight: bold;
            cursor: pointer;
            border-radius: 4px;
        }
        .modalPopup .yes
        {
            background-color: #2FBDF1;
            border: 1px solid #0DA9D0;
        }
        .modalPopup .no
        {
            background-color: #9F9F9F;
            border: 1px solid #5C5C5C;
        }
    </style>
    <%--<asp:TemplateField HeaderText="SL.No.">
                                                <ItemTemplate>
                                                    <b>
                                                        <%#CType(Container, GridViewRow).RowIndex + 1%></b>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="JavaScript" type="text/javascript">
    function openWindow(windowURL,windowName,windowWidth,windowHeight) {
        var left = (screen.width/2)-(windowWidth/2);
        var top = (screen.height/2)-(windowHeight/2);
        window.name = 'parentWnd';
        newWindow = window.open(windowURL,windowName,'top='+ top +',left='+ left +',width='+windowWidth+',height='+windowHeight+',toolbar=0,location=no,directories=0, status=0,menuBar=0,scrollBars=1,resizable=1');
        newWindow.focus();
    }
      window.onload = function(){
        var strCook = document.cookie;
        if(strCook.indexOf("!~")!=0){
          var intS = strCook.indexOf("!~");
          var intE = strCook.indexOf("~!");
          var strPos = strCook.substring(intS+2,intE);
          document.getElementById("divgrd").scrollTop = strPos;
        }
      }
      function SetDivPosition(){
        var intY = document.getElementById("divgrd").scrollTop;
        document.title = intY;
        document.cookie = "yPos=!~" + intY + "~!";
      }
      
      window.scrollBy(100,100);
    </script>

    <%-- <div id="modal_dialog_location" style="display: no">--%>
    <table style="width: 100%;">
        <tr align="center">
            <td align="left" style="width: 70%">
                <asp:Panel ID="pnlInterviewCandidate" runat="server" SkinID="pnlInner" Width="100%">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left">
                                <div class="widgettitle">
                                    Interview Panel<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="divgrd" onscroll="SetDivPosition()" style="max-height: 150px; max-width: 100%;
                                    overflow: auto">
                                    <asp:GridView ID="grdInterviewCandidate" runat="server" AutoGenerateColumns="False"
                                        EmptyDataText="No Information Available" CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" CssClass="linkbtn" runat="server" CausesValidation="False"
                                                        CommandName="Select" Text="Select"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="IntCandidateID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIntCandidateID" runat="server" Text='<%# Bind("IntCandidateID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CandidateID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCandidateID" runat="server" Text='<%# Bind("CandidateID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="CandidateName" HeaderText="Candidate" />
                                            <asp:TemplateField HeaderText="IntTeamID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIntTeamID" runat="server" Text='<%# Bind("IntTeamID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="IntTeamName" HeaderText="Team" Visible="False" />
                                            <asp:BoundField DataField="InterviewDate" HeaderText="Interview Date" />
                                            <asp:TemplateField HeaderText="Int.Count">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkbtnPending" runat="server" CausesValidation="False" CssClass="linkbtn"
                                                        Font-Size="14px" OnClientClick='<%# Eval("CandidateID","openWindow(""../frmIntAssessmentInfo.aspx?CandidateID={0}"",""Popup"",1000,1100);") %>'
                                                        Text='<%# Bind("IntCount") %>'>
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText=" CV Details " ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkChooseCVDetailsBtn" runat="server" CausesValidation="False"
                                                        CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("CandidateID","openWindow(""../RecuitmentCVView.aspx?CandidateID={0}"",""Popup"",1000,1100);") %>'
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
        <tr align="center">
            <td style="margin-left: 40px" colspan="2">
                <asp:Panel ID="pnlMandatoryQuestions" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left">
                                <div class="widgettitle">
                                    Mandatory Interview Questions</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="max-height: 100%; max-width: 100%; overflow: auto">
                                    <asp:GridView ID="grdMandatoryIntQuestions" runat="server" AutoGenerateColumns="False"
                                        CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Select">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkIntManQuestion" runat="server" AutoPostBack="True" OnCheckedChanged="chkIntManQuestion_CheckedChanged" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:TemplateField HeaderText="SL.No.">
                                                <ItemTemplate>
                                                    <b>
                                                        <%#CType(Container, GridViewRow).RowIndex + 1%></b>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="IntManQuestionID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIntManQuestionID" runat="server" Text='<%# Bind("IntManQuestionID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText=" Question ">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Question") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText=" Reply From Candidate ">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtQuesAnswer" CssClass="InputTxtBox" runat="server" Width="300px"></asp:TextBox>
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
        <tr align="center">
            <td style="margin-left: 40px" colspan="2">
                <asp:Panel ID="pnlSuitableFor" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="4">
                                <div class="widget-title">
                                    Selection Panel</div>
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
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnSelectSuitableFor" runat="server" CssClass="styled-button-1" Text="Select Suitable For"
                                    Width="200px" />
                            </td>
                            <td>
                                <asp:CheckBox ID="chkAvailableAnyWhere" runat="server" AutoPostBack="True" CssClass="chkText"
                                    Text="Available Anywhere In Bangladesh" />
                            </td>
                            <td>
                                <asp:Button ID="btnSelectRecommLocation" runat="server" CssClass="styled-button-1"
                                    Text="Select Location" Width="200px" />
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
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td style="margin-left: 40px" colspan="2">
                <asp:Panel ID="pnlInterviewerReview" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="4">
                                <div class="widget-title">
                                    Interviewer Panel</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Interviewer
                            </td>
                            <td class="label">
                                Grading
                            </td>
                            <td class="label">
                                Remarks
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpInterviewer" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpGrading" runat="server" CssClass="InputTxtBox" Width="80px">
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="txtInterviewerRemarks" runat="server" Width="350px" CssClass="InputTxtBox"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldInterviewer" runat="server" ControlToValidate="drpInterviewer"
                                    Display="None" ErrorMessage="Required: Select Interviewer" meta:resourceKey="reqFldMobileIMEINoResource1"
                                    ValidationGroup="AddReview"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldInterviewer_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldInterviewer" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                <asp:Button ID="btnAddReview" runat="server" CssClass="styled-button-1" Text="ADD"
                                    ValidationGroup="AddReview" />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldReview" runat="server" ControlToValidate="txtInterviewerRemarks"
                                    Display="None" ErrorMessage="Required: Interviewer Remarks" meta:resourceKey="reqFldMobileIMEINoResource1"
                                    ValidationGroup="AddReview"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldReview_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldReview" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td colspan="3">
                                <asp:GridView ID="grdInterviewerReview" runat="server" AutoGenerateColumns="False"
                                    CssClass="mGrid">
                                    <Columns>
                                        <asp:TemplateField HeaderText="EmployeeID" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEmployeeID" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Interviewer">
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Interviewer") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Grade">
                                            <ItemTemplate>
                                                <asp:Label ID="lblGrade" runat="server" Text='<%# Bind("Grade") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remarks">
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete">
                                            <ItemTemplate>
                                                <asp:ImageButton Width="20" ID="imgDelete" CommandName="Delete" runat="server" OnClientClick="return confirm('Are You Sure You Want to Delete?')"
                                                    ImageUrl="~/img/delete.jpg" CausesValidation="False" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td style="margin-left: 40px" colspan="2">
                <asp:Panel ID="pnlFinalAssessment" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="4">
                                <div class="widget-title">
                                    Primary Assessment</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td class="label">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Suitable Position
                            </td>
                            <td>
                                <asp:DropDownList ID="drpRecommendedPosition" runat="server" 
                                    CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td class="label">
                                Select Panel</td>
                            <td>
                                <asp:DropDownList ID="drpAvailableIntTeamList" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td class="label">
                                Interview Date</td>
                            <td>
                                <asp:TextBox ID="txtInterviewDate" runat="server" CssClass="InputTxtBox" Width="120px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtInterviewDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtInterviewDate">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:DropDownList ID="drpHour" runat="server" CssClass="InputTxtBox" Width="40px">
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;<asp:DropDownList ID="drpMin" runat="server" CssClass="InputTxtBox" Width="50px">
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                    <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                    <asp:ListItem Text="40" Value="40"></asp:ListItem>
                                    <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;<asp:DropDownList ID="drpAMPM" runat="server" CssClass="InputTxtBox" Width="50px">
                                    <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                                    <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldInterviewDate" runat="server" ControlToValidate="txtInterviewDate"
                                    Display="None" ErrorMessage="Required: Interview Date" meta:resourceKey="reqFldMobileIMEINoResource1"
                                    ValidationGroup="ApplicantAssessment"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldInterviewDate_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldInterviewDate" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnAcceptCandidate" runat="server" CssClass="styled-button-1" OnClientClick="if (!confirm('Are you Sure to Make Assessment ?')) return false"
                                    Text="ACCEPT" ValidationGroup="ApplicantAssessment" />
                                &nbsp;<asp:Button ID="btnRejectCV" runat="server" CssClass="styled-button-1" Text="REJECT" />
                            </td>
                            <td>
                                &nbsp;<asp:Button ID="btnCancelSelection" runat="server" CssClass="styled-button-1"
                                    Text="Refresh Window" />
                                <asp:Button ID="btnPanelInterview" runat="server" CssClass="styled-button-1" Text="PANEL INTERVIEW"
                                    Visible="False" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td colspan="2">
                <asp:Panel ID="pnlIntApplicantAssessment" runat="server" SkinID="pnlInner" Width="100%"
                    Visible="False">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" colspan="5">
                                <div class="widgettitle">
                                    Interview Assessment</div>
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
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Applicant&#39;s Grade
                            </td>
                            <td>
                                <asp:DropDownList ID="drpApplicantGrade" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td class="label">
                                Suitable Department
                            </td>
                            <td>
                                <asp:DropDownList ID="drpRecommendedDepartment" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td class="label" align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td class="label" align="left">
                                Recommended Location
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpRecommendedLocation" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="style2">
                                Observation
                            </td>
                            <td>
                                <asp:TextBox ID="txtObservation" runat="server" CssClass="InputTxtBox" Width="200px"
                                    Height="50px" TextMode="MultiLine">.</asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldObservations" runat="server" ControlToValidate="txtObservation"
                                    ErrorMessage="*" ValidationGroup="ApplicantAssessment"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Obtained Marks
                            </td>
                            <td class="label">
                                <asp:TextBox ID="txtMarksObtained" runat="server" CssClass="InputTxtBox" Width="60px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MskEdtMarksObtained" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="99.99" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtMarksObtained" />
                                &nbsp;Out Of&nbsp;<asp:TextBox ID="txtMarksOutOf" runat="server" CssClass="InputTxtBox"
                                    Width="60px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MskEdtMarksOutOf" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="99.99" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtMarksOutOf" />
                            </td>
                            <td class="label">
                            </td>
                            <td class="label">
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
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Panel ID="pnlSuitableForList" runat="server" CssClass="modalBackground" Width="650px"
                    SkinID="pnlInner">
                    <table width="100%">
                        <tr>
                            <td>
                                <div class="widgettitle">
                                    Candidate Suitable For</div>
                            </td>
                            <td align="right">
                                <asp:ImageButton ID="imgBtnCloseSuitableFor" runat="server" ImageUrl="~/Sources/Icons/erase.png" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:CheckBoxList ID="chkLstSuitForRecruitment" runat="server" CssClass="mGrid" RepeatColumns="4"
                                    RepeatDirection="Horizontal">
                                </asp:CheckBoxList>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <cc1:ModalPopupExtender ID="mdpopSuitableFor" runat="server" PopupControlID="pnlSuitableForList"
                    OkControlID="imgBtnCloseSuitableFor" TargetControlID="btnSelectSuitableFor">
                </cc1:ModalPopupExtender>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Panel ID="pnlCanRejection" runat="server" SkinID="pnlInner" Width="400px" CssClass="modalBackground"
                    Style="display: none">
                    <table width="100%">
                        <tr>
                            <td colspan="2">
                                <div class="widgettitle">
                                    Candidate Rejection</div>
                            </td>
                            <td align="right">
                                <asp:ImageButton ID="imgBtnCloseCandidateRejection" runat="server" ImageUrl="~/Sources/Icons/erase.png" />
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label">
                                Rejection Remarks
                            </td>
                            <td>
                                <asp:TextBox ID="txtRejectionRemarks" runat="server" Width="200px" CssClass="InputTxtBox"
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:RequiredFieldValidator ID="reqFldRejectionRemarks" runat="server" ControlToValidate="txtRejectionRemarks"
                                    Display="None" ErrorMessage="Required: Rejection Remarks" ValidationGroup="Rejection"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldRejectionRemarks_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    TargetControlID="reqFldRejectionRemarks" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="3" align="center">
                                <asp:Button ID="btnRejectCandidate" runat="server" Text="Reject" CssClass="styled-button-1"
                                    ValidationGroup="Rejection" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <cc1:ModalPopupExtender ID="modpopCanRejection" runat="server" PopupControlID="pnlCanRejection"
                    OkControlID="imgBtnCloseCandidateRejection" TargetControlID="btnRejectCV">
                </cc1:ModalPopupExtender>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Panel ID="pnlModalLocation" runat="server" CssClass="modalBackground" Width="450px"
                    SkinID="pnlInner">
                    <table width="100%">
                        <tr>
                            <td>
                                <div class="widgettitle">
                                    Candidate Suitable Location</div>
                            </td>
                            <td align="right">
                                <asp:ImageButton ID="imgBtnCloseLocation" runat="server" ImageUrl="~/Sources/Icons/erase.png" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:UpdatePanel ID="udpLocations" runat="server">
                                    <ContentTemplate>
                                        <table width="100%">
                                            <tr align="left">
                                                <td style="width: 40%">
                                                    <div class="widget-title">
                                                        Region</div>
                                                </td>
                                                <td style="width: 60%">
                                                    <div class="widget-title">
                                                        Branch</div>
                                                </td>
                                            </tr>
                                            <tr align="left">
                                                <td style="width: 40%">
                                                    <asp:CheckBoxList ID="chkRegions" runat="server" AutoPostBack="True" onClientClick="__doPostBack('hidButton','OnClick');">
                                                    </asp:CheckBoxList>
                                                </td>
                                                <td style="width: 60%">
                                                    <asp:CheckBoxList ID="chkBranch" runat="server">
                                                    </asp:CheckBoxList>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <cc1:ModalPopupExtender ID="mdpopLocation" runat="server" PopupControlID="pnlModalLocation"
                    OkControlID="imgBtnCloseLocation" TargetControlID="btnSelectRecommLocation">
                </cc1:ModalPopupExtender>
            </td>
        </tr>
    </table>
</asp:Content>
