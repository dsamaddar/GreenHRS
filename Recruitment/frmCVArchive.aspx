<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmCVArchive.aspx.vb" Inherits="Recruitment_frmCVArchive"
    Title=".:HRS:CV Archive:." %>

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

    <table style="width: 100%;">
        <tr>
            <td>
                <div class="widget-title">
                    CV Archieve</div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="drpRecTypeList" runat="server" Width="300px" CssClass="InputTxtBox"
                    AutoPostBack="True">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <table style="width: 100%;">
                    <tr>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="pnlRejectedCV" runat="server" SkinID="pnlInner">
                                <div id="divCandidate" onscroll="SetDivPosition()" style="max-height: 400px; overflow: auto">
                                    <asp:GridView ID="grdRejectedCV" runat="server" AutoGenerateColumns="False" CssClass="mGrid"
                                        EmptyDataText="No Data Available" ShowFooter="True">
                                        <Columns>
                                            <asp:TemplateField HeaderText=" Select ">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkSelectRejected" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText=" Candidate ID ">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRejectedCandidateID" runat="server" Text='<%# Bind("CandidateID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="CandidateName" HeaderText=" Candidate " />
                                            <asp:BoundField DataField="RejectedBy" HeaderText=" Rejected By " />
                                            <asp:BoundField DataField="RejectedDate" HeaderText=" Rejection Date " />
                                            <asp:BoundField DataField="RejectionRemarks" HeaderText=" Remarks " />
                                            <asp:BoundField DataField="EntryDate" HeaderText=" Application Date " />
                                            <asp:TemplateField HeaderText=" CV Details " ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkRejectedCVDetailsBtn" runat="server" CausesValidation="False"
                                                        CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("CandidateID","openWindow(""../RecuitmentCVView.aspx?CandidateID={0}"",""Popup"",800,800);") %>'
                                                        Text=" View ">
                                                    </asp:LinkButton>
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
                            <asp:Panel ID="pnlRejectedActions" runat="server" SkinID="pnlInner">
                                <table style="width: 100%;">
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
                                            Choose Status
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="drpApplicantStatusRejected" runat="server" CssClass="InputTxtBox"
                                                Width="200px">
                                                <asp:ListItem>Applied</asp:ListItem>
                                                <asp:ListItem>Reviewed</asp:ListItem>
                                                <asp:ListItem>ExamCompleted</asp:ListItem>
                                                <asp:ListItem>InterviewAssigned</asp:ListItem>
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
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
