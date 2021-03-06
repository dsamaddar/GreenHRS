﻿<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmUserRoleManagement.aspx.vb" Inherits="Administration_frmUserRoleManagement"
    Title=".:AI:User Wise Role Management:." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlUserWiseRoleManagement" runat="server" Width="700px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="4">
                                <div class="widgettitle">
                                    User Wise Role Management</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 230px">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                                User List
                            </td>
                            <td>
                                <asp:DropDownList ID="drpUserList" runat="server" CssClass="InputTxtBox" Width="200px"
                                    AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                                Role List
                            </td>
                            <td>
                                <asp:DropDownList ID="drpRoleList" runat="server" CssClass="InputTxtBox" Width="200px"
                                    AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnApplyRole" runat="server" CssClass="styled-button-1" Text="Apply Role" />
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
                <asp:Panel ID="pnlUserWiseRole" runat="server" Width="700px" SkinID="pnlInner">
                    <div style="max-height: 300px; max-width: 680px; overflow: auto">
                        <asp:GridView ID="grdUserRole" runat="server" AutoGenerateColumns="False" EmptyDataText="No Permission Available"
                            CssClass="mGrid">
                            <Columns>
                                <asp:TemplateField HeaderText="UserWiseRoleID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblUserWiseRoleID" runat="server" Text='<%# Bind("UserWiseRoleID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UserWiseRoleID") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="RoleID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRoleID" runat="server" Text='<%# Bind("RoleID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("RoleID") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="RoleName">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("RoleName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("RoleName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnDelete" ImageUrl="~/Sources/icons/erase.png" OnClientClick="if (!confirm('Are you Sure to Delete The Permission ?')) return false"
                                            CommandName="Delete" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
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
                <asp:Panel ID="pnlRoleWiseUser" runat="server" Width="700px" SkinID="pnlInner" >
                    <table style="width: 100%;">
                        <tr align="left">
                            <td>
                                <div class="widgettitle">
                                    Role Wise User</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:GridView ID="grdRoleWiseUser" runat="server" AutoGenerateColumns="False" CssClass="mGrid"
                                    EmptyDataText="No Permission Available">
                                    <Columns>
                                        <asp:TemplateField HeaderText="UserWiseRoleID" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblUserWiseRoleIDUsr" runat="server" Text='<%# Bind("UserWiseRoleID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="RoleID" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblUsrRoleID" runat="server" Text='<%# Bind("RoleID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Employee">
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtnDelete0" runat="server" CommandName="Delete" ImageUrl="~/Sources/icons/erase.png"
                                                    OnClientClick="if (!confirm('Are you Sure to Delete The Permission ?')) return false" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
