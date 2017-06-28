Imports System.Net
Imports System.IO

Partial Class EmployeeProfile_frmEmpTakeExam
    Inherits System.Web.UI.Page

    Dim QuestionPaperData As New clsQuestionPaperDataAccess()
    Dim ExamData As New clsExamDataAccess()
    Dim CVSelectionData As New clsCVSelectionDataAccess()
    Dim EmployeeData As New clsEmpBasicProfileDataAccess()
    Dim PausedExamStatData As New clsPausedExamStatusDataAccess()

    Shared totalSeconds As Integer = 0
    Shared seconds As Integer = 0
    Shared minutes As Integer = 0
    Shared time As String = ""

    Dim SkippedQuestions As Integer = 0
    Dim QuestionRemaining As Integer = 0
    Shared OnceNotified As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim ToWhomProShow As String = Session("ToWhomProShow")
            getBasicProfileInfo(ToWhomProShow)

            pnlRollNoVerification.Visible = False
            timerControl.Enabled = False
            GetAvailableExamsForUser(Session("UniqueUserID"))

            btnTerminateExam.Visible = False
            pnlTimer.Visible = False
            pnlInstructions.Visible = False
            pnlRollNoVerification.Visible = False
            pnlLoadQuestion.Visible = False
            ShowAttendedExams()
            SkippedQuestions = 0
            QuestionRemaining = 0
            OnceNotified = 0

            txtInstructions.Text = "INSTRUCTION OF EXAM: PLEASE READ IT CAREFULLY " & _
            "Welcome to United Finance. You are about to start the exam. Please shutdown your mobile phone. Our exam contains multiple choice questions. Therefore, you have to select an answer. If you do not know the answer, you may skip the question and proceed to the next one." & _
            "Once you have selected an answer, you cannot correct it. But you can answer skipped questions later on. " & _
            "Duration of your exam will be shown at the top of the screen. It is electronically managed and once your time is up, system will automatically terminate the exam. So finish your exam within your exam time." & _
            "Best of luck  - Human Resources, United Finance."
        End If

        lblMessageInfo.Text = ""
    End Sub

    Protected Sub ShowAttendedExams()
        grdEmpAttendedExams.DataSource = CVSelectionData.fnGetCandidateWiseSummaryResult(Session("ToWhomProShow"))
        grdEmpAttendedExams.DataBind()
    End Sub

    Protected Sub GetAvailableExamsForUser(ByVal UniqueUserID As String)
        Try
            drpAvailableQuestionForTheUser.DataTextField = "ExamName"
            drpAvailableQuestionForTheUser.DataValueField = "ExamID"
            drpAvailableQuestionForTheUser.DataSource = QuestionPaperData.fnGetAvailableExamsByUserID(UniqueUserID)
            drpAvailableQuestionForTheUser.DataBind()

            Dim A As New ListItem
            A.Text = "----- Choose Exam -----"
            A.Value = "N\A"
            drpAvailableQuestionForTheUser.Items.Insert(0, A)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub Timer1_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles timerControl.Tick

        Dim QuestionPaper As New clsQuestionPaper()

        Session("Timer") = Convert.ToInt16(Session("Timer")) - 1
        If Convert.ToInt16(Session("Timer")) <= 0 Then
            lblTimeRemaining.Text = "TimeOut!"

            QuestionPaper.ExamRollNo = txtRollNo.Text
            Dim check As Integer = QuestionPaperData.fnTimeOuts(QuestionPaper)
            If check = 0 Then
                'MessageBox("Error Found")
                lblMessageInfo.ForeColor = Drawing.Color.Red
                lblMessageInfo.Text = "Error Found"
            Else
                MessageBox("Time Out. Thanks For Participation.")
                ClearTimeoutWindow()
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

        Dim Verified As Integer = QuestionPaperData.fnVerifyRollNo(Session("UniqueUserID"), drpAvailableQuestionForTheUser.SelectedValue, Trim(txtRollNo.Text))

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

            '' For Paused Exam 
            Dim pausedExamStat As New clsPausedExamStatus()
            pausedExamStat = PausedExamStatData.fnGetPausedExamStatus(txtRollNo.Text)

            If pausedExamStat Is Nothing Then
                lblQuestionRemaining.Text = Exam.TotalQuestion
                QuestionRemaining = Exam.TotalQuestion
                Session("Timer") = Exam.TotalTime * 60
                timerControl.Enabled = True

                lblSkippedQuestionRemaining.Text = SkippedQuestions
            Else
                lblQuestionRemaining.Text = pausedExamStat.QuestionLeft
                QuestionRemaining = pausedExamStat.QuestionLeft
                Session("Timer") = (Exam.TotalTime - pausedExamStat.TimeTaken) * 60
                timerControl.Enabled = True

                SkippedQuestions = pausedExamStat.SkippedQuestion
                lblSkippedQuestionRemaining.Text = SkippedQuestions
            End If
            '' End For Paused Exam
            pnlAttendedExams.Visible = False

        End If

    End Sub

    Protected Sub btnSkipQuestion_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSkipQuestion.Click

        Dim QuestionPaper As New clsQuestionPaper()
        Dim lblQuestionPaperID As New System.Web.UI.WebControls.Label()

        If dViewLoadQuestion.Rows.Count <= 0 Then
            'MessageBox("No Question is Available To Skip.")
            lblMessageInfo.ForeColor = Drawing.Color.Green
            lblMessageInfo.Text = "No Question is Available To Skip."
            Exit Sub
        End If

        lblQuestionPaperID = dViewLoadQuestion.FindControl("lblQuestionPaperID")

        QuestionPaper.QuestionPaperID = lblQuestionPaperID.Text
        QuestionPaper.ExamRollNo = txtRollNo.Text
        Dim Check As Integer = QuestionPaperData.fnSkipQuestion(QuestionPaper)

        If Check = 0 Then
            'MessageBox("Error Found. Can't be Skipped.")
            lblMessageInfo.ForeColor = Drawing.Color.Red
            lblMessageInfo.Text = "Error Found. Can't be Skipped."
        Else
            'SkippedQuestions += 1
            SkippedQuestions = QuestionPaperData.fnGetRemainingQuestionStatus(txtRollNo.Text, "Skipped")
            lblSkippedQuestionRemaining.Text = SkippedQuestions

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
            'MessageBox("Review Skipped Questions.")
            lblMessageInfo.ForeColor = Drawing.Color.Green
            lblMessageInfo.Text = "Review Skipped Questions."
        End If

    End Sub

    Protected Sub btnNextQuestion_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNextQuestion.Click

        If dViewLoadQuestion.Rows.Count <= 0 Then
            'MessageBox("No Question is Available To Answer.")
            lblMessageInfo.ForeColor = Drawing.Color.Green
            lblMessageInfo.Text = "No Question is Available To Answer."
            Exit Sub
        End If

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
            'MessageBox("Choose Any One From Answer Choice.")
            lblMessageInfo.ForeColor = Drawing.Color.Green
            lblMessageInfo.Text = "Choose Any One From Answer Choice."
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
            'MessageBox("Error Found. While Loading Question.")
            lblMessageInfo.ForeColor = Drawing.Color.Red
            lblMessageInfo.Text = "Error Found. While Loading Question."
            Exit Sub
        Else

            If drpQuestionStatus.SelectedValue = "Skipped" Then
                'SkippedQuestions -= 1
                SkippedQuestions = QuestionPaperData.fnGetRemainingQuestionStatus(txtRollNo.Text, "Skipped")
                lblSkippedQuestionRemaining.Text = SkippedQuestions
                If SkippedQuestions = 0 Then
                    drpQuestionStatus.SelectedValue = "NotAnswered"
                    btnSkipQuestion.Visible = True
                End If
            End If

            '' Check For All Answers Given... 
            'QuestionRemaining -= 1
            QuestionRemaining = QuestionPaperData.fnGetTotalRemainingQuestion(txtRollNo.Text)
            lblQuestionRemaining.Text = QuestionRemaining

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
            btnNextQuestion.Visible = True
            OnceNotified = 1
            'MessageBox("Review Skipped Questions.")
            lblMessageInfo.ForeColor = Drawing.Color.Green
            lblMessageInfo.Text = "Review Skipped Questions."
        End If

        If QuestionRemaining = 0 Then

            '' Finalize Exam
            QuestionPaper.ExamRollNo = txtRollNo.Text
            Check = QuestionPaperData.fnFinalizedExam(QuestionPaper)

            If Check = 0 Then
                'MessageBox("Error Found.")
                lblMessageInfo.ForeColor = Drawing.Color.Red
                lblMessageInfo.Text = "Error Found."
            Else
                ClearExamWindow()
                MessageBox("You Have Completed Exam Successfully.")
                pnlAttendedExams.Visible = True
            End If
        End If

    End Sub

    Protected Sub ClearTimeoutWindow()
        dViewLoadQuestion.DataSourceID = ""
        dViewLoadQuestion.DataBind()

        timerControl.Enabled = False
        GetAvailableExamsForUser(Session("UniqueUserID"))
        btnTerminateExam.Visible = False
        pnlInstructions.Visible = False
        pnlRollNoVerification.Visible = False
        pnlLoadQuestion.Visible = False

    End Sub

    Protected Sub ClearExamWindow()
        dViewLoadQuestion.DataSourceID = ""
        dViewLoadQuestion.DataBind()

        pnlRollNoVerification.Visible = False
        timerControl.Enabled = False
        GetAvailableExamsForUser(Session("LoginUserID"))
        btnTerminateExam.Visible = False
        pnlTimer.Visible = False
        pnlInstructions.Visible = False
        pnlRollNoVerification.Visible = False
        pnlLoadQuestion.Visible = False

        SkippedQuestions = 0
        QuestionRemaining = 0
        OnceNotified = 0
    End Sub

    Protected Sub btnTerminateExam_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTerminateExam.Click
        Dim QuestionPaper As New clsQuestionPaper()
        Dim Check As Integer
        '' Finalize Exam
        Try
            QuestionPaper.ExamRollNo = txtRollNo.Text
            Check = QuestionPaperData.fnFinalizedExam(QuestionPaper)

            If Check = 0 Then
                'MessageBox("Error Found.")
                lblMessageInfo.ForeColor = Drawing.Color.Red
                lblMessageInfo.Text = "Error Found."
            Else
                MessageBox("Exam Terminated Successfully.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub drpQuestionStatus_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpQuestionStatus.SelectedIndexChanged
        If drpQuestionStatus.SelectedValue = "Skipped" Then
            If Convert.ToInt32(lblSkippedQuestionRemaining.Text) = 0 Then
                drpQuestionStatus.SelectedValue = "NotAnswered"
                'MessageBox("No Skipped Question.")
                lblMessageInfo.ForeColor = Drawing.Color.Green
                lblMessageInfo.Text = "No Skipped Question."
                Exit Sub
            End If
            btnSkipQuestion.Visible = False
        ElseIf drpQuestionStatus.SelectedValue = "NotAnswered" Then
            If Convert.ToInt32(lblQuestionRemaining.Text) - Convert.ToInt32(lblSkippedQuestionRemaining.Text) = 0 Then
                drpQuestionStatus.SelectedValue = "Skipped"
                'MessageBox("You Have No (Not Answered) Marked Question.")
                lblMessageInfo.ForeColor = Drawing.Color.Green
                lblMessageInfo.Text = "You Have No (Not Answered) Marked Question."
                Exit Sub
            Else
                btnSkipQuestion.Visible = True
            End If
        Else
            btnSkipQuestion.Visible = True
        End If
    End Sub

    Protected Sub dViewLoadQuestion_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewPageEventArgs) Handles dViewLoadQuestion.PageIndexChanging
        Me.dViewLoadQuestion.PageIndex = e.NewPageIndex
        dViewLoadQuestion.DataSourceID = "dataSrcLoadQuestion"
        dViewLoadQuestion.DataBind()
    End Sub

    Protected Sub getBasicProfileInfo(ByVal EmployeeId As String)
        Dim EmpBasicProfile As New EmpBasicInfo()
        EmpBasicProfile = EmployeeData.fnGetBasicProfile(EmployeeId)

        Dim pnlEmpSummary As Panel
        Master.FindControl("pnlEmpSummary")
        pnlEmpSummary = Master.FindControl("pnlEmpSummary")

        Dim lblEmployeeName, lblEmployeeID, lblOfficialDesignation, lblFunctionalDesignation, lblDepartment, lblSupervisorName, lblEmployeeType, lblServiceLength, lblLocation As Label
        Dim imgEmployee As Image
        Dim hpLnkCanProfile As New HyperLink

        lblEmployeeName = pnlEmpSummary.FindControl("lblEmployeeName")
        lblEmployeeID = pnlEmpSummary.FindControl("lblEmployeeID")
        lblOfficialDesignation = pnlEmpSummary.FindControl("lblOfficialDesignation")
        lblFunctionalDesignation = pnlEmpSummary.FindControl("lblFunctionalDesignation")
        lblDepartment = pnlEmpSummary.FindControl("lblDepartment")
        lblSupervisorName = pnlEmpSummary.FindControl("lblSupervisorName")
        lblEmployeeType = pnlEmpSummary.FindControl("lblEmployeeType")
        lblServiceLength = pnlEmpSummary.FindControl("lblServiceLength")
        lblLocation = pnlEmpSummary.FindControl("lblLocation")
        imgEmployee = pnlEmpSummary.FindControl("imgEmployee")
        hpLnkCanProfile = pnlEmpSummary.FindControl("hpLnkCanProfile")

        lblEmployeeName.Text = EmpBasicProfile.Name
        lblEmployeeID.Text = EmpBasicProfile.EmpCode
        lblOfficialDesignation.Text = EmpBasicProfile.OfficialDesignation
        lblFunctionalDesignation.Text = EmpBasicProfile.FunctionalDesignation
        lblDepartment.Text = EmpBasicProfile.DepartmentName
        lblSupervisorName.Text = EmpBasicProfile.CurrentSupervisor
        lblEmployeeType.Text = EmpBasicProfile.EmployeeTypeName
        lblServiceLength.Text = EmpBasicProfile.ServiceLength
        lblLocation.Text = EmpBasicProfile.ULCBranchName
        hpLnkCanProfile.NavigateUrl = "../RecuitmentCVView.aspx?CandidateID=" + EmpBasicProfile.CandidateID

        If EmpBasicProfile.Attachment = "" Then
            imgEmployee.ImageUrl = ""
        Else
            ShowImage(ConfigurationManager.AppSettings("AttachmentsShow") & EmpBasicProfile.Attachment, "imgEmployee")
        End If

    End Sub

    Protected Sub ShowImage(ByVal UrlStr As String, ByVal ControlName As String)
        Dim tClient As WebClient = New WebClient
        Dim memStrmPic As MemoryStream = New MemoryStream(tClient.DownloadData(UrlStr))
        Dim bytesPic As Byte() = memStrmPic.ToArray()
        Dim base64StringPic As String = Convert.ToBase64String(bytesPic, 0, bytesPic.Length)

        Dim imgCtrl As System.Web.UI.WebControls.Image = Master.FindControl(ControlName)
        imgCtrl.ImageUrl = "data:image/png;base64," & base64StringPic
        memStrmPic.Dispose()
    End Sub

End Class
