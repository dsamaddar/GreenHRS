Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.OleDb
Imports System.Data.Common
Imports System.IO
Imports System.Math
Imports System.Configuration
Imports System.Web.UI

Partial Class frmExamDefinitionView
    Inherits System.Web.UI.Page

    Dim EWSData As New clsExamWiseSubjectData()
    Dim EWGData As New clsExamWiseGradingData()
    Dim ExamData As New clsExamDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            GetAvailableExams()
        End If

    End Sub

    Protected Sub SubGetExamWiseSubjects(ByVal ExamID As String)
        Dim EWS As New clsExamWiseSubjects()
        EWS.ExamID = ExamID
        grdExamWiseSubject.DataSource = EWSData.fnGetExamWiseSubject(EWS)
        grdExamWiseSubject.DataBind()
    End Sub

    Protected Sub SubGetExamWiseGrading(ByVal ExamID As String)
        Dim EWG As New clsExamWiseGradingSystem()
        EWG.ExamID = ExamID
        grdDefaultGradingSystem.DataSource = EWGData.fnGetExamWiseGradingSystem(EWG)
        grdDefaultGradingSystem.DataBind()
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

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub drpAvailableExams_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpAvailableExams.SelectedIndexChanged
        SubGetExamWiseSubjects(drpAvailableExams.SelectedValue)
        SubGetExamWiseGrading(drpAvailableExams.SelectedValue)

        Dim Exam As New clsExam
        Exam.ExamID = drpAvailableExams.SelectedValue
        Exam = ExamData.fnGetExamDetails(Exam)

        txtExamName.Text = Exam.ExamName
        txtExamCode.Text = Exam.ExamCode
        txtPositiveMarkingPerQuestion.Text = Exam.PositiveMarkingPerQuestion
        txtNegativeMarkingPerQuestion.Text = Exam.NegativeMarkingPerQuestion
        txtSkipMarkingPerQuestion.Text = Exam.SkipMarkingPerQuestion
        txtNotAnsweredPerQuestion.Text = Exam.NotAnsweredMarkingPerQuestion
        txtTotalNoOfQuestion.Text = Exam.TotalQuestion
        txtTotalMarks.Text = Exam.TotalMarks
        txtTotalTime.Text = Exam.TotalTime
        txtExamInstructions.Text = Exam.ExamInstructions

        If Exam.IsDynamic = True Then
            chkIsDynamicQuestionGeneration.Checked = True
        Else
            chkIsDynamicQuestionGeneration.Checked = False
        End If


    End Sub
End Class
