<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmExamEmpRelReport.aspx.vb" Inherits="frmExamEmpRelReport"
    Title=".:HRS:Exam Employee Relationship:." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlExmEmpRelParam" runat="server" Width="600px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="3">
                                <div class="widget-title">
                                    Exam Employee Relationship</div>
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
                        <tr align="center">
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnProcessReport" runat="server" CssClass="styled-button-1" Text="Show Report" />
                                &nbsp;<asp:ImageButton ID="imgBtnExport" runat="server" 
                                    ImageUrl="~/Sources/images/excel2.jpg" Width="25px" />
                            </td>
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
                <asp:Panel ID="pnlExmEmpRel" runat="server" SkinID="pnlInner">
                    <div style="max-height: 500px; max-width: 1000px; overflow: auto">
                        <asp:GridView ID="grdExmEmpRel" runat="server" CssClass="mGrid">
                        </asp:GridView>
                    </div>
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
