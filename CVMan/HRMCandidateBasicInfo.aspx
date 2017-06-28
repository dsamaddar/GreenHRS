<%@ Page Language="VB" MasterPageFile="~/CVMan/HRMCVMaster.master" AutoEventWireup="false"
    CodeFile="HRMCandidateBasicInfo.aspx.vb" Inherits="HRMCandidateBasicInfo" Title=".:HRM:Can. Basic Info:."
    Theme="CommonSkin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
    <link href="../Sources/css/ValidatorStyle.css" rel="stylesheet" type="text/css" />

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
            <td align="center">
                <asp:Label ID="lblMsg" runat="server" Width="100%" BackColor="#195227" ForeColor="White"
                    Text="BASIC INFORMATION :: Please save before leaving this page" CssClass="NotificationBar"
                    Font-Names="Verdana" Font-Size="13pt" Font-Bold="False"></asp:Label>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Label ID="lblRedirectMsg" runat="server" Width="100%" Height="25px" BackColor="#195227"
                    ForeColor="Red" CssClass="blinkytext" Font-Names="Verdana"></asp:Label>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr align="center">
            <td style="color: Red; font-weight: bold;" align="left">
                [* Mandatory Data Field]
            </td>
        </tr>
        <tr align="center">
            <td>
                <%--<asp:Panel ID="pnlBasicInfo" runat="server" Width="1000px" SkinID="pnlInner">--%>
                <asp:Panel ID="pnlCanBasicInfo" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td style="vertical-align: top; width: 800px">
                                <table width="100%">
                                    <tr>
                                        <td align="left" class="label" style="width: 20px">
                                        </td>
                                        <td align="left" class="label" style="width: 150px">
                                        </td>
                                        <td align="left" style="width: 230px">
                                        </td>
                                        <td align="left" style="width: 20px">
                                        </td>
                                        <td align="left" style="width: 150px">
                                        </td>
                                        <td align="left" style="width: 210px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="label">
                                            &nbsp;
                                        </td>
                                        <td align="left" class="label">
                                            <b>Name</b>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtName" runat="server" CssClass="InputTxtBox" ReadOnly="true" Width="200px"></asp:TextBox>
                                        </td>
                                        <td align="left">
                                            &nbsp;
                                        </td>
                                        <td align="left" class="label">
                                            Email
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="InputTxtBox" ReadOnly="true"
                                                Width="200px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            &nbsp;
                                        </td>
                                        <td align="left" class="label ">
                                            Date of Birth
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtDOB" runat="server" AutoCompleteType="Disabled" CssClass="InputTxtBox"
                                                ReadOnly="true" Width="200px"></asp:TextBox>
                                        </td>
                                        <td align="left" class="label">
                                            &nbsp;
                                        </td>
                                        <td align="left" class="label">
                                            <b>Nationality</b><span class="RequiredLabel">*</span>
                                        </td>
                                        <td align="left">
                                            <asp:DropDownList ID="ddlNationality" runat="server" CssClass="InputTxtBox" TabIndex="11"
                                                Width="200px">
                                                <asp:ListItem>Bangladeshi</asp:ListItem>
                                            </asp:DropDownList>
                                            &nbsp;<asp:RequiredFieldValidator ID="reqFldNationality" runat="server" ControlToValidate="ddlNationality"
                                                ErrorMessage="Nationality Required" ValidationGroup="SubmitCanDef" Display="None"></asp:RequiredFieldValidator>
                                            <cc1:ValidatorCalloutExtender ID="reqFldNationality_ValidatorCalloutExtender" runat="server"
                                                Enabled="True" TargetControlID="reqFldNationality" CloseImageUrl="~/Sources/images/valClose.png"
                                                CssClass="customCalloutStyle" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                            </cc1:ValidatorCalloutExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            &nbsp;
                                        </td>
                                        <td align="left" class="label ">
                                            <b>Gender</b><span class="RequiredLabel">*</span>
                                        </td>
                                        <td align="left">
                                            <asp:RadioButtonList ID="rdbtnGender" runat="server" class="label" CssClass="rbdText"
                                                RepeatDirection="Horizontal" TabIndex="1">
                                                <asp:ListItem>Male</asp:ListItem>
                                                <asp:ListItem>Female</asp:ListItem>
                                                <asp:ListItem>Others</asp:ListItem>
                                            </asp:RadioButtonList>
                                            <asp:RequiredFieldValidator ID="reqFldGender" runat="server" ControlToValidate="rdbtnGender"
                                                Display="None" ErrorMessage="Gender Required" ValidationGroup="SubmitCanDef">
                                            </asp:RequiredFieldValidator>
                                            <cc1:ValidatorCalloutExtender ID="reqFldGender_ValidatorCalloutExtender" runat="server"
                                                CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                                TargetControlID="reqFldGender" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                            </cc1:ValidatorCalloutExtender>
                                        </td>
                                        <td align="left" class="label">
                                            &nbsp;
                                        </td>
                                        <td align="left" class="label">
                                            <b class="label">Relationship Status</b><span class="RequiredLabel">*</span>
                                        </td>
                                        <td align="left">
                                            <asp:DropDownList ID="ddlRelStatus" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                                TabIndex="2" Width="200px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            &nbsp;
                                        </td>
                                        <td align="left" class="label ">
                                            <b>Religion</b><span class="RequiredLabel">*</span>
                                        </td>
                                        <td align="left">
                                            <asp:DropDownList ID="ddlReligion" runat="server" CssClass="InputTxtBox" Width="200px"
                                                TabIndex="3">
                                                <asp:ListItem>-Select-</asp:ListItem>
                                                <asp:ListItem Value="Muslim">Muslim</asp:ListItem>
                                                <asp:ListItem Value="Hindu">Hindu</asp:ListItem>
                                                <asp:ListItem Value="Buddhist">Buddhist</asp:ListItem>
                                                <asp:ListItem Value="Christian">Christian</asp:ListItem>
                                                <asp:ListItem Value="Others">Others</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left" class="label">
                                            &nbsp;
                                        </td>
                                        <td align="left" class="label">
                                            <b>Blood Group</b>
                                        </td>
                                        <td align="left">
                                            <asp:DropDownList ID="ddlBloodGrp" runat="server" CssClass="InputTxtBox" DataSourceID="dsBloodGroup"
                                                DataTextField="BloodGroupName" DataValueField="BloodGroupID" Width="200px" TabIndex="4">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            &nbsp;
                                        </td>
                                        <td align="left">
                                            <b class="label">Father&#39;s Name</b><span class="RequiredLabel">*</span>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtFatherName" runat="server" CssClass="InputTxtBox" Width="200px"
                                                TabIndex="5"></asp:TextBox>
                                            &nbsp;<asp:RequiredFieldValidator ID="reqFldFatherName" runat="server" ControlToValidate="txtFatherName"
                                                ErrorMessage="Father's Name Required" ValidationGroup="SubmitCanDef" Display="None"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                                    ID="reqFldFatherName_ValidatorCalloutExtender" runat="server" Enabled="True"
                                                    TargetControlID="reqFldFatherName" CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png"
                                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                </cc1:ValidatorCalloutExtender>
                                        </td>
                                        <td align="left" class="label">
                                            &nbsp;
                                        </td>
                                        <td align="left" class="label">
                                            <b class="label">Father&#39;s Occupation</b>
                                        </td>
                                        <td align="left">
                                            <asp:DropDownList ID="ddlFathersOccupation" runat="server" CssClass="InputTxtBox"
                                                Width="200px" TabIndex="6">
                                            </asp:DropDownList>
                                            <%--<asp:TextBox ID="txtFarherOccupation" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFarherOccupation"
                                                ErrorMessage="*" ValidationGroup="SubmitCanDef"></asp:RequiredFieldValidator>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            &nbsp;
                                        </td>
                                        <td align="left">
                                            <b class="label">Mother&#39;s Name</b><span class="RequiredLabel">*</span>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtMotherName" runat="server" CssClass="InputTxtBox" Width="200px"
                                                TabIndex="7"></asp:TextBox>
                                            &nbsp;<asp:RequiredFieldValidator ID="reqFldMotherName" runat="server" ControlToValidate="txtMotherName"
                                                ErrorMessage="Mother's Name Required" ValidationGroup="SubmitCanDef" Display="None"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                                    ID="reqFldMotherName_ValidatorCalloutExtender" runat="server" Enabled="True"
                                                    TargetControlID="reqFldMotherName" CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png"
                                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                </cc1:ValidatorCalloutExtender>
                                        </td>
                                        <td align="left" class="label">
                                            &nbsp;
                                        </td>
                                        <td align="left" class="label">
                                            <b class="label">Mother&#39;s Occupation</b>
                                        </td>
                                        <td align="left">
                                            <asp:DropDownList ID="ddlMotherOccupation" runat="server" CssClass="InputTxtBox"
                                                Width="200px" TabIndex="8">
                                            </asp:DropDownList>
                                            <%--<asp:TextBox ID="txtMotherOccupation" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMotherOccupation"
                                                ErrorMessage="*" ValidationGroup="SubmitCanDef"></asp:RequiredFieldValidator>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="label">
                                            &nbsp;
                                        </td>
                                        <td align="left" class="label">
                                            <b>Spouse Name</b>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtSpouseName" runat="server" CssClass="InputTxtBox" Width="200px"
                                                TabIndex="9"></asp:TextBox>
                                            &nbsp;
                                        </td>
                                        <td runat="server" align="left" class="label">
                                            &nbsp;
                                        </td>
                                        <td runat="server" align="left" class="label">
                                            <b class="label">Spouse Occupation</b>
                                        </td>
                                        <td id="idSpouseTextBox" runat="server" align="left">
                                            <asp:DropDownList ID="ddlSpouseOccupation" runat="server" CssClass="InputTxtBox"
                                                Width="200px" TabIndex="10">
                                            </asp:DropDownList>
                                            <%-- <asp:TextBox ID="txtSpouseOccupation" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>--%>
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
                                        <td align="left" class="label">
                                        </td>
                                        <td align="left" class="label">
                                        </td>
                                        <td align="left">
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="left" valign="top" style="width: 150px">
                                <table style="width: 100%">
                                    <tr align="left">
                                        <td align="left" style="top: auto">
                                            <asp:Image ID="imgValidation" runat="server" Width="148px" Height="175px" BorderStyle="Ridge"
                                                BorderWidth="2px" />
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                            <asp:FileUpload ID="flAttachment" runat="server" TabIndex="12" /><span class="RequiredLabel">*</span>
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
                </asp:Panel>
                <asp:Panel ID="pnlCanNationality" runat="server" Width="100%" SkinID="pnlInner">
                    <table width="100%">
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                            </td>
                            <td align="left" class="label" style="width: 150px">
                            </td>
                            <td align="left" style="width: 230px">
                            </td>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label" style="width: 150px">
                                &nbsp;
                            </td>
                            <td align="left" style="width: 230px">
                                &nbsp;
                            </td>
                            <td align="left" style="width: 150px">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Passport No
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtPassportNo" runat="server" CssClass="InputTxtBox" TabIndex="13"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>NID</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtNID" runat="server" CssClass="InputTxtBox" Width="200px" TabIndex="12"
                                    MaxLength="30" Enabled="False"></asp:TextBox>
                                &nbsp;
                                <asp:RegularExpressionValidator ID="regExpNationalID" runat="server" ControlToValidate="txtNID"
                                    ErrorMessage="Numeric" ValidationExpression="^([0-9]*)$" ValidationGroup="SubmitCanDef"
                                    Display="None"></asp:RegularExpressionValidator>
                                <cc1:ValidatorCalloutExtender ID="regExpNationalID_ValidatorCalloutExtender" runat="server"
                                    Enabled="True" TargetControlID="regExpNationalID" CloseImageUrl="~/Sources/images/valClose.png"
                                    CssClass="customCalloutStyle" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
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
                                &nbsp;<b>No of Sibblings Name And Occupation</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtSibblingsInfo" runat="server" CssClass="InputTxtBox" Height="35px"
                                    TextMode="MultiLine" Width="200px" TabIndex="15"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ReqFldSibblingsInfo" runat="server" ControlToValidate="txtSibblingsInfo"
                                    ErrorMessage="Sibblings Information Required" ValidationGroup="SubmitCanDef"
                                    Display="None"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="ReqFldSibblingsInfo_ValidatorCalloutExtender" runat="server"
                                    Enabled="True" TargetControlID="ReqFldSibblingsInfo" CssClass="customCalloutStyle"
                                    CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>No of Children and Age</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtNoChildren" runat="server" CssClass="InputTxtBox" Height="33px"
                                    TextMode="MultiLine" Width="200px" TabIndex="14"></asp:TextBox>
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
                            </td>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                            </td>
                            <td align="left">
                            </td>
                            <td align="left">
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="pnlCanAddressInfo" runat="server" Width="100%" SkinID="pnlInner">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <table style="width: 100%">
                                <tr>
                                    <td style="width: 395px">
                                        <asp:Panel ID="pnlCanPresentAddress" runat="server" SkinID="pnlInner" Width="395px">
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td align="left" style="width: 20px">
                                                    </td>
                                                    <td align="left" style="width: 150px">
                                                        <b><u>Present Address</u></b>
                                                    </td>
                                                    <td align="left" style="width: 230px">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                    </td>
                                                    <td align="left" class="label ">
                                                        <b>Address</b><span class="RequiredLabel">*</span>
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtPreAdd" runat="server" CssClass="InputTxtBox" Height="45px" TextMode="MultiLine"
                                                            Width="200px" AutoPostBack="True" TabIndex="16"></asp:TextBox>
                                                        &nbsp;<asp:RequiredFieldValidator ID="ReqFldPreAdd" runat="server" ControlToValidate="txtPreAdd"
                                                            ErrorMessage="Present Address Required" ValidationGroup="SubmitCanDef" Display="None"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                                                ID="ReqFldPreAdd_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="ReqFldPreAdd"
                                                                CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                            </cc1:ValidatorCalloutExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                    </td>
                                                    <td align="left" class="label ">
                                                        <b>District</b><span class="RequiredLabel">*</span>
                                                    </td>
                                                    <td align="left">
                                                        <asp:DropDownList ID="ddlPreDistrict" runat="server" CssClass="InputTxtBox" DataSourceID="dsPreDistrictName"
                                                            DataTextField="DistrictName" DataValueField="DistrictID" Width="200px" TabIndex="17"
                                                            AutoPostBack="true">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                    </td>
                                                    <td align="left" class="label ">
                                                        <b>Thana/ Upazila</b><span class="RequiredLabel">*</span>
                                                    </td>
                                                    <td align="left">
                                                        <asp:DropDownList ID="ddlPreThana" runat="server" CssClass="InputTxtBox" DataSourceID="dsPreUpazillaName"
                                                            DataTextField="UpazilaName" DataValueField="UpazilaID" Width="200px" TabIndex="18"
                                                            AutoPostBack="True">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                    </td>
                                                    <td align="left">
                                                    </td>
                                                    <td align="left">
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                    <td style="width: 550px">
                                        <asp:Panel ID="pnlCanPermanentAddress" runat="server" SkinID="pnlInner" Width="550px">
                                            <table style="width: 100%;">
                                                <tr align="left">
                                                    <td style="width: 20px">
                                                    </td>
                                                    <td style="width: 150px">
                                                        <asp:CheckBox ID="chkSamePreAdd" runat="server" ForeColor="Green" Font-Size="14px"
                                                            Font-Bold="true" AutoPostBack="True" Text=" Same As Present" TabIndex="19" />
                                                    </td>
                                                    <td style="width: 230px">
                                                        Permanent Address
                                                    </td>
                                                    <td align="left">
                                                    </td>
                                                </tr>
                                                <tr align="left">
                                                    <td>
                                                    </td>
                                                    <td class="label">
                                                        Address<span class="RequiredLabel">*</span>
                                                    </td>
                                                    <td align="left" colspan="2">
                                                        <asp:TextBox ID="txtPerAddress" runat="server" CssClass="InputTxtBox" Height="45px"
                                                            TextMode="MultiLine" Width="200px" AutoPostBack="true" TabIndex="20"></asp:TextBox>
                                                        &nbsp;<asp:RequiredFieldValidator ID="ReqFldPerAddress" runat="server" ControlToValidate="txtPerAddress"
                                                            ErrorMessage="Permanent Address Required" ValidationGroup="SubmitCanDef" Display="None"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                                                ID="ReqFldPerAddress_ValidatorCalloutExtender" runat="server" Enabled="True"
                                                                TargetControlID="ReqFldPerAddress" CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png"
                                                                WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                                            </cc1:ValidatorCalloutExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td align="left" class="label ">
                                                        <b>District</b><span class="RequiredLabel">*</span>
                                                    </td>
                                                    <td align="left">
                                                        <asp:DropDownList ID="ddlperDistrict" runat="server" CssClass="InputTxtBox" DataSourceID="dsPerDistrictName"
                                                            DataTextField="DistrictName" DataValueField="DistrictID" Width="200px" TabIndex="21"
                                                            AutoPostBack="true">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td align="left" class="label ">
                                                        <b>Thana/ Upazila</b><span class="RequiredLabel">*</span>
                                                    </td>
                                                    <td align="left">
                                                        <asp:DropDownList ID="ddlPerThana" runat="server" CssClass="InputTxtBox" DataSourceID="dsPerUpazilaName"
                                                            DataTextField="UpazilaName" DataValueField="UpazilaID" Width="200px" TabIndex="22">
                                                        </asp:DropDownList>
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
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>
                <asp:Panel ID="pnlAdditionalInfo" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                            </td>
                            <td align="left" class="label" style="width: 150px">
                            </td>
                            <td align="left" style="width: 230px">
                            </td>
                            <td align="left" class="label" style="width: 20px">
                            </td>
                            <td align="left" class="label" style="width: 150px">
                            </td>
                            <td align="left" style="width: 230px">
                            </td>
                            <td align="left" style="width: 150px">
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td class="label">
                                Home Phone No
                            </td>
                            <td>
                                <asp:TextBox ID="txtHomePhoneNo" runat="server" CssClass="InputTxtBox" Width="200px"
                                    TabIndex="23"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td align="left" class="label">
                                Mobile Number<span class="RequiredLabel">*</span>
                            </td>
                            <td align="left" colspan="2">
                                <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="InputTxtBox" Width="200px"
                                    TabIndex="24"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldMobileNumber" runat="server" ControlToValidate="txtMobileNumber"
                                    ErrorMessage="Mobile Number Reqiured" ValidationGroup="SubmitCanDef" Display="None"></asp:RequiredFieldValidator><cc1:ValidatorCalloutExtender
                                        ID="reqFldMobileNumber_ValidatorCalloutExtender" runat="server" Enabled="True"
                                        TargetControlID="reqFldMobileNumber" CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png"
                                        WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Office Phone No
                            </td>
                            <td>
                                <asp:TextBox ID="txtOfficePhoneNo" runat="server" Width="200px" CssClass="InputTxtBox"
                                    TabIndex="25"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Alternate E-Mail
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtAlEmail" runat="server" CssClass="InputTxtBox" Width="200px"
                                    TabIndex="26"></asp:TextBox>
                                &nbsp;
                                <asp:RegularExpressionValidator ID="reqFldAlEmail" runat="server" ControlToValidate="txtAlEmail"
                                    ErrorMessage="Rectify E-Mail" Font-Size="XX-Small" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    Display="None"></asp:RegularExpressionValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldAlEmail_ValidatorCalloutExtender" runat="server"
                                    Enabled="True" TargetControlID="reqFldAlEmail" CloseImageUrl="~/Sources/images/valClose.png"
                                    CssClass="customCalloutStyle" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                About Yourself / Achivement if any
                            </td>
                            <td>
                                <asp:TextBox ID="txtAboutYrself" runat="server" CssClass="InputTxtBox" Height="45px"
                                    TextMode="MultiLine" Width="200px" TabIndex="27"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Year of Experience
                            </td>
                            <td>
                                <asp:TextBox ID="txtyrOfExp" runat="server" CssClass="InputTxtBox" Width="50px" TabIndex="28"></asp:TextBox>
                                Years&nbsp;&nbsp;
                                <asp:TextBox ID="txtMonth" runat="server" CssClass="InputTxtBox" Width="50px" TabIndex="29"></asp:TextBox>Month
                                <cc1:MaskedEditExtender ID="yMskEdtPositiveMarkingPerQuestion" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="99" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtyrOfExp" />
                                <cc1:MaskedEditValidator ID="yMskEdtValPositiveMarkingPerQuestion" runat="server"
                                    ControlExtender="yMskEdtPositiveMarkingPerQuestion" ControlToValidate="txtyrOfExp"
                                    IsValidEmpty="false" MaximumValue="30" MinimumValue="0" EmptyValueMessage="Enter Some Numbers"
                                    MaximumValueMessage="Number must be less than 31" MinimumValueMessage="" EmptyValueBlurredText="*"
                                    ToolTip="0 to 30" ValidationGroup="">
                                &nbsp;&nbsp;&nbsp;
                                </cc1:MaskedEditValidator>
                                <cc1:MaskedEditExtender ID="MskEdtExpMonth" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="99" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtMonth" />
                                <cc1:MaskedEditValidator ID="MskEdtValExpMonth" runat="server" ControlExtender="MskEdtExpMonth"
                                    ControlToValidate="txtMonth" IsValidEmpty="false" MaximumValue="11" MinimumValue="0"
                                    EmptyValueMessage="0 To 11" MaximumValueMessage="Max 11" MinimumValueMessage=""
                                    EmptyValueBlurredText="*" ToolTip="0 to 11" ValidationGroup="">
                                &nbsp;&nbsp;&nbsp;
                                </cc1:MaskedEditValidator>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Looking For<span class="RequiredLabel">*</span>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlLookingFor" runat="server" CssClass="InputTxtBox" DataSourceID="dsJobType"
                                    DataTextField="JobType" DataValueField="JobTypeID" Width="200px" TabIndex="30">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Available For<span class="RequiredLabel">*</span>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlAvailableFor" runat="server" CssClass="InputTxtBox" DataSourceID="dsServiceType"
                                    DataTextField="ServiceType" DataValueField="ServiceTypeID" Width="200px" TabIndex="31">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Last Drawn Salary And Date
                            </td>
                            <td>
                                <asp:TextBox ID="txtPresentSalary" runat="server" CssClass="InputTxtBox" Width="80px"
                                    TabIndex="32"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MskEdtPresentSalary" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="999999.99" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtPresentSalary" />
                                &nbsp;
                                <asp:TextBox ID="dtDrawnDate" runat="server" CssClass="InputTxtBox" Width="90px"
                                    TabIndex="33"></asp:TextBox>
                                <cc1:CalendarExtender ID="dtDrawnDate_CalendarExtender" runat="server" Enabled="True"
                                    Format="dd-MMM-yy" TargetControlID="dtDrawnDate">
                                </cc1:CalendarExtender>
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
                            <td class="label">
                                Signature
                            </td>
                            <td colspan="2">
                                <asp:Image ID="imgSignature" runat="server" Height="50px" Width="200px" />
                                <br />
                                <asp:FileUpload ID="flSignature" runat="server" TabIndex="12" />
                            </td>
                            <td align="left" colspan="2">
                                <asp:UpdatePanel ID="udpnlSpecialized" runat="server">
                                    <ContentTemplate>
                                        <div id="divgrd" onscroll="SetDivPosition()" style="max-height: 200px; max-width: 350px;
                                            overflow: auto">
                                            <asp:GridView ID="grdSpecilized" runat="server" AutoGenerateColumns="False" EmptyDataText="No Data Available"
                                                CssClass="mGrid">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="SpecilizedID" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSpecilizedID" runat="server" CssClass="label" Text='<%#Eval("SpecilizedID") %>'></asp:Label>
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
                                                    <asp:BoundField DataField="SpecilizedName" HeaderText="Specilized Sector" SortExpression="SpecilizedName " />
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
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
                            <td>
                            </td>
                        </tr>
                        <tr visible="false" runat="server">
                            <td>
                            </td>
                            <td align="left" class="label">
                                Specilized In
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtSpecilizedIn" runat="server" CssClass="InputTxtBox" Height="45px"
                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
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
                        <tr align="left" visible="false" runat="server">
                            <td>
                            </td>
                            <td class="label">
                                Career Objective<span class="RequiredLabel">*</span>&nbsp;
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtCareerObjective" runat="server" CssClass="InputTxtBox" Height="45px"
                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCareerObjective"
                                    ErrorMessage="*" ValidationGroup="SubmitCanDef"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                            </td>
                            <td>
                                Preferred Job Location<span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlPreferredJobLocation" runat="server" CssClass="InputTxtBox"
                                    DataSourceID="dsCountry" DataTextField="DistrictName" DataValueField="DistrictID"
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr visible="false" runat="server">
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                &nbsp;<b>Employeer</b>
                            </td>
                            <td align="left">
                                &nbsp;
                                <asp:TextBox ID="txtEmployeer" runat="server" CssClass="InputTxtBox" Height="38px"
                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Expected Salary<span class="RequiredLabel">*</span>
                            </td>
                            <td align="left" style="float: left">
                                <asp:TextBox ID="txtExpectedSalary" runat="server" CssClass="InputTxtBox" Width="80px"></asp:TextBox>
                                <cc1:MaskedEditExtender ID="MskEdtExpectedSalary" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="999999.99" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtExpectedSalary" />
                                &nbsp;
                                <asp:RequiredFieldValidator ID="reqFldExpectedSalary" runat="server" ControlToValidate="txtExpectedSalary"
                                    ErrorMessage="*" ValidationGroup="SubmitExamDef">
                                </asp:RequiredFieldValidator>
                            </td>
                            <td align="left" style="float: left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr visible="false" runat="server">
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>English Language Proficiency</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:RadioButtonList ID="rblEnLagPro" runat="server" class="label" CssClass="rbdText"
                                    RepeatDirection="Horizontal" Width="196px">
                                    <asp:ListItem>Low</asp:ListItem>
                                    <asp:ListItem>Medium</asp:ListItem>
                                    <asp:ListItem>High</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="rblEnLagPro"
                                    ErrorMessage="*" ValidationGroup="SubmitCanDef">
                                </asp:RequiredFieldValidator>
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Computer Literacy</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left" style="float: left">
                                <asp:RadioButtonList ID="rblComputerLiteracy" runat="server" class="label" CssClass="rbdText"
                                    RepeatDirection="Horizontal">
                                    <asp:ListItem>Low</asp:ListItem>
                                    <asp:ListItem>Medium</asp:ListItem>
                                    <asp:ListItem>High</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="rblComputerLiteracy"
                                    ErrorMessage="*" ValidationGroup="SubmitCanDef">
                                </asp:RequiredFieldValidator>
                            </td>
                            <td align="left" style="float: left">
                                &nbsp;
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
                        </tr>
                    </table>
                </asp:Panel>
                &nbsp;
                <asp:Panel ID="Panel1" runat="server" Width="100%" SkinID="pnlInner" Visible="False">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left">
                                Photo
                            </td>
                            <td align="left">
                                <asp:HyperLink ID="hpAttachment" Target="_blank" runat="server">Attachment</asp:HyperLink>
                                &nbsp; &nbsp;
                                <asp:SqlDataSource ID="dsPerUpazilaName" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="SELECT [UpazilaName], [UpazilaID] FROM [tblUpazila] WHERE ([DistrictID] = @DistrictID) ORDER BY [UpazilaName]">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlperDistrict" Name="DistrictID" PropertyName="SelectedValue"
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td>
                                &nbsp;<asp:SqlDataSource ID="dsPreUpazillaName" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="SELECT [UpazilaName], [UpazilaID] FROM [tblUpazila] WHERE ([DistrictID] = @DistrictID) ORDER BY [UpazilaName]">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlPreDistrict" Name="DistrictID" PropertyName="SelectedValue"
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <b>Signature</b>
                            </td>
                            <td align="left">
                                <asp:HyperLink ID="hpSignature" Target="_blank" runat="server">Attachment</asp:HyperLink>
                                &nbsp; &nbsp;
                                <asp:SqlDataSource ID="dsCountry" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="SELECT [DistrictID], [DistrictName] FROM [tblDistrict] ORDER BY [DistrictName]">
                                </asp:SqlDataSource>
                            </td>
                            <td>
                                <asp:SqlDataSource ID="dsPreDistrictName" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="SELECT DISTINCT [DistrictName], [DistrictID] FROM [tblDistrict] ORDER BY [DistrictName]">
                                </asp:SqlDataSource>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:SqlDataSource ID="dsPerDistrictName" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="SELECT DISTINCT [DistrictName], [DistrictID] FROM [tblDistrict] ORDER BY [DistrictName]">
                                </asp:SqlDataSource>
                            </td>
                            <td align="center">
                                <asp:SqlDataSource ID="dsJobType" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="SELECT DISTINCT [JobType], [JobTypeID] FROM [tblJobType] where IsActive=1 ORDER BY [JobType]">
                                </asp:SqlDataSource>
                            </td>
                            <td>
                                <asp:SqlDataSource ID="dsServiceType" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="SELECT DISTINCT [ServiceType], [ServiceTypeID] FROM [tblServiceType] where IsActive=1 ORDER BY [ServiceType]">
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;<asp:SqlDataSource ID="dsRelationStatus" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="SELECT DISTINCT [RelName], [RelationshipID] FROM [tblRelationShipStatus] where IsActive=1 ORDER BY [RelName]">
                                </asp:SqlDataSource>
                            </td>
                            <td align="center">
                                &nbsp;<asp:SqlDataSource ID="dsBloodGroup" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="SELECT DISTINCT [BloodGroupName], [BloodGroupID] FROM [tblBloodGroup] where IsActive=1 ORDER BY [BloodGroupName]">
                                </asp:SqlDataSource>
                            </td>
                            <td>
                                &nbsp;<asp:SqlDataSource ID="dsOccupation" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="spGetOccupationList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlUploadDocuments" runat="server" SkinID="pnlInner" Width="100%">
                    <table style="width: 100%;">
                        <tr align="center">
                            <td style="width: 20px">
                            </td>
                            <td align="center" colspan="2">
                                <h2 class="lblheading">
                                    ::Upload Documents::</h2>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Document Type :
                            </td>
                            <td>
                                <asp:DropDownList ID="drpDocumentType" runat="server" CssClass="InputTxtBox" Width="190px">
                                </asp:DropDownList>
                                &nbsp;<asp:Button ID="btnNewDocumentType" runat="server" CssClass="styled-button-1"
                                    OnClientClick="return confirm('Are You Sure To Insert New Security Type ??')"
                                    Text="..." Enabled="false" />
                                &nbsp;<asp:Button ID="btnCancelInsertNewDocumentType" runat="server" CssClass="styled-button-1"
                                    Text="Cancel" />
                                &nbsp;
                                <asp:Label ID="lblNewDocumentType" runat="server" CssClass="label">
                                    <asp:TextBox ID="txtNewDocumentType" runat="server" CssClass="InputTxtBox" ValidationGroup="DocType"
                                        Width="180px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqFldDocumentType" runat="server" ControlToValidate="txtNewDocumentType"
                                        ErrorMessage="*" ValidationGroup="DocType"></asp:RequiredFieldValidator>
                                    <asp:CheckBox ID="chkDocumentTypeIsMandatory" runat="server" Text="Mandatory" />
                                </asp:Label>
                            </td>
                        </tr>
                        <tr id="Tr1" align="center" visible="false" runat="server">
                            <td>
                            </td>
                            <td align="left" class="label">
                                Document Name :
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtDocumentName" runat="server" CssClass="InputTxtBox" Width="220px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFldDocumentName" runat="server" ControlToValidate="txtDocumentName"
                                    ErrorMessage="*" ValidationGroup="DocUpload">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                            </td>
                            <td align="left" class="label">
                                Select Document:
                            </td>
                            <td align="left">
                                <asp:FileUpload ID="flupDocuments" runat="server" />
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td align="left">
                                <asp:Button ID="btnUploadDocument" runat="server" CssClass="styled-button-1" OnClientClick="if (!confirm('Are you Sure to Upload ?')) return false"
                                    Text="Insert Info." ValidationGroup="DocUpload" />
                                &nbsp;
                                <asp:Button ID="btnUploadDocumentRefresh" runat="server" CssClass="styled-button-1"
                                    Text="Refresh" />
                                &nbsp;<asp:HiddenField ID="hdFldChangeMadeToDocumentUploads" runat="server" />
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                            </td>
                            <td align="center" colspan="2">
                                <div style="max-height: 200px; max-width: 690px; overflow: auto; float">
                                    <asp:GridView ID="grdDocumentList" runat="server" AutoGenerateColumns="False" EmptyDataText="No Document Found."
                                        SkinID="grdNoFooter" CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="DocTypeID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDocTypeID" runat="server" CssClass="label" Text='<%#Eval("DocTypeID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DocTypeName">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDocTypeName" runat="server" CssClass="label" Text='<%#Eval("DocTypeName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="File" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFileName" runat="server" CssClass="label" Text='<%#Eval("FileName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Download">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkBtnDownloadFile" runat="server" CommandArgument='<%# Eval("FileName") %>'
                                                        CssClass="label" CommandName="Download" OnClick="grdDocumentList_SelectedIndexChanged"
                                                        Text='<%# Eval("FileName") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkbtnDelete" CssClass="linkbtn" runat="server" CausesValidation="False"
                                                        CommandName="Delete" Text="Delete" OnClientClick="if (!confirm('Are you Sure to Delete This Document?')) return false"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:GridView ID="grdRemainingDocuments" runat="server" SkinID="grdNoFooter">
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Panel2" runat="server" SkinID="pnlInner" Width="100%">
                    <table style="width: 100%;">
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
                            <td align="center">
                                <asp:Button ID="btnNext" runat="server" CssClass="styled-button-1" Text="Save" ValidationGroup="SubmitCanDef" />
                                &nbsp
                                <asp:Button ID="btnUpdate" runat="server" CssClass="styled-button-1" Text="Update"
                                    ValidationGroup="SubmitCanDef" />
                            </td>
                            <td align="center">
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
