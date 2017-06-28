<%@ Page Language="VB" Theme="CommonSkin"  AutoEventWireup="false" CodeFile="frmExamSubWiseQuestionAllocation.aspx.vb" Inherits="frmExamSubWiseQuestionAllocation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <link href="Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
    <form id="form1" runat="server">
    <table style="width:100%;">
        <tr align="center" >
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center" >
            <td>
                &nbsp;</td>
            <td>
                <asp:Panel ID="pnlExamSubWiseQuestionAllocation" runat="server" SkinID="pnlInner">
                    <div>
                        <asp:GridView ID="grdExamSubWiseQuestionAllocation" runat="server" 
                            EmptyDataText="No Data Available" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="SL.">
                                     <ItemTemplate>
                                           <font style="font-size:12px">
                                            <b><%#CType(Container, GridViewRow).RowIndex + 1%></b>
                                            </font>
                                     </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="QuestionID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblQuestionID" runat="server" Text='<%# Bind("QuestionID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("QuestionID") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Question">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Question") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Question") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="QuestionOrder">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("QuestionOrder") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("QuestionOrder") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DifficultyLevel">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("DifficultyLevel") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("DifficultyLevel") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" CssClass="linkbtn" runat="server" CausesValidation="False" 
                                            CommandName="Delete" Text="Delete" CommandArgument='<%#CType(Container, GridViewRow).RowIndex %>'    OnClientClick="if (!confirm('Are you Sure to Delete ?')) return false"   ></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
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
