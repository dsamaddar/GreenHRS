<%@ Page Language="VB" AutoEventWireup="false" CodeFile="frmEmpSkillSet.aspx.vb" Theme="CommonSkin" 
    Inherits="EmployeeProfile_frmEmpSkillSet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>.:HRS:Employee Skill Set:.</title>
    <style type="text/css">
        .mGrid
        {
            width: 100%;
            background-color: #fff;
            margin: 5px 0 10px 0;
            border: solid 1px #525252;
            border-collapse: collapse;
        }
        .mGrid th
        {
            padding: 4px 2px;
            color: #fff;
            background: #424242 url( '../Sources/Icons/grd_head.png' ) repeat-x 50% top;
            border-left: solid 1px #525252;
            font-size: 0.9em;
        }
        caption, th
        {
            text-align: left;
        }
        address, caption, cite, code, dfn, th, var
        {
            font-style: normal;
            font-weight: normal;
        }
        .mGrid td
        {
            padding: 2px;
            border: solid 1px #c1c1c1;
            color: #717171;
        }
    </style>
</head>
<body>
   <form id="form1" runat="server">
    <asp:Panel ID="pnlSummaryReport" runat="server" SkinID="pnlInner">
        <div style="max-height: 500px; max-width: 1000px; overflow: auto">
            <asp:GridView ID="grdEmpSkillSet" runat="server" CssClass="mGrid" 
                EmptyDataText="No Skill Obtained">
            </asp:GridView>
        </div>
    </asp:Panel>
    </form>
</body>
</html>
