<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="NewCVByJobCircular.aspx.vb" Inherits="JobCircular_NewCVByJobCircular"
    Title="Untitled Page" %>

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
                <asp:Panel ID="pnlAvailableJobCircular" runat="server" SkinID="pnlInner" Width="800px">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                            </td>
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
                        <tr>
                            <td align="left" class="label">
                                Job Title
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpJobTitle" runat="server" CssClass="InputTxtBox" Width="200px"
                                    AutoPostBack="true" DataSourceID="dsJobTitle" DataValueField="CircularID" DataTextField="JobTitle">
                                </asp:DropDownList>
                                <br />
                                <asp:SqlDataSource ID="dsJobTitle" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="SELECT [CircularID], [JobTitle] FROM [tblJobCircular] where IsActive=1 ORDER BY [JobTitle]">
                                </asp:SqlDataSource>
                            </td>
                            <td align="left">
                                <asp:Button ID="btnSearch" runat="server" CssClass="styled-button-1" Text="Search" />
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
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
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Panel ID="Panel1" runat="server">
                    <table align="center">
                        <tr>
                            <td>
                                <asp:GridView ID="grdApplicaiton" Font-Names="Arial" Font-Size="12px" runat="server"
                                    AutoGenerateColumns="False" CellPadding="5" CellSpacing="3" DataSourceID="dsApplication"
                                    AllowPaging="True" PageSize="20" DataKeyNames="CircularID" EmptyDataText="No Records Available">
                                    <Columns>
                                        <asp:BoundField DataField="CandidateID" HeaderText="CandidateID" ReadOnly="True"
                                            SortExpression="CandidateID" />
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkHead" runat="server" AutoPostBack="True" OnCheckedChanged="chkHead_CheckedChanged">
                                                </asp:CheckBox>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelect" runat="server" AutoPostBack="True" OnCheckedChanged="chkSelect_CheckedChanged">
                                                </asp:CheckBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="EntryDate" HeaderText="EntryDate" ReadOnly="True" SortExpression="EntryDate" />
                                        <asp:BoundField DataField="CircularID" HeaderText="CircularID" SortExpression="CircularID" />
                                        <asp:BoundField DataField="CandidateName" HeaderText="CandidateName" SortExpression="CandidateName" />
                                        <asp:BoundField DataField="PreDistrict" HeaderText="PreDistrict" SortExpression="PreDistrict" />
                                        <asp:BoundField DataField="PerDistrict" HeaderText="PerDistrict" SortExpression="PerDistrict" />
                                        <asp:BoundField DataField="HighestDegree" HeaderText="HighestDegree" ReadOnly="True"
                                            SortExpression="HighestDegree" />
                                        <asp:BoundField DataField="Major" HeaderText="Major" ReadOnly="True" SortExpression="Major" />
                                        <asp:BoundField DataField="InstitutionName" HeaderText="InstitutionName" ReadOnly="True"
                                            SortExpression="InstitutionName" />
                                        <asp:BoundField DataField="JobTitle" HeaderText="JobTitle" SortExpression="JobTitle" />
                                        <asp:TemplateField HeaderText="Details">
                                            <ItemTemplate>
                                                <asp:ImageButton ImageUrl="~/img/details_icon.gif" Width="30px" PostBackUrl='<%#"~/JobCircular/CVDetailView.aspx?CircularID="+ Eval("CircularID") +"&" +"CandidateID="+ Eval("CandidateID")%>'
                                                    ID="ImageButton1" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Button ID="btnReviewed" CssClass="styled-button-1" runat="server" Text="Reviewed"
                                    OnClientClick="return confirm('Are you sure you want to Review selected items?');" />&nbsp;
                                <asp:Button ID="btnReject" CssClass="styled-button-1" runat="server" Text="Reject"
                                    OnClientClick="return confirm('Are you sure you want to Reject selected items?');" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:SqlDataSource ID="dsApplication" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="spCVGetForAppliedJobByID" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="drpJobTitle" Name="CircularID" PropertyName="SelectedValue"
                                            Type="String" DefaultValue="All" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp
            </td>
        </tr>
    </table>
</asp:Content>
