<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmMakeQuestion.aspx.vb" Inherits="frmMakeQuestion" Title=".::HRM: Make Question::."
    Theme="CommonSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
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

    window.onload = function(){
        var strCook = document.cookie;
        if(strCook.indexOf("!~")!=0){
          var intS = strCook.indexOf("!~");
          var intE = strCook.indexOf("~!");
          var strPos = strCook.substring(intS+2,intE);
          document.getElementById("divgrd").scrollTop = strPos;
        }
      }
      function SetDivPosition(){
        var intY = document.getElementById("divgrd").scrollTop;
        document.title = intY;
        document.cookie = "yPos=!~" + intY + "~!";
      }
      
      window.scrollBy(100,100);
    </script>

    <table style="width: 100%;">
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
            <td>
                &nbsp;
            </td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Panel ID="pnlSubjectChoice" runat="server" Width="800px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="4">
                                <div class="widgettitle">
                                    Define Question</div>
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
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Select Subject
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpSubjectList" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                    Width="300px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Sequence No
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtSequenceNo" runat="server" CssClass="InputTxtBox" Enabled="False"
                                    Width="100px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Active Questions</td>
                            <td align="left">
                                <asp:Label ID="lblNoOfActiveQuestions" runat="server" CssClass="label" 
                                    ForeColor="#009900"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                In Active Questions</td>
                            <td align="left">
                                <asp:Label ID="lblNoOfInactiveQuestions" runat="server" CssClass="label" 
                                    ForeColor="#CC0000"></asp:Label>
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
            <td>
                &nbsp;
            </td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Panel ID="pnlCreateQuestion" runat="server" Width="800px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left">
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
                            <td align="left" class="label">
                                Question
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtQuestion" runat="server" CssClass="InputTxtBox" Height="40px"
                                    TextMode="MultiLine" Width="300px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldQuestion" runat="server" ControlToValidate="txtQuestion"
                                    ErrorMessage="*" ValidationGroup="SubmitQuestion"></asp:RequiredFieldValidator>
                                &nbsp;<asp:CheckBox ID="chkHasPartialMarking" runat="server" AutoPostBack="True"
                                    CssClass="chkText" Text=" Has Partial Marking" />
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
                                Image
                            </td>
                            <td align="left">
                                <asp:FileUpload ID="flUploadQuestionImage" runat="server" CssClass="InputTxtBox"
                                    Width="300px" />
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
                                Option (A)
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtAnswerOption_A" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldAnswerOption_A" runat="server" ControlToValidate="txtAnswerOption_A"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                                &nbsp;<asp:FileUpload ID="flUploadAnswerOption_A_Image" runat="server" CssClass="InputTxtBox" />
                                &nbsp;
                                <asp:DropDownList ID="drpOptA_Partial" runat="server" CssClass="InputTxtBox">
                                    <asp:ListItem Value="0">0%</asp:ListItem>
                                    <asp:ListItem Value="10">10%</asp:ListItem>
                                    <asp:ListItem Value="20">20%</asp:ListItem>
                                    <asp:ListItem Value="30">30%</asp:ListItem>
                                    <asp:ListItem Value="40">40%</asp:ListItem>
                                    <asp:ListItem Value="50">50%</asp:ListItem>
                                    <asp:ListItem Value="60">60%</asp:ListItem>
                                    <asp:ListItem Value="70">70%</asp:ListItem>
                                    <asp:ListItem Value="80">80%</asp:ListItem>
                                    <asp:ListItem Value="90">90%</asp:ListItem>
                                    <asp:ListItem Value="100">100%</asp:ListItem>
                                </asp:DropDownList>
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
                                Option (B)
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtAnswerOption_B" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldAnswerOption_B" runat="server" ControlToValidate="txtAnswerOption_B"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                                &nbsp;<asp:FileUpload ID="flUploadAnswerOption_B_Image" runat="server" CssClass="InputTxtBox" />
                                &nbsp;
                                <asp:DropDownList ID="drpOptB_Partial" runat="server" CssClass="InputTxtBox">
                                    <asp:ListItem Value="0">0%</asp:ListItem>
                                    <asp:ListItem Value="10">10%</asp:ListItem>
                                    <asp:ListItem Value="20">20%</asp:ListItem>
                                    <asp:ListItem Value="30">30%</asp:ListItem>
                                    <asp:ListItem Value="40">40%</asp:ListItem>
                                    <asp:ListItem Value="50">50%</asp:ListItem>
                                    <asp:ListItem Value="60">60%</asp:ListItem>
                                    <asp:ListItem Value="70">70%</asp:ListItem>
                                    <asp:ListItem Value="80">80%</asp:ListItem>
                                    <asp:ListItem Value="90">90%</asp:ListItem>
                                    <asp:ListItem Value="100">100%</asp:ListItem>
                                </asp:DropDownList>
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
                                Option (C)
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtAnswerOption_C" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldAnswerOption_C" runat="server" ControlToValidate="txtAnswerOption_C"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                                &nbsp;<asp:FileUpload ID="flUploadAnswerOption_C_Image" runat="server" CssClass="InputTxtBox" />
                                &nbsp;
                                <asp:DropDownList ID="drpOptC_Partial" runat="server" CssClass="InputTxtBox">
                                    <asp:ListItem Value="0">0%</asp:ListItem>
                                    <asp:ListItem Value="10">10%</asp:ListItem>
                                    <asp:ListItem Value="20">20%</asp:ListItem>
                                    <asp:ListItem Value="30">30%</asp:ListItem>
                                    <asp:ListItem Value="40">40%</asp:ListItem>
                                    <asp:ListItem Value="50">50%</asp:ListItem>
                                    <asp:ListItem Value="60">60%</asp:ListItem>
                                    <asp:ListItem Value="70">70%</asp:ListItem>
                                    <asp:ListItem Value="80">80%</asp:ListItem>
                                    <asp:ListItem Value="90">90%</asp:ListItem>
                                    <asp:ListItem Value="100">100%</asp:ListItem>
                                </asp:DropDownList>
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
                                Option (D)
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtAnswerOption_D" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldAnswerOption_D" runat="server" ControlToValidate="txtAnswerOption_D"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                                &nbsp;<asp:FileUpload ID="flUploadAnswerOption_D_Image" runat="server" CssClass="InputTxtBox" />
                                &nbsp;
                                <asp:DropDownList ID="drpOptD_Partial" runat="server" CssClass="InputTxtBox">
                                    <asp:ListItem Value="0">0%</asp:ListItem>
                                    <asp:ListItem Value="10">10%</asp:ListItem>
                                    <asp:ListItem Value="20">20%</asp:ListItem>
                                    <asp:ListItem Value="30">30%</asp:ListItem>
                                    <asp:ListItem Value="40">40%</asp:ListItem>
                                    <asp:ListItem Value="50">50%</asp:ListItem>
                                    <asp:ListItem Value="60">60%</asp:ListItem>
                                    <asp:ListItem Value="70">70%</asp:ListItem>
                                    <asp:ListItem Value="80">80%</asp:ListItem>
                                    <asp:ListItem Value="90">90%</asp:ListItem>
                                    <asp:ListItem Value="100">100%</asp:ListItem>
                                </asp:DropDownList>
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
                                Option (E)
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtAnswerOption_E" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldAnswerOption_E" runat="server" ControlToValidate="txtAnswerOption_E"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                                &nbsp;<asp:FileUpload ID="flUploadAnswerOption_E_Image" runat="server" CssClass="InputTxtBox" />
                                &nbsp;
                                <asp:DropDownList ID="drpOptE_Partial" runat="server" CssClass="InputTxtBox">
                                    <asp:ListItem Value="0">0%</asp:ListItem>
                                    <asp:ListItem Value="10">10%</asp:ListItem>
                                    <asp:ListItem Value="20">20%</asp:ListItem>
                                    <asp:ListItem Value="30">30%</asp:ListItem>
                                    <asp:ListItem Value="40">40%</asp:ListItem>
                                    <asp:ListItem Value="50">50%</asp:ListItem>
                                    <asp:ListItem Value="60">60%</asp:ListItem>
                                    <asp:ListItem Value="70">70%</asp:ListItem>
                                    <asp:ListItem Value="80">80%</asp:ListItem>
                                    <asp:ListItem Value="90">90%</asp:ListItem>
                                    <asp:ListItem Value="100">100%</asp:ListItem>
                                </asp:DropDownList>
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
                                Correct Answer
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpCorrectAnswer" runat="server" CssClass="InputTxtBox" Width="50px">
                                    <asp:ListItem>A</asp:ListItem>
                                    <asp:ListItem>B</asp:ListItem>
                                    <asp:ListItem>C</asp:ListItem>
                                    <asp:ListItem>D</asp:ListItem>
                                    <asp:ListItem>E</asp:ListItem>
                                </asp:DropDownList>
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
                                Answer Explanation
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtAnswerExplanation" runat="server" CssClass="InputTxtBox" Height="40px"
                                    TextMode="MultiLine" Width="300px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldAnswerExplanation" runat="server" ControlToValidate="txtAnswerExplanation"
                                    ErrorMessage="*" ValidationGroup="SubmitQuestion"></asp:RequiredFieldValidator>
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
                                Difficulty Level
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpDifficultyLevel" runat="server" CssClass="InputTxtBox" Width="50px">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                </asp:DropDownList>
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
                                Is Active
                            </td>
                            <td align="left">
                                <asp:CheckBox ID="chkIsActive" runat="server" CssClass="label" Text="(Check If YES)" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td align="left">
                                <asp:Button ID="btnSubmitQuestion" runat="server" CssClass="styled-button-1" Text="Submit"
                                    ValidationGroup="SubmitQuestion" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" Text="Cancel" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td align="left">
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
            <td>
                &nbsp;
            </td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Panel ID="pnlAvailableQuestions" runat="server" Width="800px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td>
                                <div class="widgettitle">
                                    Available Question</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <div id="divgrd" onscroll="SetDivPosition()" style="max-height: 100%; max-width: 780px;
                                    overflow: auto">
                                    <asp:GridView ID="grdAvailableQuestions" runat="server" AutoGenerateColumns="False"
                                        EmptyDataText="No Question Available" CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="View" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkBtnViewQuestion" runat="server" CausesValidation="False" CommandName="Select"
                                                        OnClientClick='<%# Eval("QuestionID","openWindow(""frmViewQuestion.aspx?QuestionID={0}"",""Popup"",800,800);") %>'
                                                        Text="View" CssClass="linkbtn"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Edit" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkBtnEditQuestion" runat="server" CausesValidation="False" CommandName="Select"
                                                        OnClientClick='<%# Eval("QuestionID","openWindow(""frmEditQuestion.aspx?QuestionID={0}"",""Popup"",800,800);") %>'
                                                        Text="Edit" CssClass="linkbtn"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sl">
                                                <ItemTemplate>
                                                    <font style="font-size: 12px">
                                                        <%#CType(Container, GridViewRow).RowIndex + 1%>
                                                    </font>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="QuestionID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("QuestionID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Question">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Question") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="IsActive">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("IsActive") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DifficultyLevel">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("DifficultyLevel") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="EntryDate">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("EntryDate") %>'></asp:Label>
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
            <td>
                &nbsp;
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript">
        $(document).ready(function(){
            var elem = document.getElementById('<%=grdAvailableQuestions.ClientID%>');
            $(elem).tablesorter();
         }); 
    </script>

</asp:Content>
