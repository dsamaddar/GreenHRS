Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.OleDb
Imports System.Data.Common
Imports System.IO
Imports System.Math
Imports System.Configuration
Imports System.Web.UI
Imports System.Drawing

Partial Class frmTrainingnTesting
    Inherits System.Web.UI.Page

    Dim SubjectData As New clsSubjectsDataAccess()
    Dim GradSysTypeData As New clsGradSysTypeDataAccess()
    Dim GradSystemData As New clsGradingSystemDataAccess()
    Dim TrngSubData As New clsTrngSubjectDataAccess()
    Dim TrngTypeData As New clsTrainingTypeDataAccess()
    Dim CourseLevelData As New clsCourseLevelDataAccess()

    Dim QuestionData As New clsQuestionDataAccess()

    Dim GradingSystemData As New clsGradingSystemDataAccess()
    Dim ExamData As New clsExamDataAccess()

    Shared IsAdministrationBtnPressed As Boolean = False
    Shared IsQuestionBankBtnPressed As Boolean = False
    Shared IsTestDesignBtnPressed As Boolean = False
    Shared IsAssignBtnPressed As Boolean = False

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            ShowAvailableSubjects()
            GetGradePoint()
            ShowGradSysType()
            ShowTrngSubList()
            ShowTrngTypeList()
            ShowCourseLevel()
            ShowTrngTopicList(ddlTrainingSubject.SelectedValue)
            MakeQuestionInitialization()
            ShowAvailableSubjects()
            pnlCustomizedGrading.Visible = False
            GetLetterGrade()
            GetGradePoint()
            ShowGradSysType()

            drpGradSysType.Visible = False

            HideAllControls()

            Dim dtExamWiseSubjectInfo As DataTable = New DataTable()
            dtExamWiseSubjectInfo = FormatSubjects()
            Session("ExamWiseSubjectData") = dtExamWiseSubjectInfo

            Dim dtExamWiseGradingInfo As DataTable = New DataTable()
            dtExamWiseGradingInfo = FormatExamWiseGrading()
            Session("ExamWiseGradingData") = dtExamWiseGradingInfo

            Dim dtGradingSystem As DataTable = New DataTable()
            dtGradingSystem = FormatGradingSystem()
            Session("GradingSystem") = dtGradingSystem
        End If
    End Sub

