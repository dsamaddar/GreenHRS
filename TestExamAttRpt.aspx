<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false" CodeFile="TestExamAttRpt.aspx.vb" Inherits="TestExamAttRpt" title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Panel ID="pnlExamAttendeeReport" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="6">
                                <div class="widgettitle">
                                    Exam Attendee Report<asp:ScriptManager ID="ScriptManager1" runat="server">
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
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Start Date<span class="RequiredLabel">*</span>
                            </td>
                            <td class="label">
                                <asp:TextBox ID="txtStartDate" runat="server" CssClass="InputTxtBox" Width="100px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtStartDate_CalendarExtender0" runat="server" Enabled="True"
                                    TargetControlID="txtStartDate">
                                </cc1:CalendarExtender>
                                &nbsp;(MM/DD/YYYY)
                                <asp:CompareValidator ID="dateValidatorStartDate" runat="server" ControlToValidate="txtStartDate"
                                    ErrorMessage="Invalid Date" Operator="DataTypeCheck" Type="Date" ValidationGroup="ExamAttendee">
                                </asp:CompareValidator>
                                <asp:RequiredFieldValidator ID="reqFldStartDate" runat="server" ControlToValidate="txtStartDate"
                                    Display="None" ErrorMessage="Insurance No. Required" ValidationGroup="ExamAttendee"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldStartDate_ValidatorCalloutExtender0" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldStartDate" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                                End Date<span class="RequiredLabel">*</span>
                            </td>
                            <td class="label">
                                <asp:TextBox ID="txtEndDate" runat="server" CssClass="InputTxtBox" Width="100px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtEndDate_CalendarExtender0" runat="server" Enabled="True"
                                    TargetControlID="txtEndDate">
                                </cc1:CalendarExtender>
                                &nbsp;(MM/DD/YYYY)
                                <asp:CompareValidator ID="dateValidatorEndDate" runat="server" ControlToValidate="txtEndDate"
                                    ErrorMessage="Invalid Date" Operator="DataTypeCheck" Type="Date" ValidationGroup="ExamAttendee">
                                </asp:CompareValidator>
                                <asp:RequiredFieldValidator ID="reqFldEndDate" runat="server" ControlToValidate="txtEndDate"
                                    Display="None" ErrorMessage="Insurance No. Required" ValidationGroup="ExamAttendee"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldEndDate_ValidatorCalloutExtender0" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldEndDate" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnShowReport" runat="server" Text="Show Report" CssClass="styled-button-1"
                                    ValidationGroup="ExamAttendee" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                                <asp:ImageButton ID="imgBtnExportResult" runat="server" 
                                    ImageUrl="~/Sources/images/Excel.jpg" Width="30px" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:GridView ID="GridView1" runat="server">
                </asp:GridView>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

