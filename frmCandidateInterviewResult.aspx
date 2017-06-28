<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmCandidateInterviewResult.aspx.vb" Inherits="frmCandidateInterviewResult"
    Title=".:HRM:Interview Result:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script src="Sources/js/jquery.min.js" type="text/javascript"></script>

    <script src="Sources/js/jquery.tablesorter.min.js" type="text/javascript"></script>

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
                document.getElementById("divgrd").scrollTop = strPos;
            }
        }
        function SetDivPosition() {
            var intY = document.getElementById("divgrd").scrollTop;
            document.title = intY;
            document.cookie = "yPos=!~" + intY + "~!";
        }

        window.scrollBy(100, 100); 
    </script>

    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Panel ID="pnlSearchIntResult" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="5">
                                <div class="widgettitle">
                                    Search Interview Candidates<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
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
                                &nbsp;
                            </td>
                            <td class="label">
                                Date From
                            </td>
                            <td class="label">
                                <asp:TextBox ID="txtStartDate" runat="server" CssClass="InputTxtBox" Width="100px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtStartDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtStartDate">
                                </cc1:CalendarExtender>
                                &nbsp;(MM/DD/YYYY)
                                <asp:CompareValidator ID="dateValidatorStartDate" runat="server" ControlToValidate="txtStartDate"
                                    ErrorMessage="Invalid Date" Operator="DataTypeCheck" Type="Date" ValidationGroup="ExamResult">
                                </asp:CompareValidator>
                                <asp:RequiredFieldValidator ID="reqFldStartDate" runat="server" ControlToValidate="txtStartDate"
                                    Display="None" ErrorMessage="Insurance No. Required" ValidationGroup="ExamAttendee"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldStartDate_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldStartDate" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td class="label">
                                Date To
                            </td>
                            <td class="label">
                                <asp:TextBox ID="txtEndDate" runat="server" CssClass="InputTxtBox" Width="100px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtEndDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtEndDate">
                                </cc1:CalendarExtender>
                                &nbsp;(MM/DD/YYYY)
                                <asp:CompareValidator ID="dateValidatorEndDate" runat="server" ControlToValidate="txtEndDate"
                                    ErrorMessage="Invalid Date" Operator="DataTypeCheck" Type="Date" ValidationGroup="ExamResult">
                                </asp:CompareValidator>
                                <asp:RequiredFieldValidator ID="reqFldEndDate" runat="server" ControlToValidate="txtStartDate"
                                    Display="None" ErrorMessage="Insurance No. Required" ValidationGroup="ExamAttendee"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                    CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldEndDate"
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnSearch" runat="server" CssClass="styled-button-1" Text="Search" />
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
                <div id="divgrd" onscroll="SetDivPosition()" style="max-height: 300px; max-width: 100%;
                    overflow: auto">
                    <asp:GridView ID="grdIntCandidates" runat="server" AutoGenerateColumns="False" CssClass="mGrid">
                        <Columns>
                            <asp:TemplateField HeaderText="Select">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelectIntCandidate" runat="server" />
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
                            <asp:TemplateField HeaderText="CircularID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("CircularID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CandidateName">
                                <ItemTemplate>
                                    <asp:Label ID="lblCandidateName" runat="server" Text='<%# Bind("CandidateName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ContactNo">
                                <ItemTemplate>
                                    <asp:Label ID="lblContactNo" runat="server" Text='<%# Bind("ContactNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Team">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Team") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="InterviewDate">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("InterviewDate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="IntTaken">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("IntTaken") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Grade">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Grade") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText=" Options " ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkChooseCVDetailsBtn" runat="server" CausesValidation="False"
                                        CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("CandidateID","openWindow(""RecuitmentCVView.aspx?CandidateID={0}"",""Popup"",1100,1100);") %>'
                                        Text=" CV "></asp:LinkButton>
                                    &nbsp;
                                    <asp:LinkButton ID="lnkBtnGrdIntAssessment" CssClass="linkbtn" Font-Size="14px" runat="server"
                                        CausesValidation="False" OnClientClick='<%# String.Format("openWindow(""Recruitment/frmShowInterviewAssessment.aspx?CandidateID={0}&CircularID={1}"",""Popup"",1000,400);", Eval("CandidateID"), Eval("CircularID")) %>'
                                        Text=" Assessment "> </asp:LinkButton>
                                    &nbsp;
                                    <asp:LinkButton ID="lnkBtnCandidateResponse" CssClass="linkbtn" Font-Size="14px"
                                        runat="server" CausesValidation="False" OnClientClick='<%# String.Format("openWindow(""ScreeningInterview/frmCanResponseDetails.aspx?CandidateID={0}"",""Popup"",1000,400);", Eval("CandidateID")) %>'
                                        Text=" Response "> </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </td>
        </tr>
        <tr>
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
                            <td style="width: 20px">
                            </td>
                            <td class="label" style="width: 200px">
                                Reject Candidate
                            </td>
                            <td style="width: 450px">
                                <asp:CheckBox ID="chkCandidateRejection" runat="server" CssClass="chkText" Text="Reject" />
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

    <script language="javascript" type="text/javascript">
        $(document).ready(function(){
            var elem = document.getElementById('<%=grdIntCandidates.ClientID%>');
            $(elem).tablesorter();
         }); 
    </script>

</asp:Content>
