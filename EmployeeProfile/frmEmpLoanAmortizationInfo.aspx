<%@ Page Language="VB" AutoEventWireup="false" CodeFile="frmEmpLoanAmortizationInfo.aspx.vb"
    Inherits="EmployeeProfile_frmEmpLoanAmortizationInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>.:HRM:Loan/Benefit Amortization:.</title>

    <script language="JavaScript" type="text/javascript">
    function openWindow(windowURL,windowName,windowWidth,windowHeight) {

    var left = (screen.width/2)-(windowWidth/2);
    var top = (screen.height/2)-(windowHeight/2);

    window.name = 'parentWnd';
    newWindow = window.open(windowURL,windowName,'top='+ top +',left='+ left +',width='+windowWidth+',height='+windowHeight+',toolbar=0,location=no,directories=0, status=0,menuBar=0,scrollBars=1,resizable=1');
    newWindow.focus();
}

    </script>

    <link href="Css/GridStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="grdEmpLoanAmtzInfo" runat="server" AutoGenerateColumns="False"
            CssClass="mGrid" ShowFooter="True">
            <Columns>
                <asp:TemplateField HeaderText="Sl">
                    <ItemTemplate>
                        <font style="font-size: 12px">
                            <%#CType(Container, GridViewRow).RowIndex + 1%>
                        </font>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="AmortizationID" Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("AmortizationID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Payment Date">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("PaymentDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Payment Amount">
                    <ItemTemplate>
                        <asp:Label ID="lblPaymentAmount" runat="server" Text='<%# Bind("PaymentAmount","{0:N2}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Principal Payment">
                    <ItemTemplate>
                        <asp:Label ID="lblPrincipalPayment" runat="server" Text='<%# Bind("PrincipalPayment","{0:N2}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Interest Payment">
                    <ItemTemplate>
                        <asp:Label ID="lblInterestPayment" runat="server" Text='<%# Bind("InterestPayment","{0:N2}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Abatement">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Abatement","{0:N2}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Outstanding">
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Outstanding","{0:N2}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="IsAdjusted">
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("IsAdjusted") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Principal Adjusted">
                    <ItemTemplate>
                        <asp:Label ID="lblPrincipalAdjusted" runat="server" Text='<%# Bind("PrincipalAdjusted","{0:N2}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Interest Adjusted">
                    <ItemTemplate>
                        <asp:Label ID="lblInterestAdjusted" runat="server" Text='<%# Bind("InterestAdjusted","{0:N2}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Adjustment Date">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("AdjustmentDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PmntStatus">
                    <ItemTemplate>
                        <asp:Label ID="lblPmntStatus" runat="server" Text='<%# Bind("PmntStatus") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
