<%@ Page Language="VB" Theme="CommonSkin" AutoEventWireup="false" CodeFile="frmTaxAdvAdjHistory.aspx.vb"
    Inherits="Payroll_frmTaxAdvAdjHistory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>.:HRM:Tax Advance Adjustment History:.</title>
    <link href="../Sources/css/GridStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="max-height:300px;max-width:700px;overflow:auto">
        <asp:GridView ID="grdTaxAdvAdjHistory" runat="server" 
            AutoGenerateColumns="False" CssClass="mGrid" 
            EmptyDataText="No Adjustment Available">
            <Columns>
                <asp:TemplateField HeaderText="Adjusted Amount">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("AdjustedAmount") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Adjustment Date">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("AdjustmentDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Salary Year">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("SalaryYear") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Salary Month">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("SalaryMonth") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
