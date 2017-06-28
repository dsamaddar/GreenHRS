<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/MasterPage.master" AutoEventWireup="false"
    CodeFile="frmTakeExam.aspx.vb" Inherits="frmTakeExam" Title=".:HRM:Attend Exam:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #TextArea1
        {
            height: 278px;
            width: 751px;
        }
    </style>
    <style type="text/css">
        .protected
        {
            -moz-user-select: none;
            -webkit-user-select: none;
            user-select: none;
        }
    </style>

    <script src="Sources/js/jquery-1.6.1.min.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
    
     function openWindow(windowURL,windowName,windowWidth,windowHeight) {
        var left = (screen.width/2)-(windowWidth/2);
        var top = (screen.height/2)-(windowHeight/2);
        
        window.name = 'parentWnd';
        newWindow = window.open(windowURL,windowName,'top='+ top +',left='+ left +',width='+windowWidth+',height='+windowHeight+',toolbar=0,location=no,directories=0, status=0,menuBar=0,scrollBars=1,resizable=1');
        newWindow.focus();
     }
    
     function disableF5(e) { if (e.which == 116) e.preventDefault(); };
        // To disable f5
        $(document).bind("keydown", disableF5);
        // To re-enable f5
        //$(document).unbind("keydown", disableF5);
        
    
     function onKeyDown() {

    // current pressed key
     var pressedKey = String.fromCharCode(event.keyCode).toLowerCase();

        if (event.ctrlKey && (pressedKey == "c" || 
                        pressedKey == "v")) {
        // <strong class="highlight">disable</strong> key press porcessing
        event.returnValue = false;
         }

        } // onKeyDown
        
    function DisableCopyPaste()
    {
        alert('This functionality has been disabled !');   
        window.clipboardData.clearData('Text'); //for cleaning up the clipboard
        // Cancel default behavior
        event.returnValue = false;
    }

    </script>

    <script language="javascript" type="text/javascript">
       // window.onbeforeunload = function () {return false;}
        //window.onunload = function(){return false;}
        window.history.forward(1);
        
        document.oncontextmenu = function () { // Use document as opposed to window for IE8 compatibility
           alert("This Function Is Not Allowed In ULC JOB Application Process.")
           return false;
        };
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                &nbsp;</td>
            <td>
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Panel ID="pnlExamSelection" runat="server" Width="950px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="4" align="left">
                                <div class="widgettitle">
                                    Select An Exam To Attend</div>
                            </td>
                        </tr>
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
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Select An Exam
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpAvailableQuestionForTheUser" runat="server" AutoPostBack="True"
                                    CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldAvailableExams" runat="server" ControlToValidate="drpAvailableQuestionForTheUser"
                                    ErrorMessage="*" ValidationGroup="VerifyRollNo"></asp:RequiredFieldValidator>
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
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="label">
                                                &nbsp;
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
                                            <td align="left">
                                                <asp:Button ID="btnVerifyRollNo" runat="server" CssClass="styled-button-1" Text="Verify Roll No"
                                                    ValidationGroup="VerifyRollNo" />
                                                &nbsp;<asp:Button ID="btnCancelSelection" runat="server" CssClass="styled-button-1"
                                                    Text="Cancel" />
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
                <asp:Panel ID="pnlInstructions" runat="server" Width="950px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="center">
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:TextBox ID="txtInstructions" runat="server" Height="150px" CssClass="InputTxtBox"
                                    TextMode="MultiLine" Width="100%"></asp:TextBox>
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
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Panel ID="pnlTimer" runat="server" Width="950px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                            </td>
                            <td align="right">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblMessageInfo" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <table>
                                                        <tr>
                                                            <td class="label">
                                                                Time Remaining:
                                                            </td>
                                                            <td style="width: 180px">
                                                                <asp:Label ID="lblTimeRemaining" runat="server" Font-Bold="True" Font-Size="16pt"
                                                                    ForeColor="#CC0000" Width="180px" Height="30px"></asp:Label>
                                                                <asp:Timer ID="timerControl" runat="server" Interval="1000" 
                                                                    OnTick="timerControl_Tick">
                                                                </asp:Timer>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </table>
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
                <asp:Panel ID="pnlLoadQuestion" runat="server" Width="950px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpQuestionStatus" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                    Width="150px">
                                    <asp:ListItem>NotAnswered</asp:ListItem>
                                    <asp:ListItem>Skipped</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="right">
                                <asp:Label ID="lblQuestionRemainingText" runat="server" Font-Bold="True" Text="Question Remaining :"
                                    CssClass="label"></asp:Label>
                                <asp:Label ID="lblQuestionRemaining" runat="server" Font-Bold="True" Font-Size="16pt"
                                    ForeColor="#009933" Width="180px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td align="left" valign="top">
                            </td>
                            <td align="right">
                                <asp:Label ID="lblSkippedQuestionText" runat="server" Font-Bold="True" Text="Skipped Questions   :"
                                    CssClass="label"></asp:Label>
                                <asp:Label ID="lblSkippedQuestionRemaining" runat="server" Font-Bold="True" Font-Size="16pt"
                                    ForeColor="#009933" Width="180px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td align="left" colspan="2" valign="top">
                                <asp:DetailsView ID="dViewLoadQuestion" runat="server" AllowPaging="True" AutoGenerateRows="False"
                                    BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px"
                                    CellPadding="3" CssClass="mGrid" DataSourceID="dataSrcLoadQuestion" GridLines="Vertical"
                                    Height="50px">
                                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <Fields>
                                        <asp:TemplateField HeaderText="QuestionPaperID" Visible="false">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("QuestionPaperID") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("QuestionPaperID") %>' Width="100px"></asp:TextBox>
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
                                                <asp:TextBox ID="TextBox2" runat="server" Width="100px"></asp:TextBox>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblQuestion" runat="server" CssClass="label" Text='<%# Bind("Question") %>'></asp:Label>
                                                <br></br>
                                                <asp:Image ID="imgImages" runat="server" ImageUrl='<%# "~/Sources/Attachments/"+ Eval("Images")%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server" Width="100px"></asp:TextBox>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:RadioButton ID="rdbtnAnswerChoiceA" runat="server" />
                                                <cc1:MutuallyExclusiveCheckBoxExtender ID="rdbtnAnswerChoiceA_MutuallyExclusiveCheckBoxExtender"
                                                    runat="server" Enabled="True" Key="AnswerChoice" TargetControlID="rdbtnAnswerChoiceA">
                                                </cc1:MutuallyExclusiveCheckBoxExtender>
                                                <asp:Label ID="lblAnswer_A" runat="server" Text='<%# Bind("Answer_A") %>'></asp:Label>
                                                <asp:Image ID="imgAnswer_A_Image" runat="server" ImageUrl='<%# "~/Sources/Attachments/"+ Eval("Answer_A_Image")%>' />
                                                <asp:Label ID="lblAnswer_A_Image" runat="server" Text='<%# Eval("Answer_A_Image") %>'
                                                    Visible="false"></asp:Label>
                                                <br></br>
                                                <asp:RadioButton ID="rdbtnAnswerChoiceB" runat="server" />
                                                <cc1:MutuallyExclusiveCheckBoxExtender ID="rdbtnAnswerChoiceB_MutuallyExclusiveCheckBoxExtender"
                                                    runat="server" Enabled="True" Key="AnswerChoice" TargetControlID="rdbtnAnswerChoiceB">
                                                </cc1:MutuallyExclusiveCheckBoxExtender>
                                                <asp:Label ID="lblAnswer_B" runat="server" Text='<%# Bind("Answer_B") %>'></asp:Label>
                                                <asp:Label ID="lblAnswer_B_Image" runat="server" Text='<%# Eval("Answer_B_Image") %>'
                                                    Visible="false"></asp:Label>
                                                <asp:Image ID="imgAnswer_B_Image" runat="server" ImageUrl='<%# "~/Sources/Attachments/"+ Eval("Answer_B_Image")%>' />
                                                <br></br>
                                                <asp:RadioButton ID="rdbtnAnswerChoiceC" runat="server" />
                                                <cc1:MutuallyExclusiveCheckBoxExtender ID="rdbtnAnswerChoiceC_MutuallyExclusiveCheckBoxExtender"
                                                    runat="server" Enabled="True" Key="AnswerChoice" TargetControlID="rdbtnAnswerChoiceC">
                                                </cc1:MutuallyExclusiveCheckBoxExtender>
                                                <asp:Label ID="lblAnswer_C" runat="server" Text='<%# Bind("Answer_C") %>'></asp:Label>
                                                <asp:Label ID="lblAnswer_C_Image" runat="server" Text='<%# Eval("Answer_C_Image") %>'
                                                    Visible="false"></asp:Label>
                                                <asp:Image ID="imgAnswer_C_Image" runat="server" ImageUrl='<%# "~/Sources/Attachments/"+ Eval("Answer_C_Image")%>' />
                                                <br></br>
                                                <asp:RadioButton ID="rdbtnAnswerChoiceD" runat="server" />
                                                <cc1:MutuallyExclusiveCheckBoxExtender ID="rdbtnAnswerChoiceD_MutuallyExclusiveCheckBoxExtender"
                                                    runat="server" Enabled="True" Key="AnswerChoice" TargetControlID="rdbtnAnswerChoiceD">
                                                </cc1:MutuallyExclusiveCheckBoxExtender>
                                                <asp:Label ID="lblAnswer_D" runat="server" Text='<%# Bind("Answer_D") %>'></asp:Label>
                                                <asp:Label ID="lblAnswer_D_Image" runat="server" Text='<%# Eval("Answer_D_Image") %>'
                                                    Visible="false"></asp:Label>
                                                <asp:Image ID="imgAnswer_D_Image" runat="server" ImageUrl='<%# "~/Sources/Attachments/"+ Eval("Answer_D_Image")%>' />
                                                <br></br>
                                                <asp:RadioButton ID="rdbtnAnswerChoiceE" runat="server" Visible="false" />
                                                <cc1:MutuallyExclusiveCheckBoxExtender ID="rdbtnAnswerChoiceE_MutuallyExclusiveCheckBoxExtender"
                                                    runat="server" Enabled="True" Key="AnswerChoice" TargetControlID="rdbtnAnswerChoiceE">
                                                </cc1:MutuallyExclusiveCheckBoxExtender>
                                                <asp:Label ID="lblAnswer_E" runat="server" Text='<%# Bind("Answer_E") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="lblAnswer_E_Image" runat="server" Text='<%# Eval("Answer_E_Image") %>'
                                                    Visible="false"></asp:Label>
                                                <asp:Image ID="imgAnswer_E_Image" runat="server" ImageUrl='<%# "~/Sources/Attachments/"+ Eval("Answer_E_Image")%>'
                                                    Visible="false" />
                                                <br></br>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Fields>
                                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="#DCDCDC" />
                                </asp:DetailsView>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td align="right">
                                <asp:Button ID="btnSkipQuestion" runat="server" CssClass="styled-button-1" Text="Skip" />
                                &nbsp;<asp:Button ID="btnNextQuestion" runat="server" CssClass="styled-button-1"
                                    Text="Next" />
                            </td>
                            <td align="right">
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
