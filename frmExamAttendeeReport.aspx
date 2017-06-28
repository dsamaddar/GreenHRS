<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmExamAttendeeReport.aspx.vb" Inherits="frmExamAttendeeReport" Title=".:HRM:Exam Attendee Report:." %>

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

    <script type="text/javascript">
        window.onload = function() {
            var strCook = document.cookie;
            if (strCook.indexOf("!~") != 0) {
                var intS = strCook.indexOf("!~");
                var intE = strCook.indexOf("~!");
                var strPos = strCook.substring(intS + 2, intE);
                document.getElementById("divAvailableCandidate").scrollTop = strPos;
                }
        }
        function SetDivPosition() {
            var intY = document.getElementById("divAvailableCandidate").scrollTop;
            document.title = intY;
            document.cookie = "yPos=!~" + intY + "~!";
        }
    </script>

    <script language="Javascript">

/*
This script is written by Eric (Webcrawl@usa.net)
For full source code, installation instructions,
100's more DHTML scripts, and Terms Of
Use, visit dynamicdrive.com
*/

function printit(){  
if (window.print) {
    window.print() ;  
} else {
    var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
    WebBrowser1.ExecWB(6, 2);//Use a 1 vs. a 2 for a prompting dialog box    WebBrowser1.outerHTML = "";  
}
}
    </script>

    <script language="Javascript">  
var NS = (navigator.appName == "Netscape");
var VERSION = parseInt(navigator.appVersion);
if (VERSION > 3) {
    document.write('<form><input type=button value="Print this Page" name="Print" onClick="printit()"></form>');        
}
    </script>

    <table style="width: 100%;">
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlExamAttendeeReport" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="6">
                                <div class="widgettitle">
                                    Exam Attendee Report</div>
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
                            <td class="label">
                                Start Date<span class="RequiredLabel">*</span>
                            </td>
                            <td class="label">
                                <asp:TextBox ID="txtStartDate" runat="server" CssClass="InputTxtBox" Width="100px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtStartDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtStartDate">
                                </cc1:CalendarExtender>
                                &nbsp;(MM/DD/YYYY)
                                <asp:CompareValidator ID="dateValidatorStartDate" runat="server" ControlToValidate="txtStartDate"
                                    ErrorMessage="Invalid Date" Operator="DataTypeCheck" Type="Date" ValidationGroup="ExamAttendee">
                                </asp:CompareValidator>
                                <asp:RequiredFieldValidator ID="reqFldStartDate" runat="server" ControlToValidate="txtStartDate"
                                    Display="None" ErrorMessage="Insurance No. Required" ValidationGroup="ExamAttendee"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldStartDate_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldStartDate" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                                End Date<span class="RequiredLabel">*</span>
                            </td>
                            <td class="label">
                                <asp:TextBox ID="txtEndDate" runat="server" CssClass="InputTxtBox" Width="100px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtEndDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtEndDate">
                                </cc1:CalendarExtender>
                                &nbsp;(MM/DD/YYYY)
                                <asp:CompareValidator ID="dateValidatorEndDate" runat="server" ControlToValidate="txtEndDate"
                                    ErrorMessage="Invalid Date" Operator="DataTypeCheck" Type="Date" ValidationGroup="ExamAttendee">
                                </asp:CompareValidator>
                                <asp:RequiredFieldValidator ID="reqFldEndDate" runat="server" ControlToValidate="txtEndDate"
                                    Display="None" ErrorMessage="Insurance No. Required" ValidationGroup="ExamAttendee"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldEndDate_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldEndDate" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnShowReport" runat="server" Text="Show Report" CssClass="styled-button-1"
                                    ValidationGroup="ExamAttendee" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                                <asp:ImageButton ID="imgBtnExportResult" runat="server" ImageUrl="~/Sources/images/Excel.jpg"
                                    Width="30px" />
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
                <asp:Panel ID="pnlAvailableCandidates" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <div id="divAvailableCandidate" onscroll="SetDivPosition()" style="max-width: 100%;
                                    max-height: 100%; overflow: auto">
                                    <asp:GridView ID="grdExamAttendeeReport" runat="server" AutoGenerateColumns="False"
                                        CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Photo">
                                                <ItemTemplate>
                                                    <asp:Image AlternateText="No Image Available" BorderWidth="0px" ID="imgEmployee"
                                                        runat="server" Width="80px" Height="90px" CssClass="img" ImageUrl='<%# "~/Attachments/"+ Eval("Photos")%>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ExamTakerID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblExamTakerID" runat="server" Text='<%# Bind("ExamTakerID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="UserName">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="UserID">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("UserID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Password">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ExamRollNo">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblExamRollNo" runat="server" Text='<%# Bind("ExamRollNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="EffectiveDate">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("EffectiveDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ContactNo">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("ContactNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Email">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="AlternateEmail">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("AlternateEmail") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ExamDate">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("ExamDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText=" CV Details " ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkChooseCVDetailsBtn" runat="server" CausesValidation="False"
                                                        CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("ExamTakerID","openWindow(""RecuitmentCVView.aspx?CandidateID={0}"",""Popup"",1100,1100);") %>'
                                                        Text=" View ">
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ShowHeader="False" HeaderText="Activate Exam">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkbtnActiveExam" runat="server" CausesValidation="False" CommandName="Select"
                                                        Text="Activate Exam" OnClientClick="if (!confirm('Are you Sure to Activate The Exam ?')) return false"></asp:LinkButton>
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
            </td>
        </tr>
    </table>
</asp:Content>
