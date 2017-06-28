<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmEmpWiseETASettings.aspx.vb" Inherits="Payroll_frmEmpWiseETASettings"
    Title=".::HRS:ETA Settings::." %>

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

    window.onload = function(){
        var strCook = document.cookie;
        if(strCook.indexOf("!~")!=0){
          var intS = strCook.indexOf("!~");
          var intE = strCook.indexOf("~!");
          var strPos = strCook.substring(intS+2,intE);
          document.getElementById("divgrd").scrollTop = strPos;
        }
      }
      function SetDivPosition(){
        var intY = document.getElementById("divgrd").scrollTop;
        document.title = intY;
        document.cookie = "yPos=!~" + intY + "~!";
      }
      
      window.scrollBy(100,100);
    </script>

    <table style="width: 100%;">
        <tr>
            <td align="center">
                <asp:Panel ID="pnlSelection" runat="server" Width="80%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="4">
                                <div class="widget-title">
                                    External Transport Allowance Settings<asp:ScriptManager ID="ScriptManager1" runat="server">
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
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Select Designation
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlOfficialDesignation" runat="server" AutoPostBack="True"
                                    CssClass="InputTxtBox" TabIndex="3" Width="200px">
                                </asp:DropDownList>
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
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td style="width: 80%" align="center">
                <table style="width: 100%;">
                    <tr>
                        <td align="center">
                            <asp:Panel ID="pnlETASettings" runat="server" Width="80%" SkinID="pnlInner">
                                <table style="width: 100%;">
                                    <tr align="left">
                                        <td>
                                        </td>
                                        <td rowspan="10" valign="top">
                                            <div id="divgrd" onscroll="SetDivPosition()" style="max-height: 300px; max-width: 300px;
                                                overflow: auto">
                                                <asp:GridView ID="grdEmployees" runat="server" AutoGenerateColumns="False" CssClass="mGrid"
                                                    EmptyDataText="No Available Employees">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LinkButton1" CssClass="linkbtn" runat="server" CausesValidation="False"
                                                                    CommandName="Select" Text="Select"></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="EmployeeID" Visible="False">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblEmployeeID" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Employee">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
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
                                        </td>
                                        <td class="label">
                                            Secondary Bank
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlBankName" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                                Width="200px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                        </td>
                                        <td class="label">
                                        </td>
                                        <td class="label">
                                            Branch
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlBranchName" runat="server" CssClass="InputTxtBox" Width="200px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                        </td>
                                        <td class="label">
                                        </td>
                                        <td class="label">
                                            A/C No
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtAccountNo" runat="server" CssClass="InputTxtBox" TabIndex="14"
                                                Width="120px"></asp:TextBox>
                                            &nbsp;<asp:RequiredFieldValidator ID="reqFldAccNo" runat="server" ControlToValidate="txtAccountNo"
                                                Display="None" ErrorMessage="Required: Account No" ValidationGroup="ETASettings"></asp:RequiredFieldValidator>
                                            <cc1:ValidatorCalloutExtender ID="reqFldAccNo_ValidatorCalloutExtender" runat="server"
                                                CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" TargetControlID="reqFldAccNo"
                                                WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                            </cc1:ValidatorCalloutExtender>
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                        </td>
                                        <td class="label">
                                        </td>
                                        <td class="label">
                                            Fuel (Liter)
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtFuel" runat="server" CssClass="InputTxtBox" Width="100px"></asp:TextBox>
                                            &nbsp;<asp:RequiredFieldValidator ID="reqFldFuel" runat="server" ControlToValidate="txtFuel"
                                                Display="None" ErrorMessage="Required: Fuel Allowance" ValidationGroup="ETASettings"></asp:RequiredFieldValidator>
                                            <cc1:ValidatorCalloutExtender ID="reqFldFuel_ValidatorCalloutExtender" runat="server"
                                                CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" TargetControlID="reqFldFuel"
                                                WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                            </cc1:ValidatorCalloutExtender>
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                        </td>
                                        <td class="label">
                                        </td>
                                        <td class="label">
                                            Driver Allowance
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtDriverAllowance" runat="server" CssClass="InputTxtBox" Width="100px"></asp:TextBox>
                                            &nbsp;<asp:RequiredFieldValidator ID="reqFldDriverAllowance" runat="server" ControlToValidate="txtDriverAllowance"
                                                Display="None" ErrorMessage="Required: Driver Allowance" ValidationGroup="ETASettings"></asp:RequiredFieldValidator>
                                            <cc1:ValidatorCalloutExtender ID="reqFldDriverAllowance_ValidatorCalloutExtender"
                                                runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                                TargetControlID="reqFldDriverAllowance" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                            </cc1:ValidatorCalloutExtender>
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                        </td>
                                        <td class="label">
                                        </td>
                                        <td class="label">
                                            Vehicle Maintenance
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtVehicleMaintenance" runat="server" CssClass="InputTxtBox" Width="100px"></asp:TextBox>
                                            &nbsp;<asp:RequiredFieldValidator ID="reqFldVehicleMaintenance" runat="server" ControlToValidate="txtVehicleMaintenance"
                                                Display="None" ErrorMessage="Required: Vehicle Maintenance Allowance" ValidationGroup="ETASettings"></asp:RequiredFieldValidator>
                                            <cc1:ValidatorCalloutExtender ID="reqFldVehicleMaintenance_ValidatorCalloutExtender"
                                                runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                                TargetControlID="reqFldVehicleMaintenance" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                            </cc1:ValidatorCalloutExtender>
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                        </td>
                                        <td class="label">
                                        </td>
                                        <td class="label">
                                            Car Subsidy
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtCarSubsidy" runat="server" CssClass="InputTxtBox" Width="100px"></asp:TextBox>
                                            &nbsp;<asp:RequiredFieldValidator ID="reqFldCarSubsidyAllowance" runat="server" ControlToValidate="txtCarSubsidy"
                                                Display="None" ErrorMessage="Required: Car Subsidy Allowance" ValidationGroup="ETASettings"></asp:RequiredFieldValidator>
                                            <cc1:ValidatorCalloutExtender ID="reqFldCarSubsidyAllowance_ValidatorCalloutExtender"
                                                runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                                TargetControlID="reqFldCarSubsidyAllowance" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                            </cc1:ValidatorCalloutExtender>
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                            &nbsp;</td>
                                        <td class="label">
                                            &nbsp;</td>
                                        <td class="label">
                                            Eligible For External TA</td>
                                        <td>
                                            <asp:CheckBox ID="chkIsEligible" runat="server" CssClass="chkText" 
                                                Text="Eligible" />
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
                                            <asp:Button ID="btnUpdate" runat="server" CssClass="styled-button-1" 
                                                Text="Update" />
                                            &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" 
                                                Text="Cancel" />
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
            </td>
        </tr>
    </table>
</asp:Content>
