<%@ Page Theme="CommonSkin" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="frmViewJobAdvertisement.aspx.vb" Inherits="JobCircular_frmViewJobAdvertisement"
    Title=".:HRM:Available Jobs:." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .protected
        {
            -moz-user-select: none;
            -webkit-user-select: none;
            user-select: none;
        }
    </style>

    <script language="javascript" type="text/javascript">

        function onKeyDown() {

            // current pressed key
            var pressedKey = String.fromCharCode(event.keyCode).toLowerCase();

            if (event.ctrlKey && (pressedKey == "c" ||
                        pressedKey == "v")) {
                // <strong class="highlight">disable</strong> key press porcessing
                event.returnValue = false;
            }

        } // onKeyDown

        function DisableCopyPaste() {
            alert('This functionality has been disabled !');
            window.clipboardData.clearData('Text'); //for cleaning up the clipboard
            // Cancel default behavior
            event.returnValue = false;
        }

    </script>

    <script language="javascript" type="text/javascript">
        window.history.forward(1);

        document.oncontextmenu = function() { // Use document as opposed to window for IE8 compatibility
            alert("This Function Is Not Allowed In ULC JOB Application Process.")
            return false;
        };
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="JavaScript" type="text/javascript">
        function openWindow(windowURL, windowName, windowWidth, windowHeight) {

            var left = (screen.width / 2) - (windowWidth / 2);
            var top = (screen.height / 2) - (windowHeight / 2);

            window.name = 'parentWnd';
            newWindow = window.open(windowURL, windowName, 'top=' + top + ',left=' + left + ',width=' + windowWidth + ',height=' + windowHeight + ',toolbar=0,location=no,directories=0, status=0,menuBar=0,scrollBars=1,resizable=1');
            newWindow.focus();
        }
    </script>

    <table style="width: 100%;">
        <tr align="center">
            <td style="width: 70px;">
                &nbsp;
            </td>
            <td style="width: 250px;">
                &nbsp;
            </td>
            <td style="width: 20px;">
                &nbsp;
            </td>
        </tr>
        <tr align="center">
            <td align="right">
                <b>Are You Interested to Apply : </b>
            </td>
            <td id="Td1" colspan="2" runat="server" align="left">
                <asp:RadioButtonList ID="rdoInterested" runat="server" AutoPostBack="true" RepeatDirection="Horizontal"
                    CssClass="rbdText" Width="300px">
                    <asp:ListItem Value="Interested"> Interested </asp:ListItem>
                    <asp:ListItem Selected="True" Value="Not-Interested"> Not-Interested </asp:ListItem>
                </asp:RadioButtonList>
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
    </table>
    <table style="width: 100%;" class="protected">
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
        <tr align="center" id="idAvailableJob" runat="server">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Panel ID="pnlAvailableJobCircular" runat="server" SkinID="pnlInner" Width="950px">
                    <table style="width: 100%;">
                        <tr align="center">
                            <td>
                                <div style="max-height: 600px; max-width: 950px; overflow: auto">
                                    <asp:GridView ID="grdJobCircular" runat="server" AutoGenerateColumns="False" CellPadding="30"
                                        CellSpacing="10" GridLines="None" SkinID="grdNoFooter" Width="940px">
                                        <Columns>
                                            <asp:TemplateField HeaderText="CircularID" Visible="False">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CircularID") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCircularID" runat="server" Text='<%# Bind("CircularID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%-- <asp:TemplateField HeaderText=" Interested ">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkSelect" runat="server"></asp:CheckBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <%--<asp:BoundField DataField="CircularID" HeaderText="CircularID" ReadOnly="True" SortExpression="CircularID" />--%>
                                            <asp:TemplateField HeaderText=" Sl.No. ">
                                                <ItemTemplate>
                                                    <font style="font-size: 12px"><b>
                                                        <%#CType(Container, GridViewRow).RowIndex + 1%></b> </font>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Job Title">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJobTitle" runat="server" Text='<%# Bind("JobTitle") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("JobTitle") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Job Location">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblJobLocation" runat="server" Text='<%# Bind("JobLocation") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Eval("JobLocation") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText=" Department Name ">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDepartmentID" runat="server" Text='<%# Bind("DeptName") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("DepartmentID") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Closing Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblClosingDate" runat="server" Text='<%# Bind("ClosingDate") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("ClosingDate") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Details">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkbtnCircularDetails" CssClass="linkbtn" runat="server" OnClientClick='<%#Eval("CircularID","openWindow(""../JobCircular/frmShowJobCircularDetails.aspx?CircularID={0}"",""Popup"",950,800);") %>'>Details</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Apply">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAlreadyApplied" Visible="false" runat="server" Text=""></asp:Label>
                                                    <asp:ImageButton Height="30px" Width="100px" OnClientClick="if (!confirm('Are you Sure to Apply ?')) return false"
                                                        ImageUrl="~/Sources/images/applyNow_red.png" ID="ImageButton2" runat="server"
                                                        CommandName="Select" Enabled="true"  />
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
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
