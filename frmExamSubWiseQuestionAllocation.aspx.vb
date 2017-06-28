
Partial Class frmExamSubWiseQuestionAllocation
    Inherits System.Web.UI.Page

    Dim ExamData As New clsExamDataAccess()
    Dim ExamPaperData As New clsExamPaperDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            Dim EWSID As String = Request.QueryString("EWSID")
            GetExamSubWiseAllocatedQuestions(EWSID)
        End If
    End Sub

    Protected Sub GetExamSubWiseAllocatedQuestions(ByVal EWSID As String)
        grdExamSubWiseQuestionAllocation.DataSource = ExamData.fnGetExamSubWiseAllocatedQuestions(EWSID)
        grdExamSubWiseQuestionAllocation.DataBind()
    End Sub

    Protected Sub grdExamSubWiseQuestionAllocation_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles grdExamSubWiseQuestionAllocation.RowCommand

        Try
            If e.CommandName = "Delete" Then
                Dim EWSID As String = Request.QueryString("EWSID")

                Dim index As Integer = Convert.ToInt32(e.CommandArgument)

                Dim lblQuestionID As New System.Web.UI.WebControls.Label()

                lblQuestionID = grdExamSubWiseQuestionAllocation.Rows(index).FindControl("lblQuestionID")

                Dim ExamPaper As New clsExamPaper()

                ExamPaper.QuestionID = lblQuestionID.Text
                ExamPaper.ExamWiseSubjectID = EWSID

                Dim Check As Integer = ExamPaperData.fnInactiveExamWiseQuestion(ExamPaper)

                If Check = 1 Then
                    GetExamSubWiseAllocatedQuestions(EWSID)
                    MessageBox("Successfully Deleted.")
                Else
                    MessageBox("Error Found.")
                End If
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

End Class
