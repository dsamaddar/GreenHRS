<%@ Page Language="VB" AutoEventWireup="false" CodeFile="frmShowCandidateResult.aspx.vb" Inherits="CVMan_frmShowCandidateResult" %>


<%@ Register assembly="CrystalDecisions.Web, Version=10.5.3700.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr align="center" >
                <td>
                    <CR:CrystalReportViewer ID="crystalRptShowResult" runat="server" 
                AutoDataBind="true" EnableTheming="True" HasCrystalLogo="False" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
