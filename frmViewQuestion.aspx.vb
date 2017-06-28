
Partial Class frmViewQuestion
    Inherits System.Web.UI.Page

    Dim QuestionData As New clsQuestionDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If
        If Not IsPostBack Then
            Try
                Dim Question As New clsQuestion()

                Question.QuestionID = Request.QueryString("QuestionID")

                Question = QuestionData.fnGetQuestionInfoByQuestionID(Question)

                '' Text
                lblQuestion.Text = Question.Question
                lblAnswerOption_A.Text = Question.Answer_A
                lblAnswerOption_B.Text = Question.Answer_B
                lblAnswerOption_C.Text = Question.Answer_C
                lblAnswerOption_D.Text = Question.Answer_D
                lblAnswerOption_E.Text = Question.Answer_E
                lblCorrectAnswer.Text = Question.CorrectAnswre
                lblAnswerExplanation.Text = Question.AnswerExplanation

                '' Images
                imgQuestionImage.ImageUrl = "~/Sources/Attachments/" + Question.Images
                imgAnswerOption_A_Image.ImageUrl = "~/Sources/Attachments/" + Question.Answer_A_Image
                imgAnswerOption_B_Image.ImageUrl = "~/Sources/Attachments/" + Question.Answer_B_Image
                imgAnswerOption_C_Image.ImageUrl = "~/Sources/Attachments/" + Question.Answer_C_Image
                imgAnswerOption_D_Image.ImageUrl = "~/Sources/Attachments/" + Question.Answer_D_Image
                imgAnswerOption_E_Image.ImageUrl = "~/Sources/Attachments/" + Question.Answer_E_Image
                imgCorrectAnswer.ImageUrl = "~/Sources/Attachments/" + Question.CorrectAnswre_Image

                pnlViewOrHideAnswers.Visible = False

            Catch ex As Exception
                MessageBox(ex.Message)
            End Try

        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub lnkbtnViewAnswer_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkbtnViewAnswer.Click
        If lnkbtnViewAnswer.Text = "View Answer" Then
            pnlViewOrHideAnswers.Visible = True
            lnkbtnViewAnswer.Text = "Hide Answer"
        Else
            lnkbtnViewAnswer.Text = "View Answer"
            pnlViewOrHideAnswers.Visible = False
        End If
    End Sub
End Class
