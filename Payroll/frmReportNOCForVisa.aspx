<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmReportNOCForVisa.aspx.vb" Inherits="Payroll_frmReportNOCForVisa"
    Title=".:HRM:NOC For Visa:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        window.onload = function() {
            var strCook = document.cookie;
            if (strCook.indexOf("!~") != 0) {
                var intS = strCook.indexOf("!~");
                var intE = strCook.indexOf("~!");
                var strPos = strCook.substring(intS + 2, intE);
                document.getElementById("divEmpList").scrollTop = strPos;
                }
        }
        function SetDivPosition() {
            var intY = document.getElementById("divEmpList").scrollTop;
            document.title = intY;
            document.cookie = "yPos=!~" + intY + "~!";
        }
    </script>

    <table style="width: 100%;">
        <tr>
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlAssignExam" runat="server" SkinID="pnlInner" Width="100%">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="6" align="left">
                                <div class="widgettitle">
                                    Search Employee<asp:ScriptManager ID="ScriptManager1" runat="server">
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
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Name/Code
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmpIDOrName" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label" style="width: 20px">
                            </td>
                            <td class="label">
                                Select Department
                            </td>
                            <td>
                                <asp:DropDownList ID="drpSelectDepartment" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Select Designation
                            </td>
                            <td>
                                <asp:DropDownList ID="drpSelectDesignation" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label" style="width: 20px">
                            </td>
                            <td class="label">
                                District
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlPerDistrict" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Select Branch
                            </td>
                            <td>
                                <asp:DropDownList ID="drpULCBranch" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td tyle="width:20px">
                            </td>
                            <td class="label">
                                Gender
                            </td>
                            <td align="left">
                                <asp:RadioButtonList ID="rdbtnGender" runat="server" class="label" CssClass="rbdText"
                                    RepeatDirection="Horizontal" TabIndex="9">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                    <asp:ListItem>Others</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Blood Group
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlBloodGrp" runat="server" CssClass="InputTxtBox" TabIndex="11"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td tyle="width:20px">
                                &nbsp;
                            </td>
                            <td class="label">
                                Emplyee Type
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpEmployeeType" runat="server" CssClass="InputTxtBox" Width="200px">
                                    <asp:ListItem Value="N\A">N\A</asp:ListItem>
                                    <asp:ListItem Value="EMP">Regular Employee</asp:ListItem>
                                    <asp:ListItem Value="DA"></asp:ListItem>
                                    <asp:ListItem Value="OA">Office Assistant</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                                <b>Employee Status</b>&nbsp;
                            </td>
                            <td>
                                <asp:DropDownList ID="drpEmployeeStatus" runat="server" CssClass="InputTxtBox" Width="80px">
                                    <asp:ListItem Value="1">Active</asp:ListItem>
                                    <asp:ListItem Value="0">In-Active</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td tyle="width:20px">
                                &nbsp;
                            </td>
                            <td class="label">
                                &nbsp;
                            </td>
                            <td align="left">
                                <asp:Button ID="btnSearch" runat="server" CssClass="styled-button-1" Text="Search" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" Text="Cancel" />
                            </td>
                            <td>
                            </td>
                            <td class="label">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label" style="width: 20px">
                            </td>
                            <td class="label">
                            </td>
                            <td align="left">
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
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlEmployeeList" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td style="width: 40%">
                                <div class="widget-title">
                                    Found Employee</div>
                            </td>
                            <td style="width: 60%">
                                <div class="widget-title">
                                    Generate Report</div>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" >
                                <div id="divEmpList" onscroll="SetDivPosition()" style="max-height: 200px; max-width: 100%;
                                    overflow: auto">
                                    <asp:GridView ID="grdEmployeeList" runat="server" AutoGenerateColumns="False" CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                                        Text="Select"></asp:LinkButton>
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
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="width: 20px">
                                        </td>
                                        <td style="width: 150px">
                                        </td>
                                        <td style="width: 200px">
                                            <asp:HiddenField ID="hdFldEmployeeID" runat="server" />
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td class="label">
                                            Reference No
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtReferenceNo" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="reqFldRefNo" runat="server" ControlToValidate="txtReferenceNo"
                                                Display="None" ErrorMessage="Required : Basic Salary" ValidationGroup="GenerateReport"></asp:RequiredFieldValidator>
                                            <cc1:ValidatorCalloutExtender ID="reqFldRefNo_ValidatorCalloutExtender" runat="server"
                                                CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                                TargetControlID="reqFldRefNo" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                            </cc1:ValidatorCalloutExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td class="label">
                                            Country
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="drpCountry" runat="server" AutoPostBack="true" CssClass="InputTxtBox"
                                                Width="200px">
                                                <asp:ListItem Text="-Select-" Value="N\A"></asp:ListItem>
                                                <asp:ListItem Text="Bangladesh" Value="Bangladesh"></asp:ListItem>
                                                <asp:ListItem Text="Indonesia" Value="Indonesia"></asp:ListItem>
                                                <asp:ListItem Text="India" Value="India"></asp:ListItem>
                                                <asp:ListItem Text="Maldives" Value="Maldives"></asp:ListItem>
                                                <asp:ListItem Text="Mayanmar" Value="Mayanmar"></asp:ListItem>
                                                <asp:ListItem Text="Malaysia" Value="Malaysia"></asp:ListItem>
                                                <asp:ListItem Text="Philipine" Value="Philipine"></asp:ListItem>
                                                <asp:ListItem Text="Singapore" Value="Singapore"></asp:ListItem>
                                                <asp:ListItem Text="Srilanka" Value="Srilanka"></asp:ListItem>
                                                <asp:ListItem Text="Thailand" Value="Thailand"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td class="label">
                                            Departure Date
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtDepartureDate" runat="server" CssClass="InputTxtBox" Width="120px"></asp:TextBox>
                                            <cc1:CalendarExtender ID="txtDepartureDate_CalendarExtender" runat="server" Enabled="True"
                                                TargetControlID="txtDepartureDate">
                                            </cc1:CalendarExtender>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="reqFldDepartureDate" runat="server" ControlToValidate="txtDepartureDate"
                                                Display="None" ErrorMessage="Required : Departure Date" ValidationGroup="GenerateReport"></asp:RequiredFieldValidator>
                                            <cc1:ValidatorCalloutExtender ID="reqFldDepartureDate_ValidatorCalloutExtender" runat="server"
                                                CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                                TargetControlID="reqFldDepartureDate" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                            </cc1:ValidatorCalloutExtender>
                                            <asp:CompareValidator ID="cmpValDepartureDate" runat="server" ControlToValidate="txtDepartureDate"
                                                ErrorMessage="Invalid Date" Operator="DataTypeCheck" Type="Date" ValidationGroup="GenerateReport">
                                            </asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td class="label">
                                            Arrival Date
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtArrivalDate" runat="server" CssClass="InputTxtBox" Width="120px"></asp:TextBox>
                                            <cc1:CalendarExtender ID="txtArrivalDate_CalendarExtender" runat="server" Enabled="True"
                                                TargetControlID="txtArrivalDate">
                                            </cc1:CalendarExtender>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="reqFldArrivalDate" runat="server" ControlToValidate="txtArrivalDate"
                                                Display="None" ErrorMessage="Required : Arrival Date" ValidationGroup="GenerateReport"></asp:RequiredFieldValidator>
                                            <cc1:ValidatorCalloutExtender ID="reqFldArrivalDate_ValidatorCalloutExtender" runat="server"
                                                CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                                TargetControlID="reqFldArrivalDate" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                            </cc1:ValidatorCalloutExtender>
                                            <asp:CompareValidator ID="cmpValArrivalDate" runat="server" ControlToValidate="txtArrivalDate"
                                                ErrorMessage="Invalid Date" Operator="DataTypeCheck" Type="Date" ValidationGroup="GenerateReport">
                                            </asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            <asp:Button ID="btnProcessReport" runat="server" CssClass="styled-button-1" 
                                                Text="NOC" ValidationGroup="GenerateReport" />
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
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
    </table>
</asp:Content>
