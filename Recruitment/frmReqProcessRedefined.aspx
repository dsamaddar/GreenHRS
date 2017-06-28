<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmReqProcessRedefined.aspx.vb" Inherits="Recruitment_frmReqProcessRedefined"
    Title=".:HRM:Recruitment Process Redefined:." %>

<%@ Register TagPrefix="asp" Namespace="Saplin.Controls" Assembly="DropDownCheckBoxes" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Sources/css/ReqProcess.css" rel="stylesheet" type="text/css" />

    <script src="../Sources/js/jquery-1.10.2.js" type="text/javascript"></script>

    <script src="../Sources/js/jquery.ui.core.min.js" type="text/javascript"></script>

    <script src="../Sources/js/jquery.tablesorter.min.js" type="text/javascript"></script>

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
        .Genlabel
        {
            font-family: Cambria;
            color: black;
            font-size: 13pt;
            font-weight: bold;
            width: 41px;
        }
        .Demandlabel
        {
            font-family: Cambria;
            color: seagreen;
            font-size: 13pt;
            font-weight: bold;
        }
        .Supplylabel
        {
            font-family: Cambria;
            color: royalblue;
            font-size: 13pt;
            font-weight: bold;
        }
        .ajax__calendar_body
        {
            z-index: 100004;
        }
        .ajax__calendar_container
        {
            position: relative;
        }
    </style>

    <script language="JavaScript" type="text/javascript">
        function openWindow(windowURL, windowName, windowWidth, windowHeight) {

            var left = (screen.width / 2) - (windowWidth / 2);
            var top = (screen.height / 2) - (windowHeight / 2);



            window.name = 'parentWnd';
            newWindow = window.open(windowURL, windowName, 'top=' + top + ',left=' + left + ',width=' + windowWidth + ',height=' + windowHeight + ',toolbar=0,location=no,directories=0, status=0,menuBar=0,scrollBars=1,resizable=1');
            newWindow.focus();
        }
    </script>

    <script type="text/javascript">
        window.onload = function() {
            var strCook = document.cookie;
            if (strCook.indexOf("!~") != 0) {
                var intS = strCook.indexOf("!~");
                var intE = strCook.indexOf("~!");
                var strPos = strCook.substring(intS + 2, intE);
                document.getElementById("divCandidate").scrollTop = strPos;
                }
        }
        function SetDivPosition() {
            var intY = document.getElementById("divCandidate").scrollTop;
            document.title = intY;
            document.cookie = "yPos=!~" + intY + "~!";
        }
    </script>

    <script type="text/javascript">
         function calendarShown(sender, args)
        {
            sender._popupBehavior._element.style.zIndex = 100004;
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Panel ID="pnlButtons" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <table width="100%">
                                    <tr>
                                        <td style="width: 11.11%">
                                            <asp:Button ID="btnResourceRequest" runat="server" Text="Resource Req." CssClass="btnMenu" />
                                        </td>
                                        <td style="width: 11.11%">
                                            <asp:Button ID="btnReview" runat="server" Text="Review" CssClass="btnMenu" />
                                        </td>
                                        <td style="width: 11.11%">
                                            <asp:Button ID="btnExamAssigned" runat="server" CssClass="btnMenu" Text="Exam Assigned" />
                                        </td>
                                        <td style="width: 11.11%">
                                            <asp:Button ID="btnExamCompleted" runat="server" CssClass="btnMenu" Text="Exam Completed" />
                                        </td>
                                        <td style="width: 11.11%">
                                            <asp:Button ID="btnPreliminaryInterview" runat="server" CssClass="btnMenu" Text="Primary Interview" />
                                        </td>
                                        <td style="width: 11.11%">
                                            <asp:Button ID="btnPanelInterview" runat="server" CssClass="btnMenu" Text="Panel Interview" />
                                        </td>
                                        <td style="width: 11.11%">
                                            <asp:Button ID="btnPool" runat="server" CssClass="btnMenu" Text="Pool" />
                                        </td>
                                        <td style="width: 11.11%">
                                            <asp:Button ID="btnOffer" runat="server" CssClass="btnMenu" Text="Offer" />
                                        </td>
                                        <td style="width: 11.11%">
                                            <asp:Button ID="btnJoining" runat="server" CssClass="btnMenu" Text="Joining" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel ID="pnlSearchParameter" runat="server" SkinID="pnlInner" Width="100%">
                                    <table style="width: 100%;">
                                        <tr align="left">
                                            <td colspan="7">
                                                <div class="widget-title">
                                                    Search Panel<asp:ScriptManager ID="ScriptManager1" runat="server">
                                                    </asp:ScriptManager>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr align="center">
                                            <td style="width: 20px">
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
                                            <td>
                                            </td>
                                        </tr>
                                        <tr align="center">
                                            <td style="width: 20px">
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="drpRecTypeList" runat="server" CssClass="InputTxtBox" Width="200px">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="drpRegion" runat="server" CssClass="InputTxtBox" Visible="False"
                                                    Width="200px">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:DropDownCheckBoxes ID="drpBranchList" runat="server" CssClass="inputtxtbox"
                                                    Width="200px" UseSelectAllNode="false">
                                                </asp:DropDownCheckBoxes>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnSearchCandidatePool" runat="server" CssClass="styled-button-1"
                                                    Text="Search" />
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr align="left">
                                            <td>
                                            </td>
                                            <td class="Genlabel">
                                                Demand
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="lblDemand" runat="server" CssClass="Demandlabel">0</asp:LinkButton>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td class="Genlabel">
                                                Supply
                                            </td>
                                            <td>
                                                <asp:Label ID="lblSupply" runat="server" CssClass="Supplylabel">0</asp:Label>
                                            </td>
                                            <td class="Genlabel">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel ID="pnlCandidates" runat="server" SkinID="pnlInner" Width="100%">
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <div class="widget-title">
                                                    Candidates</div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div id="divCandidate" onscroll="SetDivPosition()" style="max-height: 150px; max-width: 100%;
                                                    overflow: auto">
                                                    <asp:GridView ID="grdCandidates" runat="server" AutoGenerateColumns="False" CssClass="mGrid"
                                                        EmptyDataText="No Candidate Available">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                                                        Text="Select"></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="CandidateID" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCandidateID" runat="server" Text='<%# Bind("CandidateID") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="ID" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="Rating" HeaderText="Rating" />
                                                            <asp:TemplateField HeaderText="Candidate">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCandidate" runat="server" Text='<%# Bind("Candidate") %>' Visible="false"></asp:Label>
                                                                    <asp:LinkButton ID="lnkbtnPending" runat="server" CausesValidation="False" CssClass="linkbtn"
                                                                        Font-Size="14px" OnClientClick='<%# Eval("CandidateID","openWindow(""../frmIntAssessmentInfo.aspx?CandidateID={0}"",""Popup"",1000,1100);") %>'
                                                                        Text='<%# Bind("Candidate") %>'>
                                                                    </asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                                                            <asp:BoundField DataField="Dated" HeaderText="Dated" />
                                                            <asp:BoundField DataField="Location" HeaderText="Location" />
                                                            <asp:TemplateField HeaderText="CV">
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
                        <tr>
                            <td>
                                <asp:Panel ID="pnlSelectionPanel" runat="server" SkinID="pnlInner">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td colspan="3">
                                                <div class="widget-title">
                                                    Selection Panel</div>
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
                                        <tr>
                                            <td style="width: 33.33%">
                                                <asp:Button ID="btnSelectSuitableFor" runat="server" CssClass="review" Text="Select Suitable For" />
                                            </td>
                                            <td style="width: 33.33%">
                                                <asp:Button ID="btnSelectRecommLocation" runat="server" CssClass="review" Text="Select Location" />
                                                <%--<cc1:ModalPopupExtender ID="mdpopLocation" runat="server" OkControlID="imgBtnCloseLocation"
                                                    PopupControlID="pnlModalLocation" TargetControlID="btnSelectRecommLocation">
                                                </cc1:ModalPopupExtender>--%>
                                            </td>
                                            <td style="width: 33.33%">
                                                <asp:Button ID="btnMnuIntReschedule" runat="server" CssClass="review" Text="Interveiw Reschedule" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel ID="pnlMandatoryQuestions" runat="server" SkinID="pnlInner" Width="100%">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td align="left">
                                                <table width="100%">
                                                    <tr>
                                                        <td style="width: 95%">
                                                            <div class="widgettitle">
                                                                Interview Questions
                                                            </div>
                                                        </td>
                                                        <td style="width: 5%">
                                                            <asp:ImageButton ID="imgBtnUpdateIntManQues" runat="server" Height="30px" ImageUrl="~/Sources/Icons/update.png" />
                                                        </td>
                                                    </tr>
                                                </table>
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
                                                                    <asp:TextBox ID="txtQuesAnswer" runat="server" CssClass="InputTxtBox" Width="500px"></asp:TextBox>
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
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlAssessment" runat="server" SkinID="pnlInner">
                    <table width="100%">
                        <tr>
                            <td colspan="3">
                                <div class="widget-title">
                                    Assessment</div>
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
                        <tr>
                            <td style="width: 33%">
                                <asp:Button ID="btnKnowledgeTest" runat="server" CssClass="review" Text="Knowledge Test" />
                            </td>
                            <td style="width: 33%">
                                <asp:Button ID="btnSkillTest" runat="server" CssClass="review" Text="Skill Test" />
                            </td>
                            <td style="width: 33%">
                                <asp:Button ID="btnInterview" runat="server" CssClass="review" Text="Interview" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlTestSummary" runat="server" SkinID="pnlInner">
                    <table width="100%">
                        <tr>
                            <td>
                                <div class="widget-title">
                                    Test Summary</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="grdTestSummary" runat="server" AutoGenerateColumns="False" CssClass="mGrid"
                                    EmptyDataText="No Test Found">
                                    <Columns>
                                        <asp:BoundField DataField="ExamID" HeaderText="ExamID" Visible="False" />
                                        <asp:TemplateField HeaderText="ExamRollNo">
                                            <ItemTemplate>
                                                <asp:Label ID="lblExamRollNo" runat="server" Text='<%# Bind("ExamRollNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Test">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkExamDetailsBtn" runat="server" CausesValidation="False" CssClass="linkbtn"
                                                    Font-Size="14px" OnClientClick='<%# Eval("ExamRollNo","openWindow(""../CVMan/frmShowCandidateResult.aspx?ExamRollNo={0}"",""Popup"",1000,1100);") %>'
                                                    Text='<%# Bind("Test") %>'> </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Score" HeaderText="Score" />
                                        <asp:BoundField DataField="Dated" HeaderText="Dated" />
                                        <asp:BoundField DataField="Location" HeaderText="Location" />
                                        <asp:TemplateField HeaderText="ExamTaken" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblExamTaken" runat="server" Text='<%# Bind("ExamTaken") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="IsActive" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblIsActive" runat="server" Text='<%# Bind("IsActive") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ReActive" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblExamReActivate" runat="server" Text='<%# Bind("ReActive") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action">
                                            <ItemTemplate>
                                                <div>
                                                    <asp:LinkButton ID="lnkBtnActivateExam" runat="server" CommandArgument='<%# Bind("ExamRollNo")%>'
                                                        CommandName="Activate" OnClick="grdTestSummary_SelectedIndexChanged" OnClientClick="if (!confirm('Are you Sure to Active The Exam?')) return false"
                                                        Text="Activate" />
                                                    |
                                                    <asp:LinkButton ID="lnkBtnDeactiveExam" runat="server" CommandArgument='<%# Eval("ExamRollNo")%>'
                                                        CommandName="Deactive" OnClick="grdTestSummary_SelectedIndexChanged" OnClientClick="if (!confirm('Are you Sure to Deactive The Exam?')) return false"
                                                        Text="Deactive" />
                                                    |
                                                    <asp:LinkButton ID="lnkBtnReActiveExam" runat="server" CommandArgument='<%# Eval("ExamRollNo")%>'
                                                        CommandName="ReActivate" OnClick="grdTestSummary_SelectedIndexChanged" OnClientClick="if (!confirm('Are you Sure to Re-Activate The Exam?')) return false"
                                                        Text="ReActivate" />
                                                    |
                                                    <asp:LinkButton ID="lnkBtnDeleteExam" runat="server" CommandArgument='<%# Eval("ExamRollNo")%>'
                                                        CommandName="Remove" OnClick="grdTestSummary_SelectedIndexChanged" OnClientClick="if (!confirm('Are you Sure to Delete The Exam?')) return false"
                                                        Text="Delete" />
                                                </div>
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
        <tr>
            <td>
                <asp:Panel ID="pnlInterviewerReview" runat="server" SkinID="pnlInner">
                    <asp:UpdatePanel ID="udpIntReview" runat="server">
                        <ContentTemplate>
                            <table style="width: 100%;">
                                <tr align="left">
                                    <td colspan="4">
                                        <div class="widget-title">
                                            Interviewer Panel</div>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td style="width: 20px">
                                    </td>
                                    <td class="label">
                                        &nbsp;
                                    </td>
                                    <td class="label">
                                    </td>
                                    <td class="label">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="drpInterviewer" runat="server" CssClass="InputTxtBox" Width="200px">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="reqFldInterviewer" runat="server" ControlToValidate="drpInterviewer"
                                            Display="None" ErrorMessage="Required: Select Interviewer" meta:resourceKey="reqFldMobileIMEINoResource1"
                                            ValidationGroup="AddReview"></asp:RequiredFieldValidator>
                                        <cc1:ValidatorCalloutExtender ID="reqFldInterviewer_ValidatorCalloutExtender" runat="server"
                                            CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                            TargetControlID="reqFldInterviewer" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                        </cc1:ValidatorCalloutExtender>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="drpGrading" runat="server" CssClass="InputTxtBox" Width="80px">
                                            <asp:ListItem Text="Grading" Value="0"></asp:ListItem>
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
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtInterviewerRemarks" runat="server" Width="350px" CssClass="InputTxtBox"></asp:TextBox>
                                        &nbsp;<asp:Button ID="btnAddReview" runat="server" CssClass="styled-button-1" Text="ADD"
                                            ValidationGroup="AddReview" />
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
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlHRUseOnly" runat="server" SkinID="pnlInner" Width="100%">
                    <table width="100%">
                        <tr align="left">
                            <td align="left" colspan="7">
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
                            <td style="width: 200px">
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
                                <asp:TextBox ID="txtPeriodInMonths" runat="server" CssClass="InputTxtBox" Width="120px"
                                    AutoPostBack="True"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldPeriodInMonths" runat="server" ControlToValidate="txtPeriodInMonths"
                                    ErrorMessage="Period In Month Required" ValidationGroup="HRAssessment" Display="None"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldPeriodInMonths_ValidatorCalloutExtender"
                                    runat="server" Enabled="True" TargetControlID="reqFldPeriodInMonths" CloseImageUrl="~/Sources/images/valClose.png"
                                    CssClass="customCalloutStyle" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                <asp:Button ID="btnCalculateSal" runat="server" CssClass="styled-button-1" Text="Calculate" />
                                &nbsp;<asp:Button ID="btnSendTempOffer" runat="server" CssClass="styled-button-1"
                                    Text="Send Temp. Offer" />
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
                            <td rowspan="7" valign="top">
                                <asp:GridView ID="grdSalCalc" runat="server" CssClass="mGrid" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Component">
                                            <ItemTemplate>
                                                <asp:Label ID="lblComponent" runat="server" Text='<%# Bind("Component") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("Amount") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Expected Joining Date
                            </td>
                            <td>
                                <asp:TextBox ID="txtExpectedJoiningDate" runat="server" CssClass="InputTxtBox" Width="120px"
                                    AutoPostBack="True"></asp:TextBox>
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
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldSalary" runat="server" ControlToValidate="txtSalary"
                                    Display="None" ErrorMessage="Salary Required" ValidationGroup="HRAssessment"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldSalary_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldSalary" WarningIconImageUrl="~/Sources/images/Valwarning.png">
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
                                &nbsp;
                            </td>
                            <td class="label">
                                <asp:TextBox ID="txtEffectiveDate" runat="server" CssClass="InputTxtBox" Width="120px"
                                    AutoPostBack="True" Visible="False"></asp:TextBox>
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
                                &nbsp;
                            </td>
                            <td>
                                <asp:TextBox ID="txtEffectiveTo" runat="server" CssClass="InputTxtBox" ValidationGroup="NMP"
                                    Width="120px" Visible="False"></asp:TextBox>
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
                            </td>
                            <td class="label">
                            </td>
                            <td class="label">
                                Local Conveyance
                            </td>
                            <td class="label">
                                <asp:TextBox ID="txtLocalConveyance" runat="server" CssClass="InputTxtBox" Width="120px">0</asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldObservations" runat="server" ControlToValidate="txtRemarks"
                                    Display="None" ErrorMessage="Required" ValidationGroup="HRAssessment"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldObservations_ValidatorCalloutExtender0" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldObservations" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                                <asp:RequiredFieldValidator ID="reqFldLetterFormat" runat="server" ControlToValidate="drpAppointLetterFormat"
                                    Display="None" ErrorMessage="Required" ValidationGroup="HRAssessment"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldLetterFormat_ValidatorCalloutExtender0" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldLetterFormat" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Offer Letter Format
                            </td>
                            <td>
                                <asp:DropDownList ID="drpOfferLetterFormat" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                    <asp:ListItem Text="Confirmed" Value="HROfferConfirmed"></asp:ListItem>
                                    <asp:ListItem Text="Probation" Value="HROfferProbation"></asp:ListItem>
                                    <asp:ListItem Text="MTO" Value="HROfferMTO"></asp:ListItem>
                                    <asp:ListItem Text="Contractual" Value="HROfferContractual"></asp:ListItem>
                                </asp:DropDownList>
                                <br />
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
                            <td class="label">
                                Appointment Letter Format
                            </td>
                            <td>
                                <asp:DropDownList ID="drpAppointLetterFormat" runat="server" AutoPostBack="True"
                                    CssClass="InputTxtBox" Width="200px">
                                    <asp:ListItem Value="AppointmentContract.rpt">Contractual</asp:ListItem>
                                    <asp:ListItem Value="AppointmentProbationary.rpt">Probation</asp:ListItem>
                                    <asp:ListItem Value="TraineeWithoutPayment.rpt">Intern With Out Payment</asp:ListItem>
                                    <asp:ListItem Value="TraineeWithPayment.rpt">Intern With Payment</asp:ListItem>
                                    <asp:ListItem Value="AppointmentPermanent.rpt">Permanent</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlEvaluation" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="3">
                                <div class="widget-title">
                                    Evaluation</div>
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
                        <tr>
                            <td style="width: 33%">
                                <asp:Button ID="btnAccept" runat="server" CssClass="review" Text="Accept" />
                            </td>
                            <td style="width: 33%">
                                <asp:Button ID="btnReject" runat="server" CssClass="review" Text="Reject" />
                            </td>
                            <td style="width: 33%">
                                <asp:Button ID="btnRefreshWindow" runat="server" CssClass="review" Text="Refresh" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlResReq" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="6">
                                <div class="widget-title">
                                    Resource Requirement</div>
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
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpResourceTypeList" runat="server" Width="200px" CssClass="InputTxtBox">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpULCBranch" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpNoOfResource" runat="server" CssClass="InputTxtBox" Enabled="False">
                                    <asp:ListItem Text="1 Resource" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2 Resources" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3 Resources" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4 Resources" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5 Resources" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6 Resources" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="7 Resources" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="8 Resources" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="9 Resources" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="10 Resources" Value="10"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="txtResReqRemarks" runat="server" CssClass="InputTxtBox" ValidationGroup="ResReq"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnSendResourceRequest" runat="server" CssClass="styled-button-1"
                                    Text="Send Request" ValidationGroup="ResReq" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldResReqRemarks" runat="server" ControlToValidate="txtResReqRemarks"
                                    Display="None" ErrorMessage="Required: Remarks" ValidationGroup="ResReq"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlPendingResoureceRequests" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <div class="widget-title">
                                    Pending Approval</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table width="100%">
                                    <tr>
                                        <td colspan="2">
                                            <div style="max-height: 200px; max-width: 100%; overflow: auto">
                                                <asp:GridView ID="grdPendingResourceRequests" runat="server" AutoGenerateColumns="False"
                                                    CssClass="mGrid" EmptyDataText="No Pending Resource Request">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select"
                                                                    Text="Select"></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="ResourceReqID" Visible="False">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblResourceReqID" runat="server" Text='<%# Bind("ResourceReqID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="RecruitmentType" HeaderText="Resource Type" />
                                                        <asp:BoundField DataField="Branch" HeaderText="Branch" />
                                                        <asp:BoundField DataField="ReqNoOfResource" HeaderText="No." />
                                                        <asp:BoundField DataField="Remarks" HeaderText="Remarks" />
                                                        <asp:BoundField DataField="EmployeeName" HeaderText="Requested By" />
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 50%">
                                            <asp:Button ID="btnAcceptResReq" runat="server" CssClass="review" Text="Accept" />
                                        </td>
                                        <td style="width: 50%">
                                            <asp:Button ID="btnRejectResReq" runat="server" CssClass="review" Text="Reject" />
                                        </td>
                                    </tr>
                                </table>
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
                <asp:Panel ID="pnlResReqStatus" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <div class="widget-title">
                                    Resource Request Status</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <div style="max-height: 200px; max-width: 100%; overflow: auto">
                                                <asp:GridView ID="grdResReqStatus" runat="server" AutoGenerateColumns="False" CssClass="mGrid"
                                                    EmptyDataText="No Resource Request">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="ResourceReqID" Visible="False">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblResourceReqIDStatus" runat="server" Text='<%# Bind("ResourceReqID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="RecruitmentType" HeaderText="Resource Type" />
                                                        <asp:BoundField DataField="Branch" HeaderText="Branch" />
                                                        <asp:BoundField DataField="Remarks" HeaderText="Remarks" />
                                                        <asp:BoundField DataField="RequestedBy" HeaderText="Requested By" />
                                                        <asp:BoundField DataField="RequestPeriod" HeaderText="Requested Period" />
                                                        <asp:BoundField DataField="Status" HeaderText="Status" />
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlSuitableForList" runat="server" CssClass="modalBackground" Width="650px"
                    SkinID="pnlInner">
                    <table width="100%">
                        <tr>
                            <td>
                                <div class="widgettitle">
                                    <asp:Label ID="lblCanSuiForRecType" runat="server" Text=""></asp:Label>
                                    : Suitable For Recruitment Type</div>
                            </td>
                            <td align="right">
                                <asp:ImageButton ID="imgBtnUpdateRecType" runat="server" ImageUrl="~/Sources/Icons/update.png"
                                    Height="30px" />
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
                <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="pnlSuitableForList"
                    OkControlID="imgBtnCloseSuitableFor" TargetControlID="btnSelectSuitableFor">
                </cc1:ModalPopupExtender>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlModalLocation" runat="server" CssClass="modalBackground" Width="450px"
                    SkinID="pnlInner">
                    <table width="100%">
                        <tr>
                            <td>
                                <div class="widgettitle">
                                    <asp:Label ID="lblCanSuiForLoc" runat="server" Text=""></asp:Label>
                                    : Suitable Location</div>
                            </td>
                            <td align="right">
                                <asp:ImageButton ID="imgBtnUpdateLocation" runat="server" ImageUrl="~/Sources/Icons/update.png"
                                    Height="30px" />
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
                                                    <asp:CheckBoxList ID="chkRegions" runat="server" onClientClick="__doPostBack('hidButton','OnClick');">
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
                <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" PopupControlID="pnlModalLocation"
                    OkControlID="imgBtnCloseLocation" TargetControlID="btnSelectRecommLocation">
                </cc1:ModalPopupExtender>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel runat="server" SkinID="pnlInner" ID="pnlModalAssignExams" CssClass="modalBackground"
                    Width="70%">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="udpAssExam" runat="server">
                                    <ContentTemplate>
                                        <table style="width: 100%;">
                                            <tr>
                                                <td align="left" colspan="3">
                                                    <div class="widget-title">
                                                        Assign Exam To :
                                                        <asp:Label ID="lblAssExamTo" runat="server" Text=""></asp:Label></div>
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
                                                    <asp:DropDownList runat="server" CssClass="InputTxtBox" Width="200px" ID="drpAvailableExams">
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
                                                    <asp:TextBox runat="server" CssClass="InputTxtBox" Width="200px" ID="txtExAssOtrExamsEffectiveDate"></asp:TextBox>
                                                    <cc1:CalendarExtender runat="server" Enabled="True" TargetControlID="txtExAssOtrExamsEffectiveDate"
                                                        OnClientShown="calendarShown" ID="txtExAssOtrExamsEffectiveDate_CalendarExtender">
                                                    </cc1:CalendarExtender>
                                                    &#160;<asp:RequiredFieldValidator runat="server" ControlToValidate="txtExAssOtrExamsEffectiveDate"
                                                        ErrorMessage="*" ValidationGroup="ECOEGenerateExam" ID="reqFldECOEExEffectiveDate"></asp:RequiredFieldValidator>
                                                    &#160;<asp:DropDownList runat="server" CssClass="InputTxtBox" Width="40px" ID="drpECOEHour">
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
                                                    &nbsp;<asp:DropDownList runat="server" CssClass="InputTxtBox" Width="50px" ID="drpECOEMin">
                                                        <asp:ListItem Text="00" Value="00"></asp:ListItem>
                                                        <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                                        <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                                        <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                                        <asp:ListItem Text="40" Value="40"></asp:ListItem>
                                                        <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    &#160;<asp:DropDownList runat="server" CssClass="InputTxtBox" Width="50px" ID="drpECOEAMPM">
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
                                                    <asp:DropDownList runat="server" CssClass="InputTxtBox" Width="200px" ID="drpULCBranchExamAssigned">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <asp:Button runat="server" Text="Generate" ValidationGroup="ECOEGenerateExam" CssClass="styled-button-1"
                                                        ID="btnGenerateOtherExams"></asp:Button>
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
                                                    <asp:DropDownList runat="server" AutoPostBack="True" CssClass="InputTxtBox" Width="200px"
                                                        ID="drpEntryPoint">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                </td>
                                                <td colspan="2">
                                                    <asp:GridView runat="server" CssClass="mGrid" SkinID="grdNoFooter" ID="grdExEntryPointWiseCandidate">
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="btnGenerateOtherExams" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td valign="top">
                                <asp:ImageButton ID="imgBtnCloseAssignExams" runat="server" ImageUrl="~/Sources/Icons/erase.png" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <cc1:ModalPopupExtender ID="ModalPopupExtender3" runat="server" PopupControlID="pnlModalAssignExams"
                    OkControlID="imgBtnCloseAssignExams" TargetControlID="btnKnowledgeTest">
                </cc1:ModalPopupExtender>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlModalPutTestScore" runat="server" Width="70%" SkinID="pnlInner"
                    CssClass="modalBackground">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" colspan="5">
                                <div class="widget-title">
                                    External Test Score For:
                                    <asp:Label ID="lblAssExtTestScoreToCan" runat="server" Text=""></asp:Label>
                                </div>
                            </td>
                            <td align="right">
                                <asp:ImageButton ID="imgBtnCloseExternalTestScore" runat="server" ImageUrl="~/Sources/Icons/erase.png" />
                            </td>
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
                                <td>
                                    &nbsp;
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
                                        OnClientShown="calendarShown" TargetControlID="txtExamTakenOn">
                                    </cc1:CalendarExtender>
                                    &nbsp;<asp:RequiredFieldValidator ID="reqFldExamTakenOn" runat="server" ControlToValidate="txtExamTakenOn"
                                        Display="None" ErrorMessage="Required : Exam Taken On" ValidationGroup="ExtTestScore"></asp:RequiredFieldValidator>
                                    <cc1:ValidatorCalloutExtender ID="reqFldExamTakenOn_ValidatorCalloutExtender" runat="server"
                                        CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                        TargetControlID="reqFldExamTakenOn" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                                </td>
                                <td>
                                    &nbsp;
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
                                    <asp:DropDownList ID="drpGradingExScore" runat="server" CssClass="InputTxtBox" Width="200px">
                                        <asp:ListItem>Fail</asp:ListItem>
                                        <asp:ListItem>Close Fail</asp:ListItem>
                                        <asp:ListItem>Satisfactory</asp:ListItem>
                                        <asp:ListItem>Average</asp:ListItem>
                                        <asp:ListItem>Very Good</asp:ListItem>
                                        <asp:ListItem>Excellent
                                        </asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                </td>
                                <td class="label">
                                    Remarks
                                </td>
                                <td>
                                    <asp:TextBox ID="txtRemarksExScore" runat="server" CssClass="InputTxtBox" Height="50px"
                                        TextMode="MultiLine" Width="200px"></asp:TextBox>
                                </td>
                                <td class="label">
                                    Attachment
                                </td>
                                <td>
                                    <asp:FileUpload ID="flupAttachment" runat="server" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                </td>
                                <td class="label">
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="reqFldRemarks" runat="server" ControlToValidate="txtRemarksExScore"
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
                                <td>
                                    &nbsp;
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
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                </td>
                                <td class="label">
                                </td>
                                <td>
                                </td>
                                <td class="label">
                                </td>
                                <td>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr align="left">
                                <td colspan="5">
                                    <asp:GridView ID="grdTestScoreOfUsers" runat="server" AutoGenerateColumns="False"
                                        CssClass="mGrid" EmptyDataText="No Test Score Available">
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
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </tr>
                    </table>
                </asp:Panel>
                <cc1:ModalPopupExtender ID="ModalPopupExtender4" runat="server" PopupControlID="pnlModalPutTestScore"
                    OkControlID="imgBtnCloseExternalTestScore" TargetControlID="btnSkillTest">
                </cc1:ModalPopupExtender>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlModalAssignInterview" runat="server" SkinID="pnlInner" CssClass="modalBackground"
                    Width="70%">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" colspan="3">
                                <div class="widget-title">
                                    Assign Interview To :
                                    <asp:Label ID="lblAssIntToCan" runat="server" Text=""></asp:Label></div>
                            </td>
                            <td align="right">
                                <asp:ImageButton ID="imgBtnCloseAssInt" runat="server" ImageUrl="~/Sources/Icons/erase.png" />
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
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Interview Panel
                            </td>
                            <td>
                                <asp:DropDownList ID="drpIntTeamList" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                                &#160;&#160;<asp:RequiredFieldValidator ID="reqFldExAvailableIntTeamList" runat="server"
                                    ControlToValidate="drpIntTeamList" ErrorMessage="*" ValidationGroup="IntExPnlAssignment"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;
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
                                    ID="CalendarExtender1" runat="server" Enabled="True" TargetControlID="txtExInterviewDate"
                                    OnClientShown="calendarShown">
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
                                    </asp:DropDownList>
                                &nbsp;<asp:DropDownList ID="drpECOEIMin" runat="server" CssClass="InputTxtBox" Width="50px">
                                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                    <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                    <asp:ListItem Text="40" Value="40"></asp:ListItem>
                                    <asp:ListItem Text="50" Value="50"></asp:ListItem>
                                </asp:DropDownList>
                                &#160;<asp:DropDownList ID="drpECOEIAMPM" runat="server" CssClass="InputTxtBox" Width="50px">
                                    <asp:ListItem Text="AM" Value="AM"></asp:ListItem>
                                    <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Select Branch
                            </td>
                            <td>
                                <asp:DropDownList runat="server" CssClass="InputTxtBox" Width="200px" ID="drpULCBranchListIntAss">
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnExIntAssInterview" runat="server" CssClass="styled-button-1" Text="Assign"
                                    ValidationGroup="IntExPnlAssignment" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <cc1:ModalPopupExtender ID="ModalPopupExtender5" runat="server" PopupControlID="pnlModalAssignInterview"
                    OkControlID="imgBtnCloseAssInt" TargetControlID="btnInterview">
                </cc1:ModalPopupExtender>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlCanRejection" runat="server" SkinID="pnlInner" Width="400px" CssClass="modalBackground"
                    Style="">
                    <table width="100%">
                        <tr>
                            <td colspan="2">
                                <div class="widgettitle">
                                    Candidate Rejection</div>
                            </td>
                            <td align="right">
                                <asp:ImageButton ID="imgBtnCloseRejection" runat="server" ImageUrl="~/Sources/Icons/erase.png" />
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label">
                                Rejection Remarks
                            </td>
                            <td>
                                <asp:TextBox ID="txtRejectionRemarks" runat="server" Width="200px" CssClass="inputtxtbox"
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
                <cc1:ModalPopupExtender ID="mpe" runat="server" PopupControlID="pnlCanRejection"
                    TargetControlID="btnReject" CancelControlID="imgBtnCloseRejection">
                </cc1:ModalPopupExtender>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlResReqRejection" runat="server" SkinID="pnlInner" Width="600px"
                    CssClass="modalBackground" Style="">
                    <table width="100%">
                        <tr>
                            <td colspan="2">
                                <div class="widgettitle">
                                    Resource Request Rejection</div>
                            </td>
                            <td align="right">
                                <asp:ImageButton ID="imgResReqRejection" runat="server" ImageUrl="~/Sources/Icons/erase.png" />
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label">
                                Rejection Remarks
                            </td>
                            <td>
                                <asp:TextBox ID="txtResReqRejectionRemarks" runat="server" Width="200px" CssClass="inputtxtbox"
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:RequiredFieldValidator ID="reqFldResReqRejectionRemarks" runat="server" ControlToValidate="txtResReqRejectionRemarks"
                                    Display="None" ErrorMessage="Required: Rejection Remarks" ValidationGroup="ResRejection"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                    CssClass="customCalloutStyle" TargetControlID="reqFldResReqRejectionRemarks"
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="3" align="center">
                                <asp:Button ID="btnResReqRejectionModal" runat="server" Text="Reject" CssClass="styled-button-1"
                                    ValidationGroup="ResRejection" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <cc1:ModalPopupExtender ID="mpeResReqRejection" runat="server" PopupControlID="pnlResReqRejection"
                    TargetControlID="btnRejectResReq" CancelControlID="imgResReqRejection">
                </cc1:ModalPopupExtender>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlModalIntReschedule" runat="server" SkinID="pnlInner" Width="60%"
                    CssClass="modalBackground" Style="">
                    <table width="100%">
                        <tr>
                            <td colspan="3">
                                <div class="widgettitle">
                                    Interview Reschedule</div>
                            </td>
                            <td align="right" style="margin-left: 40px">
                                <asp:ImageButton ID="imgBtnCloseIntReschedule" runat="server" ImageUrl="~/Sources/Icons/erase.png" />
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                                &nbsp;
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td>
                                <asp:HiddenField ID="hdFldIntCandidateID" runat="server" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label">
                                &nbsp;
                            </td>
                            <td class="label">
                                Previous Schedule Date
                            </td>
                            <td>
                                <asp:Label ID="lblPrevScheduleDate" runat="server" CssClass="label"></asp:Label>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label">
                                &nbsp;
                            </td>
                            <td class="label">
                                Interview Panel
                            </td>
                            <td>
                                <asp:DropDownList ID="drpAvailableIntTeamList" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label">
                                &nbsp;
                            </td>
                            <td class="label">
                                New Interview Date&nbsp;
                            </td>
                            <td>
                                <asp:TextBox ID="txtNewInterviewDate" runat="server" CssClass="InputTxtBox" 
                                    Width="100px" ValidationGroup="IntReschedule"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtNewInterviewDate_CalendarExtender" runat="server" Enabled="True"
                                    OnClientShown="calendarShown" TargetControlID="txtNewInterviewDate">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:DropDownList ID="drpSHour" runat="server" CssClass="InputTxtBox" Width="40px">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>11</asp:ListItem>
                                    <asp:ListItem>12</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;<asp:DropDownList ID="drpSMin" runat="server" CssClass="InputTxtBox" Width="50px">
                                    <asp:ListItem>00</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;<asp:DropDownList ID="drpSAMPM" runat="server" CssClass="InputTxtBox" Width="50px">
                                    <asp:ListItem>AM</asp:ListItem>
                                    <asp:ListItem>PM</asp:ListItem>
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
                                <asp:RequiredFieldValidator ID="reqFldNewIntDate" runat="server" ControlToValidate="txtNewInterviewDate"
                                    Display="None" ErrorMessage="New Interview Date Required" ValidationGroup="IntReschedule"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldNewIntDate_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldNewIntDate" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td colspan="3">
                                <asp:CompareValidator ID="dateValidatorInterviewDate" runat="server" ControlToValidate="txtNewInterviewDate"
                                    ErrorMessage="Invalid Date" Operator="DataTypeCheck" Type="Date" ValidationGroup="IntReschedule"></asp:CompareValidator>
                                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                    CssClass="customCalloutStyle" TargetControlID="reqFldRejectionRemarks" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="center">
                            <td align="center">
                                &nbsp;
                            </td>
                            <td align="center" colspan="3">
                                <asp:Button ID="btnRescheduleInterview" runat="server" CssClass="styled-button-1"
                                    Text="Interview Reschedule" ValidationGroup="IntReschedule" />
                            </td>
                        </tr>
                        <tr align="center">
                            <td align="center">
                                &nbsp;
                            </td>
                            <td align="center" colspan="3">
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <cc1:ModalPopupExtender ID="ModalPopupExtender6" runat="server" PopupControlID="pnlModalIntReschedule"
                    TargetControlID="btnMnuIntReschedule" CancelControlID="imgBtnCloseIntReschedule">
                </cc1:ModalPopupExtender>
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript">
        $(document).ready(function(){
            var elem = document.getElementById('<%=grdCandidates.ClientID%>');
            $(elem).tablesorter();
         }); 
    </script>

</asp:Content>
