<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/EmployeeProfile/MasterEmpProfile.master"
    AutoEventWireup="false" CodeFile="frmApproveLoanApp.aspx.vb" Inherits="EmployeeProfile_frmApproveLoanApp"
    Title=".:HRS:Approve Loan Application:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="JavaScript" type="text/javascript">
    function openWindow(windowURL,windowName,windowWidth,windowHeight) {

    var left = (screen.width/2)-(windowWidth/2);
    var top = (screen.height/2)-(windowHeight/2);



    window.name = 'parentWnd';
    newWindow = window.open(windowURL,windowName,'top='+ top +',left='+ left +',width='+windowWidth+',height='+windowHeight+',toolbar=0,location=no,directories=0, status=0,menuBar=0,scrollBars=1,resizable=1');
    newWindow.focus();
    }
    </script>

    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Panel ID="pnlPrimaryApproval" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <div class="widget-title">
                                    Primary Approval<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div>
                                    <asp:GridView ID="grdAppliedLoanFrPrimaryRec" runat="server" AutoGenerateColumns="False"
                                        CssClass="mGrid" EmptyDataText="No Benefit Applied">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select"
                                                        Text="Select"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="BenefitID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPrimaryBenefitID" runat="server" Text='<%# Bind("BenefitID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Employee">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPrimaryEmployeeName" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Benefit Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPrimaryBenefitType" runat="server" Text='<%# Bind("BenefitType") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPrimaryAmount" runat="server" Text='<%# Bind("Amount","{0:N2}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPrimaryBenefitStatus" runat="server" Text='<%# Bind("BenefitStatus") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Attachment">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="hpPrimaryDocument" runat="server" CssClass="linkbtn" NavigateUrl='<%#"~/Attachments/"+ Eval("Attachment") %>'
                                                        Target="_blank">View</asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Entry Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("EntryDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Details" ShowHeader="True" Visible="True">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkbtnPrimaryBenefitDetailsView" runat="server" CausesValidation="False"
                                                        CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("BenefitID","openWindow(""frmBenefitDetailsView.aspx?BenefitID={0}"",""Popup"",600,600);") %>'
                                                        Text=" Details ">
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel ID="pnlLoanPrimaryApproval" runat="server" SkinID="pnlInner">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 200px">
                                            </td>
                                            <td class="label">
                                                Remarks
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtPrimaryAppRemarks" runat="server" CssClass="InputTxtBox" Height="50px"
                                                    TextMode="MultiLine" Width="250px"></asp:TextBox>
                                                &nbsp;<asp:RequiredFieldValidator ID="reqFldPrimaryAppRemarks" runat="server" ControlToValidate="txtPrimaryAppRemarks"
                                                    Display="None" ErrorMessage="Required: Remarks" ValidationGroup="LoanPrimaryApp"></asp:RequiredFieldValidator>
                                                <cc1:ValidatorCalloutExtender ID="reqFldApproverRemarks_ValidatorCalloutExtender0"
                                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                                    Enabled="True" TargetControlID="reqFldApproverRemarks" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                </cc1:ValidatorCalloutExtender>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnPrimaryApprove" runat="server" CssClass="styled-button-1" Text="Approve"
                                                    ValidationGroup="LoanPrimaryApp" />
                                                &nbsp;<asp:Button ID="btnPrimaryReject" runat="server" CssClass="styled-button-1"
                                                    Text="Reject" ValidationGroup="LoanPrimaryApp" />
                                                &nbsp;<asp:Button ID="btnPrimaryCancel" runat="server" CssClass="styled-button-1"
                                                    Text="Cancel" />
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlApproveLoanApp" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <div class="widget-title">
                                    Approve Loan Application</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div>
                                    <asp:GridView ID="grdAppliedLoanApplication" runat="server" AutoGenerateColumns="False"
                                        CssClass="mGrid" EmptyDataText="No Benefit Applied">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                                        Text="Select"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="BenefitID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBenefitID" runat="server" Text='<%# Bind("BenefitID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Employee">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmployeeName" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Benefit Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBenefitType" runat="server" Text='<%# Bind("BenefitType") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("Amount","{0:N2}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBenefitStatus" runat="server" Text='<%# Bind("BenefitStatus") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Attachment">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="hpDocument" runat="server" CssClass="linkbtn" NavigateUrl='<%#"~/Attachments/"+ Eval("Attachment") %>'
                                                        Target="_blank">View</asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Entry Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("EntryDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Details" ShowHeader="True" Visible="True">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkbtnBenefitDetailsView" runat="server" CausesValidation="False"
                                                        CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("BenefitID","openWindow(""frmBenefitDetailsView.aspx?BenefitID={0}"",""Popup"",600,600);") %>'
                                                        Text=" Details ">
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel ID="pnlLoanRecommendation" runat="server" SkinID="pnlInner">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 200px">
                                            </td>
                                            <td class="label">
                                                Remarks
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtRemarks" runat="server" CssClass="InputTxtBox" Height="50px"
                                                    TextMode="MultiLine" Width="250px"></asp:TextBox>
                                                &nbsp;<asp:RequiredFieldValidator ID="reqFldApproverRemarks" runat="server" ControlToValidate="txtRemarks"
                                                    Display="None" ErrorMessage="Required: Remarks" ValidationGroup="LoanApproval"></asp:RequiredFieldValidator>
                                                <cc1:ValidatorCalloutExtender ID="reqFldApproverRemarks_ValidatorCalloutExtender"
                                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                                    Enabled="True" TargetControlID="reqFldApproverRemarks" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                </cc1:ValidatorCalloutExtender>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnApprove" runat="server" CssClass="styled-button-1" Text="Approve"
                                                    ValidationGroup="LoanApproval" />
                                                &nbsp;<asp:Button ID="btnReject" runat="server" CssClass="styled-button-1" Text="Reject"
                                                    ValidationGroup="LoanApproval" />
                                                &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" Text="Cancel" />
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
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
    </table>
</asp:Content>
