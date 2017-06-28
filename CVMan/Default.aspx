<%@ Page Language="VB" MasterPageFile="~/CVMan/HRMCVMaster.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="CVMan_Default" Title="::HRM::" %>

<%--
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<table>
    <tr>
        <td>
            <asp:Panel ID="pnlApplicationStatus" Width="900px" runat="server" >
                <table style="width:100%;">
                    <tr align="center" style="height:150px">
                        <td>
                            &nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr  align="center">
                        <td>
                            <asp:Label ID="lblPercentage" runat="server" Font-Names="Verdana" 
                                Font-Size="15pt"></asp:Label>
                        </td>
                        <td>
                            </td>
                    </tr>
                    <tr align="center">
                        <td>
                            <asp:Label ID="lblCorrectPercentage" BackColor="#006600" runat="server" 
                                Height="30px" Font-Names="Verdana" Font-Size="14pt"></asp:Label>
                            <asp:Label ID="lblNotDone" runat="server" BackColor="#CC0000" Height="30px" 
                                Font-Names="Verdana" Font-Size="14pt"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr align="center">
                        <td>
                            <asp:Label ID="lblPresentStatus" runat="server" BackColor="#99CCFF" 
                                Font-Names="Verdana" Font-Size="14pt" Width="700px"></asp:Label>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        
        </td>
    </tr>
</table>
    
</asp:Content>
