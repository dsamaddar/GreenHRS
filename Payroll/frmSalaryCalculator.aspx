<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmSalaryCalculator.aspx.vb" Inherits="Payroll_frmSalaryCalculator"
    Title=".:HRS:Salary Calculator:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        function GridSelectAllColumn(spanChk)
        {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0]; xState = theBox.checked;
            elm = theBox.form.elements;
         
            for (i = 0; i < elm.length;i++) {
                if (elm[i].type === 'checkbox' && elm[i].checked != xState)
                    elm[i].click();
            }
        }
    </script>

    <script type="text/javascript">
        window.onload = function() {
            var strCook = document.cookie;
            if (strCook.indexOf("!~") != 0) {
                var intS = strCook.indexOf("!~");
                var intE = strCook.indexOf("~!");
                var strPos = strCook.substring(intS + 2, intE);
                document.getElementById("divgrd").scrollTop = strPos;
            }
        }
        function SetDivPosition() {
            var intY = document.getElementById("divgrd").scrollTop;
            document.title = intY;
            document.cookie = "yPos=!~" + intY + "~!";
        }

        window.scrollBy(100, 100); 
    </script>

    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlSalCalcSelection" runat="server" Width="80%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="3">
                                <div class="widget-title">
                                    Salary Calculator<asp:ScriptManager ID="ScriptManager1" runat="server">
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
                                <asp:RegularExpressionValidator ID="regExpBasicSalary" runat="server" 
                                    ControlToValidate="txtBasicSalary" Display="None" 
                                    ErrorMessage="Only Decimal Values" 
                                    ValidationExpression="^(?:0|[1-9][0-9]*)\.[0-9]+$" 
                                    ValidationGroup="AddRequisition"></asp:RegularExpressionValidator>
                                <cc1:ValidatorCalloutExtender ID="regExpBasicSalary_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="regExpBasicSalary" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Input Basic Salary
                            </td>
                            <td>
                                <asp:TextBox ID="txtBasicSalary" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldBasicSalary" runat="server" ControlToValidate="txtBasicSalary"
                                    Display="None" ErrorMessage="Required: Basic Salary" ValidationGroup="SalCalc"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldBasicSalary_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldBasicSalary" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Select Designation
                            </td>
                            <td>
                                <asp:DropDownList ID="drpRoles" runat="server" CssClass="InputTxtBox" Width="200px"
                                    AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
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
                <asp:Panel ID="pnlAvailableComponents" runat="server" Width="80%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td valign="top" style="max-height: 300px; max-width: 50%">
                                <asp:GridView ID="grdComponents" runat="server" CssClass="mGrid" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Select">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelectComponent" runat="server" />
                                            </ItemTemplate>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkSelectAll" runat="server" onclick="GridSelectAllColumn(this);"
                                                    Text="Select All" />
                                            </HeaderTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ComponentID" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblComponentID" runat="server" Text='<%# Bind("ComponentID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Component">
                                            <ItemTemplate>
                                                <asp:Label ID="lblComponentName" runat="server" Text='<%# Bind("ComponentName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                            <td>
                                <asp:ImageButton ID="imgBtnAddComponents" runat="server" ImageUrl="~/Sources/icons/rightarrow.png"
                                    ToolTip="Add Components" Width="30px" ValidationGroup="SalCalc" />
                            </td>
                            <td valign="top" style="max-height: 300px; max-width: 50%">
                                <asp:GridView ID="grdSelectedComponents" runat="server" CssClass="mGrid" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:TemplateField HeaderText="ComponentID" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCmpID" runat="server" Text='<%# Bind("CmpID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Component">
                                            <ItemTemplate>
                                                <asp:Label ID="lblComponent" runat="server" Text='<%# Bind("Component") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Value">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSalaryValue" runat="server" Text='<%# Bind("SalaryValue","{0:N2}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtnDelete" ImageUrl="~/Sources/icons/erase.png" OnClientClick="if (!confirm('Are you Sure to Delete The Component ?')) return false"
                                                    CommandName="Delete" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
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
</asp:Content>
