<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmCandidateExamResult.aspx.vb" Inherits="frmCandidateExamResult" Title=".:HRM:Exam Result:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="Javascript">
        function printit() {
            if (window.print) {
                window.print();
            } else {
                var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
                document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
                WebBrowser1.ExecWB(6, 2); //Use a 1 vs. a 2 for a prompting dialog box    WebBrowser1.outerHTML = "";  
            }
        }
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
                <asp:Panel ID="pnlExamResultSelection" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="6">
                                <div class="widgettitle">
                                    Exam Result Selection<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td style="width: 20px">
                                &nbsp;
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 200px">
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Select An Exam
                            </td>
                            <td>
                                <asp:DropDownList ID="drpAvailableExams" runat="server" Width="200px" CssClass="InputTxtBox">
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
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
                                    ErrorMessage="Invalid Date" Operator="DataTypeCheck" Type="Date" ValidationGroup="ExamResult">
                                </asp:CompareValidator>
                                <asp:RequiredFieldValidator ID="reqFldStartDate" runat="server" ControlToValidate="txtStartDate"
                                    Display="None" ErrorMessage="Insurance No. Required" ValidationGroup="ExamAttendee"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldStartDate_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldStartDate" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
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
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td valign="bottom">
                                <asp:Button ID="btnShowResult" runat="server" CssClass="styled-button-1" Text="Show Result"
                                    ValidationGroup="ExamResult" />
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:ImageButton ID="imgBtnExportResult" runat="server" ImageUrl="~/Sources/images/Excel.jpg"
                                    Width="30px" />
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
                <asp:Panel ID="pnlExamResult" runat="server" SkinID="pnlInner">
                    <div>
                        <asp:GridView ID="grdExamResult" runat="server" CssClass="mGrid" AutoGenerateColumns="False"
                            AllowSorting="True" EmptyDataText="No Candidate Available">
                            <Columns>
                                <asp:TemplateField HeaderText="ExamID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ExamID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Photo">
                                    <ItemTemplate>
                                        <asp:Image ID="imgEmployee" runat="server" AlternateText="No Image Available" BorderWidth="0px"
                                            CssClass="img" Height="70px" Width="70px"/>
                                        <asp:Label ID="lblPhotoID" runat="server" Visible="false" Text='<%# Eval("Photos")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ExamTakerID" SortExpression="ExamTakerID">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("ExamTakerID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Candidate" SortExpression="Candidate">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Candidate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Branch" SortExpression="ULCBranchName">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("ULCBranchName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ExamRollNo" SortExpression="ExamRollNo">
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("ExamRollNo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="TotalQuestion">
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("TotalQuestion") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="TotalMarks">
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("TotalMarks") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PositiveMarking">
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("PositiveMarking") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="NegativeMarking">
                                    <ItemTemplate>
                                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("NegativeMarking") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ObtainedMarks" SortExpression="ObtainedMarks">
                                    <ItemTemplate>
                                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("ObtainedMarks") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="AttendedAt" SortExpression="AttendedAt">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("AttendedAt") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText=" CV Details " ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkChooseCVDetailsBtn" runat="server" CausesValidation="False"
                                            CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("ExamTakerID","openWindow(""RecuitmentCVView.aspx?CandidateID={0}"",""Popup"",1100,1100);") %>'
                                            Text=" View "></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText=" Exam Details " ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkCandidateExamDetailsBtn" CssClass="linkbtn" Font-Size="14px"
                                            runat="server" CausesValidation="False" OnClientClick='<%# Eval("ExamRollNo","openWindow(""CVMan/frmShowCandidateResult.aspx?ExamRollNo={0}"",""Popup"",1000,1100);") %>'
                                            Text=" View "></asp:LinkButton>
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
            </td>
        </tr>
    </table>
</asp:Content>
