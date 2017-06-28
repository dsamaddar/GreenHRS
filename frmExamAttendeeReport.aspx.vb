Imports System.IO
Imports System.IO.StreamWriter
Imports System.Data

Partial Class frmExamAttendeeReport
    Inherits System.Web.UI.Page

    Dim ExamData As New clsExamDataAccess()
    Dim QuestionPaperData As New clsQuestionPaperDataAccess()
    Dim TotalCandidate As Integer = 0

    Protected Sub btnShowReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShowReport.Click
        Try
            If Convert.ToDateTime(txtStartDate.Text) > Convert.ToDateTime(txtEndDate.Text) Then
                Dim a As DateTime = txtStartDate.Text
                txtStartDate.Text = txtEndDate.Text
                txtEndDate.Text = a
            End If

            grdExamAttendeeReport.DataSource = ExamData.fnExamAttendeeReport(Convert.ToDateTime(txtStartDate.Text), Convert.ToDateTime(txtEndDate.Text))
            grdExamAttendeeReport.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
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

    Protected Sub grdExamAttendeeReport_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdExamAttendeeReport.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            TotalCandidate += 1
        End If

        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(2).Text = "Total Applicant"
            e.Row.Cells(3).Text = TotalCandidate.ToString()
        End If

    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub grdExamAttendeeReport_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdExamAttendeeReport.SelectedIndexChanged
        Dim lblExamTakerID, lblExamRollNo As Label
        Dim QuestionPaper As New clsQuestionPaper()
        Try
            lblExamTakerID = grdExamAttendeeReport.SelectedRow.FindControl("lblExamTakerID")
            lblExamRollNo = grdExamAttendeeReport.SelectedRow.FindControl("lblExamRollNo")

            QuestionPaper.ExamTakerID = lblExamTakerID.Text
            QuestionPaper.ExamRollNo = lblExamRollNo.Text

            Dim Check As Integer = QuestionPaperData.fnActivateExam(QuestionPaper)

            If Check = 1 Then
                MessageBox("Activated Successfully.")
                ShowExamAttendee()
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ShowExamAttendee()

        If txtStartDate.Text = "" Or txtEndDate.Text = "" Then
            MessageBox("Input Correct Date Format")
            Exit Sub
        End If

        grdExamAttendeeReport.DataSource = ExamData.fnExamAttendeeReport(Convert.ToDateTime(txtStartDate.Text), Convert.ToDateTime(txtEndDate.Text))
        grdExamAttendeeReport.DataBind()
    End Sub

    Protected Sub imgBtnExportResult_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBtnExportResult.Click

        If txtStartDate.Text = "" Or txtEndDate.Text = "" Then
            MessageBox("Input Correct Date Format")
            Exit Sub
        End If

        grdExamAttendeeReport.DataSource = ExamData.fnExamAttendeeReport(Convert.ToDateTime(txtStartDate.Text), Convert.ToDateTime(txtEndDate.Text))
        grdExamAttendeeReport.DataBind()

        Try
            Response.Clear()
            Response.Buffer = True
            Response.AddHeader("content-disposition", "attachment;filename=ExamResult.xls")
            Response.Charset = ""
            Response.ContentType = "application/vnd.ms-excel"

            Dim sw As New StringWriter()
            Dim hw As New HtmlTextWriter(sw)

            grdExamAttendeeReport.AllowPaging = False
            grdExamAttendeeReport.DataBind()

            'Change the Header Row back to white color

            grdExamAttendeeReport.HeaderRow.Style.Add("background-color", "#FFFFFF")

            'Apply style to Individual Cells
            grdExamAttendeeReport.HeaderRow.Cells(0).Style.Add("background-color", "green")
            grdExamAttendeeReport.HeaderRow.Cells(1).Style.Add("background-color", "green")
            grdExamAttendeeReport.HeaderRow.Cells(2).Style.Add("background-color", "green")
            grdExamAttendeeReport.HeaderRow.Cells(3).Style.Add("background-color", "green")

            For i As Integer = 0 To grdExamAttendeeReport.Rows.Count - 1

                Dim row As GridViewRow = grdExamAttendeeReport.Rows(i)
                'Change Color back to white
                row.BackColor = System.Drawing.Color.White

                'Apply text style to each Row
                row.Attributes.Add("class", "textmode")

                'Apply style to Individual Cells of Alternating Row
                If i Mod 2 <> 0 Then
                    row.Cells(0).Style.Add("background-color", "#C2D69B")
                    row.Cells(1).Style.Add("background-color", "#C2D69B")
                    row.Cells(2).Style.Add("background-color", "#C2D69B")
                    row.Cells(3).Style.Add("background-color", "#C2D69B")
                End If

            Next

            grdExamAttendeeReport.RenderControl(hw)
            'style to format numbers to string
            Dim style As String = "<style>.textmode{mso-number-format:\@;}</style>"
            Response.Write(style)
            Response.Output.Write(sw.ToString())
            Response.Flush()
            Response.End()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
        

    End Sub

End Class
