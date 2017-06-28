<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmTrainingnTesting.aspx.vb" Inherits="frmTrainingnTesting"
    Title=".:HRS:Training & Testing:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Sources/css/ReqProcess.css" rel="stylesheet" type="text/css" />

    <script src="Sources/js/jquery-1.10.2.js" type="text/javascript"></script>

    <script src="Sources/js/jquery.ui.core.min.js" type="text/javascript"></script>

    <script src="Sources/js/jquery.tablesorter.min.js" type="text/javascript"></script>

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
                <table width="100%" style="border: 1px">
                    <tr>
                        <td style="width: 25.00%">
                            <asp:Button ID="btnAdmininistration" runat="server" Text="Administration" CssClass="btnMenu" />
                        </td>
                        <td style="width: 25.00%">
                            <asp:Button ID="btnQuestionBank" runat="server" Text="Question Bank" CssClass="btnMenu" />
                        </td>
                        <td style="width: 25.00%">
                            <asp:Button ID="btnTestDesign" runat="server" CssClass="btnMenu" Text="Test Design" />
                        </td>
                        <td style="width: 25.00%">
                            <asp:Button ID="btnAssign" runat="server" CssClass="btnMenu" Text="Assign" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlSubjectDefinition" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="6" align="left">
                                <div class="widgettitle">
                                    Subject Definition<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 200px">
                                <asp:RequiredFieldValidator ID="reqFldSubjectName" runat="server" ControlToValidate="txtSubjectName"
                                    Display="None" ErrorMessage="Required:Subject Name" ValidationGroup="AddSubjects"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldSubjectName_ValidatorCalloutExtender0" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldSubjectName" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td style="width: 200px">
                                <asp:RequiredFieldValidator ID="reqFldSubjectCode" runat="server" ControlToValidate="txtSubjectCode"
                                    Display="None" ErrorMessage="Required:Subject Code" ValidationGroup="AddSubjects"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldSubjectCode_ValidatorCalloutExtender0" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldSubjectCode" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtSubjectName" runat="server" CssClass="InputTxtBox" Width="200px"
                                    placeholder="Subject"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtSubjectCode" runat="server" CssClass="InputTxtBox" Width="100px"
                                    placeholder="Subject Code"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnInsertSubjects" runat="server" CssClass="review" Text="Insert"
                                    ValidationGroup="AddSubjects" />
                            </td>
                            <td>
                                <asp:DropDownList ID="drpAvailableSubjects" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
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
                <asp:Panel ID="pnlGradingSystemType" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="4" align="left">
                                <div class="widgettitle">
                                    Define Grading System</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 200px">
                                <asp:RequiredFieldValidator ID="reqFldGradSysType" runat="server" ControlToValidate="txtGradingSystemType"
                                    Display="None" ErrorMessage="Required" ValidationGroup="GradSysType"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldGradSysType_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldGradSysType" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtGradingSystemType" runat="server" CssClass="InputTxtBox" Width="200px"
                                    placeholder="Grading System Type"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnInsertGradingSystemType" runat="server" CssClass="review" Text="Insert"
                                    ValidationGroup="GradSysType" />
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
                <asp:Panel ID="pnlCustomizedGrading" runat="server" SkinID="pnlInner" Width="100%">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td style="width: 200px">
                                <%--   <cc1:MaskedEditValidator ID="MskEdtValPercentageFrom" runat="server" ControlExtender="MskEdtPercentageFrom"
                                    ControlToValidate="txtPercentageFrom" EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers"
                                    IsValidEmpty="false" MaximumValue="100" MaximumValueMessage=" &lt; 101" MinimumValue="0"
                                    MinimumValueMessage=" &gt; -1" ToolTip="Enter values from 0 to 10" ValidationGroup="AddGrading">
