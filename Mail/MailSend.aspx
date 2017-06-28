<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="MailSend.aspx.vb" Inherits="Mail_MailSend" Title="Generate Mail" Theme="CommonSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
    <table width="100%">
        <tr>
            <td>
            </td>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Panel runat="server" ID="idPanel" SkinID="pnlInner">
                    <asp:GridView ID="grdSendMail" runat="server" AutoGenerateColumns="false" CssClass ="mGrid">
                        <Columns>
                            <asp:TemplateField HeaderText="Select">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelect" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="MailID" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblMailID" runat="server" Text='<%#Bind("MailID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                              <asp:TemplateField HeaderText="EmployeeID" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmployeeID" runat="server" Text='<%#Bind("EmployeeID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Employee Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmployeeName" runat="server" Text='<%#Bind("EmployeeName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Official Designation Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblOfficialDesignationName" runat="server" Text='<%#Bind("OfficialDesignationName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Functional Designation Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblFunctionalDesignationName" runat="server" Text='<%#Bind("FunctionalDesignationName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Department Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblDeptName" runat="server" Text='<%#Bind("DeptName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Branch Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblULCBranchName" runat="server" Text='<%#Bind("ULCBranchName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="btnGenerate" runat="server" Text="Generate" CssClass="styled-button-1" />
              
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
