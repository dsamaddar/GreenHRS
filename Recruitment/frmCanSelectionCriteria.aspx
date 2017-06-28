<%@ Page Language="VB" AutoEventWireup="false" CodeFile="frmCanSelectionCriteria.aspx.vb"
    Inherits="Recruitment_frmCanSelectionCriteria" Theme="CommonSkin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>.:HRS:Candidate Selection Criteria:.</title>
    <style type="text/css">
        .modalBackground
        {
            background-color: ButtonHighlight;
            filter: alpha(opacity=60);
            opacity: 1.00;
        }
        .widget-title, .widgettitle
        {
            background: linear-gradient(-90deg, #D7D7D7, #A9A9A9) repeat scroll 0 0 transparent;
            border-bottom: 1px solid #848484;
            border-top: 1px solid #F5F5F5;
            box-shadow: 0 1px 1px rgba(0, 0, 0, 0.15);
            color: #000000;
            display: block;
            font: bold 14px/110% Cambria,Palatino, "Palatino Linotype" , "Palatino LT STD" ,Georgia,serif; /*
      font: bold 14px/110% "Lucida Grande",Arial,"Lucida Sans Unicode",sans-serif;
      left: -18px;
      top: -16px;
      border-top-left-radius: 8px;
      border-top-right-radius: 8px;
      color: #333333;
    */
            margin: 0 0 -5px;
            padding: 6px 18px 7px; /*position: relative;*/
            text-shadow: 0 1px 0 rgba(255, 255, 255, 0.7);
            width: auto;
            z-index: -1 !important;
        }
        .mGrid
        {
            width: 100%;
            background-color: #fff;
            margin: 5px 0 10px 0;
            border: solid 1px #525252;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr valign="top">
            <td>
                <asp:Panel ID="pnlSuitableForList" runat="server" CssClass="modalBackground" Width="650px"
                    SkinID="pnlInner">
                    <table width="100%">
                        <tr>
                            <td>
                                <div class="widgettitle">
                                    Candidate Suitable For</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBoxList ID="chkLstSuitForRecruitment" runat="server" CssClass="mGrid" RepeatColumns="4"
                                    RepeatDirection="Horizontal">
                                </asp:CheckBoxList>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                <asp:Panel ID="pnlModalLocation" runat="server" CssClass="modalBackground" Width="450px"
                    SkinID="pnlInner">
                    <table width="100%">
                        <tr>
                            <td>
                                <div class="widgettitle">
                                    Candidate Suitable Location</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="udpLocations" runat="server">
                                    <ContentTemplate>
                                        <table width="100%">
                                            <tr align="left">
                                                <td style="width: 40%">
                                                    <div class="widget-title">
                                                        Region</div>
                                                </td>
                                                <td style="width: 60%">
                                                    <div class="widget-title">
                                                        Branch</div>
                                                </td>
                                            </tr>
                                            <tr align="left">
                                                <td style="width: 40%">
                                                    <asp:CheckBoxList ID="chkRegions" runat="server" AutoPostBack="True" onClientClick="__doPostBack('hidButton','OnClick');">
                                                    </asp:CheckBoxList>
                                                </td>
                                                <td style="width: 60%">
                                                    <asp:CheckBoxList ID="chkBranch" runat="server">
                                                    </asp:CheckBoxList>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
