<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/EmployeeProfile/MasterEmpProfile.master"
    AutoEventWireup="false" CodeFile="frmLoanApplication.aspx.vb" Inherits="EmployeeProfile_frmLoanApplication"
    Title=".:HRS:Loan Applicatoin:." Culture="auto" meta:resourcekey="PageResource1"
    UICulture="auto" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Panel ID="pnlLoanApplication" runat="server" SkinID="pnlInner" meta:resourcekey="pnlLoanApplicationResource1">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="5">
                                <div class="widget-title">
                                    Loan Application<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldFacilityType" runat="server" ControlToValidate="drpFacilityType"
                                    Display="None" ErrorMessage="Required: Facility Type" ValidationGroup="LoanApp"
                                    meta:resourcekey="reqFldFacilityTypeResource1"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldFacilityType_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldFacilityType" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Select Facility Type
                            </td>
                            <td>
                                <asp:DropDownList ID="drpFacilityType" runat="server" Width="200px" AutoPostBack="True"
                                    meta:resourcekey="drpFacilityTypeResource1">
                                </asp:DropDownList>
                                &nbsp;
                            </td>
                            <td class="label">
                                &nbsp;
                                <asp:Button ID="btnProcessReport" runat="server" BackColor="Blue" ForeColor="White"
                                    Text="Welfare Fund Loan Application" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                <asp:HiddenField ID="hdFldBenefitID" runat="server" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
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
                <cc1:TabContainer ID="tabBenefitComponents" CssClass="RadioButton" runat="server"
                    ActiveTabIndex="0" AutoPostBack="True" Width="100%" meta:resourcekey="tabBenefitComponentsResource1">
                    <cc1:TabPanel ID="tabPnlAddMobile" runat="server" HeaderText="Add Mobile" meta:resourcekey="tabPnlAddMobileResource1">
                        <HeaderTemplate>
                            <table width="100%">
                                <tr align="left">
                                    <td align="left" valign="top">
                                        <img src="../icons/icons/phone.png" style="max-height: 30px; max-width: 30px" />
                                    </td>
                                    <td align="left" valign="top">
                                        <b>ADD Mobile</b>
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table width="100%">
                                <tr>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Panel ID="pnlVehicle" runat="server" SkinID="pnlInner" meta:resourcekey="pnlVehicleResource1">
                                            <table style="width: 100%;">
                                                <tr align="left">
                                                    <td colspan="6">
                                                        <div class="widgettitle">
                                                            Mobile Facility</div>
                                                    </td>
                                                </tr>
                                                <tr align="left">
                                                    <td style="width: 20px">
                                                    </td>
                                                    <td style="width: 150px">
                                                    </td>
                                                    <td style="width: 200px">
                                                    </td>
                                                    <td style="width: 20px">
                                                    </td>
                                                    <td style="width: 150px">
                                                    </td>
                                                    <td style="width: 200px">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        IMEI No
                                                    </td>
                                                    <td>
                                                        <asp:TextBox runat="server" CssClass="InputTxtBox" Width="200px" ID="txtIMEINo" meta:resourcekey="txtIMEINoResource1"></asp:TextBox>
                                                        &#160;<asp:RequiredFieldValidator ID="reqFldMobileIMEINo" runat="server" ControlToValidate="txtIMEINo"
                                                            Display="None" ErrorMessage="Required: IMEI No" ValidationGroup="AddMobile" meta:resourcekey="reqFldMobileIMEINoResource1"></asp:RequiredFieldValidator>
                                                        <cc1:ValidatorCalloutExtender ID="reqFldMobileIMEINo_ValidatorCalloutExtender" runat="server"
                                                            CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                                            TargetControlID="reqFldMobileIMEINo" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                        </cc1:ValidatorCalloutExtender>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Brand
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList runat="server" CssClass="InputTxtBox" Width="200px" ID="drpMobileBrand"
                                                            meta:resourcekey="drpMobileBrandResource1">
                                                            <asp:ListItem meta:resourcekey="ListItemResource1" Text="Nokia"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource2" Text="Samsung"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource3" Text="Motorola"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource4" Text="Sony Ericsson"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource5" Text="Sony"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource6" Text="LG"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource7" Text="Apple"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource8" Text="HTC"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource9" Text="BlackBerry"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource10" Text="HP"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource11" Text="Huawei"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource12" Text="Acer"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource13" Text="Asus"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource14" Text="Dell"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource15" Text="Alcatel"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource16" Text="Vodafone"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource17" Text="T-Mobile"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource18" Text="Toshiba"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource19" Text="Gigabyte"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource20" Text="Pantech"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource21" Text="ZTE"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource22" Text="Micromax"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource23" Text="BLU"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource24" Text="Spice"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource25" Text="Karbonn"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource26" Text="Icemobile"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource27" Text="VeryKool"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource28" Text="Vertu"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource29" Text="Celkon"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource30" Text="NIU"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource31" Text="Yezz"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource32" Text="Parla"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource33" Text="Plum"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource34" Text="Symphony"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource35" Text="Walton"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource36" Text="G Five"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource37" Text="OPPO"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource38" Text="SPRINT"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource39" Text="PHILIPS"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource40" Text="MALATA"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource41" Text="TECNO"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource42" Text="OKAPIA"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource43" Text="INTEX"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource44" Text="VTECH"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource45" Text="GIONEE"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource46" Text="OPSSON"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource47" Text="GDL"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource48" Text="EXPRESS"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource49" Text="LENOVO"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource50" Text="LAVA"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Model No
                                                    </td>
                                                    <td>
                                                        <asp:TextBox runat="server" CssClass="InputTxtBox" Width="200px" ID="txtModelNo"
                                                            meta:resourcekey="txtModelNoResource1"></asp:TextBox>
                                                        &#160;<asp:RequiredFieldValidator ID="reqFldModelNo" runat="server" ControlToValidate="txtModelNo"
                                                            Display="None" ErrorMessage="Required: Model No" ValidationGroup="AddMobile"
                                                            meta:resourcekey="reqFldModelNoResource1"></asp:RequiredFieldValidator>
                                                        <cc1:ValidatorCalloutExtender ID="reqFldModelNo_ValidatorCalloutExtender" runat="server"
                                                            CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                                            TargetControlID="reqFldModelNo" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                        </cc1:ValidatorCalloutExtender>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Loan Amount
                                                    </td>
                                                    <td>
                                                        <asp:TextBox runat="server" CssClass="InputTxtBox" Width="200px" ID="txtMobileCost"
                                                            meta:resourcekey="txtMobileCostResource1"></asp:TextBox>
                                                        &#160;&nbsp;<asp:RequiredFieldValidator ID="reqFldMobileCost" runat="server" ControlToValidate="txtMobileCost"
                                                            Display="None" ErrorMessage="Required: Model Cost" ValidationGroup="AddMobile"
                                                            meta:resourcekey="reqFldMobileCostResource1"></asp:RequiredFieldValidator>
                                                        <cc1:ValidatorCalloutExtender ID="reqFldMobileCost_ValidatorCalloutExtender" runat="server"
                                                            CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                                            TargetControlID="reqFldMobileCost" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                        </cc1:ValidatorCalloutExtender>
                                                        <asp:RegularExpressionValidator ID="reqExpMobileCost" ControlToValidate="txtMobileCost"
                                                            ValidationExpression="[0-9]*\.?[0-9]*" ErrorMessage="numbers only" runat="server"
                                                            ValidationGroup="AddMobile" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Official SIM No
                                                    </td>
                                                    <td>
                                                        <asp:TextBox runat="server" CssClass="InputTxtBox" Width="200px" ID="txtSIMNo" meta:resourcekey="txtSIMNoResource1"></asp:TextBox>
                                                        &#160;<asp:RequiredFieldValidator ID="reqFldSIMNo" runat="server" ControlToValidate="txtSIMNo"
                                                            Display="None" ErrorMessage="Required: SIM No" ValidationGroup="AddMobile" meta:resourcekey="reqFldSIMNoResource1"></asp:RequiredFieldValidator>
                                                        <cc1:ValidatorCalloutExtender ID="reqFldSIMNo_ValidatorCalloutExtender" runat="server"
                                                            CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                                            TargetControlID="reqFldSIMNo" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                        </cc1:ValidatorCalloutExtender>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Date Of Purchase
                                                    </td>
                                                    <td>
                                                        <asp:TextBox runat="server" CssClass="InputTxtBox" Width="200px" ID="txtDateOfPurchase"></asp:TextBox>
                                                        <cc1:CalendarExtender ID="txtDateOfPurchase_CalendarExtender" runat="server" Enabled="True"
                                                            TargetControlID="txtDateOfPurchase">
                                                        </cc1:CalendarExtender>
                                                        &#160;<asp:RequiredFieldValidator ID="reqFldDateOfPurchase" runat="server" ControlToValidate="txtDateOfPurchase"
                                                            Display="None" ErrorMessage="Required: Date Of Purchase" ValidationGroup="AddMobile"
                                                            meta:resourcekey="reqFldDateOfPurchaseResource1"></asp:RequiredFieldValidator>
                                                        <cc1:ValidatorCalloutExtender ID="reqFldDateOfPurchase_ValidatorCalloutExtender"
                                                            runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                                            Enabled="True" TargetControlID="reqFldDateOfPurchase" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                        </cc1:ValidatorCalloutExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                    </td>
                                                    <td>
                                                        <asp:TextBox runat="server" CssClass="InputTxtBox" Width="200px" ID="txtMobileSetReimDate"
                                                            meta:resourcekey="txtMobileSetReimDateResource1" Visible="False"></asp:TextBox>
                                                        <cc1:CalendarExtender ID="txtMobileSetReimDate_CalendarExtender" runat="server" Enabled="True"
                                                            TargetControlID="txtMobileSetReimDate">
                                                        </cc1:CalendarExtender>
                                                        <asp:CompareValidator ID="dateValMobileSetReimDate" runat="server" ControlToValidate="txtMobileSetReimDate"
                                                            ErrorMessage="Invalid Date" Operator="DataTypeCheck" Type="Date" ValidationGroup="AddMobile"></asp:CompareValidator>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Entitlement
                                                    </td>
                                                    <td>
                                                        <asp:RadioButtonList ID="rdbtnEntitlement" runat="server" RepeatDirection="Horizontal">
                                                            <asp:ListItem>New</asp:ListItem>
                                                            <asp:ListItem>Replacement</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Attachment
                                                    </td>
                                                    <td>
                                                        <asp:FileUpload runat="server" ID="flUpMobileAttachment" meta:resourcekey="flUpMobileAttachmentResource1">
                                                        </asp:FileUpload>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Remarks
                                                    </td>
                                                    <td>
                                                        <asp:TextBox runat="server" TextMode="MultiLine" CssClass="InputTxtBox" Height="50px"
                                                            Width="200px" ID="txtRemarksForMobile" meta:resourcekey="txtRemarksForMobileResource1"></asp:TextBox>
                                                        &#160;&#160;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Insurance Required
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkMobileInsuranceRequired" runat="server" CssClass="chkText" Text="Yes"
                                                            meta:resourcekey="chkMobileInsuranceRequiredResource1" Checked="True" Enabled="False" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        &#160;
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="reqFldMobEntitlement" runat="server" ControlToValidate="rdbtnEntitlement"
                                                            Display="None" ErrorMessage="Required: Entitlement" meta:resourceKey="reqFldRemarksForMobileResource1"
                                                            ValidationGroup="AddMobile"></asp:RequiredFieldValidator>
                                                        <cc1:ValidatorCalloutExtender ID="reqFldMobEntitlement_ValidatorCalloutExtender"
                                                            runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                                            Enabled="True" TargetControlID="reqFldMobEntitlement" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                        </cc1:ValidatorCalloutExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="btnInsertAddMobile" runat="server" CssClass="DButton" Text="Apply For Benefit"
                                                            ValidationGroup="AddMobile" meta:resourcekey="btnInsertAddMobileResource1" />
                                                        <asp:Button ID="btnCancel" runat="server" CssClass="DButton" Text="Cancel" meta:resourcekey="btnCancelResource1" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="reqFldMobileReimDate" runat="server" ControlToValidate="txtMobileSetReimDate"
                                                            Display="None" ErrorMessage="Required: Reimbursement Date" meta:resourceKey="reqFldRemarksForMobileResource1"
                                                            ValidationGroup="AddMobile"></asp:RequiredFieldValidator>
                                                        <cc1:ValidatorCalloutExtender ID="reqFldMobileReimDate_ValidatorCalloutExtender"
                                                            runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                                            Enabled="True" TargetControlID="reqFldMobileReimDate" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                        </cc1:ValidatorCalloutExtender>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="reqFldRemarksForMobile" runat="server" ControlToValidate="txtRemarksForMobile"
                                                            Display="None" ErrorMessage="Required: Remarks" meta:resourceKey="reqFldRemarksForMobileResource1"
                                                            ValidationGroup="AddMobile"></asp:RequiredFieldValidator>
                                                        <cc1:ValidatorCalloutExtender ID="reqFldRemarksForMobile_ValidatorCalloutExtender"
                                                            runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                                            Enabled="True" TargetControlID="reqFldRemarksForMobile" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                        </cc1:ValidatorCalloutExtender>
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
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel ID="tabPnlAddVehicle" runat="server" HeaderText="Vehicle" meta:resourcekey="tabPnlAddVehicleResource1">
                        <HeaderTemplate>
                            <table width="100%">
                                <tr align="left">
                                    <td align="left" valign="top">
                                        <img src="../icons/icons/car.png" style="max-height: 30px; max-width: 30px" />
                                    </td>
                                    <td align="left" valign="top">
                                        <b>ADD Vehicle</b>
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table width="100%">
                                <tr>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Panel ID="pnlAddVehicle" runat="server" SkinID="pnlInner" meta:resourcekey="pnlAddVehicleResource1">
                                            <table style="width: 100%;">
                                                <tr align="left">
                                                    <td colspan="6">
                                                        <div class="widgettitle">
                                                            ADD Vehicle Loan</div>
                                                    </td>
                                                </tr>
                                                <tr align="left">
                                                    <td style="width: 20px">
                                                    </td>
                                                    <td colspan="5" style="color: Red">
                                                        * For Reconditioned Vehicle Computer Generated Examination Report Is Required
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Vehicle Type
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="drpVehicleType" runat="server" CssClass="InputTxtBox" Width="200px"
                                                            meta:resourcekey="drpVehicleTypeResource1">
                                                            <asp:ListItem meta:resourcekey="ListItemResource34" Text="Sedan Car"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource35" Text="Jeep"></asp:ListItem>
                                                            <asp:ListItem meta:resourcekey="ListItemResource36" Text="Motor Cycle"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Brand
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="drpBrand" runat="server" CssClass="InputTxtBox" Width="200px"
                                                            meta:resourcekey="drpBrandResource1">
                                                            <asp:ListItem>Audi</asp:ListItem>
                                                            <asp:ListItem>Bajaj</asp:ListItem>
                                                            <asp:ListItem>Marcedes Benz</asp:ListItem>
                                                            <asp:ListItem>Mitsubishi</asp:ListItem>
                                                            <asp:ListItem Value="BMW" Text="BMW"></asp:ListItem>
                                                            <asp:ListItem>Chery</asp:ListItem>
                                                            <asp:ListItem>Daewoo</asp:ListItem>
                                                            <asp:ListItem>Dayang</asp:ListItem>
                                                            <asp:ListItem>Emma</asp:ListItem>
                                                            <asp:ListItem>Ferrari</asp:ListItem>
                                                            <asp:ListItem>Ford</asp:ListItem>
                                                            <asp:ListItem>Hero Honda</asp:ListItem>
                                                            <asp:ListItem>Hyundai</asp:ListItem>
                                                            <asp:ListItem>Isuzu</asp:ListItem>
                                                            <asp:ListItem>Jaguar</asp:ListItem>
                                                            <asp:ListItem>Jeep</asp:ListItem>
                                                            <asp:ListItem>Kawasaki</asp:ListItem>
                                                            <asp:ListItem>KIA</asp:ListItem>
                                                            <asp:ListItem>Land Rover</asp:ListItem>
                                                            <asp:ListItem>Lexus</asp:ListItem>
                                                            <asp:ListItem>Lifan</asp:ListItem>
                                                            <asp:ListItem>Maruti</asp:ListItem>
                                                            <asp:ListItem>Mazda</asp:ListItem>
                                                            <asp:ListItem>Nissan</asp:ListItem>
                                                            <asp:ListItem>Porsche</asp:ListItem>
                                                            <asp:ListItem>Singer</asp:ListItem>
                                                            <asp:ListItem>Suzuki</asp:ListItem>
                                                            <asp:ListItem>Tata</asp:ListItem>
                                                            <asp:ListItem>Toyota</asp:ListItem>
                                                            <asp:ListItem>TVS</asp:ListItem>
                                                            <asp:ListItem>VESPA</asp:ListItem>
                                                            <asp:ListItem>Volkswagen</asp:ListItem>
                                                            <asp:ListItem>Yamaha</asp:ListItem>
                                                            <asp:ListItem>Walton</asp:ListItem>
                                                            <asp:ListItem>Zongshen</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Registration Date
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtRegistrationDate" runat="server" CssClass="InputTxtBox" Width="200px"
                                                            meta:resourcekey="txtRegistrationDateResource1"></asp:TextBox><cc1:CalendarExtender
                                                                ID="txtRegistrationDate_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtRegistrationDate">
                                                            </cc1:CalendarExtender>
                                                        &#160;<asp:RequiredFieldValidator ID="reqFldVehicleRegistrationDate" runat="server"
                                                            ControlToValidate="txtRegistrationDate" Display="None" ErrorMessage="Required: Registration Date"
                                                            ValidationGroup="AddVehicle" meta:resourcekey="reqFldVehicleRegistrationDateResource1"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                                                ID="reqFldVehicleRegistrationDate_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                                                CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldVehicleRegistrationDate"
                                                                WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                            </cc1:ValidatorCalloutExtender>
                                                        <asp:CompareValidator ID="dateValVehicleRegDate" runat="server" ControlToValidate="txtRegistrationDate"
                                                            ErrorMessage="Invalid Date" Operator="DataTypeCheck" Type="Date" ValidationGroup="AddVehicle"></asp:CompareValidator>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Registration No
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtRegistrationNo" runat="server" CssClass="InputTxtBox" Width="200px"
                                                            meta:resourcekey="txtRegistrationNoResource1"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator
                                                                ID="reqFldVehicleRegistrationNo" runat="server" ControlToValidate="txtRegistrationNo"
                                                                Display="None" ErrorMessage="Required: Registration No Required" ValidationGroup="AddVehicle"
                                                                meta:resourcekey="reqFldVehicleRegistrationNoResource1"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                                                    ID="reqFldVehicleRegistrationNo_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                                                    CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldVehicleRegistrationNo"
                                                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                                </cc1:ValidatorCalloutExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Year Model
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtYearModel" runat="server" CssClass="InputTxtBox" Width="200px"
                                                            meta:resourcekey="txtYearModelResource1"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator
                                                                ID="reqFldVehicleYearModel" runat="server" ControlToValidate="txtYearModel" Display="None"
                                                                ErrorMessage="Required: Year Model" ValidationGroup="AddVehicle" meta:resourcekey="reqFldVehicleYearModelResource1"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                                                    ID="reqFldVehicleYearModel_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                                                    CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldVehicleYearModel"
                                                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                                </cc1:ValidatorCalloutExtender>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Engine No
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtEngineNo" runat="server" CssClass="InputTxtBox" Width="200px"
                                                            meta:resourcekey="txtEngineNoResource1"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator
                                                                ID="reqFldVehicleEngineNo" runat="server" ControlToValidate="txtEngineNo" Display="None"
                                                                ErrorMessage="Requierd: Engine No" ValidationGroup="AddVehicle" meta:resourcekey="reqFldVehicleEngineNoResource1"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                                                    ID="reqFldVehicleEngineNo_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                                                    CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldVehicleEngineNo"
                                                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                                </cc1:ValidatorCalloutExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Current Owner
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtCurrentOwner" runat="server" CssClass="InputTxtBox" Width="200px"
                                                            meta:resourcekey="txtCurrentOwnerResource1"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator
                                                                ID="reqFldCurrentOwner" runat="server" ControlToValidate="txtCurrentOwner" Display="None"
                                                                ErrorMessage="Name Required" ValidationGroup="AddVehicle" meta:resourcekey="reqFldCurrentOwnerResource1"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                                                    ID="reqFldCurrentOwner_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                                                    CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldCurrentOwner"
                                                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                                </cc1:ValidatorCalloutExtender>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Chasis No
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtChasisNo" runat="server" CssClass="InputTxtBox" Width="200px"
                                                            meta:resourcekey="txtChasisNoResource1"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator
                                                                ID="reqFldVehicleChasisNo" runat="server" ControlToValidate="txtChasisNo" Display="None"
                                                                ErrorMessage="Requied: Chasis No" ValidationGroup="AddVehicle" meta:resourcekey="reqFldVehicleChasisNoResource1"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                                                    ID="reqFldVehicleChasisNo_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                                                    CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldVehicleChasisNo"
                                                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                                </cc1:ValidatorCalloutExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Previous Owner
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtPreviousOwner" runat="server" CssClass="InputTxtBox" Width="200px"
                                                            meta:resourcekey="txtPreviousOwnerResource1"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator
                                                                ID="reqFldPreviousOwner" runat="server" ControlToValidate="txtPreviousOwner"
                                                                Display="None" ErrorMessage="Required: Previous Owner" ValidationGroup="AddVehicle"
                                                                meta:resourcekey="reqFldPreviousOwnerResource1"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                                                    ID="reqFldPreviousOwner_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                                                    CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldPreviousOwner"
                                                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                                </cc1:ValidatorCalloutExtender>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Ownership Transfer Date
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtOwnershipTransferDate" runat="server" CssClass="InputTxtBox"
                                                            Width="200px" meta:resourcekey="txtOwnershipTransferDateResource1"></asp:TextBox><cc1:CalendarExtender
                                                                ID="txtOwnershipTransferDate_CalendarExtender" runat="server" Enabled="True"
                                                                TargetControlID="txtOwnershipTransferDate">
                                                            </cc1:CalendarExtender>
                                                        &#160;&nbsp;<asp:CompareValidator ID="dateValOwnershipTrnsDate" runat="server" ControlToValidate="txtOwnershipTransferDate"
                                                            ErrorMessage="Invalid Date" Operator="DataTypeCheck" Type="Date" ValidationGroup="AddVehicle"></asp:CompareValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Vehicle Cost
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtVehicleCost" runat="server" CssClass="InputTxtBox" Width="200px"
                                                            meta:resourcekey="txtVehicleCostResource1"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator
                                                                ID="reqFldVehicleLoanAmount" runat="server" ControlToValidate="txtVehicleCost"
                                                                Display="None" ErrorMessage="Required: Vehicle Loan Amount" ValidationGroup="AddVehicle"
                                                                meta:resourcekey="reqFldVehicleLoanAmountResource1"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                                                    ID="reqFldVehicleLoanAmount_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                                                    CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldVehicleLoanAmount"
                                                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                                </cc1:ValidatorCalloutExtender>
                                                        <asp:RegularExpressionValidator ID="regExpVehicleCost" ControlToValidate="txtVehicleCost"
                                                            ValidationExpression="[0-9]*\.?[0-9]*" ErrorMessage="numbers only" runat="server"
                                                            ValidationGroup="AddVehicle" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Remarks
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtRemarksOnVehicle" runat="server" CssClass="InputTxtBox" Height="50px"
                                                            TextMode="MultiLine" Width="200px" meta:resourcekey="txtRemarksOnVehicleResource1"></asp:TextBox>&#160;<asp:RequiredFieldValidator
                                                                ID="reqFldRemarksOnVehicle" runat="server" ControlToValidate="txtRemarksOnVehicle"
                                                                Display="None" ErrorMessage="Required: Remarks" ValidationGroup="AddVehicle"
                                                                meta:resourcekey="reqFldRemarksOnVehicleResource1"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                                                    ID="reqFldRemarksOnVehicle_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                                                    CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldRemarksOnVehicle"
                                                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                                </cc1:ValidatorCalloutExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &#160;&nbsp;
                                                    </td>
                                                    <td class="label">
                                                        Loan Amount
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtVehLoanAmount" runat="server" CssClass="InputTxtBox"></asp:TextBox>&#160;<asp:RequiredFieldValidator
                                                            ID="reqFldVehLoanAmount" runat="server" ControlToValidate="txtVehLoanAmount"
                                                            Display="None" ErrorMessage="Required: Vehicle Loan Amount" meta:resourceKey="reqFldVehicleLoanAmountResource1"
                                                            ValidationGroup="AddVehicle"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                                                ID="reqFldVehLoanAmount_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                                                CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldVehLoanAmount"
                                                                WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                            </cc1:ValidatorCalloutExtender>
                                                        &#160;<asp:RegularExpressionValidator ID="regExpVehicleCost0" runat="server" ControlToValidate="txtVehLoanAmount"
                                                            ErrorMessage="numbers only" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="AddVehicle"></asp:RegularExpressionValidator>
                                                    </td>
                                                    <td>
                                                        &#160;&nbsp;
                                                    </td>
                                                    <td class="label">
                                                        Installment Amount
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtInstallmentAmnt" runat="server" CssClass="InputTxtBox"></asp:TextBox>&#160;<asp:RequiredFieldValidator
                                                            ID="reqFldVehInsAmnt" runat="server" ControlToValidate="txtInstallmentAmnt" Display="None"
                                                            ErrorMessage="Required: Installment Amount" meta:resourceKey="reqFldRemarksOnVehicleResource1"
                                                            ValidationGroup="AddVehicle"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                                                ID="reqFldVehInsAmnt_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                                                CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldVehInsAmnt"
                                                                WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                            </cc1:ValidatorCalloutExtender>
                                                        &#160;<asp:RegularExpressionValidator ID="regExpVehInsAmnt" runat="server" ControlToValidate="txtInstallmentAmnt"
                                                            ErrorMessage="numbers only" ValidationExpression="[0-9]*\.?[0-9]*" ValidationGroup="AddVehicle"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Attachment
                                                    </td>
                                                    <td>
                                                        <asp:FileUpload ID="flupVehicleAttachment" runat="server" meta:resourceKey="flupVehicleAttachmentResource1"
                                                            Width="200px" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Vehicle Condition
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="drpVehicleCondition" runat="server" CssClass="InputTxtBox">
                                                            <asp:ListItem>Brand New</asp:ListItem>
                                                            <asp:ListItem>Reconditioned</asp:ListItem>
                                                            <asp:ListItem>Third Party</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Insurance Required
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkVehicleIsInsuranceRequired" runat="server" Checked="True" Enabled="False"
                                                            meta:resourceKey="chkVehicleIsInsuranceRequiredResource1" Text="Yes" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Reimbursement Date
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtVehicleReimbursementDate" runat="server" CssClass="InputTxtBox"
                                                            meta:resourceKey="txtVehicleReimbursementDateResource1" Width="200px"></asp:TextBox><cc1:CalendarExtender
                                                                ID="txtVehicleReimbursementDate_CalendarExtender" runat="server" Enabled="True"
                                                                TargetControlID="txtVehicleReimbursementDate">
                                                            </cc1:CalendarExtender>
                                                        <asp:CompareValidator ID="dateValVehicleReimDate" runat="server" ControlToValidate="txtVehicleReimbursementDate"
                                                            ErrorMessage="Invalid Date" Operator="DataTypeCheck" Type="Date" ValidationGroup="AddVehicle"></asp:CompareValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="btnAddVehicle" runat="server" CssClass="DButton" meta:resourceKey="btnAddVehicleResource1"
                                                            Text="Apply For Benefit" ValidationGroup="AddVehicle" />&#160;<asp:Button ID="btnCancelToAddVehichle"
                                                                runat="server" CssClass="DButton" meta:resourceKey="btnCancelToAddVehichleResource1"
                                                                Text="Cancel" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
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
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
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
                        </ContentTemplate>
                    </cc1:TabPanel>
                    <cc1:TabPanel ID="tabPnlAddPFLoan" runat="server" HeaderText="Vehicle" meta:resourcekey="tabPnlAddPFLoanResource1">
                        <HeaderTemplate>
                            <table width="100%">
                                <tr align="left">
                                    <td align="left" valign="top">
                                        <img src="../icons/icons/providentfund.jpg" style="max-height: 30px; max-width: 30px" />
                                    </td>
                                    <td align="left" valign="top">
                                        <b>PF/Welfare/Adv Salary Loan/Furniture/Electrical Appliance</b>
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table width="100%">
                                <tr>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Panel ID="pnlPFLoan" runat="server" SkinID="pnlInner" meta:resourcekey="pnlPFLoanResource1">
                                            <table style="width: 100%;">
                                                <tr align="left">
                                                    <td colspan="6">
                                                        <div class="widgettitle">
                                                            ADD General Loan</div>
                                                    </td>
                                                </tr>
                                                <tr align="left">
                                                    <td style="width: 20px">
                                                    </td>
                                                    <td style="width: 150px">
                                                    </td>
                                                    <td style="width: 200px">
                                                    </td>
                                                    <td style="width: 20px">
                                                    </td>
                                                    <td style="width: 150px">
                                                    </td>
                                                    <td style="width: 200px">
                                                        <asp:RequiredFieldValidator ID="reqFldGenLoanReimbursementDate" runat="server" ControlToValidate="txtReimbursementDate"
                                                            Display="None" ErrorMessage="Required: Reimbursement Date" meta:resourceKey="reqFldRemarksOnGeneralLoanResource1"
                                                            ValidationGroup="AddGeneralLoan"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                                                ID="reqFldGenLoanReimbursementDate_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                                                CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldGenLoanReimbursementDate"
                                                                WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                            </cc1:ValidatorCalloutExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Loan Amount
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtGeneralLoanAmount" runat="server" CssClass="InputTxtBox" Width="200px"
                                                            meta:resourcekey="txtGeneralLoanAmountResource1"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator
                                                                ID="reqFldGeneralLoanAmount" runat="server" ControlToValidate="txtGeneralLoanAmount"
                                                                Display="None" ErrorMessage="Required: Loan Amount" ValidationGroup="AddGeneralLoan"
                                                                meta:resourcekey="reqFldGeneralLoanAmountResource1"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                                                    ID="reqFldGeneralLoanAmount_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                                                    CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldGeneralLoanAmount"
                                                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                                </cc1:ValidatorCalloutExtender>
                                                        <asp:RegularExpressionValidator ID="regExpGenLoanAmount" ControlToValidate="txtGeneralLoanAmount"
                                                            ValidationExpression="[0-9]*\.?[0-9]*" Display="Static" EnableClientScript="true"
                                                            ErrorMessage="numbers only" runat="server" ValidationGroup="AddGeneralLoan" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtReimbursementDate" runat="server" CssClass="InputTxtBox" Width="200px"
                                                            Visible="false" meta:resourcekey="txtReimbursementDateResource1"></asp:TextBox><cc1:CalendarExtender
                                                                ID="txtReimbursementDate_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtReimbursementDate">
                                                            </cc1:CalendarExtender>
                                                        <asp:CompareValidator ID="dateValGenReimDate" runat="server" ControlToValidate="txtReimbursementDate"
                                                            ErrorMessage="Invalid Date" Operator="DataTypeCheck" Type="Date" ValidationGroup="AddGeneralLoan"> </asp:CompareValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Attachment
                                                    </td>
                                                    <td>
                                                        <asp:FileUpload ID="flupGeneralLoanAttachment" runat="server" Width="200px" meta:resourcekey="flupGeneralLoanAttachmentResource1" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="chkGeneralLoanIsInsuranceRequired" runat="server" Text="Yes" meta:resourcekey="chkGeneralLoanIsInsuranceRequiredResource1"
                                                            Enabled="False" Visible="false" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Remarks
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtRemarksOnGeneralLoan" runat="server" CssClass="InputTxtBox" Height="50px"
                                                            TextMode="MultiLine" Width="200px" meta:resourcekey="txtRemarksOnGeneralLoanResource1"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        &#160;&nbsp;
                                                    </td>
                                                    <td style="color: Red">
                                                        <asp:RequiredFieldValidator ID="reqFldRemarksOnGeneralLoan" runat="server" ControlToValidate="txtRemarksOnGeneralLoan"
                                                            Display="None" ErrorMessage="Required: Remarks" ValidationGroup="AddGeneralLoan"
                                                            meta:resourcekey="reqFldRemarksOnGeneralLoanResource1"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                                                ID="reqFldRemarksOnGeneralLoan_ValidatorCalloutExtender" runat="server" CloseImageUrl="~/Sources/images/valClose.png"
                                                                CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldRemarksOnGeneralLoan"
                                                                WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                            </cc1:ValidatorCalloutExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="btnAddGeneralLoan" runat="server" CssClass="DButton" Text="ADD General Loan"
                                                            ValidationGroup="AddGeneralLoan" meta:resourcekey="btnAddGeneralLoanResource1" />&#160;<asp:Button
                                                                ID="btnCancelToAddGeneralLoan" runat="server" CssClass="DButton" Text="Cancel"
                                                                meta:resourcekey="btnCancelToAddGeneralLoanResource1" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        &#160;&nbsp;
                                                    </td>
                                                    <td>
                                                        &#160;&nbsp;
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
                        </ContentTemplate>
                    </cc1:TabPanel>
                </cc1:TabContainer>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
