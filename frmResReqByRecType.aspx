<%@ Page Language="VB" AutoEventWireup="false" CodeFile="frmResReqByRecType.aspx.vb" Theme="CommonSkin" 
    Inherits="frmResReqByRecType" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>.:HRS:Recruitment Type Wise Requirement:.</title>
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
            background: #424242 url( 'Sources/Icons/grd_head.png' ) repeat-x 50% top;
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
        a
        {
            font: normal 12px/150% Arial, Helvetica, sans-serif;
            color: #188B27;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Panel ID="pnlList" runat="server" SkinID="pnlInner" >
                    <asp:GridView ID="grdPendingResourceReq" runat="server" AutoGenerateColumns="False"
                        CssClass="mGrid">
                        <Columns>
                            <asp:TemplateField HeaderText="ResourceReqID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblResourceReqID" runat="server" Text='<%# Bind("ResourceReqID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="RecruitmentType" HeaderText="Type" />
                            <asp:BoundField DataField="Code" HeaderText="Code" />
                            <asp:TemplateField HeaderText="No.Of.Res">
                                <ItemTemplate>
                                    <asp:Label ID="lblReqNoOfResource" runat="server" Text='<%# Bind("ReqNoOfResource") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Remarks" HeaderText="Remarks" />
                            <asp:BoundField DataField="EmployeeName" HeaderText="Employee" />
                            <asp:BoundField DataField="ReqDate" HeaderText="Req.Date" />
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
