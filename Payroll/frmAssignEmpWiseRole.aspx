<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmAssignEmpWiseRole.aspx.vb" Inherits="Payroll_frmAssignEmpWiseRole"
    Title=".:HRM:Employee Wise Role assignment:." %>

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
                            <td class="label" style="width: 20px">
                            </td>
                            <td class="label">
                                Select Department
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="InputTxtBox" Width="200px">
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
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlSearchEmployee" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%">
                        <tr align="left">
                            <td>
                                <div class="widget-title">
                                    Employee List</div>
                            </td>
                            <td>
                                <div class="widget-title">
                                    Assigned Role</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%" valign="top">
                                <div style="max-height: 200px; max-width: 100%; overflow: auto"  id="divgrd" onscroll="SetDivPosition()">
                                    <asp:GridView ID="grdEmployeeList" runat="server" AutoGenerateColumns="False" CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                                        Text="Select"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="UniqueUserID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUniqueUserID" runat="server" Text='<%# Bind("UniqueUserID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Employee">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                            <td style="width: 50%" valign="top">
                                <div style="max-height: 200px; max-width: 100%; overflow: auto">
                                    <asp:GridView ID="grdAssignedRole" runat="server" CssClass="mGrid" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Role">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Role") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="EmpComponentID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmpComponentID" runat="server" Text='<%# Bind("EmpComponentID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ComponentID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAssignedComponentID" runat="server" Text='<%# Bind("ComponentID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Component">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Component") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Active">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIsActive" runat="server" Text='<%# Bind("IsActive") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Edit" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkbtnEdit" runat="server" CausesValidation="False" 
                                                        CssClass="linkbtn" Font-Size="14px" 
                                                        OnClientClick='<%# Eval("EmpComponentID","openWindow(""frmEmpComponentEdit.aspx?EmpComponentID={0}"",""Popup"",800,600);") %>' 
                                                        Text="Edit"></asp:LinkButton>
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
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlAvailableRoles" runat="server" SkinID="pnlInner" Width="100%">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <div class="widget-title">
                                    Available Roles</div>
                            </td>
                            <td>
                                <div class="widget-title">
                                    Components Withing the Role</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%" valign="top">
                                <div style="max-height: 200px; max-width: 100%; overflow: auto">
                                    <asp:GridView ID="grdAvailableRole" runat="server" AutoGenerateColumns="False" CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                                        Text="Select"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="RoleComponentID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAvailableRoleComponentID" runat="server" Text='<%# Bind("RoleComponentID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Role">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRoleName" runat="server" Text='<%# Bind("RoleName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                            <td style="width: 50%" valign="top">
                                <div style="max-height: 200px; max-width: 100%; overflow: auto">
                                    <asp:GridView ID="grdComponents" runat="server" CssClass="mGrid" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Select">
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="chkSelectAllRoleComponents" Text="Select All" 
                                                    onclick="GridSelectAllColumn(this);" runat="server"
                                                     />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkRoleComponents" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ComponentID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblComponentID" runat="server" Text='<%# Bind("ComponentID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Component">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ComponentName") %>'></asp:Label>
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
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlButtons" runat="server" SkinID="pnlInner" Width="100%">
                    <table style="width: 100%;">
                        <tr align="center">
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:Label ID="lblErrorMessage" CssClass="RequiredLabel" runat="server" Font-Size="Small"></asp:Label>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnAssignRole" runat="server" CssClass="styled-button-1" Text="Assign Role"
                                    OnClientClick="if (!confirm('Are you Sure to Assign Selected Compoents ?')) return false" />
                                &nbsp;<asp:Button ID="btnCancelAssign" runat="server" CssClass="styled-button-1"
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
</asp:Content>
