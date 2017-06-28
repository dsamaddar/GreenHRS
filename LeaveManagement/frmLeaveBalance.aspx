<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmLeaveBalance.aspx.vb" Inherits="LeaveManagement_frmLeaveBalance"
    Title="::Leave Balance::" Theme="CommonSkin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />

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
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Panel ID="pnlEmpInfo" runat="server" SkinID="pnlInner" Width="900px">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="6" align="left">
                                <div class="widgettitle">
                                    Assign Leave Balance<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px;">
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Text=""></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Total Leave</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtTotalLeave" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldTotalLeave" runat="server" ControlToValidate="txtTotalLeave"
                                    ErrorMessage="Required" ValidationGroup="Insert" Display="None"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="rreqFldTotalLeave_ValidatorCalloutExtender" runat="server" Enabled="True"
                                        TargetControlID="reqFldTotalLeave" CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png"
                                        WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Leave Year</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtLeaveYr" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldLeaveYr" runat="server" ControlToValidate="txtLeaveYr"
                                    ErrorMessage="Required" ValidationGroup="Insert" Display="None"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldLeaveYr_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="reqFldLeaveYr"
                                        CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                            </td>
                            <td align="left">
                                <asp:Button ID="btnInsert" runat="server" CssClass="styled-button-1" Text="Insert"
                                    ValidationGroup="Insert" />
                                &nbsp;<asp:Button ID="btnCancelSelection" runat="server" CssClass="styled-button-1"
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
            <td>
            </td>
        </tr>
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlEmpInfoList" runat="server" SkinID="pnlInner" Width="900px">
                    <table style="width: 100%;">
                        <tr align="center">
                            <td>
                                <div id="divgrd" onscroll="SetDivPosition()" style="max-height: 350px; width: 100%;
                                    overflow: auto">
                                    <asp:GridView ID="grdEmployeeName" runat="server" AutoGenerateColumns="False" Width="850px"
                                        CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="EmployeeID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmployeeID" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="chkHead" runat="server" AutoPostBack="True" OnCheckedChanged="chkHead_CheckedChanged" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkSelect" runat="server" AutoPostBack="True" OnCheckedChanged="chkSelect_CheckedChanged" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Employee">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmployeeName" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="EmpCode">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmpCode" runat="server" Text='<%# Bind("EmpCode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Department">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDeptName" runat="server" Text='<%# Bind("DeptName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Official Designation">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblOfficialDesignationName" runat="server" Text='<%# Bind("OfficialDesignationName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Joining Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoiningDate" runat="server" Text='<%# Bind("JoiningDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Last Balanced Year">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLeaveYear" runat="server" Text='<%# Bind("LeaveYear") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="TotalLeave">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("TotalLeave") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Previous Year Balance">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPrevYrBalance" runat="server" Text='<%# Bind("PrevYrBalance") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
