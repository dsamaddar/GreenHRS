
Partial Class frmEditQuestion
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
                txtQuestion.Text = Question.Question
                txtAnswerOption_A.Text = Question.Answer_A
                txtAnswerOption_B.Text = Question.Answer_B
                txtAnswerOption_C.Text = Question.Answer_C
                txtAnswerOption_D.Text = Question.Answer_D
                txtAnswerOption_E.Text = Question.Answer_E
                lblCorrectAnswer.Text = Question.CorrectAnswre
                txtAnswerExplanation.Text = Question.AnswerExplanation

                '' Images
                imgQuestionImage.ImageUrl = "~/Sources/Attachments/" + Question.Images
                imgAnswerOption_A_Image.ImageUrl = "~/Sources/Attachments/" + Question.Answer_A_Image
                imgAnswerOption_B_Image.ImageUrl = "~/Sources/Attachments/" + Question.Answer_B_Image
                imgAnswerOption_C_Image.ImageUrl = "~/Sources/Attachments/" + Question.Answer_C_Image
                imgAnswerOption_D_Image.ImageUrl = "~/Sources/Attachments/" + Question.Answer_D_Image
                imgAnswerOption_E_Image.ImageUrl = "~/Sources/Attachments/" + Question.Answer_E_Image
                imgCorrectAnswer.ImageUrl = "~/Sources/Attachments/" + Question.CorrectAnswre_Image

                reqFldAnswerOption_A.ValidationGroup = ""
                reqFldAnswerOption_B.ValidationGroup = ""
                reqFldAnswerOption_C.ValidationGroup = ""
                reqFldAnswerOption_D.ValidationGroup = ""

                drpOptA_Partial.Enabled = False
                drpOptB_Partial.Enabled = False
                drpOptC_Partial.Enabled = False
                drpOptD_Partial.Enabled = False
                drpOptE_Partial.Enabled = False

                If Question.IsActive = True Then
                    chkIsActive.Checked = True
                Else
                    chkIsActive.Checked = False
                End If

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

    Protected Sub btnUpdateQuestion_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateQuestion.Click
        Dim Question As New clsQuestion()
        Dim ImageUpChecker As New clsImageUpLoader()
        Dim Check As Integer = 0

        '' Chq. For Partial Marking
        If chkHasPartialMarking.Checked = True Then
            If drpOptA_Partial.SelectedValue = "0" And drpOptB_Partial.SelectedValue = "0" And drpOptC_Partial.SelectedValue = "0" And drpOptD_Partial.SelectedValue = "0" And drpOptE_Partial.SelectedValue = "0" Then
                MessageBox("Select Partial Marking For Each Answer Choice.")
                Exit Sub
            End If
        End If

        Question.QuestionID = Request.QueryString("QuestionID")
        Question.Question = txtQuestion.Text

        If flUploadQuestionImage.HasFile Then
            ImageUpChecker = fnUploadData(flUploadQuestionImage)

            If ImageUpChecker.Successful = 1 Then
                Question.Images = ImageUpChecker.ImageName
                Question.IsQuestionImagesChanged = True
            Else
                Exit Sub
            End If
        Else
            Question.Images = ""
        End If

        If flUploadAnswerOption_A_Image.HasFile Then
            ImageUpChecker = fnUploadData(flUploadAnswerOption_A_Image)

            If ImageUpChecker.Successful = 1 Then
                Question.Answer_A_Image = ImageUpChecker.ImageName
                Question.IsAnswer_A_Image_Changed = True
            Else
                Exit Sub
            End If
            reqFldAnswerOption_A.ValidationGroup = ""
        Else
            reqFldAnswerOption_A.ValidationGroup = "SubmitQuestion"
            Question.Answer_A_Image = ""
        End If
        Question.Answer_A = txtAnswerOption_A.Text


        If flUploadAnswerOption_B_Image.HasFile Then
            ImageUpChecker = fnUploadData(flUploadAnswerOption_B_Image)

            If ImageUpChecker.Successful = 1 Then
                Question.Answer_B_Image = ImageUpChecker.ImageName
                Question.IsAnswer_B_Image_Changed = True
            Else
                Exit Sub
            End If
            reqFldAnswerOption_B.ValidationGroup = ""
        Else
            reqFldAnswerOption_B.ValidationGroup = "SubmitQuestion"
            Question.Answer_B_Image = ""
        End If
        Question.Answer_B = txtAnswerOption_B.Text


        If flUploadAnswerOption_C_Image.HasFile Then
            ImageUpChecker = fnUploadData(flUploadAnswerOption_C_Image)

            If ImageUpChecker.Successful = 1 Then
                Question.Answer_C_Image = ImageUpChecker.ImageName
                Question.IsAnswer_C_Image_Changed = True
            Else
                Exit Sub
            End If
            reqFldAnswerOption_C.ValidationGroup = ""
        Else
            reqFldAnswerOption_C.ValidationGroup = "SubmitQuestion"
            Question.Answer_C_Image = ""
        End If
        Question.Answer_C = txtAnswerOption_C.Text

        If flUploadAnswerOption_D_Image.HasFile Then
            ImageUpChecker = fnUploadData(flUploadAnswerOption_D_Image)

            If ImageUpChecker.Successful = 1 Then
                Question.Answer_D_Image = ImageUpChecker.ImageName
                Question.IsAnswer_D_Image_Changed = True
            Else
                Exit Sub
            End If
            reqFldAnswerOption_D.ValidationGroup = ""
        Else
            reqFldAnswerOption_D.ValidationGroup = "SubmitQuestion"
            Question.Answer_D_Image = ""
        End If
        Question.Answer_D = txtAnswerOption_D.Text

        Question.Answer_E = txtAnswerOption_E.Text
        If flUploadAnswerOption_E_Image.HasFile Then
            ImageUpChecker = fnUploadData(flUploadAnswerOption_E_Image)

            If ImageUpChecker.Successful = 1 Then
                Question.Answer_E_Image = ImageUpChecker.ImageName
                Question.IsAnswer_E_Image_Changed = True
            Else
                Exit Sub
            End If
        Else
            Question.Answer_E_Image = ""
        End If

        '' Correct Answer
        If drpCorrectAnswer.SelectedValue = "A" Then
            Question.CorrectAnswre = Question.Answer_A
            Question.CorrectAnswre_Image = Question.Answer_A_Image
        ElseIf drpCorrectAnswer.SelectedValue = "B" Then
            Question.CorrectAnswre = Question.Answer_B
            Question.CorrectAnswre_Image = Question.Answer_B_Image
        ElseIf drpCorrectAnswer.SelectedValue = "C" Then
            Question.CorrectAnswre = Question.Answer_C
            Question.CorrectAnswre_Image = Question.Answer_C_Image
        ElseIf drpCorrectAnswer.SelectedValue = "D" Then
            Question.CorrectAnswre = Question.Answer_D
            Question.CorrectAnswre_Image = Question.Answer_D_Image
        ElseIf drpCorrectAnswer.SelectedValue = "E" Then
            If Question.Answer_E = "" Then
                MessageBox("Option 'E' Empty Please Check.")
                Exit Sub
            End If
            Question.CorrectAnswre = Question.Answer_E
            Question.CorrectAnswre_Image = Question.Answer_E_Image
        End If

        Question.IsCorrectAnswre_Image_Changed = False
        Question.AnswerExplanation = txtAnswerExplanation.Text
        Question.DifficultyLevel = Convert.ToInt32(drpDifficultyLevel.SelectedValue)
        If chkHasPartialMarking.Checked = True Then
            Question.HasPartialMarking = True
        Else
            Question.HasPartialMarking = False
        End If

        Question.OptA_Partial = Convert.ToInt32(drpOptA_Partial.SelectedValue)
        Question.OptB_Partial = Convert.ToInt32(drpOptB_Partial.SelectedValue)
        Question.OptC_Partial = Convert.ToInt32(drpOptC_Partial.SelectedValue)
        Question.OptD_Partial = Convert.ToInt32(drpOptD_Partial.SelectedValue)
        Question.OptE_Partial = Convert.ToInt32(drpOptE_Partial.SelectedValue)

        If chkIsActive.Checked = True Then
            Question.IsActive = True
        Else
            Question.IsActive = False
        End If
        Question.EntryBy = Session("LoginUserID")

        Check = QuestionData.fnUpdateQuestions(Question)

        If Check = 1 Then
            MessageBox("Updated Successfully")
        Else
            MessageBox("Error Found")
        End If
    End Sub

    Protected Function fnUploadData(ByVal fileUploader As FileUpload) As clsImageUpLoader

        Dim ImageUploader As New clsImageUpLoader()

        Dim folder As String = ""
        Dim DocExt As String = ""
        Dim DocFullName As String = ""
        Dim DocPrefix As String = ""
        Dim FileSize As Integer = 0
        Dim DocFileName As String = ""
        Try
            folder = Server.MapPath("~/Sources/Attachments/")

            FileSize = fileUploader.PostedFile.ContentLength()
            If FileSize > 512000 Then
                MessageBox("File size should be within 500KB")
                Return Nothing
            End If

            ' DocPrefix = Title.Replace(" ", "")
            DocExt = System.IO.Path.GetExtension(fileUploader.FileName)
            DocPrefix = fileUploader.FileName.Replace(DocExt, "").Replace(" ", "")

            If DocExt = ".jpg" Or DocExt = ".gif" Or DocExt = ".png" Then
                DocFileName = "Q_IMG_" & DateTime.Now.ToString("ddMMyyHHmmss") & "_" & DocPrefix & DocExt
                DocFullName = folder & DocFileName
                fileUploader.SaveAs(DocFullName)
                ImageUploader.ImageName = DocFileName
                ImageUploader.Successful = 1
                Return ImageUploader
            Else
                ImageUploader.ImageName = "Error"
                ImageUploader.Successful = 0
                MessageBox("Select Image File Only")
                Return ImageUploader
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
            Return ImageUploader
        End Try

    End Function

End Class
