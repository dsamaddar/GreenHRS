<%@ Page Language="VB" MasterPageFile="~/EmployeeInfo/EmployeeMasterPage.master"
    AutoEventWireup="false" CodeFile="EmployeeBasicInfo.aspx.vb" Inherits="EmployeeInfo_EmployeeBasicInfo"
    Title=".:HRM:Emp. Basic Info:." Theme="CommonSkin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
    <table style="width: 100%;">
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Label ID="lblMsg" runat="server" Width="950px" Height="25px" BackColor="Green"
                    ForeColor="Yellow" Text="Please save your information before exiting this page" CssClass="NotificationBar"></asp:Label>
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
                <asp:Label ID="lblRedirectMsg" runat="server" Width="950px" Height="25px" BackColor="Green"
                    ForeColor="Red" Text="" CssClass="blinkytext"></asp:Label>
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
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
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
                <asp:Panel ID="Panel2" runat="server" Width="950px" SkinID="pnlInner">
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
                                        <td align="left">
                                            &nbsp;
                                        </td>
                                        <td align="left">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            &nbsp;
                                        </td>
                                        <td align="left" class="label">
                                            <b>Father&#39;s Name</b><span class="RequiredLabel">*</span>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtFatherName" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                            &nbsp;<asp:RequiredFieldValidator ID="reqFldFatherName" runat="server" ControlToValidate="txtFatherName"
                                                ErrorMessage="*" ValidationGroup="SubmitCanDef"></asp:RequiredFieldValidator></td>
                                        <td align="left" class="label">
                                            &nbsp;
                                        </td>
                                        <td align="left" class="label">
                                            <b>Father&#39;s Occupation</b>&nbsp;
                                        </td>
                                        <td align="left">
                                            <asp:DropDownList ID="ddlFathersOccupation" runat="server" CssClass="InputTxtBox"
                                                Width="200px">
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
                                        <td align="left" class="label ">
                                            <b>Mother&#39;s Name </b><span class="RequiredLabel">*</span>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtMotherName" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                            &nbsp;<asp:RequiredFieldValidator ID="reqFldMotherName" runat="server" ControlToValidate="txtMotherName"
                                                ErrorMessage="*" ValidationGroup="SubmitCanDef"></asp:RequiredFieldValidator></td>
                                        <td align="left" class="label">
                                            &nbsp;
                                        </td>
                                        <td align="left" class="label">
                                            <b>Mother&#39;s Occupation</b>&nbsp;
                                        </td>
                                        <td align="left">
                                            <asp:DropDownList ID="ddlMotherOccupation" runat="server" CssClass="InputTxtBox"
                                                Width="200px">
                                            </asp:DropDownList>
                                            <%--<asp:TextBox ID="txtMotherOccupation" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMotherOccupation"
                                                ErrorMessage="*" ValidationGroup="SubmitCanDef"></asp:RequiredFieldValidator>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            &nbsp;
                                        </td>
                                        <td align="left">
                                            <b class="label">Relationship Status </b><span class="RequiredLabel">*</span>
                                        </td>
                                        <td align="left">
                                            <asp:DropDownList ID="ddlRelStatus" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                                Width="200px">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left" class="label">
                                            &nbsp;
                                        </td>
                                        <td align="left" class="label">
                                            <b>Gender</b><span class="RequiredLabel">*</span>
                                        </td>
                                        <td align="left" style="float: left">
                                            <asp:RadioButtonList ID="rdbtnGender" runat="server" class="label" CssClass="rbdText"
                                                RepeatDirection="Horizontal">
                                                <asp:ListItem>Male</asp:ListItem>
                                                <asp:ListItem>Female</asp:ListItem>
                                            </asp:RadioButtonList>
                                            <asp:RequiredFieldValidator ID="reqFldGender" runat="server" ControlToValidate="rdbtnGender"
                                                ErrorMessage="*" ValidationGroup="SubmitCanDef">
                                            </asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="label">
                                            &nbsp;
                                        </td>
                                        <td align="left" class="label">
                                            <b>Spouse Name </b>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtSpouseName" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                            &nbsp;
                                        </td>
                                        <td align="left" class="label">
                                            &nbsp;
                                        </td>
                                        <td id="idSpouseLabel" runat="server" align="left" class="label">
                                            <b class="label">Spouse Occupation</b>&nbsp;
                                        </td>
                                        <td id="idSpouseTextBox" runat="server" align="left">
                                            <asp:DropDownList ID="ddlSpouseOccupation" runat="server" CssClass="InputTxtBox"
                                                Width="200px">
                                            </asp:DropDownList>
                                            <%-- <asp:TextBox ID="txtSpouseOccupation" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="label">
                                            &nbsp;
                                        </td>
                                        <td align="left" class="label">
                                            <b>Religion</b>
                                        <span class="RequiredLabel">*</span></td>
                                        <td align="left">
                                            <asp:DropDownList ID="ddlReligion" runat="server" CssClass="InputTxtBox" Width="200px">
                                                <asp:ListItem>-Select-</asp:ListItem>
                                                <asp:ListItem Value="Muslim">Muslim</asp:ListItem>
                                                <asp:ListItem Value="Hindu">Hindu</asp:ListItem>
                                                <asp:ListItem Value="Buddhist">Buddhist</asp:ListItem>
                                                <asp:ListItem Value="Christian">Christian</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left" class="label">
                                            &nbsp;
                                        </td>
                                        <td align="left" class="label">
                                            <b>Blood Group</b>
                                        </td>
                                        <td align="left">
                                            <asp:DropDownList ID="ddlBloodGrp" runat="server" CssClass="InputTxtBox" Width="200px"
                                                DataSourceID="dsBloodGroup" DataTextField="BloodGroupName" DataValueField="BloodGroupID">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="label" style="height: 16px">
                                            &nbsp;
                                        </td>
                                        <td align="left" class="label" style="height: 16px">
                                            &nbsp;
                                        </td>
                                        <td align="left" style="height: 16px">
                                            &nbsp;
                                        </td>
                                        <td align="left" class="label" style="height: 16px">
                                            &nbsp;
                                        </td>
                                        <td align="left" class="label" style="height: 16px">
                                            &nbsp;
                                        </td>
                                        <td align="left" style="height: 16px">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="label">
                                        </td>
                                        <td align="left" class="label">
                                            &nbsp;
                                        </td>
                                        <td align="left">
                                            &nbsp;
                                        </td>
                                        <td align="left" class="label">
                                            &nbsp;
                                        </td>
                                        <td align="left" class="label">
                                            &nbsp;
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
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="top: auto">
                                            <asp:Image ID="imgValidation" runat="server" Width="148px" Height="175px" BorderStyle="Ridge"
                                                BorderWidth="2px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:FileUpload ID="flAttachment" runat="server" TabIndex="12" /><span class="RequiredLabel">*</span>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="Panel5" runat="server" Width="950px" SkinID="pnlInner">
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
                                <b>Nationality</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlNationality" runat="server" CssClass="InputTxtBox" Width="200px">
                                    <asp:ListItem>Bangladeshi</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldNationality" runat="server" ControlToValidate="ddlNationality"
                                    ErrorMessage="*" ValidationGroup="SubmitCanDef"></asp:RequiredFieldValidator></td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>NID </b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtNID" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
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
                                <b>No of Children and Age </b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtNoChildren" runat="server" CssClass="InputTxtBox" Height="33px"
                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>No of Sibblings Name And Occupation </b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtSibblingsInfo" runat="server" CssClass="InputTxtBox" Height="35px"
                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
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
                                <b>E-Mail</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail"
                                    ErrorMessage="*" ValidationGroup="Register"></asp:RequiredFieldValidator>&nbsp;<br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                                    ErrorMessage="Rectify E-Mail" Font-Size="XX-Small" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Alternate E-Mail</b>&nbsp;
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtAlEmail" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAlEmail"
                                    ErrorMessage="*" ValidationGroup="Register"></asp:RequiredFieldValidator>&nbsp;<br />
                                <asp:RegularExpressionValidator ID="reqFldAlEmail" runat="server" ControlToValidate="txtAlEmail"
                                    ErrorMessage="Rectify E-Mail" Font-Size="XX-Small" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
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
                                <b>Mobile Number</b>&nbsp;
                            <span class="RequiredLabel">*</span></td>
                            <td align="left">
                                <%--<asp:TextBox ID="txtMobileNumberPrefix" runat="server" CssClass="InputTxtBox" Enabled="False"
                                    EnableTheming="True" Width="30px">+88</asp:TextBox>--%>
                                <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldMobileNumber" runat="server" ControlToValidate="txtMobileNumber"
                                    ErrorMessage="*" ValidationGroup="SubmitCanDef"></asp:RequiredFieldValidator></td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
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
                            <td>
                                &nbsp;
                            </td>
                            <td>
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
                <asp:Panel ID="Panel3" runat="server" Width="950px" SkinID="pnlInner">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 395px">
                                <%-- <asp:Panel ID="pnlSubjectChoice" runat="server" Width="700px" SkinID="pnlInner">--%>
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
                                            <td align="left" class="label">
                                                Address
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtPreAdd" runat="server" Width="200px" CssClass="InputTxtBox" TextMode="MultiLine"
                                                    Height="45px" AutoPostBack="true"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                            </td>
                                            <td align="left" class="label">
                                                District
                                            </td>
                                            <td align="left">
                                                <asp:DropDownList ID="ddlPreDistrict" runat="server" CssClass="InputTxtBox" DataSourceID="dsPreDistrictName"
                                                    DataTextField="DistrictName" DataValueField="DistrictID" Width="200px" TabIndex="57"
                                                    AutoPostBack="true">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                            </td>
                                            <td align="left" class="label">
                                                Thana/ Upazila
                                            </td>
                                            <td align="left">
                                                <asp:DropDownList ID="ddlPreThana" runat="server" CssClass="InputTxtBox" DataSourceID="dsPreUpazillaName"
                                                    DataTextField="UpazilaName" DataValueField="UpazilaID" Width="200px" TabIndex="58" AutoPostBack="true">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td style="width: 550px">
                                <asp:Panel ID="pnlCanPermanentAddress" runat="server" SkinID="pnlInner" Width="550px">
                                    <table style="width: 100%;">
                                        <tr align="left">
                                            <td style="width: 20px">
                                            </td>
                                            <td style="width: 150px">
                                                <asp:CheckBox ID="chkSamePreAdd" runat="server" ForeColor="Green" Font-Size="14px"
                                                    Font-Bold="true" AutoPostBack="True" Text=" Same As Present" />
                                            </td>
                                            <td style="width: 230px">
                                                <b><u>Permanent Address</u></b>
                                            </td>
                                            <td align="left">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                            </td>
                                            <td align="left" class="label">
                                                Address
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtPerAddress" runat="server" Width="200px" CssClass="InputTxtBox"
                                                    TextMode="MultiLine" Height="45px"></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td align="left" class="label">
                                                District
                                            </td>
                                            <td align="left">
                                                <asp:DropDownList ID="ddlperDistrict" runat="server" CssClass="InputTxtBox" DataSourceID="dsPerDistrictName"
                                                    DataTextField="DistrictName" DataValueField="DistrictID" Width="200px" TabIndex="57"
                                                    AutoPostBack="true">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td align="left">
                                                Thana/ Upazila
                                            </td>
                                            <td style="width: 143px; height: 17px">
                                                <asp:DropDownList ID="ddlPerThana" runat="server" CssClass="InputTxtBox" DataSourceID="dsPerUpazilaName"
                                                    DataTextField="UpazilaName" DataValueField="UpazilaID" Width="200px" TabIndex="58">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
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
                <asp:Panel ID="Panel4" runat="server" Width="950px" SkinID="pnlInner">
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
                                <b>Signature</b>
                            </td>
                            <td align="left">
                                <asp:Image ID="imgSignature" runat="server" Width="200px" Height="50px" />
                                <br />
                                <asp:FileUpload ID="flSignature" runat="server" TabIndex="12" />
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <%-- <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left">
                                <asp:Button ID="btnNext" runat="server" CssClass="styled-button-1" Text="Save" ValidationGroup="SubmitCanDef" />
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
                        </tr>--%>
                    </table>
                </asp:Panel>
                &nbsp;
                <asp:Panel ID="Panel1" runat="server" Width="950px" SkinID="pnlInner" Visible="False">
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
                                &nbsp;
                            </td>
                            <td align="left" style="width: 150px">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td align="left" class="label ">
                                <b>Photo</b>
                            </td>
                            <td align="left">
                                <asp:HyperLink ID="hpAttachment" Target="_blank" runat="server">Attachment</asp:HyperLink>
                                &nbsp; &nbsp;
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
                            <td>
                                &nbsp;
                            </td>
                            <td align="left" class="label ">
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
                            <td>
                                &nbsp;
                            </td>
                            <td colspan="3">
                                <asp:SqlDataSource ID="dsPreUpazillaName" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="SELECT [UpazilaName], [UpazilaID] FROM [tblUpazila] WHERE ([DistrictID] = @DistrictID) ORDER BY [UpazilaName]">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlPreDistrict" Name="DistrictID" PropertyName="SelectedValue"
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="dsPreDistrictName" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="SELECT DISTINCT [DistrictName], [DistrictID] FROM [tblDistrict] ORDER BY [DistrictName]">
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="dsPerUpazilaName" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="SELECT [UpazilaName], [UpazilaID] FROM [tblUpazila] WHERE ([DistrictID] = @DistrictID) ORDER BY [UpazilaName]">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlperDistrict" Name="DistrictID" PropertyName="SelectedValue"
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="dsPerDistrictName" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="SELECT DISTINCT [DistrictName], [DistrictID] FROM [tblDistrict] ORDER BY [DistrictName]">
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="dsRelationStatus" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="SELECT DISTINCT [RelName], [RelationshipID] FROM [tblRelationShipStatus] where IsActive=1 ORDER BY [RelName]">
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="dsBloodGroup" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="SELECT DISTINCT [BloodGroupName], [BloodGroupID] FROM [tblBloodGroup] where IsActive=1 ORDER BY [BloodGroupName]">
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="dsOccupation" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="spGetOccupationList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td align="center">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
        </tr>
        <tr>
            <%--<asp:Panel runat="server" SkinID="pnlInner" ID="pnlDocument" Width="950px">
                    <table width="100%">
                        <tr>
                            
                            <td>--%>
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlUploadDocuments" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="center">
                            <td align="center" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="center" colspan="2">
                                <h2 class="lblheading">
                                    ::Upload Documents::</h2>
                            </td>
                        </tr>
                        <tr align="center">
                            <td class="label" align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                &nbsp; Document Type :
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpDocumentType" runat="server" CssClass="InputTxtBox" Width="190px">
                                </asp:DropDownList>
                                &nbsp;<asp:Button ID="btnNewDocumentType" runat="server" CssClass="styled-button-1"
                                    OnClientClick="return confirm('Are You Sure To Insert New Security Type ??')"
                                    Text="..." />
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
                        <tr align="center">
                            <td class="label" align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                &nbsp; Document Name :
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtDocumentName" runat="server" CssClass="InputTxtBox" Width="220px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFldDocumentName" runat="server" ControlToValidate="txtDocumentName"
                                    ErrorMessage="*" ValidationGroup="DocUpload">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr align="center">
                            <td class="label" align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                &nbsp; Select Document&nbsp;:
                            </td>
                            <td align="left">
                                <asp:FileUpload ID="flupDocuments" runat="server" />
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
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
                            <td align="center">
                                &nbsp;
                            </td>
                            <td align="center" colspan="2">
                                <div style="max-height: 200px; max-width: 690px; overflow: auto; float">
                                    <asp:GridView ID="grdDocumentList" runat="server" AutoGenerateColumns="false" EmptyDataText="No Document Found."
                                        SkinID="grdNoFooter">
                                        <Columns>
                                            <asp:TemplateField HeaderText="DocTypeID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDocTypeID" runat="server" CssClass="label" Text='<%#Eval("DocTypeID") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtDocTypeID" runat="server"></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DocTypeName">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDocTypeName" runat="server" CssClass="label" Text='<%#Eval("DocTypeName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtDocTypeName" runat="server"></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DocumentName">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDocumentName" runat="server" CssClass="label" Text='<%#Eval("DocumentName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtDocumentName" runat="server"></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="FileName">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFileName" runat="server" CssClass="label" Text='<%#Eval("FileName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtFileName" runat="server"></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="View" ShowHeader="true">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="hpDocument" CssClass="linkbtn" runat="server" NavigateUrl='<%#"~/Attachments/"+ Eval("FileName") %>'
                                                        Target="_blank">View</asp:HyperLink>
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
                        <%--<tr>
                            <td align="left" class="label" >
                                &nbsp;
                            </td>
                            <td align="center">
                                <asp:Button ID="btnNext" runat="server" CssClass="styled-button-1" Text="Save" ValidationGroup="SubmitCanDef" />
                            </td>
                            
                        </tr>--%>
                    </table>
                </asp:Panel>
            </td>
            <%-- </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>--%>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Panel ID="Panel6" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="center">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="center">
                                <asp:Button ID="btnNext" runat="server" CssClass="styled-button-1" Text="Save" ValidationGroup="SubmitCanDef" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
