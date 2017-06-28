<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmEmpAssignTraining.aspx.vb" Inherits="Administration_frmEmpAssignTraining"
    Title=".:HRS:Assign Training Info:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlSelectEmployees" runat="server" Width="90%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="4">
                                <div class="widget-title">
                                    Employees To Assign Training<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Select Employees And Add
                            </td>
                            <td>
                                <asp:DropDownList ID="drpEmployeeList" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                                <br />
                                <asp:Button ID="btnAdd" runat="server" CssClass="styled-button-1" Text="Add" />
                            </td>
                            <td>
                                <div style="max-height: 200px; max-width: 300px; overflow: auto">
                                    <asp:GridView ID="grdTrainee" runat="server" AutoGenerateColumns="False" CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="EmployeeID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmployeeID" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Employee">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmployee" runat="server" Text='<%# Bind("Employee") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgbtnDelete" ImageUrl="~/Sources/icons/erase.png" OnClientClick="if (!confirm('Are you Sure to Delete The Requisition ?')) return false"
                                                        CommandName="Delete" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
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
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlAssignTraining" runat="server" Width="90%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="6" align="left">
                                <div class="widgettitle">
                                    Assign Training</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 250px">
                                &nbsp;
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
                                Training Type
                            </td>
                            <td>
                                <asp:DropDownList ID="drpAvailableTrainingType" runat="server" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldTrainingName" runat="server" ControlToValidate="txtTrainingDetails"
                                    Display="None" ErrorMessage="Required: Training Title" 
                                    ValidationGroup="AssignTraining"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldTrainingName_ValidatorCalloutExtender0" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" TargetControlID="reqFldTrainingName"
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldTrngEndOn" runat="server" ControlToValidate="txtTrngEndsOn"
                                    Display="None" ErrorMessage="End Date Required" ValidationGroup="AssignTraining"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldTrngEndOn_ValidatorCalloutExtender0" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" TargetControlID="reqFldTrngEndOn"
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Training Title</td>
                            <td>
                                <asp:TextBox ID="txtTrainingDetails" runat="server" class="validate[required,custom[integer],min[0]]"
                                    CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Country
                            </td>
                            <td>
                                <asp:DropDownList ID="drpCountry" runat="server" AutoPostBack="true" CssClass="InputTxtBox"
                                    Width="200px">
                                    <asp:ListItem>-Select-</asp:ListItem>
                                    <asp:ListItem>Bangladesh</asp:ListItem>
                                    <asp:ListItem>India</asp:ListItem>
                                    <asp:ListItem>Srilanka</asp:ListItem>
                                    <asp:ListItem>Maldives</asp:ListItem>
                                    <asp:ListItem>Thailand</asp:ListItem>
                                    <asp:ListItem>Mayanmar</asp:ListItem>
                                    <asp:ListItem>Malaysia</asp:ListItem>
                                    <asp:ListItem>Indonesia</asp:ListItem>
                                    <asp:ListItem>Philipine</asp:ListItem>
                                    <asp:ListItem>Singapore</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Training On
                            </td>
                            <td>
                                <asp:DropDownList ID="drpAvailableTrngSubject" runat="server" CssClass="InputTxtBox"
                                    Width="200px" AutoPostBack="true">
                                </asp:DropDownList>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Organized By
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlOrganizedBy" runat="server" CssClass="InputTxtBox" Width="200px"
                                    AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Training Topic
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlTrainingTopic" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Org. Branch
                            </td>
                            <td>
                                <asp:DropDownList ID="drpOrgBranchList" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Starts On
                            </td>
                            <td>
                                <asp:TextBox ID="txtTrngStartsOn" runat="server" CssClass="InputTxtBox" Width="80px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtTrngStartsOn_CalendarExtender0" runat="server" Enabled="True"
                                    TargetControlID="txtTrngStartsOn">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:DropDownList ID="drpSHour" runat="server" CssClass="InputTxtBox" Width="40px">
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
                                <asp:DropDownList ID="drpSMin" runat="server" CssClass="InputTxtBox" Width="50px">
                                    <asp:ListItem>00</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList ID="drpSAMPM" runat="server" CssClass="InputTxtBox" Width="50px">
                                    <asp:ListItem>AM</asp:ListItem>
                                    <asp:ListItem>PM</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Ends On
                            </td>
                            <td>
                                <asp:TextBox ID="txtTrngEndsOn" runat="server" CssClass="InputTxtBox" Width="80px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtTrngEndsOn_CalendarExtender0" runat="server" Enabled="True"
                                    TargetControlID="txtTrngEndsOn">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:DropDownList ID="drpEHour" runat="server" CssClass="InputTxtBox" Width="40px">
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
                                <asp:DropDownList ID="drpEMin" runat="server" CssClass="InputTxtBox" Width="50px">
                                    <asp:ListItem>00</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList ID="drpEAMPM" runat="server" CssClass="InputTxtBox" Width="50px">
                                    <asp:ListItem>AM</asp:ListItem>
                                    <asp:ListItem>PM</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Course Duration (Hours)
                            </td>
                            <td>
                                <asp:TextBox ID="txtTrainingDuration" runat="server" CssClass="InputTxtBox" Width="120px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldTrngCourseDuration" runat="server" 
                                    ControlToValidate="txtTrainingDuration" Display="None" 
                                    ErrorMessage="Required: Course Duration" ValidationGroup="AssignTraining"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldTrngCourseDuration_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" TargetControlID="reqFldTrngCourseDuration" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Training Course Outline
                            </td>
                            <td>
                                <asp:TextBox ID="txtTrngCourseOutline" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                                Resource Person&#39;s Details
                            </td>
                            <td>
                                <asp:TextBox ID="txtResourcePersonDetails" runat="server" CssClass="InputTxtBox"
                                    Height="50px" TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldTrngCourseOutline" runat="server" ControlToValidate="txtTrngCourseOutline"
                                    Display="None" ErrorMessage="Course Outline Required" ValidationGroup="AssignTraining"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldTrngCourseOutline_ValidatorCalloutExtender0"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    TargetControlID="reqFldTrngCourseOutline" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldTrngStartsOn" runat="server" ControlToValidate="txtTrngStartsOn"
                                    Display="None" ErrorMessage="Start Date Required" 
                                    ValidationGroup="AssignTraining"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldTrngStartsOn_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" TargetControlID="reqFldTrngStartsOn"
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldResourcePersonDetails" runat="server" ControlToValidate="txtResourcePersonDetails"
                                    Display="None" ErrorMessage=" Resource Person Details Required" ValidationGroup="AssignTraining"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldResourcePersonDetails_ValidatorCalloutExtender0"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    TargetControlID="reqFldResourcePersonDetails" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                                Attachment
                            </td>
                            <td>
                                <asp:FileUpload ID="flupTrngAttachment" runat="server" Width="250px" />
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldTrngEndsOn" runat="server" ControlToValidate="txtTrngEndsOn"
                                    Display="None" ErrorMessage="End Date Required" 
                                    ValidationGroup="AssignTraining"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldTrngEndsOn_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" TargetControlID="reqFldTrngEndsOn"
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
                                <asp:Button ID="btnAssignTrng" runat="server" CssClass="styled-button-1" Text="Assign Training"
                                    ValidationGroup="AssignTraining" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" Text="Cancel" />
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
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
