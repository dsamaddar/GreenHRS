<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmTagCandidate.aspx.vb" Inherits="Recruitment_frmTagCandidate"
    Title=".:HRM:Candidate Tag:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">

        .modalBackground
        {
            background-color: ButtonHighlight;
            filter: alpha(opacity=60);
            opacity: 1.00;
        }
        </style>
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
    </script>

    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Panel ID="pnlSearchCandidate" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="5">
                                <div class="widgettitle">
                                    Candidate Profile<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 300px">
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
                                Candidate Name/ID
                            </td>
                            <td>
                                <asp:TextBox ID="txtCandidate" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldCandidateNameOrID" runat="server" ControlToValidate="txtCandidate"
                                    Display="None" ErrorMessage="Candidate Name/ID Required"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldCandidateNameOrID_ValidatorCalloutExtender0"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldCandidateNameOrID" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td class="label">
                                Present District
                            </td>
                            <td>
                                <asp:DropDownList ID="drpPresentDistrict" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                University
                            </td>
                            <td>
                                <asp:DropDownList ID="drpUniversityList" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td class="label">
                                Permanent District
                            </td>
                            <td>
                                <asp:DropDownList ID="drpPermanentDistrict" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Gender
                            </td>
                            <td>
                                <asp:DropDownList ID="drpGenderList" runat="server" CssClass="InputTxtBox" Width="100px">
                                    <asp:ListItem Value="0">N\A</asp:ListItem>
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="label">
                                Age
                            </td>
                            <td>
                                <asp:TextBox ID="txtAgeFrom" runat="server" CssClass="InputTxtBox" Width="60px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MskEdtAgeFrom0" runat="server" AcceptNegative="Left"
                                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                                    CultureTimePlaceholder="" Enabled="True" ErrorTooltipEnabled="True" InputDirection="RightToLeft"
                                    Mask="99" MaskType="Number" TargetControlID="txtAgeFrom">
                                </cc1:MaskedEditExtender>
                                &nbsp;-
                                <asp:TextBox ID="txtAgeTo" runat="server" CssClass="InputTxtBox" Width="60px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MskEdtAgeTo0" runat="server" AcceptNegative="Left" CultureAMPMPlaceholder=""
                                    CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder=""
                                    CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder=""
                                    Enabled="True" ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="99"
                                    MaskType="Number" TargetControlID="txtAgeTo">
                                </cc1:MaskedEditExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Subject
                            </td>
                            <td>
                                <asp:DropDownList ID="drpSubjects" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td class="label">
                                Experience ( &gt;= )
                            </td>
                            <td>
                                <asp:TextBox ID="txtExperience" runat="server" CssClass="InputTxtBox" Width="60px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MskEdtExperience0" runat="server" AcceptNegative="Left"
                                    CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""
                                    CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                                    CultureTimePlaceholder="" Enabled="True" ErrorTooltipEnabled="True" InputDirection="RightToLeft"
                                    Mask="99" MaskType="Number" TargetControlID="txtExperience">
                                </cc1:MaskedEditExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnSearchApplicant" runat="server" CssClass="styled-button-1" Text="Search Applicant"
                                    ValidationGroup="SearchApplicant" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" Text="Cancel" />
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
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlMatchedApplicant" runat="server" Width="100%" SkinID="pnlInner">
                    <div style="max-height: 300px; max-width: 100%; overflow: auto">
                        <asp:GridView ID="grdMatchedApplicant" runat="server" AutoGenerateColumns="False"
                            EmptyDataText="No Match Found" CssClass="mGrid" ShowFooter="True">
                            <Columns>
                                <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="linkbtn" CausesValidation="False"
                                            CommandName="Select" Text="Select"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CandidateID" Visible="True">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCandidateID" runat="server" Text='<%# Bind("CandidateID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Candidate">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCandidateName" runat="server" Text='<%# Bind("CandidateName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ApplicationDate">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("ApplicationDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Pre District">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("PreDistrict") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Per District">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("PerDistrict") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Highest Degree">
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("HighestDegree") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Major">
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Major") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Institution">
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("InstitutionName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Age">
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("Age") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Gender">
                                    <ItemTemplate>
                                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Contact No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblContactNo" runat="server" Text='<%# Bind("ContactNo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="AlternateEmail" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAlternateEmail" runat="server" Text='<%# Bind("AlternateEmail") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText=" Assessment " ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkBtnCVDetails" CssClass="linkbtn" Font-Size="14px" runat="server"
                                            CausesValidation="False" OnClientClick='<%# String.Format("openWindow(""../RecuitmentCVView.aspx?CandidateID={0}"",""Popup"",1000,900);", Eval("CandidateID")) %>'
                                            Text=" CV Details "> </asp:LinkButton>
                                        <asp:LinkButton ID="lnkBtnScreenignInfo" CssClass="linkbtn" Font-Size="14px" runat="server"
                                            CausesValidation="False" OnClientClick='<%# String.Format("openWindow(""../ScreeningInterview/frmViewScreeningInterview.aspx?CandidateID={0}"",""Popup"",1000,600);", Eval("CandidateID")) %>'
                                            Text=" Screen "> </asp:LinkButton>
                                        <asp:LinkButton ID="lnkBtnCandidateResponse" CssClass="linkbtn" Font-Size="14px"
                                            runat="server" CausesValidation="False" OnClientClick='<%# String.Format("openWindow(""../ScreeningInterview/frmCanResponseDetails.aspx?CandidateID={0}"",""Popup"",1000,400);", Eval("CandidateID")) %>'
                                            Text=" Response "> </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="App Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAppStatus" runat="server" Text='<%# Bind("AppStatus") %>'></asp:Label>
                                        <asp:Label ID="lblExamTaken" runat="server" Text='<%# Bind("ExamTaken") %>'></asp:Label>
                                        <asp:Label ID="lblInterviewTaken" runat="server" Text='<%# Bind("InterviewTaken") %>'></asp:Label>
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
                <asp:Panel ID="pnlViewRecTypes" runat="server" SkinID="pnlInner">
                    <div>
                        <asp:CheckBoxList ID="chkBxLstRecType" runat="server" CssClass="label" Font-Size="X-Small"
                            RepeatColumns="4">
                        </asp:CheckBoxList>
                    </div>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlModalLocation" runat="server" CssClass="modalBackground" Width="100%"
                    SkinID="pnlInner">
                    <table width="100%">
                        <tr>
                            <td>
                                <div class="widgettitle">
                                    Candidate Suitable Location</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
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
                                                    <asp:CheckBoxList ID="chkBranch" runat="server" RepeatColumns="4" 
                                                        RepeatDirection="Horizontal">
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
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnTagCandidate" runat="server" CssClass="styled-button-1" Text="Tag Candidate" />
                &nbsp;<asp:Button ID="btnClearSelection" runat="server" CssClass="styled-button-1"
                    Text="Clear Selection" />
            </td>
        </tr>
    </table>
</asp:Content>
