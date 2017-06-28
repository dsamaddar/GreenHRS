<%@ Page Language="VB" MasterPageFile="~/EmployeeServices.master" AutoEventWireup="false"
    CodeFile="frmEmployeeInfo.aspx.vb" Inherits="EmployeeInfo_frmEmployeeInfo" Title=".:HRM:Employee Input:."
    Theme="CommonSkin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
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
                            <td style="width: 20px;">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                            </td>
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
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Employee Name</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtEmpName" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldJobTitle" runat="server" ControlToValidate="txtEmpName"
                                    ErrorMessage="Required" ValidationGroup="InsertEmp" Display="None"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldJobTitle_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="reqFldJobTitle"
                                        CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Employee Code</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtEmpCode" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldEmpCode" runat="server" ControlToValidate="txtEmpCode"
                                    ErrorMessage="Required" ValidationGroup="InsertEmp" Display="None"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldEmpCode_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="reqFldEmpCode"
                                        CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>User ID</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtUserID" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldEmpID" runat="server" ControlToValidate="txtUserID"
                                    ErrorMessage="Required" ValidationGroup="InsertEmp" Display="None"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldEmpID_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="reqFldEmpID"
                                        CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Password</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldEmpPasswd" runat="server" ControlToValidate="txtPassword"
                                    ErrorMessage="Required" ValidationGroup="InsertEmp" Display="None"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldEmpPasswd_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="reqFldEmpPasswd"
                                        CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Employee Type</b> <span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlEmpType" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Date of Birth</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtDateofBirth" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtDateofBirth_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtDateofBirth">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldClosingDate" runat="server" ControlToValidate="txtDateofBirth"
                                    ErrorMessage="Required" ValidationGroup="InsertEmp" Display="None"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldClosingDate_ValidatorCalloutExtender" runat="server" Enabled="True"
                                        TargetControlID="reqFldClosingDate" CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png"
                                        WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Joining Date</b> <span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtJoiningDate" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtJoiningDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtJoiningDate">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldJoiningDate" runat="server" ControlToValidate="txtJoiningDate"
                                    ErrorMessage="Required" ValidationGroup="InsertEmp" Display="None"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldJoiningDate_ValidatorCalloutExtender" runat="server" Enabled="True"
                                        TargetControlID="reqFldJoiningDate" CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png"
                                        WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Confirmation Date</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtConfirmationDate" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtConfirmationDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtConfirmationDate">
                                </cc1:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Promotion Date</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtPromotionDate" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtPromotionDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtPromotionDate">
                                </cc1:CalendarExtender>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Contract Expiry Date</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtContractExDate" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtContractExDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtContractExDate">
                                </cc1:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Termination Type</b>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlTerminationType" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Contract Renewal Date</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtContractRenewalDate" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtContractRenewalDate_CalendarExtender" runat="server"
                                    Enabled="True" TargetControlID="txtContractRenewalDate">
                                </cc1:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Termination Date</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtTerminationDate" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" TargetControlID="txtTerminationDate">
                                </cc1:CalendarExtender>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Joining Designation</b> <span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlJoiningDesignation" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Remarks on Termination</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtRemarkTermination" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Official Designation</b> <span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlOfficialDesignation" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Department</b> <span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Functional Designation</b>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlFunctionalDesignation" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Current Branch</b> <span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlULCBranch" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Current Supervisor</b>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlCurrentSupervisor" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="style1">
                            </td>
                            <td align="left" class="label">
                                <b>Leave Approver</b>
                            </td>
                            <td align="left" class="style2">
                                <asp:DropDownList ID="ddlLeaveApprover" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td align="left" class="style2">
                            </td>
                            <td align="left" class="label">
                                <b>Leave Recommender</b>
                            </td>
                            <td align="left" class="style2">
                                <asp:DropDownList ID="ddlleaveRecommender" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>JD No.</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlJDNo" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                                <%--<asp:TextBox ID="txtJDNo" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>--%>
                                &nbsp;<%--<asp:RequiredFieldValidator ID="reqFldJDNo" runat="server" ControlToValidate="txtJDNo"
                                    ErrorMessage="Required" ValidationGroup="InsertEmp" Display="None"></asp:RequiredFieldValidator>--%>
                                <%--<cc1:ValidatorCalloutExtender ID="reqFldJDNo_ValidatorCalloutExtender" runat="server"
                                    Enabled="True" TargetControlID="reqFldJDNo" CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png"
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>--%>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Status</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtStatus" runat="server" CssClass="InputTxtBox" Width="200px" Height="50px"
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Bank Name</b>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlBankName" runat="server" AutoPostBack="true" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Email</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldEmail" runat="server" ControlToValidate="txtEmail"
                                    ErrorMessage="Required" ValidationGroup="InsertEmp"></asp:RequiredFieldValidator>
                                 &nbsp;
                                <asp:RegularExpressionValidator ID="regFlEmail" runat="server" ControlToValidate="txtEmail"
                                    ErrorMessage="Rectify E-Mail" Font-Size="XX-Small" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Branch name</b>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlBranchName" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Entry Exam Score</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtEntryExamScore" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="yMskEdt" runat="server" AcceptNegative="Left" ErrorTooltipEnabled="True"
                                    InputDirection="RightToLeft" Mask="999.99" MaskType="Number" MessageValidatorTip="true"
                                    TargetControlID="txtEntryExamScore" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Bank Account No.</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtBankAccNo" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Permotional Exam Score</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtPromotionalExamScore" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MaskedEditExtender1" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="999.99" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtPromotionalExamScore" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>User Type</b> <span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlUserType" runat="server" CssClass="InputTxtBox" Width="200px">
                                    <asp:ListItem>-Select-</asp:ListItem>
                                    <asp:ListItem>Admin</asp:ListItem>
                                    <asp:ListItem>User</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Active</b>
                            </td>
                            <td align="left">
                                &nbsp;
                                <asp:CheckBox ID="chkActive" runat="server" CssClass="chkText" Text=" Is Active" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                            </td>
                            <td align="left">
                                <asp:Button ID="btnInsertEmpInfo" runat="server" CssClass="styled-button-1" Text="Insert"
                                    ValidationGroup="InsertEmp" />
                                &nbsp;<asp:Button ID="btnUpdateEmpInfo" runat="server" CssClass="styled-button-1"
                                    Text="Update" ValidationGroup="InsertEmp" />
                                &nbsp;<asp:Button ID="btnCancelSelection" runat="server" CssClass="styled-button-1"
                                    Text="Cancel" />
                                <%--&nbsp;<asp:Button ID="btnUpdateEmp" runat="server" CssClass="styled-button-1" Text="Update" />--%>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
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
                <asp:Panel ID="pnlEmpInfoList" runat="server" SkinID="pnlInner" Width="900px">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td align="left">
                                <div id="divgrd" onscroll="SetDivPosition()" style="height: 150px; width: 100%; overflow: auto">
                                    <asp:GridView ID="grdEmployeeName" runat="server" AutoGenerateColumns="False" ForeColor="#333333"
                                        GridLines="None" Width="750px">
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <Columns>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" CssClass="linkbtn" runat="server" CausesValidation="False"
                                                        CommandName="Select" Text="Select"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="EmployeeID" Visible="False">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtEmployeeID" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmployeeID" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Employee Name">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmployeeName" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Department Name">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("DeptName") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDeptName" runat="server" Text='<%# Bind("DeptName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Official Designation Name">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("OfficialDesignationName") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblOfficialDesignationName" runat="server" Text='<%# Bind("OfficialDesignationName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Joining Date">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("JoiningDate") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJoiningDate" runat="server" Text='<%# Bind("JoiningDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#999999" />
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    </asp:GridView>
                                </div>
                            </td>
                            <td>
                                &nbsp;
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
