<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmResourceRequirement.aspx.vb" Inherits="frmResourceRequirement"
    Title=".:HRS:Resourece Requirement:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Panel ID="pnlPendingResoureceReq" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <div class="widget-title">
                                    Pending Resource Requirement<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="max-height: 300px; max-width: 100%; overflow: auto">
                                    <asp:GridView ID="grdPendingResourceReq" runat="server" AutoGenerateColumns="False"
                                        CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                                        Text="Select"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ResourceReqID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblResourceReqID" runat="server" Text='<%# Bind("ResourceReqID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="RecruitmentType" HeaderText="Type" />
                                            <asp:BoundField DataField="Code" HeaderText="Code" />
                                            <asp:TemplateField HeaderText="No.Of.Res">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblReqNoOfResource" runat="server" Text='<%# Bind("ReqNoOfResource") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Remarks" HeaderText="Remarks" />
                                            <asp:BoundField DataField="EmployeeName" HeaderText="Employee" />
                                            <asp:BoundField DataField="ReqDate" HeaderText="Req.Date" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlChangeStatus" runat="server" Width="60%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:HiddenField ID="hdfldResourceReqID" runat="server" />
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Remarks
                            </td>
                            <td>
                                <asp:TextBox ID="txtProviderRemarks" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="250px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldRemarks" runat="server" ControlToValidate="txtProviderRemarks"
                                    Display="None" ErrorMessage="Required: Remarks" ValidationGroup="ResReq"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="Re_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                    CssClass="customCalloutStyle" TargetControlID="reqFldRemarks" Enabled="True"
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td class="label">
                                Provided On</td>
                            <td>
                                <asp:TextBox ID="txtResourceProvidedOn" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtResourceProvidedOn_CalendarExtender" 
                                    runat="server" Enabled="True" TargetControlID="txtResourceProvidedOn">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldProvidedOn" runat="server" 
                                    ControlToValidate="txtResourceProvidedOn" Display="None" 
                                    ErrorMessage="Required: Provided On" ValidationGroup="ResReq"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldProvidedOn_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldProvidedOn" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Resource Provided
                            </td>
                            <td>
                                <asp:TextBox ID="txtProvidedResource" runat="server" CssClass="InputTxtBox" 
                                    Width="80px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldProvidedNoOfResource" 
                                    runat="server" ControlToValidate="txtProvidedResource" Display="None" 
                                    ErrorMessage="Required: No Of Resource" ValidationGroup="ResReq"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldProvidedNoOfResource_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldProvidedNoOfResource" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnProvided" runat="server" CssClass="styled-button-1" 
                                    Text="Provided" ValidationGroup="ResReq" />
                                &nbsp;<asp:Button ID="btnRejected" runat="server" CssClass="styled-button-1" 
                                    Text="Reject" ValidationGroup="ResReq" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
