<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmExamWiseSummaryRpt.aspx.vb" Inherits="frmExamWiseSummaryRpt"
    Title=".:HRS:Exam Wise Summary Report:." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlExmWiseSumRptParam" runat="server" Width="600px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="3">
                                <div class="widget-title">
                                    Exam Wise Summary Report</div>
                            </td>
                        </tr>
                        <tr align="left">
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
                                Select An Exam
                            </td>
                            <td>
                                <asp:DropDownList ID="drpAvailableExams" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnShowResult" runat="server" CssClass="styled-button-1" Text="Show Result" />
                                &nbsp;<asp:ImageButton ID="imgBtnExport" runat="server" ImageUrl="~/Sources/images/excel2.jpg"
                                    Width="25px" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlSummaryReport" runat="server" SkinID="pnlInner" Width="100%">
                    <div style="max-height: 500px; max-width: 1100px; overflow: auto">
                        <asp:GridView ID="grdExamWiseSummaryRpt" runat="server" CssClass="mGrid">
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
