
Partial Class frmEmpTakeExam
    Inherits System.Web.UI.Page

    Dim QuestionPaperData As New clsQuestionPaperDataAccess()
    Dim ExamData As New clsExamDataAccess()

    Shared totalSeconds As Integer = 0
    Shared seconds As Integer = 0
    Shared minutes As Integer = 0
    Shared time As String = ""

    Shared SkippedQuestions As Integer = 0
    Shared QuestionRemaining As Integer = 0
    Shared OnceNotified As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then

            pnlRollNoVerification.Visible = False
            timerControl.Enabled = False
            GetAvailableExamsForUser(Session("UniqueUserID"))
            btnTerminateExam.Visible = False
            pnlTimer.Visible = False
            pnlInstructions.Visible = False
            pnlRollNoVerification.Visible = False
            pnlLoadQuestion.Visible = False
            txtInstructions.Text = "You are About To Take the quiz. The Quiz contains multiple choice questions." & _
            " You will not be able to back and change your answer." & _
             " You May not restart the process further.Thanks"

        End If
    End Sub

    Protected Sub GetAvailableExamsForUser(ByVal UniqueUserID As String)
        drpAvailableQuestionForTheUser.DataTextField = "ExamName"
        drpAvailableQuestionForTheUser.DataValueField = "ExamID"
        drpAvailableQuestionForTheUser.DataSource = QuestionPaperData.fnGetAvailableExamsByUserID(UniqueUserID)
        drpAvailableQuestionForTheUser.DataBind()

        Dim A As New ListItem
        A.Text = "----- Choose Exam -----"
        A.Value = "N\A"
        drpAvailableQuestionForTheUser.Items.Insert(0, A)

    End Sub

    Protected Sub Timer1_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles timerControl.Tick

        Dim QuestionPaper As New clsQuestionPaper()

        Session("Timer") = Convert.ToInt16(Session("Timer")) - 1
        If Convert.ToInt16(Session("Timer")) <= 0 Then
            lblTimeRemaining.Text = "TimeOut!"

            QuestionPaper.ExamRollNo = txtRollNo.Text
            Dim check As Integer = QuestionPaperData.fnTimeOuts(QuestionPaper)
            If check = 0 Then
                MessageBox("Error Found")
            Else
                Response.Redirect("frmShowResult.aspx?ExamRollNo=" + txtRollNo.Text + "")
            End If

        Else
            totalSeconds = Convert.ToInt16(Session("Timer"))
            seconds = totalSeconds Mod 60
            minutes = Math.Floor(totalSeconds / 60)
            time = minutes.ToString() + ":" + seconds.ToString()
            lblTimeRemaining.Text = time
        End If

    End Sub

    Protected Sub btnCancelSelection_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelSelection.Click
        pnlRollNoVerification.Visible = False
    End Sub

    Protected Sub drpAvailableQuestionForTheUser_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpAvailableQuestionForTheUser.SelectedIndexChanged
        If drpAvailableQuestionForTheUser.SelectedValue = "N\A" Then
            txtRollNo.Text = ""
            pnlRollNoVerification.Visible = False
            Exit Sub
        Else
            pnlRollNoVerification.Visible = True
        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnVerifyRollNo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnVerifyRollNo.Click

        Dim Verified As Integer = QuestionPaperData.fnVerifyRollNo("smhossain", drpAvailableQuestionForTheUser.SelectedValue, Trim(txtRollNo.Text))

        If Verified = 0 Then
            txtRollNo.Text = ""
            MessageBox("Input Roll No Correctly.")
            Exit Sub
        Else
            pnlInstructions.Visible = True
            pnlRollNoVerification.Visible = False
            pnlExamSelection.Visible = False
        End If

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        pnlExamSelection.Visible = True
        pnlInstructions.Visible = False
    End Sub

    Protected Sub btnStartExam_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnStartExam.Click
        Dim QuestionPaper As New clsQuestionPaper()
        QuestionPaper.ExamRollNo = txtRollNo.Text
        Dim Check As Integer = QuestionPaperData.fnStartQuiz(QuestionPaper)
        Dim Exam As New clsExam()

        If Check = 0 Then
            MessageBox("Can't Start The Quiz.")
        Else
            pnlInstructions.Visible = False
            pnlTimer.Visible = True
            pnlLoadQuestion.Visible = True

            '' Get Exam Related Information.
            Exam.ExamID = drpAvailableQuestionForTheUser.SelectedValue
            Exam = ExamData.fnGetExamParameters(Exam)
            lblQuestionRemaining.Text = Exam.TotalQuestion
            QuestionRemaining = Exam.TotalQuestion
            Session("Timer") = Exam.TotalTime * 60
            timerControl.Enabled = True

            lblSkippedQuestionRemaining.Text = SkippedQuestions

        End If

    End Sub

    Protected Sub btnSkipQuestion_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSkipQuestion.Click

        Dim QuestionPaper As New clsQuestionPaper()

        Dim lblQuestionPaperID As New System.Web.UI.WebControls.Label()

        lblQuestionPaperID = dViewLoadQuestion.FindControl("lblQuestionPaperID")

        QuestionPaper.QuestionPaperID = lblQuestionPaperID.Text
        QuestionPaper.ExamRollNo = txtRollNo.Text
        Dim Check As Integer = QuestionPaperData.fnSkipQuestion(QuestionPaper)


        SkippedQuestions += 1
        lblSkippedQuestionRemaining.Text = SkippedQuestions

        If Check = 0 Then
            MessageBox("Error Found. Can't be Skipped.")
        Else
            dViewLoadQuestion.DataSourceID = "dataSrcLoadQuestion"
            dViewLoadQuestion.DataBind()
        End If

        '' Chq For Remainig Not Answered Question If 0 Then Chq For Skipped Question. 
        Dim NotAnsweredCount As Integer = 0
        NotAnsweredCount = QuestionPaperData.fnGetRemainingQuestionStatus(txtRollNo.Text, "NotAnswered")

        If NotAnsweredCount = 0 And QuestionRemaining <> 0 And OnceNotified = 0 Then
            drpQuestionStatus.SelectedValue = "Skipped"
            btnTerminateExam.Visible = True
            btnSkipQuestion.Visible = False
            OnceNotified = 1
            MessageBox("Review Skipped Questions.")
        End If

    End Sub

    Protected Sub btnNextQuestion_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNextQuestion.Click

        Dim QuestionPaper As New clsQuestionPaper()

        Dim rdbtnAnswerChoiceA As New System.Web.UI.WebControls.RadioButton()
        Dim rdbtnAnswerChoiceB As New System.Web.UI.WebControls.RadioButton()
        Dim rdbtnAnswerChoiceC As New System.Web.UI.WebControls.RadioButton()
        Dim rdbtnAnswerChoiceD As New System.Web.UI.WebControls.RadioButton()
        Dim rdbtnAnswerChoiceE As New System.Web.UI.WebControls.RadioButton()
        Dim lblQuestionPaperID As New System.Web.UI.WebControls.Label()

        Dim lblAnswer_A As New System.Web.UI.WebControls.Label()
        Dim lblAnswer_B As New System.Web.UI.WebControls.Label()
        Dim lblAnswer_C As New System.Web.UI.WebControls.Label()
        Dim lblAnswer_D As New System.Web.UI.WebControls.Label()
        Dim lblAnswer_E As New System.Web.UI.WebControls.Label()

        Dim lblAnswer_A_Image As New System.Web.UI.WebControls.Label()
        Dim lblAnswer_B_Image As New System.Web.UI.WebControls.Label()
        Dim lblAnswer_C_Image As New System.Web.UI.WebControls.Label()
        Dim lblAnswer_D_Image As New System.Web.UI.WebControls.Label()
        Dim lblAnswer_E_Image As New System.Web.UI.WebControls.Label()


        lblQuestionPaperID = dViewLoadQuestion.FindControl("lblQuestionPaperID")

        rdbtnAnswerChoiceA = dViewLoadQuestion.FindControl("rdbtnAnswerChoiceA")
        rdbtnAnswerChoiceB = dViewLoadQuestion.FindControl("rdbtnAnswerChoiceB")
        rdbtnAnswerChoiceC = dViewLoadQuestion.FindControl("rdbtnAnswerChoiceC")
        rdbtnAnswerChoiceD = dViewLoadQuestion.FindControl("rdbtnAnswerChoiceD")
        rdbtnAnswerChoiceE = dViewLoadQuestion.FindControl("rdbtnAnswerChoiceE")

        lblAnswer_A = dViewLoadQuestion.FindControl("lblAnswer_A")
        lblAnswer_B = dViewLoadQuestion.FindControl("lblAnswer_B")
        lblAnswer_C = dViewLoadQuestion.FindControl("lblAnswer_C")
        lblAnswer_D = dViewLoadQuestion.FindControl("lblAnswer_D")
        lblAnswer_E = dViewLoadQuestion.FindControl("lblAnswer_E")

        lblAnswer_A_Image = dViewLoadQuestion.FindControl("lblAnswer_A_Image")
        lblAnswer_B_Image = dViewLoadQuestion.FindControl("lblAnswer_B_Image")
        lblAnswer_C_Image = dViewLoadQuestion.FindControl("lblAnswer_C_Image")
        lblAnswer_D_Image = dViewLoadQuestion.FindControl("lblAnswer_D_Image")
        lblAnswer_E_Image = dViewLoadQuestion.FindControl("lblAnswer_E_Image")

        If rdbtnAnswerChoiceA.Checked = False And rdbtnAnswerChoiceB.Checked = False And rdbtnAnswerChoiceC.Checked = False And rdbtnAnswerChoiceD.Checked = False And rdbtnAnswerChoiceE.Checked = False Then
            MessageBox("Choose Any One From Answer Choice.")
            Exit Sub
        End If

        If rdbtnAnswerChoiceA.Checked = True Then
            QuestionPaper.GivenAnswer = lblAnswer_A.Text
            QuestionPaper.GivenAnswerImage = lblAnswer_A_Image.Text
        ElseIf rdbtnAnswerChoiceB.Checked = True Then
            QuestionPaper.GivenAnswer = lblAnswer_B.Text
            QuestionPaper.GivenAnswerImage = lblAnswer_B_Image.Text
        ElseIf rdbtnAnswerChoiceC.Checked = True Then
            QuestionPaper.GivenAnswer = lblAnswer_C.Text
            QuestionPaper.GivenAnswerImage = lblAnswer_C_Image.Text
        ElseIf rdbtnAnswerChoiceD.Checked = True Then
            QuestionPaper.GivenAnswer = lblAnswer_D.Text
            QuestionPaper.GivenAnswerImage = lblAnswer_D_Image.Text
        ElseIf rdbtnAnswerChoiceE.Checked = True Then
            QuestionPaper.GivenAnswer = lblAnswer_E.Text
            QuestionPaper.GivenAnswerImage = lblAnswer_E_Image.Text
        End If

        QuestionPaper.QuestionPaperID = lblQuestionPaperID.Text
        QuestionPaper.ExamRollNo = txtRollNo.Text

        Dim Check As Integer = QuestionPaperData.fnLoadNextQuestion(QuestionPaper)

        If Check = 0 Then
            MessageBox("Error Found. While Loading Question.")
        Else
            dViewLoadQuestion.DataSourceID = "dataSrcLoadQuestion"
            dViewLoadQuestion.DataBind()
        End If

        '' Check For All Answers Given... 
        QuestionRemaining -= 1
        lblQuestionRemaining.Text = QuestionRemaining

        '' Chq For Remainig Not Answered Question If 0 Then Chq For Skipped Question. 
        Dim NotAnsweredCount As Integer = 0
        NotAnsweredCount = QuestionPaperData.fnGetRemainingQuestionStatus(txtRollNo.Text, "NotAnswered")

        If NotAnsweredCount = 0 And QuestionRemaining <> 0 And OnceNotified = 0 Then
            drpQuestionStatus.SelectedValue = "Skipped"
            btnTerminateExam.Visible = True
            btnSkipQuestion.Visible = False
            btnNextQuestion.Visible = True
            OnceNotified = 1
            MessageBox("Review Skipped Questions.")
        End If

        If QuestionRemaining = 0 Then

            '' Finalize Exam
            QuestionPaper.ExamRollNo = txtRollNo.Text
            Check = QuestionPaperData.fnFinalizedExam(QuestionPaper)

            If Check = 0 Then
                MessageBox("Error Found.")
            Else
                Response.Redirect("frmShowResult.aspx?ExamRollNo=" + txtRollNo.Text + "")
            End If
        End If

    End Sub

    Protected Sub btnTerminateExam_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTerminateExam.Click
        Dim QuestionPaper As New clsQuestionPaper()
        Dim Check As Integer
        '' Finalize Exam
        QuestionPaper.ExamRollNo = txtRollNo.Text
        Check = QuestionPaperData.fnFinalizedExam(QuestionPaper)

        If Check = 0 Then
            MessageBox("Error Found.")
        Else
            Response.Redirect("frmShowResult.aspx?ExamRollNo=" + txtRollNo.Text + "")
        End If
    End Sub

    Protected Sub drpQuestionStatus_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpQuestionStatus.SelectedIndexChanged
        If drpQuestionStatus.SelectedValue = "Skipped" Then
            btnSkipQuestion.Visible = False
        Else
            btnSkipQuestion.Visible = True
        End If
    End Sub

    Protected Sub dViewLoadQuestion_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewPageEventArgs) Handles dViewLoadQuestion.PageIndexChanging
        Me.dViewLoadQuestion.PageIndex = e.NewPageIndex
        dViewLoadQuestion.DataSourceID = "dataSrcLoadQuestion"
        dViewLoadQuestion.DataBind()
    End Sub

End Class
