<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmRecTypeCVSelection.aspx.vb" Inherits="Recruitment_frmRecTypeCVSelection"
    Title=".:HRM:CV Selection:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script language="JavaScript" type="text/javascript">
        function openWindow(windowURL,windowName,windowWidth,windowHeight) {
            var left = (screen.width/2)-(windowWidth/2);
            var top = (screen.height/2)-(windowHeight/2);
            window.name = 'parentWnd';
            newWindow = window.open(windowURL,windowName,'top='+ top +',left='+ left +',width='+windowWidth+',height='+windowHeight+',toolbar=0,location=no,directories=0, status=0,menuBar=0,scrollBars=1,resizable=1');
            newWindow.focus();
        }
        function  GetDropDownValue()
        {
            var e = document.getElementById('<%=drpAvailableIntTeamList.ClientID%>');
            var strUser = e.options[e.selectedIndex].value;
            return strUser 
        }
        
            function  GetExDropDownValue()
    {
       var e = document.getElementById('<%=drpExAvailableIntTeamList.ClientID%>');
       var strUser = e.options[e.selectedIndex].value;
       return strUser 
    }
    
     function  GetIntComDropDownValue()
    {
       var e = document.getElementById('<%=drpInterviewCompletedIntTeamList.ClientID%>');
       var strUser = e.options[e.selectedIndex].value;
       return strUser 
    }
        
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Panel ID="pnlTopPanel" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="4">
                                <div class="widget-title">
                                    CV Selection
                                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Recruitment Type
                            </td>
                            <td>
                                <asp:DropDownList ID="drpRecTypeList" runat="server" AutoPostBack="True" CssClass="InputTxtBox">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Location
                            </td>
                            <td>
                                <asp:DropDownList ID="drpBranchList" runat="server" CssClass="InputTxtBox">
                                </asp:DropDownList>
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
                <asp:Panel ID="pnlCVSelectionCriterion" runat="server" SkinID="pnlInner">
                    <cc1:TabContainer ID="tabCVSelection" CssClass="MyTabStyle" runat="server" ActiveTabIndex="2"
                        AutoPostBack="True">
                        <cc1:TabPanel ID="tabPnlReview" runat="server" HeaderText="Review">
                            <HeaderTemplate>
                                <table>
                                    <tr align="left">
                                        <td valign="top">
                                            <img src="../Sources/images/review_02.png" style="height: 30px;" />
                                        </td>
                                        <td valign="top">
                                            Reviewed
                                        </td>
                                    </tr>
                                </table>
                            </HeaderTemplate>
                            <ContentTemplate>
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Panel ID="pnlReviewedCV" runat="server" SkinID="pnlInner">
                                                <table width="100%">
                                                    <tr>
                                                        <td>
                                                            <div class="widget-title">
                                                                Selected CV</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div style="max-height: 300px; overflow: auto">
                                                                <asp:GridView ID="grdReviewedCV" runat="server" AutoGenerateColumns="False" CssClass="mGrid"
                                                                    EmptyDataText="No Data Available" ShowFooter="true">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText=" Select ">
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="chkSelectReviewed" runat="server" /></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="AppliedJobID" Visible="False">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblReviewedAppliedJobID" runat="server" Text='<%# Bind("AppliedJobID") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Candidate ID ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblReviewCandidateID" runat="server" Text='<%# Bind("CandidateID") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="EntryDate" HeaderText=" Applied On" />
                                                                        <asp:TemplateField HeaderText="Candidate">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblReviewCandidateName" runat="server" Text='<%# Bind("CandidateName") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="PreDistrictName" HeaderText=" Present District " />
                                                                        <asp:BoundField DataField="PerDistrictName" HeaderText=" Permanent District " />
                                                                        <asp:BoundField DataField="HighestDegree" HeaderText=" Highest Degree " />
                                                                        <asp:BoundField DataField="Major" HeaderText=" Major " />
                                                                        <asp:BoundField DataField="InstitutionName" HeaderText=" Institution " />
                                                                        <asp:BoundField DataField="ReviewedBy" HeaderText=" Reviewer " />
                                                                        <asp:BoundField DataField="ReviewedDate" HeaderText=" Reviewed On " />
                                                                        <asp:BoundField DataField="CurrentStatus" HeaderText=" Status " />
                                                                        <asp:TemplateField HeaderText=" Screening Details " ShowHeader="False">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkBtnReviewScreeningDetails" runat="server" CausesValidation="False"
                                                                                    CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("CandidateID","openWindow(""../ScreeningInterview/frmViewScreeningInterview.aspx?CandidateID={0}"",""Popup"",1000,800);") %>'
                                                                                    Text=" View "> </asp:LinkButton></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" CV Details " ShowHeader="False">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkReviewCVDetailsBtn" runat="server" CausesValidation="False"
                                                                                    CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("CandidateID","openWindow(""../RecuitmentCVView.aspx?CandidateID={0}"",""Popup"",1000,1100);") %>'
                                                                                    Text=" View "></asp:LinkButton></ItemTemplate>
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
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:RadioButtonList ID="rdbtnActions" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                                RepeatDirection="Horizontal">
                                                <asp:ListItem>Assign Exam</asp:ListItem>
                                                <asp:ListItem>Assign Interview</asp:ListItem>
                                                <asp:ListItem>Others</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Panel ID="pnlAssignExam" runat="server" SkinID="pnlInner">
                                                <table style="width: 100%;">
                                                    <tr align="left">
                                                        <td colspan="3">
                                                            <div class="widget-title">
                                                                Assign Exam</div>
                                                        </td>
                                                    </tr>
                                                    <tr align="left">
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
                                                            Available Exams
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drpAvailableExams" runat="server" CssClass="InputTxtBox" Width="200px"
                                                                AutoPostBack="True">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr align="left">
                                                        <td>
                                                        </td>
                                                        <td class="label">
                                                            Effective Date
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtReviewedExamEffectiveDate" runat="server" CssClass="InputTxtBox"
                                                                ValidationGroup="RExamGenerate" Width="200px"></asp:TextBox><cc1:CalendarExtender
                                                                    ID="txtReviewedExamEffectiveDate_CalendarExtender" runat="server" Enabled="True"
                                                                    TargetControlID="txtReviewedExamEffectiveDate">
                                                                </cc1:CalendarExtender>
                                                            &#160;<asp:RequiredFieldValidator ID="reqFldREffectiveDate" runat="server" ControlToValidate="txtReviewedExamEffectiveDate"
                                                                ErrorMessage="*" ValidationGroup="RExamGenerate"></asp:RequiredFieldValidator>&#160;&#160;<asp:DropDownList
                                                                    ID="drpSHour" runat="server" CssClass="InputTxtBox" Width="40px">
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
                                                            &#160;<asp:DropDownList ID="drpSMin" runat="server" CssClass="InputTxtBox" Width="50px">
                                                                <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                                                <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                                                <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                                                <asp:ListItem Text="40" Value="40"></asp:ListItem>
                                                                <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            &nbsp;<asp:DropDownList ID="drpSAMPM" runat="server" CssClass="InputTxtBox" Width="50px">
                                                                <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                                                                <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr align="left">
                                                        <td>
                                                        </td>
                                                        <td class="label">
                                                            Select Branch
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drpULCBranchSelectedCV" runat="server" CssClass="InputTxtBox"
                                                                Width="200px">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="btnCheckAll" runat="server" CssClass="styled-button-1" Text="Check All" />&#160;&#160;
                                                            <asp:Button ID="btnGenerateExam" runat="server" CssClass="styled-button-1" Text="Generate"
                                                                ValidationGroup="RExamGenerate" />
                                                        </td>
                                                    </tr>
                                                    <tr>
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
                                                            Select Entry Point
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drpEntryPoint" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                                                Width="200px">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td colspan="2">
                                                            <asp:GridView ID="grdEntryPointWiseAttendees" runat="server" CssClass="mGrid" SkinID="grdNoFooter">
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Panel ID="pnlAssignInterview" runat="server" SkinID="pnlInner">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td align="left" colspan="3">
                                                            <div class="widget-title">
                                                                Assign Interview</div>
                                                        </td>
                                                    </tr>
                                                    <tr align="left">
                                                        <td>
                                                            &#160;&#160;
                                                        </td>
                                                        <td class="label">
                                                            &#160;&#160;
                                                        </td>
                                                        <td class="label">
                                                            &#160;&#160;
                                                        </td>
                                                    </tr>
                                                    <tr align="left">
                                                        <td>
                                                        </td>
                                                        <td class="label">
                                                            Interview Panel
                                                        </td>
                                                        <td class="label">
                                                            <asp:DropDownList ID="drpAvailableIntTeamList" runat="server" CssClass="InputTxtBox"
                                                                Width="200px">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="reqFldIntPnlTeam" runat="server" ControlToValidate="drpAvailableIntTeamList"
                                                                ErrorMessage="*" ValidationGroup="IntPnlAssignment"></asp:RequiredFieldValidator>&#160;&#160;<asp:LinkButton
                                                                    ID="lnkBtnViewPanelMembers" runat="server" CssClass="linkbtn" OnClientClick="javascript:openWindow(&quot;../InterviewPanel/frmViewIntPanelMembers.aspx?IntTeamID=&quot; + GetDropDownValue(),&quot;Popup&quot;,800,400);">View Panel Members </asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                    <tr align="left">
                                                        <td>
                                                        </td>
                                                        <td class="label">
                                                            Interview Date
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtInterviewDate" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox><cc1:CalendarExtender
                                                                ID="txtInterviewDate_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtInterviewDate">
                                                            </cc1:CalendarExtender>
                                                            <asp:RequiredFieldValidator ID="reqFldIntDate" runat="server" ControlToValidate="txtInterviewDate"
                                                                ErrorMessage="*" ValidationGroup="IntPnlAssignment"></asp:RequiredFieldValidator>&#160;<asp:DropDownList
                                                                    ID="drpSIHour" runat="server" CssClass="InputTxtBox" Width="40px">
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
                                                                    <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                                                                    <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            &nbsp;<asp:DropDownList ID="drpSIMin" runat="server" CssClass="InputTxtBox" Width="50px">
                                                                <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                                                <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                                                <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                                                <asp:ListItem Text="40" Value="40"></asp:ListItem>
                                                                <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            &#160;<asp:DropDownList ID="drpSIAMPM" runat="server" CssClass="InputTxtBox" Width="50px">
                                                                <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                                                                <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="btnCheckIntCandidates" runat="server" CssClass="styled-button-1"
                                                                Text="Check All" ValidationGroup="IntPnlAssignment" />&#160;<asp:Button ID="btnAssignInterview"
                                                                    runat="server" CssClass="styled-button-1" Text="Assign" ValidationGroup="IntPnlAssignment" />
                                                        </td>
                                                    </tr>
                                                    <tr>
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
                                            <asp:Panel ID="pnlOtherActions" runat="server" SkinID="pnlInner">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td align="left" colspan="4">
                                                            <div class="widget-title">
                                                                Change Application Status</div>
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
                                                        <td class="label">
                                                            Choose Status
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drpApplicantStatus" runat="server" CssClass="InputTxtBox" Width="200px">
                                                                <asp:ListItem>Applied</asp:ListItem>
                                                                <asp:ListItem>Rejected</asp:ListItem>
                                                            </asp:DropDownList>
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
                                                            <asp:Button ID="btnChangeStatus" runat="server" CssClass="styled-button-1" Text="Change Status" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel ID="tabPnlExamAssigned" runat="server" HeaderText="Exam Completed">
                            <HeaderTemplate>
                                <table>
                                    <tr align="left">
                                        <td valign="top">
                                            <img src="../Sources/images/exam_assigned.png" style="max-height: 30px; max-width: 30px" />
                                        </td>
                                        <td valign="top">
                                            Exam Assigned
                                        </td>
                                    </tr>
                                </table>
                            </HeaderTemplate>
                            <ContentTemplate>
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Panel ID="Panel1" runat="server" SkinID="pnlInner">
                                                <table width="100%">
                                                    <tr>
                                                        <td align="left">
                                                            <div class="widget-title">
                                                                Exam Assigned Candidates</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div style="max-height: 300px; overflow: auto">
                                                                <asp:GridView ID="grdNewExamAssigned" runat="server" AutoGenerateColumns="False"
                                                                    CssClass="mGrid" ShowFooter="True">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText=" Select ">
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="chkSelectNReviewed" runat="server" /></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="AppliedJobID" Visible="False">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblEAExaminedAppliedJobID" runat="server" Text='<%# Bind("AppliedJobID") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Candidate ID ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblEAExaminedCandidateID" runat="server" Text='<%# Bind("CandidateID") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="EntryDate" HeaderText=" Applied On " />
                                                                        <asp:TemplateField HeaderText="Candidate">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblEAExaminedCandidateName" runat="server" Text='<%# Bind("CandidateName") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="PreDistrictName" HeaderText=" Present District " />
                                                                        <asp:BoundField DataField="PerDistrictName" HeaderText=" Permanent District " />
                                                                        <asp:BoundField DataField="HighestDegree" HeaderText=" Highest Degree " />
                                                                        <asp:BoundField DataField="Major" HeaderText=" Major " />
                                                                        <asp:BoundField DataField="InstitutionName" HeaderText=" Institution " />
                                                                        <asp:BoundField DataField="ReviewedBy" HeaderText=" Reviewed By " />
                                                                        <asp:BoundField DataField="ReviewedDate" HeaderText=" Reviewed On " />
                                                                        <asp:BoundField DataField="CurrentStatus" HeaderText=" Status " />
                                                                        <asp:TemplateField HeaderText=" Screening Details " ShowHeader="False">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkBtnEAExamCompletedScreeningDetails" runat="server" CausesValidation="False"
                                                                                    CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("CandidateID","openWindow(""../ScreeningInterview/frmViewScreeningInterview.aspx?CandidateID={0}"",""Popup"",1000,800);") %>'
                                                                                    Text=" View "> </asp:LinkButton></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" CV Details " ShowHeader="False">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkEAExamCompletedCVDetailsBtn" runat="server" CausesValidation="False"
                                                                                    CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("CandidateID","openWindow(""../RecuitmentCVView.aspx?CandidateID={0}"",""Popup"",1000,1100);") %>'
                                                                                    Text=" View "> </asp:LinkButton></ItemTemplate>
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
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Panel ID="pnlAssignExam0" runat="server" SkinID="pnlInner">
                                                <table style="width: 100%;">
                                                    <tr align="left">
                                                        <td colspan="3">
                                                            <div class="widget-title">
                                                                Assign Exam</div>
                                                        </td>
                                                    </tr>
                                                    <tr align="left">
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
                                                            Available Exams
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drpNAvailableExam" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                                                Width="200px">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr align="left">
                                                        <td>
                                                        </td>
                                                        <td class="label">
                                                            Effective Date
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtNExamEffectiveDate" runat="server" CssClass="InputTxtBox" ValidationGroup="NExamGen"
                                                                Width="200px"></asp:TextBox><cc1:CalendarExtender ID="calExttxtNExamEffectiveDate"
                                                                    runat="server" Enabled="True" TargetControlID="txtNExamEffectiveDate">
                                                                </cc1:CalendarExtender>
                                                            &#160;<asp:RequiredFieldValidator ID="reqFldNExamEffectiveDate" runat="server" ControlToValidate="txtNExamEffectiveDate"
                                                                ErrorMessage="*" ValidationGroup="NExamGen"></asp:RequiredFieldValidator>&#160;&#160;<asp:DropDownList
                                                                    ID="drpNSHour" runat="server" CssClass="InputTxtBox" Width="40px">
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
                                                            &#160;<asp:DropDownList ID="drpNSMin" runat="server" CssClass="InputTxtBox" Width="50px">
                                                                <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                                                <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                                                <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                                                <asp:ListItem Text="40" Value="40"></asp:ListItem>
                                                                <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            &#160;<asp:DropDownList ID="drpNSAMPM" runat="server" CssClass="InputTxtBox" Width="50px">
                                                                <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                                                                <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr align="left">
                                                        <td>
                                                        </td>
                                                        <td class="label">
                                                            Select Branch
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drpNULCBranch" runat="server" CssClass="InputTxtBox" Width="200px">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="btnNCheckAll" runat="server" CssClass="styled-button-1" Text="Check All">
                                                            </asp:Button>&#160;&#160;
                                                            <asp:Button ID="btnNGenerateExam" runat="server" CssClass="styled-button-1" Text="Generate"
                                                                ValidationGroup="NExamGen"></asp:Button>
                                                        </td>
                                                    </tr>
                                                    <tr>
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
                                                            Select Entry Point
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drpNEntryPoint" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                                                Width="200px">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td colspan="2">
                                                            <asp:GridView ID="grdNEntryPointWiseAttendees" runat="server" CssClass="mGrid" SkinID="grdNoFooter">
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel ID="tabPnlExam" runat="server" HeaderText="Exam">
                            <HeaderTemplate>
                                <table>
                                    <tr align="left">
                                        <td valign="top">
                                            <img src="../Sources/images/exam_completed.png" style="max-height: 30px; max-width: 30px" />
                                        </td>
                                        <td valign="top">
                                            Exam Completed
                                        </td>
                                    </tr>
                                </table>
                            </HeaderTemplate>
                            <ContentTemplate>
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Panel ID="pnlExamCompleted" runat="server" SkinID="pnlInner">
                                                <table width="100%">
                                                    <tr>
                                                        <td align="left">
                                                            <div class="widget-title">
                                                                Exam Completed Candidate</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div style="max-height: 200px; overflow: auto">
                                                                <asp:GridView ID="grdExamCompleted" runat="server" AutoGenerateColumns="False" CssClass="mGrid"
                                                                    ShowFooter="true">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText=" Select " ShowHeader="False">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                                                                    CssClass="linkbtn" Text="Select"></asp:LinkButton></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="AppliedJobID" Visible="False">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblExaminedAppliedJobID" runat="server" Text='<%# Bind("AppliedJobID") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Candidate ID ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblExaminedCandidateID" runat="server" Text='<%# Bind("CandidateID") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="EntryDate" HeaderText=" Applied On " />
                                                                        <asp:BoundField DataField="CandidateName" HeaderText=" Candidate " />
                                                                        <asp:BoundField DataField="PreDistrictName" HeaderText=" Present District " />
                                                                        <asp:BoundField DataField="PerDistrictName" HeaderText=" Permanent District " />
                                                                        <asp:BoundField DataField="HighestDegree" HeaderText=" Highest Degree " />
                                                                        <asp:BoundField DataField="Major" HeaderText=" Major " />
                                                                        <asp:BoundField DataField="InstitutionName" HeaderText=" Institution " />
                                                                        <asp:BoundField DataField="ReviewedBy" HeaderText=" Reviewed By " />
                                                                        <asp:BoundField DataField="ReviewedDate" HeaderText=" Reviewed On " />
                                                                        <asp:BoundField DataField="CurrentStatus" HeaderText=" Status " />
                                                                        <asp:TemplateField HeaderText=" Screening Details " ShowHeader="False">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkBtnExamCompletedScreeningDetails" runat="server" CausesValidation="False"
                                                                                    CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("CandidateID","openWindow(""../ScreeningInterview/frmViewScreeningInterview.aspx?CandidateID={0}"",""Popup"",1000,800);") %>'
                                                                                    Text=" View "> </asp:LinkButton></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" CV Details " ShowHeader="False">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkExamCompletedCVDetailsBtn" runat="server" CausesValidation="False"
                                                                                    CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("CandidateID","openWindow(""../RecuitmentCVView.aspx?CandidateID={0}"",""Popup"",1000,1100);") %>'
                                                                                    Text=" View "> </asp:LinkButton></ItemTemplate>
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
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Panel ID="pnlCandidateExamResultSummary" runat="server" SkinID="pnlInner">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td>
                                                            <div class="widget-title">
                                                                Taken Exams</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div style="max-height: 200px; max-width: 100%; overflow: auto">
                                                                <asp:GridView ID="grdCandidateExamResultSummary" runat="server" AutoGenerateColumns="False"
                                                                    CssClass="mGrid" SkinID="grdNoFooter" Width="100%">
                                                                    <Columns>
                                                                        <asp:BoundField DataField="ExamName" HeaderText=" Exam " />
                                                                        <asp:TemplateField HeaderText="ExamRollNo" Visible="False">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblExamRollNo" runat="server" Text='<%# Bind("ExamRollNo") %>'> </asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="ExamCode" HeaderText=" Exam Code " />
                                                                        <asp:BoundField DataField="TotalQuestion" HeaderText=" Total Question " />
                                                                        <asp:BoundField DataField="TotalMarks" HeaderText=" Total Marks " />
                                                                        <asp:BoundField DataField="PositiveMarking" HeaderText=" Positive Marking " />
                                                                        <asp:BoundField DataField="NegativeMarking" HeaderText=" Negative Marking " />
                                                                        <asp:BoundField DataField="ObtainedMarks" HeaderText=" Obtained Marks " />
                                                                        <asp:TemplateField HeaderText=" Exam Details " ShowHeader="False">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkCandidateExamDetailsBtn" runat="server" CausesValidation="False"
                                                                                    CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("ExamRollNo","openWindow(""../CVMan/frmShowCandidateResult.aspx?ExamRollNo={0}"",""Popup"",1000,1100);") %>'
                                                                                    Text=" View "> </asp:LinkButton></ItemTemplate>
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
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Panel ID="pnlExOptions" runat="server" SkinID="pnlInner">
                                                <table style="width: 100%;">
                                                    <tr>
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
                                                            <asp:RadioButtonList ID="rdbtnOptionsExamWindow" runat="server" AutoPostBack="True"
                                                                CssClass="InputTxtBox" RepeatDirection="Horizontal">
                                                                <asp:ListItem Value="AssOthExams"> Assign Other Exams </asp:ListItem>
                                                                <asp:ListItem Value="AssOthInterview"> Assign Interview </asp:ListItem>
                                                                <asp:ListItem Value="ExChangeStatus"> Change Status </asp:ListItem>
                                                            </asp:RadioButtonList>
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
                                            <asp:Panel ID="pnlAssignOtherExams" runat="server" SkinID="pnlInner">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td align="left" colspan="3">
                                                            <div class="widget-title">
                                                                Assign Exam</div>
                                                        </td>
                                                    </tr>
                                                    <tr align="left">
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
                                                            Available Exams
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drpExAvailableExams" runat="server" CssClass="InputTxtBox"
                                                                Width="200px">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr align="left">
                                                        <td>
                                                        </td>
                                                        <td class="label">
                                                            Effective Date
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtExAssOtrExamsEffectiveDate" runat="server" CssClass="InputTxtBox"
                                                                Width="200px"></asp:TextBox><cc1:CalendarExtender ID="txtExAssOtrExamsEffectiveDate_CalendarExtender"
                                                                    runat="server" Enabled="True" TargetControlID="txtExAssOtrExamsEffectiveDate">
                                                                </cc1:CalendarExtender>
                                                            &#160;<asp:RequiredFieldValidator ID="reqFldECOEExEffectiveDate" runat="server" ControlToValidate="txtExAssOtrExamsEffectiveDate"
                                                                ErrorMessage="*" ValidationGroup="ECOEGenerateExam"></asp:RequiredFieldValidator>&#160;<asp:DropDownList
                                                                    ID="drpECOEHour" runat="server" CssClass="InputTxtBox" Width="40px">
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
                                                                    <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                                                                    <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            &nbsp;<asp:DropDownList ID="drpECOEMin" runat="server" CssClass="InputTxtBox" Width="50px">
                                                                <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                                                <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                                                <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                                                <asp:ListItem Text="40" Value="40"></asp:ListItem>
                                                                <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            &#160;<asp:DropDownList ID="drpECOEAMPM" runat="server" CssClass="InputTxtBox" Width="50px">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr align="left">
                                                        <td>
                                                        </td>
                                                        <td class="label">
                                                            Select Branch
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drpULCBranchExamAssigned" runat="server" CssClass="InputTxtBox"
                                                                Width="200px">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="btnChqAvailabilityOfExams" runat="server" CssClass="styled-button-1"
                                                                Text="Check All" />&#160;&#160;<asp:Button ID="btnGenerateOtherExams" runat="server"
                                                                    CssClass="styled-button-1" Text="Generate" ValidationGroup="ECOEGenerateExam" />
                                                        </td>
                                                    </tr>
                                                    <tr>
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
                                                            Select Entry Point
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drpExEntryPoint" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                                                Width="200px">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td colspan="2">
                                                            <asp:GridView ID="grdExEntryPointWiseCandidate" runat="server" CssClass="mGrid" SkinID="grdNoFooter">
                                                            </asp:GridView>
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
                                            <asp:Panel ID="pnlExChangeStatus" runat="server" SkinID="pnlInner">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td align="left" colspan="4">
                                                            <div class="widget-title">
                                                                Change Status</div>
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
                                                        <td class="label">
                                                            Choose Status
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drpExChangeStatus" runat="server" CssClass="InputTxtBox" Width="200px">
                                                                <asp:ListItem>Applied</asp:ListItem>
                                                                <asp:ListItem>Rejected</asp:ListItem>
                                                            </asp:DropDownList>
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
                                                            <asp:Button ID="btnExChangeStatus" runat="server" CssClass="styled-button-1" Text="Change Status" />
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
                                            <asp:Panel ID="pnlExAssignInterview" runat="server" SkinID="pnlInner">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td align="left" colspan="3">
                                                            <div class="widget-title">
                                                                Assign Interview</div>
                                                        </td>
                                                    </tr>
                                                    <tr align="left">
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
                                                            Interview Panel
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drpExAvailableIntTeamList" runat="server" CssClass="InputTxtBox"
                                                                Width="200px">
                                                            </asp:DropDownList>
                                                            &#160;&#160;<asp:RequiredFieldValidator ID="reqFldExAvailableIntTeamList" runat="server"
                                                                ControlToValidate="drpExAvailableIntTeamList" ErrorMessage="*" ValidationGroup="IntExPnlAssignment"></asp:RequiredFieldValidator>&#160;&#160;<asp:LinkButton
                                                                    ID="LinkButton2" runat="server" CssClass="linkbtn" OnClientClick="javascript:openWindow(&quot;../InterviewPanel/frmViewIntPanelMembers.aspx?IntTeamID=&quot; + GetExDropDownValue(),&quot;Popup&quot;,800,400);">View Panel Members </asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                    <tr align="left">
                                                        <td>
                                                        </td>
                                                        <td class="label">
                                                            Interview Date
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtExInterviewDate" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox><cc1:CalendarExtender
                                                                ID="CalendarExtender1" runat="server" Enabled="True" TargetControlID="txtExInterviewDate">
                                                            </cc1:CalendarExtender>
                                                            &#160;&#160;<asp:RequiredFieldValidator ID="reqFldtxtExInterviewDate" runat="server"
                                                                ControlToValidate="txtExInterviewDate" ErrorMessage="*" ValidationGroup="IntExPnlAssignment"></asp:RequiredFieldValidator>&#160;<asp:DropDownList
                                                                    ID="drpECOEIHour" runat="server" CssClass="InputTxtBox" Width="40px">
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
                                                                    <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                                                                    <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            &nbsp;<asp:DropDownList ID="drpECOEIMin" runat="server" CssClass="InputTxtBox" Width="50px">
                                                                <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                                                <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                                                <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                                                <asp:ListItem Text="40" Value="40"></asp:ListItem>
                                                                <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            &#160;<asp:DropDownList ID="drpECOEIAMPM" runat="server" CssClass="InputTxtBox" Width="50px">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            &#160;<asp:Button ID="btnExIntAssignmentChqAll" runat="server" CssClass="styled-button-1"
                                                                Text="Check All" ValidationGroup="IntExPnlAssignment" />&#160;<asp:Button ID="btnExIntAssInterview"
                                                                    runat="server" CssClass="styled-button-1" Text="Assign" ValidationGroup="IntExPnlAssignment" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel ID="tabPnlInterviewAssigned" runat="server" HeaderText="Interview Assigned">
                            <HeaderTemplate>
                                <table>
                                    <tr align="left">
                                        <td valign="top">
                                            <img src="../Sources/images/interview_assigned_02.png" style="max-height: 30px; max-width: 30px" />
                                        </td>
                                        <td valign="top">
                                            Int. Assigned
                                        </td>
                                    </tr>
                                </table>
                            </HeaderTemplate>
                            <ContentTemplate>
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            <asp:Panel ID="pnlPendingInterviewCandidates" runat="server" SkinID="pnlInner">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td align="left">
                                                            <div class="widget-title">
                                                                Pending Interview Assigned Candidates</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div style="max-height: 250px; overflow: auto">
                                                                <asp:GridView ID="grdInterviewNotTaken" runat="server" AutoGenerateColumns="False"
                                                                    CssClass="mGrid" EmptyDataText="No Data Available" ShowFooter="true">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Select">
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="chkSelectIntNotTaken" runat="server" /></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="AppliedJobID" Visible="False">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblInterviewedNotTakenAppliedJobID" runat="server" Text='<%# Bind("AppliedJobID") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="CandidateID" HeaderText=" CandidateID " />
                                                                        <asp:BoundField DataField="EntryDate" HeaderText=" Applied On " />
                                                                        <asp:BoundField DataField="CandidateName" HeaderText=" Candidate " />
                                                                        <asp:BoundField DataField="PreDistrictName" HeaderText=" Present District " />
                                                                        <asp:BoundField DataField="PerDistrictName" HeaderText=" Permanent District " />
                                                                        <asp:BoundField DataField="HighestDegree" HeaderText=" Highest Degree " />
                                                                        <asp:BoundField DataField="Major" HeaderText=" Major " />
                                                                        <asp:BoundField DataField="InstitutionName" HeaderText=" Institution " />
                                                                        <asp:BoundField DataField="Age" HeaderText=" Age " />
                                                                        <asp:BoundField DataField="Gender" HeaderText=" Gender " />
                                                                        <asp:BoundField DataField="CurrentStatus" HeaderText=" Status " />
                                                                        <asp:TemplateField HeaderText=" CV Details " ShowHeader="False">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkInterviewCompletedCVDetailsBtn0" runat="server" CausesValidation="False"
                                                                                    CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("CandidateID","openWindow(""../RecuitmentCVView.aspx?CandidateID={0}"",""Popup"",1000,1100);") %>'
                                                                                    Text=" View "> </asp:LinkButton></ItemTemplate>
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
                                            <asp:Panel ID="pnlChangeStatusPendingIntAssigned" runat="server" SkinID="pnlInner">
                                                <table style="width: 100%;">
                                                    <tr align="left">
                                                        <td colspan="4">
                                                            <div class="widget-title">
                                                                Change Status</div>
                                                        </td>
                                                    </tr>
                                                    <tr align="left">
                                                        <td style="width: 20px">
                                                            &#160;&#160;
                                                        </td>
                                                        <td align="left" class="label" style="width: 150px">
                                                            &#160;&#160;
                                                        </td>
                                                        <td>
                                                            &#160;&#160;
                                                        </td>
                                                        <td>
                                                            &#160;&#160;
                                                        </td>
                                                    </tr>
                                                    <tr align="left">
                                                        <td style="width: 20px">
                                                        </td>
                                                        <td class="label" align="left" style="width: 150px">
                                                            Choose Status
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drpInterviewPendingTakenCanStatus" runat="server" CssClass="InputTxtBox"
                                                                Width="200px">
                                                                <asp:ListItem>Applied</asp:ListItem>
                                                                <asp:ListItem>Reviewed</asp:ListItem>
                                                                <asp:ListItem>Rejected</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                    <tr align="left">
                                                        <td>
                                                        </td>
                                                        <td class="label">
                                                            Remarks
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtPendIntCanChangeStatRemarks" runat="server" CssClass="InputTxtBox"
                                                                Height="50px" TextMode="MultiLine" Width="300px"></asp:TextBox>&#160;<asp:RequiredFieldValidator
                                                                    ID="reqFldPendIntRemarks" runat="server" ControlToValidate="txtPendIntCanChangeStatRemarks"
                                                                    ErrorMessage="Required" ValidationGroup="PendIntChngStatus"></asp:RequiredFieldValidator>
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
                                                            <asp:Button ID="btnPendingInterviewTakenChangeStatus" runat="server" CssClass="styled-button-1"
                                                                Text="Change Status" ValidationGroup="PendIntChngStatus" />
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
                                            <asp:Panel ID="pnlInterviewTakenOtherActions" runat="server" SkinID="pnlInner" Visible="False">
                                                <table style="width: 100%;">
                                                    <tr align="left">
                                                        <td colspan="4">
                                                            <div class="widget-title">
                                                                Assign Interview</div>
                                                        </td>
                                                    </tr>
                                                    <tr align="left">
                                                        <td style="width: 20px">
                                                        </td>
                                                        <td style="width: 150px">
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
                                                            Choose Status
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drpInterviewTakenCanStatus" runat="server" CssClass="InputTxtBox"
                                                                Width="200px">
                                                                <asp:ListItem>Applied</asp:ListItem>
                                                                <asp:ListItem>Reviewed</asp:ListItem>
                                                                <asp:ListItem>Rejected</asp:ListItem>
                                                            </asp:DropDownList>
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
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="btnInterviewTakenChangeStatus" runat="server" CssClass="styled-button-1"
                                                                Text="Change Status" />
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
                                            <asp:Panel ID="pnlIntCompletedAnotherInterview" runat="server" SkinID="pnlInner">
                                                <table style="width: 100%;">
                                                    <tr align="left">
                                                        <td colspan="3">
                                                            <div class="widget-title">
                                                                Assign Interview</div>
                                                        </td>
                                                    </tr>
                                                    <tr align="left">
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
                                                            Interview Panel
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drpInterviewCompletedIntTeamList" runat="server" CssClass="InputTxtBox"
                                                                Width="200px">
                                                            </asp:DropDownList>
                                                            &#160;&#160;<asp:RequiredFieldValidator ID="reqFldIntComAvailableIntTeamList" runat="server"
                                                                ControlToValidate="drpInterviewCompletedIntTeamList" ErrorMessage="*" ValidationGroup="IntExPnlAssignment"></asp:RequiredFieldValidator>&#160;&#160;<asp:LinkButton
                                                                    ID="lnkBtnVwIntComPntMembers" runat="server" CssClass="linkbtn" OnClientClick="javascript:openWindow(&quot;../InterviewPanel/frmViewIntPanelMembers.aspx?IntTeamID=&quot; + GetIntComDropDownValue(),&quot;Popup&quot;,800,400);">View Panel Members </asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                    <tr align="left">
                                                        <td>
                                                        </td>
                                                        <td class="label">
                                                            Interview Date
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtIntCompletedInterviewDate" runat="server" CssClass="InputTxtBox"
                                                                Width="200px"></asp:TextBox><cc1:CalendarExtender ID="CalendarExtender2" runat="server"
                                                                    Enabled="True" TargetControlID="txtIntCompletedInterviewDate">
                                                                </cc1:CalendarExtender>
                                                            &#160;&#160;<asp:RequiredFieldValidator ID="reqFldtxtIntComInterviewDate" runat="server"
                                                                ControlToValidate="txtIntCompletedInterviewDate" ErrorMessage="*" ValidationGroup="IntComIntPnlAssignment"></asp:RequiredFieldValidator>&#160;<asp:DropDownList
                                                                    ID="drpICIHour" runat="server" CssClass="InputTxtBox" Width="40px">
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
                                                                    <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                                                                    <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            &nbsp;<asp:DropDownList ID="drpICIMin" runat="server" CssClass="InputTxtBox" Width="50px">
                                                                <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                                                <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                                                <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                                                <asp:ListItem Text="40" Value="40"></asp:ListItem>
                                                                <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            &#160;<asp:DropDownList ID="drpICIAMPM" runat="server" CssClass="InputTxtBox" Width="50px">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            &#160;<asp:Button ID="btnIntCompletedIntAssignChqAll" runat="server" CssClass="styled-button-1"
                                                                Text="Check All" ValidationGroup="IntComIntPnlAssignment" />&#160;<asp:Button ID="btnIntComIntAssInterview"
                                                                    runat="server" CssClass="styled-button-1" Text="Assign" ValidationGroup="IntComIntPnlAssignment" />
                                                        </td>
                                                    </tr>
                                                    <tr>
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
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel ID="tabPnlInterveiwCompleted" runat="server" HeaderText="Interview Completed">
                            <HeaderTemplate>
                                <table>
                                    <tr align="left">
                                        <td valign="top">
                                            <img src="../Sources/images/interview_completed.png" style="max-height: 30px; max-width: 30px" />
                                        </td>
                                        <td valign="top">
                                            Int. Completed
                                        </td>
                                    </tr>
                                </table>
                            </HeaderTemplate>
                            <ContentTemplate>
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <asp:Panel ID="pnlSelectIntGradeList" runat="server" SkinID="pnlInner">
                                                <table style="width: 100%;">
                                                    <tr align="left">
                                                        <td colspan="3">
                                                            <div class="widget-title">
                                                                Completed Interview</div>
                                                        </td>
                                                    </tr>
                                                    <tr align="left">
                                                        <td style="width: 20px">
                                                        </td>
                                                        <td style="width: 150px">
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="label">
                                                        </td>
                                                        <td align="left" class="label">
                                                            Select Interview Grade
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drpApplicantGrade" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                                                Width="200px">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="label">
                                                        </td>
                                                        <td align="left" class="label">
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
                                            <asp:Panel ID="pnlInterviewTakenCV" runat="server" SkinID="pnlInner">
                                                <div style="max-height: 250px; overflow: auto">
                                                    <asp:GridView ID="grdInterviewCompletedCandidates" runat="server" AutoGenerateColumns="False"
                                                        CssClass="mGrid" EmptyDataText="No Data Available" SkinID="grdNoFooter">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                                                        Text="Select"></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="AppliedJobID" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInterviewedAppliedJobID" runat="server" Text='<%# Bind("AppliedJobID") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="IntCandidateID" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblIntCandidateID" runat="server" Text='<%# Bind("IntCandidateID") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Candidate ID ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInterviewedCandidateID" runat="server" Text='<%# Bind("CandidateID") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="EntryDate" HeaderText=" Applied On " />
                                                            <asp:BoundField DataField="CandidateName" HeaderText=" Candidate " />
                                                            <asp:BoundField DataField="PreDistrictName" HeaderText=" Present District " />
                                                            <asp:BoundField DataField="PerDistrictName" HeaderText=" Permanent District " />
                                                            <asp:BoundField DataField="HighestDegree" HeaderText=" Highest Degree " />
                                                            <asp:BoundField DataField="Major" HeaderText=" Major " />
                                                            <asp:BoundField DataField="InstitutionName" HeaderText=" Institution " />
                                                            <asp:BoundField DataField="Age" HeaderText=" Age " />
                                                            <asp:BoundField DataField="Gender" HeaderText=" Gender " />
                                                            <asp:BoundField DataField="CurrentStatus" HeaderText=" Status " />
                                                            <asp:TemplateField HeaderText=" Assessment " ShowHeader="False">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkBtnGrdIntAssessment" runat="server" CausesValidation="False"
                                                                        CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# String.Format("openWindow(""../Recruitment/frmShowInterviewAssessment.aspx?CandidateID={0}&CircularID={1}"",""Popup"",1000,400);", Eval("CandidateID"), Eval("CircularID")) %>'
                                                                        Text=" Assessment "> </asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Screening Details " ShowHeader="False">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkBtnInterviewCompletedScreeningDetails" runat="server" CausesValidation="False"
                                                                        CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("CandidateID","openWindow(""../ScreeningInterview/frmViewScreeningInterview.aspx?CandidateID={0}"",""Popup"",1000,800);") %>'
                                                                        Text=" View "> </asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" CV Details " ShowHeader="False">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkInterviewCompletedCVDetailsBtn" runat="server" CausesValidation="False"
                                                                        CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("CandidateID","openWindow(""../RecuitmentCVView.aspx?CandidateID={0}"",""Popup"",1000,1100);") %>'
                                                                        Text=" View "></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </cc1:TabPanel>
                    </cc1:TabContainer>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