&nbsp;&nbsp;
                                </cc1:MaskedEditValidator>--%>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldGradingExplanation" runat="server" ControlToValidate="txtGradeExplanation"
                                    ErrorMessage="*" ValidationGroup="AddGrading"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="reqFldGradePoint" runat="server" ControlToValidate="drpGradePoint"
                                    ErrorMessage="*" ValidationGroup="AddGrading"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="reqFldLetterGrade" runat="server" ControlToValidate="txtLetterGrade"
                                    ErrorMessage="*" ValidationGroup="AddGrading"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="reqFldPercentageFrom" runat="server" ControlToValidate="txtPercentageFrom"
                                    ErrorMessage="*" ValidationGroup="AddGrading"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpGradSysType" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="txtLetterGrade" runat="server" autocomplete="off" CssClass="InputTxtBox"
                                    Font-Names="Tahoma" Height="20px" placeholder="Letter Grade" Width="80px" />
                            </td>
                            <td>
                                <cc1:AutoCompleteExtender ID="atoComLetterGrade" runat="server" BehaviorID="AutoCompleteEx"
                                    CompletionInterval="0" CompletionListCssClass="autocomplete_completionListElement"
                                    CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem" CompletionListItemCssClass="autocomplete_listItem"
                                    CompletionSetCount="20" DelimiterCharacters=";, :" EnableCaching="true" MinimumPrefixLength="1"
                                    ServiceMethod="GetCompletionList" ServicePath="AutoComplete.asmx" ShowOnlyCurrentWordInCompletionListItem="true"
                                    TargetControlID="txtLetterGrade">
                                    <Animations>
                                            <OnShow>
                                                <Sequence>
                                                    <%-- Make the completion list transparent and then show it --%>
                                                    <OpacityAction Opacity="0" />
                                                    <HideAction Visible="true" />
                                                    
                                                    <%--Cache the original size of the completion list the first time
                                                        the animation is played and then set it to zero --%>
                                                    <ScriptAction Script="
                                                        // Cache the size and setup the initial size
                                                        var behavior = $find('AutoCompleteEx');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />
                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                    </Animations>
                                </cc1:AutoCompleteExtender>
                                <asp:DropDownList ID="drpGradePoint" runat="server" CssClass="InputTxtBox" Width="80px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPercentageFrom" runat="server" CssClass="InputTxtBox" Width="80px"
                                    placeholder="From %"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPercentageTo" runat="server" CssClass="InputTxtBox" placeholder="To %"
                                    Width="80px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MskEdtPercentageTo" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="999" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtPercentageTo" />
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtGradeExplanation" runat="server" CssClass="InputTxtBox" placeholder="Explanation"
                                    Width="200px">N\A</asp:TextBox>
                            </td>
                            <td align="left">
                                <asp:Button ID="btnAddGrade" runat="server" CssClass="reveiw" Text="ADD" ValidationGroup="AddGrading" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td colspan="4">
                                <asp:GridView ID="grdExamWiseGradingSystem" runat="server" AutoGenerateColumns="False"
                                    CssClass="mGrid" DataKeyNames="LetterGrade" EmptyDataText="No Data Available">
                                    <Columns>
                                        <asp:TemplateField HeaderText="SL">
                                            <ItemTemplate>
                                                <font style="font-size: 12px"><b>
                                                    <%#CType(Container, GridViewRow).RowIndex + 1%></b> </font>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="FromPercentage">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFromPercentage" runat="server" Text='<%# Bind("FromPercentage") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ToPercentage">
                                            <ItemTemplate>
                                                <asp:Label ID="lblToPercentage" runat="server" Text='<%# Bind("ToPercentage") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="LetterGrade">
                                            <ItemTemplate>
                                                <asp:Label ID="lblLetterGrade" runat="server" Text='<%# Bind("LetterGrade") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="GradePoint">
                                            <ItemTemplate>
                                                <asp:Label ID="lblGradePoint" runat="server" Text='<%# Bind("GradePoint") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="GradingExplanation">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("GradingExplanation") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkBtnDelete" runat="server" CausesValidation="False" CommandName="Delete"
                                                    CssClass="linkbtn" OnClientClick="if (!confirm('Are you Sure to Delete ?')) return false"
                                                    Text="Delete"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnSubmit" runat="server" CssClass="review" OnClientClick="if (!confirm('Are you Sure to Submit ?')) return false"
                                    Text="Submit" />
                            </td>
                            <td>
                                <asp:Button ID="btnCancelGradingSystemEntry" runat="server" CssClass="review" Text="Cancel" />
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
                <asp:Panel ID="pnlTrainingSettings" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td class="label" colspan="7">
                                <div class="widgettitle">
                                    Training Subject</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 200px">
                                <asp:RequiredFieldValidator ID="reqFldTrainingSubject" runat="server" ControlToValidate="txtTrngSubject"
                                    Display="None" ErrorMessage="Required" ValidationGroup="AddTrngSubject"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldTrainingSubject_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldTrainingSubject" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td style="width: 200px">
                                <asp:RequiredFieldValidator ID="reqFldSubjectDescription" runat="server" ControlToValidate="txtTrngDescription"
                                    Display="None" ErrorMessage="Required" ValidationGroup="AddTrngSubject"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldSubjectDescription_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldSubjectDescription" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldSubjectObjectives" runat="server" ControlToValidate="txtTrngObjectives"
                                    Display="None" ErrorMessage="Required" ValidationGroup="AddTrngSubject"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldSubjectObjectives_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldSubjectObjectives" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtTrngSubject" runat="server" CssClass="InputTxtBox" placeholder="Training Subject"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtTrngDescription" runat="server" CssClass="InputTxtBox" placeholder="Description"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtTrngObjectives" runat="server" CssClass="InputTxtBox" placeholder="Training Objectives"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnAddSubject" runat="server" CssClass="review" Text="ADD" ValidationGroup="AddTrngSubject" />
                            </td>
                            <td>
                                <asp:Button ID="btnCancel" runat="server" CssClass="review" Text="Cancel" />
                            </td>
                            <td>
                                <asp:DropDownList ID="drpAvailableTrngSubject" runat="server" AutoPostBack="True"
                                    CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlTrainingTopic" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td class="label" colspan="7">
                                <div class="widgettitle">
                                    Training Topic</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlTrainingSubject" runat="server" CssClass="InputTxtBox" Width="200px"
                                    AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="txtTrainingTopic" runat="server" CssClass="InputTxtBox" Width="200px"
                                    placeholder="Training Topic"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnTrainingTopic" runat="server" CssClass="review" Text="ADD" ValidationGroup="AddTrainingTopic" />
                            </td>
                            <td>
                                <asp:Button ID="btnTrainingCancel" runat="server" CssClass="review" Text="Cancel" />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldTrainingTopic" runat="server" ControlToValidate="txtTrainingTopic"
                                    Display="None" ErrorMessage="Required" ValidationGroup="AddTrainingTopic"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldTrainingTopic_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldTrainingTopic" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlTrngTopic" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlTrainingLevel" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td class="label" colspan="6">
                                <div class="widgettitle">
                                    Training Level</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td style="width: 200px">
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
                                <asp:TextBox ID="txtTrainingType" runat="server" CssClass="InputTxtBox" Width="200px"
                                    placeholder="Training Type"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnAddTrainingType" runat="server" CssClass="review" Text="ADD" ValidationGroup="AddTrainingType" />
                            </td>
                            <td>
                                <asp:Button ID="btnCancelTrainingType" runat="server" CssClass="review" Text="Cancel" />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldTrainingType" runat="server" ControlToValidate="txtTrainingType"
                                    Display="None" ErrorMessage="Required" ValidationGroup="AddTrainingType"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldTrainingType_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldTrainingType" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpAvailableTrainingType" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlCourseLevel" runat="server" SkinID="pnlInner" Width="100%">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td align="left" class="label" colspan="6">
                                <div class="widgettitle">
                                    Course Level</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td style="width: 200px">
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
                                <asp:TextBox ID="txtCourseLevel" runat="server" CssClass="InputTxtBox" placeholder="Course Level"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnAddCourseLevel" runat="server" CssClass="review" Text="ADD" ValidationGroup="AddCourseLevel" />
                            </td>
                            <td>
                                <asp:Button ID="btnCancelCourseLevel" runat="server" CssClass="review" Text="Cancel" />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldCourseLevel" runat="server" ControlToValidate="txtCourseLevel"
                                    Display="None" ErrorMessage="Required" ValidationGroup="AddCourseLevel"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldCourseLevel_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldCourseLevel" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpAvailableCourseLevel" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlCreateQuestion" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="7">
                                <div class="widget-title">
                                    Question Definition</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 200px">
                                <asp:DropDownList ID="drpSubjectListForQuesDef" runat="server" AutoPostBack="True"
                                    CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td style="width: 200px">
                                <asp:TextBox ID="txtSequenceNo" runat="server" CssClass="InputTxtBox" Enabled="False"
                                    Width="100px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblNoOfActiveQuestionsDef" runat="server" CssClass="label" ForeColor="#009900"></asp:Label>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:Label ID="lblNoOfInactiveQuestionsDef" runat="server" CssClass="label" ForeColor="#CC0000"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtQuestion" runat="server" CssClass="InputTxtBox" Height="40px"
                                    placeholder="Question" TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                                <asp:FileUpload ID="flUploadQuestionImage" runat="server" CssClass="InputTxtBox"
                                    placeholder="Select Image For The Question" />
                            </td>
                            <td align="left">
                                <asp:CheckBox ID="chkHasPartialMarking" runat="server" AutoPostBack="True" CssClass="chkText"
                                    Text=" Has Partial Marking" />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldQuestion" runat="server" ControlToValidate="txtQuestion"
                                    ErrorMessage="*" ValidationGroup="SubmitQuestion"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="reqFldAnswerOption_A" runat="server" ControlToValidate="txtAnswerOption_A"
                                    ErrorMessage="*" ValidationGroup="SubmitQuestion"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="reqFldAnswerOption_C" runat="server" ControlToValidate="txtAnswerOption_C"
                                    ErrorMessage="*" ValidationGroup="SubmitQuestion"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="reqFldAnswerOption_E" runat="server" ControlToValidate="txtAnswerOption_E"
                                    ErrorMessage="*" ValidationGroup="SubmitQuestion"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAnswerOption_A" runat="server" CssClass="InputTxtBox" placeholder="Option (A)"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                                <asp:FileUpload ID="flUploadAnswerOption_A_Image" runat="server" CssClass="InputTxtBox" />
                                &nbsp;
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpOptA_Partial" runat="server" CssClass="InputTxtBox">
                                    <asp:ListItem Value="0">0%</asp:ListItem>
                                    <asp:ListItem Value="10">10%</asp:ListItem>
                                    <asp:ListItem Value="20">20%</asp:ListItem>
                                    <asp:ListItem Value="30">30%</asp:ListItem>
                                    <asp:ListItem Value="40">40%</asp:ListItem>
                                    <asp:ListItem Value="50">50%</asp:ListItem>
                                    <asp:ListItem Value="60">60%</asp:ListItem>
                                    <asp:ListItem Value="70">70%</asp:ListItem>
                                    <asp:ListItem Value="80">80%</asp:ListItem>
                                    <asp:ListItem Value="90">90%</asp:ListItem>
                                    <asp:ListItem Value="100">100%</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAnswerOption_B" runat="server" CssClass="InputTxtBox" placeholder="Option (B)"
                                    Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFldAnswerOption_B" runat="server" ControlToValidate="txtAnswerOption_B"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:FileUpload ID="flUploadAnswerOption_B_Image" runat="server" CssClass="InputTxtBox" />
                            </td>
                            <td>
                                <asp:DropDownList ID="drpOptB_Partial" runat="server" CssClass="InputTxtBox">
                                    <asp:ListItem Value="0">0%</asp:ListItem>
                                    <asp:ListItem Value="10">10%</asp:ListItem>
                                    <asp:ListItem Value="20">20%</asp:ListItem>
                                    <asp:ListItem Value="30">30%</asp:ListItem>
                                    <asp:ListItem Value="40">40%</asp:ListItem>
                                    <asp:ListItem Value="50">50%</asp:ListItem>
                                    <asp:ListItem Value="60">60%</asp:ListItem>
                                    <asp:ListItem Value="70">70%</asp:ListItem>
                                    <asp:ListItem Value="80">80%</asp:ListItem>
                                    <asp:ListItem Value="90">90%</asp:ListItem>
                                    <asp:ListItem Value="100">100%</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAnswerOption_C" runat="server" CssClass="InputTxtBox" placeholder="Option (C)"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:FileUpload ID="flUploadAnswerOption_C_Image" runat="server" CssClass="InputTxtBox" />
                                &nbsp;
                            </td>
                            <td>
                                <asp:DropDownList ID="drpOptC_Partial" runat="server" CssClass="InputTxtBox">
                                    <asp:ListItem Value="0">0%</asp:ListItem>
                                    <asp:ListItem Value="10">10%</asp:ListItem>
                                    <asp:ListItem Value="20">20%</asp:ListItem>
                                    <asp:ListItem Value="30">30%</asp:ListItem>
                                    <asp:ListItem Value="40">40%</asp:ListItem>
                                    <asp:ListItem Value="50">50%</asp:ListItem>
                                    <asp:ListItem Value="60">60%</asp:ListItem>
                                    <asp:ListItem Value="70">70%</asp:ListItem>
                                    <asp:ListItem Value="80">80%</asp:ListItem>
                                    <asp:ListItem Value="90">90%</asp:ListItem>
                                    <asp:ListItem Value="100">100%</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAnswerOption_D" runat="server" CssClass="InputTxtBox" placeholder="Option (D)"
                                    Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFldAnswerOption_D" runat="server" ControlToValidate="txtAnswerOption_D"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:FileUpload ID="flUploadAnswerOption_D_Image" runat="server" CssClass="InputTxtBox" />
                            </td>
                            <td>
                                <asp:DropDownList ID="drpOptD_Partial" runat="server" CssClass="InputTxtBox">
                                    <asp:ListItem Value="0">0%</asp:ListItem>
                                    <asp:ListItem Value="10">10%</asp:ListItem>
                                    <asp:ListItem Value="20">20%</asp:ListItem>
                                    <asp:ListItem Value="30">30%</asp:ListItem>
                                    <asp:ListItem Value="40">40%</asp:ListItem>
                                    <asp:ListItem Value="50">50%</asp:ListItem>
                                    <asp:ListItem Value="60">60%</asp:ListItem>
                                    <asp:ListItem Value="70">70%</asp:ListItem>
                                    <asp:ListItem Value="80">80%</asp:ListItem>
                                    <asp:ListItem Value="90">90%</asp:ListItem>
                                    <asp:ListItem Value="100">100%</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAnswerOption_E" runat="server" CssClass="InputTxtBox" placeholder="Option (E)"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:FileUpload ID="flUploadAnswerOption_E_Image" runat="server" CssClass="InputTxtBox" />
                                &nbsp;
                            </td>
                            <td>
                                <asp:DropDownList ID="drpOptE_Partial" runat="server" CssClass="InputTxtBox">
                                    <asp:ListItem Value="0">0%</asp:ListItem>
                                    <asp:ListItem Value="10">10%</asp:ListItem>
                                    <asp:ListItem Value="20">20%</asp:ListItem>
                                    <asp:ListItem Value="30">30%</asp:ListItem>
                                    <asp:ListItem Value="40">40%</asp:ListItem>
                                    <asp:ListItem Value="50">50%</asp:ListItem>
                                    <asp:ListItem Value="60">60%</asp:ListItem>
                                    <asp:ListItem Value="70">70%</asp:ListItem>
                                    <asp:ListItem Value="80">80%</asp:ListItem>
                                    <asp:ListItem Value="90">90%</asp:ListItem>
                                    <asp:ListItem Value="100">100%</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpCorrectAnswer" runat="server" CssClass="InputTxtBox" Width="50px">
                                    <asp:ListItem>A</asp:ListItem>
                                    <asp:ListItem>B</asp:ListItem>
                                    <asp:ListItem>C</asp:ListItem>
                                    <asp:ListItem>D</asp:ListItem>
                                    <asp:ListItem>E</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAnswerExplanation" runat="server" CssClass="InputTxtBox" placeholder="Answer Explanation"
                                    Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFldAnswerExplanation" runat="server" ControlToValidate="txtAnswerExplanation"
                                    ErrorMessage="*" ValidationGroup="SubmitQuestion"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpDifficultyLevel0" runat="server" CssClass="InputTxtBox"
                                    Width="50px">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                                <asp:CheckBox ID="chkIsActive" runat="server" CssClass="label" Text="(Check If Active)" />
                            </td>
                            <td>
                                <asp:Button ID="btnSubmitQuestion" runat="server" CssClass="review" Text="Add Question"
                                    ValidationGroup="SubmitQuestion" />
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnCancelQuestionAdd" runat="server" CssClass="review" Text="Cancel" />
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
                <asp:Panel ID="pnlAvailableQuestions" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td>
                                <div class="widgettitle">
                                    Available Question</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <div id="divgrd" onscroll="SetDivPosition()" style="max-height: 200px; max-width: 100%;
                                    overflow: auto">
                                    <asp:GridView ID="grdAvailableQuestions" runat="server" AutoGenerateColumns="False"
                                        EmptyDataText="No Question Available" CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="View" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkBtnViewQuestion" runat="server" CausesValidation="False" CommandName="Select"
                                                        OnClientClick='<%# Eval("QuestionID","openWindow(""frmViewQuestion.aspx?QuestionID={0}"",""Popup"",800,800);") %>'
                                                        Text="View" CssClass="linkbtn"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Edit" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkBtnEditQuestion" runat="server" CausesValidation="False" CommandName="Select"
                                                        OnClientClick='<%# Eval("QuestionID","openWindow(""frmEditQuestion.aspx?QuestionID={0}"",""Popup"",800,800);") %>'
                                                        Text="Edit" CssClass="linkbtn"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sl">
                                                <ItemTemplate>
                                                    <font style="font-size: 12px">
                                                        <%#CType(Container, GridViewRow).RowIndex + 1%>
                                                    </font>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="QuestionID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("QuestionID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Question">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Question") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="IsActive">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("IsActive") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DifficultyLevel">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("DifficultyLevel") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="EntryDate">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("EntryDate") %>'></asp:Label>
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
                <asp:Panel ID="pnlExamDefinition" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" class="label" colspan="6">
                                <div class="widgettitle">
                                    Exam Definition</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td style="width: 200px">
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
                                <asp:DropDownList ID="drpAvailableExams" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldNameOfTheExam" runat="server" ControlToValidate="txtExamName"
                                    ErrorMessage="*" ValidationGroup="SubmitExamDef"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="reqFldExamCode" runat="server" ControlToValidate="txtExamCode"
                                    ErrorMessage="*" ValidationGroup="SubmitExamDef">
                                </asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="reqFldPositiveMarkingPerQuestion" runat="server"
                                    ControlToValidate="txtPositiveMarkingPerQuestion" ErrorMessage="*" ValidationGroup="SubmitExamDef">
                                </asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="reqFldNegativeMarkingPerQuestion" runat="server"
                                    ControlToValidate="txtNegativeMarkingPerQuestion" ErrorMessage="*" ValidationGroup="SubmitExamDef">
                                </asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="reqFldSkipMarkingPerQuestion" runat="server" ControlToValidate="txtSkipMarkingPerQuestion"
                                    ErrorMessage="*" ValidationGroup="SubmitExamDef">
                                </asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="reqFldNotAnsweredMarkingPerQuestion" runat="server"
                                    ControlToValidate="txtNotAnsweredPerQuestion" ErrorMessage="*" ValidationGroup="SubmitExamDef">
                                </asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <%-- <cc1:MaskedEditValidator ID="MskEdtValSkipMarkingPerQuestion" runat="server" ControlExtender="MskEdtSkipMarkingPerQuestion"
                                    ControlToValidate="txtSkipMarkingPerQuestion" EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers"
                                    IsValidEmpty="false" MaximumValue="10" MaximumValueMessage=" &lt; 11" MinimumValue="0"
                                    MinimumValueMessage=" &gt; -1" ToolTip="Enter values from 0 to 10" ValidationGroup="SubmitExamDef">
                                </cc1:MaskedEditValidator>
                                <cc1:MaskedEditValidator ID="MskEdtValNotAnsweredPerQuestion" runat="server" ControlExtender="MskEdtSkipMarkingPerQuestion"
                                    ControlToValidate="txtNotAnsweredPerQuestion" EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers"
                                    IsValidEmpty="false" MaximumValue="10" MaximumValueMessage=" &lt; 11" MinimumValue="0"
                                    MinimumValueMessage=" &gt; -1" ToolTip="Enter values from 0 to 10" ValidationGroup="SubmitExamDef">
                                </cc1:MaskedEditValidator>
                                <cc1:MaskedEditValidator ID="MskEdtValNegativeMarkingPerQuestion" runat="server"
                                    ControlExtender="MskEdtNegativeMarkingPerQuestion" ControlToValidate="txtNegativeMarkingPerQuestion"
                                    EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers" IsValidEmpty="false"
                                    MaximumValue="10" MaximumValueMessage=" &lt; 11" MinimumValue="0" MinimumValueMessage=" &gt; -1"
                                    ToolTip="Enter values from 0 to 10" ValidationGroup="SubmitExamDef">
                                </cc1:MaskedEditValidator>
                                <cc1:MaskedEditValidator ID="MskEdtValPositiveMarkingPerQuestion" runat="server"
                                    ControlExtender="MskEdtPositiveMarkingPerQuestion" ControlToValidate="txtPositiveMarkingPerQuestion"
                                    EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers" IsValidEmpty="false"
                                    MaximumValue="10" MaximumValueMessage=" &lt; 11" MinimumValue="0" MinimumValueMessage=" &gt; -1"
                                    ToolTip="Enter values from 0 to 10" ValidationGroup="SubmitExamDef">
                                </cc1:MaskedEditValidator>--%>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldTotalNoOfQuestion" runat="server" ControlToValidate="txtTotalNoOfQuestion"
                                    ErrorMessage="*" ValidationGroup="SubmitExamDef">
                                </asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="reqFldTotalmarks" runat="server" ControlToValidate="txtTotalMarks"
                                    ErrorMessage="*" ValidationGroup="SubmitExamDef">
                                </asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="reqFldTotalTime" runat="server" ControlToValidate="txtTotalTime"
                                    ErrorMessage="*" ValidationGroup="SubmitExamDef">
                                </asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <%-- <cc1:MaskedEditValidator ID="MskEdtValTotalMarks" runat="server" ControlExtender="MskEdtTotalMarks"
                                    ControlToValidate="txtTotalMarks" EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers"
                                    IsValidEmpty="false" MaximumValue="999" MaximumValueMessage=" &lt; 1000" MinimumValue="1"
                                    MinimumValueMessage=" &gt; 0" ToolTip="Enter values from 1 to 999" ValidationGroup="SubmitExamDef">
                                </cc1:MaskedEditValidator>
                                <cc1:MaskedEditValidator ID="MskEdtValTotalNoOfQuestion" runat="server" ControlExtender="MskEdtTotalNoOfQuestion"
                                    ControlToValidate="txtTotalNoOfQuestion" EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers"
                                    IsValidEmpty="false" MaximumValue="999" MaximumValueMessage=" &lt; 1000" MinimumValue="1"
                                    MinimumValueMessage=" &gt; 0" ToolTip="Enter values from 1 to 999" ValidationGroup="SubmitExamDef">
                                </cc1:MaskedEditValidator>
                                <cc1:MaskedEditValidator ID="MskEdtValTotalTime" runat="server" ControlExtender="MskEdtTotalTime"
                                    ControlToValidate="txtTotalTime" EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers"
                                    IsValidEmpty="false" MaximumValue="999" MaximumValueMessage=" &lt; 1000" MinimumValue="1"
                                    MinimumValueMessage=" &gt; 0" ToolTip="Enter values from 1 to 999" ValidationGroup="SubmitExamDef">
                                </cc1:MaskedEditValidator>--%>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtExamName" runat="server" CssClass="InputTxtBox" placeholder="Name Of The Exam"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtExamCode" runat="server" CssClass="InputTxtBox" placeholder="Exam Code"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:CheckBox ID="chkIsDynamicQuestionGeneration" runat="server" AutoPostBack="True"
                                    Checked="true" CssClass="chkText" Text="Check For Dynamic Question" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtTotalNoOfQuestion" runat="server" CssClass="InputTxtBox" placeholder="Total Question"
                                    Width="120px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtPositiveMarkingPerQuestion" runat="server" CssClass="InputTxtBox"
                                    placeholder="+Ve Mark/Ques" Width="120px"></asp:TextBox>
                                &nbsp;
                                <cc1:MaskedEditExtender ID="MskEdtPositiveMarkingPerQuestion" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="99.99" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtPositiveMarkingPerQuestion" />
                            </td>
                            <td align="left" class="label">
                                <asp:CheckBox ID="chkPositiveMarkingAsDefault" runat="server" AutoPostBack="True"
                                    CssClass="chkText" Text=" Set As Default" />
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtSkipMarkingPerQuestion" runat="server" CssClass="InputTxtBox"
                                    placeholder="Skip Mark/Ques" Width="120px">0</asp:TextBox>
                            </td>
                            <td align="left">
                                <asp:CheckBox ID="chkSkipMarkingAsDefault" runat="server" AutoPostBack="True" CssClass="chkText"
                                    Text=" Set As Default" />
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtTotalMarks" runat="server" CssClass="InputTxtBox" placeholder="Total Marks"
                                    Width="120px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtNegativeMarkingPerQuestion" runat="server" CssClass="InputTxtBox"
                                    placeholder="-Ve Mark/Ques" Width="120px"></asp:TextBox>
                                &nbsp;
                                <cc1:MaskedEditExtender ID="MskEdtNegativeMarkingPerQuestion" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="99.99" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtNegativeMarkingPerQuestion" />
                            </td>
                            <td>
                                <asp:CheckBox ID="chkNegativeMarkingAsDefault" runat="server" AutoPostBack="True"
                                    CssClass="chkText" Text=" Set As Default" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtNotAnsweredPerQuestion" runat="server" CssClass="InputTxtBox"
                                    placeholder="Unanswered Mark/Ques" Width="120px">0</asp:TextBox>
                            </td>
                            <td>
                                <asp:CheckBox ID="chkNotAnsweredAsDefault" runat="server" AutoPostBack="True" CssClass="chkText"
                                    Text=" Set As Default" />
                            </td>
                            <td>
                                <asp:TextBox ID="txtTotalTime" runat="server" CssClass="InputTxtBox" placeholder="Time (Min)"
                                    Width="120px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlSubjectWiseMarksDistribution" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" class="label" colspan="6">
                                <div class="widgettitle">
                                    Define Subjects For The Exam</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 200px">
                                <asp:DropDownList ID="drpSubjectListExamDef" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td style="width: 200px">
                                <asp:Label ID="lblNoOfActiveQuestions" runat="server" CssClass="label" ForeColor="#009900"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblNoOfInactiveQuestions" runat="server" CssClass="label" ForeColor="#CC0000"></asp:Label>
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
                                <asp:Label ID="lblDifficultyLevelStr" runat="server" CssClass="label" ForeColor="#009900"></asp:Label>
                            </td>
                            <td colspan="2">
                                <asp:Label ID="lblErrorMessage" runat="server" CssClass="Mandatorylabel"></asp:Label>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldSubWiseNegativeMarkingPerQuestion" runat="server"
                                    ControlToValidate="txtSubWiseNegativeMarkingPerQuestion" ErrorMessage="*" ValidationGroup="AddSub">
                                </asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="reqFldSubWiseNotAnsweredMarkingPerQuestion" runat="server"
                                    ControlToValidate="txtSubWiseNotAnsweredPerQuestion" ErrorMessage="*">
                                </asp:RequiredFieldValidator>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtSubWisePositiveMarkingPerQusetion" runat="server" CssClass="InputTxtBox"
                                    placeholder="+Ve Mark/Ques" Width="120px"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="reqFldSubwisePositiveMarkingPerQuestion" runat="server"
                                    ControlToValidate="txtSubWisePositiveMarkingPerQusetion" ErrorMessage="*" ValidationGroup="AddSub">
                                </asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="txtSubWiseNegativeMarkingPerQuestion" runat="server" 
                                    CssClass="InputTxtBox" placeholder="-Ve Mark/Ques" Width="120px"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="reqFldSubWiseSkipMarkingPerQuestion" runat="server"
                                    ControlToValidate="txtSkipMarkingPerQuestion" ErrorMessage="*">
                                </asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="txtSubWiseSkipMarkingPerQuestion" runat="server" 
                                    CssClass="InputTxtBox" placeholder="Skip Mark/Ques" Width="120px">0</asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtSubWiseNotAnsweredPerQuestion" runat="server" CssClass="InputTxtBox"
                                    placeholder="Unanswered Mark" Width="120px">0</asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtQuestionPickPercentage" runat="server" CssClass="InputTxtBox"
                                    placeholder="Ques Pick %" Width="120px"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="reqFldQuePickPercentage" runat="server" ControlToValidate="txtQuestionPickPercentage"
                                    ErrorMessage="*" ValidationGroup="AddSubN"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpDifficultyLevel" runat="server" CssClass="InputTxtBox">
                                    <asp:ListItem>N\A</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Button ID="btnAddSubjectExDef" runat="server" CssClass="styled-button-1" Text="ADD"
                                    ValidationGroup="AddSub" />
                            </td>
                            <td>
                                &nbsp;
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
                <asp:Panel ID="pnlChoosenSubjects" runat="server" Width="100%" SkinID="pnlInner">
                    <div>
                        <asp:GridView ID="grdExamWiseSubject" runat="server" AutoGenerateColumns="False"
                            CssClass="mGrid">
                            <Columns>
                                <asp:TemplateField HeaderText="Sl">
                                    <ItemTemplate>
                                        <font style="font-size: 12px"><b>
                                            <%#CType(Container, GridViewRow).RowIndex + 1%></b> </font>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SubjectID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSubjectID" runat="server" Text='<%# Bind("SubjectID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SubjectName">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSubjectName" runat="server" Text='<%# Bind("SubjectName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Positive">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPositiveMarkingPerQuestion" runat="server" Text='<%# Bind("PositiveMarkingPerQuestion") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Negative">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNegativeMarkingPerQuestion" runat="server" Text='<%# Bind("NegativeMarkingPerQuestion") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Skip">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSkipMarkingPerQuestion" runat="server" Text='<%# Bind("SkipMarkingPerQuestion") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Not-Answered">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNotAnsweredMarkingPerQuestion" runat="server" Text='<%# Bind("NotAnsweredMarkingPerQuestion") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Percentage">
                                    <ItemTemplate>
                                        <asp:Label ID="lblQuePickPercentage" runat="server" Text='<%# Bind("QuePickPercentage") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="AllocatedQuestion">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAllocatedQuestion" runat="server" Text='<%# Bind("AllocatedQuestion") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DifficultyLevel">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDifficultyLevel" runat="server" Text='<%# Bind("DifficultyLevel") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnDelete" Width="15px" ImageUrl="~/Sources/images/erase.png"
                                            OnClientClick="if (!confirm('Are you Sure to Delete The Item From The List ?')) return false"
                                            CommandName="Delete" runat="server" ValidationGroup="na" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlGradingSystem" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="4" align="left">
                                <div class="widgettitle">
                                    Define Grading System
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td align="left" class="label">
                                Grading System
                            </td>
                            <td align="left" style="float: left">
                                <asp:RequiredFieldValidator ID="reqFldGradingSystem" runat="server" ControlToValidate="rdbtnGradingSystem"
                                    ErrorMessage="*" ValidationGroup="SubmitExamDef">
                                </asp:RequiredFieldValidator>
                                <asp:RadioButtonList ID="rdbtnGradingSystem" runat="server" AutoPostBack="True" class="label"
                                    RepeatDirection="Horizontal">
                                    <asp:ListItem>Default</asp:ListItem>
                                    <asp:ListItem>Customized</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:DropDownList ID="drpGradSysTypeExamDef" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td valign="top">
                                <div style="max-height: 250px; max-width: 300px; overflow: auto">
                                    <asp:GridView ID="grdDefaultGradingSystem" runat="server" AutoGenerateColumns="False"
                                        CssClass="mGrid" EmptyDataText="No Data Available">
                                        <Columns>
                                            <asp:TemplateField HeaderText="SL">
                                                <ItemTemplate>
                                                    <font style="font-size: 12px"><b>
                                                        <%#CType(Container, GridViewRow).RowIndex + 1%></b> </font>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="FromPercentage">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDefFromPercentage" runat="server" Text='<%# Bind("FromPercentage") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ToPercentage">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDefToPercentage" runat="server" Text='<%# Bind("ToPercentage") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="LetterGrade">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDefLetterGrade" runat="server" Text='<%# Bind("LetterGrade") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="GradePoint">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDefGradePoint" runat="server" Text='<%# Bind("GradePoint") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="GradingExplanation" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDefGradingExplanation" runat="server" Text='<%# Bind("GradingExplanation") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                            <td>
                                <asp:Panel ID="pnlCustomizedGradingExDf" runat="server" SkinID="pnlInner" Width="600px">
                                    <table style="width: 100%;">
                                        <tr align="left">
                                            <td class="label">
                                                Percentage From
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtPercentageFromExDf" runat="server" CssClass="InputTxtBox" Width="80px"></asp:TextBox>
                                                &nbsp;
                                                <asp:RequiredFieldValidator ID="reqFldPercentageFromExDf" runat="server" ControlToValidate="txtPercentageFromExDf"
                                                    ErrorMessage="*" ValidationGroup="AddGrading"></asp:RequiredFieldValidator>
                                                &nbsp;
                                            </td>
                                            <td class="label">
                                                Letter Grade
                                            </td>
                                            <td align="left">
                                                <asp:DropDownList ID="drpLetterGrade" runat="server" CssClass="InputTxtBox" Width="80px">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="label">
                                                Percentage To
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtPercentageToExDf" runat="server" CssClass="InputTxtBox" Width="80px"></asp:TextBox>
                                                &nbsp;
                                                <asp:RequiredFieldValidator ID="reqFldPercentageToExDf" runat="server" ControlToValidate="txtPercentageToExDf"
                                                    ErrorMessage="*" ValidationGroup="AddGrading"></asp:RequiredFieldValidator>
                                            </td>
                                            <td align="left" class="label">
                                                Grade Point
                                            </td>
                                            <td align="left">
                                                <asp:DropDownList ID="drpGradePointExamDef" runat="server" CssClass="InputTxtBox"
                                                    Width="80px">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td align="left">
                                                <asp:Button ID="btnAddGradeExDef" runat="server" CssClass="styled-button-1" Text="ADD"
                                                    ValidationGroup="AddGrading" />
                                            </td>
                                            <td align="left" class="label">
                                                Explanation
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtGradeExplanationExDf" runat="server" CssClass="InputTxtBox" Height="50px"
                                                    TextMode="MultiLine" Width="200px">N\A</asp:TextBox>
                                                &nbsp;<asp:RequiredFieldValidator ID="reqFldGradingExplanationExDf" runat="server"
                                                    ControlToValidate="txtGradeExplanationExDf" ErrorMessage="*" ValidationGroup="AddGrading"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <asp:GridView ID="grdExamWiseGradingSystemExamDef" runat="server" AutoGenerateColumns="False"
                                                    CssClass="mGrid">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="SL">
                                                            <ItemTemplate>
                                                                <b>
                                                                    <%#CType(Container, GridViewRow).RowIndex + 1%></b>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="FromPercentage">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFromPercentage0" runat="server" Text='<%# Bind("FromPercentage") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="ToPercentage">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblToPercentage0" runat="server" Text='<%# Bind("ToPercentage") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="LetterGrade">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblLetterGrade0" runat="server" Text='<%# Bind("LetterGrade") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="GradePoint">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblGradePoint0" runat="server" Text='<%# Bind("GradePoint") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="GradingExplanation">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("GradingExplanation") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="imgbtnDelete0" Width="15px" ImageUrl="~/Sources/images/erase.png"
                                                                    OnClientClick="if (!confirm('Are you Sure to Delete The Item From The List ?')) return false"
                                                                    CommandName="Delete" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtExamInstructions" runat="server" CssClass="InputTxtBox" Height="80px"
                                    TextMode="MultiLine" Width="200px" placeholder="Exam Instruction"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnSubmitExamDef" runat="server" CssClass="styled-button-1" OnClientClick="if (!confirm('Are you Sure to Submit. ?')) return false"
                                    Text="Submit" ValidationGroup="SubmitExamDef" />
                                <asp:Button ID="btnCancel0" runat="server" CssClass="styled-button-1" Text="Cancel" />
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
                <asp:Panel ID="pnlAssignExam" runat="server" SkinID="pnlInner" Width="100%">
                    <table style="width:100%;">
                        <tr>
                            <td colspan="6" align="left" >
                                <div class="widgettitle">Assign Exam</div>
                            </td>
                        </tr>
                        <tr align="left" >
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td style="width:20px"></td>
                            <td style="width:150px"></td>
                            <td></td>
                        </tr>
                        <tr align="left">
                            <td class="label" style="width:20px">
                                </td>
                            <td class="label">
                                Select Department</td>
                            <td>
                                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="InputTxtBox" 
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                </td>
                            <td class="label">
                                Select Designation</td>
                            <td>
                                <asp:DropDownList ID="drpSelectDesignation" runat="server" 
                                    CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label" style="width:20px">
                                </td>
                            <td class="label">
                                District</td>
                            <td align="left">
                                <asp:DropDownList ID="ddlPerDistrict" runat="server" AutoPostBack="True" 
                                    CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                                
                            </td>
                            <td>
                                </td>
                            <td class="label">
                                Select Branch
                            </td>
                            <td>
                                <asp:DropDownList ID="drpULCBranch" runat="server" CssClass="InputTxtBox" 
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td tyle="width:20px"></td>
                            <td class="label">
                                Gender</td>
                            <td align="left">
                                <asp:RadioButtonList ID="rdbtnGender" runat="server" class="label" 
                                    CssClass="rbdText" RepeatDirection="Horizontal" TabIndex="9">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                    <asp:ListItem>Others</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td></td>
                            <td class="label">
                                Blood Group
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlBloodGrp" runat="server" CssClass="InputTxtBox" 
                                    TabIndex="11" Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td tyle="width:20px">
                                &nbsp;</td>
                            <td class="label">
                                &nbsp;</td>
                            <td align="left">
                                <asp:Button ID="btnSearch" runat="server" CssClass="styled-button-1" 
                                    Text="Search" />
                                &nbsp;<asp:Button ID="btnCancel1" runat="server" CssClass="styled-button-1" 
                                    Text="Cancel" />
                            </td>
                            <td>
                                &nbsp;</td>
                            <td class="label">
                                &nbsp;</td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label" style="width:20px">
                            </td>
                            <td class="label">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
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
                <asp:Panel ID="pnlAttendees" runat="server" SkinID="pnlInner" Width="100%">
                    <table style="width:100%;">
                        <tr align="left">
                            <td class="label">
                                Select Attendees</td>
                            <td>
                                <asp:CheckBox ID="chkSelectAllItems" runat="server" AutoPostBack="True" 
                                    CssClass="chkText" Text="Select All" Width="300px" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td colspan="2">
                                <div style="max-height:200;max-width:100%;overflow:auto">
                                    <br />
                                    <asp:CheckBoxList ID="chkListAttendees" runat="server" CssClass="chkText" 
                                        RepeatColumns="5">
                                    </asp:CheckBoxList>
                                </div>
                            </td>
                            <td class="style2">
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlGenerateExam" runat="server" Width="100%" SkinID="pnlInner" >
                    <table style="width:100%;">
                        <tr align="left" >
                            <td style="width:20px">&nbsp;</td>
                            <td class="label">
                                Available Exams</td>
                            <td>
                                <asp:DropDownList ID="drpAvailableExams0" runat="server" AutoPostBack="True" 
                                    CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td style="width:20px">
                                &nbsp;</td>
                            <td class="label">
                                Effective Date</td>
                            <td>
                                <asp:TextBox ID="txtExAssOtrExamsEffectiveDate" runat="server" 
                                    CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtExAssOtrExamsEffectiveDate_CalendarExtender" 
                                    runat="server" Enabled="True" TargetControlID="txtExAssOtrExamsEffectiveDate">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldECOEExEffectiveDate" runat="server" 
                                    ControlToValidate="txtExAssOtrExamsEffectiveDate" ErrorMessage="*" 
                                    ValidationGroup="EMPGenerateExam"></asp:RequiredFieldValidator>
                                &nbsp;<asp:DropDownList ID="drpECOEHour" runat="server" CssClass="InputTxtBox" 
                                    Width="40px">
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
                                &nbsp;<asp:DropDownList ID="drpECOEMin" runat="server" CssClass="InputTxtBox" 
                                    Width="50px">
                                    <asp:ListItem>00</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;<asp:DropDownList ID="drpECOEAMPM" runat="server" CssClass="InputTxtBox" 
                                    Width="50px">
                                    <asp:ListItem>AM</asp:ListItem>
                                    <asp:ListItem>PM</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td style="width:20px">
                            </td>
                            <td class="label">
                                Select Branch</td>
                            <td>
                                <asp:DropDownList ID="drpULCBranchToExam" runat="server" CssClass="InputTxtBox" 
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width:20px">
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="btnCheckAll" runat="server" CssClass="styled-button-1" 
                                    Text="Check All" ValidationGroup="EMPGenerateExam" />
                                &nbsp;<asp:Button ID="btnGenerateExam" runat="server" CssClass="styled-button-1" 
                                    Text="Generate" />
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
                <asp:Panel ID="pnlEntryPointWiseExams" runat="server" Width="100%"  
                    SkinID="pnlInner" >
                    <table style="width:100%;">
                        <tr align="left">
                            <td style="width:20px"></td>
                            <td class="label">&nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td></td>
                        </tr>
                        <tr align="left">
                            <td class="label"></td>
                            <td class="label">
                                Select Entry Point</td>
                            <td align="left">
                                <asp:DropDownList ID="drpEntryPoint" runat="server" CssClass="InputTxtBox" 
                                    Width="200px" AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                            <td>
                                </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <div style="max-height:300px;max-width:100%;overflow:auto">
                                    <asp:GridView ID="grdEntryPointWiseAttendees" runat="server" CssClass="mGrid">
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
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
