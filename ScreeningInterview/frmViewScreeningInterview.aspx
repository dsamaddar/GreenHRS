<%@ Page Language="VB" Theme="CommonSkin"  AutoEventWireup="false" CodeFile="frmViewScreeningInterview.aspx.vb" Inherits="ScreeningInterview_frmViewScreeningInterview" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>.:HRM::Screening Interview Details:.</title>
    <link href="../Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
    <link href="../Sources/css/Title.css" rel="stylesheet" type="text/css" />
    <link href="../Sources/css/GridStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table style="width:100%;">
        <tr align="center" >
            <td>
                &nbsp;</td>
            <td>
                <asp:Panel ID="PnlQA" runat="server" Width="900px" SkinID="pnlInner" >
                    <table style="width:100%;">
                        <tr>
                            <td align="left" colspan="4" >
                                <div class="widgettitle">Screening Interview Details</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="width:20px">
                                &nbsp;</td>
                            <td align="left" class="label" style="width:250px">
                                Screened By</td>
                            <td align="left">
                                <asp:Label ID="lblScreenedBy" runat="server" CssClass="chkText"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="left" >
                            <td align="left" style="width:20px">
                                &nbsp;</td>
                            <td align="left" style="width:250px" class="label">
                                Screended Date</td>
                            <td>
                                <asp:Label ID="lblScreenedDate" runat="server" CssClass="chkText"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="left" >
                            <td>
                                &nbsp;</td>
                            <td class="label">
                                Interview Method</td>
                            <td>
                                <asp:Label ID="lblInterviewMethod" runat="server" CssClass="RadioButton" 
                                    Width="250px"></asp:Label>
                                </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td colspan="2">
                                <div style="max-height:250px;max-width:880px;overflow:auto">
                                    <asp:GridView ID="grdQuestionAndAnswer" runat="server" 
                                        AutoGenerateColumns="False" SkinID="grdNoFooter" CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Sl">
                                                <ItemTemplate>
                                                    <table style="width:50px">
                                                        <tr>
                                                            <td>
                                                                <b style="color:Green">( Q. <%#CType(Container, GridViewRow).RowIndex + 1%> )</b>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Question">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Question") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Question") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Options">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Options") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Options") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td class="label">
                                Do you know anyone in this institution ? Whom?</td>
                            <td>
                                <asp:Label ID="lblDoKnowAnyOne" runat="server" CssClass="label"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td class="label">
                                How do you know the above person ?</td>
                            <td>
                                <asp:Label ID="lblHowToKnow" runat="server" CssClass="label"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td class="label">
                                Matche with current job Responsibilities</td>
                            <td>
                                <div style="max-height:100px;max-width:260px;overflow:auto">
                                    <asp:ListBox ID="lstbxMatchWithCurrentJob" runat="server" CssClass="RadioButton" Width="250px"></asp:ListBox>
                                </div>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td class="label">
                                Suitable For Department</td>
                            <td>
                                <div style="max-height:100px;max-width:260px;overflow:auto">
                                    <asp:ListBox ID="lstbxSuitableFor" runat="server" CssClass="RadioButton" Width="250px"></asp:ListBox>
                                </div>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td class="label">
                                Remarks</td>
                            <td>
                                <asp:Label ID="lblRemarks" runat="server" CssClass="RadioButton" 
                                    Width="250px"></asp:Label>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td class="label">
                                Next Course Of Action</td>
                            <td>
                                <asp:Label ID="lblNextCourseOfAction" runat="server" CssClass="RadioButton" 
                                    Width="250px"></asp:Label>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center" >
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</form>
</body>
</html>
