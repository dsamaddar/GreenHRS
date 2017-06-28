<%@ Page Language="VB" AutoEventWireup="false" CodeFile="frmJobDescriptionView.aspx.vb"
    Inherits="JD_frmJobDescriptionView" Theme="CommonSkin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>::Job Description::</title>
    <link href="../Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
    <link href="../Sources/css/Title.css" rel="stylesheet" type="text/css" />
</head>
<body>
        <form id="form1" runat="server">
        <table width="100%">
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
                    <asp:Panel ID="pnl" runat="server" Width="900px" SkinID="pnlInner">
                        <table style="width: 100%">
                            <tr>
                                <td align="left" colspan="6">
                                    <div class="widgettitle">Job Description</div>
                                </td>
                            </tr>
                            <tr align="left" >
                                <td style="width:20px"></td>
                                <td style="width:150px"></td>
                                <td style="width:200px"></td>
                                <td style="width:20px"></td>
                                <td style="width:150px"></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td align="left" class="label">
                                </td>
                                <td align="left" class="label">
                                    <b>Job Description No.</b> &nbsp;
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="lblJDNo" runat="server" CssClass="InputTxtBox" ReadOnly="True" 
                                        Width="200px"></asp:TextBox>
                                </td>
                                <td align="left" class="label">
                                </td>
                                <td align="left" class="label">
                                    <b>Job Title</b>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="lblJobTitle" runat="server" CssClass="InputTxtBox" 
                                        Height="50px" ReadOnly="True" TextMode="MultiLine" Width="250px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="label">
                                </td>
                                <td align="left" class="label">
                                    <b>Last Modified Date </b>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="lblModifiedDate" runat="server" CssClass="InputTxtBox" 
                                        ReadOnly="True" Width="200px"></asp:TextBox>
                                </td>
                                <td align="left">
                                    </td>
                                <td align="left" class="label">
                                    <b class="label">JD Goal</b>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="lblJDGoal" runat="server" CssClass="InputTxtBox" 
                                        ReadOnly="true" Width="250px" Height="50px" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td align="center">
                    <asp:Panel ID="Panel6" Width="900px" SkinID="pnlInner" runat="server">
                        <table width="100%">
                            <tr>
                                <td align="center">
                                    <asp:GridView ID="grdKeyResInfo" Width="880px" Font-Names="Arial" Font-Size="12px"
                                        runat="server" AutoGenerateColumns="False" EmptyDataText="No Information Available"
                                        DataSourceID="dsKeyRes" SkinID="grdNoFooter">
                                        <HeaderStyle HorizontalAlign="Left"  />
                                        <Columns>
                                            <asp:BoundField DataField="KeyResponsibilityTypeName" HeaderText="KEY RESPONSIBILITIES"
                                                SortExpression="KeyResponsibilityTypeName" />
                                            <asp:BoundField DataField="JobDetail" HeaderText="Details :" SortExpression="JobDetail" />
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:SqlDataSource ID="dsKeyRes" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                        SelectCommand="SELECT (select KeyResponsibilityTypeName from dbo.tblKeyResponsibilityType 
                                        where tblKeyResponsibilityType.KeyResTypeID=[tblKeyResponsibilityDetail].KeyResTypeID) KeyResponsibilityTypeName
                                        ,[tblKeyResponsibilityDetail].[JobDetail] from [tblKeyResponsibilityDetail] 
                                        where JobDescriptionID=@JobDescriptionID" ProviderName="<%$ ConnectionStrings:HRMConnectionString.ProviderName %>">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="JobDescriptionID" QueryStringField="JobDescriptionID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <table width="100%">
            <tr>
                <td>
                    &nbsp;
                </td>
                <td align="center">
                    <asp:Panel ID="Panel7" Width="900px" SkinID="pnlInner" runat="server">
                        <table width="100%">
                            <tr>
                                <td align="center">
                                    <asp:GridView ID="grdException" Width="880px" Font-Names="Arial" Font-Size="12px"
                                        runat="server" AutoGenerateColumns="False" EmptyDataText="No Information Available"
                                        DataSourceID="dsException" SkinID="grdNoFooter" >
                                        <HeaderStyle HorizontalAlign="Left"  />
                                        <Columns>
                                            <asp:BoundField DataField="ExceptionDetail" HeaderText="Exception Detail" SortExpression="ExceptionDetail" />
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:SqlDataSource ID="dsException" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                        SelectCommand="SELECT [ExceptionDetail]  FROM [dbo].[tblJobDescriptionException] 
                                        where JobDescriptionID=@JobDescriptionID" ProviderName="<%$ ConnectionStrings:HRMConnectionString.ProviderName %>">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="JobDescriptionID" QueryStringField="JobDescriptionID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <table width="100%">
            <tr>
                <td>
                    &nbsp;
                </td>
                <td align="center">
                    <asp:Panel ID="Panel9" Width="900px" SkinID="pnlInner" runat="server">
                        <table width="100%">
                            <tr>
                                <td align="center">
                                    <asp:GridView ID="grdKPI" Width="880px" Font-Names="Arial" Font-Size="12px" runat="server"
                                        AutoGenerateColumns="False" EmptyDataText="No Information Available" 
                                        DataSourceID="dsKPI" SkinID="grdNoFooter">
                                        <HeaderStyle HorizontalAlign="Left"  />
                                        <FooterStyle Width="0px" />
                                        <Columns>
                                            <asp:BoundField DataField="KPIDetail" HeaderText="KEY PERFORMANCE INDICATOR (KPI):" SortExpression="KPIDetail" />
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:SqlDataSource ID="dsKPI" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                        SelectCommand="SELECT [KPIDetail] FROM [dbo].[tblKPI] where [JobDescriptionID] =@JobDescriptionID"
                                        ProviderName="<%$ ConnectionStrings:HRMConnectionString.ProviderName %>">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="JobDescriptionID" QueryStringField="JobDescriptionID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>

        </form>

</body>
</html>
