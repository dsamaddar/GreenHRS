<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmCandidateProfile.aspx.vb" Inherits="frmCandidateProfile" Title=".:HRM:Candidate Profile:."
    Theme="CommonSkin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script src="Sources/js/jquery.min.js" type="text/javascript"></script>

    <script src="Sources/js/MaxLength.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            //Specifying the Character Count control explicitly
            $("[id*=txtSMSContent]").MaxLength(
            {
                MaxLength: 160,
                CharacterCountControl: $('#counter')
            });
        });
    </script>

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

    <table style="width: 100%;">
        <tr align="center">
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
                                <cc1:ValidatorCalloutExtender ID="reqFldCandidateNameOrID_ValidatorCalloutExtender"
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
        <tr align="center">
            <td>
                <table style="width: 100%">
                    <tr>
                        <td>
                            <asp:Panel ID="pnlMatchedApplicant" runat="server" Width="100%" SkinID="pnlInner">
                                <div id="divgrd" onscroll="SetDivPosition()" style="max-height: 300px; max-width: 100%;
                                    overflow: auto">
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
                                            <%--  <asp:TemplateField HeaderText="Pre District">
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
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="Age">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("Age") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:TemplateField HeaderText="Gender">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
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
                                                        CausesValidation="False" OnClientClick='<%# String.Format("openWindow(""RecuitmentCVView.aspx?CandidateID={0}"",""Popup"",1000,900);", Eval("CandidateID")) %>'
                                                        Text=" CV Details "> </asp:LinkButton>
                                                    <asp:LinkButton ID="lnkBtnScreenignInfo" CssClass="linkbtn" Font-Size="14px" runat="server"
                                                        CausesValidation="False" OnClientClick='<%# String.Format("openWindow(""ScreeningInterview/frmViewScreeningInterview.aspx?CandidateID={0}"",""Popup"",1000,600);", Eval("CandidateID")) %>'
                                                        Text=" Screen "> </asp:LinkButton>
                                                    <asp:LinkButton ID="lnkBtnCandidateResponse" CssClass="linkbtn" Font-Size="14px"
                                                        runat="server" CausesValidation="False" OnClientClick='<%# String.Format("openWindow(""ScreeningInterview/frmCanResponseDetails.aspx?CandidateID={0}"",""Popup"",1000,400);", Eval("CandidateID")) %>'
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
                </table>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlCandidateProfileInfo" runat="server" SkinID="pnlInner" Width="100%">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td>
                                <div class="widgettitle">
                                    Applied Jobs</div>
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                                <asp:GridView ID="grdAppliedJobStatus" runat="server" AutoGenerateColumns="False"
                                    EmptyDataText="No Applied Job Info" CssClass="mGrid">
                                    <Columns>
                                        <asp:TemplateField HeaderText="CircularID" Visible="False">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("CircularID") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("CircularID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="CandidateID" Visible="False">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("CandidateID") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("CandidateID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Circular">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Circular") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Circular") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ReviewedBy">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ReviewedBy") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("ReviewedBy") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ReviewedDate">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ReviewedDate") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ReviewedDate") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="RejectedBy">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("RejectedBy") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("RejectedBy") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="RejectionRemarks">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("RejectionRemarks") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("RejectionRemarks") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="RejectedDate" HeaderText="RejectedDate" />
                                        <asp:TemplateField HeaderText="CurrentStatus">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("CurrentStatus") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("CurrentStatus") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText=" Assessment " ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkBtnGrdIntAssessment" CssClass="linkbtn" Font-Size="14px" runat="server"
                                                    CausesValidation="False" OnClientClick='<%# String.Format("openWindow(""Recruitment/frmShowInterviewAssessment.aspx?CandidateID={0}&CircularID={1}"",""Popup"",1000,400);", Eval("CandidateID"), Eval("CircularID")) %>'
                                                    Text=" Assessment "> </asp:LinkButton>
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
            <td>
                <asp:Panel ID="pnlMessageOptions" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="4">
                                <div class="widgettitle">
                                    Message Options</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                                &nbsp;
                            </td>
                            <td style="width: 200px" class="label">
                                &nbsp;
                            </td>
                            <td style="width: 450px">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Communication Method
                            </td>
                            <td>
                                <asp:CheckBoxList ID="chkLstCommMethod" runat="server" CssClass="chkText" RepeatDirection="Horizontal">
                                    <asp:ListItem>SMS</asp:ListItem>
                                    <asp:ListItem>EMail</asp:ListItem>
                                </asp:CheckBoxList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                SMS Content (Max 160 Char)
                            </td>
                            <td>
                                <div id="counter" style="color: Red; font-family: Verdana">
                                </div>
                                <asp:TextBox ID="txtSMSContent" runat="server" CssClass="InputTxtBox" Height="80px"
                                    TextMode="MultiLine" Width="400px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                E-Mail Content
                            </td>
                            <td>
                                <asp:TextBox ID="txtEMailContent" runat="server" CssClass="InputTxtBox" Height="80px"
                                    TextMode="MultiLine" Width="400px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnSubmit" runat="server" CssClass="styled-button-1" Text="Submit" />
                                &nbsp;<asp:Button ID="btnCancelSelection" runat="server" CssClass="styled-button-1"
                                    Text="Cancel" />
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