#Region " Menu Button Click "

    Protected Sub ClearBtnSelection()

        IsAdministrationBtnPressed = False
        IsQuestionBankBtnPressed = False
        IsTestDesignBtnPressed = False
        IsAssignBtnPressed = False

        btnAdmininistration.Font.Bold = False
        btnAdmininistration.ForeColor = Color.White

        btnQuestionBank.Font.Bold = False
        btnQuestionBank.ForeColor = Color.White

        btnTestDesign.Font.Bold = False
        btnTestDesign.ForeColor = Color.White

        btnAssign.Font.Bold = False
        btnAssign.ForeColor = Color.White

        HideAllControls()

    End Sub

    Protected Sub HideAllControls()
        HideAllAdministrativeControls()
        HideAllQuestionBankControls()
        HideAllTestDesignControls()
        HideAllAssignExamControl()
    End Sub

    Protected Sub HideAllAdministrativeControls()
        pnlCourseLevel.Visible = False
        pnlCustomizedGrading.Visible = False
        pnlGradingSystemType.Visible = False
        pnlSubjectDefinition.Visible = False
        pnlTrainingLevel.Visible = False
        pnlTrainingSettings.Visible = False
        pnlTrainingTopic.Visible = False
    End Sub

    Protected Sub ShowAllAdministrativeControls()
        pnlCourseLevel.Visible = True
        pnlCustomizedGrading.Visible = True
        pnlGradingSystemType.Visible = True
        pnlSubjectDefinition.Visible = True
        pnlTrainingLevel.Visible = True
        pnlTrainingSettings.Visible = True
        pnlTrainingTopic.Visible = True
    End Sub

    Protected Sub HideAllQuestionBankControls()
        pnlCreateQuestion.Visible = False
        pnlAvailableQuestions.Visible = False
    End Sub

    Protected Sub ShowAllQuestionBankControls()
        pnlCreateQuestion.Visible = True
        pnlAvailableQuestions.Visible = True
    End Sub

    Protected Sub HideAllTestDesignControls()
        pnlExamDefinition.Visible = False
        pnlSubjectWiseMarksDistribution.Visible = False
        pnlChoosenSubjects.Visible = False
        pnlGradingSystem.Visible = False
    End Sub

    Protected Sub ShowAllTestDesignControls()
        pnlExamDefinition.Visible = True
        pnlSubjectWiseMarksDistribution.Visible = True
        pnlChoosenSubjects.Visible = True
        pnlGradingSystem.Visible = True
    End Sub

    Protected Sub HideAllAssignExamControl()
        pnlAssignExam.Visible = False
        pnlAttendees.Visible = False
        pnlGenerateExam.Visible = False
        pnlEntryPointWiseExams.Visible = False
    End Sub

    Protected Sub ShowAllAssignExamControl()
        pnlAssignExam.Visible = True
        pnlAttendees.Visible = True
        pnlGenerateExam.Visible = True
        pnlEntryPointWiseExams.Visible = True
    End Sub

    Protected Sub btnAdmininistration_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdmininistration.Click
        ClearBtnSelection()

        btnAdmininistration.Font.Bold = True
        btnAdmininistration.ForeColor = Color.DarkOrange
        IsAdministrationBtnPressed = True

        ShowAllAdministrativeControls()
        MakeQuestionSortable()
    End Sub

    Protected Sub btnQuestionBank_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnQuestionBank.Click
        ClearBtnSelection()
        btnQuestionBank.Font.Bold = True
        btnQuestionBank.ForeColor = Color.DarkOrange
        IsQuestionBankBtnPressed = True
        ShowAllQuestionBankControls()
    End Sub

    Protected Sub btnTestDesign_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTestDesign.Click
        ClearBtnSelection()
        btnTestDesign.Font.Bold = True
        btnTestDesign.ForeColor = Color.DarkOrange
        IsTestDesignBtnPressed = True

        ShowAllTestDesignControls()
    End Sub

    Protected Sub btnAssign_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAssign.Click
        ClearBtnSelection()
        btnAssign.Font.Bold = True
        btnAssign.ForeColor = Color.DarkOrange
        IsAssignBtnPressed = True

        ShowAllAssignExamControl()
    End Sub

#End Region

#Region " Subject Definition "

    Protected Sub btnInsertSubjects_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertSubjects.Click
        Dim Subjects As New clsSubjects()

        Subjects.SubjectName = txtSubjectName.Text
        Subjects.SubjectCode = txtSubjectCode.Text
        Subjects.EntryBy = Session("LoginUserID")

        Dim Check As Integer = SubjectData.fnInsertSubjects(Subjects)

        If Check = 1 Then
            ClearSubjects()
            ShowAvailableSubjects()
            MessageBox("Inserted Successfully.")
        Else
            MessageBox("Error Found.")
        End If
    End Sub

    Protected Sub ClearSubjects()
        txtSubjectCode.Text = ""
        txtSubjectName.Text = ""
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub ShowAvailableSubjects()

        Dim ds As DataSet = SubjectData.fnShowSubjects()

        drpAvailableSubjects.DataTextField = "SubjectName"
        drpAvailableSubjects.DataValueField = "SubjectID"
        drpAvailableSubjects.DataSource = ds
        drpAvailableSubjects.DataBind()

        drpSubjectListForQuesDef.DataTextField = "SubjectName"
        drpSubjectListForQuesDef.DataValueField = "SubjectID"
        drpSubjectListForQuesDef.DataSource = ds
        drpSubjectListForQuesDef.DataBind()

        drpSubjectListExamDef.DataTextField = "SubjectName"
        drpSubjectListExamDef.DataValueField = "SubjectID"
        drpSubjectListExamDef.DataSource = ds
        drpSubjectListExamDef.DataBind()

    End Sub

