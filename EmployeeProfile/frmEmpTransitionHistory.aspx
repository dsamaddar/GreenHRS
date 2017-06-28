<%@ Page Language="VB" AutoEventWireup="false" CodeFile="frmEmpTransitionHistory.aspx.vb"
    Inherits="EmployeeProfile_frmEmpTransitionHistory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>.:Employee Transition History:.</title>
    <link href="../Sources/css/GridStyle.css" rel="stylesheet" type="text/css" />
    <link href="../Sources/css/Title.css" rel="stylesheet" type="text/css" />

    <script src="../Sources/js/jquery-1.10.2.js" type="text/javascript"></script>

    <script src="../Sources/js/jquery.ui.core.min.js" type="text/javascript"></script>

    <script src="../Sources/js/jquery.tablesorter.min.js" type="text/javascript"></script>

    <style type="text/css">
        .linkbtn
        {
            font-family: Arial, Helvetica, sans-serif; /*font-family: Arial, Helvetica, sans-serif;*/
            font-size: 12px;
            text-decoration: underline;
            color: #006E12;
        }
        a
        {
            color: #333;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table style="width: 100%;">
        <tr align="left">
            <td>
                <div class="widgettitle">
                    Transition History
                </div>
            </td>
        </tr>
        <tr align="left">
            <td>
                <div style="max-height: 600px; max-width: device-width; overflow: auto">
                    <asp:GridView ID="grdEmpTranHistory" runat="server" AutoGenerateColumns="False" CssClass="mGrid">
                        <Columns>
                            <asp:TemplateField HeaderText="TransitionHistoryID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblTransitionHistoryID" runat="server" Text='<%# Bind("TransitionHistoryID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Event">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("EventName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Effective Date">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("EffectiveDate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Previous">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("PrevState") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="New">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("NewState") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnDelete" ImageUrl="~/Sources/icons/erase.png" OnClientClick="if (!confirm('Are you Sure to Delete The Transition ?')) return false"
                                        CommandName="Delete" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript">
        $(document).ready(function() {
            $("#grdEmpTranHistory").tablesorter();
        }); 
    </script>

    </form>
</body>
</html>
