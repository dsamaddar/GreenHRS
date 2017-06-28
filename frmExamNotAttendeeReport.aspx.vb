Imports System.Net
Imports System.IO

Partial Class frmExamNotAttendeeReport
    Inherits System.Web.UI.Page

    Dim QuestionPaperData As New clsQuestionPaperDataAccess()
    Dim ExamData As New clsExamDataAccess()
    Dim TotalCount As Integer = 0

    Protected Sub btnShowReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShowReport.Click
        ShowNotAttendeeReport()
    End Sub

    Protected Sub ShowNotAttendeeReport()
        Try
            If Convert.ToDateTime(txtStartDate.Text) > Convert.ToDateTime(txtEndDate.Text) Then
                Dim a As DateTime = txtStartDate.Text
                txtStartDate.Text = txtEndDate.Text
                txtEndDate.Text = a
            End If

            grdExamAttendeeReport.DataSource = ExamData.fnExamNotAttendeeReport(Convert.ToDateTime(txtStartDate.Text), Convert.ToDateTime(txtEndDate.Text))
            grdExamAttendeeReport.DataBind()
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            txtStartDate.Text = Now.Date
            txtEndDate.Text = Now.Date.AddDays(1)
        End If
    End Sub

    Protected Sub grdExamAttendeeReport_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdExamAttendeeReport.SelectedIndexChanged
        Dim lblExamTakerID, lblExamRollNo As Label
        Dim QuestionPaper As New clsQuestionPaper()
        Try
            lblExamTakerID = grdExamAttendeeReport.SelectedRow.FindControl("lblExamTakerID")
            lblExamRollNo = grdExamAttendeeReport.SelectedRow.FindControl("lblExamRollNo")

            QuestionPaper.ExamTakerID = lblExamTakerID.Text
            QuestionPaper.ExamRollNo = lblExamRollNo.Text

            Dim Check As Integer = QuestionPaperData.fnInActivateExam(QuestionPaper)

            If Check = 1 Then
                MessageBox("In-Active Successfully.")
                ShowNotAttendeeReport()
                grdExamAttendeeReport.SelectedIndex = -1
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub grdExamAttendeeReport_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdExamAttendeeReport.RowDataBound
        Dim lblPhotoID As Label
        Dim imgEmployee As New Image

        If e.Row.RowType = DataControlRowType.DataRow Then
            TotalCount += 1

            lblPhotoID = e.Row.FindControl("lblPhotoID")
            imgEmployee = e.Row.FindControl("imgEmployee")

            Dim tClient As WebClient = New WebClient
            Dim memStrmPic As MemoryStream = New MemoryStream(tClient.DownloadData(ConfigurationManager.AppSettings("AttachmentsShow") & lblPhotoID.Text))
            Dim bytesPic As Byte() = memStrmPic.ToArray()
            Dim base64StringPic As String = Convert.ToBase64String(bytesPic, 0, bytesPic.Length)
            imgEmployee.ImageUrl = "data:image/png;base64," & base64StringPic
            memStrmPic.Dispose()

        End If

        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(2).Text = "Total:"
            e.Row.Cells(3).Text = TotalCount.ToString()
        End If
    End Sub
End Class
