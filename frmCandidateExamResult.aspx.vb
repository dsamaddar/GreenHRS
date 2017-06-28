Imports System.Net
Imports System.IO
Imports System.IO.StreamWriter
Imports System.Data

Partial Class frmCandidateExamResult
    Inherits System.Web.UI.Page

    Dim ExamData As New clsExamDataAccess()
    Dim TotalCandidate As Integer = 0

    Protected Sub btnShowResult_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShowResult.Click
        If drpAvailableExams.SelectedValue = "N\A" Then
            MessageBox("Select Valid Exam")
            Exit Sub
        End If
        ShowResult()
    End Sub

    Protected Sub ShowResult()
        If txtEndDate.Text = "" Or txtStartDate.Text = "" Then
            MessageBox("Input Correct Date Format")
            Exit Sub
        ElseIf Convert.ToDateTime(txtStartDate.Text) > Convert.ToDateTime(txtEndDate.Text) Then
            Dim a As DateTime = txtStartDate.Text
            txtStartDate.Text = txtEndDate.Text
            txtEndDate.Text = a
        End If

        grdExamResult.DataSource = ExamData.fnShowTotalExamResult(drpAvailableExams.SelectedValue, Convert.ToDateTime(txtStartDate.Text), Convert.ToDateTime(txtEndDate.Text))
        grdExamResult.DataBind()
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtStartDate.Text = Now.Date
            txtEndDate.Text = Now.Date.AddDays(1)
            GetAvailableExams()
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

    Protected Sub imgBtnExportResult_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBtnExportResult.Click
        If txtEndDate.Text = "" Or txtStartDate.Text = "" Then
            MessageBox("Input Correct Date Format")
            Exit Sub
        ElseIf Convert.ToDateTime(txtStartDate.Text) > Convert.ToDateTime(txtEndDate.Text) Then
            Dim a As DateTime = txtStartDate.Text
            txtStartDate.Text = txtEndDate.Text
            txtEndDate.Text = a
        End If

        grdExamResult.DataSource = ExamData.fnShowTotalExamResult(drpAvailableExams.SelectedValue, Convert.ToDateTime(txtStartDate.Text), Convert.ToDateTime(txtEndDate.Text))
        grdExamResult.DataBind()

        Try
            Response.Clear()
            Response.Buffer = True
            Response.AddHeader("content-disposition", "attachment;filename=ExamResult.xls")
            Response.Charset = ""
            Response.ContentType = "application/vnd.ms-excel"

            Dim sw As New StringWriter()
            Dim hw As New HtmlTextWriter(sw)

            grdExamResult.AllowPaging = False
            grdExamResult.DataBind()

            'Change the Header Row back to white color

            grdExamResult.HeaderRow.Style.Add("background-color", "#FFFFFF")

            'Apply style to Individual Cells
            grdExamResult.HeaderRow.Cells(0).Style.Add("background-color", "green")
            grdExamResult.HeaderRow.Cells(1).Style.Add("background-color", "green")
            grdExamResult.HeaderRow.Cells(2).Style.Add("background-color", "green")
            grdExamResult.HeaderRow.Cells(3).Style.Add("background-color", "green")

            For i As Integer = 0 To grdExamResult.Rows.Count - 1

                Dim row As GridViewRow = grdExamResult.Rows(i)
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

            grdExamResult.RenderControl(hw)
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

    Public Property dir() As SortDirection
        Get
            If ViewState("dirState") Is Nothing Then
                ViewState("dirState") = SortDirection.Ascending
            End If
            Return DirectCast(ViewState("dirState"), SortDirection)
        End Get
        Set(ByVal value As SortDirection)
            ViewState("dirState") = value
        End Set
    End Property

    Protected Sub grdExamResult_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdExamResult.RowDataBound
        Dim lblPhotoID As New Label()
        Dim imgEmployee As New Image
        If e.Row.RowType = DataControlRowType.DataRow Then
            TotalCandidate += 1

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
            e.Row.Cells(4).Text = "Total Candidate:"
            e.Row.Cells(5).Text = TotalCandidate.ToString()
        End If
    End Sub

    Protected Sub grdExamResult_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles grdExamResult.Sorting
        Dim sortingDirection As String = String.Empty
        If dir = SortDirection.Ascending Then
            dir = SortDirection.Descending
            sortingDirection = "Desc"
        Else
            dir = SortDirection.Ascending
            sortingDirection = "Asc"
        End If

        Dim sortedView As New DataView(ExamData.fnShowTotalExamResult(drpAvailableExams.SelectedValue, Convert.ToDateTime(txtStartDate.Text), Convert.ToDateTime(txtEndDate.Text)).Tables(0))
        sortedView.Sort = Convert.ToString(e.SortExpression) & " " & sortingDirection
        grdExamResult.DataSource = sortedView
        grdExamResult.DataBind()

    End Sub
End Class
