<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmInterviewPanel.aspx.vb" Inherits="InterviewPanel_frmInterviewPanel"
    Title=".:HRM:Interview Board:." %>

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
                                <div id="divgrd" onscroll="SetDivPosition()" style="max-height: 250px; max-width: 100%;
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
                                            <asp:TemplateField HeaderText="CandidateID">
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
                                            <asp:BoundField DataField="IntTeamName" HeaderText="Team" />
                                            <asp:BoundField DataField="InterviewDate" HeaderText="Interview Date" />
                                            <asp:BoundField DataField="PreDistrictName" HeaderText="Pre.District" />
                                            <asp:BoundField DataField="PerDistrictName" HeaderText="Per.District" />
                                            <asp:BoundField DataField="HighestDegree" HeaderText=" Highest Degree " />
                                            <asp:BoundField DataField="Major" HeaderText=" Major " />
                                            <asp:BoundField DataField="InstitutionName" HeaderText=" Institution " />
                                            <asp:BoundField DataField="Age" HeaderText=" Age " />
                                            <asp:BoundField DataField="Gender" HeaderText=" Gender " />
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
            <td>
                <asp:Panel ID="pnlInterviewAttendees" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td valign="top">
                                <asp:Panel ID="pnlIntPanelMembers" runat="server" Width="700px" SkinID="pnlInner">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td align="left">
                                                <div class="widgettitle">
                                                    Interview Panel Members</div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div style="max-height: 200px; max-width: 690px; overflow: auto">
                                                    <asp:GridView ID="grdPanelMembers" runat="server" AutoGenerateColumns="False" CssClass="mGrid"
                                                        SkinID="grdNoFooter">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                                                        Text="Select"></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="IntTeamName" HeaderText=" Team " />
                                                            <asp:TemplateField HeaderText="EmployeeID" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblEmployeeIDIntAttendee" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="EmployeeName" HeaderText=" Employee " />
                                                            <asp:BoundField DataField="OfficialDesignation" HeaderText=" Designation " />
                                                            <asp:BoundField DataField="DeptName" HeaderText=" Department " />
                                                            <asp:BoundField DataField="ULCBranchName" HeaderText=" Branch " />
                                                            <asp:BoundField DataField="MemberType" HeaderText=" Member Type " />
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td valign="top">
                                <asp:Panel ID="pnlActualAttendees" runat="server" Width="300px" SkinID="pnlInner">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td align="left">
                                                <div class="widgettitle">
                                                    Interview Attendees</div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="grdActualAttendees" runat="server" CssClass="mGrid" AutoGenerateColumns="False">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="EmployeeID" Visible="False">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblActualIntAttEmployeeID" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="EmployeeName">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:Label>
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
                            <td colspan="2" align="center">
                                <asp:Panel ID="pnlCredentials" runat="server" Width="760px" SkinID="pnlInner">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td colspan="7" align="left">
                                                <div class="widgettitle">
                                                    Provide Credentials</div>
                                            </td>
                                        </tr>
                                        <tr align="left">
                                            <td style="width: 20px">
                                            </td>
                                            <td style="width: 150px" class="label">
                                                Name
                                            </td>
                                            <td style="width: 200px">
                                                <asp:Label ID="lblInterviewAttendee" runat="server" CssClass="label"></asp:Label>
                                            </td>
                                            <td style="width: 20px">
                                                &nbsp;
                                            </td>
                                            <td style="width: 150px">
                                            </td>
                                            <td style="width: 200px">
                                                <asp:Label ID="lblEmployeeID" runat="server" CssClass="label" Visible="False"></asp:Label>
                                            </td>
                                            <td style="width: 20px">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr align="left">
                                            <td>
                                            </td>
                                            <td class="label">
                                                User ID
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtAttendeeUserID" runat="server" CssClass="InputTxtBox" Width="200px"
                                                    ValidationGroup="IntAttendees"></asp:TextBox>
                                            </td>
                                            <td class="label">
                                                &nbsp;
                                            </td>
                                            <td class="label">
                                                Password
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtAttendeePassword" runat="server" CssClass="InputTxtBox" Width="200px"
                                                    ValidationGroup="IntAttendees" TextMode="Password"></asp:TextBox>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr align="left">
                                            <td>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="reqFldUserID" runat="server" ControlToValidate="txtAttendeeUserID"
                                                    Display="None" ErrorMessage="Required: UserID" ValidationGroup="IntAttendees"></asp:RequiredFieldValidator>
                                                <cc1:ValidatorCalloutExtender ID="reqFldUserID_ValidatorCalloutExtender" runat="server"
                                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                                    TargetControlID="reqFldUserID" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                </cc1:ValidatorCalloutExtender>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnAddAttendees" runat="server" CssClass="styled-button-1" Text="Login"
                                                    ValidationGroup="IntAttendees" />
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="reqFldPassword" runat="server" ControlToValidate="txtAttendeePassword"
                                                    Display="None" ErrorMessage="Required: Password" ValidationGroup="IntAttendees"></asp:RequiredFieldValidator>
                                                <cc1:ValidatorCalloutExtender ID="reqFldPassword_ValidatorCalloutExtender" runat="server"
                                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                                    TargetControlID="reqFldPassword" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                </cc1:ValidatorCalloutExtender>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                &nbsp;
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
        <tr align="center">
            <td>
                <asp:Panel ID="pnl" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%">
                        <tr>
                            <td align="left" colspan="6">
                                <div class="widgettitle">
                                    Summary Information</div>
                            </td>
                            <td align="right" rowspan="9" valign="top">
                                <table width="100%">
                                    <tr>
                                        <td align="left">
                                            <div class="widgettitle">
                                                Photo</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Image ID="imgValidation" runat="server" BorderStyle="Ridge" BorderWidth="2px"
                                                Width="150px" />
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
                                </table>
                            </td>
                        </tr>
                        <tr align="left">
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
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td class="label">
                                Name
                            </td>
                            <td>
                                <asp:TextBox ID="txtName" runat="server" CssClass="InputTxtBox" Enabled="false" Width="200px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Father&#39;s Name
                            </td>
                            <td>
                                <asp:TextBox ID="txtFatherName" runat="server" CssClass="InputTxtBox" Enabled="false"
                                    Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Father&#39;s Occupation
                            </td>
                            <td>
                                <asp:TextBox ID="txtFarherOccupation" runat="server" CssClass="InputTxtBox" ReadOnly="true"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Mother&#39;s Name
                            </td>
                            <td>
                                <asp:TextBox ID="txtMotherName" runat="server" CssClass="InputTxtBox" Enabled="false"
                                    Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Mother&#39;s Occupation</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtMotherOccupation" runat="server" CssClass="InputTxtBox" Enabled="false"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Spouse Name </b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtSpouseName" runat="server" CssClass="InputTxtBox" Enabled="false"
                                    Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Spouse Occupation</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtSpouseOccupation" runat="server" CssClass="InputTxtBox" Enabled="false"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Gender</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtgender" runat="server" CssClass="InputTxtBox" Enabled="false"
                                    Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Relationship Status
                            </td>
                            <td>
                                <asp:TextBox ID="txtRelationshipStatus" runat="server" CssClass="InputTxtBox" Enabled="false"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Nationality
                            </td>
                            <td>
                                <asp:TextBox ID="txtNationality" runat="server" CssClass="InputTxtBox" Enabled="false"
                                    Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Religion
                            </td>
                            <td>
                                <asp:TextBox ID="txtReligion" runat="server" CssClass="InputTxtBox" Enabled="false"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                No of Children and Age
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtNoofChildrenAndAge" runat="server" CssClass="InputTxtBox" Height="50px"
                                    ReadOnly="True" TextMode="MultiLine" Width="200px"></asp:TextBox>
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
                                <asp:LinkButton ID="lnkBtnCandidateCVDetails" runat="server" Font-Bold="true" ForeColor="#FF0066"
                                    Visible="False">Details CV</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel runat="server" ID="pnlOuter" Width="100%" SkinID="pnlInner">
                    <table width="100%">
                        <tr>
                            <td colspan="6" align="left">
                                <div class="widgettitle">
                                    Expectation</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="center">
                            <td align="left" class="label" style="width: 20px">
                            </td>
                            <td align="left" class="label">
                                <b>Preferred Job Location</b>&nbsp;
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtPreferredJobLocation" runat="server" CssClass="InputTxtBox" Enabled="false"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label ">
                                <b>Expected Salary</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtExpectedSalary" runat="server" CssClass="InputTxtBox" Enabled="false"
                                    Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="center">
                            <td align="left" class="label ">
                            </td>
                            <td align="left" class="label ">
                                <b>Last Drawn Salary And Date</b>&nbsp;
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtPresentSalary" runat="server" CssClass="InputTxtBox" Enabled="false"
                                    Width="100px"></asp:TextBox>
                                &nbsp;<asp:TextBox ID="txtPreSalDrawndate" runat="server" CssClass="InputTxtBox"
                                    Enabled="false" Width="95px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label ">
                                <b>Employeer</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtEmployeer" runat="server" CssClass="InputTxtBox" Enabled="false"
                                    Width="200px"></asp:TextBox>
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
            <td style="margin-left: 40px">
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
                                <div style="max-height: 250px; max-width: 100%; overflow: auto">
                                    <asp:GridView ID="grdMandatoryIntQuestions" runat="server" AutoGenerateColumns="False"
                                        CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Select">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkIntManQuestion" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="SL.No.">
                                                <ItemTemplate>
                                                    <b>
                                                        <%#CType(Container, GridViewRow).RowIndex + 1%></b>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="IntManQuestionID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIntManQuestionID" runat="server" Text='<%# Bind("IntManQuestionID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Question" HeaderText=" Question " />
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
                <asp:Panel ID="pnlIntApplicantAssessment" runat="server" SkinID="pnlInner" Width="100%">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" colspan="5">
                                <div class="widgettitle">
                                    Interview Assessment</div>
                            </td>
                        </tr>
                        <tr align="left">
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
                            <td align="left" class="label">
                                Suitable Position
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpRecommendedPosition" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td align="left" class="label">
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
                            <td class="label">
                                Observation
                            </td>
                            <td>
                                <asp:TextBox ID="txtObservation" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldObservations" runat="server" ControlToValidate="txtObservation"
                                    ErrorMessage="*" ValidationGroup="ApplicantAssessment"></asp:RequiredFieldValidator>
                            </td>
                            <td class="label">
                                Suitable For Recruitment
                            </td>
                            <td class="label">
                                <div style="max-height: 100px; max-width: 500px; overflow: auto">
                                    <asp:CheckBoxList ID="chkLstSuitForRecruitment" runat="server" CssClass="chkText"
                                        Font-Size="X-Small">
                                    </asp:CheckBoxList>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td class="label">
                                Obtained Marks</td>
                            <td class="label">
                                <asp:TextBox ID="txtMarksObtained" runat="server" CssClass="InputTxtBox" 
                                    Width="60px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MskEdtMarksObtained" runat="server" 
                                    AcceptNegative="Left" ErrorTooltipEnabled="True" InputDirection="RightToLeft" 
                                    Mask="99.99" MaskType="Number" MessageValidatorTip="true" 
                                    TargetControlID="txtMarksObtained" />
                                &nbsp;Out Of
                                <asp:TextBox ID="txtMarksOutOf" runat="server" CssClass="InputTxtBox" 
                                    Width="60px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MskEdtMarksOutOf" runat="server" 
                                    AcceptNegative="Left" ErrorTooltipEnabled="True" InputDirection="RightToLeft" 
                                    Mask="99.99" MaskType="Number" MessageValidatorTip="true" 
                                    TargetControlID="txtMarksOutOf" />
                            </td>
                            <td class="label">
                                &nbsp;</td>
                            <td class="label">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left">
                                <asp:Button ID="btnMakeAssessment" runat="server" CssClass="styled-button-1" 
                                    OnClientClick="if (!confirm('Are you Sure to Make Assessment ?')) return false" 
                                    Text="Submit" ValidationGroup="ApplicantAssessment" />
                                &nbsp;<asp:Button ID="btnCancelSelection" runat="server" CssClass="styled-button-1" 
                                    Text="Cancel" />
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                                <cc1:MaskedEditValidator ID="MskEdtValMarksObtained" runat="server" 
                                    ControlExtender="MskEdtMarksObtained" ControlToValidate="txtMarksObtained" 
                                    EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers" 
                                    IsValidEmpty="false" MaximumValue="99" MaximumValueMessage=" &lt; 11" 
                                    MinimumValue="0" MinimumValueMessage=" &gt; -1" 
                                    ToolTip="Enter values from 0 to 10" ValidationGroup="ApplicantAssessment">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </cc1:MaskedEditValidator>
                                &nbsp;<cc1:MaskedEditValidator ID="MskEdtValMarksOutOf" runat="server" 
                                    ControlExtender="MskEdtMarksOutOf" ControlToValidate="txtMarksOutOf" 
                                    EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers" 
                                    IsValidEmpty="false" MaximumValue="99" MaximumValueMessage=" &lt; 11" 
                                    MinimumValue="0" MinimumValueMessage=" &gt; -1" 
                                    ToolTip="Enter values from 0 to 10" ValidationGroup="ApplicantAssessment">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </cc1:MaskedEditValidator>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