#End Region

#Region " Grading System "

    Protected Function FormatGradingSystem() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("FromPercentage", System.Type.GetType("System.Double"))
        dt.Columns.Add("ToPercentage", System.Type.GetType("System.Double"))
        dt.Columns.Add("LetterGrade", System.Type.GetType("System.String"))
        dt.Columns.Add("GradePoint", System.Type.GetType("System.Double"))
        dt.Columns.Add("GradingExplanation", System.Type.GetType("System.String"))
        Return dt
    End Function

    Protected Sub btnInsertGradingSystemType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertGradingSystemType.Click
        Dim GradSysType As New clsGradSysType()

        GradSysType.GradSysType = txtGradingSystemType.Text
        GradSysType.EntryBy = Session("LoginUserID")

        Dim Check As Integer = GradSysTypeData.fnInsertGradingSystemType(GradSysType)

        If Check = 1 Then
            MessageBox("Inserted Successfully.")
            ShowGradSysType()
            ClearGradSysType()
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub ClearGradSysType()
        txtGradingSystemType.Text = ""
    End Sub

    Protected Sub GetGradePoint()
        Dim ds As DataSet = GradSystemData.fnGradingPoints()
        drpGradePoint.DataTextField = "GradePoint"
        drpGradePoint.DataValueField = "GradePoint"
        drpGradePoint.DataSource = ds
        drpGradePoint.DataBind()

        drpGradePointExamDef.DataTextField = "GradePoint"
        drpGradePointExamDef.DataValueField = "GradePoint"
        drpGradePointExamDef.DataSource = ds
        drpGradePointExamDef.DataBind()
    End Sub

    Protected Sub ShowGradSysType()

        Dim ds As DataSet = GradSysTypeData.fnShowGradSysType()

        drpGradSysType.DataTextField = "GradSysType"
        drpGradSysType.DataValueField = "GradSysTypeID"
        drpGradSysType.DataSource = ds
        drpGradSysType.DataBind()

        drpGradSysTypeExamDef.DataTextField = "GradSysType"
        drpGradSysTypeExamDef.DataValueField = "GradSysTypeID"
        drpGradSysTypeExamDef.DataSource = GradSysTypeData.fnShowGradSysType()
        drpGradSysTypeExamDef.DataBind()

        Dim lst As New ListItem()
        lst.Text = "-- Select Grading System Type --"
        lst.Value = ""

        drpGradSysType.Items.Insert(0, lst)
        drpGradSysTypeExamDef.Items.Insert(0, lst)

    End Sub

    Protected Sub btnAddGrade_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddGrade.Click
        Try
            Dim GradingSystem As New clsGradingSystem()

            GradingSystem.FromPercentage = Convert.ToDouble(txtPercentageFrom.Text)
            GradingSystem.ToPercentage = Convert.ToDouble(txtPercentageTo.Text)
            GradingSystem.LetterGrade = txtLetterGrade.Text
            GradingSystem.GradePoint = Convert.ToDouble(drpGradePoint.SelectedValue)
            GradingSystem.GradingExplanation = txtGradeExplanation.Text

            Dim dt As DataTable = GetGradingSystem(GradingSystem)
            Session("GradingSystem") = dt

            grdExamWiseGradingSystem.DataSource = dt
            grdExamWiseGradingSystem.DataBind()
            ClearGradSystem()

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Function GetGradingSystem(ByVal GradingSystem As clsGradingSystem) As DataTable
        Dim dtExamWiseGradingInfo = Session("GradingSystem")

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
            If txtLetterGrade.Text = lbl.Text Then
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

    Protected Sub ClearGradSystem()
        txtPercentageFrom.Text = ""
        txtPercentageTo.Text = ""
        txtLetterGrade.Text = ""
        drpGradePoint.SelectedIndex = -1
        txtGradeExplanation.Text = "N\A"
    End Sub

    Protected Sub drpGradSysType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpGradSysType.SelectedIndexChanged
        If drpGradSysType.SelectedValue = "" Then
            MessageBox("Select A Grading System Type.")
            grdExamWiseGradingSystem.DataSource = ""
            grdExamWiseGradingSystem.DataBind()
            ClearGradSystem()
            Exit Sub
        End If

        Dim GradSysType As New clsGradSysType()
        Dim dtGradingSystem As DataTable = New DataTable()
        dtGradingSystem = FormatGradingSystem()

        GradSysType.GradSysTypeID = drpGradSysType.SelectedValue
        dtGradingSystem = GradSystemData.fnShowGradSysByTypeID(GradSysType).Tables(0)
        grdExamWiseGradingSystem.DataSource = dtGradingSystem
        grdExamWiseGradingSystem.DataBind()

        Session("GradingSystem") = dtGradingSystem

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        Dim dtGradingSystem As DataTable = New DataTable()
        dtGradingSystem = Session("GradingSystem")

        Dim GradingSystemData As String = ""
        Dim GradSystem As New clsGradingSystem()

        Try
            '' Grading System Data
            For Each rw As DataRow In dtGradingSystem.Rows
                GradSystem.FromPercentage = rw.Item("FromPercentage")
                GradSystem.ToPercentage = rw.Item("ToPercentage")
                GradSystem.LetterGrade = rw.Item("LetterGrade")
                GradSystem.GradePoint = rw.Item("GradePoint")
                GradSystem.GradingExplanation = If(rw.Item("GradingExplanation") Is Nothing, "N\A", rw.Item("GradingExplanation"))
                GradingSystemData = GradingSystemData & GradSystem.FromPercentage & "~" & GradSystem.ToPercentage & "~" & GradSystem.LetterGrade & "~" & GradSystem.GradePoint & "~" & GradSystem.GradingExplanation & "~|"
            Next

            GradSystem.GradingSystemData = GradingSystemData
            GradSystem.GradSysTypeID = drpGradSysType.SelectedValue
            GradSystem.EntryBy = Session("LoginUserID")

            Dim Check As Integer = GradSystemData.fnInsertTotalGradingSystem(GradSystem)

            If Check = 1 Then
                ClearGradSystem()
                drpGradSysType.SelectedIndex = -1
                grdExamWiseGradingSystem.DataSource = ""
                grdExamWiseGradingSystem.DataBind()
                MessageBox("Successfully Inserted.")
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub grdExamWiseGradingSystem_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grdExamWiseGradingSystem.RowDeleting
        Try
            Dim i As Integer
            Dim dtGradingSystem As DataTable = New DataTable()

            dtGradingSystem = Session("GradingSystem")

            i = e.RowIndex

            dtGradingSystem.Rows(i).Delete()
            dtGradingSystem.AcceptChanges()
            grdExamWiseGradingSystem.DataSource = dtGradingSystem
            grdExamWiseGradingSystem.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub btnCancelGradingSystemEntry_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelGradingSystemEntry.Click
        ClearGradSystem()
        drpGradSysType.SelectedIndex = -1
        grdExamWiseGradingSystem.DataSource = ""
        grdExamWiseGradingSystem.DataBind()
    End Sub

