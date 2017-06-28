<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmResourceReqSummaryRpt.aspx.vb" Inherits="frmResourceReqSummaryRpt"
    Title=".:HRS:Resource Requirement Summary Report:." %>

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
            </td>
            <td>
                <asp:Panel ID="pnlResReqSummary" runat="server" SkinID="pnlInner" Width="70%">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <div class="widget-title">
                                    Resource Requirement Summary Report</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="grdResReqSummary" runat="server" AutoGenerateColumns="False" CssClass="mGrid">
                                    <Columns>
                                        <asp:TemplateField HeaderText="RecruitmentTypeID" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("RecruitmentTypeID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="RecruitmentType" HeaderText="Recruitment-Type" />
                                        <asp:BoundField DataField="Code" HeaderText="Code" />
                                        <asp:TemplateField HeaderText="Resource-Required" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkbtnView" runat="server" CausesValidation="False" 
                                                    CssClass="linkbtn" Font-Size="14px" 
                                                    OnClientClick='<%# Eval("RecruitmentTypeID","openWindow(""frmResReqByRecType.aspx?RecruitmentTypeID={0}"",""Popup"",1000,800);") %>' 
                                                    Text='<%# Bind("ResourceRequired") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
            </td>
        </tr>
        <tr align="center">
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
