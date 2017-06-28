<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmReassignInterview.aspx.vb" Inherits="Recruitment_frmReassignInterview"
    Title=".:HRM:Reassign Interview:." %>

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
        
        function  GetExDropDownValue()
        {
           var e = document.getElementById('<%=drpExAvailableIntTeamList.ClientID%>');
           var strUser = e.options[e.selectedIndex].value;
           return strUser 
        }
        
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlInterviewGradeSelection" runat="server" Width="60%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="3">
                                <div class="widget-title">
                                    Candidate Interview Reassignment</div>
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
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Select Interveiw Grade
                            </td>
                            <td>
                                <asp:DropDownList ID="drpApplicantGrade" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
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
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel runat="server" SkinID="pnlInner" ID="pnlInterviewTakenCV">
                    <div style="max-height: 250px; overflow: auto">
                        <asp:GridView runat="server" AutoGenerateColumns="False" EmptyDataText="No Data Available"
                            CssClass="mGrid" SkinID="grdNoFooter" ID="grdInterviewCompletedCandidates">
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
                                <asp:BoundField DataField="EntryDate" HeaderText=" Applied On "></asp:BoundField>
                                <asp:TemplateField HeaderText=" Candidate ">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCandidateName" runat="server" Text='<%# Bind("CandidateName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="PreDistrictName" HeaderText=" Present District "></asp:BoundField>
                                <asp:BoundField DataField="PerDistrictName" HeaderText=" Permanent District "></asp:BoundField>
                                <asp:BoundField DataField="HighestDegree" HeaderText=" Highest Degree "></asp:BoundField>
                                <asp:BoundField DataField="Major" HeaderText=" Major "></asp:BoundField>
                                <asp:BoundField DataField="InstitutionName" HeaderText=" Institution "></asp:BoundField>
                                <asp:BoundField DataField="Age" HeaderText=" Age "></asp:BoundField>
                                <asp:BoundField DataField="Gender" HeaderText=" Gender "></asp:BoundField>
                                <asp:BoundField DataField="CurrentStatus" HeaderText=" Status "></asp:BoundField>
                                <asp:TemplateField HeaderText=" Assessment " ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkBtnGrdIntAssessment" runat="server" CausesValidation="False"
                                            CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# String.Format("openWindow(""frmShowInterviewAssessment.aspx?CandidateID={0}&CircularID={1}"",""Popup"",1000,400);", Eval("CandidateID"), Eval("CircularID")) %>'
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
        <tr align="center">
            <td>
                <asp:Panel runat="server" SkinID="pnlInner" ID="pnlExAssignInterview" Width="60%">
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
                                <asp:DropDownList runat="server" CssClass="InputTxtBox" Width="200px" ID="drpExAvailableIntTeamList">
                                </asp:DropDownList>
                                &#160;&#160;<asp:RequiredFieldValidator runat="server" ControlToValidate="drpExAvailableIntTeamList"
                                    ErrorMessage="*" ValidationGroup="IntExPnlAssignment" ID="reqFldExAvailableIntTeamList"></asp:RequiredFieldValidator>
                                &#160;&#160;<asp:LinkButton runat="server" OnClientClick="javascript:openWindow(&quot;../InterviewPanel/frmViewIntPanelMembers.aspx?IntTeamID=&quot; + GetExDropDownValue(),&quot;Popup&quot;,800,400);"
                                    CssClass="linkbtn" ID="LinkButton2">View Panel Members </asp:LinkButton>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Interview Date
                            </td>
                            <td>
                                <asp:TextBox runat="server" CssClass="InputTxtBox" Width="200px" ID="txtExInterviewDate"></asp:TextBox>
                                <cc1:CalendarExtender runat="server" Enabled="True" TargetControlID="txtExInterviewDate"
                                    ID="CalendarExtender1">
                                </cc1:CalendarExtender>
                                &#160;&#160;<asp:RequiredFieldValidator runat="server" ControlToValidate="txtExInterviewDate"
                                    ErrorMessage="*" ValidationGroup="IntExPnlAssignment" ID="reqFldtxtExInterviewDate"></asp:RequiredFieldValidator>
                                &#160;<asp:DropDownList runat="server" CssClass="InputTxtBox" Width="40px" ID="drpECOEIHour">
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
                                &nbsp;<asp:DropDownList runat="server" CssClass="InputTxtBox" Width="50px" ID="drpECOEIMin">
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                    <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                    <asp:ListItem Text="40" Value="40"></asp:ListItem>
                                    <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                </asp:DropDownList>
                                &#160;<asp:DropDownList runat="server" CssClass="InputTxtBox" Width="50px" ID="drpECOEIAMPM">
                                    <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                                    <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                &#160;<asp:Button runat="server" Text="Check All" ValidationGroup="IntExPnlAssignment"
                                    CssClass="styled-button-1" ID="btnExIntAssignmentChqAll"></asp:Button>
                                &#160;<asp:Button runat="server" Text="Assign" ValidationGroup="IntExPnlAssignment"
                                    CssClass="styled-button-1" ID="btnExIntAssInterview"></asp:Button>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
