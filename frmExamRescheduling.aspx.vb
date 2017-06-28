
Partial Class frmExamRescheduling
    Inherits System.Web.UI.Page

    Dim ExamData As New clsExamDataAccess()
    Dim QuestionPaperData As New clsQuestionPaperDataAccess()

    Protected Sub btnShowAvailableExams_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShowAvailableExams.Click
        grdAvailableExams.DataSource = ExamData.fnExamAttendeeReport(Convert.ToDateTime(txtStartDate.Text), Convert.ToDateTime(txtEndDate.Text))
        grdAvailableExams.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            GetAvailableExams()
            txtStartDate.Text = Now.Date
            txtEndDate.Text = Now.Date.AddDays(1)
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

    Protected Sub grdAvailableExams_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdAvailableExams.SelectedIndexChanged
        Dim lblEffectiveDate As Label
        lblEffectiveDate = grdAvailableExams.SelectedRow.FindControl("lblEffectiveDate")

        txtExamDate.Text = Convert.ToDateTime(lblEffectiveDate.Text).ToShortDateString

    End Sub

    Protected Sub btnUpdateExam_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateExam.Click
        Dim QuestionPaper As New clsQuestionPaper()
        Dim lblExamTakerID, lblExamRollNo As Label

        lblExamTakerID = grdAvailableExams.SelectedRow.FindControl("lblExamTakerID")
        lblExamRollNo = grdAvailableExams.SelectedRow.FindControl("lblExamRollNo")

        QuestionPaper.ExamTakerID = lblExamTakerID.Text
        QuestionPaper.ExamRollNo = lblExamRollNo.Text
        QuestionPaper.EffectiveDate = txtExamDate.Text & " " & drpSHour.SelectedValue & ":" & drpSMin.SelectedValue & ":00" & " " & drpSAMPM.SelectedValue

        Dim Check As Integer = QuestionPaperData.fnRescheduleExam(QuestionPaper)

        If Check = 1 Then
            MessageBox("Rescheduled Successfully.")
            ClearForm()
        Else
            MessageBox("Error Found.")
        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub ClearForm()
        txtExamDate.Text = ""
        drpSHour.SelectedIndex = -1
        drpSMin.SelectedIndex = -1
        drpSAMPM.SelectedIndex = -1

        grdAvailableExams.SelectedIndex = -1

        grdAvailableExams.DataSource = ExamData.fnExamAttendeeReport(Convert.ToDateTime(txtStartDate.Text), Convert.ToDateTime(txtEndDate.Text))
        grdAvailableExams.DataBind()

    End Sub

End Class
