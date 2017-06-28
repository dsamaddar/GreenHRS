<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmResourceReqPool.aspx.vb" Inherits="frmResourceReqPool"
    Title=".:HRS: Resource Pool:." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlResPool" runat="server" Width="80%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td>
                                <div class="widget-title">
                                    Resource Requirement Pool</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <div>
                                    <asp:GridView ID="grdResourcePool" runat="server" AutoGenerateColumns="False" CssClass="mGrid">
                                        <Columns>
                                            <asp:BoundField DataField="RecruitmentTypeID" HeaderText="RecruitmentTypeID" Visible="False" />
                                            <asp:BoundField DataField="RecruitmentType" HeaderText="Type" />
                                            <asp:BoundField DataField="RecruitmentTypeCode" HeaderText="Code" />
                                            <asp:BoundField DataField="ResourceRequired" HeaderText="Res.Req" />
                                            <asp:BoundField DataField="TotalCandidate" HeaderText="TotalCandidate" />
                                            <asp:BoundField DataField="ExamTaken" HeaderText="ExamTaken" />
                                            <asp:BoundField DataField="InterviewTaken" HeaderText="InterviewTaken" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
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
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
