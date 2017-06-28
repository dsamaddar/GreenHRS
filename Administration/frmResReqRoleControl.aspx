<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmResReqRoleControl.aspx.vb" Inherits="Administration_frmResReqRoleControl"
    Title=".:HRS:Administrative Role Control:." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlRoleCtrl" runat="server" Width="60%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="3">
                                <div class="widget-title">
                                    Administrative Role Control For Resource Request</div>
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
                                Select Employee
                            </td>
                            <td>
                                <asp:DropDownList ID="drpEmployeeList" runat="server" CssClass="InputTxtBox" Width="200px"
                                    AutoPostBack="True">
                                </asp:DropDownList>
                                &nbsp;<asp:Button ID="btnUpdate" runat="server" CssClass="styled-button-1" Text="Update" />
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
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlResourceTypes" runat="server" SkinID="pnlInner" Width="60%">
                    <asp:GridView ID="grdResourceTypes" runat="server" CssClass="mGrid" AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField HeaderText="RecruitmentTypeID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblRecruitmentTypeID" runat="server" Text='<%# Bind("RecruitmentTypeID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Recruitment Type">
                                <ItemTemplate>
                                    <asp:Label ID="lblRecruitmentType" runat="server" Text='<%# Bind("RecruitmentType") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Can Request">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkCanRequest" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Can Approve">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkCanApprove" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
