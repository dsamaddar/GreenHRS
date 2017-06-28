<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmExamResultSummary.aspx.vb" Inherits="frmExamResultSummary" Title=".:HRS:Exam Result Summary:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlExamResultParam" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td>
                                <div class="widget-title">
                                    Exam Result Summary<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label">
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td class="label">
                                <asp:CheckBox ID="chkSelectAll" runat="server" AutoPostBack="True" 
                                    CssClass="chkText" Text="Select All" />
                                &nbsp;Pass Mark
                                <asp:DropDownList ID="drpPassMark" runat="server" CssClass="InputTxtBox">
                                    <asp:ListItem Value="10">10</asp:ListItem>
                                    <asp:ListItem Value="20">20</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                    <asp:ListItem>60</asp:ListItem>
                                    <asp:ListItem>70</asp:ListItem>
                                    <asp:ListItem>80</asp:ListItem>
                                    <asp:ListItem>90</asp:ListItem>
                                    <asp:ListItem>100</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;
                                <asp:Button ID="btnProcessReport" runat="server" CssClass="styled-button-1" 
                                    Text="Process Report" />
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td>
                                _____________________________________________________________________________________________________________________________</td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:CheckBoxList ID="chkLstExamList" runat="server" CssClass="label" RepeatColumns="3"
                                    RepeatDirection="Horizontal">
                                </asp:CheckBoxList>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlResultPane" runat="server" SkinID="pnlInner">
                    <asp:GridView ID="grdExamResultSummary" runat="server" 
                        AutoGenerateColumns="False" CssClass="mGrid">
                        <Columns>
                            <asp:BoundField DataField="ExamID" HeaderText="ExamID" Visible="False" />
                            <asp:BoundField DataField="ExamName" HeaderText="ExamName" />
                            <asp:BoundField DataField="TotalAttended" HeaderText="TotalAttended" />
                            <asp:BoundField DataField="Passed" HeaderText="Passed" />
                            <asp:BoundField DataField="Max" HeaderText="Max" />
                            <asp:BoundField DataField="Min" HeaderText="Min" />
                            <asp:BoundField DataField="Avg" HeaderText="Avg" />
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
