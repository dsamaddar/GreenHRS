Imports System.IO

Partial Class frmExamWiseSummaryRpt
    Inherits System.Web.UI.Page

    Dim ExamData As New clsExamDataAccess()

    Protected Sub btnShowResult_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShowResult.Click

        grdExamWiseSummaryRpt.DataSource = ""
        grdExamWiseSummaryRpt.DataBind()

        Try
            grdExamWiseSummaryRpt.DataSource = ExamData.fnGetExamSummary(drpAvailableExams.SelectedValue)
            grdExamWiseSummaryRpt.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetAvailableExams()
        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
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

    Protected Sub imgBtnExport_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBtnExport.Click
        Dim sw As New StringWriter()
        Dim hw As New System.Web.UI.HtmlTextWriter(sw)
        Dim frm As HtmlForm = New HtmlForm()

        Page.Response.AddHeader("content-disposition", "attachment;filename=ExamWiseSummary.xls")
        Page.Response.ContentType = "application/vnd.ms-excel"
        Page.Response.Charset = ""
        Page.EnableViewState = False
        frm.Attributes("runat") = "server"
        Controls.Add(frm)
        frm.Controls.Add(grdExamWiseSummaryRpt)
        frm.RenderControl(hw)
        Response.Write(sw.ToString())
        Response.End()
    End Sub
End Class
