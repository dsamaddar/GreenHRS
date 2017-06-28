<%@ Page Language="VB" Theme="CommonSkin"  MasterPageFile="~/HRMMaster.master" AutoEventWireup="false" CodeFile="frmMakingExamPaper.aspx.vb" Inherits="frmMakingExamPaper" title=".:HRM : Making Exam Paper:." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
    <link href="Sources/css/GridViewStyle.css" rel="stylesheet" type="text/css" />
    
    <script language="JavaScript" type="text/javascript" >
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
                <asp:Panel ID="pnlHeaderSelection" runat="server" Width="950px" 
                    SkinID="pnlInner" >
                    <table style="width:100%;">
                        <tr>
                            <td colspan="4" align="left">
                                <div class="widgettitle">Make Exam Paper</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:20px">
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                </td>
                            <td align="left" class="label" >
                                Available Exams</td>
                            <td align="left">
                                <asp:DropDownList ID="drpAvailableExams" runat="server" AutoPostBack="True" 
                                    CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
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
                <asp:Panel ID="pnlExamParameter" runat="server" SkinID="pnlInner" Width="950px">
                    <table style="width:100%;">
                        <tr>
                            <td align="left" class="label" style="width:20px">
                                &nbsp;</td>
                            <td align="left" class="label"  >
                                Total Marks</td>
                            <td align="left">
                                <asp:Label ID="lblTotalMarks" runat="server" Font-Size="14pt" 
                                    ForeColor="#009900" Font-Bold="True" Font-Names="Verdana"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left" class="label">
                                Number Assignment (Rem)</td>
                            <td align="left">
                                <asp:Label ID="lblNumberAssignmentRemaining" runat="server" Font-Size="14pt" 
                                    ForeColor="Red" Font-Bold="True" Font-Names="Verdana"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                Total Time (Min)</td>
                            <td align="left">
                                <asp:Label ID="lblTotalTime" runat="server" Font-Size="14pt" 
                                    ForeColor="#009900" Font-Bold="True" Font-Names="Verdana"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left" class="label">
                                Total Question</td>
                            <td align="left">
                                <asp:Label ID="lblTotalQuestion" runat="server" Font-Size="14pt" 
                                    ForeColor="#009900" Font-Bold="True" Font-Names="Verdana"></asp:Label>
                            </td>
                            <td align="left" class="label">
                                Allocated Question (Rem)</td>
                            <td align="left" class="label">
                                <asp:Label ID="lblAllocatedQuestionRemaining" runat="server" Font-Size="14pt" 
                                    ForeColor="Red" Font-Bold="True" Font-Names="Verdana" Width="120px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label" colspan="3">
                                <asp:BulletedList ID="bulletSubjectWiseQuestion" runat="server" 
                                    DisplayMode="HyperLink" Width="200px" BackColor="#D5EAFF" 
                                    BorderColor="#666699" BulletImageUrl="~/Sources/images/bulletImage.gif" 
                                    BulletStyle="CustomImage">
                                </asp:BulletedList>
                            </td>
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
                <asp:Panel ID="pnlQuestionSelection" runat="server" Width="950px" 
                    SkinID="pnlInner" >
                    <table style="width:auto;">
                        <tr>
                            <td align="left" valign="top"  >
                                <asp:RadioButtonList ID="rdbtnSubjectList" runat="server" AutoPostBack="True" 
                                    CssClass="label" Width="200px">
                                </asp:RadioButtonList>
                            </td>
                            <td align="left" >
                                <div id="divgrd" onscroll="SetDivPosition()" style="max-height:400px;max-width:730px;overflow:auto">
                                <asp:GridView ID="grdChooseQuestion" runat="server" GridLines="None" AutoGenerateColumns="False" >
                                    <Columns>
                                        <asp:TemplateField HeaderText="Check">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelectQuestion" runat="server" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:CheckBox ID="CheckBox1" runat="server" />
                                            </EditItemTemplate>
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
                                        <asp:TemplateField HeaderText="EntryDate">
                                            <ItemTemplate>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("EntryDate") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("EntryDate") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Correct/Wrong/Not-Ans/Skip" >
                                            <ItemTemplate>
                                                <table style="width:100px;" cellspacing="0">
                                                    <tr>
                                                        <td  colspan="0" rowspan="0" 
                                                            style="background-position: inherit; background-color:#B9FFB9" dir="rtl">
                                                            <asp:Label ID="lblCorrectPercentage" BackColor="#B9FFB9" runat="server" Height="20px" ></asp:Label>
                                                        </td>
                                                        <td style="background-color:#FF9D9D" colspan="0" rowspan="0" >
                                                            <asp:Label ID="lblWrongPercentage" BackColor="#FF9D9D" runat="server" Height="20px" ></asp:Label>
                                                        </td>
                                                        <td style="background-color:#C6C6D9" colspan="0" rowspan="0" >
                                                            <asp:Label ID="lblNotAnsweredPercentage" BackColor="#C6C6D9" runat="server" Height="20px"></asp:Label>
                                                        </td>
                                                        <td style="background-color:#E493FF" colspan="0" rowspan="0" >
                                                            <asp:Label ID="lblSkippedPercentage" BackColor="#E493FF" runat="server" Height="20px" ></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="View" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" CssClass="linkbtn" runat="server" CausesValidation="False" 
                                                    CommandName="Select" Text="View" OnClientClick='<%# Eval("QuestionID","openWindow(""frmViewQuestion.aspx?QuestionID={0}"",""Popup"",800,800);") %>'  ></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Correct" Visible="false" >
                                            <ItemTemplate>
                                                <asp:Label ID="lblCorrect" runat="server" Text='<%# Bind("Correct") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Correct") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Wrong"  Visible="false" >
                                            <ItemTemplate>
                                                <asp:Label ID="lblWrong" runat="server" Text='<%# Bind("Wrong") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Wrong") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="NotAnswered"  Visible="false" >
                                            <ItemTemplate>
                                                <asp:Label ID="lblNotAnswered" runat="server" Text='<%# Bind("NotAnswered") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("NotAnswered") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Skipped"  Visible="false" >
                                            <ItemTemplate>
                                                <asp:Label ID="lblSkipped" runat="server" Text='<%# Bind("Skipped") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Skipped") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="PositiveMarkingPerQuestion" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPositiveMarkingPerQuestion" runat="server" 
                                                    Text='<%# Bind("PositiveMarkingPerQuestion") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox10" runat="server" 
                                                    Text='<%# Bind("PositiveMarkingPerQuestion") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left" >
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="left">
                                <asp:Button ID="btnAddQuestion" runat="server" CssClass="styled-button-1" 
                                    Text="ADD Question" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" 
                                    Text="Cancel" />
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
                <asp:Panel ID="pnlSubmit" runat="server" SkinID="pnlInner" Width="950px">
                    <table style="width:100%;">
                        <tr align="center" >
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="center">
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="btnFinalizeExamPaper" runat="server" CssClass="styled-button-1" 
                                    Text="Finalize Paper" />
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="center">
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

