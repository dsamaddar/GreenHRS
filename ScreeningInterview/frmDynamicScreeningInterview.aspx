<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmDynamicScreeningInterview.aspx.vb" Inherits="ScreeningInterview_frmDynamicScreeningInterview"
    Title=".:HRM:Screening Interview:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
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

    <script type="text/javascript">
        window.onload = function() {
            var strCook = document.cookie;
            if (strCook.indexOf("!~") != 0) {
                var intS = strCook.indexOf("!~");
                var intE = strCook.indexOf("~!");
                var strPos = strCook.substring(intS + 2, intE);
                document.getElementById("divCVScreening").scrollTop = strPos;
                }
        }
        function SetDivPosition() {
            var intY = document.getElementById("divCVScreening").scrollTop;
            document.title = intY;
            document.cookie = "yPos=!~" + intY + "~!";
        }
    </script>

    <link href="../Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlCircularSelection" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left">
                                <div class="widgettitle">
                                    Search CV<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                                <asp:DropDownList ID="drpAvailableCircular" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlSearchCV" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
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
                            <td align="left" class="label" style="width: 20px">
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
                                <asp:DropDownList ID="drpPresentDistrict" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td align="left" class="label">
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
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td align="left" class="label">
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
                            <td align="left" style="float: left" class="label">
                                <asp:TextBox ID="txtAgeFrom" runat="server" CssClass="InputTxtBox" Width="60px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MskEdtAgeFrom" runat="server" AcceptNegative="Left" CultureAMPMPlaceholder=""
                                    CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder=""
                                    CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder=""
                                    Enabled="True" ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="99"
                                    MaskType="Number" TargetControlID="txtAgeFrom">
                                </cc1:MaskedEditExtender>
                                &nbsp;-
                                <asp:TextBox ID="txtAgeTo" runat="server" CssClass="InputTxtBox" Width="60px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MskEdtAgeTo" runat="server" AcceptNegative="Left" CultureAMPMPlaceholder=""
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
                                <cc1:MaskedEditExtender ID="MskEdtExperience" runat="server" AcceptNegative="Left"
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
                                <div style="max-height: 100px; max-width: 200px; overflow: auto">
                                </div>
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
                                <asp:Button ID="btnSearchCV" runat="server" CssClass="styled-button-1" Text="Search"
                                    ValidationGroup="SearchCV" />
                                &nbsp;
                                <asp:Button ID="btnCancelCVSelection" runat="server" CssClass="styled-button-1" Text="Cancel" />
                            </td>
                            <td>
                                <asp:DropDownList ID="drpReligion" runat="server" CssClass="InputTxtBox" Width="200px"
                                    Visible="False">
                                    <asp:ListItem Text="N\A" Value="N\A"></asp:ListItem>
                                    <asp:ListItem Text="Muslim" Value="Muslim"></asp:ListItem>
                                    <asp:ListItem Text="Hindu" Value="Hindu"></asp:ListItem>
                                    <asp:ListItem Text="Buddhist" Value="Buddhist"></asp:ListItem>
                                    <asp:ListItem Text="Christian" Value="Christian"></asp:ListItem>
                                    <asp:ListItem Text="Others" Value="Others"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:CheckBoxList ID="chkbxLstSpecializedIn" runat="server" CssClass="InputTxtBox"
                                    Visible="False" Width="200px">
                                </asp:CheckBoxList>
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
        <tr align="center">
            <td>
                <asp:Panel ID="pnlCandidates" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <div id="divCVScreening" onscroll="SetDivPosition()" style="max-height: 250px; overflow: auto">
                                    <asp:GridView ID="grdNewCV" runat="server" AutoGenerateColumns="False" EmptyDataText="No Data Available"
                                        CssClass="mGrid" ShowFooter="True">
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
                                            <asp:TemplateField HeaderText=" Candidate ID ">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCandidateID" runat="server" Text='<%# Bind("CandidateID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText=" Submission Date ">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("EntryDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CircularID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCircularID" runat="server" Text='<%# Bind("CircularID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText=" Candidate ">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCandidateName" runat="server" Text='<%# Bind("CandidateName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText=" Present District ">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPreDistrict" runat="server" Text='<%# Bind("PreDistrictName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText=" Permanent District ">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPerDistrict" runat="server" Text='<%# Bind("PerDistrictName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText=" Highest Degree ">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblHighestDegree" runat="server" Text='<%# Bind("HighestDegree") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText=" Major ">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMajor" runat="server" Text='<%# Bind("Major") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText=" Institution ">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInstitutionName" runat="server" Text='<%# Bind("InstitutionName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText=" CV Details " ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkChooseCVDetailsBtn" runat="server" CausesValidation="False"
                                                        CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("CandidateID","openWindow(""../RecuitmentCVView.aspx?CandidateID={0}"",""Popup"",1100,1100);") %>'
                                                        Text=" View "></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText=" Job Title " Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJobTitle" runat="server" Text='<%# Bind("JobTitle") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Response">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkbtnResponseCount" runat="server" CausesValidation="False"
                                                        CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("CandidateID","openWindow(""frmCanResponseDetails.aspx?CandidateID={0}"",""Popup"",800,800);") %>'
                                                        Text='<%# Bind("Response") %>'></asp:LinkButton>
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
            <td>
                <asp:Panel ID="pnlScrQuestionMethod" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="4">
                                <div class="widgettitle">
                                    Screening Interview</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 250px">
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
                                Communication Method
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rdbtnInterviewMethod" runat="server" CssClass="RadioButton"
                                    RepeatDirection="Horizontal">
                                    <asp:ListItem>Phone</asp:ListItem>
                                    <asp:ListItem>Face-To-Face</asp:ListItem>
                                    <asp:ListItem>Webcam</asp:ListItem>
                                    <asp:ListItem>Chat</asp:ListItem>
                                    <asp:ListItem>Social Networking Site</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldInterviewMethod" runat="server" ControlToValidate="rdbtnInterviewMethod"
                                    Display="None" ErrorMessage="Required" ValidationGroup="CVScreening"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldInterviewMethod_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldInterviewMethod" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rdbtnLstDidNotRespond" runat="server" AutoPostBack="True"
                                    CssClass="chkText" RepeatDirection="Horizontal">
                                    <asp:ListItem>Did Not Respond</asp:ListItem>
                                    <asp:ListItem>Asked To Call Later</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:Panel ID="pnlCandidateResponse" runat="server" SkinID="pnlInner" Width="600px">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td>
                                                Remarks
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtCandidateResponseRemarks" runat="server" CssClass="InputTxtBox"
                                                    Height="50px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                                                &nbsp;<asp:RequiredFieldValidator ID="reqFldCandidateResponseRemarks" runat="server"
                                                    ControlToValidate="txtCandidateResponseRemarks" Display="None" ErrorMessage="Required"
                                                    ValidationGroup="CanResponse"></asp:RequiredFieldValidator>
                                                <cc1:ValidatorCalloutExtender ID="reqFldCandidateResponseRemarks_ValidatorCalloutExtender"
                                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                                    Enabled="True" TargetControlID="reqFldCandidateResponseRemarks" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                </cc1:ValidatorCalloutExtender>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:Button ID="btnMakeAssessment" runat="server" CssClass="styled-button-1" Text="Make Assessment"
                                                    ValidationGroup="CanResponse" />
                                                &nbsp;<asp:Button ID="btnCancelResponse" runat="server" CssClass="styled-button-1"
                                                    Text="Cancel" />
                                            </td>
                                            <td>
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
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlLoadedQuestion" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <div style="max-height: 300px; overflow: auto">
                                    <asp:GridView ID="grdLoanScrQuestions" runat="server" SkinID="grdNoFooter" AutoGenerateColumns="False"
                                        DataSourceID="dataSrcQuestions" CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Sl">
                                                <ItemTemplate>
                                                    <table style="width: 50px">
                                                        <tr>
                                                            <td>
                                                                <b style="color: Green">( Q.
                                                                    <%#CType(Container, GridViewRow).RowIndex + 1%>
                                                                    )</b>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ScreeningQuesID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblScreeningQuesID" runat="server" Text='<%# Bind("ScreeningQuesID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Question">
                                                <ItemTemplate>
                                                    <span style="max-width: 400px;">
                                                        <asp:Label ID="lblQuestion" runat="server" Text='<%# Bind("Question") %>'></asp:Label>
                                                    </span>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Options">
                                                <ItemTemplate>
                                                    <table style="width: 450px">
                                                        <tr>
                                                            <td>
                                                                <asp:RadioButtonList ID="rdbtnScrQuestionOptions" runat="server" CssClass="RadioButton"
                                                                    DataSourceID="dataSrcrdbtnScrQuestionOptions" DataTextField="Options" DataValueField="ScrquesOptionID"
                                                                    RepeatDirection="Horizontal">
                                                                </asp:RadioButtonList>
                                                                <asp:RequiredFieldValidator ID="reqFldrdbtnScrQuestionOptions" ControlToValidate="rdbtnScrQuestionOptions"
                                                                    runat="server" ErrorMessage="Required" ValidationGroup="CVScreening" Display="None"></asp:RequiredFieldValidator>
                                                                <cc1:ValidatorCalloutExtender ID="reqFldrdbtnScrQuestionOptions_ValidatorCalloutExtender"
                                                                    runat="server" Enabled="True" TargetControlID="reqFldrdbtnScrQuestionOptions"
                                                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                                </cc1:ValidatorCalloutExtender>
                                                                <asp:SqlDataSource ID="dataSrcrdbtnScrQuestionOptions" runat="server" SelectCommand="exec spShowScrQuesOptionsByID @ScreeningQuesID"
                                                                    ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" ProviderName="<%$ ConnectionStrings:HRMConnectionString.ProviderName %>">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="lblScreeningQuesID" Name="ScreeningQuesID" PropertyName="Text" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <asp:SqlDataSource ID="dataSrcQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    ProviderName="<%$ ConnectionStrings:HRMConnectionString.ProviderName %>" SelectCommand="exec spGetActiveScreeningQuestions">
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlScrManualQuestion" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td style="width: 20px">
                                &nbsp;
                            </td>
                            <td style="width: 400px" class="label">
                                Do you know anyone in this institution ? Whom?
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rdbtnAnyOneKnownInThisInstitution" runat="server" AutoPostBack="True"
                                    CssClass="RadioButton" RepeatDirection="Horizontal" Width="300px">
                                    <asp:ListItem Text="NO" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="YES" Value="1"></asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:Panel ID="pnlAnyOneKnownToCandidate" runat="server" SkinID="pnlInner" Width="400px">
                                    <table style="width: 100%">
                                        <tr>
                                            <td class="label">
                                                Employee Designation:
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="drpDesignation" runat="server" CssClass="InputTxtBox" Width="200px">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="reqFldEmpDesignation" runat="server" ControlToValidate="drpDesignation"
                                                    Display="None" ErrorMessage="*" ValidationGroup="CVScreening"></asp:RequiredFieldValidator>
                                                <cc1:ValidatorCalloutExtender ID="reqFldEmpDesignation_ValidatorCalloutExtender"
                                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                                    Enabled="True" TargetControlID="reqFldEmpDesignation" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                </cc1:ValidatorCalloutExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="label">
                                                Name Of Employee:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEmployeeName" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="reqFldNameOfEmployee" runat="server" ControlToValidate="txtEmployeeName"
                                                    Display="None" ErrorMessage="*" ValidationGroup="CVScreening"></asp:RequiredFieldValidator>
                                                <cc1:ValidatorCalloutExtender ID="reqFldNameOfEmployee_ValidatorCalloutExtender"
                                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                                    Enabled="True" TargetControlID="reqFldNameOfEmployee" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                </cc1:ValidatorCalloutExtender>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldAnyOneKnownInThisInstitution" runat="server"
                                    ControlToValidate="rdbtnAnyOneKnownInThisInstitution" Display="None" ErrorMessage="Required"
                                    ValidationGroup="CVScreening"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldAnyOneKnownInThisInstitution_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldAnyOneKnownInThisInstitution" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 400px">
                            </td>
                            <td>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 400px" class="label">
                                How do you know the above person ?
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rdbtnHowToKnowThePerson" runat="server" CssClass="RadioButton"
                                    RepeatDirection="Horizontal">
                                    <asp:ListItem>N\A</asp:ListItem>
                                    <asp:ListItem>Relative</asp:ListItem>
                                    <asp:ListItem>Relative Of Friend</asp:ListItem>
                                    <asp:ListItem>Previous Supervisor</asp:ListItem>
                                    <asp:ListItem>Distant Relative</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldHowToKnowThePerson" runat="server" ControlToValidate="rdbtnHowToKnowThePerson"
                                    Display="None" ErrorMessage="Required" ValidationGroup="CVScreening"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldHowToKnowThePerson_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldHowToKnowThePerson" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 400px">
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                                What are your current job responsibilities ?
                            </td>
                            <td>
                                <div style="max-height: 100px; max-width: 500px; overflow: auto">
                                    <asp:CheckBoxList ID="chkListResponsibilityMatch" runat="server" Width="400px" CssClass="chkText">
                                    </asp:CheckBoxList>
                                </div>
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
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Suitable For Recruitment
                            </td>
                            <td>
                                <div style="max-height: 100px; max-width: 500px; overflow: auto">
                                    <asp:CheckBoxList ID="chkLstSuitForRecruitment" runat="server" CssClass="chkText"
                                        Width="400px">
                                    </asp:CheckBoxList>
                                </div>
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
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Reason for rejection/Notes:
                            </td>
                            <td>
                                <asp:TextBox ID="txtTakeVerbatimNotes" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="280px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldTakeVerbatimNotes" runat="server" ControlToValidate="txtTakeVerbatimNotes"
                                    Display="None" ErrorMessage="Required" ValidationGroup="CVScreening"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldTakeVerbatimNotes_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldTakeVerbatimNotes" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlNextAction" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 400px">
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
                                Next Course Of Action
                            </td>
                            <td>
                                <asp:DropDownList ID="drpNextCourseOfAction" runat="server" Width="200px" CssClass="InputTxtBox"
                                    AutoPostBack="true">
                                    <asp:ListItem>Assign Exam</asp:ListItem>
                                    <asp:ListItem>Assign Interview</asp:ListItem>
                                    <asp:ListItem>Rejected</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldNextCourseOfAction" runat="server" ControlToValidate="drpNextCourseOfAction"
                                    Display="None" ErrorMessage="Required" ValidationGroup="CVScreening"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldNextCourseOfAction_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="reqFldNextCourseOfAction" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
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
                            <td>
                                <asp:CheckBoxList ID="chkListSuitableDepartments" runat="server" CssClass="chkText"
                                    Visible="False" Width="120px">
                                </asp:CheckBoxList>
                            </td>
                            <td>
                                <asp:Button ID="btnChooseCV" runat="server" CssClass="styled-button-1" Text="Choose CV"
                                    ValidationGroup="CVScreening" />
                                &nbsp;<asp:Button ID="btnByPassScreening" runat="server" CssClass="styled-button-1"
                                    Text="ByPass" />
                                &nbsp;<asp:Button ID="btnRejectCV" runat="server" CssClass="styled-button-1" OnClientClick="if (!confirm('Are you Sure to Reject the Candidate ?')) return false"
                                    Text="Reject CV" />
                            </td>
                            <td>
                                <asp:CheckBoxList ID="chkLstAppliedCircular" runat="server" CssClass="chkText" Visible="False"
                                    Width="120px">
                                </asp:CheckBoxList>
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
</asp:Content>