#End Region

#Region " Training Settings "

    Protected Sub btnAddSubject_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddSubject.Click
        Dim TrngSub As New clsTrngSubject()

        TrngSub.TrngSubName = txtTrngSubject.Text
        TrngSub.TrngSubDescription = txtTrngDescription.Text
        TrngSub.Objectives = txtTrngObjectives.Text
        TrngSub.EntryBy = "dsamaddar"

        Dim Check As Integer = TrngSubData.fnInsertTrngSubject(TrngSub)

        If Check = 1 Then
            ShowTrngSubList()
            ClearTrngSub()
            MessageBox("Inserted Successfully.")
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub ShowTrngSubList()
        drpAvailableTrngSubject.DataTextField = "TrngSubName"
        drpAvailableTrngSubject.DataValueField = "TrngSubjectID"
        drpAvailableTrngSubject.DataSource = TrngSubData.fnShowTrngSubjects()
        drpAvailableTrngSubject.DataBind()

        ddlTrainingSubject.DataTextField = "TrngSubName"
        ddlTrainingSubject.DataValueField = "TrngSubjectID"
        ddlTrainingSubject.DataSource = TrngSubData.fnShowTrngSubjects()
        ddlTrainingSubject.DataBind()
    End Sub

    Protected Sub btnAddTrainingType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddTrainingType.Click

        Dim TrainingType As New clsTrainingType()

        TrainingType.TrngType = txtTrainingType.Text
        TrainingType.EntryBy = "dsamaddar"

        Dim Check As Integer = TrngTypeData.fnspInsertTrngType(TrainingType)

        If Check = 1 Then
            ShowTrngTypeList()
            ClearTrngType()
            MessageBox("Inserted Successfully.")
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub ClearTrngType()
        txtTrainingType.Text = ""
    End Sub

    Protected Sub ShowTrngTypeList()
        drpAvailableTrainingType.DataTextField = "TrngType"
        drpAvailableTrainingType.DataValueField = "TrngTypeID"
        drpAvailableTrainingType.DataSource = TrngTypeData.fnShowTrngType()
        drpAvailableTrainingType.DataBind()
    End Sub

    Protected Sub btnAddCourseLevel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddCourseLevel.Click
        Dim CourseLevel As New clsCourseLevel()

        CourseLevel.CourseLevel = txtCourseLevel.Text
        CourseLevel.EntryBy = "dsamaddar"

        Dim Check As Integer = CourseLevelData.fnInsertCourseLevel(CourseLevel)

        If Check = 1 Then
            ShowCourseLevel()
            ClearCourseLevel()
            MessageBox("Inserted Successfully.")
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub ShowCourseLevel()
        drpAvailableCourseLevel.DataTextField = "CourseLevel"
        drpAvailableCourseLevel.DataValueField = "CourseLevelID"
        drpAvailableCourseLevel.DataSource = CourseLevelData.fnShowCourseLevel()
        drpAvailableCourseLevel.DataBind()
    End Sub

    Protected Sub btnCancelCourseLevel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelCourseLevel.Click
        ClearCourseLevel()
    End Sub

    Protected Sub ClearCourseLevel()
        txtCourseLevel.Text = ""
    End Sub

    Protected Sub btnCancelTrainingType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelTrainingType.Click
        ClearTrngType()
    End Sub

    Protected Sub ClearTrngSub()
        txtTrngDescription.Text = ""
        txtTrngObjectives.Text = ""
        txtTrngSubject.Text = ""
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        txtTrngSubject.Text = ""
        txtTrngDescription.Text = ""
        txtTrngObjectives.Text = ""
    End Sub

    Protected Sub btnTrainingTopic_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTrainingTopic.Click
        Dim TrainingTopic As New clsTrainingTopic()

        TrainingTopic.TrngSubjectID = ddlTrainingSubject.SelectedValue
        TrainingTopic.TrngTopic = txtTrainingTopic.Text
        TrainingTopic.EntryBy = "tahmed1" 'Session("tahmed1")

        Dim Check As Integer = TrngTypeData.fnspInsertTrngTopic(TrainingTopic)

        If Check = 1 Then
            ShowTrngTopicList(ddlTrainingSubject.SelectedValue)
            ClearTrainingTopic()
            MessageBox("Inserted Successfully.")
        Else
            MessageBox("Error Found.")
        End If
    End Sub

    Protected Sub btnTrainingCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTrainingCancel.Click
        ClearTrainingTopic()
    End Sub

    Protected Sub ClearTrainingTopic()
        ddlTrainingSubject.SelectedIndex = 0
        txtTrainingTopic.Text = ""
    End Sub

    Protected Sub ShowTrngTopicList(ByVal TrngSubjectID As String)
        ddlTrngTopic.DataTextField = "TrngTopic"
        ddlTrngTopic.DataValueField = "TrainingTopicID"
        ddlTrngTopic.DataSource = TrngTypeData.fnShowTrngTopic(TrngSubjectID)
        ddlTrngTopic.DataBind()
    End Sub

    Protected Sub ddlTrainingSubject_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlTrainingSubject.SelectedIndexChanged
        ShowTrngTopicList(ddlTrainingSubject.SelectedValue)
    End Sub

