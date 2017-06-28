<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false" CodeFile="frmEmpTakeExam.aspx.vb" Inherits="frmEmpTakeExam" title=".:HRM:Emp. Attend Exam:." %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #TextArea1
        {
            height: 278px;
            width: 751px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr align="center" >
            <td>
                &nbsp;</td>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center" >
            <td>
                &nbsp;</td>
            <td>
                <asp:Panel ID="pnlExamSelection" runat="server" Width="900px" SkinID="pnlInner">
                    <table style="width:100%;" >
                        <tr>
                            <td style="width:20px">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                Select Exam</td>
                            <td align="left">
                                <asp:DropDownList ID="drpAvailableQuestionForTheUser" runat="server" 
                                    AutoPostBack="True" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldAvailableExams" runat="server" 
                                    ControlToValidate="drpAvailableQuestionForTheUser" ErrorMessage="*" 
                                    ValidationGroup="VerifyRollNo"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td >
                                &nbsp;</td>
                            <td align="left">
                                <asp:Panel ID="pnlRollNoVerification" runat="server" SkinID="pnlInner" 
                                    Width="500px">
                                    <table style="width:100%;">
                                        <tr>
                                            <td style="width:20px">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="label">
                                                &nbsp;</td>
                                            <td align="left" class="label">
                                                Provide Roll No</td>
                                            <td align="left">
                                                <asp:TextBox ID="txtRollNo" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                                &nbsp;<asp:RequiredFieldValidator ID="reqFldRollNo" runat="server" 
                                                    ControlToValidate="txtRollNo" ErrorMessage="*" ValidationGroup="VerifyRollNo"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                            <td align="left">
                                                <asp:Button ID="btnVerifyRollNo" runat="server" CssClass="styled-button-1" 
                                                    Text="Verify Roll No" ValidationGroup="VerifyRollNo" />
                                                &nbsp;<asp:Button ID="btnCancelSelection" runat="server" CssClass="styled-button-1" 
                                                    Text="Cancel" />
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
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
                <asp:Panel ID="pnlInstructions" runat="server" Width="900px" SkinID="pnlInner">
                    <table style="width:100%;" >
                        <tr align="center" >
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:TextBox ID="txtInstructions" runat="server" Height="200px" 
                                    TextMode="MultiLine" Width="600px" CssClass="chkText" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="center" >
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="btnStartExam" runat="server" CssClass="styled-button-1" 
                                    Text="Start" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" 
                                    Text="Cancel" />
                            </td>
                            <td>
                                &nbsp;</td>
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
                <asp:Panel ID="pnlTimer" runat="server" Width="900px" SkinID="pnlInner">
                    <table style="width:100%;" >
                        <tr>
                            <td style="width:20px">
                                &nbsp;</td>
                            <td align="left" class="label">
                                Time Remaining</td>
                            <td align="left">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:Label ID="lblTimeRemaining" runat="server" Font-Bold="True" 
                                            Font-Names="Verdana" Font-Size="20pt" ForeColor="#CC0000" 
                                            Width="300px" Height="30px"></asp:Label>
                                        <asp:Timer ID="timerControl" runat="server" Interval="1000">
                                        </asp:Timer>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
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
                <asp:Panel ID="pnlLoadQuestion" runat="server" Width="900px" SkinID="pnlInner">
                    <table style="width:100%;" class="backColor">
                        <tr>
                            <td>
                                </td>
                            <td align="left" >
                                <asp:DropDownList ID="drpQuestionStatus" runat="server" AutoPostBack="True" 
                                    CssClass="InputTxtBox" Width="100px">
                                    <asp:ListItem>NotAnswered</asp:ListItem>
                                    <asp:ListItem>Skipped</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;<asp:Label ID="lblQuestionRemainingText" runat="server" 
                                    Text="Question Remaining :" Font-Bold="True"></asp:Label>
                                &nbsp;<asp:Label ID="lblQuestionRemaining" runat="server" Font-Bold="True" 
                                    ForeColor="#009933" Font-Size="15pt"></asp:Label>
                                &nbsp;<asp:Label ID="lblSkippedQuestionText" runat="server" Font-Bold="True" 
                                    Text="Skipped Questions :"></asp:Label>
                                &nbsp;<asp:Label ID="lblSkippedQuestionRemaining" runat="server" Font-Bold="True" 
                                    Font-Size="15pt" ForeColor="#009933"></asp:Label>
                                </td>
                            <td>
                                </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left" valign="top" >
                                <asp:DetailsView ID="dViewLoadQuestion" runat="server" Height="50px" 
                                    AutoGenerateRows="False" DataSourceID="dataSrcLoadQuestion" allowpaging="true"
                                    CellPadding="3" GridLines="Horizontal" BackColor="White" BorderColor="#E7E7FF" 
                                    BorderStyle="None" BorderWidth="1px">
                                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                    <Fields>
                                        <asp:TemplateField HeaderText="QuestionPaperID" Visible="false"  >
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("QuestionPaperID") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("QuestionPaperID") %>'></asp:TextBox>
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
                                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblQuestion" runat="server" Text='<%# Bind("Question") %>'></asp:Label>
                                                <br></br>
                                                 <asp:Image ID="imgImages" runat="server" ImageUrl='<%# "~/Sources/Attachments/"+ Eval("Images")%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Answer Choice">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:RadioButton ID="rdbtnAnswerChoiceA" runat="server" />
                                                <cc1:MutuallyExclusiveCheckBoxExtender ID="rdbtnAnswerChoiceA_MutuallyExclusiveCheckBoxExtender" 
                                                    runat="server" Enabled="True" Key="AnswerChoice" TargetControlID="rdbtnAnswerChoiceA">
                                                </cc1:MutuallyExclusiveCheckBoxExtender>
                                                <asp:Label ID="lblAnswer_A" runat="server" Text='<%# Bind("Answer_A") %>'></asp:Label><asp:Image ID="imgAnswer_A_Image" runat="server" ImageUrl='<%# "~/Sources/Attachments/"+ Eval("Answer_A_Image")%>' /> 
                                                 <asp:Label ID="lblAnswer_A_Image" runat="server" Text='<%# Eval("Answer_A_Image") %>' Visible="false" ></asp:Label>
                                                <br>
                                                <br></br>
                                                <asp:RadioButton ID="rdbtnAnswerChoiceB" runat="server" />
                                                <cc1:MutuallyExclusiveCheckBoxExtender ID="rdbtnAnswerChoiceB_MutuallyExclusiveCheckBoxExtender" 
                                                    runat="server" Enabled="True" Key="AnswerChoice" TargetControlID="rdbtnAnswerChoiceB">
                                                </cc1:MutuallyExclusiveCheckBoxExtender>
                                                <asp:Label ID="lblAnswer_B" runat="server" Text='<%# Bind("Answer_B") %>'></asp:Label>
                                                 <asp:Label ID="lblAnswer_B_Image" runat="server" Text='<%# Eval("Answer_B_Image") %>' Visible="false" ></asp:Label>
                                                <asp:Image ID="imgAnswer_B_Image" runat="server" 
                                                    ImageUrl='<%# "~/Sources/Attachments/"+ Eval("Answer_B_Image")%>' />
                                                <br>
                                                <br></br>
                                                <asp:RadioButton ID="rdbtnAnswerChoiceC" runat="server" />
                                                <cc1:MutuallyExclusiveCheckBoxExtender ID="rdbtnAnswerChoiceC_MutuallyExclusiveCheckBoxExtender" 
                                                    runat="server" Enabled="True" Key="AnswerChoice" TargetControlID="rdbtnAnswerChoiceC">
                                                </cc1:MutuallyExclusiveCheckBoxExtender>
                                                <asp:Label ID="lblAnswer_C" runat="server" Text='<%# Bind("Answer_C") %>'></asp:Label>
                                                <asp:Label ID="lblAnswer_C_Image" runat="server" Text='<%# Eval("Answer_C_Image") %>' Visible="false" ></asp:Label>
                                                <asp:Image ID="imgAnswer_C_Image" runat="server" 
                                                    ImageUrl='<%# "~/Sources/Attachments/"+ Eval("Answer_C_Image")%>' />
                                                <br>
                                                <br></br>
                                                <asp:RadioButton ID="rdbtnAnswerChoiceD" runat="server" />
                                                <cc1:MutuallyExclusiveCheckBoxExtender ID="rdbtnAnswerChoiceD_MutuallyExclusiveCheckBoxExtender" 
                                                    runat="server" Enabled="True" Key="AnswerChoice" TargetControlID="rdbtnAnswerChoiceD">
                                                </cc1:MutuallyExclusiveCheckBoxExtender>
                                                <asp:Label ID="lblAnswer_D" runat="server" Text='<%# Bind("Answer_D") %>'></asp:Label>
                                                 <asp:Label ID="lblAnswer_D_Image" runat="server" Text='<%# Eval("Answer_D_Image") %>' Visible="false" ></asp:Label>
                                                <asp:Image ID="imgAnswer_D_Image" runat="server" 
                                                    ImageUrl='<%# "~/Sources/Attachments/"+ Eval("Answer_D_Image")%>' />
                                                <br>
                                                <br></br>
                                                <asp:RadioButton ID="rdbtnAnswerChoiceE" runat="server" Visible="false"  />
                                                <cc1:MutuallyExclusiveCheckBoxExtender ID="rdbtnAnswerChoiceE_MutuallyExclusiveCheckBoxExtender" 
                                                    runat="server" Enabled="True" Key="AnswerChoice" TargetControlID="rdbtnAnswerChoiceE">
                                                </cc1:MutuallyExclusiveCheckBoxExtender>
                                                <asp:Label ID="lblAnswer_E" runat="server" Text='<%# Bind("Answer_E") %>' Visible="false" ></asp:Label>
                                                <asp:Label ID="lblAnswer_E_Image" runat="server" Text='<%# Eval("Answer_E_Image") %>' Visible="false" ></asp:Label>
                                                <asp:Image ID="imgAnswer_E_Image" runat="server" Visible="false" 
                                                    ImageUrl='<%# "~/Sources/Attachments/"+ Eval("Answer_E_Image")%>' />
                                                </br>
                                                </br>
                                                </br>
                                                </br>
                                                
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Fields>
                                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                    <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                    <AlternatingRowStyle BackColor="#F7F7F7" />
                                </asp:DetailsView>
                                <asp:SqlDataSource ID="dataSrcLoadQuestion" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" 
                                    SelectCommand="spLoadQuestion" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txtRollNo" Name="ExamRollNo" 
                                            PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="drpQuestionStatus" Name="Status" 
                                            PropertyName="SelectedValue" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="btnSkipQuestion" runat="server" CssClass="styled-button-1" 
                                    Text="Skip" />
                                &nbsp;<asp:Button ID="btnNextQuestion" runat="server" CssClass="styled-button-1" 
                                    Text="Next" />
                                &nbsp;<asp:Button ID="btnTerminateExam" runat="server" CssClass="styled-button-1" 
                                        OnClientClick="if (!confirm('Are you Sure to Terminate The Exam ?')) return false" 
                                    Text="Terminate" Visible="False" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
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
</asp:Content>

