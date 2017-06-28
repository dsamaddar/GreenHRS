Imports System

Partial Class frmMakingExamPaper
    Inherits System.Web.UI.Page

    Dim ExamData As New clsExamDataAccess()
    Dim QuestionData As New clsQuestionDataAccess()
    Dim ExamPaperData As New clsExamPaperDataAccess()
    Shared AllocationRemaining As Double = 0
    Shared AllocatedQuestionRemaining As Integer = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If
        If Not IsPostBack Then
            GetAvailableExams()
            btnFinalizeExamPaper.Enabled = False
            btnAddQuestion.Enabled = False
        End If
    End Sub

    Protected Sub GetAvailableExams()
        drpAvailableExams.DataTextField = "ExamName"
        drpAvailableExams.DataValueField = "ExamID"
        drpAvailableExams.DataSource = ExamData.fnGetAvailableExams()
        drpAvailableExams.DataBind()

        Dim A As New ListItem
        A.Text = "----- Choose Exam -----"
        A.Value = "N\A"
        drpAvailableExams.Items.Insert(0, A)

    End Sub

    Protected Sub drpAvailableExams_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpAvailableExams.SelectedIndexChanged

        If drpAvailableExams.SelectedValue = "N\A" Then
            ClearExamPaperDefinition()
            btnAddQuestion.Enabled = False
            btnFinalizeExamPaper.Enabled = False
            Exit Sub
        End If

        Try
            GetExamWiseSubjects(drpAvailableExams.SelectedValue)

            Dim Exam As New clsExam()
            Exam.ExamID = drpAvailableExams.SelectedValue
            Exam = ExamData.fnGetExamParameters(Exam)

            lblTotalQuestion.Text = Exam.TotalQuestion
            lblNumberAssignmentRemaining.Text = Exam.AllocationRemaining
            lblAllocatedQuestionRemaining.Text = Exam.AllocatedQuestionRemaining
            AllocatedQuestionRemaining = Exam.AllocatedQuestionRemaining
            AllocationRemaining = Exam.AllocationRemaining
            lblTotalMarks.Text = Exam.TotalMarks
            lblTotalTime.Text = Exam.TotalTime

            '' Get Subject wise Assignment
            GetExamWiseSubjectsAssignment(drpAvailableExams.SelectedValue)

            If AllocatedQuestionRemaining = 0 And AllocationRemaining = 0 Then
                btnFinalizeExamPaper.Enabled = True
            End If

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try


    End Sub

    Protected Sub GetExamWiseSubjectsAssignment(ByVal ExamID As String)
        bulletSubjectWiseQuestion.DataTextField = "SubjectName"
        bulletSubjectWiseQuestion.DataValueField = "ExamWiseSubjectID"
        bulletSubjectWiseQuestion.DataSource = ExamData.fnGetExamWiseSubjectAssignment(ExamID)
        bulletSubjectWiseQuestion.DataBind()
    End Sub

    Protected Sub GetExamWiseSubjects(ByVal ExamID As String)
        rdbtnSubjectList.DataTextField = "SubjectName"
        rdbtnSubjectList.DataValueField = "ExamWiseSubjectID"
        rdbtnSubjectList.DataSource = ExamData.fnGetExamWiseSubjectStatus(ExamID)
        rdbtnSubjectList.DataBind()
    End Sub

    Protected Sub ClearExamPaperDefinition()
        rdbtnSubjectList.DataSource = ""
        rdbtnSubjectList.DataBind()

        lblNumberAssignmentRemaining.Text = "0"
        lblTotalMarks.Text = "0"
        lblTotalQuestion.Text = "0"
        lblTotalTime.Text = "0"
        lblAllocatedQuestionRemaining.Text = "0"

        bulletSubjectWiseQuestion.DataSource = ""
        bulletSubjectWiseQuestion.DataBind()

        grdChooseQuestion.DataSource = ""
        grdChooseQuestion.DataBind()

        drpAvailableExams.SelectedIndex = -1
        btnFinalizeExamPaper.Enabled = False
    End Sub

    Protected Sub rdbtnSubjectList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdbtnSubjectList.SelectedIndexChanged
        Try
            grdChooseQuestion.SelectedIndex = -1

            grdChooseQuestion.DataSource = QuestionData.fnGetQuestionsByEWSID(rdbtnSubjectList.SelectedValue)
            grdChooseQuestion.DataBind()

            If grdChooseQuestion.Rows.Count <= 0 Then
                MessageBox("No Question Available To Select")
                btnAddQuestion.Enabled = False
            Else
                btnAddQuestion.Enabled = True
            End If

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnAddQuestion_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddQuestion.Click

        Dim lblQuestionID As New System.Web.UI.WebControls.Label()
        Dim lblPositiveMarkingPerQuestion As New System.Web.UI.WebControls.Label()
        Dim chkSelectQuestion As New System.Web.UI.WebControls.CheckBox
        Dim ExamPaper As New clsExamPaper()
        Dim Check As Integer = 0
        Try
            For Each rw As GridViewRow In grdChooseQuestion.Rows
                lblQuestionID = rw.FindControl("lblQuestionID")
                lblPositiveMarkingPerQuestion = rw.FindControl("lblPositiveMarkingPerQuestion")
                chkSelectQuestion = rw.FindControl("chkSelectQuestion")

                If chkSelectQuestion.Checked = True Then

                    If AllocatedQuestionRemaining - 1 < 0 Then
                        MessageBox("Maximum Allowable Question For This Exam Is " + lblTotalQuestion.Text)
                        chkSelectQuestion.Checked = False
                        Exit Sub
                    End If

                    If AllocationRemaining - Convert.ToDouble(lblPositiveMarkingPerQuestion.Text) < 0 Then
                        MessageBox("You Can't Add This Question.")
                        chkSelectQuestion.Checked = False
                        Exit Sub
                    Else
                        AllocationRemaining -= Convert.ToDouble(lblPositiveMarkingPerQuestion.Text)
                        lblNumberAssignmentRemaining.Text = AllocationRemaining

                        AllocatedQuestionRemaining -= 1
                        lblAllocatedQuestionRemaining.Text = AllocatedQuestionRemaining

                        ExamPaper.QuestionID = lblQuestionID.Text
                        ExamPaper.ExamWiseSubjectID = rdbtnSubjectList.SelectedValue
                        ExamPaper.EntryBy = Session("LoginUserID")

                        Check = ExamPaperData.fnInsertExamPaper(ExamPaper)

                        If Check = 0 Then
                            MessageBox("Error Found.")
                        Else
                            MessageBox("Question Allocated.")
                            If AllocatedQuestionRemaining = 0 And AllocationRemaining = 0 Then
                                btnFinalizeExamPaper.Enabled = True
                            End If
                        End If

                    End If
                End If
            Next

            GetExamWiseSubjects(drpAvailableExams.SelectedValue)

            '' Get Subject wise Assignment
            GetExamWiseSubjectsAssignment(drpAvailableExams.SelectedValue)

            grdChooseQuestion.DataSource = QuestionData.fnGetQuestionsByEWSID(rdbtnSubjectList.SelectedValue)
            grdChooseQuestion.DataBind()


        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearExamPaperDefinition()
    End Sub

    Protected Sub grdChooseQuestion_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdChooseQuestion.RowCreated



    End Sub

    Protected Sub grdChooseQuestion_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdChooseQuestion.RowDataBound

        Dim lblCorrectPercentage As New System.Web.UI.WebControls.Label()
        Dim lblWrongPercentage As New System.Web.UI.WebControls.Label()
        Dim lblNotAnsweredPercentage As New System.Web.UI.WebControls.Label()
        Dim lblSkippedPercentage As New System.Web.UI.WebControls.Label()

        Dim lblCorrect As New System.Web.UI.WebControls.Label()
        Dim lblWrong As New System.Web.UI.WebControls.Label()
        Dim lblNotAnswered As New System.Web.UI.WebControls.Label()
        Dim lblSkipped As New System.Web.UI.WebControls.Label()

        For Each rw As GridViewRow In grdChooseQuestion.Rows
            lblCorrect = rw.FindControl("lblCorrect")
            lblWrong = rw.FindControl("lblWrong")
            lblNotAnswered = rw.FindControl("lblNotAnswered")
            lblSkipped = rw.FindControl("lblSkipped")

            lblCorrectPercentage = rw.FindControl("lblCorrectPercentage")
            lblWrongPercentage = rw.FindControl("lblWrongPercentage")
            lblNotAnsweredPercentage = rw.FindControl("lblNotAnsweredPercentage")
            lblSkippedPercentage = rw.FindControl("lblSkippedPercentage")

            lblCorrectPercentage.Width = Convert.ToDouble(lblCorrect.Text)
            lblWrongPercentage.Width = Convert.ToDouble(lblWrong.Text)
            lblNotAnsweredPercentage.Width = Convert.ToDouble(lblNotAnswered.Text)
            lblSkippedPercentage.Width = Convert.ToDouble(lblSkipped.Text)
        Next

    End Sub

    Protected Sub btnFinalizeExamPaper_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFinalizeExamPaper.Click

        If drpAvailableExams.SelectedValue = "N\A" Then
            MessageBox("Select Valid Exam")
            Exit Sub
        End If

        If AllocatedQuestionRemaining <> 0 Or AllocationRemaining <> 0 Then
            MessageBox("Check Question And Marks Allocation.")
            Exit Sub
        End If

        Dim Exam As New clsExam()

        Exam.ExamID = drpAvailableExams.SelectedValue

        Dim check As Integer = ExamData.fnFinalizeExam(Exam)

        If check = 1 Then
            ClearExamPaperDefinition()
            MessageBox("Submitted Successfully.")
        Else
            MessageBox("Error Found.")
        End If
    End Sub

End Class
