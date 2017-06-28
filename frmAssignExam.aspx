<%@ Page Language="VB" Theme="CommonSkin"  MasterPageFile="~/HRMMaster.master" AutoEventWireup="false" CodeFile="frmAssignExam.aspx.vb" Inherits="frmAssignExam" title=".:HRM : Assign Exam:." %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
 </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <table style="width:100%;">
        <tr align="center" >
            <td>
                <asp:Panel ID="pnlAssignExam" runat="server" SkinID="pnlInner" Width="100%">
                    <table style="width:100%;">
                        <tr>
                            <td colspan="6" align="left" >
                                <div class="widgettitle">Assign Exam<asp:ScriptManager ID="ScriptManager1" 
                                        runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr align="left" >
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td style="width:20px"></td>
                            <td style="width:150px"></td>
                            <td></td>
                        </tr>
                        <tr align="left">
                            <td class="label" style="width:20px">
                                </td>
                            <td class="label">
                                Select Department</td>
                            <td>
                                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="InputTxtBox" 
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                </td>
                            <td class="label">
                                Select Designation</td>
                            <td>
                                <asp:DropDownList ID="drpSelectDesignation" runat="server" 
                                    CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label" style="width:20px">
                                </td>
                            <td class="label">
                                District</td>
                            <td align="left">
                                <asp:DropDownList ID="ddlPerDistrict" runat="server" AutoPostBack="True" 
                                    CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                                
                            </td>
                            <td>
                                </td>
                            <td class="label">
                                Select Branch
                            </td>
                            <td>
                                <asp:DropDownList ID="drpULCBranch" runat="server" CssClass="InputTxtBox" 
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td tyle="width:20px"></td>
                            <td class="label">
                                Gender</td>
                            <td align="left">
                                <asp:RadioButtonList ID="rdbtnGender" runat="server" class="label" 
                                    CssClass="rbdText" RepeatDirection="Horizontal" TabIndex="9">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                    <asp:ListItem>Others</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td></td>
                            <td class="label">
                                Blood Group
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlBloodGrp" runat="server" CssClass="InputTxtBox" 
                                    TabIndex="11" Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td tyle="width:20px">
                                &nbsp;</td>
                            <td class="label">
                                &nbsp;</td>
                            <td align="left">
                                <asp:Button ID="btnSearch" runat="server" CssClass="styled-button-1" 
                                    Text="Search" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" 
                                    Text="Cancel" />
                            </td>
                            <td>
                                &nbsp;</td>
                            <td class="label">
                                &nbsp;</td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label" style="width:20px">
                            </td>
                            <td class="label">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
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
        <tr align="center" >
            <td>
                <asp:Panel ID="pnlAttendees" runat="server" SkinID="pnlInner" Width="100%">
                    <table style="width:100%;">
                        <tr align="left">
                            <td class="label">
                                Select Attendees</td>
                            <td>
                                <asp:CheckBox ID="chkSelectAllItems" runat="server" AutoPostBack="True" 
                                    CssClass="chkText" Text="Select All" Width="300px" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td colspan="2">
                                <div style="max-height:200;max-width:100%;overflow:auto">
                                    <br />
                                    <asp:CheckBoxList ID="chkListAttendees" runat="server" CssClass="chkText" 
                                        RepeatColumns="5">
                                    </asp:CheckBoxList>
                                </div>
                            </td>
                            <td class="style2">
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr  align="center" >
            <td>
                <asp:Panel ID="pnlGenerateExam" runat="server" Width="100%" SkinID="pnlInner" >
                    <table style="width:100%;">
                        <tr align="left" >
                            <td style="width:20px">&nbsp;</td>
                            <td class="label">
                                Available Exams</td>
                            <td>
                                <asp:DropDownList ID="drpAvailableExams" runat="server" AutoPostBack="True" 
                                    CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td style="width:20px">
                                &nbsp;</td>
                            <td class="label">
                                Effective Date</td>
                            <td>
                                <asp:TextBox ID="txtExAssOtrExamsEffectiveDate" runat="server" 
                                    CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtExAssOtrExamsEffectiveDate_CalendarExtender" 
                                    runat="server" Enabled="True" TargetControlID="txtExAssOtrExamsEffectiveDate">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldECOEExEffectiveDate" runat="server" 
                                    ControlToValidate="txtExAssOtrExamsEffectiveDate" ErrorMessage="*" 
                                    ValidationGroup="EMPGenerateExam"></asp:RequiredFieldValidator>
                                &nbsp;<asp:DropDownList ID="drpECOEHour" runat="server" CssClass="InputTxtBox" 
                                    Width="40px">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>11</asp:ListItem>
                                    <asp:ListItem>12</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;<asp:DropDownList ID="drpECOEMin" runat="server" CssClass="InputTxtBox" 
                                    Width="50px">
                                    <asp:ListItem>00</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;<asp:DropDownList ID="drpECOEAMPM" runat="server" CssClass="InputTxtBox" 
                                    Width="50px">
                                    <asp:ListItem>AM</asp:ListItem>
                                    <asp:ListItem>PM</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td style="width:20px">
                            </td>
                            <td class="label">
                                Select Branch</td>
                            <td>
                                <asp:DropDownList ID="drpULCBranchToExam" runat="server" CssClass="InputTxtBox" 
                                    Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width:20px">
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="btnCheckAll" runat="server" CssClass="styled-button-1" 
                                    Text="Check All" ValidationGroup="EMPGenerateExam" />
                                &nbsp;<asp:Button ID="btnGenerateExam" runat="server" CssClass="styled-button-1" 
                                    Text="Generate" />
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr  align="center" >
            <td>
                <asp:Panel ID="pnlEntryPointWiseExams" runat="server" Width="100%"  
                    SkinID="pnlInner" >
                    <table style="width:100%;">
                        <tr align="left">
                            <td style="width:20px"></td>
                            <td class="label">&nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td></td>
                        </tr>
                        <tr align="left">
                            <td class="label"></td>
                            <td class="label">
                                Select Entry Point</td>
                            <td align="left">
                                <asp:DropDownList ID="drpEntryPoint" runat="server" CssClass="InputTxtBox" 
                                    Width="200px" AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                            <td>
                                </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <div style="max-height:300px;max-width:100%;overflow:auto">
                                    <asp:GridView ID="grdEntryPointWiseAttendees" runat="server" CssClass="mGrid">
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>

