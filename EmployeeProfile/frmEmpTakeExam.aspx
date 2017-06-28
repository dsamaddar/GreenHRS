<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/EmployeeProfile/MasterEmpProfile.master"
    AutoEventWireup="false" CodeFile="frmEmpTakeExam.aspx.vb" Inherits="EmployeeProfile_frmEmpTakeExam"
    Title=".:HRM:Employee Exam:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="JavaScript" type="text/javascript">
    function openWindow(windowURL,windowName,windowWidth,windowHeight) {

    var left = (screen.width/2)-(windowWidth/2);
    var top = (screen.height/2)-(windowHeight/2);



    window.name = 'parentWnd';
    newWindow = window.open(windowURL,windowName,'top='+ top +',left='+ left +',width='+windowWidth+',height='+windowHeight+',toolbar=0,location=no,directories=0, status=0,menuBar=0,scrollBars=1,resizable=1');
    newWindow.focus();
    }
    </script>

    <table style="width: 100%;">
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
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
                <asp:Panel ID="pnlExamSelection" runat="server" Width="900px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td style="width: 20px">
                                &nbsp;
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
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Select Exam
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpAvailableQuestionForTheUser" runat="server" AutoPostBack="True"
                                    CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldAvailableExams" runat="server" ControlToValidate="drpAvailableQuestionForTheUser"
                                    ErrorMessage="*" ValidationGroup="VerifyRollNo"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td align="left">
                                <asp:Panel ID="pnlRollNoVerification" runat="server" SkinID="pnlInner" Width="500px">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td style="width: 20px">
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="label">
                                            </td>
                                            <td align="left" class="label">
                                                Provide Roll No
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtRollNo" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                &nbsp;<asp:RequiredFieldValidator ID="reqFldRollNo" runat="server" ControlToValidate="txtRollNo"
                                                    ErrorMessage="*" ValidationGroup="VerifyRollNo"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td align="left">
                                                <asp:Button ID="btnVerifyRollNo" runat="server" CssClass="styled-button-1" Text="Verify Roll No"
                                                    ValidationGroup="VerifyRollNo" />
                                                &nbsp;<asp:Button ID="btnCancelSelection" runat="server" CssClass="styled-button-1"
                                                    Text="Cancel" />
                                            </td>
                                            <td>
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
                <asp:Panel ID="pnlInstructions" runat="server" Width="900px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="center">
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:TextBox ID="txtInstructions" runat="server" Height="150px" TextMode="MultiLine"
                                    Width="600px" CssClass="chkText" ReadOnly="True"></asp:TextBox>
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
                                <asp:Button ID="btnStartExam" runat="server" CssClass="styled-button-1" Text="Start" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" Text="Cancel" />
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
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Panel ID="pnlTimer" runat="server" Width="900px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <asp:Label ID="lblMessageInfo" runat="server" Font-Size="Large"></asp:Label>
                            </td>
                            <td align="right">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td class="label">
                                                    Time Remaining
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblTimeRemaining" runat="server" Font-Bold="True" Font-Names="Verdana"
                                                        Font-Size="16pt" ForeColor="#CC0000" Width="180px" Height="30px"></asp:Label>
                                                    <asp:Timer ID="timerControl" runat="server" Interval="1000">
                                                    </asp:Timer>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
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
            </td>
            <td>
                <asp:Panel ID="pnlLoadQuestion" runat="server" Width="900px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpQuestionStatus" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                    Width="100px">
                                    <asp:ListItem>NotAnswered</asp:ListItem>
                                    <asp:ListItem>Skipped</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="right">
                                <asp:Label ID="lblQuestionRemainingText" runat="server" Font-Bold="True" Text="Question Remaining :"></asp:Label>
                                <asp:Label ID="lblQuestionRemaining" runat="server" Font-Bold="True" Font-Size="15pt"
                                    ForeColor="#009933" Width="180px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td align="left">
                            </td>
                            <td align="right">
                                <asp:Label ID="lblSkippedQuestionText" runat="server" Font-Bold="True" Text="Skipped Questions :"></asp:Label>
                                <asp:Label ID="lblSkippedQuestionRemaining" runat="server" Font-Bold="True" Font-Size="15pt"
                                    ForeColor="#009933" Width="180px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td align="left" valign="top" colspan="2">
                                <asp:DetailsView ID="dViewLoadQuestion" runat="server" Height="50px" AutoGenerateRows="False"
                                    BackColor="White" BorderColor="#999999" 
                                    DataSourceID="dataSrcLoadQuestion" AllowPaging="True"
                                    CssClass="mGrid">
                                    <Fields>
                                        <asp:TemplateField HeaderText="QuestionPaperID" Visible="false">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("QuestionPaperID") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("QuestionPaperID") %>'></asp:TextBox>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblQuestionPaperID" runat="server" Text='<%# Bind("QuestionPaperID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Question">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblQuestion" runat="server" CssClass="label" Text='<%# Bind("Question") %>'></asp:Label>
                                                <br></br>
                                                <asp:Image ID="imgImages" runat="server" ImageUrl='<%# "~/Sources/Attachments/"+ Eval("Images")%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Answer Choice">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:RadioButton ID="rdbtnAnswerChoiceA" runat="server" />
                                                <cc1:MutuallyExclusiveCheckBoxExtender ID="rdbtnAnswerChoiceA_MutuallyExclusiveCheckBoxExtender"
                                                    runat="server" Enabled="True" Key="AnswerChoice" TargetControlID="rdbtnAnswerChoiceA">
                                                </cc1:MutuallyExclusiveCheckBoxExtender>
                                                <asp:Label ID="lblAnswer_A" runat="server" Text='<%# Bind("Answer_A") %>'></asp:Label><asp:Image
                                                    ID="imgAnswer_A_Image" runat="server" ImageUrl='<%# "~/Sources/Attachments/"+ Eval("Answer_A_Image")%>' />
                                                <asp:Label ID="lblAnswer_A_Image" runat="server" Text='<%# Eval("Answer_A_Image") %>'
                                                    Visible="false"></asp:Label>
                                                <br>
                                                    <br></br>
                                                    <asp:RadioButton ID="rdbtnAnswerChoiceB" runat="server" />
                                                    <cc1:MutuallyExclusiveCheckBoxExtender ID="rdbtnAnswerChoiceB_MutuallyExclusiveCheckBoxExtender"
                                                        runat="server" Enabled="True" Key="AnswerChoice" TargetControlID="rdbtnAnswerChoiceB">
                                                    </cc1:MutuallyExclusiveCheckBoxExtender>
                                                    <asp:Label ID="lblAnswer_B" runat="server" Text='<%# Bind("Answer_B") %>'></asp:Label>
                                                    <asp:Label ID="lblAnswer_B_Image" runat="server" Text='<%# Eval("Answer_B_Image") %>'
                                                        Visible="false"></asp:Label>
                                                    <asp:Image ID="imgAnswer_B_Image" runat="server" ImageUrl='<%# "~/Sources/Attachments/"+ Eval("Answer_B_Image")%>' />
                                                    <br>
                                                        <br></br>
                                                        <asp:RadioButton ID="rdbtnAnswerChoiceC" runat="server" />
                                                        <cc1:MutuallyExclusiveCheckBoxExtender ID="rdbtnAnswerChoiceC_MutuallyExclusiveCheckBoxExtender"
                                                            runat="server" Enabled="True" Key="AnswerChoice" TargetControlID="rdbtnAnswerChoiceC">
                                                        </cc1:MutuallyExclusiveCheckBoxExtender>
                                                        <asp:Label ID="lblAnswer_C" runat="server" Text='<%# Bind("Answer_C") %>'></asp:Label>
                                                        <asp:Label ID="lblAnswer_C_Image" runat="server" Text='<%# Eval("Answer_C_Image") %>'
                                                            Visible="false"></asp:Label>
                                                        <asp:Image ID="imgAnswer_C_Image" runat="server" ImageUrl='<%# "~/Sources/Attachments/"+ Eval("Answer_C_Image")%>' />
                                                        <br>
                                                            <br></br>
                                                            <asp:RadioButton ID="rdbtnAnswerChoiceD" runat="server" />
                                                            <cc1:MutuallyExclusiveCheckBoxExtender ID="rdbtnAnswerChoiceD_MutuallyExclusiveCheckBoxExtender"
                                                                runat="server" Enabled="True" Key="AnswerChoice" TargetControlID="rdbtnAnswerChoiceD">
                                                            </cc1:MutuallyExclusiveCheckBoxExtender>
                                                            <asp:Label ID="lblAnswer_D" runat="server" Text='<%# Bind("Answer_D") %>'></asp:Label>
                                                            <asp:Label ID="lblAnswer_D_Image" runat="server" Text='<%# Eval("Answer_D_Image") %>'
                                                                Visible="false"></asp:Label>
                                                            <asp:Image ID="imgAnswer_D_Image" runat="server" ImageUrl='<%# "~/Sources/Attachments/"+ Eval("Answer_D_Image")%>' />
                                                            <br>
                                                                <br></br>
                                                                <asp:RadioButton ID="rdbtnAnswerChoiceE" runat="server" Visible="false" />
                                                                <cc1:MutuallyExclusiveCheckBoxExtender ID="rdbtnAnswerChoiceE_MutuallyExclusiveCheckBoxExtender"
                                                                    runat="server" Enabled="True" Key="AnswerChoice" TargetControlID="rdbtnAnswerChoiceE">
                                                                </cc1:MutuallyExclusiveCheckBoxExtender>
                                                                <asp:Label ID="lblAnswer_E" runat="server" Text='<%# Bind("Answer_E") %>' Visible="false"></asp:Label>
                                                                <asp:Label ID="lblAnswer_E_Image" runat="server" Text='<%# Eval("Answer_E_Image") %>'
                                                                    Visible="false"></asp:Label>
                                                                <asp:Image ID="imgAnswer_E_Image" runat="server" Visible="false" ImageUrl='<%# "~/Sources/Attachments/"+ Eval("Answer_E_Image")%>' />
                                                            </br>
                                                        </br>
                                                    </br>
                                                </br>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Fields>
                                </asp:DetailsView>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="btnSkipQuestion" runat="server" CssClass="styled-button-1" Text="Skip" />
                                &nbsp;<asp:Button ID="btnNextQuestion" runat="server" CssClass="styled-button-1"
                                    Text="Next" />
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="btnTerminateExam" runat="server" CssClass="styled-button-1" OnClientClick="if (!confirm('Are you Sure to Terminate The Exam ?')) return false"
                                    Text="Terminate" Visible="False" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:SqlDataSource ID="dataSrcLoadQuestion" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="spLoadQuestion" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtRollNo" Name="ExamRollNo" PropertyName="Text"
                                            Type="String" />
                                        <asp:ControlParameter ControlID="drpQuestionStatus" Name="Status" PropertyName="SelectedValue"
                                            Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td>
                                &nbsp;
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
            <td>
                <asp:Panel ID="pnlAttendedExams" runat="server" SkinID="pnlInner" Width="900px">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <div class="widgettitle">
                                    Attended Exams</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="grdEmpAttendedExams" runat="server" AutoGenerateColumns="False"
                                    SkinID="grdNoFooter" Width="100%" CssClass="mGrid">
                                    <Columns>
                                        <asp:TemplateField HeaderText="ExamID" Visible="False">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("ExamID") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ExamID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ExamName">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("ExamName") %>'>
                                                </asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("ExamName") %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ExamRollNo" Visible="False">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("ExamRollNo") %>'>
                                                </asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblExamRollNo" runat="server" Text='<%# Bind("ExamRollNo") %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ExamCode">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("ExamCode") %>'>
                                                </asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ExamCode") %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="TotalQuestion">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("TotalQuestion") %>'>
                                                </asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("TotalQuestion") %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="TotalMarks">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("TotalMarks") %>'>
                                                </asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("TotalMarks") %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="PositiveMarking">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("PositiveMarking") %>'>
                                                </asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("PositiveMarking") %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="NegativeMarking">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("NegativeMarking") %>'>
                                                </asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("NegativeMarking") %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ObtainedMarks">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("ObtainedMarks") %>'>
                                                </asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("ObtainedMarks") %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText=" Exam " ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkCandidateExamDetailsBtn" runat="server" CausesValidation="False"
                                                    CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("ExamRollNo","openWindow(""../CVMan/frmShowCandidateResult.aspx?ExamRollNo={0}"",""Popup"",1000,1100);") %>'
                                                    Text=" View ">
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText=" Exam Details " ShowHeader="False" Visible="False" >
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkbtnCanDetailsExamResult" runat="server" CausesValidation="False"
                                                    CssClass="linkbtn" Font-Size="14px" OnClientClick='<%# Eval("ExamRollNo","openWindow(""../CVMan/frmShowCanDetailsResult.aspx?ExamRollNo={0}"",""Popup"",1000,1100);") %>'
                                                    Text=" Details ">
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
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
