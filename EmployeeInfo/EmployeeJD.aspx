<%@ Page Language="VB" MasterPageFile="~/EmployeeInfo/EmployeeMasterPage.master"
    AutoEventWireup="false" CodeFile="EmployeeJD.aspx.vb" Inherits="EmployeeInfo_EmployeeJD"
    Title=".:HRM:Employee JD:." Theme="CommonSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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

    <table width="100%">
        <tr align="center">
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
        <tr align="center">
            <td>
            </td>
            <td align="center">
                <asp:Panel ID="pnlCurrentJD" Width="750px" SkinID="pnlInner" runat="server">
                    <table width="100%">
                        <tr>
                            <td align="center">
                                <div style="max-height: 300px; max-width: 735px; overflow: auto">
                                    <asp:GridView ID="grdCurJD" Width="730px" Font-Names="Arial" Font-Size="12px" runat="server"
                                        AutoGenerateColumns="False" EmptyDataText="No Information Available" 
                                        SkinID="grdNoFooter">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <Columns>
                                            <asp:BoundField DataField="JDName" HeaderText="Current JD" SortExpression="JDName" />
                                            <asp:BoundField DataField="LastModifiedDate" HeaderText="LastModifiedDate" SortExpression="LastModifiedDate" />
                                            <asp:BoundField DataField="AcceptedDate" HeaderText="AcceptedDate" SortExpression="AcceptedDate" />
                                            <asp:TemplateField HeaderText="View">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkDetails" CssClass="linkbtn" Width="100px" runat="server" OnClientClick='<%#Eval("JobDescriptionID","openWindow(""../EmployeeInfo/frmJDAcceptance.aspx?JobDescriptionID={0}"",""Popup"",950,800);") %>'>Details</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                        <%--<tr>
                            <td>
                                <asp:SqlDataSource ID="dsCurJD" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="select JDno JobDescriptionID,(tblJobDescription.JobDescriptionNo+'('+JobTitle+')' ) JDName,
                                    convert(varchar,LastModifiedDate,106) LastModifiedDate,
                                    isnull(convert(nvarchar,tblUserAcceptanceJD.EntryDate,106),'Yet not Accepted') AcceptedDate
                                    from dbo.tblEmployeeInfo inner join dbo.tblJobDescription
                                    on dbo.tblJobDescription.JobDescriptionID=tblEmployeeInfo.JDno
                                    left join dbo.tblUserAcceptanceJD on dbo.tblUserAcceptanceJD.JobDescriptionID=tblEmployeeInfo.JDno
                                    where tblEmployeeInfo.EmployeeID=@EmployeeID " ProviderName="<%$ ConnectionStrings:HRMConnectionString.ProviderName %>">
                                    <SelectParameters>
                                        <asp:SessionParameter SessionField="EmployeeID" Name="EmployeeID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>--%>
                    </table>
                </asp:Panel>
            </td>
            <td>
            </td>
        </tr>
        <tr align="center">
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
        <tr>
            <td>
                &nbsp;
            </td>
            <td align="center">
                <asp:Panel ID="pnlAcceptedJDS" Width="750px" SkinID="pnlInner" runat="server">
                    <table width="100%">
                        <tr>
                            <td align="center">
                                <div style="max-height: 300px; max-width: 735px; overflow: auto">
                                    <asp:GridView ID="grdAcceptedJDS" Width="735px" Font-Names="Arial" Font-Size="12px"
                                        runat="server" AutoGenerateColumns="False" EmptyDataText="No Information Available"
                                        DataSourceID="dsAcceptedJD" SkinID="grdNoFooter">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <Columns>
                                            <asp:BoundField DataField="JDName" HeaderText="Accepted JD" SortExpression="JDName" />
                                            <asp:BoundField DataField="ModifiedDate" HeaderText="LastModifiedDate" SortExpression="ModifiedDate" />
                                            <asp:BoundField DataField="AcceptedDate" HeaderText="AcceptedDate" SortExpression="AcceptedDate" />
                                            <asp:TemplateField HeaderText="View">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkDetails" Width="100px" CssClass="linkbtn" runat="server" OnClientClick='<%#Eval("JobDescriptionID","openWindow(""../JD/frmJobDescriptionView.aspx?JobDescriptionID={0}"",""Popup"",950,800);") %>'>Details</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:SqlDataSource ID="dsAcceptedJD" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="select tblUserAcceptanceJD.JobDescriptionID,
                                    (tblJobDescription.JobDescriptionNo+'('+JobTitle+')' )JDName,
                                    dbo.fnGetModifiedDate(tblUserAcceptanceJD.JobDescriptionID) as ModifiedDate
                                    ,convert(nvarchar,tblUserAcceptanceJD.EntryDate,106) AcceptedDate
                                    from dbo.tblUserAcceptanceJD inner join dbo.tblJobDescription
                                    on dbo.tblJobDescription.JobDescriptionID=tblUserAcceptanceJD.JobDescriptionID
                                    where tblUserAcceptanceJD.EmployeeID=@EmployeeID
                                    and tblUserAcceptanceJD.JobDescriptionID not in (select JDno from dbo.tblEmployeeInfo where EmployeeID=@EmployeeID)"
                                    ProviderName="<%$ ConnectionStrings:HRMConnectionString.ProviderName %>">
                                    <SelectParameters>
                                        <asp:SessionParameter SessionField="EmployeeID" Name="EmployeeID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
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
</asp:Content>
