<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmInputChallanNo.aspx.vb" Inherits="Payroll_frmInputChallanNo"
    Title=".::HRS: Challan No Input Form::." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlInputChallanNo" runat="server" Width="60%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="5">
                                <div class="widget-title">
                                    Challan No Input Form<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldChallanNo" runat="server" 
                                    ControlToValidate="txtChallanNo" Display="None" 
                                    ErrorMessage="Required: Challan No" ValidationGroup="Challan"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldChallanNo_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldChallanNo" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldChallanDate" runat="server" 
                                    ControlToValidate="txtChallanDate" Display="None" 
                                    ErrorMessage="Required: Challan Date" ValidationGroup="Challan"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldChallanDate_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldChallanDate" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Challan No
                            </td>
                            <td>
                                <asp:TextBox ID="txtChallanNo" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                                &nbsp;</td>
                            <td class="label">
                                Dated
                            </td>
                            <td>
                                <asp:TextBox ID="txtChallanDate" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                                <cc1:CalendarExtender ID="calExtChallanDate" runat="server" Enabled="True" TargetControlID="txtChallanDate">
                                </cc1:CalendarExtender>
                            </td>
                            
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                TDS Amount
                            </td>
                            <td>
                                <asp:TextBox ID="txtTDSAmount" runat="server" CssClass="InputTxtBox"></asp:TextBox>
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
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldTDSAmount" runat="server" 
                                    ControlToValidate="txtTDSAmount" Display="None" 
                                    ErrorMessage="Required: TDS Amount" ValidationGroup="Challan"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldTDSAmount_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldTDSAmount" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnInsertChallan" runat="server" CssClass="styled-button-1" 
                                    Text="Insert" ValidationGroup="Challan" />
                                &nbsp;<asp:Button ID="btnUpdateChallan" runat="server" CssClass="styled-button-1"
                                    Text="Update" ValidationGroup="Challan" />
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
                <asp:Panel ID="pnlChallanNoList" runat="server" SkinID="pnlInner" Width="60%">
                    <div>
                        <asp:GridView ID="grdChallanNos" runat="server" AutoGenerateColumns="False" 
                            CssClass="mGrid">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:TemplateField HeaderText="ChallanID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblChallanID" runat="server" Text='<%# Bind("ChallanID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ChallanNo">
                                    <ItemTemplate>
                                        <asp:Label ID="lblChallanNo" runat="server" Text='<%# Bind("ChallanNo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="TDSAmount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTDSAmount" runat="server" Text='<%# Bind("TDSAmount") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ChallanDate">
                                    <ItemTemplate>
                                        <asp:Label ID="lblChallanDate" runat="server" Text='<%# Bind("ChallanDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="TaxYear">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTaxYear" runat="server" Text='<%# Bind("TaxYear") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="EntryBy" HeaderText="EntryBy" />
                                <asp:BoundField DataField="EntryDate" HeaderText="EntryDate" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
