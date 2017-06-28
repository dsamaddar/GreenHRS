<%@ Page Language="VB" Theme="CommonSkin"  MasterPageFile="~/HRMMaster.master" AutoEventWireup="false" CodeFile="frmInterviewSettings.aspx.vb" Inherits="InterviewPanel_frmInterviewSettings" title=".:HRM:Interview Panel Sett.:." %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

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
                <asp:Panel ID="pnlSearchEmployees" runat="server" Width="900px" 
                    SkinID="pnlInner">
                    <table style="width:100%;">
                        <tr>
                            <td align="left" class="label" colspan="5" >
                                <div class="widgettitle">Interview Panel Settings</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width:20px;">
                            </td>
                            <td align="left" class="label">
                            </td>
                            <td align="left">
                            </td>
                            <td align="left" class="label">
                            </td>
                            <td align="left">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width:20px;">
                                </td>
                            <td align="left" class="label">
                                Name</td>
                            <td align="left">
                                <asp:TextBox ID="txtEmployeeName" runat="server" CssClass="InputTxtBox" 
                                    Width="200px"></asp:TextBox>
                                &nbsp;&nbsp;</td>
                            <td align="left" class="label" >
                                Branch</td>
                            <td align="left">
                                <asp:DropDownList ID="drpAvailableBranch" runat="server" 
                                    CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                </td>
                            <td align="left" class="label">
                                By Designation</td>
                            <td align="left">
                                <asp:DropDownList ID="drpDesignation" runat="server" CssClass="InputTxtBox" 
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td align="left" class="label">
                                By Department</td>
                            <td align="left">
                                <asp:DropDownList ID="drpAvailableDepartment" runat="server" 
                                    CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                </td>
                            <td align="left" class="label">
                                </td>
                            <td align="left">
                                <asp:Button ID="btnSearchEmployee" runat="server" CssClass="styled-button-1" 
                                    Text="Search" />
                            </td>
                            <td align="left">
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
                            <td align="left">
                                </td>
                            <td>
                                </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                </td>
                            <td align="left" class="label">
                                </td>
                            <td align="left" colspan="3">
                                <div style="max-height:300px;max-width:500px;overflow:auto">
                                    <asp:GridView ID="grdEmployee" runat="server" AutoGenerateColumns="False" 
                                        EmptyDataText="No Information Available" CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Select">
                                                <EditItemTemplate>
                                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkSelectEmployee" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="EmployeeID" Visible="False">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmployeeID" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="EmployeeName">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmployeeName" runat="server" 
                                                        Text='<%# Bind("EmployeeName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="EmpCode">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("EmpCode") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("EmpCode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DeptName">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("DeptName") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("DeptName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="OfficialDesignation">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox5" runat="server" 
                                                        Text='<%# Bind("OfficialDesignation") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("OfficialDesignation") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ULCBranchName">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ULCBranchName") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("ULCBranchName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                </td>
                            <td align="left" class="label">
                                </td>
                            <td align="left" colspan="3">
                                </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                </td>
                            <td align="left" class="label">
                                Interview Team Name</td>
                            <td align="left" colspan="3">
                                <asp:DropDownList ID="drpAvailableIntTeamList" runat="server" 
                                    AutoPostBack="True" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldIntTeamName" runat="server" 
                                    ControlToValidate="drpAvailableIntTeamList" ErrorMessage="*" 
                                    ValidationGroup="AddIntPnlMember"></asp:RequiredFieldValidator>
                                &nbsp;<asp:Button ID="btnNewIntTeam" runat="server" CssClass="styled-button-1" 
                                    OnClientClick="return confirm('Are You Sure To Insert New Interview Team ??')" 
                                    Text="..." />
                                &nbsp;<asp:Button ID="btnCancelToInsertNewIntTeam" runat="server" 
                                    CssClass="styled-button-1" Text="Cancel" />
                                &nbsp;
                                <asp:Label ID="lblNewIntTeam" runat="server" CssClass="label">
                                <asp:TextBox ID="txtNewIntTeam" runat="server" CssClass="InputTxtBox" 
                                    ValidationGroup="IntTeam" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFldNewIntTeam" runat="server" 
                                    ControlToValidate="txtNewIntTeam" ErrorMessage="*" ValidationGroup="IntTeam"></asp:RequiredFieldValidator>
                                <asp:CheckBox ID="chkIsIntTeamActive" runat="server" Text="Is Active" />
                                </asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                </td>
                            <td align="left" class="label">
                                Member Type</td>
                            <td align="left" colspan="3">
                                <asp:DropDownList ID="drpIntPnlMemberType" runat="server" 
                                    CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldMemberType" runat="server" 
                                    ControlToValidate="drpIntPnlMemberType" ErrorMessage="*" 
                                    ValidationGroup="AddIntPnlMember"></asp:RequiredFieldValidator>
                                &nbsp;<asp:Button ID="btnNewMemberType" runat="server" CssClass="styled-button-1" 
                                    Text="..." 
                                    OnClientClick="return confirm('Are You Sure To Insert New Member Type ??')" />
                                &nbsp;<asp:Button ID="btnCancelToInsertNewMemberType" runat="server" 
                                    CssClass="styled-button-1" Text="Cancel" />
                                &nbsp;
                                <asp:Label ID="lblNewMemberType" runat="server" CssClass="label">
                                <asp:TextBox ID="txtNewIntMemberType" runat="server" CssClass="InputTxtBox" 
                                    ValidationGroup="IntMemberType" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFldNewIntMemberType" runat="server" 
                                    ControlToValidate="txtNewIntMemberType" ErrorMessage="*" 
                                    ValidationGroup="IntMemberType"></asp:RequiredFieldValidator>
                                <asp:CheckBox ID="chkIsActiveIntMemberType" runat="server" Text="Is Active" />
                                </asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                </td>
                            <td align="left" class="label">
                                </td>
                            <td align="left">
                                <asp:Button ID="btnAddIntTeamMember" runat="server" CssClass="styled-button-1" 
                                    Text="Add Member" ValidationGroup="AddIntPnlMember" />
                                &nbsp;<asp:Button ID="btnCancelToAddMember" runat="server" 
                                    CssClass="styled-button-1" Text="Cancel" />
                                &nbsp;</td>
                            <td align="left">
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
                <asp:Panel ID="pnlShowExistingMember" runat="server" Width="900px" 
                    SkinID="pnlInner">
                    <div style="max-height:300px;max-width:880px;overflow:auto">
                    <asp:GridView ID="grdExistingTeamMember" runat="server" AutoGenerateColumns="False" 
                            CssClass="mGrid">
                        <Columns>
                            <asp:TemplateField HeaderText="IntPanelID" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("IntPanelID") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("IntPanelID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="IntTeamID" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("IntTeamID") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("IntTeamID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Team">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("IntTeamName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("IntTeamName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Employee">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Official Designation">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" 
                                        Text='<%# Bind("OfficialDesignation") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("OfficialDesignation") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Dept. Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("DeptName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("DeptName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Branch">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("ULCBranchName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("ULCBranchName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Member Type">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("MemberType") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("MemberType") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    </div>
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
    </table>
</asp:Content>

