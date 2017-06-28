<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmEmployeement.aspx.vb" Inherits="Recruitment_frmEmployeement" Title="::Employeement::"
    Theme="CommonSkin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="JavaScript" type="text/javascript">
        function openWindow(windowURL, windowName, windowWidth, windowHeight) {

            var left = (screen.width / 2) - (windowWidth / 2);
            var top = (screen.height / 2) - (windowHeight / 2);

            window.name = 'parentWnd';
            newWindow = window.open(windowURL, windowName, 'top=' + top + ',left=' + left + ',width=' + windowWidth + ',height=' + windowHeight + ',toolbar=0,location=no,directories=0, status=0,menuBar=0,scrollBars=1,resizable=1');
            newWindow.focus();
        }

    </script>

    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlInterviewCompleted" runat="server" Width="100%" SkinID="pnlInner">
                    <table width="100%">
                        <tr>
                            <td align="left">
                                <div class="widgettitle">
                                    Generate Employee</div>
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="max-height: 250px; max-width: 100%; overflow: auto">
                                    <asp:GridView ID="grdInterviewCompletedCandidates" runat="server" AutoGenerateColumns="False"
                                        EmptyDataText="No Data Available" CssClass="mGrid" AllowSorting="True">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" CssClass="linkbtn" runat="server" CausesValidation="False"
                                                        CommandName="Select" Text="Select"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ProposalID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblProposalID" runat="server" Text='<%# Bind("ProposalID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CandidateID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCandidateID" runat="server" Text='<%# Bind("CandidateID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="EntryDate">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("EntryDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CircularID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCircularID" runat="server" Text='<%# Bind("CircularID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Candidate">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblReviewCandidateName" runat="server" Text='<%# Bind("CandidateName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Exp. Joining" SortExpression="ExpectedJoiningDate">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("ExpectedJoiningDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="PreDistrict">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPreDistrict0" runat="server" Text='<%# Bind("PreDistrictName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="PerDistrict">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPerDistrict0" runat="server" Text='<%# Bind("PerDistrictName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="HighestDegree">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblHighestDegree0" runat="server" Text='<%# Bind("HighestDegree") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Major">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMajor0" runat="server" Text='<%# Bind("Major") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="InstitutionName">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInstitutionName0" runat="server" Text='<%# Bind("InstitutionName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="JobTitle">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJobTitle0" runat="server" Text='<%# Bind("JobTitle") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Age">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Age") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Gender">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText=" CV Details " ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkChooseCVDetailsBtn" CssClass="linkbtn" Font-Size="14px" runat="server"
                                                        CausesValidation="False" OnClientClick='<%# Eval("CandidateID","openWindow(""../RecuitmentCVView.aspx?CandidateID={0}"",""Popup"",1000,1100);") %>'
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
                <asp:Panel ID="pnlHRUseOnly" runat="server" SkinID="pnlInner" Width="100%">
                    <table>
                        <tr align="left">
                            <td style="width: 20px" class="label">
                            </td>
                            <td class="label" style="width: 150px">
                            </td>
                            <td style="width: 200px">
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
                            <td class="label">
                            </td>
                            <td class="label">
                                Department
                            </td>
                            <td>
                                <asp:DropDownList ID="drpRecommendedDepartment" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldDepartment" runat="server" ControlToValidate="drpRecommendedDepartment"
                                    Display="None" ErrorMessage="Required" ValidationGroup="HRAssessment"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldDepartment_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                        CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldDepartment"
                                        WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                            <td class="label">
                                &nbsp;</td>
                            <td class="label">
                                Location</td>
                            <td class="label">
                                <asp:DropDownList ID="drpRecommendedLocation" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldLocation" runat="server" ControlToValidate="drpRecommendedLocation"
                                    ErrorMessage="*" ValidationGroup="HRAssessment"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldLocation_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                        CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldLocation"
                                        WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                            <td class="label">
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label">
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
                            <td class="label">
                                &nbsp;</td>
                            <td class="label">
                                Employee Type</td>
                            <td>
                                <asp:DropDownList ID="drpEmployeeType" runat="server" CssClass="InputTxtBox" DataSourceID="dsEmployeeType"
                                    DataTextField="EmployeeTypeName" DataValueField="EmployeeTypeID" Width="200px">
                                </asp:DropDownList>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldEmployeeType" runat="server" ControlToValidate="drpEmployeeType"
                                    Display="None" ErrorMessage="Required" ValidationGroup="HRAssessment"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldEmployeeType_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                        CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldEmployeeType"
                                        WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label">
                            </td>
                            <td class="label">
                                Expected Joining Date
                            </td>
                            <td>
                                <asp:TextBox ID="txtExpectedJoiningDate" runat="server" CssClass="InputTxtBox" Width="120px"
                                    ReadOnly="true"></asp:TextBox>
                            </td>
                            <td class="label">
                                &nbsp;</td>
                            <td class="label">
                                Joining Date</td>
                            <td>
                                <asp:TextBox ID="txtJoiningDate" runat="server" CssClass="InputTxtBox" Width="120px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtJoiningDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtJoiningDate">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldJoiningDate" runat="server" ControlToValidate="txtJoiningDate"
                                    Display="None" ErrorMessage="Required" ValidationGroup="HRAssessment"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="txtJoiningDate_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                        CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldJoiningDate"
                                        WarningIconImageUrl="~/Sources/images/Valwarning.png">
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
                                Remarks</td>
                            <td>
                                <asp:TextBox ID="txtRemarks" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="300px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldObservations" runat="server" ControlToValidate="txtRemarks"
                                    Display="None" ErrorMessage="Required" ValidationGroup="HRAssessment"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldObservations_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                        CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldObservations"
                                        WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                            <td class="label">
                                &nbsp;</td>
                            <td class="label">
                                Send Mail To Admin<br />
                                Send Mail To ICT</td>
                            <td class="label">
                                <asp:CheckBox ID="chkSendMailToAdmin" runat="server" CssClass="label" 
                                    Text="(Check If YES)" />
                                <br />
                                <asp:CheckBox ID="chkSendMailToICT" runat="server" Checked="True" 
                                    CssClass="label" Text="(Check If YES)" />
                            </td>
                            <td class="label">
                                &nbsp;
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
                                &nbsp;</td>
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
                            </td>
                            <td>
                                <asp:Button ID="btnEmployeement" runat="server" CssClass="styled-button-1" OnClientClick="if (!confirm('Are you Sure to Make Employeement ?')) return false"
                                    Text="Employeement" ValidationGroup="HRAssessment" />
                                &nbsp;<asp:Button ID="btnNotJoined" runat="server" CssClass="styled-button-1" Text="Not Joined"
                                    OnClientClick="if (!confirm('Are you Sure to Show Not Joined ?')) return false" />
                                &nbsp;<asp:Button ID="btnRemoveAppointment" runat="server" CssClass="styled-button-1"
                                    Text="Remove"  OnClientClick="if (!confirm('Are you Sure To Remove Appointment ?')) return false"  />
                            </td>
                            <td>
                                <asp:Button ID="btnCancelSelection" runat="server" CssClass="styled-button-1" 
                                    Text="Cancel" />
                            </td>
                            <td>
                                <asp:SqlDataSource ID="dsEmployeeType" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="SELECT EmployeeTypeID, EmployeeTypeName FROM tblEmployeeType WHERE (isActive = 1)">
                                </asp:SqlDataSource>
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
                            </td>
                            <td>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
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
        <tr align="center">
            <td>
                <asp:Panel ID="pnlNotJoinedCandidateList" runat="server" SkinID="pnlInner">
                    <table width="100%">
                        <tr>
                            <td>
                                <div class="widgettitle">
                                    Not Joined Applicant
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="grdNotJoinedCandidates" runat="server" AutoGenerateColumns="False"
                                    EmptyDataText="No Data Available" CssClass="mGrid" AllowSorting="True">
                                    <Columns>
                                        <asp:TemplateField HeaderText="ProposalID" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblProposalIDNotJoined" runat="server" Text='<%# Bind("ProposalID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Reverse" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkBtnReverse" runat="server" CausesValidation="False" 
                                                    CommandName="Select" Text="Reverse"  OnClientClick="if (!confirm('Are you Sure to Reverse The Not Joined Proposal ?')) return false"  ></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="CandidateID">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCandidateID0" runat="server" Text='<%# Bind("CandidateID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="EntryDate">
                                            <ItemTemplate>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("EntryDate") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="CircularID" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCircularID0" runat="server" Text='<%# Bind("CircularID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Candidate">
                                            <ItemTemplate>
                                                <asp:Label ID="lblReviewCandidateName0" runat="server" Text='<%# Bind("CandidateName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Exp. Joining" SortExpression="ExpectedJoiningDate">
                                            <ItemTemplate>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("ExpectedJoiningDate") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="PreDistrict">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPreDistrict1" runat="server" Text='<%# Bind("PreDistrictName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="PerDistrict">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPerDistrict1" runat="server" Text='<%# Bind("PerDistrictName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="HighestDegree">
                                            <ItemTemplate>
                                                <asp:Label ID="lblHighestDegree1" runat="server" Text='<%# Bind("HighestDegree") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Major">
                                            <ItemTemplate>
                                                <asp:Label ID="lblMajor1" runat="server" Text='<%# Bind("Major") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="InstitutionName">
                                            <ItemTemplate>
                                                <asp:Label ID="lblInstitutionName1" runat="server" Text='<%# Bind("InstitutionName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="JobTitle">
                                            <ItemTemplate>
                                                <asp:Label ID="lblJobTitle1" runat="server" Text='<%# Bind("JobTitle") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Age">
                                            <ItemTemplate>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Age") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Gender">
                                            <ItemTemplate>
                                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText=" CV Details " ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkChooseCVDetailsBtn0" CssClass="linkbtn" Font-Size="14px" runat="server"
                                                    CausesValidation="False" OnClientClick='<%# Eval("CandidateID","openWindow(""../RecuitmentCVView.aspx?CandidateID={0}"",""Popup"",1000,1100);") %>'
                                                    Text=" View ">
                                                </asp:LinkButton>
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
    </table>
</asp:Content>
