<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmPerformanceReview.aspx.vb" Inherits="frmPerformanceReview"
    Title=".:HRM:Performance Review:." %>

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

    <table width="100%">
        <tr>
            <td>
                <asp:Panel ID="pnlSearchPanel" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="5">
                                <div class="widget-title">
                                    Search Panel</div>
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
                        <tr>
                            <td style="width: 200px">
                            </td>
                            <td>
                                <asp:DropDownList ID="drpDepartment" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td class="label">
                            </td>
                            <td>
                                <asp:DropDownList ID="drpEmpList" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
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
                <asp:Panel ID="pnlBody" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td style="width: 20%" align="center" valign="top">
                                <asp:Image ID="imgEmployee" runat="server" Height="120px" BorderStyle="Groove" />
                            </td>
                            <td style="width: 26.66%" valign="top">
                                <asp:Panel ID="pnlEducation" runat="server" SkinID="pnlInner">
                                    <table style="width: 100%">
                                        <tr>
                                            <td class="widget-title">
                                                Education
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="grdEducation" runat="server" CssClass="mGrid" Width="100%" AutoGenerateColumns="False"
                                                    PageSize="3">
                                                    <Columns>
                                                        <asp:BoundField DataField="Year" HeaderText="Year" />
                                                        <asp:BoundField DataField="Degree" HeaderText="Degree" />
                                                        <asp:BoundField DataField="Inst" HeaderText="Inst" />
                                                        <asp:TemplateField HeaderText="Result" ItemStyle-Width="50px">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Result") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:LinkButton ID="lnkBtnShowEducation" runat="server">Show All</asp:LinkButton>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td style="width: 26.66%" valign="top">
                                <asp:Panel ID="pnlProfRecordFavorable" runat="server" SkinID="pnlInner">
                                    <table style="width: 100%">
                                        <tr>
                                            <td class="widget-title">
                                                Professional Record (Favorable)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="grdProfRecFavorable" runat="server" CssClass="mGrid" Width="100%"
                                                    EmptyDataText="No Professional Record (Favorable) Available">
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td style="width: 26.66%" valign="top">
                                <asp:Panel ID="pnlCareerProgression" runat="server" SkinID="pnlInner">
                                    <table style="width: 100%">
                                        <tr>
                                            <td class="widget-title">
                                                Career Progression
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="grdCareerProgression" runat="server" CssClass="mGrid" Width="100%"
                                                    AutoGenerateColumns="False">
                                                    <Columns>
                                                        <asp:BoundField DataField="Event" HeaderText="Event" />
                                                        <asp:BoundField DataField="Designation" HeaderText="Designation" />
                                                        <asp:BoundField DataField="Date" HeaderText="Date" />
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel ID="pnlEmpPersonalInfo" runat="server" SkinID="pnlInner">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td>
                                            </td>
                                            <td class="label">
                                                <asp:Label ID="lblEmpName" runat="server" CssClass="label" Text=""></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td class="label">
                                                <asp:Label ID="lblEmpOfficialDesignation" runat="server" CssClass="label" Text=""></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td class="label">
                                                <asp:Label ID="lblEmpFunctionalDesignation" runat="server" CssClass="label" Text=""></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td class="label">
                                                <asp:Label ID="lblEmpDepartment" runat="server" CssClass="label" Text=""></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td class="label">
                                                <asp:Label ID="lblEmpBranch" runat="server" CssClass="label" Text=""></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td class="label">
                                                <asp:Label ID="lblEmpServiceLength" runat="server" CssClass="label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td class="label">
                                                <asp:LinkButton ID="lnkBtnCOC" runat="server" Font-Bold="True" ForeColor="#CC0000">COC</asp:LinkButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td class="label">
                                                Details Profile
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td class="label">
                                                <asp:HyperLink ID="hpLnkCanProfile" runat="server" CssClass="rbdText" Target="_blank">Recruitment 
                                                Record</asp:HyperLink>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td valign="top">
                                <asp:Panel ID="pnlProfCert" runat="server" SkinID="pnlInner">
                                    <table style="width: 100%">
                                        <tr>
                                            <td class="widget-title">
                                                Professional Certification
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="grdProfCertification" runat="server" CssClass="mGrid" Width="100%"
                                                    EmptyDataText="No Certification Available">
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td valign="top">
                                <asp:Panel ID="pnlProfRecUnfavorable" runat="server" SkinID="pnlInner">
                                    <table style="width: 100%">
                                        <tr>
                                            <td class="widget-title">
                                                Professional Record (Unfavorable)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="grdProfRecUnfavorable" runat="server" CssClass="mGrid" Width="100%"
                                                    EmptyDataText="No Professional Record(Unfavorable) Available">
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td valign="top">
                                <asp:Panel ID="pnlFunctionalTransition" runat="server" SkinID="pnlInner">
                                    <table style="width: 100%">
                                        <tr>
                                            <td class="widget-title">
                                                Functional Transition
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="grdFunctionalTransition" runat="server" CssClass="mGrid" Width="100%"
                                                    EmptyDataText="No Functional Transitoin Available">
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                &nbsp;
                            </td>
                            <td valign="top">
                                <asp:Panel ID="pnlTraining" runat="server" SkinID="pnlInner">
                                    <table style="width: 100%">
                                        <tr>
                                            <td class="widget-title">
                                                Training
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="grdTraining" runat="server" CssClass="mGrid" Width="100%" EmptyDataText="No Training Available">
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td valign="top">
                                <asp:Panel ID="pnlPerformanceTrail" runat="server" SkinID="pnlInner">
                                    <table style="width: 100%">
                                        <tr>
                                            <td class="widget-title">
                                                Performance Trail
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="grdPerformanceTrail" runat="server" CssClass="mGrid" Width="100%"
                                                    EmptyDataText="No Performance Trail Available">
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td valign="top">
                                <asp:Panel ID="pnlParity" runat="server" SkinID="pnlInner">
                                    <table style="width: 100%">
                                        <tr>
                                            <td class="widget-title">
                                                Parity
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="grdParity" runat="server" CssClass="mGrid" Width="100%" EmptyDataText="No Parity Match Found"
                                                    AutoGenerateColumns="False">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="" ShowHeader="False">
                                                            <ItemTemplate>
                                                                <asp:HyperLink ID="hpDocument" runat="server" CssClass="linkbtn" NavigateUrl='<%#"frmPerformanceReview.aspx?DepartmentID="+ Eval("DepartmentID")+"&EmployeeID="+ Eval("EmployeeID")+""  %>'
                                                                    Target="_blank" Text='<%# Bind("Employee") %>'></asp:HyperLink>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="Parameter" HeaderText="Parameter" />
                                                        <asp:TemplateField HeaderText="DepartmentID" Visible="False">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDepartmentID" runat="server" Text='<%# Bind("DepartmentID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="EmployeeID" Visible="False">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblEmployeeID" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:Label>
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
                            <td>
                            </td>
                            <td>
                                <asp:Panel ID="pnlSkillSet" runat="server" SkinID="pnlInner">
                                    <table style="width: 100%">
                                        <tr>
                                            <td class="widget-title">
                                                Skill Test
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="grdSkillTest" runat="server" AutoGenerateColumns="False" CssClass="mGrid"
                                                    EmptyDataText="No Skill Set Available" Width="100%">
                                                    <Columns>
                                                        <asp:BoundField DataField="ExamName" HeaderText="Skill Type" />
                                                        <asp:BoundField DataField="ExamStatus" HeaderText="Expertise Level" />
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
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
    </table>
</asp:Content>
