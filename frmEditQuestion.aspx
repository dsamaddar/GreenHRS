<%@ Page Theme="CommonSkin"  Language="VB" AutoEventWireup="false" CodeFile="frmEditQuestion.aspx.vb"
    Inherits="frmEditQuestion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>.:HRM:Edit Question:.</title>
    <link href="Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
    <link href="Sources/css/Title.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
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
        </tr>
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Panel ID="pnlEditQuestion" runat="server" Width="800px" SkinID="pnlInner">
                    <table style="width: 100%;" class="backColor">
                        <tr align="left">
                            <td colspan="4">
                                <div class="widgettitle">Edit Question</div>
                            </td>
                           
                        </tr>
                        <tr>
                            <td style="width:20px">
                                &nbsp;
                            </td>
                            <td style="width:250px">
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
                                Question
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtQuestion" runat="server" Height="50px" TextMode="MultiLine" Width="250px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldQuestion" runat="server" 
                                    ControlToValidate="txtQuestion" ErrorMessage="*" 
                                    ValidationGroup="SubmitQuestion"></asp:RequiredFieldValidator>
                                <asp:CheckBox ID="chkHasPartialMarking" runat="server" AutoPostBack="True" 
                                    CssClass="chkText" Text="Has Partial Marking" />
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
                                <asp:Image ID="imgQuestionImage" runat="server" Height="200px" />
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
                                Option A
                            </td>
                            <td align="left">
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtAnswerOption_A" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                            &nbsp;<asp:RequiredFieldValidator ID="reqFldAnswerOption_A" runat="server" 
                                                ControlToValidate="txtAnswerOption_A" ErrorMessage="*"></asp:RequiredFieldValidator>
                                            <br />
                                            <asp:FileUpload ID="flUploadAnswerOption_A_Image" runat="server" CssClass="InputTxtBox" />
                                        </td>
                                        <td>
                                            <asp:Image ID="imgAnswerOption_A_Image" runat="server" Height="80px" Width="80px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="left">
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
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Option B
                            </td>
                            <td align="left">
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            <br />
                                            <asp:TextBox ID="txtAnswerOption_B" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="reqFldAnswerOption_B" runat="server" 
                                                ControlToValidate="txtAnswerOption_B" ErrorMessage="*"></asp:RequiredFieldValidator>
                                            <br />
                                            <asp:FileUpload ID="flUploadAnswerOption_B_Image" runat="server" CssClass="InputTxtBox" />
                                        </td>
                                        <td>
                                            <asp:Image ID="imgAnswerOption_B_Image" runat="server" Height="80px" Width="80px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="left">
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
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Option C
                            </td>
                            <td align="left">
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtAnswerOption_C" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="reqFldAnswerOption_C" runat="server" 
                                                ControlToValidate="txtAnswerOption_C" ErrorMessage="*"></asp:RequiredFieldValidator>
                                            <br />
                                            <asp:FileUpload ID="flUploadAnswerOption_C_Image" runat="server" CssClass="InputTxtBox" />
                                        </td>
                                        <td>
                                            <asp:Image ID="imgAnswerOption_C_Image" runat="server" Height="80px" Width="80px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="left">
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
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Option D
                            </td>
                            <td align="left">
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtAnswerOption_D" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="reqFldAnswerOption_D" runat="server" 
                                                ControlToValidate="txtAnswerOption_D" ErrorMessage="*"></asp:RequiredFieldValidator>
                                            <br />
                                            <asp:FileUpload ID="flUploadAnswerOption_D_Image" runat="server" CssClass="InputTxtBox" />
                                        </td>
                                        <td>
                                            <asp:Image ID="imgAnswerOption_D_Image" runat="server" Height="80px" Width="80px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="left">
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
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                Option E
                            </td>
                            <td align="left">
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtAnswerOption_E" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="reqFldAnswerOption_E" runat="server" 
                                                ControlToValidate="txtAnswerOption_E" ErrorMessage="*"></asp:RequiredFieldValidator>
                                            <br />
                                            <asp:FileUpload ID="flUploadAnswerOption_E_Image" runat="server" CssClass="InputTxtBox" />
                                        </td>
                                        <td>
                                            <asp:Image ID="imgAnswerOption_E_Image" runat="server" Height="80px" Width="80px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="left">
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
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Correct Answer</td>
                            <td align="left">
                                <asp:DropDownList ID="drpCorrectAnswer" runat="server" CssClass="InputTxtBox" 
                                    Width="50px">
                                    <asp:ListItem>A</asp:ListItem>
                                    <asp:ListItem>B</asp:ListItem>
                                    <asp:ListItem>C</asp:ListItem>
                                    <asp:ListItem>D</asp:ListItem>
                                    <asp:ListItem>E</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                                <asp:Label ID="lblCorrectAnswer" runat="server" CssClass="label"></asp:Label>
                                <br />
                                <asp:Image ID="imgCorrectAnswer" runat="server" Height="80px" Width="80px" />
                            </td>
                            <td align="left">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Answer Explanation</td>
                            <td align="left">
                                <asp:TextBox ID="txtAnswerExplanation" runat="server" CssClass="InputTxtBox" 
                                    Height="40px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFldAnswerExplanation" runat="server" 
                                    ControlToValidate="txtAnswerExplanation" ErrorMessage="*" 
                                    ValidationGroup="SubmitQuestion"></asp:RequiredFieldValidator>
                                <br />
                            </td>
                            <td align="left">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                                Difficulty Level
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpDifficultyLevel" runat="server" CssClass="InputTxtBox" 
                                    Width="50px">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="left">
                            </td>
                        </tr>
                        <tr >
                            <td align="left" class="label">
                                </td>
                            <td align="left" class="label">
                                Is Active</td>
                            <td align="left">
                                <asp:CheckBox ID="chkIsActive" runat="server" CssClass="label" 
                                    Text="(Check If YES)" />
                            </td>
                            <td align="left">
                            </td>
                        </tr>
                        <tr align="left" >
                            <td>
                                &nbsp;</td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnUpdateQuestion" runat="server" CssClass="styled-button-1" 
                                    Text="Update" ValidationGroup="SubmitQuestion" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
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
    </form>
</body>
</html>
