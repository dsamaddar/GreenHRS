<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmCVSelection.aspx.vb" Inherits="frmCVSelection" Title=".:HRM:CV-Selection:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
    </script>

    <style type="text/css">
        .widgettitleNew
        {
            background: linear-gradient(-90deg, #D7D7D7, #A9A9A9) repeat scroll 0 0 transparent;
            border-bottom: 1px solid #848484;
            border-top: 1px solid #F5F5F5;
            box-shadow: 0 1px 1px rgba(0, 0, 0, 0.15);
            color: #000000;
            display: block;
            font: bold 14px/110% Cambria,Palatino, "Palatino Linotype" , "Palatino LT STD" ,Georgia,serif;
            margin: 0 0 -5px;
            padding: 6px 18px 7px;
            text-shadow: 0 1px 0 rgba(255, 255, 255, 0.7);
            width: auto;
            z-index: -1 !important;
        }
    </style>
    <table style="width: 100%;">
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlCircularSelection" runat="server" Width="1000px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" colspan="5">
                                <div class="widgettitle">
                                    Screened CV</div>
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                            </td>
                            <td align="left" class="label">
                            </td>
                            <td align="left">
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                            </td>
                            <td align="left" class="label">
                                Select A Circular
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpAvailableCircular" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Total Applicant
                            </td>
                            <td align="left">
                                <asp:Label ID="lblTotalApplicant" runat="server" Font-Bold="True" ForeColor="#006600"></asp:Label>
                            </td>
                            <td align="left" class="label">
                                Total Recruitment
                            </td>
                            <td align="left">
                                <asp:Label ID="lblTotalRecruitment" runat="server" Font-Bold="True" ForeColor="#006600"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Total Rejected CV
                            </td>
                            <td align="left">
                                <asp:Label ID="lblTotalRejectedCV" runat="server" Font-Bold="True" ForeColor="#006600"></asp:Label>
                            </td>
                            <td align="left" class="label">
                                Total Exam Taker
                            </td>
                            <td align="left">
                                <asp:Label ID="lblTotalExamTaker" runat="server" Font-Bold="True" ForeColor="#006600"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Total Interview Taken
                            </td>
                            <td align="left">
                                <asp:Label ID="lblTotalInterviewTaken" runat="server" Font-Bold="True" ForeColor="#006600"></asp:Label>
                            </td>
                            <td align="left" class="label">
                                Remaining CV
                            </td>
                            <td align="left">
                                <asp:Label ID="lblCVRemaining" runat="server" Font-Bold="True" ForeColor="#006600"></asp:Label>
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
            <td>
            </td>
        </tr>
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlSearchCriteria" runat="server" Width="1000px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td class="label" style="width: 150px">
                                Suitable For
                            </td>
                            <td style="width: 500px">
                                <div style="max-width: 500px; max-height: 100px; overflow: auto">
                                    <asp:CheckBoxList ID="chkListSuitableDepartments" runat="server" CssClass="chkText"
                                        Width="500px">
                                    </asp:CheckBoxList>
                                </div>
                            </td>
                            <td>
                                <asp:Button ID="btnSearchSuitableFor" runat="server" CssClass="styled-button-1" Text="Search" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
            </td>
        </tr>
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
                <asp:Panel ID="pnlCVSelection" runat="server" Width="1000px" SkinID="pnlInner">
                    <cc1:TabContainer ID="tabCVSelection" CssClass="MyTabStyle" runat="server" ActiveTabIndex="0"
                        AutoPostBack="True" Width="980px">
                        <cc1:TabPanel ID="tabPnlNewCV" runat="server" HeaderText="New CV">
                            <HeaderTemplate>
                                <table>
                                    <tr align="left">
                                        <td align="left" valign="top">
                                            <img style="max-height: 30px; max-width: 30px" src="Sources/images/new_cv.png" />
                                        </td>
                                        <td align="left" valign="top">
                                            Screened CV
                                        </td>
                                    </tr>
                                </table>
                            </HeaderTemplate>
                            <ContentTemplate>
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            &#160;&#160;
                                        </td>
                                        <td>
                                            &#160;&#160;
                                        </td>
                                        <td>
                                            &#160;&#160;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Panel ID="pnlSearchCV" runat="server" SkinID="pnlInner" Width="950px">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td>
                                                            &#160;&#160;
                                                        </td>
                                                        <td>
                                                            &#160;&#160;
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            &#160;&#160;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="label" style="width: 20px">
                                                            &#160;&#160;
                                                        </td>
                                                        <td align="left" class="label">
                                                            Search By Name
                                                        </td>
                                                        <td align="left">
                                                            <asp:TextBox ID="txtCandidateName" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                        </td>
                                                        <td align="left" class="label">
                                                            Present District
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drpPresentDistrict" runat="server" CssClass="InputTxtBox" Width="150px">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="label">
                                                            &#160;&#160;
                                                        </td>
                                                        <td align="left" class="label">
                                                            University
                                                        </td>
                                                        <td align="left">
                                                            <asp:DropDownList ID="drpUniversityList" runat="server" CssClass="InputTxtBox" Width="200px">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td align="left" class="label">
                                                            Permanent District
                                                        </td>
                                                        <td align="left">
                                                            <asp:DropDownList ID="drpPermanentDistrict" runat="server" CssClass="InputTxtBox"
                                                                Width="150px">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="label">
                                                            &#160;&#160;
                                                        </td>
                                                        <td align="left" class="label">
                                                            Gender
                                                        </td>
                                                        <td align="left">
                                                            <asp:DropDownList ID="drpGenderList" runat="server" CssClass="InputTxtBox" Width="100px">
                                                                <asp:ListItem Value="0">N\A</asp:ListItem>
                                                                <asp:ListItem>Male</asp:ListItem>
                                                                <asp:ListItem>Female</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td align="left" class="label">
                                                            Age
                                                        </td>
                                                        <td align="left" class="label" style="float: left">
                                                            From
                                                            <asp:TextBox ID="txtAgeFrom" runat="server" CssClass="InputTxtBox" Width="60px"></asp:TextBox><cc1:MaskedEditExtender
                                                                ID="MskEdtAgeFrom" runat="server" AcceptNegative="Left" CultureAMPMPlaceholder=""
                                                                CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder=""
                                                                CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder=""
                                                                Enabled="True" ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="99"
                                                                MaskType="Number" TargetControlID="txtAgeFrom">
                                                            </cc1:MaskedEditExtender>
                                                            <cc1:MaskedEditValidator ID="MskEdtValMinAgeFrom" runat="server" ControlExtender="MskEdtAgeFrom"
                                                                ControlToValidate="txtAgeFrom" EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers"
                                                                ErrorMessage="MskEdtValMinAgeFrom" IsValidEmpty="False" MaximumValue="60" MaximumValueMessage="Number must be less than 60"
                                                                MinimumValue="20" MinimumValueMessage="Number must be greater than 20" ToolTip="Enter values from 20 to 60"
                                                                ValidationGroup="SearchCV"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </cc1:MaskedEditValidator>&#160;To
                                                            <asp:TextBox ID="txtAgeTo" runat="server" CssClass="InputTxtBox" Width="60px"></asp:TextBox><cc1:MaskedEditExtender
                                                                ID="MskEdtAgeTo" runat="server" AcceptNegative="Left" CultureAMPMPlaceholder=""
                                                                CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder=""
                                                                CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder=""
                                                                Enabled="True" ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="99"
                                                                MaskType="Number" TargetControlID="txtAgeTo">
                                                            </cc1:MaskedEditExtender>
                                                            <cc1:MaskedEditValidator ID="MskEdtValAgeTo" runat="server" ControlExtender="MskEdtAgeTo"
                                                                ControlToValidate="txtAgeTo" EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers"
                                                                ErrorMessage="MskEdtValAgeTo" IsValidEmpty="False" MaximumValue="60" MaximumValueMessage="Number must be less than 60"
                                                                MinimumValue="20" MinimumValueMessage="Number must be greater than 20" ToolTip="Enter values from 20 to 60"
                                                                ValidationGroup="SearchCV">
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            </cc1:MaskedEditValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="btnSearchCV" runat="server" CssClass="styled-button-1" Text="Search"
                                                                ValidationGroup="SearchCV" />&#160;&#160;<asp:Button ID="btnCancelCVSelection" runat="server"
                                                                    CssClass="styled-button-1" Text="Cancel" />
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
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
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
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr align="center">
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Panel ID="pnlAvailableCV" runat="server" SkinID="pnlInner" Width="950px">
                                                <div style="max-height: 300px; max-width: 950px; overflow: auto">
                                                    <asp:GridView CssClass="mGrid" ID="grdNewCV" runat="server" AutoGenerateColumns="False"
                                                        EmptyDataText="No Data Available" SkinID="grdNoFooter" Width="950px">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Select">
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkSelectCandidate" runat="server" /></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="AppliedJobID" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAppliedJobID" runat="server" Text='<%# Bind("AppliedJobID") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Candidate ID ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCandidateID" runat="server" Text='<%# Bind("CandidateID") %>'> </asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Entry Date ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("EntryDate") %>'> </asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="CircularID" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCircularID" runat="server" Text='<%# Bind("CircularID") %>'> </asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Candidate ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCandidateName" runat="server" Text='<%# Bind("CandidateName") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Present District ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPreDistrict" runat="server" Text='<%# Bind("PreDistrictName") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Permanent District ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPerDistrict" runat="server" Text='<%# Bind("PerDistrictName") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Highest Degree ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHighestDegree" runat="server" Text='<%# Bind("HighestDegree") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Major ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblMajor" runat="server" Text='<%# Bind("Major") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Institution ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInstitutionName" runat="server" Text='<%# Bind("InstitutionName") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Screening Details " ShowHeader="False">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkBtnScreeningDetails" runat="server" CausesValidation="False"
                                                                        CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("CandidateID","openWindow(""ScreeningInterview/frmViewScreeningInterview.aspx?CandidateID={0}"",""Popup"",1000,800);") %>'
                                                                        Text=" View "> </asp:LinkButton></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" CV Details " ShowHeader="False">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkChooseCVDetailsBtn" runat="server" CausesValidation="False"
                                                                        CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("CandidateID","openWindow(""RecuitmentCVView.aspx?CandidateID={0}"",""Popup"",1000,1100);") %>'
                                                                        Text=" View "> </asp:LinkButton></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Job Title " Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblJobTitle" runat="server" Text='<%# Bind("JobTitle") %>'> </asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </asp:Panel>
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
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &#160;&#160;
                                        </td>
                                        <td>
                                            <asp:Panel ID="pnlInitialScreenedCV" runat="server" SkinID="pnlInner" Width="950px">
                                                <table style="width: 100%;">
                                                    <tr align="center">
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="btnChooseCV" runat="server" CssClass="styled-button-1" Text="Choose CV" />&#160;<asp:Button
                                                                ID="btnCancelCanSelection" runat="server" CssClass="styled-button-1" Text="Cancel" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                        <td>
                                            &#160;&#160;
                                        </td>
                                        <td>
                                            &#160;&#160;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &#160;&#160;
                                        </td>
                                        <td>
                                            &#160;&#160;
                                        </td>
                                        <td>
                                            &#160;&#160;
                                        </td>
                                        <td>
                                            &#160;&#160;
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel ID="tabPnlReview" runat="server" HeaderText="Review">
                            <HeaderTemplate>
                                <table>
                                    <tr align="left">
                                        <td align="left" valign="top">
                                            <img style="max-height: 30px; max-width: 30px" src="Sources/images/review_cv.png" />
                                        </td>
                                        <td align="left" valign="top">
                                            Selected CV
                                        </td>
                                    </tr>
                                </table>
                            </HeaderTemplate>
                            <ContentTemplate>
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
                                            <asp:Panel ID="pnlReviewedCV" runat="server" SkinID="pnlInner" Width="950px">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <div class="widgettitleNew">
                                                                Selected CV</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div style="max-height: 300px; max-width: 950px; overflow: auto">
                                                                <asp:GridView ID="grdReviewedCV" CssClass="mGrid" SkinID="grdNoFooter" Width="100%"
                                                                    runat="server" AutoGenerateColumns="False" EmptyDataText="No Data Available">
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
                                                                        <asp:TemplateField HeaderText=" Entry Date ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("EntryDate") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="CircularID" Visible="False">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblReviewCircularID" runat="server" Text='<%# Bind("CircularID") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Candidate ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblReviewCandidateName" runat="server" Text='<%# Bind("CandidateName") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Present District ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblPreDistrict0" runat="server" Text='<%# Bind("PreDistrictName") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Permanent District ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblPerDistrict0" runat="server" Text='<%# Bind("PerDistrictName") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Highest Degree ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblHighestDegree0" runat="server" Text='<%# Bind("HighestDegree") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Major ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblMajor0" runat="server" Text='<%# Bind("Major") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Institution ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblInstitutionName0" runat="server" Text='<%# Bind("InstitutionName") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Job Title " Visible="False">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblJobTitle0" runat="server" Text='<%# Bind("JobTitle") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Reviewed By ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ReviewedBy") %>'> </asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Reviewed Date ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("ReviewedDate") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Status ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCurrentStatus" runat="server" Text='<%# Bind("CurrentStatus") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Screening Details " ShowHeader="False">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkBtnReviewScreeningDetails" CssClass="linkbtn" Font-Size="14px"
                                                                                    runat="server" CausesValidation="False" OnClientClick='<%# Eval("CandidateID","openWindow(""ScreeningInterview/frmViewScreeningInterview.aspx?CandidateID={0}"",""Popup"",1000,800);") %>'
                                                                                    Text=" View "> </asp:LinkButton></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" CV Details " ShowHeader="False">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkReviewCVDetailsBtn" CssClass="linkbtn" Font-Size="14px" runat="server"
                                                                                    CausesValidation="False" OnClientClick='<%# Eval("CandidateID","openWindow(""RecuitmentCVView.aspx?CandidateID={0}"",""Popup"",1000,1100);") %>'
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
                                        <td>
                                            &#160;&#160;
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
                                        <td>
                                            &#160;&#160;
                                        </td>
                                        <td>
                                            <asp:RadioButtonList ID="rdbtnActions" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                                RepeatDirection="Horizontal">
                                                <asp:ListItem>Assign Exam</asp:ListItem>
                                                <asp:ListItem>Assign Interview</asp:ListItem>
                                                <asp:ListItem>Others</asp:ListItem>
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
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Panel ID="pnlAssignExam" runat="server" SkinID="pnlInner" Width="950px">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td align="left" colspan="3">
                                                            <div class="widgettitleNew">
                                                                Assign Exam</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="label">
                                                            &#160;&#160;
                                                        </td>
                                                        <td align="left" class="label">
                                                            Available Exams
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drpAvailableExams" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                                                Width="200px">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="label">
                                                            &#160;&#160;
                                                        </td>
                                                        <td align="left" class="label">
                                                            Effective Date
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtReviewedExamEffectiveDate" runat="server" CssClass="InputTxtBox"
                                                                Width="200px" ValidationGroup="RExamGenerate"></asp:TextBox><cc1:CalendarExtender
                                                                    ID="txtReviewedExamEffectiveDate_CalendarExtender" runat="server" Enabled="True"
                                                                    TargetControlID="txtReviewedExamEffectiveDate">
                                                                </cc1:CalendarExtender>
                                                            &#160;<asp:RequiredFieldValidator ID="reqFldREffectiveDate" runat="server" ControlToValidate="txtReviewedExamEffectiveDate"
                                                                ErrorMessage="*" ValidationGroup="RExamGenerate">
                                                            </asp:RequiredFieldValidator>&#160;
                                                            <asp:DropDownList ID="drpSHour" runat="server" CssClass="InputTxtBox" Width="40px">
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
                                                                <asp:ListItem>10</asp:ListItem>
                                                                <asp:ListItem>20</asp:ListItem>
                                                                <asp:ListItem>30</asp:ListItem>
                                                                <asp:ListItem>40</asp:ListItem>
                                                                <asp:ListItem>50</asp:ListItem>
                                                            </asp:DropDownList>
                                                            &#160;<asp:DropDownList ID="drpSAMPM" runat="server" CssClass="InputTxtBox" Width="50px">
                                                                <asp:ListItem>AM</asp:ListItem>
                                                                <asp:ListItem>PM</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="label">
                                                            &nbsp;
                                                        </td>
                                                        <td>
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
                                                            <asp:Button ID="btnCheckAll" runat="server" CssClass="styled-button-1" Text="Check All" />
                                                            &nbsp;&nbsp;
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
                                                    <tr>
                                                        <td align="left" class="label">
                                                            &nbsp;&nbsp;
                                                        </td>
                                                        <td align="left" class="label">
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
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Panel ID="pnlAssignInterview" runat="server" SkinID="pnlInner" Width="950px">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td align="left" colspan="3">
                                                            <div class="widgettitleNew">
                                                                Assign Interview</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="label">
                                                            &#160;&#160;
                                                        </td>
                                                        <td align="left" class="label">
                                                            Interview Panel
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drpAvailableIntTeamList" runat="server" CssClass="InputTxtBox"
                                                                Width="200px">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="reqFldIntPnlTeam" runat="server" ControlToValidate="drpAvailableIntTeamList"
                                                                ErrorMessage="*" ValidationGroup="IntPnlAssignment"></asp:RequiredFieldValidator>&#160;&#160;<asp:LinkButton
                                                                    CssClass="linkbtn" ID="lnkBtnViewPanelMembers" runat="server" OnClientClick="javascript:openWindow(&quot;InterviewPanel/frmViewIntPanelMembers.aspx?IntTeamID=&quot; + GetDropDownValue(),&quot;Popup&quot;,800,400);">View Panel Members </asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="label">
                                                        </td>
                                                        <td align="left" class="label">
                                                            Interview Date
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtInterviewDate" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox><cc1:CalendarExtender
                                                                ID="txtInterviewDate_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtInterviewDate">
                                                            </cc1:CalendarExtender>
                                                            <asp:RequiredFieldValidator ID="reqFldIntDate" runat="server" ControlToValidate="txtInterviewDate"
                                                                ErrorMessage="*" ValidationGroup="IntPnlAssignment"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="btnCheckIntCandidates" runat="server" CssClass="styled-button-1"
                                                                Text="Check All" ValidationGroup="IntPnlAssignment" />&nbsp;<asp:Button ID="btnAssignInterview"
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
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Panel ID="pnlOtherActions" runat="server" SkinID="pnlInner" Width="950px">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td align="left" colspan="4">
                                                            <div class="widgettitleNew">
                                                                Change Application Status</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="label">
                                                            &#160;&#160;
                                                        </td>
                                                        <td align="left" class="label">
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
                                                    <tr>
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
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel ID="tabPnlExam" runat="server" HeaderText="Exam">
                            <HeaderTemplate>
                                <table>
                                    <tr align="left">
                                        <td align="left" valign="top">
                                            <img style="max-height: 30px; max-width: 30px" src="Sources/images/exam_assigned_cv.png" />
                                        </td>
                                        <td align="left" valign="top">
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
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Panel ID="pnlExamCompleted" runat="server" SkinID="pnlInner" Width="950px">
                                                <table>
                                                    <tr>
                                                        <td align="left">
                                                            <div class="widgettitleNew">
                                                                Exam Completed Candidate</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div style="max-height: 200px; max-width: 940px; overflow: auto">
                                                                <asp:GridView ID="grdExamCompleted" CssClass="mGrid" runat="server" AutoGenerateColumns="False"
                                                                    SkinID="grdNoFooter">
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
                                                                        <asp:TemplateField HeaderText="CircularID" Visible="False">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("CircularID") %>'> </asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Candidate ID ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblExaminedCandidateID" runat="server" Text='<%# Bind("CandidateID") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Entry Date ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("EntryDate") %>'> </asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Candidate ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblExaminedCandidateName" runat="server" Text='<%# Bind("CandidateName") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Present District ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("PreDistrictName") %>'> </asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Permanent District ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("PerDistrictName") %>'> </asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Highest Degree ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("HighestDegree") %>'> </asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Major ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("Major") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Institution ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("InstitutionName") %>'> </asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Job Title " Visible="False">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("JobTitle") %>'> </asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Reviewed By ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label12" runat="server" Text='<%# Bind("ReviewedBy") %>'> </asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Reviewed Date ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label13" runat="server" Text='<%# Bind("ReviewedDate") %>'> </asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Status ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCurrentStatusExamCompleted" runat="server" Text='<%# Bind("CurrentStatus") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Screening Details " ShowHeader="False">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkBtnExamCompletedScreeningDetails" runat="server" CausesValidation="False"
                                                                                    CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("CandidateID","openWindow(""ScreeningInterview/frmViewScreeningInterview.aspx?CandidateID={0}"",""Popup"",1000,800);") %>'
                                                                                    Text=" View "> </asp:LinkButton></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" CV Details " ShowHeader="False">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkExamCompletedCVDetailsBtn" runat="server" CausesValidation="False"
                                                                                    CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("CandidateID","openWindow(""RecuitmentCVView.aspx?CandidateID={0}"",""Popup"",1000,1100);") %>'
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
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &#160;&#160;
                                        </td>
                                        <td>
                                            &#160;&#160;
                                        </td>
                                        <td>
                                            &#160;&#160;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &#160;&#160;
                                        </td>
                                        <td>
                                            <asp:Panel ID="pnlCandidateExamResultSummary" runat="server" Width="950px" SkinID="pnlInner">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td>
                                                            <div class="widgettitleNew">
                                                                Taken Exams</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div style="max-height: 200px; max-width: 100%; overflow: auto">
                                                                <asp:GridView ID="grdCandidateExamResultSummary" CssClass="mGrid" runat="server"
                                                                    AutoGenerateColumns="False" SkinID="grdNoFooter" Width="100%">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="ExamID" Visible="False">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ExamID") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="ExamName">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("ExamName") %>'> </asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="ExamRollNo" Visible="False">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblExamRollNo" runat="server" Text='<%# Bind("ExamRollNo") %>'> </asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="ExamCode">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ExamCode") %>'> </asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="TotalQuestion">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("TotalQuestion") %>'> </asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="TotalMarks">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("TotalMarks") %>'> </asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="PositiveMarking">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("PositiveMarking") %>'> </asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="NegativeMarking">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("NegativeMarking") %>'> </asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="ObtainedMarks">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("ObtainedMarks") %>'> </asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Exam Details " ShowHeader="False">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkCandidateExamDetailsBtn" runat="server" CausesValidation="False"
                                                                                    CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("ExamRollNo","openWindow(""CVMan/frmShowCandidateResult.aspx?ExamRollNo={0}"",""Popup"",1000,1100);") %>'
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
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Panel ID="pnlExOptions" runat="server" SkinID="pnlInner" Width="950px">
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
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Panel ID="pnlAssignOtherExams" runat="server" SkinID="pnlInner" Width="950px">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td align="left" colspan="3">
                                                            <div class="widgettitleNew">
                                                                Assign Exam</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="label">
                                                        </td>
                                                        <td align="left" class="label">
                                                            Available Exams
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drpExAvailableExams" runat="server" CssClass="InputTxtBox"
                                                                Width="200px">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="label">
                                                            &#160;&#160;
                                                        </td>
                                                        <td align="left" class="label">
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
                                                            &nbsp;<asp:DropDownList ID="drpECOEMin" runat="server" CssClass="InputTxtBox" Width="50px">
                                                                <asp:ListItem>10</asp:ListItem>
                                                                <asp:ListItem>20</asp:ListItem>
                                                                <asp:ListItem>30</asp:ListItem>
                                                                <asp:ListItem>40</asp:ListItem>
                                                                <asp:ListItem>50</asp:ListItem>
                                                            </asp:DropDownList>
                                                            &#160;<asp:DropDownList ID="drpECOEAMPM" runat="server" CssClass="InputTxtBox" Width="50px">
                                                                <asp:ListItem>AM</asp:ListItem>
                                                                <asp:ListItem>PM</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="label">
                                                            &#160;
                                                        </td>
                                                        <td align="left" class="label">
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
                                                            &#160;
                                                        </td>
                                                        <td>
                                                            &#160;
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
                                                    <tr>
                                                        <td align="left" class="label">
                                                            &#160;&#160;
                                                        </td>
                                                        <td align="left" class="label">
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
                                                            &#160;&#160;<asp:GridView ID="grdExEntryPointWiseCandidate" runat="server" CssClass="mGrid"
                                                                SkinID="grdNoFooter">
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
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Panel ID="pnlExChangeStatus" runat="server" SkinID="pnlInner" Width="950px">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td align="left" colspan="4">
                                                            <div class="widgettitleNew">
                                                                Change Status</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="label">
                                                            &#160;&#160;
                                                        </td>
                                                        <td align="left" class="label">
                                                            Choose Status
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drpExChangeStatus" runat="server" CssClass="InputTxtBox" Width="200px">
                                                                <asp:ListItem>Applied</asp:ListItem>
                                                                <asp:ListItem>Rejected</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            &#160;&#160;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &#160;&#160;
                                                        </td>
                                                        <td>
                                                            &#160;&#160;
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="btnExChangeStatus" runat="server" CssClass="styled-button-1" Text="Change Status" />
                                                        </td>
                                                        <td>
                                                            &#160;&#160;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &#160;&#160;
                                                        </td>
                                                        <td>
                                                            &#160;&#160;
                                                        </td>
                                                        <td>
                                                            &#160;&#160;
                                                        </td>
                                                        <td>
                                                            &#160;&#160;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                        <td>
                                            &#160;&#160;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Panel ID="pnlExAssignInterview" runat="server" SkinID="pnlInner" Width="950px">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td align="left" colspan="3">
                                                            <div class="widgettitleNew">
                                                                Assign Interview</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td align="left" class="label">
                                                            Interview Panel
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drpExAvailableIntTeamList" runat="server" CssClass="InputTxtBox"
                                                                Width="200px">
                                                            </asp:DropDownList>
                                                            &#160;&#160;<asp:RequiredFieldValidator ID="reqFldExAvailableIntTeamList" runat="server"
                                                                ControlToValidate="drpExAvailableIntTeamList" ErrorMessage="*" ValidationGroup="IntExPnlAssignment"></asp:RequiredFieldValidator>&#160;&#160;<asp:LinkButton
                                                                    ID="LinkButton2" runat="server" CssClass="linkbtn" OnClientClick="javascript:openWindow(&quot;InterviewPanel/frmViewIntPanelMembers.aspx?IntTeamID=&quot; + GetExDropDownValue(),&quot;Popup&quot;,800,400);">View Panel Members </asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="label">
                                                            &#160;&#160;
                                                        </td>
                                                        <td align="left" class="label">
                                                            Interview Date
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtExInterviewDate" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox><cc1:CalendarExtender
                                                                ID="CalendarExtender1" runat="server" Enabled="True" TargetControlID="txtExInterviewDate">
                                                            </cc1:CalendarExtender>
                                                            &#160;&#160;<asp:RequiredFieldValidator ID="reqFldtxtExInterviewDate" runat="server"
                                                                ControlToValidate="txtExInterviewDate" ErrorMessage="*" ValidationGroup="IntExPnlAssignment"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &#160;&#160;
                                                        </td>
                                                        <td>
                                                            &#160;&#160;
                                                        </td>
                                                        <td>
                                                            &#160;<asp:Button ID="btnExIntAssignmentChqAll" runat="server" CssClass="styled-button-1"
                                                                Text="Check All" ValidationGroup="IntExPnlAssignment" />&#160;<asp:Button ID="btnExIntAssInterview"
                                                                    runat="server" CssClass="styled-button-1" Text="Assign" ValidationGroup="IntExPnlAssignment" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            &#160;&#160;
                                                        </td>
                                                        <td>
                                                            &#160;&#160;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel ID="tabPnlInterview" runat="server" HeaderText="Interview">
                            <HeaderTemplate>
                                <table>
                                    <tr align="left">
                                        <td align="left" valign="top">
                                            <img style="max-height: 30px; max-width: 30px" src="Sources/images/int_assi_cv.png" />
                                        </td>
                                        <td align="left" valign="top">
                                            Interview
                                        </td>
                                    </tr>
                                </table>
                            </HeaderTemplate>
                            <ContentTemplate>
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Panel ID="pnlPendingInterviewCandidates" runat="server" Width="950px" SkinID="pnlInner">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td align="left">
                                                            <div class="widgettitleNew">
                                                                Pending Interview Assigned Candidates</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div style="max-height: 250px; max-width: 940px; overflow: auto">
                                                                <asp:GridView ID="grdInterviewNotTaken" CssClass="mGrid" runat="server" AutoGenerateColumns="False"
                                                                    EmptyDataText="No Data Available" SkinID="grdNoFooter">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Select">
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="chkSelectIntNotTaken" runat="server" /></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="AppliedJobID" Visible="False">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblInterviewedNotTakenAppliedJobID" runat="server" Text='<%# Bind("AppliedJobID") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="IntCandidateID" Visible="False">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblIntCandidateID0" runat="server" Text='<%# Bind("IntCandidateID") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Candidate ID ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblInterviewedCandidateID0" runat="server" Text='<%# Bind("CandidateID") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Entry Date ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label14" runat="server" Text='<%# Bind("EntryDate") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="CircularID" Visible="False">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblInterviewedCircularID0" runat="server" Text='<%# Bind("CircularID") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Candidate ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblReviewCandidateName2" runat="server" Text='<%# Bind("CandidateName") %>'> </asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Present District ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblPreDistrict3" runat="server" Text='<%# Bind("PreDistrictName") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Permanent District ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblPerDistrict3" runat="server" Text='<%# Bind("PerDistrictName") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Highest Degree ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblHighestDegree3" runat="server" Text='<%# Bind("HighestDegree") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Major ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblMajor3" runat="server" Text='<%# Bind("Major") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Institution ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblInstitutionName3" runat="server" Text='<%# Bind("InstitutionName") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="JobTitle" Visible="False">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblJobTitle3" runat="server" Text='<%# Bind("JobTitle") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Age ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label15" runat="server" Text='<%# Bind("Age") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Gender ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label16" runat="server" Text='<%# Bind("Gender") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" Status ">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCurrentStatusExamCompleted0" runat="server" Text='<%# Bind("CurrentStatus") %>'></asp:Label></ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText=" CV Details " ShowHeader="False">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkInterviewCompletedCVDetailsBtn0" runat="server" CausesValidation="False"
                                                                                    CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("CandidateID","openWindow(""RecuitmentCVView.aspx?CandidateID={0}"",""Popup"",1000,1100);") %>'
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
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Panel ID="pnlChangeStatusPendingIntAssigned" runat="server" SkinID="pnlInner"
                                                Width="950px">
                                                <table style="width: 100%;">
                                                    <tr align="left">
                                                        <td colspan="4">
                                                            <div class="widgettitleNew">
                                                                Change Status</div>
                                                        </td>
                                                    </tr>
                                                    <tr align="left">
                                                        <td style="width: 20px">
                                                        </td>
                                                        <td align="left" class="label" style="width: 150px">
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
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Panel ID="pnlSelectIntGradeList" runat="server" SkinID="pnlInner" Width="950px">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td align="left" colspan="3">
                                                            <div class="widgettitleNew">
                                                                Completed Interview</div>
                                                        </td>
                                                    </tr>
                                                    <tr align="left">
                                                        <td style="width: 20px">
                                                        </td>
                                                        <td>
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
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Panel ID="pnlInterviewTakenCV" runat="server" SkinID="pnlInner" Width="950px">
                                                <div style="max-height: 250px; max-width: 940px; overflow: auto">
                                                    <asp:GridView ID="grdInterviewCompletedCandidates" CssClass="mGrid" runat="server"
                                                        AutoGenerateColumns="False" EmptyDataText="No Data Available" SkinID="grdNoFooter">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="AppliedJobID" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInterviewedAppliedJobID" runat="server" Text='<%# Bind("AppliedJobID") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="IntCandidateID" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblIntCandidateID" runat="server" Text='<%# Bind("IntCandidateID") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Candidate ID ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInterviewedCandidateID" runat="server" Text='<%# Bind("CandidateID") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Entry Date ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("EntryDate") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="CircularID" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInterviewedCircularID" runat="server" Text='<%# Bind("CircularID") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Candidate ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblReviewCandidateName1" runat="server" Text='<%# Bind("CandidateName") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Present District ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPreDistrict2" runat="server" Text='<%# Bind("PreDistrictName") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Permanent District ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPerDistrict2" runat="server" Text='<%# Bind("PerDistrictName") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Highest Degree ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHighestDegree2" runat="server" Text='<%# Bind("HighestDegree") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Major ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblMajor2" runat="server" Text='<%# Bind("Major") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Institution ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInstitutionName2" runat="server" Text='<%# Bind("InstitutionName") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="JobTitle" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblJobTitle2" runat="server" Text='<%# Bind("JobTitle") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Age ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Age") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Gender ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Gender") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Status ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCurrentStatusExamCompleted" runat="server" Text='<%# Bind("CurrentStatus") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Assessment " ShowHeader="False">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkBtnGrdIntAssessment" CssClass="linkbtn" Font-Size="14px" runat="server"
                                                                        CausesValidation="False" OnClientClick='<%# String.Format("openWindow(""Recruitment/frmShowInterviewAssessment.aspx?CandidateID={0}&CircularID={1}"",""Popup"",1000,400);", Eval("CandidateID"), Eval("CircularID")) %>'
                                                                        Text=" Assessment "> </asp:LinkButton></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Screening Details " ShowHeader="False">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkBtnInterviewCompletedScreeningDetails" CssClass="linkbtn"
                                                                        Font-Size="14px" runat="server" CausesValidation="False" OnClientClick='<%# Eval("CandidateID","openWindow(""ScreeningInterview/frmViewScreeningInterview.aspx?CandidateID={0}"",""Popup"",1000,800);") %>'
                                                                        Text=" View "> </asp:LinkButton></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" CV Details " ShowHeader="False">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkInterviewCompletedCVDetailsBtn" CssClass="linkbtn" Font-Size="14px"
                                                                        runat="server" CausesValidation="False" OnClientClick='<%# Eval("CandidateID","openWindow(""RecuitmentCVView.aspx?CandidateID={0}"",""Popup"",1000,1100);") %>'
                                                                        Text=" View "></asp:LinkButton></ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </asp:Panel>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Panel ID="pnlInterviewAssessment" runat="server" Width="950px" SkinID="pnlInner">
                                                <table width="100%">
                                                    <tr>
                                                        <td align="left" class="label" style="width: 20px">
                                                        </td>
                                                        <td align="left" class="label">
                                                            <asp:LinkButton ID="lnkbtnInterviewAssessment" runat="server" OnClientClick="javascript:openWindow(&quot;frmShowInterviewAssessment.aspx&quot;,&quot;Popup&quot;,800,400);">Interview Assessment </asp:LinkButton>
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
                                            <asp:Panel ID="pnlInterviewTakenOtherActions" runat="server" SkinID="pnlInner" Width="950px"
                                                Visible="False">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td align="left" class="label" style="width: 20px">
                                                        </td>
                                                        <td align="left" class="label">
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
                                                            &#160;&#160;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="label">
                                                        </td>
                                                        <td align="left" class="label">
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
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel ID="tabPnlRejected" runat="server" HeaderText="Rejected">
                            <HeaderTemplate>
                                <table>
                                    <tr align="left">
                                        <td align="left" valign="top">
                                            <img style="max-height: 30px; max-width: 30px" src="Sources/images/rejected_cv.png" />
                                        </td>
                                        <td align="left" valign="top">
                                            Rejected
                                        </td>
                                    </tr>
                                </table>
                            </HeaderTemplate>
                            <ContentTemplate>
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
                                            <asp:Panel ID="pnlRejectedCV" runat="server" SkinID="pnlInner">
                                                <div style="max-width: 950px; max-height: 300px; overflow: auto">
                                                    <asp:GridView ID="grdRejectedCV" CssClass="mGrid" runat="server" AutoGenerateColumns="False"
                                                        EmptyDataText="No Data Available" SkinID="grdNoFooter">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText=" Select ">
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkSelectRejected" runat="server" /></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="AppliedJobID" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblRejectedAppliedJobID" runat="server" Text='<%# Bind("AppliedJobID") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Candidate ID ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblRejectedCandidateID" runat="server" Text='<%# Bind("CandidateID") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Entry Date ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("EntryDate") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="CircularID" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblReviewCircularID0" runat="server" Text='<%# Bind("CircularID") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Candidate ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblReviewCandidateName0" runat="server" Text='<%# Bind("CandidateName") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Present District ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPreDistrict1" runat="server" Text='<%# Bind("PreDistrictName") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Permanent District ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPerDistrict1" runat="server" Text='<%# Bind("PerDistrictName") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Highest Degree ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblHighestDegree1" runat="server" Text='<%# Bind("HighestDegree") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Major ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblMajor1" runat="server" Text='<%# Bind("Major") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Institution ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInstitutionName1" runat="server" Text='<%# Bind("InstitutionName") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="JobTitle" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblJobTitle1" runat="server" Text='<%# Bind("JobTitle") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Rejected By ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblRejectedBy" runat="server" Text='<%# Bind("RejectedBy") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Rejection Date ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblRejectedDate" runat="server" Text='<%# Bind("RejectedDate") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Status ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCurrentStatusRejected" runat="server" Text='<%# Bind("CurrentStatus") %>'></asp:Label></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" Screening Details " ShowHeader="False">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkBtnRejectedCVScreeningDetails" CssClass="linkbtn" Font-Size="14px"
                                                                        runat="server" CausesValidation="False" OnClientClick='<%# Eval("CandidateID","openWindow(""ScreeningInterview/frmViewScreeningInterview.aspx?CandidateID={0}"",""Popup"",1000,800);") %>'
                                                                        Text=" View "> </asp:LinkButton></ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText=" CV Details " ShowHeader="False">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkRejectedCVDetailsBtn" CssClass="linkbtn" Font-Size="14px"
                                                                        runat="server" CausesValidation="False" OnClientClick='<%# Eval("CandidateID","openWindow(""RecuitmentCVView.aspx?CandidateID={0}"",""Popup"",800,800);") %>'
                                                                        Text=" View "> </asp:LinkButton></ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </asp:Panel>
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
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Panel ID="pnlRejectedActions" runat="server" SkinID="pnlInner" Width="950px">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td align="left" class="label">
                                                        </td>
                                                        <td align="left" class="label">
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="label">
                                                        </td>
                                                        <td align="left" class="label">
                                                            Choose Status
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="drpApplicantStatusRejected" runat="server" CssClass="InputTxtBox"
                                                                Width="200px">
                                                                <asp:ListItem>Applied</asp:ListItem>
                                                                <asp:ListItem>Reviewed</asp:ListItem>
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
                                                            <asp:Button ID="btnRejectedChangeStatus" runat="server" CssClass="styled-button-1"
                                                                Text="Change Status" />
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
                                                        <td>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                        <td>
                                            &#160;&#160;
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
                            </ContentTemplate>
                        </cc1:TabPanel>
                    </cc1:TabContainer>
                </asp:Panel>
            </td>
            <td>
            </td>
        </tr>
        <tr align="center">
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
