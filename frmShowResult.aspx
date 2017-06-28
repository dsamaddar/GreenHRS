<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false" CodeFile="frmShowResult.aspx.vb" Inherits="frmShowResult" title=".:HRM : Exam Result:." %>

<%@ Register assembly="CrystalDecisions.Web, Version=10.5.3700.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
    <tr  align="center">
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr align="center" >
        <td>
            &nbsp;</td>
        <td>
            <CR:CrystalReportViewer ID="crystalRptShowResult" runat="server" 
                AutoDataBind="true" EnableTheming="True" HasCrystalLogo="False" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr  align="center">
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>

