<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ApplicationProcess.aspx.vb"
    Inherits="ApplicationProcess" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Application Process</title>
    <link href="Sources/css/UltraCssClass.css" rel="Stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 700px; text-align :center ; padding-left :300px; padding-top :150px;" >
        <fieldset style="padding-left: 50px; width: 600px;">
            <legend><b>Application Process</b></legend>
            <fieldset style="width: 500px;">
                <table width="60%">
                    <tr>
                        <td align ="left" >
                            <b>Process Name</b>
                        </td>
                        <td>
                            <b>:</b>
                        </td>
                        <td align ="left">
                            <asp:TextBox ID="txtProcessName" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align ="left">
                            <b>Description</b>
                        </td>
                        <td>
                            <b>:</b>
                        </td>
                        <td align ="left">
                            <asp:TextBox ID="txtDescription" runat="server" CssClass="InputTxtBox" TextMode="MultiLine"
                                Width="300px" Height="60px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align ="left">
                            <b>Stage</b>
                        </td>
                        <td>
                            <b>:</b>
                        </td>
                        <td align ="left">
                            <asp:TextBox ID="txtStage" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <asp:Button ID="btnSave" runat="server" Text="Save" />
                            &nbsp&nbsp
                            <asp:Button ID="btnClear" runat="server" Text="Clear" />
                            &nbsp&nbsp
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" />
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset style="width: 500px;">
                <table width="60%">
                    <tr>
                        <td align="center">
                            <asp:GridView ID="grdAppProcess" runat="server" AutoGenerateColumns="False" DataKeyNames="AppProcessID"
                                DataSourceID="dsAppProcess" CellPadding="5" AllowPaging="True" AllowSorting="True"
                                Style="margin-right: 128px">
                                <Columns>
                                    <asp:TemplateField HeaderText="Selection">
                                        <ItemTemplate>
                                            <asp:ImageButton Width="40" ID="imgSelect" CommandName="Select" runat="server" ImageUrl="~/img/Select.jpg"
                                                CausesValidation="False" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:ImageButton Width="40" ID="imgDelete" CommandName="Delete" runat="server" OnClientClick="return confirm('Are You Sure You Want to Delete?')"
                                                ImageUrl="~/img/Delete.jpg" CausesValidation="False" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ProcessName" HeaderText="ProcessName" />
                                    <asp:BoundField DataField="Stage" HeaderText="Stage" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="dsAppProcess" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                SelectCommand="spApplicationProcess" SelectCommandType="StoredProcedure" DeleteCommand="Delete from tblApplicationProcess where AppProcessID=@AppProcessID">
                                <DeleteParameters>
                                    <asp:Parameter Name="AppProcessID" />
                                </DeleteParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </fieldset>
    </div>
    </form>
</body>
</html>
