<%@ Page Language="VB" MasterPageFile="~/EmployeeProfile/MasterEmpProfile.master"
    AutoEventWireup="false" CodeFile="frmPFContribution.aspx.vb" Inherits="EmployeeProfile_frmPFContribution"
    Theme="CommonSkin" Title=".:HRS:PF Contribution:." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Panel ID="pnlEmpPFContribution" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <div class="widget-title">
                                    PF Contribution</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="max-height:500px;max-width:100%;overflow:auto">
                                    <asp:GridView ID="grdPFDetails" runat="server" AutoGenerateColumns="False" 
                                    CssClass="mGrid" ShowFooter="True">
                                    <Columns>
                                        <asp:TemplateField HeaderText="ProvidentFundID" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblProvidentFundID" runat="server" Text='<%# Bind("ProvidentFundID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sal. Year">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSalYear" runat="server" Text='<%# Bind("SalYear") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sal. Month">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSalMonth" runat="server" Text='<%# Bind("SalMonth") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Emp Contribution">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEmpContribution" runat="server" Text='<%# Bind("EmpContribution","{0:N2}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Emp. Credited Int.">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCreditedIntEmp" runat="server" Text='<%# Bind("CreditedIntEmp","{0:N2}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cmp. Contribution">
                                            <ItemTemplate>
                                                <asp:Label ID="lblComContribution" runat="server" Text='<%# Bind("ComContribution","{0:N2}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cmp. Credited Int.">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCreditedIntCom" runat="server" Text='<%# Bind("CreditedIntCom","{0:N2}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Process Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblProcessDate" runat="server" Text='<%# Bind("ProcessDate") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remarks">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRemarks" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                </div>
                                
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
