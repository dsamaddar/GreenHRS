<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmCandidatePool.aspx.vb" Inherits="Recruitment_frmCandidatePool"
    Title=".:HRM:Candidate POOL:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script language="JavaScript" type="text/javascript">
        function openWindow(windowURL, windowName, windowWidth, windowHeight) {

            var left = (screen.width / 2) - (windowWidth / 2);
            var top = (screen.height / 2) - (windowHeight / 2);



            window.name = 'parentWnd';
            newWindow = window.open(windowURL, windowName, 'top=' + top + ',left=' + left + ',width=' + windowWidth + ',height=' + windowHeight + ',toolbar=0,location=no,directories=0, status=0,menuBar=0,scrollBars=1,resizable=1');
            newWindow.focus();
        }
    </script>

    <style type="text/css">
        .headerStyle
        {
            background-color: #FF6600;
            color: #FFFFFF;
            font-size: 8pt;
            font-weight: bold;
            width: 15%;
        }
        .Demandlabel
        {
            color: seagreen;
            float: left;
            font-size: 15pt;
            font-weight: bold;
            width: 41px;
        }
        .Supplylabel
        {
            color: royalblue;
            float: left;
            font-size: 15pt;
            font-weight: bold;
            width: 41px;
        }
        .Genlabel
        {
            color: black;
            float: left;
            font-size: 15pt;
            font-weight: bold;
            width: 41px;
        }
        .modalBackground
        {
            background-color: Black;
            filter: alpha(opacity=40);
            opacity: 0.4;
        }
        .modalPopup
        {
            background-color: #FFFFFF;
            width: 300px;
            border: 3px solid #0DA9D0;
        }
        .modalPopup .header
        {
            background-color: #2FBDF1;
            height: 30px;
            color: White;
            line-height: 30px;
            text-align: center;
            font-weight: bold;
        }
        .modalPopup .body
        {
            min-height: 50px;
            line-height: 30px;
            text-align: center;
            padding: 5px;
        }
        .modalPopup .footer
        {
            padding: 3px;
        }
        .modalPopup .button
        {
            height: 23px;
            color: White;
            line-height: 23px;
            text-align: center;
            font-weight: bold;
            cursor: pointer;
            background-color: #9F9F9F;
            border: 1px solid #5C5C5C;
        }
        .modalPopup td
        {
            text-align: left;
        }
    </style>

    <script language="JavaScript" type="text/javascript">
        function openWindow(windowURL,windowName,windowWidth,windowHeight) {
            var left = (screen.width/2)-(windowWidth/2);
            var top = (screen.height/2)-(windowHeight/2);
            window.name = 'parentWnd';
            newWindow = window.open(windowURL,windowName,'top='+ top +',left='+ left +',width='+windowWidth+',height='+windowHeight+',toolbar=0,location=no,directories=0, status=0,menuBar=0,scrollBars=1,resizable=1');
            newWindow.focus();
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlSearchParameter" runat="server" Width="100%" 
                    SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="5">
                                <div class="widget-title">
                                    Candidate Pool<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Suitable For
                            </td>
                            <td class="label">
                                &nbsp;
                            </td>
                            <td class="label">
                                Branch
                            </td>
                            <td class="label">
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpRecTypeList" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpRegion" runat="server" CssClass="InputTxtBox" Width="200px"
                                    Visible="False">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpBranchList" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnSearchCandidatePool" runat="server" Text="Search" CssClass="styled-button-1" />
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="Genlabel">
                                Demand
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td class="Genlabel">
                                Supply
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;
                            </td>
                            <td class="Genlabel">
                                <asp:LinkButton ID="lblDemand" runat="server" CssClass="Demandlabel">0</asp:LinkButton>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td class="Genlabel">
                                <asp:Label ID="lblSupply" runat="server" CssClass="Supplylabel">0</asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlShortListedCandidate" runat="server" Width="100%" 
                    SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <div style="max-height: 450px; max-width: 100%; overflow: auto">
                                    <asp:GridView ID="grdShortListedCandidate" runat="server" CssClass="mGrid" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField HeaderText="IntCandidateID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIntCandidateID" runat="server" Text='<%# Bind("IntCandidateID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CircularID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCircularID" runat="server" Text='<%# Bind("CircularID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CandidateID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCandidateID" runat="server" Text='<%# Bind("CandidateID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Interview Ranking">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Grading") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Candidate">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkbtnPending" runat="server" CausesValidation="False" CssClass="linkbtn"
                                                        Font-Size="14px" OnClientClick='<%# Eval("CandidateID","openWindow(""../frmIntAssessmentInfo.aspx?CandidateID={0}"",""Popup"",1000,1100);") %>'
                                                        Text='<%# Bind("Candidate") %>'>
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Phone No">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("PhoneNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Selection Criteria">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkSecCriteriaDetailsBtn" runat="server" CausesValidation="False"
                                                        CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("CandidateID","openWindow(""frmCanSelectionCriteria.aspx?CandidateID={0}"",""Popup"",1000,1100);") %>'
                                                        Text=" View ">
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CV">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkChooseCVDetailsBtn" runat="server" CausesValidation="False"
                                                        CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("CandidateID","openWindow(""../RecuitmentCVView.aspx?CandidateID={0}"",""Popup"",1000,1100);") %>'
                                                        Text=" View ">
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <div>
                                                        <asp:LinkButton ID="lnkAccept" runat="server" CommandArgument='<%# Bind("CandidateID")%>'
                                                            CommandName="accept" OnClick="grdShortListedCandidate_SelectedIndexChanged" OnClientClick="if (!confirm('Are you Sure to Accept?')) return false"
                                                            Text="Accept" />
                                                        |
                                                        <asp:LinkButton ID="lnkReject" runat="server" CommandArgument='<%# Eval("CandidateID")%>'
                                                            CommandName="reject" OnClick="grdShortListedCandidate_SelectedIndexChanged" OnClientClick="if (!confirm('Are you Sure to Reject?')) return false"
                                                            Text="Reject" />
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:LinkButton Text="" ID="lnkFake" runat="server" />
            </td>
        </tr>
        <tr align="center">
            <td colspan="3">
                <asp:Panel ID="pnlCanRejection" runat="server" SkinID="pnlInner" Width="400px" CssClass="modalPopup"
                    Style="display: none">
                    <table width="100%">
                        <tr>
                            <td colspan="2">
                                <div class="widgettitle">
                                    Candidate Rejection</div>
                            </td>
                            <td align="right">
                                <asp:ImageButton ID="imgBtnCloseLocation" runat="server" ImageUrl="~/Sources/Icons/erase.png" />
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label">
                                Rejection Remarks
                            </td>
                            <td>
                                <asp:TextBox ID="txtRejectionRemarks" runat="server" Width="200px" CssClass="inputtxtbox"
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:RequiredFieldValidator ID="reqFldRejectionRemarks" runat="server" ControlToValidate="txtRejectionRemarks"
                                    Display="None" ErrorMessage="Required: Rejection Remarks" ValidationGroup="Rejection"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldRejectionRemarks_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    TargetControlID="reqFldRejectionRemarks" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="3" align="center">
                                <asp:Button ID="btnRejectCandidate" runat="server" Text="Reject" CssClass="styled-button-1"
                                    ValidationGroup="Rejection" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <cc1:ModalPopupExtender ID="mpe" runat="server" PopupControlID="pnlCanRejection"
                    TargetControlID="lnkFake" CancelControlID="imgBtnCloseLocation" BackgroundCssClass="modalBackground">
                </cc1:ModalPopupExtender>
            </td>
        </tr>
    </table>
</asp:Content>
