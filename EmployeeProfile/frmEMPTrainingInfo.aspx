<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/EmployeeProfile/MasterEmpProfile.master"
    AutoEventWireup="false" CodeFile="frmEMPTrainingInfo.aspx.vb" Inherits="EmployeeProfile_frmEMPTrainingInfo"
    Title=".:EMP:Training Info:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
    <link href="../Sources/css/ValidatorStyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        function openWindow(windowURL, windowName, windowWidth, windowHeight) {

            var left = (screen.width / 2) - (windowWidth / 2);
            var top = (screen.height / 2) - (windowHeight / 2);

            window.name = 'parentWnd';
            newWindow = window.open(windowURL, windowName, 'top=' + top + ',left=' + left + ',width=' + windowWidth + ',height=' + windowHeight + ',toolbar=0,location=no,directories=0, status=0,menuBar=0,scrollBars=1,resizable=1');
            newWindow.focus();
        }
        window.onload = function() {
            var strCook = document.cookie;
            if (strCook.indexOf("!~") != 0) {
                var intS = strCook.indexOf("!~");
                var intE = strCook.indexOf("~!");
                var strPos = strCook.substring(intS + 2, intE);
                document.getElementById("divgrd").scrollTop = strPos;
            }
        }
    </script>

    <table style="width: 100%;">
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Panel ID="pnlAssignTraining" runat="server" Width="900px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="6" align="left">
                                <div class="widgettitle">
                                    Assign Training<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 250px">
                                <asp:Label ID="lblHolder" runat="server" Text="" Visible="false"></asp:Label>
                            </td>
                            <td style="width:20px">
                            </td>
                            <td style="width:150px">
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
                                <asp:RequiredFieldValidator ID="reqFldTrainingName" runat="server" 
                                    ControlToValidate="txtTrainingDetails" Display="None" 
                                    ErrorMessage="Required: Training Name" ValidationGroup="AssignTraining"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldTrainingName_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" TargetControlID="reqFldTrainingName" 
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
                                Training Name
                            </td>
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
                                <asp:DropDownList ID="drpCountry" runat="server" AutoPostBack="true" 
                                    CssClass="InputTxtBox" Width="200px">
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
                                <asp:DropDownList ID="ddlOrganizedBy" runat="server" CssClass="InputTxtBox" 
                                    Width="200px" AutoPostBack="True">
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
                                Org. Branch</td>
                            <td>
                                <asp:DropDownList ID="drpOrgBranchList" runat="server" CssClass="InputTxtBox" 
                                    Width="200px">
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
                                <cc1:CalendarExtender ID="txtTrngStartsOn_CalendarExtender" runat="server" Enabled="True"
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
                                <cc1:CalendarExtender ID="txtTrngEndsOn_CalendarExtender" runat="server" Enabled="True"
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
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldTrngStartsOn" runat="server" ControlToValidate="txtTrngStartsOn"
                                    Display="None" ErrorMessage="Start Date Required" ValidationGroup="AssignTraining"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldTrngStartsOn_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" TargetControlID="reqFldTrngStartsOn"
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldTrngEndOn" runat="server" ControlToValidate="txtTrngEndsOn"
                                    Display="None" ErrorMessage="End Date Required" ValidationGroup="AssignTraining"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldTrngEndOn_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" TargetControlID="reqFldTrngEndOn"
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
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
                                <cc1:ValidatorCalloutExtender ID="reqFldTrngCourseOutline_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    TargetControlID="reqFldTrngCourseOutline" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldResourcePersonDetails" runat="server" ControlToValidate="txtResourcePersonDetails"
                                    Display="None" ErrorMessage=" Resource Person Details Required" ValidationGroup="AssignTraining"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldResourcePersonDetails_ValidatorCalloutExtender"
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
                                &nbsp;</td>
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
                                &nbsp;</td>
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
                <asp:Panel ID="pnlAssignedTraining" runat="server" Width="900px" SkinID="pnlInner">
                    <table style="width: 100%">
                        <tr align="left">
                            <td align="left">
                                <div class="widgettitle">
                                    Assigned Training</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="max-height: 200px; max-width: 880px; overflow: auto">
                                    <asp:GridView ID="grdAssignedTraining" runat="server" SkinID="grdNoFooter" AutoGenerateColumns="False"
                                        EmptyDataText="No Data Available" CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                                        Text="Select"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="EmpTrngInfoID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEmpTrngInfoID" runat="server" Text='<%# Bind("EmpTrngInfoID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("TrainingType") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Training On">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("TrainingName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Subject" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("TrainingSubject") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Organizer">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("OrganizedBy") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Location" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Country" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Country") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="From">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStartsOn" runat="server" Text='<%# Bind("StartsOn") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="To">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEndsOn" runat="server" Text='<%# Bind("EndsOn") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Canceled">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIsCanceled" runat="server" Text='<%# Bind("IsCanceled") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Training Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIsTrngDone" runat="server" Text='<%# Bind("IsTrngDone") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="AcceptanceDate" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("AcceptanceDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="View">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkDetails" Width="100px" CssClass="linkbtn" runat="server" OnClientClick='<%#Eval("EmpTrngInfoID","openWindow(""../EmployeeProfile/TrainingDetailsView.aspx?EmpTrngInfoID={0}"",""Popup"",950,800);") %>'>Details</asp:LinkButton>
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
            </td>
        </tr>
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlTrngFeedBack" runat="server" Width="900px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="6" align="left">
                                <div class="widgettitle">
                                    Training Feedback</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                                &nbsp;</td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 250px">
                                <asp:HiddenField ID="hdFldEmpTrngID" runat="server" />
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
                                Training Status
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rdbtnTrngStatus" runat="server" AutoPostBack="True" CssClass="chkText"
                                    RepeatDirection="Horizontal">
                                    <asp:ListItem Value="0">Successfully Done</asp:ListItem>
                                    <asp:ListItem Value="1">Cancelled</asp:ListItem>
                                </asp:RadioButtonList>
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
                                Start Date
                                <asp:RequiredFieldValidator ID="reqFBTrngStartDate" runat="server" ControlToValidate="txtTrngFBackStartDate"
                                    Display="None" ErrorMessage="Start Date Required" ValidationGroup="FeedBack"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFBTrngStartDate_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" TargetControlID="reqFBTrngStartDate"
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtTrngFBackStartDate" runat="server" CssClass="InputTxtBox" Width="80px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtTrngFBackStartDate_CalendarExtender" runat="server"
                                    TargetControlID="txtTrngFBackStartDate">
                                </cc1:CalendarExtender>
                                &nbsp;
                                <asp:DropDownList ID="drpFBSHour" runat="server" CssClass="InputTxtBox" Width="40px">
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
                                </asp:DropDownList>
                                <asp:DropDownList ID="drpFBSMin" runat="server" CssClass="InputTxtBox" Width="50px">
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList ID="drpFBSAMPM" runat="server" CssClass="InputTxtBox" Width="50px">
                                    <asp:ListItem>AM</asp:ListItem>
                                    <asp:ListItem>PM</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                End Date
                                <asp:RequiredFieldValidator ID="reqFBTrngEndDate" runat="server" ControlToValidate="txtTrngFBackEndDate"
                                    Display="None" ErrorMessage="End Date Required" ValidationGroup="FeedBack"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFBTrngEndDate_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" TargetControlID="reqFBTrngEndDate"
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtTrngFBackEndDate" runat="server" CssClass="InputTxtBox" Width="80px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtTrngFBackEndDate_CalendarExtender" runat="server" TargetControlID="txtTrngFBackEndDate">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:DropDownList ID="drpFBEHour" runat="server" CssClass="InputTxtBox" Width="40px">
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
                                </asp:DropDownList>
                                <asp:DropDownList ID="drpFBEMin" runat="server" CssClass="InputTxtBox" Width="50px">
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList ID="drpFBEAMPM" runat="server" CssClass="InputTxtBox" Width="50px">
                                    <asp:ListItem>AM</asp:ListItem>
                                    <asp:ListItem>PM</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Evaluation Of The Program
                                <asp:RequiredFieldValidator ID="reqFldFBEvaluationOfProg" runat="server" ControlToValidate="txtEvaluationOfTheProgram"
                                    Display="None" ErrorMessage="Required: Evaluation Of The Program" ValidationGroup="FeedBack"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldFBEvaluationOfProg_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    TargetControlID="reqFldFBEvaluationOfProg" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEvaluationOfTheProgram" runat="server" CssClass="InputTxtBox"
                                    Height="50px" TextMode="MultiLine" Width="200px"></asp:TextBox>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Evaluation Of The Trainer<asp:RequiredFieldValidator ID="reqFldFBEvaluationOfTrainer"
                                    runat="server" ControlToValidate="txtEvaluationOfTheTrainer" Display="None" ErrorMessage="Required: Evaluation Of The Trainer"
                                    ValidationGroup="FeedBack"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldFBEvaluationOfTrainer_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    TargetControlID="reqFldFBEvaluationOfTrainer" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEvaluationOfTheTrainer" runat="server" CssClass="InputTxtBox"
                                    Height="50px" TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Your Experience( how this training will help in your career progression?)
                                <asp:RequiredFieldValidator ID="reqFldYourExperience" runat="server" ControlToValidate="txtYourExperience"
                                    Display="None" ErrorMessage="Required: Your Experience" ValidationGroup="FeedBack"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldYourExperience_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    TargetControlID="reqFldYourExperience" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtYourExperience" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Reason For Cancellation&nbsp;<asp:RequiredFieldValidator ID="reqFldCancellationCause"
                                    runat="server" ControlToValidate="txtTrngCancellationCause" Display="None" ErrorMessage="Required: Cancellation Cause"
                                    ValidationGroup="CancelTraining"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldCancellationCause_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    TargetControlID="reqFldCancellationCause" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                <asp:TextBox ID="txtTrngCancellationCause" runat="server" CssClass="InputTxtBox"
                                    Height="50px" TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td>
                                <asp:Button ID="btnSubmitFeedBack" runat="server" CssClass="styled-button-1" Text="Submit"
                                    ValidationGroup="FeedBack" />
                                &nbsp;<asp:Button ID="btnCancelTrng" runat="server" CssClass="styled-button-1" Text="Cancel Training"
                                    ValidationGroup="CancelTraining" />
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnCancelFeedBack" runat="server" CssClass="styled-button-1" Text="Cancel" />
                            </td>
                            <td>
                                &nbsp;</td>
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
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
