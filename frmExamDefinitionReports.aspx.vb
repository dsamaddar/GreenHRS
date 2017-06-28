Imports System.Globalization
Partial Class frmExamDefinitionReports
    Inherits System.Web.UI.Page

    Dim QuesPaperData As New clsQuestionPaperDataAccess()
    Dim ExamData As New clsExamDataAccess()
    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()

    Protected Sub btnProcessReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcessReport.Click
        Dim QuesPaper As New clsQuestionPaper()
        Try
            QuesPaper.ExamID = drpAvailableExams.SelectedValue
            QuesPaper.ULCBranchID = ddlULCBranch.SelectedValue
            QuesPaper.ExamTakerID = txtExamTakerID.Text
            QuesPaper.ExamRollNo = txtExamRollNo.Text
            QuesPaper.ExamTakenStr = drpExamTaken.SelectedValue
            If txtStartDate.Text = "" Then
                QuesPaper.StartTime = "1/1/1900"
            Else
                QuesPaper.StartTime = Convert.ToDateTime(txtStartDate.Text)
            End If

            If String.IsNullOrEmpty(txtEndDate.Text) Then
                QuesPaper.EndTime = "1/1/1900"
            Else
                QuesPaper.EndTime = Convert.ToDateTime(txtEndDate.Text)
            End If

            grdExamDefReport.DataSource = QuesPaperData.fnReportExam(QuesPaper)
            grdExamDefReport.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ShowULCBranch()
        ddlULCBranch.DataTextField = "ULCBranchName"
        ddlULCBranch.DataValueField = "ULCBranchID"
        ddlULCBranch.DataSource = EmployeeInfoData.fnGetULCBranch()
        ddlULCBranch.DataBind()

        Dim A As New ListItem()
        A.Text = "N\A"
        A.Value = "N\A"
        ddlULCBranch.Items.Insert(0, A)
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetAvailableExams()
            ShowULCBranch()
        End If
    End Sub

End Class
