<%@ Page Language="VB" MasterPageFile="~/EmployeeProfile/MasterEmpProfile.master"
    Theme="CommonSkin" AutoEventWireup="false" CodeFile="frmEmpBenefit.aspx.vb" Inherits="EmployeeProfile_frmEmpBenefit"
    Title=".:HRM:Employee Benefit:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>
            </td>
            <td>
                <asp:Panel ID="pnl" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <cc1:TabContainer ID="tabEmpBenefit" CssClass="MyTabStyle" runat="server" ActiveTabIndex="0"
                                    AutoPostBack="True" Width="100%">
                                    <cc1:TabPanel ID="tabPnlVehicle" runat="server" HeaderText="Vehicle">
                                        <HeaderTemplate>
                                            <table>
                                                <tr align="left">
                                                    <td align="left" valign="top">
                                                        <img style="max-height: 30px; max-width: 30px" src="../icons/icons/car.png" />
                                                    </td>
                                                    <td align="left" valign="top">
                                                        <b>Vehicle</b>
                                                    </td>
                                                </tr>
                                            </table>
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <table width="100%">
                                                <tr>
                                                    <td>
                                                        <asp:GridView ID="grdExistingVehicle" runat="server">
                                                        </asp:GridView>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top">
                                                        <cc1:TabContainer ID="tabVehicleComponents" CssClass="MyTabStyle" runat="server"
                                                            ActiveTabIndex="0" AutoPostBack="True" Width="100%">
                                                            <cc1:TabPanel ID="tabPnlAddVehicle" runat="server" HeaderText="Vehicle">
                                                                <HeaderTemplate>
                                                                    <table width="100%">
                                                                        <tr align="left">
                                                                            <td align="left" valign="top">
                                                                                <img style="max-height: 30px; max-width: 30px" src="../icons/icons/loan.png" />
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
                                                                                <asp:Panel ID="pnlVehicle" runat="server" SkinID="pnlInner">
                                                                                    <table style="width: 100%;">
                                                                                        <tr align="left">
                                                                                            <td colspan="6" class="divTitleBackground">
                                                                                                ADD Vehicle Loan
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
                                                                                                Vehicle Type
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:DropDownList ID="drpVehicleType" runat="server" CssClass="InputTxtBox" Width="200px">
                                                                                                    <asp:ListItem>Sedan Car</asp:ListItem>
                                                                                                    <asp:ListItem>Jeep</asp:ListItem>
                                                                                                    <asp:ListItem>Motor Cycle</asp:ListItem>
                                                                                                </asp:DropDownList>
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td class="label">
                                                                                                Brand
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:DropDownList ID="drpBrand" runat="server" CssClass="InputTxtBox" Width="200px">
                                                                                                    <asp:ListItem>Toyota</asp:ListItem>
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
                                                                                                <asp:TextBox ID="txtRegistrationDate" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                                                                &nbsp;<asp:RequiredFieldValidator ID="reqFldVehicleRegistrationDate" runat="server" 
                                                                                                    ControlToValidate="txtRegistrationDate" Display="None" 
                                                                                                    ErrorMessage="Required: Registration Date" ValidationGroup="AddVehicle"></asp:RequiredFieldValidator>
                                                                                                <cc1:ValidatorCalloutExtender ID="reqFldVehicleRegistrationDate_ValidatorCalloutExtender" 
                                                                                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                                                                                    CssClass="customCalloutStyle" Enabled="True" 
                                                                                                    TargetControlID="reqFldVehicleRegistrationDate" 
                                                                                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                                                                </cc1:ValidatorCalloutExtender>
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td class="label">
                                                                                                Registration No
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox ID="txtRegistrationNo" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                                                                &nbsp;<asp:RequiredFieldValidator ID="reqFldVehicleRegistrationNo" runat="server" 
                                                                                                    ControlToValidate="txtRegistrationNo" Display="None" 
                                                                                                    ErrorMessage="Required: Registration No Required" ValidationGroup="AddVehicle"></asp:RequiredFieldValidator>
                                                                                                <cc1:ValidatorCalloutExtender ID="reqFldVehicleRegistrationNo_ValidatorCalloutExtender" 
                                                                                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                                                                                    CssClass="customCalloutStyle" Enabled="True" 
                                                                                                    TargetControlID="reqFldVehicleRegistrationNo" 
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
                                                                                                <asp:TextBox ID="txtYearModel" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                                                                &nbsp;<asp:RequiredFieldValidator ID="reqFldVehicleYearModel" runat="server" 
                                                                                                    ControlToValidate="txtYearModel" Display="None" 
                                                                                                    ErrorMessage="Required: Year Model" ValidationGroup="AddVehicle"></asp:RequiredFieldValidator>
                                                                                                <cc1:ValidatorCalloutExtender ID="reqFldVehicleYearModel_ValidatorCalloutExtender" 
                                                                                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                                                                                    CssClass="customCalloutStyle" Enabled="True" 
                                                                                                    TargetControlID="reqFldVehicleYearModel" 
                                                                                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                                                                </cc1:ValidatorCalloutExtender>
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td class="label">
                                                                                                Engine No
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox ID="txtEngineNo" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                                                                &nbsp;<asp:RequiredFieldValidator ID="reqFldVehicleEngineNo" runat="server" 
                                                                                                    ControlToValidate="txtEngineNo" Display="None" 
                                                                                                    ErrorMessage="Requierd: Engine No" ValidationGroup="AddVehicle"></asp:RequiredFieldValidator>
                                                                                                <cc1:ValidatorCalloutExtender ID="reqFldVehicleEngineNo_ValidatorCalloutExtender" 
                                                                                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                                                                                    CssClass="customCalloutStyle" Enabled="True" 
                                                                                                    TargetControlID="reqFldVehicleEngineNo" 
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
                                                                                                <asp:TextBox ID="txtCurrentOwner" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                                                                &nbsp;<asp:RequiredFieldValidator ID="reqFldCurrentOwner" runat="server" 
                                                                                                    ControlToValidate="txtCurrentOwner" Display="None" ErrorMessage="Name Required" 
                                                                                                    ValidationGroup="AddVehicle"></asp:RequiredFieldValidator>
                                                                                                <cc1:ValidatorCalloutExtender ID="reqFldCurrentOwner_ValidatorCalloutExtender" 
                                                                                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                                                                                    CssClass="customCalloutStyle" Enabled="True" 
                                                                                                    TargetControlID="reqFldCurrentOwner" 
                                                                                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                                                                </cc1:ValidatorCalloutExtender>
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td class="label">
                                                                                                Chasis No
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox ID="txtChasisNo" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                                                                &nbsp;<asp:RequiredFieldValidator ID="reqFldVehicleChasisNo" runat="server" 
                                                                                                    ControlToValidate="txtChasisNo" Display="None" 
                                                                                                    ErrorMessage="Requied: Chasis No" ValidationGroup="AddVehicle"></asp:RequiredFieldValidator>
                                                                                                <cc1:ValidatorCalloutExtender ID="reqFldVehicleChasisNo_ValidatorCalloutExtender" 
                                                                                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                                                                                    CssClass="customCalloutStyle" Enabled="True" 
                                                                                                    TargetControlID="reqFldVehicleChasisNo" 
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
                                                                                                <asp:TextBox ID="txtPreviousOwner" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                                                                &nbsp;<asp:RequiredFieldValidator ID="reqFldPreviousOwner" runat="server" 
                                                                                                    ControlToValidate="txtPreviousOwner" Display="None" 
                                                                                                    ErrorMessage="Required: Previous Owner" ValidationGroup="AddVehicle"></asp:RequiredFieldValidator>
                                                                                                <cc1:ValidatorCalloutExtender ID="reqFldPreviousOwner_ValidatorCalloutExtender" 
                                                                                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                                                                                    CssClass="customCalloutStyle" Enabled="True" 
                                                                                                    TargetControlID="reqFldPreviousOwner" 
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
                                                                                                    Width="200px"></asp:TextBox>
                                                                                                &nbsp;</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td class="label">
                                                                                                Loan Amount
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox ID="txtVehicleLoanAmount" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                                                                &nbsp;<asp:RequiredFieldValidator ID="reqFldVehicleLoanAmount" runat="server" 
                                                                                                    ControlToValidate="txtVehicleLoanAmount" Display="None" 
                                                                                                    ErrorMessage="Required: Vehicle Loan Amount" ValidationGroup="AddVehicle"></asp:RequiredFieldValidator>
                                                                                                <cc1:ValidatorCalloutExtender ID="reqFldVehicleLoanAmount_ValidatorCalloutExtender" 
                                                                                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                                                                                    CssClass="customCalloutStyle" Enabled="True" 
                                                                                                    TargetControlID="reqFldVehicleLoanAmount" 
                                                                                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                                                                </cc1:ValidatorCalloutExtender>
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td class="label">
                                                                                                Remarks
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox ID="txtRemarksOnVehicle" runat="server" CssClass="InputTxtBox" Height="50px"
                                                                                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                                                                                                &nbsp;<asp:RequiredFieldValidator ID="reqFldRemarksOnVehicle" runat="server" 
                                                                                                    ControlToValidate="txtRemarksOnVehicle" Display="None" 
                                                                                                    ErrorMessage="Required: Remarks" ValidationGroup="AddVehicle"></asp:RequiredFieldValidator>
                                                                                                <cc1:ValidatorCalloutExtender ID="reqFldRemarksOnVehicle_ValidatorCalloutExtender" 
                                                                                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                                                                                    CssClass="customCalloutStyle" Enabled="True" 
                                                                                                    TargetControlID="reqFldRemarksOnVehicle" 
                                                                                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                                                                </cc1:ValidatorCalloutExtender>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td>
                                                                                                Attachment</td>
                                                                                            <td>
                                                                                                <asp:FileUpload ID="flupVehicleAttachment" runat="server" Width="200px" />
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td>
                                                                                                &nbsp;</td>
                                                                                            <td>
                                                                                                &nbsp;</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td>
                                                                                                Insurence Required</td>
                                                                                            <td>
                                                                                                <asp:CheckBox ID="chkIsInsuranceRequired" runat="server" Text="Yes" />
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td>
                                                                                                Reimbursement Date</td>
                                                                                            <td>
                                                                                                <asp:TextBox ID="txtVehicleReimbursementDate" runat="server" 
                                                                                                    CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:Button ID="btnAddVehicle" runat="server" CssClass="DButton" 
                                                                                                    Text="ADD Vehicle" ValidationGroup="AddVehicle" />
                                                                                                &nbsp;<asp:Button ID="btnCancelToAddVehichle" runat="server" CssClass="DButton" 
                                                                                                    Enabled="False" Text="Cancel" />
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td>
                                                                                                &nbsp;
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
                                                            <cc1:TabPanel ID="tablPnlVehicleAmortization" runat="server" HeaderText="Vehicle">
                                                                <HeaderTemplate>
                                                                    <table width="100%">
                                                                        <tr align="left">
                                                                            <td align="left" valign="top">
                                                                                <img style="max-height: 30px; max-width: 30px" src="../icons/icons/schedule.png" />
                                                                            </td>
                                                                            <td align="left" valign="top">
                                                                                <b>Amortization</b>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </HeaderTemplate>
                                                                <ContentTemplate>
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Panel ID="pnlMakeVehicleSchedule" runat="server" SkinID="pnlInner">
                                                                                    <table style="width: 100%;">
                                                                                        <tr>
                                                                                            <td colspan="5" class="divTitleBackground">
                                                                                                Vehicle Loan Amortization
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
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                &nbsp;
                                                                                            </td>
                                                                                            <td>
                                                                                                Loan Amount
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox ID="txtVehicleLoanAmntSch" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                                                                                            </td>
                                                                                            <td>
                                                                                                Depreciation Year
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox ID="txtVehicleDepreciationYear" runat="server" CssClass="InputTxtBox"
                                                                                                    Width="100px"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td>
                                                                                                Adjustable From Salary
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:CheckBox ID="chkIsAdjustableFromSalary" runat="server" Text="Yes" />
                                                                                            </td>
                                                                                            <td>
                                                                                                Interest Rate
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox ID="txtVehicleIntRate" runat="server" CssClass="InputTxtBox" Width="100px"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td>
                                                                                                Abatement Applicable
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:CheckBox ID="chkIsAbatementApplicable" runat="server" Text="Yes" />
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
                                                                                                <asp:Button ID="btnMakeVehicleSchedule" runat="server" CssClass="DButton" Text="Show Schedule" />
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td>
                                                                                                &nbsp;
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </asp:Panel>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Panel ID="pnlShowVehicleSchedule" runat="server" SkinID="pnlInner">
                                                                                    <table style="width: 100%;">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:GridView ID="grdVehicleSchedule" runat="server">
                                                                                                </asp:GridView>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr align="center">
                                                                                            <td>
                                                                                                &nbsp;
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
                                                                </ContentTemplate>
                                                            </cc1:TabPanel>
                                                            <cc1:TabPanel ID="tabPnlInsurance" runat="server" HeaderText="Vehicle">
                                                                <HeaderTemplate>
                                                                    <table>
                                                                        <tr align="left">
                                                                            <td align="left" valign="top">
                                                                                <img style="max-height: 30px; max-width: 30px" src="../icons/icons/insurance.png" />
                                                                            </td>
                                                                            <td align="left" valign="top">
                                                                                <b>InsuranceInfo</b>
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
                                                                                <asp:Panel ID="pnlVehicleInsuranceInfo" runat="server" SkinID="pnlInner">
                                                                                    <table style="width: 100%;">
                                                                                        <tr>
                                                                                            <td colspan="6" class="divTitleBackground">
                                                                                                Vehicle Insurance
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
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
                                                                                                Type Insurance
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:DropDownList ID="drpInsuranceType" runat="server" CssClass="InputTxtBox" Width="200px">
                                                                                                </asp:DropDownList>
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td class="label">
                                                                                                Insurance&nbsp; With
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox ID="txtInsuranceWith" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td class="label">
                                                                                                Insurance No
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox ID="txtInsuranceValue" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td class="label">
                                                                                                Insured Value
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox ID="txtInsuranceNo" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td class="label">
                                                                                                Insurance Start Date
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox ID="txtInsuranceRenewalDate" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td class="label">
                                                                                                Insurance Renewal Date
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:TextBox ID="txtInsuranceStartDate" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:Button ID="btnAddInsurance" runat="server" CssClass="DButton" Text="ADD Insurance" />
                                                                                                &nbsp;<asp:Button ID="btnCancelToAddInsurance" runat="server" CssClass="DButton"
                                                                                                    Text="Cancel" />
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td>
                                                                                            </td>
                                                                                            <td>
                                                                                                &nbsp;
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
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                    <cc1:TabPanel ID="tabPnlMobile" runat="server" HeaderText="Mobile">
                                        <HeaderTemplate>
                                            <table>
                                                <tr align="left">
                                                    <td align="left" valign="top">
                                                        <img style="max-height: 30px; max-width: 30px" src="../icons/icons/phone.png" />
                                                    </td>
                                                    <td align="left" valign="top">
                                                        <b>Mobile</b>
                                                    </td>
                                                </tr>
                                            </table>
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Panel ID="pnlMobile" runat="server" SkinID="pnlInner">
                                                            <table style="width: 100%;">
                                                                <tr>
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
                                                                        <asp:TextBox ID="txtIMEINo" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                    </td>
                                                                    <td class="label">
                                                                        Brand
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList ID="drpMobileBrand" runat="server" CssClass="InputTxtBox" Width="200px">
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
                                                                        <asp:TextBox ID="txtModelNo" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                    </td>
                                                                    <td class="label">
                                                                        Mobile Cost
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtMobileCost" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                    </td>
                                                                    <td class="label">
                                                                        SIM No
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtSIMNo" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                    </td>
                                                                    <td class="label">
                                                                        Date Of Purchase
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtDateOfPurchase" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                    </td>
                                                                    <td class="label">
                                                                        Mobile Set Reimbursement Date
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtMobileSetReimDate" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                    </td>
                                                                    <td class="label">
                                                                        Depreciation Term
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtDepreciationTerm" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                    </td>
                                                                    <td class="label">
                                                                        Attachment
                                                                    </td>
                                                                    <td>
                                                                        <asp:FileUpload ID="flUpMobileAttachment" runat="server" />
                                                                    </td>
                                                                    <td>
                                                                    </td>
                                                                    <td class="label">
                                                                        Remarks
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtRemarksForMobile" runat="server" CssClass="InputTxtBox" Height="50px"
                                                                            TextMode="MultiLine" Width="200px"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                    </td>
                                                                    <td>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="btnShowMobileSchedule" runat="server" CssClass="DButton" Text="Show Schedule" />
                                                                    </td>
                                                                    <td>
                                                                    </td>
                                                                    <td>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                                <tr align="center">
                                                    <td>
                                                        <div>
                                                            <asp:GridView ID="grdMobileSchedule" runat="server">
                                                            </asp:GridView>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Panel ID="pnlMobileButtons" runat="server" SkinID="pnlInner">
                                                            <table width="100%">
                                                                <tr align="center">
                                                                    <td>
                                                                        <asp:Button ID="btnAddMobile" runat="server" CssClass="DButton" Text="ADD Mobile" />
                                                                        &nbsp;<asp:Button ID="btnCancelToAddMobile" runat="server" CssClass="DButton" Text="Cancel" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                    <cc1:TabPanel ID="tabPnlFurniture" runat="server" HeaderText="Furniture">
                                        <HeaderTemplate>
                                            <table>
                                                <tr align="left">
                                                    <td align="left" valign="top">
                                                        <img style="max-height: 30px; max-width: 30px" src="../icons/icons/furniture.png" />
                                                    </td>
                                                    <td align="left" valign="top">
                                                        <b>Furniture &amp; Electronics</b>
                                                    </td>
                                                </tr>
                                            </table>
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                        </ContentTemplate>
                                    </cc1:TabPanel>
                                </cc1:TabContainer>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
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
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
