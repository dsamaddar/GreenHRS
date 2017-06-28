<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false" CodeFile="frmInputJD.aspx.vb" Inherits="JD_frmInputJD" Title=".:HRM:Job Description:." Theme="CommonSkin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />

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
            </td>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td>
            </td>
        </tr>
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlInputJD" runat="server" SkinID="pnlInner" Width="800px">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="5" align="left">
                                <div class="widgettitle">
                                    Define JD</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
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
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label" style="width: 170px">
                                <b>Job Description No.</b>&nbsp;
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtJDNo" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldFatherName" runat="server" ControlToValidate="txtJDNo"
                                    ErrorMessage="*" ValidationGroup="SubmitJD"></asp:RequiredFieldValidator>
                            </td>
                            <td align="left" class="label" style="width: 170px">
                                <b>Job Title</b>&nbsp;
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtJobTitle" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtJobTitle"
                                    ErrorMessage="*" ValidationGroup="SubmitJD"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                <b>Last Modified Date</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="dtModifiedDate" runat="server" CssClass="InputTxtBox" Width="90px">
                                </asp:TextBox>
                                <cc1:CalendarExtender ID="dtModifiedDate_CalendarExtender" runat="server" Enabled="True"
                                    Format="dd-MMM-yy" TargetControlID="dtModifiedDate">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="dtModifiedDate"
                                    ErrorMessage="*" ValidationGroup="SubmitJD"></asp:RequiredFieldValidator>
                            </td>
                            <td align="left" class="label">
                                <b>JD Goal</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtJDGoal" runat="server" CssClass="InputTxtBox" Height="38px" TextMode="MultiLine"
                                    Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td align="left" class="label">
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
                &nbsp;
            </td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Panel ID="pnlKeyRes" runat="server" Width="800px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label" style="width: 160px">
                                <b>Key Responsibilities</b>&nbsp;
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlKeyRes" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                                &nbsp;<asp:Button ID="btnKeyRes" runat="server" CssClass="styled-button-1" Text="ADD"
                                    ValidationGroup="Submit" />
                                &nbsp;<asp:Label ID="lblKeyResAdd" runat="server">
                                    <asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" Text="Cancel" />
                                    &#160;
                                    <asp:TextBox ID="txtKeyRes" runat="server" Width="200px" CssClass="InputTxtBox"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqFldCompanyName" runat="server" ControlToValidate="txtKeyRes"
                                        ErrorMessage="*" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                </asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                            </td>
                            <td align="left" class="label" style="width: 160px">
                            </td>
                            <td align="left">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Detail</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtDetail" runat="server" CssClass="InputTxtBox" Height="60px" TextMode="MultiLine"
                                    Width="500px"></asp:TextBox>
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
                                <asp:Button ID="btnAddKeyRespons" runat="server" CssClass="styled-button-1" Text="ADD"
                                    ValidationGroup="AddKeyRespons" />
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                                &nbsp;
                            </td>
                            <td colspan="2">
                                <div style="max-height: 200px; max-width: 780px; overflow: auto">
                                    <asp:GridView ID="grdKeyRes" runat="server" AutoGenerateColumns="False" Width="100%"
                                        SkinID="grdNoFooter" CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Sl">
                                                <ItemTemplate>
                                                    <font style="font-size: 12px"><b>
                                                        <%#CType(Container, GridViewRow).RowIndex + 1%></b> </font>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="KeyResTypeID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblKeyResTypeID" runat="server" Text='<%# Bind("KeyResTypeID") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("KeyResTypeID") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Key Responsibilities">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblKeyResponsibilityTypeName" runat="server" Text='<%# Bind("KeyResponsibilityTypeName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("KeyResponsibilityTypeName") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Job Detail">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDetail" runat="server" Text='<%# Bind("JobDetail") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("JobDetail") %>' Width="300px"></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Delete">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgDelete" runat="server" CausesValidation="False" CommandName="Delete"
                                                        ImageUrl="~/img/delete.jpg" OnClientClick="return confirm('Are You Sure You Want to Delete?')"
                                                        Width="40" />
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
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Panel ID="pnlExcep" runat="server" Width="800px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label" style="width: 160px">
                                <b>Exception</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtException" runat="server" CssClass="InputTxtBox" Height="60px"
                                    TextMode="MultiLine" Width="500px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtException"
                                    ErrorMessage="*" ValidationGroup="SubmitException"></asp:RequiredFieldValidator>
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
                                <asp:Button ID="btnAddException" runat="server" CssClass="styled-button-1" Text="ADD"
                                    ValidationGroup="SubmitException" />
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                                &nbsp;
                            </td>
                            <td colspan="2">
                                <div style="max-height: 200px; max-width: 780px; overflow: auto">
                                    <asp:GridView ID="grdException" runat="server" AutoGenerateColumns="False" Width="100%"
                                        SkinID="grdNoFooter" CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Sl">
                                                <ItemTemplate>
                                                    <b>
                                                        <%#CType(Container, GridViewRow).RowIndex + 1%></b>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Exception">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDetail" runat="server" Text='<%# Bind("ExceptionDetail") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("ExceptionDetail") %>' Width="300px"></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Delete">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgDelete" runat="server" CausesValidation="False" CommandName="Delete"
                                                        ImageUrl="~/img/delete.jpg" OnClientClick="return confirm('Are You Sure You Want to Delete?')"
                                                        Width="40" />
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
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Panel ID="pnlKPI" runat="server" SkinID="pnlInner" Width="800px">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" style="width: 20px">
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
                        <tr>
                            <%-- <td align="left">
                                &nbsp;
                            </td>--%>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label" style="width: 160px">
                                <b>Key Performance Indicator(KPI)</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtKPIDetail" runat="server" CssClass="InputTxtBox" Height="60px"
                                    TextMode="MultiLine" Width="500px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtKPIDetail"
                                    ErrorMessage="*" ValidationGroup="SubmitKPI"></asp:RequiredFieldValidator>
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
                            <td align="left">
                                <asp:Button ID="btnKPI" runat="server" CssClass="styled-button-1" Text="ADD" ValidationGroup="SubmitKPI" />
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                                &nbsp;
                            </td>
                            <%--<td>
                                &nbsp;
                            </td>--%>
                            <td>
                                &nbsp;
                            </td>
                            <td colspan="2">
                                <div style="max-height: 200px; max-width: 780px; overflow: auto">
                                    <asp:GridView ID="grdKPI" runat="server" AutoGenerateColumns="False" Width="100%"
                                        SkinID="grdNoFooter" CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Sl">
                                                <ItemTemplate>
                                                    <b>
                                                        <%#CType(Container, GridViewRow).RowIndex + 1%></b>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Key Performance Indicator">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDetail" runat="server" Text='<%# Bind("KPIDetail") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("KPIDetail") %>' Width="300px"></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Delete">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgDelete" runat="server" CausesValidation="False" CommandName="Delete"
                                                        ImageUrl="~/img/delete.jpg" OnClientClick="return confirm('Are You Sure You Want to Delete?')"
                                                        Width="40" />
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
        <tr>
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
            <td align="left" class="label">
                &nbsp;
            </td>
            <td align="center">
                <asp:Button ID="btnSave" runat="server" CssClass="styled-button-1" Text="Save" ValidationGroup="SubmitJD" />
                &nbsp;<asp:Button ID="btnUpdate" runat="server" CssClass="styled-button-1" Text="Update"
                    ValidationGroup="SubmitJD" />
                &nbsp;<asp:Button ID="btnCancelSelection" runat="server" CssClass="styled-button-1"
                    Text="Cancel" />
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
                <asp:Panel ID="pnlEmpInfoList" runat="server" SkinID="pnlInner" Width="800px">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td align="center">
                                <div id="divgrd" onscroll="SetDivPosition()" style="height: 150px; width: 100%; overflow: auto">
                                    <asp:GridView ID="grdJobDescription" runat="server" AutoGenerateColumns="False" Width="750px"
                                        SkinID="grdNoFooter" CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                                        CssClass="linkbtn" Text="Select"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="JobDescriptionID" Visible="False">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtJobDescriptionID" runat="server" Text='<%# Bind("JobDescriptionID") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJobDescriptionID" runat="server" Text='<%# Bind("JobDescriptionID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="JobDescriptionNo">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("JobDescriptionNo") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJobDescriptionNo" runat="server" Text='<%# Bind("JobDescriptionNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="JobTitle">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("JobTitle") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJobTitle" runat="server" Text='<%# Bind("JobTitle") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="View">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkbtnarDetails" CssClass="linkbtn" runat="server" OnClientClick='<%#Eval("JobDescriptionID","openWindow(""../JD/frmJobDescriptionView.aspx?JobDescriptionID={0}"",""Popup"",950,800);") %>'>Details</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
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
