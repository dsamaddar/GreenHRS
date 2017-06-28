<%@ Page Language="VB" Theme="CommonSkin"  AutoEventWireup="false" CodeFile="frmCanResponseDetails.aspx.vb" Inherits="ScreeningInterview_frmCanResponseDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>.:HRM:Candidate's Response Details:.</title>
    <link href="../Sources/css/Title.css" rel="stylesheet" type="text/css" />
    <link href="../Sources/css/GridStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table style="width:100%;">
        <tr align="center" >
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr align="center">
            <td></td>
            <td>
                <asp:Panel ID="pnlCanResponseDetails" runat="server" Width="800px" SkinID="pnlInner" >
                    <table width="100%">
                        <tr>
                            <td align="left">
                                <div class="widgettitle">Candidate's Response Details</div>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                 <div style="max-height:600px;max-width:790px;overflow:auto">
                        <asp:GridView ID="grdCanResDetails" runat="server" SkinID="grdNoFooter" 
                            CssClass="mGrid" >
                        </asp:GridView>
                    </div>
                            </td>
                        </tr>
                    </table>
                   
                </asp:Panel>
            </td>
            <td></td>
        </tr>
        <tr align="center">
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</form>
</body>
</html>
