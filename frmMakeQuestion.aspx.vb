
Partial Class frmMakeQuestion
    Inherits System.Web.UI.Page

    Dim SubjectData As New clsSubjectsDataAccess()
    Dim QuestionData As New clsQuestionDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If
        If Not IsPostBack Then
            ShowAvailableSubjects()

            If drpSubjectList.Items.Count > 0 Then
                txtSequenceNo.Text = 0
                Dim Subject As New clsSubjects()
                drpSubjectList.SelectedIndex = 0
                Subject.SubjectID = drpSubjectList.SelectedValue
                GetSequenceNo(Subject)

                grdAvailableQuestions.SelectedIndex = -1
                grdAvailableQuestions.DataSource = ""
                grdAvailableQuestions.DataBind()

                grdAvailableQuestions.DataSource = QuestionData.fnGetAllQuestionsBySubID(drpSubjectList.SelectedValue)
                grdAvailableQuestions.DataBind()

            End If

            reqFldAnswerOption_A.ValidationGroup = ""
            reqFldAnswerOption_B.ValidationGroup = ""
            reqFldAnswerOption_C.ValidationGroup = ""
            reqFldAnswerOption_D.ValidationGroup = ""

            drpOptA_Partial.Enabled = False
            drpOptB_Partial.Enabled = False
            drpOptC_Partial.Enabled = False
            drpOptD_Partial.Enabled = False
            drpOptE_Partial.Enabled = False
            chkIsActive.Checked = True

        End If

        If grdAvailableQuestions.Rows.Count > 0 Then
            'This replaces <td> with <th> and adds the scope attribute
            grdAvailableQuestions.UseAccessibleHeader = True
            'This will add the <thead> and <tbody> elements
            grdAvailableQuestions.HeaderRow.TableSection = TableRowSection.TableHeader
            'This adds the <tfoot> element.Remove if you don't have a footer row
            grdAvailableQuestions.FooterRow.TableSection = TableRowSection.TableFooter
        End If

    End Sub

    Protected Sub ShowAvailableSubjects()
        drpSubjectList.DataTextField = "SubjectName"
        drpSubjectList.DataValueField = "SubjectID"
        drpSubjectList.DataSource = SubjectData.fnShowSubjects()
        drpSubjectList.DataBind()
    End Sub

    Protected Sub drpSubjectList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSubjectList.SelectedIndexChanged
        Try
            txtSequenceNo.Text = 0
            Dim Subject As New clsSubjects()
            Subject.SubjectID = drpSubjectList.SelectedValue
            GetSequenceNo(Subject)

            grdAvailableQuestions.SelectedIndex = -1
            grdAvailableQuestions.DataSource = ""
            grdAvailableQuestions.DataBind()

            grdAvailableQuestions.DataSource = QuestionData.fnGetAllQuestionsBySubID(drpSubjectList.SelectedValue)
            grdAvailableQuestions.DataBind()

            If grdAvailableQuestions.Rows.Count > 0 Then
                'This replaces <td> with <th> and adds the scope attribute
                grdAvailableQuestions.UseAccessibleHeader = True
                'This will add the <thead> and <tbody> elements
                grdAvailableQuestions.HeaderRow.TableSection = TableRowSection.TableHeader
                'This adds the <tfoot> element.Remove if you don't have a footer row
                grdAvailableQuestions.FooterRow.TableSection = TableRowSection.TableFooter
            End If

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub GetSequenceNo(ByVal Subject As clsSubjects)
        Dim Ques As New clsQuestion()
        Try
            Ques = SubjectData.fnGetSubwiseQuestionOrder(Subject)

            txtSequenceNo.Text = Ques.QuestionOrder.ToString()
            lblNoOfActiveQuestions.Text = Ques.NoOfActiveQuestion.ToString()
            lblNoOfInactiveQuestions.Text = Ques.NoOfInActiveQuestion.ToString()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnSubmitQuestion_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmitQuestion.Click

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

        Question.SubjectID = drpSubjectList.SelectedValue
        Question.Question = txtQuestion.Text

        If flUploadQuestionImage.HasFile Then
            ImageUpChecker = fnUploadData(flUploadQuestionImage)

            If ImageUpChecker.Successful = 1 Then
                Question.Images = ImageUpChecker.ImageName
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

        Check = QuestionData.fnInsertQuestions(Question)

        If Check = 1 Then
            MessageBox("Inserted Successfully")
            ClearQuestionData()
            GetUpdatedSubjectWiseQuestion()
        Else
            MessageBox("Error Found")
        End If

    End Sub

    Protected Sub GetUpdatedSubjectWiseQuestion()
        Dim Subject As New clsSubjects()
        Subject.SubjectID = drpSubjectList.SelectedValue
        GetSequenceNo(Subject)

        grdAvailableQuestions.SelectedIndex = -1
        grdAvailableQuestions.DataSource = ""
        grdAvailableQuestions.DataBind()

        grdAvailableQuestions.DataSource = QuestionData.fnGetAllQuestionsBySubID(drpSubjectList.SelectedValue)
        grdAvailableQuestions.DataBind()
    End Sub

    Protected Sub ClearQuestionData()
        txtQuestion.Text = ""
        txtAnswerOption_A.Text = ""
        txtAnswerOption_B.Text = ""
        txtAnswerOption_C.Text = ""
        txtAnswerOption_D.Text = ""
        txtAnswerOption_E.Text = ""
        txtAnswerExplanation.Text = ""
        drpCorrectAnswer.SelectedIndex = -1
        drpDifficultyLevel.SelectedIndex = -1
        ' drpSubjectList.SelectedIndex = -1
        Dim Subject As New clsSubjects()
        Subject.SubjectID = drpSubjectList.SelectedValue
        GetSequenceNo(Subject)

        chkHasPartialMarking.Checked = False

        drpOptA_Partial.Enabled = False
        drpOptB_Partial.Enabled = False
        drpOptC_Partial.Enabled = False
        drpOptD_Partial.Enabled = False
        drpOptE_Partial.Enabled = False

        drpOptA_Partial.SelectedIndex = -1
        drpOptB_Partial.SelectedIndex = -1
        drpOptC_Partial.SelectedIndex = -1
        drpOptD_Partial.SelectedIndex = -1
        drpOptE_Partial.SelectedIndex = -1

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

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub chkHasPartialMarking_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkHasPartialMarking.CheckedChanged
        If chkHasPartialMarking.Checked = True Then
            drpOptA_Partial.Enabled = True
            drpOptB_Partial.Enabled = True
            drpOptC_Partial.Enabled = True
            drpOptD_Partial.Enabled = True
            drpOptE_Partial.Enabled = True
        Else
            drpOptA_Partial.Enabled = False
            drpOptB_Partial.Enabled = False
            drpOptC_Partial.Enabled = False
            drpOptD_Partial.Enabled = False
            drpOptE_Partial.Enabled = False
        End If
    End Sub

End Class
