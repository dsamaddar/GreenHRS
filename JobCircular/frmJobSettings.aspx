<%@ Page Theme="CommonSkin"  Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false" CodeFile="frmJobSettings.aspx.vb" Inherits="JobCircular_frmJobSettings" title=".:HRM:Job Type Definition:." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr align="center" >
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center" >
            <td>
                &nbsp;</td>
            <td>
                <asp:Panel ID="pnlJobType" runat="server" Width="600px" SkinID="pnlInner">
                    <table style="width:100%;">
                        <tr>
                            <td colspan="4" align="left">
                                <div class="widgettitle">Job Type</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                </td>
                            <td align="left" class="label">
                                Job Type</td>
                            <td align="left" >
                                <asp:TextBox ID="txtJobType" runat="server" CssClass="InputTxtBox" 
                                    Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldJobType" runat="server" 
                                    ControlToValidate="txtJobType" ErrorMessage="*" ValidationGroup="InsertJobType"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                </td>
                            <td align="left" class="label">
                                Is Active</td>
                            <td align="left">
                                <asp:CheckBox ID="chkJobTypeIsActive" runat="server" CssClass="chkText" />
                            </td>
                            <td>
                                </td>
                        </tr>
                        <tr>
                            <td>
                                </td>
                            <td>
                            </td>
                            <td align="left" >
                                <asp:Button ID="btnInsertJobType" runat="server" Text="Insert" 
                                    CssClass="styled-button-1" ValidationGroup="InsertJobType" />
                            </td>
                            <td>
                                </td>
                        </tr>
                        <tr>
                            <td>
                                </td>
                            <td>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                </td>
                            <td align="left" class="label">
                                Available Job Type</td>
                            <td align="left" >
                                <asp:DropDownList ID="drpAvailableJobType" runat="server" 
                                    CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
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
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center" >
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center" >
            <td>
                &nbsp;</td>
            <td>
                <asp:Panel ID="pnlServiceType" runat="server" Width="600px" SkinID="pnlInner">
                    <table style="width:100%;">
                        <tr>
                            <td colspan="4" align="left">
                                <div class="widgettitle">Employment Service Type</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" > 
                                &nbsp;</td>
                            <td align="left" class="label">
                                Service Type</td>
                            <td align="left" >
                                <asp:TextBox ID="txtServiceType" runat="server" CssClass="InputTxtBox" 
                                    Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldServiceType" runat="server" 
                                    ControlToValidate="txtServiceType" ErrorMessage="*" 
                                    ValidationGroup="InsertServiceType"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                Is Active</td>
                            <td align="left">
                                <asp:CheckBox ID="chkServiceTypeIsActive" runat="server" CssClass="chkText" />
                            </td>
                            <td>
                                </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td align="left" >
                                <asp:Button ID="btnInsertServiceType" runat="server" Text="Insert" 
                                    CssClass="styled-button-1" ValidationGroup="InsertServiceType" />
                            </td>
                            <td>
                                </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" >
                                &nbsp;</td>
                            <td align="left" class="label">
                                Available Service Type</td>
                            <td align="left" >
                                <asp:DropDownList ID="drpAvailableServiceType" runat="server" CssClass="InputTxtBox" 
                                    Width="200px">
                                </asp:DropDownList>
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
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

