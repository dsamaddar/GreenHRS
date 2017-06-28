Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.OleDb
Imports System.Data.Common
Imports System.IO
Imports System.Math
Imports System.Configuration
Imports System.Web.UI

Partial Class frmExamDefinition
    Inherits System.Web.UI.Page

    Dim GradSysTypeData As New clsGradSysTypeDataAccess()
    Dim GradingSystemData As New clsGradingSystemDataAccess()
    Dim SubjectData As New clsSubjectsDataAccess()
    Dim ExamData As New clsExamDataAccess()
    Dim QuestionData As New clsQuestionDataAccess()

    Protected Function FormatSubjects() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("SubjectID", System.Type.GetType("System.String"))
        dt.Columns.Add("SubjectName", System.Type.GetType("System.String"))
        dt.Columns.Add("PositiveMarkingPerQuestion", System.Type.GetType("System.Double"))
        dt.Columns.Add("NegativeMarkingPerQuestion", System.Type.GetType("System.Double"))
        dt.Columns.Add("SkipMarkingPerQuestion", System.Type.GetType("System.Double"))
        dt.Columns.Add("NotAnsweredMarkingPerQuestion", System.Type.GetType("System.Double"))
        dt.Columns.Add("QuePickPercentage", System.Type.GetType("System.Double"))
        dt.Columns.Add("AllocatedQuestion", System.Type.GetType("System.Double"))
        dt.Columns.Add("DifficultyLevel", System.Type.GetType("System.String"))
        Return dt
    End Function

    Protected Function FormatExamWiseGrading() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("FromPercentage", System.Type.GetType("System.Double"))
        dt.Columns.Add("ToPercentage", System.Type.GetType("System.Double"))
        dt.Columns.Add("LetterGrade", System.Type.GetType("System.String"))
        dt.Columns.Add("GradePoint", System.Type.GetType("System.Double"))
        dt.Columns.Add("GradingExplanation", System.Type.GetType("System.String"))
        Return dt
    End Function

    Protected Sub rdbtnGradingSystem_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdbtnGradingSystem.SelectedIndexChanged

        If rdbtnGradingSystem.SelectedValue = "Customized" Then
            pnlCustomizedGrading.Visible = True
            drpGradSysType.Visible = False

            grdDefaultGradingSystem.DataSource = ""
            grdDefaultGradingSystem.DataBind()

        Else
            drpGradSysType.Visible = True
            pnlCustomizedGrading.Visible = False
        End If
    End Sub

    Protected Sub ShowGradSysType()
        drpGradSysType.DataTextField = "GradSysType"
        drpGradSysType.DataValueField = "GradSysTypeID"
        drpGradSysType.DataSource = GradSysTypeData.fnShowGradSysType()
        drpGradSysType.DataBind()

        Dim lst As New ListItem()
        lst.Text = "-- Select Grading System Type --"
        lst.Value = ""
        drpGradSysType.Items.Insert(0, lst)

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            ShowAvailableSubjects()
            pnlCustomizedGrading.Visible = False
            'GetGradingSystem()
            GetLetterGrade()
            GetGradePoint()
            ShowGradSysType()

            drpGradSysType.Visible = False

            Dim dtExamWiseSubjectInfo As DataTable = New DataTable()
            dtExamWiseSubjectInfo = FormatSubjects()
            Session("ExamWiseSubjectData") = dtExamWiseSubjectInfo

            Dim dtExamWiseGradingInfo As DataTable = New DataTable()
            dtExamWiseGradingInfo = FormatExamWiseGrading()
            Session("ExamWiseGradingData") = dtExamWiseGradingInfo

        End If
    End Sub

    Protected Sub ShowAvailableSubjects()
        drpSubjectList.DataTextField = "SubjectName"
        drpSubjectList.DataValueField = "SubjectID"
        drpSubjectList.DataSource = SubjectData.fnShowSubjects()
        drpSubjectList.DataBind()
    End Sub

    Protected Sub GetGradingSystem()
        grdDefaultGradingSystem.DataSource = GradingSystemData.fnGetGradingSystem()
        grdDefaultGradingSystem.DataBind()
    End Sub

    Protected Sub GetLetterGrade()
        drpLetterGrade.DataTextField = "LetterGrade"
        drpLetterGrade.DataValueField = "LetterGrade"
        drpLetterGrade.DataSource = GradingSystemData.fnGetLetterGrades()
        drpLetterGrade.DataBind()
    End Sub

    Protected Sub GetGradePoint()
        drpGradePoint.DataTextField = "GradePoint"
        drpGradePoint.DataValueField = "GradePoint"
        drpGradePoint.DataSource = GradingSystemData.fnGradingPoints()
        drpGradePoint.DataBind()
    End Sub

    Protected Sub chkPositiveMarkingAsDefault_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkPositiveMarkingAsDefault.CheckedChanged
        If chkPositiveMarkingAsDefault.Checked = True Then
            If txtPositiveMarkingPerQuestion.Text = "" Then
                MessageBox("Input Positive Marking/Question First.")
                chkPositiveMarkingAsDefault.Checked = False
                Exit Sub
            Else
                txtSubWisePositiveMarkingPerQusetion.Text = txtPositiveMarkingPerQuestion.Text
                txtSubWisePositiveMarkingPerQusetion.Enabled = False
                txtPositiveMarkingPerQuestion.Enabled = False
            End If
        Else
            txtSubWisePositiveMarkingPerQusetion.Text = ""
            txtSubWisePositiveMarkingPerQusetion.Enabled = True
        End If
        
    End Sub

    Protected Sub chkNegativeMarkingAsDefault_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkNegativeMarkingAsDefault.CheckedChanged
        If chkNegativeMarkingAsDefault.Checked = True Then
            If txtNegativeMarkingPerQuestion.Text = "" Then
                MessageBox("Input Negative Marking/Question First.")
                chkNegativeMarkingAsDefault.Checked = False
                Exit Sub
            Else
                txtSubWiseNegativeMarkingPerQuestion.Text = txtNegativeMarkingPerQuestion.Text
                txtSubWiseNegativeMarkingPerQuestion.Enabled = False
                txtNegativeMarkingPerQuestion.Enabled = False
            End If
        Else
            txtSubWiseNegativeMarkingPerQuestion.Text = ""
            txtSubWiseNegativeMarkingPerQuestion.Enabled = True
        End If
    End Sub

    Protected Sub chkSkipMarkingAsDefault_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkSkipMarkingAsDefault.CheckedChanged
        If chkSkipMarkingAsDefault.Checked = True Then
            If txtSkipMarkingPerQuestion.Text = "" Then
                MessageBox("Input Skip Marking/Question First.")
                chkSkipMarkingAsDefault.Checked = False
                Exit Sub
            Else
                txtSubWiseSkipMarkingPerQuestion.Text = txtSkipMarkingPerQuestion.Text
                txtSubWiseSkipMarkingPerQuestion.Enabled = False
                txtSkipMarkingPerQuestion.Enabled = False
            End If
        Else
            txtSubWiseSkipMarkingPerQuestion.Text = ""
            txtSubWiseSkipMarkingPerQuestion.Enabled = True
        End If
    End Sub

    Protected Sub chkNotAnsweredAsDefault_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkNotAnsweredAsDefault.CheckedChanged
        If chkNotAnsweredAsDefault.Checked = True Then
            If txtNotAnsweredPerQuestion.Text = "" Then
                MessageBox("Input Skip Marking/Question First.")
                chkNotAnsweredAsDefault.Checked = False
                Exit Sub
            Else
                txtSubWiseNotAnsweredPerQuestion.Text = txtNotAnsweredPerQuestion.Text
                txtSubWiseNotAnsweredPerQuestion.Enabled = False
                txtNotAnsweredPerQuestion.Enabled = False
            End If
        Else
            txtSubWiseNotAnsweredPerQuestion.Text = ""
            txtSubWiseNotAnsweredPerQuestion.Enabled = True
        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnAddGrade_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddGrade.Click
        Try
            Dim GradingSystem As New clsGradingSystem()

            GradingSystem.FromPercentage = Convert.ToDouble(txtPercentageFrom.Text)
            GradingSystem.ToPercentage = Convert.ToDouble(txtPercentageTo.Text)
            GradingSystem.LetterGrade = drpLetterGrade.SelectedValue
            GradingSystem.GradePoint = Convert.ToDouble(drpGradePoint.SelectedValue)
            GradingSystem.GradingExplanation = txtGradeExplanation.Text

            Dim dt As DataTable = GetExamWiseGradingSystem(GradingSystem)
            Session("ExamWiseGradingData") = dt

            grdExamWiseGradingSystem.DataSource = dt
            grdExamWiseGradingSystem.DataBind()
            ClearExamWiseGradingSystem()

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Function GetExamWiseGradingSystem(ByVal GradingSystem As clsGradingSystem) As DataTable
        Dim dtExamWiseGradingInfo = Session("ExamWiseGradingData")

        If (CheckDuplicateExamWisePercentageFrom() = 0) Then
            MessageBox("Check For Duplicate Percentage(From).")
            Return dtExamWiseGradingInfo
        End If

        If (CheckDuplicateExamWisePercentageTo() = 0) Then
            MessageBox("Check For Duplicate Percentage(To).")
            Return dtExamWiseGradingInfo
        End If

        If (CheckDuplicateExamWiseGradingLetter() = 0) Then
            MessageBox("Check For Duplicate Letter Grade.")
            Return dtExamWiseGradingInfo
        End If

        If (CheckDuplicateExamWiseGradingPoint() = 0) Then
            MessageBox("Check For Duplicate Grading Point.")
            Return dtExamWiseGradingInfo
        End If

        Dim dr As DataRow
        dr = dtExamWiseGradingInfo.NewRow()
        dr("FromPercentage") = GradingSystem.FromPercentage
        dr("ToPercentage") = GradingSystem.ToPercentage
        dr("LetterGrade") = GradingSystem.LetterGrade
        dr("GradePoint") = GradingSystem.GradePoint
        dr("GradingExplanation") = GradingSystem.GradingExplanation
        dtExamWiseGradingInfo.Rows.Add(dr)
        dtExamWiseGradingInfo.AcceptChanges()
        Return dtExamWiseGradingInfo
    End Function

    Public Function CheckDuplicateExamWisePercentageFrom() As Integer
        Dim lbl As System.Web.UI.WebControls.Label
        For Each rw As GridViewRow In grdExamWiseGradingSystem.Rows
            lbl = rw.FindControl("lblFromPercentage")
            If lbl.Text = Nothing Then
                Return 0
            End If
            If Convert.ToDouble(txtPercentageFrom.Text) = Convert.ToDouble(lbl.Text) Then
                MessageBox("You Cant's Insert Duplicate Percentage(From).")
                Return 0
            End If
        Next
        Return 1
    End Function

    Public Function CheckDuplicateExamWisePercentageTo() As Integer
        Dim lbl As System.Web.UI.WebControls.Label
        For Each rw As GridViewRow In grdExamWiseGradingSystem.Rows
            lbl = rw.FindControl("lblToPercentage")
            If lbl.Text = Nothing Then
                Return 0
            End If
            If Convert.ToDouble(txtPercentageTo.Text) = Convert.ToDouble(lbl.Text) Then
                MessageBox("You Cant's Insert Duplicate Percentage(To).")
                Return 0
            End If
        Next
        Return 1
    End Function

    Public Function CheckDuplicateExamWiseGradingLetter() As Integer
        Dim lbl As System.Web.UI.WebControls.Label
        For Each rw As GridViewRow In grdExamWiseGradingSystem.Rows
            lbl = rw.FindControl("lblLetterGrade")
            If lbl.Text = Nothing Then
                Return 0
            End If
            If drpLetterGrade.SelectedValue.ToString() = lbl.Text Then
                MessageBox("You Cant's Insert Duplicate Letter Grade.")
                Return 0
            End If
        Next
        Return 1
    End Function

    Public Function CheckDuplicateExamWiseGradingPoint() As Integer
        Dim lbl As System.Web.UI.WebControls.Label
        For Each rw As GridViewRow In grdExamWiseGradingSystem.Rows
            lbl = rw.FindControl("lblGradePoint")
            If lbl.Text = Nothing Then
                Return 0
            End If
            If Convert.ToDouble(drpGradePoint.SelectedValue) = Convert.ToDouble(lbl.Text) Then
                MessageBox("You Cant's Insert Duplicate Grading Point.")
                Return 0
            End If
        Next
        Return 1
    End Function

    Protected Sub ClearExamWiseGradingSystem()
        txtPercentageFrom.Text = ""
        txtPercentageTo.Text = ""
        drpLetterGrade.SelectedIndex = -1
        drpGradePoint.SelectedIndex = -1
    End Sub

    Protected Sub btnAddSubject_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddSubject.Click
        Try

            If txtTotalNoOfQuestion.Text = "" Then
                MessageBox("Input Total No. Of Question First.")
                Exit Sub
            ElseIf Convert.ToDouble(txtTotalNoOfQuestion.Text) = 0 Then
                MessageBox("Total No. Of Question Cann't be 0.")
                Exit Sub
            End If

            Dim QuestionCount As Integer = QuestionData.fnGetSubwiseDifQuesDensity(drpSubjectList.SelectedValue, drpDifficultyLevel.SelectedValue)

            If Convert.ToInt32(Convert.ToInt32(txtTotalNoOfQuestion.Text) * (Convert.ToDouble(txtQuestionPickPercentage.Text) / 100)) > QuestionCount Then
                MessageBox("No Available Question With this Difficulty.")
                Exit Sub
            End If

            Dim ExamWiseSubject As New clsExamWiseSubject()

            ExamWiseSubject.SubjectID = drpSubjectList.SelectedValue
            ExamWiseSubject.SubjectName = drpSubjectList.SelectedItem.ToString()
            ExamWiseSubject.PositiveMarkingPerQuestion = Convert.ToDouble(txtSubWisePositiveMarkingPerQusetion.Text)
            ExamWiseSubject.NegativeMarkingPerQuestion = Convert.ToDouble(txtSubWiseNegativeMarkingPerQuestion.Text)
            ExamWiseSubject.SkipMarkingPerQuestion = Convert.ToDouble(txtSubWiseSkipMarkingPerQuestion.Text)
            ExamWiseSubject.NotAnsweredMarkingPerQuestion = Convert.ToDouble(txtSubWiseNotAnsweredPerQuestion.Text)
            ExamWiseSubject.QuePickPercentage = Convert.ToDouble(txtQuestionPickPercentage.Text)
            ExamWiseSubject.AllocatedQuestion = Convert.ToInt32(Convert.ToInt32(txtTotalNoOfQuestion.Text) * (Convert.ToDouble(txtQuestionPickPercentage.Text) / 100))
            ExamWiseSubject.DifficultyLevel = drpDifficultyLevel.SelectedValue
            Dim dt As DataTable = GetExamWiseSubjectData(ExamWiseSubject)
            Session("ExamWiseSubjectData") = dt

            grdExamWiseSubject.DataSource = dt
            grdExamWiseSubject.DataBind()
            ClearExamWiseSubjectData()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ClearExamWiseSubjectData()
        drpSubjectList.SelectedIndex = -1

        If chkPositiveMarkingAsDefault.Checked = False Then
            txtSubWisePositiveMarkingPerQusetion.Text = ""
        End If

        If chkNegativeMarkingAsDefault.Checked = False Then
            txtSubWiseNegativeMarkingPerQuestion.Text = ""
        End If

        If chkSkipMarkingAsDefault.Checked = False Then
            txtSubWiseSkipMarkingPerQuestion.Text = ""
        End If

        If chkNotAnsweredAsDefault.Checked = False Then
            txtSubWiseNotAnsweredPerQuestion.Text = ""
        End If

        txtQuestionPickPercentage.Text = ""

    End Sub

    Protected Function GetExamWiseSubjectData(ByVal ExamWiseSubject As clsExamWiseSubject) As DataTable

        Dim dtExamWiseSubjectInfo = Session("ExamWiseSubjectData")
        lblErrorMessage.Text = ""
        If (CheckDuplicateSubjectEntry() = 0) Then
            Return dtExamWiseSubjectInfo
        End If
        Dim dr As DataRow
        dr = dtExamWiseSubjectInfo.NewRow()
        dr("SubjectID") = ExamWiseSubject.SubjectID
        dr("SubjectName") = ExamWiseSubject.SubjectName
        dr("PositiveMarkingPerQuestion") = ExamWiseSubject.PositiveMarkingPerQuestion
        dr("NegativeMarkingPerQuestion") = ExamWiseSubject.NegativeMarkingPerQuestion
        dr("SkipMarkingPerQuestion") = ExamWiseSubject.SkipMarkingPerQuestion
        dr("NotAnsweredMarkingPerQuestion") = ExamWiseSubject.NotAnsweredMarkingPerQuestion
        dr("QuePickPercentage") = ExamWiseSubject.QuePickPercentage
        dr("AllocatedQuestion") = ExamWiseSubject.AllocatedQuestion
        dr("DifficultyLevel") = ExamWiseSubject.DifficultyLevel
        dtExamWiseSubjectInfo.Rows.Add(dr)
        dtExamWiseSubjectInfo.AcceptChanges()
        Return dtExamWiseSubjectInfo

    End Function

    Public Function CheckDuplicateSubjectEntry() As Integer
        Dim lbl, lblDifficultyLevel As System.Web.UI.WebControls.Label
        For Each rw As GridViewRow In grdExamWiseSubject.Rows
            lbl = rw.FindControl("lblSubjectID")
            lblDifficultyLevel = rw.FindControl("lblDifficultyLevel")
            If lbl.Text = Nothing Then
                Return 0
            End If
            If drpSubjectList.SelectedValue.ToString() = lbl.Text Then
                If lblDifficultyLevel.Text = drpDifficultyLevel.SelectedValue Or drpDifficultyLevel.SelectedValue = "N\A" Or lblDifficultyLevel.Text = "N\A" Then
                    lblErrorMessage.Text = "You Cant's Insert Duplicate Subject With Same Difficulty Level."
                    MessageBox("You Cant's Insert Duplicate Subject With Same Difficulty Level.")
                    Return 0
                End If

            End If
        Next
        Return 1
    End Function

    Public Function GetTotalAllocatedQuestion() As Integer
        Dim AllocatedQuestion As Double = 0
        Dim lblAllocatedQuestion As Label

        For Each rw As GridViewRow In grdExamWiseSubject.Rows
            lblAllocatedQuestion = rw.FindControl("lblAllocatedQuestion")
            AllocatedQuestion += Convert.ToDouble(lblAllocatedQuestion.Text)
        Next

        Return AllocatedQuestion
    End Function

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        If chkIsDynamicQuestionGeneration.Checked = True Then
            If Convert.ToDouble(txtTotalNoOfQuestion.Text) <> Convert.ToDouble(GetTotalAllocatedQuestion()) Then
                MessageBox("Total Allocated Question Does not mathced With Defined No. Of Questions.")
                Exit Sub
            End If
        End If

        If rdbtnGradingSystem.SelectedValue = "Default" Then
            If grdDefaultGradingSystem.Rows.Count <= 0 Then
                MessageBox("Select A Default Grading System.")
                Exit Sub
            End If
        End If

        '' Dependency Checking
        If grdExamWiseSubject.Rows.Count <= 0 Then
            MessageBox("An Exam Must Have At Least One Subject.")
            Exit Sub
        End If

        If rdbtnGradingSystem.SelectedIndex = -1 Then
            MessageBox("Choose A Grading System.")
            Exit Sub
        End If

        If rdbtnGradingSystem.SelectedValue = "Customized" Then
            If grdExamWiseGradingSystem.Rows.Count <= 0 Then
                MessageBox("Input Grading System For The Exam.")
                Exit Sub
            End If
        End If

        Dim Exam As New clsExam()
        Dim ExamWiseSubjectData As String = ""
        Dim ExamWiseGradingSystemData As String = ""

        Dim dtExamWiseSubjectInfo As DataTable = New DataTable()
        dtExamWiseSubjectInfo = Session("ExamWiseSubjectData")

        Dim dtExamWiseGradingInfo As DataTable = New DataTable()
        dtExamWiseGradingInfo = Session("ExamWiseGradingData")

        Exam.ExamName = txtExamName.Text
        Exam.ExamCode = txtExamCode.Text
        Exam.PositiveMarkingPerQuestion = Convert.ToDouble(txtPositiveMarkingPerQuestion.Text)
        Exam.NegativeMarkingPerQuestion = Convert.ToDouble(txtNegativeMarkingPerQuestion.Text)
        Exam.SkipMarkingPerQuestion = Convert.ToDouble(txtSkipMarkingPerQuestion.Text)
        Exam.NotAnsweredMarkingPerQuestion = Convert.ToDouble(txtNotAnsweredPerQuestion.Text)
        Exam.TotalQuestion = Convert.ToInt32(txtTotalNoOfQuestion.Text)
        Exam.TotalMarks = Convert.ToDouble(txtTotalMarks.Text)
        Exam.TotalTime = Convert.ToInt32(txtTotalTime.Text)

        '' Exam Wise Subject Data
        Dim ExamWiseSubject As New clsExamWiseSubject()
        For Each rw As DataRow In dtExamWiseSubjectInfo.Rows
            ExamWiseSubject.SubjectID = rw.Item("SubjectID")
            ExamWiseSubject.PositiveMarkingPerQuestion = rw.Item("PositiveMarkingPerQuestion")
            ExamWiseSubject.NegativeMarkingPerQuestion = rw.Item("NegativeMarkingPerQuestion")
            ExamWiseSubject.SkipMarkingPerQuestion = rw.Item("SkipMarkingPerQuestion")
            ExamWiseSubject.NotAnsweredMarkingPerQuestion = rw.Item("NotAnsweredMarkingPerQuestion")
            ExamWiseSubject.QuePickPercentage = rw.Item("QuePickPercentage")
            ExamWiseSubject.AllocatedQuestion = rw.Item("AllocatedQuestion")
            ExamWiseSubject.DifficultyLevel = rw.Item("DifficultyLevel")
            ExamWiseSubjectData = ExamWiseSubjectData & ExamWiseSubject.SubjectID & "~" & ExamWiseSubject.PositiveMarkingPerQuestion & "~" & ExamWiseSubject.NegativeMarkingPerQuestion & "~" & ExamWiseSubject.SkipMarkingPerQuestion & "~" & ExamWiseSubject.NotAnsweredMarkingPerQuestion & "~" & ExamWiseSubject.QuePickPercentage & "~" & ExamWiseSubject.AllocatedQuestion & "~" & ExamWiseSubject.DifficultyLevel & "~|"
        Next

        Exam.ExamWiseSubjectData = ExamWiseSubjectData
        Exam.GradingSystem = rdbtnGradingSystem.SelectedValue

        '' Grading System Data
        Dim Grading As New clsGradingSystem()
        For Each rw As DataRow In dtExamWiseGradingInfo.Rows
            Grading.FromPercentage = rw.Item("FromPercentage")
            Grading.ToPercentage = rw.Item("ToPercentage")
            Grading.LetterGrade = rw.Item("LetterGrade")
            Grading.GradePoint = rw.Item("GradePoint")
            Grading.GradingExplanation = rw.Item("GradingExplanation")
            ExamWiseGradingSystemData = ExamWiseGradingSystemData & Grading.FromPercentage & "~" & Grading.ToPercentage & "~" & Grading.LetterGrade & "~" & Grading.GradePoint & "~" & Grading.GradingExplanation & "~|"
        Next

        If Exam.GradingSystem = "Default" Then

            Dim dtDefaultGradingSystem As New DataTable()
            dtDefaultGradingSystem = FormatExamWiseGrading()
            'dtDefaultGradingSystem = grdDefaultGradingSystem.DataSource

            Dim GradSysType As New clsGradSysType()
            GradSysType.GradSysTypeID = drpGradSysType.SelectedValue
            dtDefaultGradingSystem = GradingSystemData.fnShowGradSysByTypeID(GradSysType).Tables(0)

            For Each rw As DataRow In dtDefaultGradingSystem.Rows
                Grading.FromPercentage = rw.Item("FromPercentage")
                Grading.ToPercentage = rw.Item("ToPercentage")
                Grading.LetterGrade = rw.Item("LetterGrade")
                Grading.GradePoint = rw.Item("GradePoint")
                Grading.GradingExplanation = rw.Item("GradingExplanation")
                ExamWiseGradingSystemData = ExamWiseGradingSystemData & Grading.FromPercentage & "~" & Grading.ToPercentage & "~" & Grading.LetterGrade & "~" & Grading.GradePoint & "~" & Grading.GradingExplanation & "~|"
            Next

            Exam.GradingSystemData = ExamWiseGradingSystemData
        Else
            Exam.GradingSystemData = ExamWiseGradingSystemData
        End If

        If chkIsDynamicQuestionGeneration.Checked = True Then
            Exam.IsDynamic = True
        Else
            Exam.IsDynamic = False
        End If

        Exam.ExamInstructions = txtExamInstructions.Text
        Exam.EntryBy = Session("LoginUserID")

        Dim Check As Integer = ExamData.fnInsertExamDefinition(Exam)

        If Check = 1 Then
            MessageBox("Inserted Successfully")
            ClearExamDefinition()
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub ClearExamDefinition()
        txtExamName.Text = ""
        txtExamCode.Text = ""
        txtPositiveMarkingPerQuestion.Text = ""
        txtPositiveMarkingPerQuestion.Enabled = True
        txtNegativeMarkingPerQuestion.Text = ""
        txtNegativeMarkingPerQuestion.Enabled = True
        txtSkipMarkingPerQuestion.Text = ""
        txtSkipMarkingPerQuestion.Enabled = True
        txtNotAnsweredPerQuestion.Text = ""
        txtNotAnsweredPerQuestion.Enabled = True
        txtTotalMarks.Text = ""
        txtTotalNoOfQuestion.Text = ""
        txtTotalTime.Text = ""

        txtSubWisePositiveMarkingPerQusetion.Text = ""
        txtSubWisePositiveMarkingPerQusetion.Enabled = True
        txtSubWiseNegativeMarkingPerQuestion.Text = ""
        txtSubWiseNegativeMarkingPerQuestion.Enabled = True
        txtSubWiseSkipMarkingPerQuestion.Text = ""
        txtSubWiseSkipMarkingPerQuestion.Enabled = True
        txtSubWiseNotAnsweredPerQuestion.Text = ""
        txtSubWiseNotAnsweredPerQuestion.Enabled = True

        chkPositiveMarkingAsDefault.Checked = False
        chkNegativeMarkingAsDefault.Checked = False
        chkSkipMarkingAsDefault.Checked = False
        chkNotAnsweredAsDefault.Checked = False

        rdbtnGradingSystem.SelectedIndex = -1

        grdExamWiseGradingSystem.DataSource = ""
        grdExamWiseGradingSystem.DataBind()

        grdExamWiseSubject.DataSource = ""
        grdExamWiseSubject.DataBind()

        Session("ExamWiseSubjectData") = ""

        Session("ExamWiseGradingData") = ""

        pnlCustomizedGrading.Visible = False

        grdDefaultGradingSystem.DataSource = ""
        grdDefaultGradingSystem.DataBind()

        drpGradSysType.SelectedIndex = -1
        drpGradSysType.Visible = False
        txtExamInstructions.Text = ""

    End Sub

    Protected Sub grdExamWiseGradingSystem_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grdExamWiseGradingSystem.RowDeleting
        Dim i As Integer
        Dim dtExamWiseGradingInfo As DataTable = New DataTable()

        dtExamWiseGradingInfo = Session("ExamWiseGradingData")

        i = e.RowIndex

        dtExamWiseGradingInfo.Rows(i).Delete()
        dtExamWiseGradingInfo.AcceptChanges()

        Session("ExamWiseGradingData") = dtExamWiseGradingInfo

        grdExamWiseGradingSystem.DataSource = dtExamWiseGradingInfo
        grdExamWiseGradingSystem.DataBind()

    End Sub

    Protected Sub drpGradSysType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpGradSysType.SelectedIndexChanged
        If drpGradSysType.SelectedValue = "" Then
            MessageBox("Select A Grading System Type.")
            grdExamWiseGradingSystem.DataSource = ""
            grdExamWiseGradingSystem.DataBind()
            Exit Sub
        End If

        Dim GradSysType As New clsGradSysType()
        Dim dtGradingSystem As DataTable = New DataTable()
        ' dtGradingSystem = FormatGradingSystem()

        GradSysType.GradSysTypeID = drpGradSysType.SelectedValue
        dtGradingSystem = GradingSystemData.fnShowGradSysByTypeID(GradSysType).Tables(0)
        grdDefaultGradingSystem.DataSource = dtGradingSystem
        grdDefaultGradingSystem.DataBind()
    End Sub

    Protected Sub chkIsDynamicQuestionGeneration_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkIsDynamicQuestionGeneration.CheckedChanged

        If chkIsDynamicQuestionGeneration.Checked = True Then
            reqFldQuePickPercentage.ValidationGroup = "AddSub"
        End If

    End Sub

    Dim TotalQuePickPercentage As Double = 0
    Dim TotalAllocatedQuestion As Integer = 0
    Protected Sub grdExamWiseSubject_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdExamWiseSubject.RowDataBound

        Dim lblQuePickPercentage, lblAllocatedQuestion As Label
        If e.Row.RowType = DataControlRowType.DataRow Then
            lblQuePickPercentage = e.Row.FindControl("lblQuePickPercentage")
            lblAllocatedQuestion = e.Row.FindControl("lblAllocatedQuestion")
            TotalQuePickPercentage += Convert.ToDouble(lblQuePickPercentage.Text)
            TotalAllocatedQuestion += Convert.ToInt32(lblAllocatedQuestion.Text)
        End If

        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(7).Text = String.Format("{0:N2}", TotalQuePickPercentage)
            e.Row.Cells(8).Text = String.Format("{0:N2}", TotalAllocatedQuestion)
        End If

    End Sub

    Protected Sub grdExamWiseSubject_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grdExamWiseSubject.RowDeleting
        Dim i As Integer

        Dim dtExamWiseSubjectInfo As DataTable = New DataTable()
        dtExamWiseSubjectInfo = Session("ExamWiseSubjectData")
        i = e.RowIndex

        dtExamWiseSubjectInfo.Rows(i).Delete()
        dtExamWiseSubjectInfo.AcceptChanges()

        Session("ExamWiseSubjectData") = dtExamWiseSubjectInfo

        grdExamWiseSubject.DataSource = dtExamWiseSubjectInfo
        grdExamWiseSubject.DataBind()
    End Sub

    Protected Sub drpSubjectList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSubjectList.SelectedIndexChanged
        Dim subject As New clsSubjects()
        subject.SubjectID = drpSubjectList.SelectedValue
        GetSequenceNo(subject)
    End Sub

    Protected Sub GetSequenceNo(ByVal Subject As clsSubjects)
        Dim Ques As New clsQuestion()
        Try
            Ques = SubjectData.fnGetSubwiseQuestionOrder(Subject)

            lblNoOfActiveQuestions.Text = Ques.NoOfActiveQuestion.ToString()
            lblNoOfInactiveQuestions.Text = Ques.NoOfInActiveQuestion.ToString()
            lblDifficultyLevelStr.Text = Ques.DifficultyLevelStr

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

End Class
