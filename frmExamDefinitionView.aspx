<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmExamDefinitionView.aspx.vb" Inherits="frmExamDefinitionView" Title=".::HRM : Exam Definition View::." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlExamDefinition" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" class="label" colspan="5">
                                <div class="widgettitle">
                                    Exam Definition View<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 200px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 150px">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                            </td>
                            <td align="left" class="label">
                                Choose Exam
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpAvailableExams" runat="server" CssClass="InputTxtBox" Width="200px"
                                    AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label">
                            </td>
                            <td class="label">
                                Name Of The Exam
                            </td>
                            <td>
                                <asp:TextBox ID="txtExamName" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;
                            </td>
                            <td class="label">
                                Dynamic Question Gneration
                            </td>
                            <td>
                                <asp:CheckBox ID="chkIsDynamicQuestionGeneration" runat="server" CssClass="chkText"
                                    Text="Is Dynamic" AutoPostBack="True" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Exam Code
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtExamCode" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Positive Marking/Question
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtPositiveMarkingPerQuestion" runat="server" CssClass="InputTxtBox"
                                    Width="80px"></asp:TextBox>
                            </td>
                            <td align="left" class="label">
                                Total Question
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtTotalNoOfQuestion" runat="server" CssClass="InputTxtBox" Width="80px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Negative Marking/Question
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtNegativeMarkingPerQuestion" runat="server" CssClass="InputTxtBox"
                                    Width="80px"></asp:TextBox>
                            </td>
                            <td align="left" class="label">
                                Total Marks
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtTotalMarks" runat="server" CssClass="InputTxtBox" Width="80px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Skip Marking/Question
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtSkipMarkingPerQuestion" runat="server" CssClass="InputTxtBox"
                                    Width="80px">0</asp:TextBox>
                            </td>
                            <td align="left" class="label">
                                Total Time (Min)
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtTotalTime" runat="server" CssClass="InputTxtBox" Width="80px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Not Answered Marking/Question
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtNotAnsweredPerQuestion" runat="server" CssClass="InputTxtBox"
                                    Width="80px">0</asp:TextBox>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                            </td>
                            <td align="left">
                            </td>
                            <td>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlSubjectWiseMarksDistribution" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" class="label">
                                <div class="widgettitle">
                                    Define Subjects For The Exam</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:GridView ID="grdExamWiseSubject" runat="server" AutoGenerateColumns="False"
                                    CssClass="mGrid" Width="100%">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sl">
                                            <ItemTemplate>
                                                <font style="font-size: 12px"><b>
                                                    <%#CType(Container, GridViewRow).RowIndex + 1%></b> </font>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="SubjectID" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSubjectID" runat="server" Text='<%# Bind("SubjectID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="SubjectName">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSubjectName" runat="server" Text='<%# Bind("SubjectName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Positive">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPositiveMarkingPerQuestion" runat="server" Text='<%# Bind("PositiveMarkingPerQuestion") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Negative">
                                            <ItemTemplate>
                                                <asp:Label ID="lblNegativeMarkingPerQuestion" runat="server" Text='<%# Bind("NegativeMarkingPerQuestion") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Skip">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSkipMarkingPerQuestion" runat="server" Text='<%# Bind("SkipMarkingPerQuestion") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Not-Answered">
                                            <ItemTemplate>
                                                <asp:Label ID="lblNotAnsweredMarkingPerQuestion" runat="server" Text='<%# Bind("NotAnsweredMarkingPerQuestion") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Percentage">
                                            <ItemTemplate>
                                                <asp:Label ID="lblQuePickPercentage" runat="server" Text='<%# Bind("QuePickPercentage") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="AllocatedQuestion">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAllocatedQuestion" runat="server" Text='<%# Bind("AllocatedQuestion") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="DifficultyLevel">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("DifficultyLevel") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlGradingSystem" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" colspan="2">
                                <div class="widgettitle">
                                    Define Grading System
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Exam Instructions
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" style="width: 50%">
                                <div style="max-height: 250px; max-width: 100%; overflow: auto">
                                    <asp:GridView ID="grdDefaultGradingSystem" runat="server" AutoGenerateColumns="False"
                                        CssClass="mGrid" EmptyDataText="No Data Available">
                                        <Columns>
                                            <asp:TemplateField HeaderText="SL">
                                                <ItemTemplate>
                                                    <font style="font-size: 12px"><b>
                                                        <%#CType(Container, GridViewRow).RowIndex + 1%></b> </font>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="FromPercentage">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("FromPercentage") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDefFromPercentage" runat="server" Text='<%# Bind("FromPercentage") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ToPercentage">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("ToPercentage") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDefToPercentage" runat="server" Text='<%# Bind("ToPercentage") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="LetterGrade">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("LetterGrade") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDefLetterGrade" runat="server" Text='<%# Bind("LetterGrade") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="GradePoint">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("GradePoint") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDefGradePoint" runat="server" Text='<%# Bind("GradePoint") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="GradingExplanation" Visible="false">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("GradingExplanation") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDefGradingExplanation" runat="server" Text='<%# Bind("GradingExplanation") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                            <td valign="top" align="left" style="width: 50%">
                                <asp:TextBox ID="txtExamInstructions" runat="server" CssClass="InputTxtBox" Height="80px"
                                    TextMode="MultiLine" Width="400px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
