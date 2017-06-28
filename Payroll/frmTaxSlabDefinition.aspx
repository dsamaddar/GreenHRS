<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmTaxSlabDefinition.aspx.vb" Inherits="Payroll_frmTaxSlabDefinition"
    Title=".:HRS:Tax Slab Defintion:." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlTaxSlabDefinition" runat="server" SkinID="pnlInner" Width="80%">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="6">
                                <div class="widget-title">
                                    Tax Slab Definition</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 200px">
                                <asp:HiddenField ID="hdFldTaxSlabID" runat="server" />
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Value
                            </td>
                            <td>
                                <asp:TextBox ID="txtValueAmount" runat="server" Width="150px" CssClass="InputTxtBox"></asp:TextBox>
                            </td>
                            <td class="label">
                            </td>
                            <td class="label">
                                Gender
                            </td>
                            <td>
                                <asp:DropDownList ID="drpGender" runat="server" CssClass="InputTxtBox" Width="70px">
                                    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                    <asp:ListItem Text="N\A" Value="N\A"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Rate
                            </td>
                            <td>
                                <asp:TextBox ID="txtTaxRate" runat="server" Width="50px" CssClass="InputTxtBox"></asp:TextBox>
                                &nbsp;%
                            </td>
                            <td class="label">
                            </td>
                            <td class="label">
                                Rate Order
                            </td>
                            <td>
                                <asp:DropDownList ID="drpRateOrder" runat="server" CssClass="InputTxtBox" Width="70px">
                                    <asp:ListItem Text="0" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Age Limit
                            </td>
                            <td>
                                <asp:DropDownList ID="drpAgeLimit" runat="server" CssClass="InputTxtBox" Width="90px">
                                    <asp:ListItem Value="64" Text="<=64"></asp:ListItem>
                                    <asp:ListItem Value="65" Text=">=65"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="label">
                            </td>
                            <td class="label">
                                Tax Text
                            </td>
                            <td>
                                <asp:TextBox ID="txtTaxText" runat="server" Width="200px" CssClass="InputTxtBox"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Tax Year
                            </td>
                            <td>
                                <asp:DropDownList ID="drpTaxYear" runat="server" CssClass="InputTxtBox" Width="90px">
                                    <asp:ListItem Text="2013-2014" Value="2013-2014"></asp:ListItem>
                                    <asp:ListItem Text="2014-2015" Value="2014-2015"></asp:ListItem>
                                    <asp:ListItem Text="2015-2016" Value="2015-2016"></asp:ListItem>
                                    <asp:ListItem Text="2016-2017" Value="2016-2017"></asp:ListItem>
                                    <asp:ListItem Text="2017-2018" Value="2017-2018"></asp:ListItem>
                                    <asp:ListItem Text="2018-2019" Value="2018-2019"></asp:ListItem>
                                    <asp:ListItem Text="2019-2020" Value="2019-2020"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
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
                            </td>
                            <td>
                                <asp:Button ID="btnInsert" runat="server" CssClass="styled-button-1" Text="Insert" />
                                &nbsp;<asp:Button ID="btnUpdate" runat="server" CssClass="styled-button-1" Text="Update" />
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" Text="Cancel" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                            </td>
                            <td>
                            </td>
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
                <asp:Panel ID="pnlTaxSlabInfo" runat="server" Width="80%" SkinID="pnlInner">
                    <div style="max-height: 500px; max-width: 100%; overflow: auto">
                        <asp:GridView ID="grdTaxSlab" runat="server" CssClass="mGrid" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                            CommandName="Select" Text="Select" CssClass="chkText" ></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SLNo" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSLNo" runat="server" Text='<%# Bind("SLNo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Taxable-Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblValue" runat="server" Text='<%# Bind("Value","{0:N2}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Gender">
                                    <ItemTemplate>
                                        <asp:Label ID="lblGender" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Rate">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRate" runat="server" Text='<%# Bind("Rate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Rate-Order">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRateOrder" runat="server" Text='<%# Bind("RateOrder") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Age-Limit">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAgeLimit" runat="server" Text='<%# Bind("AgeLimit") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tax-Instruction">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTaxText" runat="server" Text='<%# Bind("TaxText") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tax-Year">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTaxYear" runat="server" Text='<%# Bind("TaxYear") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EntryBy">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEntryBy" runat="server" Text='<%# Bind("EntryBy") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
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