#End Region

#Region " Make Question "

    Protected Sub MakeQuestionInitialization()
        ShowAvailableSubjects()

        If drpSubjectListExamDef.Items.Count > 0 Then
            txtSequenceNo.Text = 0
            Dim Subject As New clsSubjects()
            drpSubjectListExamDef.SelectedIndex = 0
            Subject.SubjectID = drpSubjectListExamDef.SelectedValue
            GetSequenceNo(Subject)

            grdAvailableQuestions.SelectedIndex = -1
            grdAvailableQuestions.DataSource = ""
            grdAvailableQuestions.DataBind()

            grdAvailableQuestions.DataSource = QuestionData.fnGetAllQuestionsBySubID(drpSubjectListExamDef.SelectedValue)
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
    End Sub

    Protected Sub MakeQuestionSortable()
        If grdAvailableQuestions.Rows.Count > 0 Then
            'This replaces <td> with <th> and adds the scope attribute
            grdAvailableQuestions.UseAccessibleHeader = True
            'This will add the <thead> and <tbody> elements
            grdAvailableQuestions.HeaderRow.TableSection = TableRowSection.TableHeader
            'This adds the <tfoot> element.Remove if you don't have a footer row
            grdAvailableQuestions.FooterRow.TableSection = TableRowSection.TableFooter
        End If
    End Sub

    Protected Sub drpSubjectListForQuesDef_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSubjectListForQuesDef.SelectedIndexChanged
        Try
            txtSequenceNo.Text = 0
            Dim Subject As New clsSubjects()
            Subject.SubjectID = drpSubjectListForQuesDef.SelectedValue
            GetSequenceNo(Subject)

            grdAvailableQuestions.SelectedIndex = -1
            grdAvailableQuestions.DataSource = ""
            grdAvailableQuestions.DataBind()

            grdAvailableQuestions.DataSource = QuestionData.fnGetAllQuestionsBySubID(drpSubjectListForQuesDef.SelectedValue)
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
            lblNoOfActiveQuestionsDef.Text = "Active Questions: " & Ques.NoOfActiveQuestion.ToString()
            lblNoOfInactiveQuestionsDef.Text = "In-Active Questions: " & Ques.NoOfInActiveQuestion.ToString()
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

        Question.SubjectID = drpSubjectListExamDef.SelectedValue
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
        Subject.SubjectID = drpSubjectListExamDef.SelectedValue
        GetSequenceNo(Subject)

        grdAvailableQuestions.SelectedIndex = -1
        grdAvailableQuestions.DataSource = ""
        grdAvailableQuestions.DataBind()

        grdAvailableQuestions.DataSource = QuestionData.fnGetAllQuestionsBySubID(drpSubjectListExamDef.SelectedValue)
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
        Subject.SubjectID = drpSubjectListExamDef.SelectedValue
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

    Protected Sub btnCancelQuestionAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelQuestionAdd.Click

    End Sub

