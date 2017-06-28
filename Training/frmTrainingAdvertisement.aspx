<%@ Page Language="VB" Theme="CommonSkin"  MasterPageFile="~/EmployeeProfile/MasterEmpProfile.master" AutoEventWireup="false" CodeFile="frmTrainingAdvertisement.aspx.vb" Inherits="Training_frmTrainingAdvertisement" title=".:HRM:Available Training:." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script src="../Sources/js/superfish.js" type="text/javascript"></script>
    <script src="../Sources/js/jquery-1.6.1.min.js" type="text/javascript"></script>
    <link href="../Sources/css/admin.css" rel="stylesheet" type="text/css" />
   
    <script language="JavaScript" type="text/javascript" >
    function openWindow(windowURL,windowName,windowWidth,windowHeight) {

    var left = (screen.width/2)-(windowWidth/2);
    var top = (screen.height/2)-(windowHeight/2);



    window.name = 'parentWnd';
    newWindow = window.open(windowURL,windowName,'top='+ top +',left='+ left +',width='+windowWidth+',height='+windowHeight+',toolbar=0,location=no,directories=0, status=0,menuBar=0,scrollBars=1,resizable=1');
    newWindow.focus();
}
</script> 
    
    <table style="width:100%;">
        <tr align="center" >
            <td></td>
            <td>
                <asp:Panel ID="pnlShowAvailableTraining" runat="server" Width="900px" 
                    SkinID="pnlInner">
                    <table style="width:100%;">
                        <tr align="left">
                            <td class="divTitleBackground" >Available Training</td>
                        </tr>
                        <tr align="center">
                            <td align="left">
                                <div style="max-height:600px;max-width:880px;Overflow:auto">
                                <asp:GridView ID="grdAvailableTraining" runat="server" 
                                    AutoGenerateColumns="False" SkinID="grdNoFooter">
                                    <Columns>
                                        <asp:TemplateField HeaderText="TrainingID" Visible="False">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TrainingID") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("TrainingID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="TrainingDetails">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TrainingDetails") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("TrainingDetails") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="RegDeadLine">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("RegDeadLine") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("RegDeadLine") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="View" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkBtnViewDetails" runat="server" CausesValidation="False" 
                                                OnClientClick='<%# Eval("TrainingID","openWindow(""frmShowTrainingDetails.aspx?TrainingID={0}"",""Popup"",800,800);") %>'
                                                    CommandName="Select" Text="Details" >
                                                </asp:LinkButton>
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
                &nbsp;</asp:Content>

