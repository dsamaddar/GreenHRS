<%@ Page Language="VB" AutoEventWireup="false" CodeFile="frmEMPJDAcceptance.aspx.vb"
    Inherits="EmployeeInfo_frmEMPJDAcceptance" Theme="CommonSkin" Title=".:HRM:Accept JD:." %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>::JD Acceptance::</title>
    
    <link href="../Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%">
        <tr>
            <td align="center">
                <asp:Label runat="server" ID="idLabel" BackColor="#FF9D9D" Height="25px" Font-Bold="True"
                    Font-Names="Verdana" ForeColor="Black" Width="900px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel ID="pnl" runat="server" Width="900px" SkinID="pnlInner">
                    <table style="width: 100%">
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b><u>Job Description</u></b>
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                <b>Job Description No.</b> &nbsp;
                            </td>
                            <td align="left">
                                <asp:TextBox ID="lblJDNo" runat="server" Width="200px" CssClass="InputTxtBox" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Job Title</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="lblJobTitle" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="250px" Height="30px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                <b>Last Modified Date </b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="lblModifiedDate" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                            </td>
                            <td align="left" class="label">
                                <b class="label">JD Goal</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="lblJDGoal" runat="server" CssClass="InputTxtBox" ReadOnly="true"
                                    Width="250px" Height="50px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel ID="pnlEmpKeyRes" Width="900px" SkinID="pnlInner" runat="server">
                    <table width="100%">
                        <tr>
                            <td align="center">
                                <asp:GridView ID="grdKeyResInfo" Width="880px" Font-Names="Arial" Font-Size="12px"
                                    runat="server" AutoGenerateColumns="False" EmptyDataText="No Information Available"
                                    SkinID="grdNoFooter">
                                    <Columns>
                                        <asp:BoundField DataField="KeyResponsibilityTypeName" HeaderText="Key Responsibilities"
                                            SortExpression="KeyResponsibilityTypeName" />
                                        <asp:TemplateField HeaderText="JobDetail">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("JobDetail") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("JobDetail") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel ID="pnlEmpException" Width="900px" SkinID="pnlInner" runat="server">
                    <table width="100%">
                        <tr>
                            <td align="center">
                                <asp:GridView ID="grdException" Width="880px" Font-Names="Arial" Font-Size="12px"
                                    runat="server" AutoGenerateColumns="False" EmptyDataText="No Information Available"
                                    SkinID="grdNoFooter">
                                    <Columns>
                                        <asp:TemplateField HeaderText="ExceptionDetail">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ExceptionDetail") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ExceptionDetail") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel ID="pnlEmpKPI" Width="900px" SkinID="pnlInner" runat="server">
                    <table width="100%">
                        <tr>
                            <td align="center">
                                <asp:GridView ID="grdKPI" Width="880px" Font-Names="Arial" Font-Size="12px" runat="server"
                                    AutoGenerateColumns="False" EmptyDataText="No Information Available" SkinID="grdNoFooter">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="KPIDetail">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("KPIDetail") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("KPIDetail") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle Width="0px" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel ID="Panel1" Width="900px" SkinID="pnlInner" runat="server">
                    <table width="100%">
                        <tr>
                            <td align="center">
                                <asp:Button ID="btnJDAcc" runat="server" Text="Accept" CssClass="styled-button-1" />
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
