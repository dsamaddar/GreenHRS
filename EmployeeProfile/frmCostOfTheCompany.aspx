<%@ Page Language="VB" AutoEventWireup="false" CodeFile="frmCostOfTheCompany.aspx.vb"
    Theme="CommonSkin" Inherits="EmployeeProfile_frmCostOfTheCompany" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>.:HRS:Cost Of The Company:.</title>
    <link href="../Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
    <link href="../Sources/css/ValidatorStyle.css" rel="stylesheet" type="text/css" />
    <link href="Css/GridStyle.css" rel="stylesheet" type="text/css" />
    <link href="Css/Title.css" rel="stylesheet" type="text/css" />
    <link href="Css/Tab.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .headerLine
        {
            text-decoration: underline;
            font-family: Verdana;
            font-size: medium;
            text-align: center;
        }
        .summaryLine
        {
        	
            height: 15.0pt;
            width: 138pt;
            color: blue;
            font-size: 11.0pt;
            font-weight: 700;
            font-style: italic;
            text-decoration: none;
            font-family: Calibri, sans-serif;
            vertical-align: bottom;
            white-space: nowrap;
            border-style: none;
            border-color: inherit;
            border-width: medium;
            padding-left: 1px;
            padding-right: 1px;
            padding-top: 1px;
            
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                &nbsp;
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlCOC" runat="server" Width="80%" SkinID="pnlInner">
                    <table style="width: 100%;" class="label">
                        <tr>
                            <td class="headerLine" colspan="6">
                                <b><i>Cost to the Company Calculation</i></b> &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="widows: 80px">
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="titleBackGround" colspan="2" style="width: 250px">
                                Salary&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="lblSalary" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titleBackGround" colspan="2" style="width: 250px">
                                Provident Fund&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="lblPF" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Basic
                            </td>
                            <td align="right">
                                <asp:Label ID="lblBasic" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                                Employer&#39;s Contribution
                            </td>
                            <td align="right">
                                <asp:Label ID="lblEmpContribution" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                House Rent
                            </td>
                            <td align="right">
                                <asp:Label ID="lblHouseRent" runat="server"></asp:Label>
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
                                Transport Allowance
                            </td>
                            <td align="right">
                                <asp:Label ID="lblTransport" runat="server"></asp:Label>
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
                            <td class="titleBackGround" colspan="2" style="width: 250px">
                                Benefits&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="lblBenefits" runat="server"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td class="titleBackGround" colspan="2" style="width: 250px">
                                Other Ammortizations&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblOtherAmortization"
                                    runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Festival Component
                            </td>
                            <td align="right">
                                <asp:Label ID="lblFestivalComponent" runat="server" CssClass="label"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Mobile
                            </td>
                            <td align="right">
                                <asp:Label ID="lblMobile" runat="server" CssClass="label"></asp:Label>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Medical Allowance
                            </td>
                            <td align="right">
                                <asp:Label ID="lblMedicalAllowance" runat="server" CssClass="label"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Furniture
                            </td>
                            <td align="right">
                                <asp:Label ID="lblFurniture" runat="server" CssClass="label"></asp:Label>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Mobile Bill Reimbursement
                            </td>
                            <td align="right">
                                <asp:Label ID="lblMobileBillReim" runat="server" CssClass="label"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Electrical Appliances
                            </td>
                            <td align="right">
                                <asp:Label ID="lblElecAppliance" runat="server" CssClass="label"></asp:Label>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Local Conveyance
                            </td>
                            <td align="right">
                                <asp:Label ID="lblLocalConveyence" runat="server" CssClass="label"></asp:Label>
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
                                Motor bike Allowance
                            </td>
                            <td align="right">
                                <asp:Label ID="lblMotorBikeAllow" runat="server" CssClass="label"></asp:Label>
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
                                Special/Professional Allowance
                            </td>
                            <td align="right">
                                <asp:Label ID="lblSpecialAllow" runat="server" CssClass="label"></asp:Label>
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
                            <td class="titleBackGround" colspan="2" style="width: 250px">
                                Transport Allowance&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="lblTransportAllowance" runat="server"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td class="titleBackGround" colspan="2" style="width: 250px">
                                Vehicle Abatement&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="lblVehicleAbatement" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Allownce for Fuel expense
                            </td>
                            <td align="right">
                                <asp:Label ID="lblAllwFuelExp" runat="server"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Monthly Equivalent
                            </td>
                            <td align="right">
                                <asp:Label ID="lblVehMonthlyAbat" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Driver Allowance
                            </td>
                            <td align="right">
                                <asp:Label ID="lblDriverAllow" runat="server"></asp:Label>
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
                                Driver Festival Bonus
                            </td>
                            <td align="right">
                                <asp:Label ID="lblDriverFestAllow" runat="server"></asp:Label>
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
                                Maintenance
                            </td>
                            <td align="right">
                                <asp:Label ID="lblCarMaintenance" runat="server"></asp:Label>
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
                                Car Subsidy Allowance
                            </td>
                            <td align="right">
                                <asp:Label ID="lblCarSubsidyAllow" runat="server"></asp:Label>
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
                                Consolidated Allowance
                            </td>
                            <td align="right">
                                <asp:Label ID="lblConsolidatedAllow" runat="server"></asp:Label>
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
                            <td class="titleBackGround" colspan="2" style="width: 250px">
                                Bonuses - Monthly Equivalent&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="lblBonusMonthlyEqui" runat="server"></asp:Label>
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
                                Festival Bonus
                            </td>
                            <td align="right">
                                <asp:Label ID="lblFestivalAllowance" runat="server"></asp:Label>
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
                            <td class="summaryLine" align="left">
                                Total Cash Component
                            </td>
                            <td align="right">
                                <asp:Label ID="lblTotalCashComp" runat="server" Font-Italic="True" ForeColor="#009900"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse;
                                    width: 138pt" width="184">
                                    <colgroup>
                                        <col style="mso-width-source: userset; mso-width-alt: 6729; width: 138pt" width="184" />
                                    </colgroup>
                                    <tr height="20" style="height: 15.0pt">
                                        <td class="summaryLine" height="20" width="184">
                                            Total Non Cash Component
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="right">
                                <asp:Label ID="lblNonCashComp" runat="server" Font-Italic="True" ForeColor="#009900"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
