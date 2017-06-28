<%@ Page Language="VB" Theme="CommonSkin" AutoEventWireup="false" CodeFile="frmViewQuestion.aspx.vb"
    Inherits="frmViewQuestion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>.::HRM: View Question::.</title>
    <link href="Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
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
                <asp:Panel ID="pnlViewQuestion" runat="server" Width="700px" SkinID="pnlInner">
                    <table style="width: 100%;" class="backColor">
                        <tr>
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
                                Question
                            </td>
                            <td align="left">
                                <asp:Label ID="lblQuestion" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td align="left">
                                <asp:Image ID="imgQuestionImage" runat="server" Height="200px"/>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                Option A
                            </td>
                            <td align="left">
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblAnswerOption_A" runat="server" CssClass="label"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Image ID="imgAnswerOption_A_Image" runat="server" Height="80px" Width="80px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                Option B
                            </td>
                            <td align="left">
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblAnswerOption_B" runat="server" CssClass="label"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Image ID="imgAnswerOption_B_Image" runat="server" Height="80px" Width="80px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                Option C
                            </td>
                            <td align="left">
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblAnswerOption_C" runat="server" CssClass="label"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Image ID="imgAnswerOption_C_Image" runat="server" Height="80px" Width="80px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                Option D
                            </td>
                            <td align="left">
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblAnswerOption_D" runat="server" CssClass="label"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Image ID="imgAnswerOption_D_Image" runat="server" Height="80px" Width="80px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                Option E
                            </td>
                            <td align="left">
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblAnswerOption_E" runat="server" CssClass="label"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Image ID="imgAnswerOption_E_Image" runat="server" Height="80px" Width="80px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton ID="lnkbtnViewAnswer" runat="server" CssClass="label">View Answer</asp:LinkButton>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Panel ID="pnlViewOrHideAnswers" runat="server" SkinID="pnlInner">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td align="left" class="label">
                                                Correct Answer
                                            </td>
                                            <td align="left">
                                                <asp:Label ID="lblCorrectAnswer" runat="server" CssClass="label"></asp:Label>
                                                <br />
                                                <asp:Image ID="imgCorrectAnswer" runat="server" Height="80px" Width="80px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="label">
                                                Answer Explanation
                                            </td>
                                            <td align="left">
                                                <asp:Label ID="lblAnswerExplanation" runat="server"></asp:Label>
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
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                <br />
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
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
