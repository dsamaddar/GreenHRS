<%@ Page Language="VB" AutoEventWireup="false" CodeFile="frmBenefitDetailsView.aspx.vb"
    Inherits="EmployeeProfile_frmBenefitDetailsView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>.:HRS:Benefit Details View:.</title>
    <link href="Css/Title.css" rel="stylesheet" type="text/css" />
    <link href="Css/GridStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="widget-title">
        Benefit Details View
    </div>
    <div>
        <asp:GridView ID="grdBenefitDetailsView" runat="server" 
            AutoGenerateColumns="False" CssClass="mGrid">
            <Columns>
                <asp:BoundField DataField="Property" HeaderText="Property" />
                <asp:BoundField DataField="Value" HeaderText="Value" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
