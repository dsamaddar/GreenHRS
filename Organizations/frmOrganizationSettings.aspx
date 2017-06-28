<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmOrganizationSettings.aspx.vb" Inherits="Organizations_frmOrganizationSettings"
    Title=".:HRM:Org Branch Settings:." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Panel ID="pnlOrgSettings" runat="server" Width="70%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="4" align="left">
                                <div class="widgettitle">
                                    Organizational Branch Settings</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:HiddenField ID="hdFldOrgBranchID" runat="server" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Organization
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpOrganizations" runat="server" CssClass="InputTxtBox" Width="250px"
                                    AutoPostBack="True">
                                </asp:DropDownList>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldOrganizations" runat="server" ControlToValidate="drpOrganizations"
                                    ErrorMessage="*" ValidationGroup="BranchInput"></asp:RequiredFieldValidator>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Branch Name
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtBranchName" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldBranchName" runat="server" ControlToValidate="txtBranchName"
                                    ErrorMessage="*" ValidationGroup="BranchInput"></asp:RequiredFieldValidator>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Branch Address
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtBranchAddress" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldBranchAddress" runat="server" ControlToValidate="txtBranchAddress"
                                    ErrorMessage="*" ValidationGroup="BranchInput"></asp:RequiredFieldValidator>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                            </td>
                            <td align="left">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td align="left">
                                <asp:Button ID="btnInsertBranch" runat="server" CssClass="styled-button-1" Text="Insert"
                                    ValidationGroup="BranchInput" />
                                &nbsp;<asp:Button ID="btnUpdate" runat="server" CssClass="styled-button-1" 
                                    Text="Update" ValidationGroup="BranchInput" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" Text="Cancel" />
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Panel ID="pnlOrgBranchList" runat="server" SkinID="pnlInner" Width="70%">
                    <div>
                        <asp:GridView ID="grdOrgBranchList" runat="server" AutoGenerateColumns="False" 
                            CssClass="mGrid" EmptyDataText="No Branch Found">
                            <Columns>
                                <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                            Text="Select"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="BranchID" Visible="false" >
                                    <ItemTemplate>
                                        <asp:Label ID="lblBranchID" runat="server" Text='<%# Bind("BranchID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Branch">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBranchName" runat="server" Text='<%# Bind("BranchName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Address">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBranchAddress" runat="server" Text='<%# Bind("BranchAddress") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="EntryBy" HeaderText="EntryBy" />
                                <asp:BoundField DataField="EntryDate" HeaderText="EntryDate" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