#End Region

#Region " Test Design "

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
            pnlCustomizedGradingExDf.Visible = True
            drpGradSysTypeExamDef.Visible = False

            grdDefaultGradingSystem.DataSource = ""
            grdDefaultGradingSystem.DataBind()

        Else
            drpGradSysTypeExamDef.Visible = True
            pnlCustomizedGradingExDf.Visible = False
        End If
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

    Protected Sub btnAddGradeExDef_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddGradeExDef.Click
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

    Public Function CheckDuplicateExamWisePercentageFromExDf() As Integer
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

    Public Function CheckDuplicateExamWisePercentageToExDf() As Integer
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

    Public Function CheckDuplicateExamWiseGradingLetterExDf() As Integer
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

    Public Function CheckDuplicateExamWiseGradingPointExDf() As Integer
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

    Protected Sub btnAddSubjectExDef_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddSubjectExDef.Click
        Try

            If txtTotalNoOfQuestion.Text = "" Then
                MessageBox("Input Total No. Of Question First.")
                Exit Sub
            ElseIf Convert.ToDouble(txtTotalNoOfQuestion.Text) = 0 Then
                MessageBox("Total No. Of Question Cann't be 0.")
                Exit Sub
            End If

            Dim QuestionCount As Integer = QuestionData.fnGetSubwiseDifQuesDensity(drpSubjectListExamDef.SelectedValue, drpDifficultyLevel.SelectedValue)

            If Convert.ToInt32(Convert.ToInt32(txtTotalNoOfQuestion.Text) * (Convert.ToDouble(txtQuestionPickPercentage.Text) / 100)) > QuestionCount Then
                MessageBox("No Available Question With this Difficulty.")
                Exit Sub
            End If

            Dim ExamWiseSubject As New clsExamWiseSubject()

            ExamWiseSubject.SubjectID = drpSubjectListExamDef.SelectedValue
            ExamWiseSubject.SubjectName = drpSubjectListExamDef.SelectedItem.ToString()
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
        drpSubjectListExamDef.SelectedIndex = -1

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
        If (CheckDuplicateSubjectEntryExDf() = 0) Then
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

    Public Function CheckDuplicateSubjectEntryExDf() As Integer
        Dim lbl, lblDifficultyLevel As System.Web.UI.WebControls.Label
        For Each rw As GridViewRow In grdExamWiseSubject.Rows
            lbl = rw.FindControl("lblSubjectID")
            lblDifficultyLevel = rw.FindControl("lblDifficultyLevel")
            If lbl.Text = Nothing Then
                Return 0
            End If
            If drpSubjectListExamDef.SelectedValue.ToString() = lbl.Text Then
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

    Protected Sub btnSubmitExamDef_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmitExamDef.Click

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

    Protected Sub grdExamWiseGradingSystemExamDef_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grdExamWiseGradingSystemExamDef.RowDeleting
        Dim i As Integer
        Dim dtExamWiseGradingInfo As DataTable = New DataTable()

        dtExamWiseGradingInfo = Session("ExamWiseGradingData")

        i = e.RowIndex

        dtExamWiseGradingInfo.Rows(i).Delete()
        dtExamWiseGradingInfo.AcceptChanges()

        Session("ExamWiseGradingData") = dtExamWiseGradingInfo

        grdExamWiseGradingSystemExamDef.DataSource = dtExamWiseGradingInfo
        grdExamWiseGradingSystemExamDef.DataBind()

    End Sub

    Protected Sub drpGradSysTypeExamDef_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpGradSysTypeExamDef.SelectedIndexChanged
        If drpGradSysTypeExamDef.SelectedValue = "" Then
            MessageBox("Select A Grading System Type.")
            grdExamWiseGradingSystemExamDef.DataSource = ""
            grdExamWiseGradingSystemExamDef.DataBind()
            Exit Sub
        End If

        Dim GradSysType As New clsGradSysType()
        Dim dtGradingSystem As DataTable = New DataTable()
        ' dtGradingSystem = FormatGradingSystem()

        GradSysType.GradSysTypeID = drpGradSysTypeExamDef.SelectedValue
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

    Protected Sub grdExamWiseGradingSystemExamDef_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdExamWiseSubject.RowDataBound

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

    Protected Sub drpSubjectList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSubjectListExamDef.SelectedIndexChanged
        Dim subject As New clsSubjects()
        subject.SubjectID = drpSubjectListExamDef.SelectedValue
        GetSequenceNo(subject)
    End Sub

    Protected Sub GetSequenceNoExDf(ByVal Subject As clsSubjects)
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

#End Region

End Class
