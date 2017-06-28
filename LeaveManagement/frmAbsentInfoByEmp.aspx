<%@ Page Language="VB" AutoEventWireup="false" CodeFile="frmAbsentInfoByEmp.aspx.vb"
    Inherits="LeaveManagement_frmAbsentInfoByEmp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>.:HRS:Absent Info By Employee:.</title>
    <link href="../Sources/css/Title.css" rel="stylesheet" type="text/css" />
    <link href="../Sources/css/GridStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="grdAbsentInfoByEmp" runat="server" AutoGenerateColumns="False"
            CssClass="mGrid">
            <Columns>
                <asp:TemplateField HeaderText="Sl">
                    <ItemTemplate>
                        <font style="font-size: 12px">
                            <%#CType(Container, GridViewRow).RowIndex + 1%>
                        </font>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Absent Date">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("AbsentDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
