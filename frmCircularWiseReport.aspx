<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmCircularWiseReport.aspx.vb" Inherits="frmCircularWiseReport" Title=".:HRM:Circular Wise Report:." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlCircularWiseReport" runat="server" Width="100%">
                    <table width="100%">
                        <tr align="left">
                            <td>
                                <div class="widget-title">
                                    Circular Wise Report</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <div style="max-height:500px;max-width:100%;overflow:auto">
                                    <asp:GridView ID="grdCircularWiseReport" runat="server" AutoGenerateColumns="False"
                                        CssClass="mGrid" ShowFooter="True">
                                        <Columns>
                                            <asp:TemplateField HeaderText="CircularID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CircularID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Job Title">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("JobTitle") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Closing Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ClosingDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total Applicant">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTotalApplicant" runat="server" Text='<%# Bind("TotalApplicant") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total Recruitment">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTotalRecruitment" runat="server" Text='<%# Bind("TotalRecruitment") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total ExamTaker">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTotalExamTaker" runat="server" Text='<%# Bind("TotalExamTaker") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total RejectedCV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTotalRejectedCV" runat="server" Text='<%# Bind("TotalRejectedCV") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Remaining CV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRemainingCV" runat="server" Text='<%# Bind("RemainingCV") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total Interview Taken">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTotalInterviewTaken" runat="server" Text='<%# Bind("TotalInterviewTaken") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <div>
                    </div>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td class="style1">
            </td>
        </tr>
        <tr align="center">
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
