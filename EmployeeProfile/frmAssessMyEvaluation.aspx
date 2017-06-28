<%@ Page Title=".:HRM::Selft Evaluation:." Language="VB" MasterPageFile="~/EmployeeProfile/MasterEmpProfile.master"
    Theme="CommonSkin" AutoEventWireup="false" CodeFile="frmAssessMyEvaluation.aspx.vb"
    Inherits="EmployeeProfile_frmAssessMyEvaluation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Panel ID="pnlPendingEvaluations" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <div class="widget-title">
                                    Pending Evaluation</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div>
                                    <asp:GridView ID="grdPendingEvaluations" runat="server" AutoGenerateColumns="False"
                                        CssClass="mGrid">
                                        <Columns>
                                            <asp:CommandField ShowSelectButton="True" />
                                            <asp:TemplateField HeaderText="EmpEvaluationSummaryID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmpEvaluationSummaryID" runat="server" Text='<%# Bind("EmpEvaluationSummaryID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="EvaluationFrom" HeaderText="EvaluationFrom" />
                                            <asp:BoundField DataField="EvaluationTo" HeaderText="EvaluationTo" />
                                            <asp:BoundField DataField="PrimaryEvaluator" HeaderText="PrimaryEvaluator" />
                                            <asp:BoundField DataField="EvaluatedOn" HeaderText="EvaluatedOn" />
                                            <asp:BoundField DataField="Remarks" HeaderText="Remarks" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlAcknowledgement" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="3">
                                <div class="widget-title">
                                    Acknowledgement</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:CheckBox ID="chkAgreeWithEval" runat="server" AutoPostBack="True" CssClass="chkText"
                                    Text="I agree with the evaluation" />
                                &nbsp;<asp:CheckBox ID="chkDisagreeWithEval" runat="server" AutoPostBack="True" CssClass="chkText"
                                    Text="I do not agree with the evaluation. In following areas I disagree:" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:GridView ID="grdEvalDisagreement" CssClass="mGrid" runat="server" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:TemplateField HeaderText="EmpEvaluationID" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEmpEvaluationID" runat="server" Text='<%# Bind("EmpEvaluationID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="PerformanceCriteria" HeaderText="Performance Criteria" />
                                        <asp:BoundField DataField="Grade" HeaderText="Grade" />
                                        <asp:TemplateField HeaderText="Disagree">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkDisagree" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnSubmit" runat="server" CssClass="styled-button-1" Text="Submit" />
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
</asp:Content>
