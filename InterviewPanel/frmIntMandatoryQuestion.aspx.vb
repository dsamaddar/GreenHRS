
Partial Class InterviewPanel_frmIntMandatoryQuestion
    Inherits System.Web.UI.Page

    Dim IntManQuesData As New clsIntManQuestionDataAccess()

    Protected Sub btnSubmitQuestion_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmitQuestion.Click

        Dim IntManQuestion As New clsIntManQuestion()
        IntManQuestion.Question = txtMandatoryQuestion.Text
        IntManQuestion.QuestionOrder = Convert.ToInt32(txtQuestionOrder.Text)
        If chkIntManQuestionIsActive.Checked = True Then
            IntManQuestion.IsActive = True
        Else
            IntManQuestion.IsActive = False
        End If

        IntManQuestion.EntryBy = Session("LoginUserID")

        If btnSubmitQuestion.Text = "Submit" Then
            Dim Check As Integer = IntManQuesData.fnInsertIntManQuestion(IntManQuestion)
            If Check = 1 Then
                MessageBox("Inserted.")
                ClearIntManQuestionForm()
                ShowAvailableIntManQuestions()
            Else
                MessageBox("Error Found.")
            End If
        Else
            Dim lblIntManQuestionID As New System.Web.UI.WebControls.Label()
            lblIntManQuestionID = grdAvailableIntManQuestions.SelectedRow.FindControl("lblIntManQuestionID")
            IntManQuestion.IntManQuestionID = lblIntManQuestionID.Text

            Dim Check As Integer = IntManQuesData.fnUpdateIntManQuestion(IntManQuestion)
            If Check = 1 Then
                MessageBox("Updated.")
                btnSubmitQuestion.Text = "Submit"
                ClearIntManQuestionForm()
                ShowAvailableIntManQuestions()
            Else
                MessageBox("Error Found.")
            End If
        End If

    End Sub

    Protected Sub ShowAvailableIntManQuestions()
        grdAvailableIntManQuestions.DataSource = IntManQuesData.fnShowManQuestions(True)
        grdAvailableIntManQuestions.DataBind()
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub ClearIntManQuestionForm()
        txtMandatoryQuestion.Text = ""
        txtQuestionOrder.Text = ""
        chkIntManQuestionIsActive.Checked = False
        btnSubmitQuestion.Text = "Submit"
        If grdAvailableIntManQuestions.Rows.Count >= 0 Then
            grdAvailableIntManQuestions.SelectedIndex = -1
        End If
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearIntManQuestionForm()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            ShowAvailableIntManQuestions()
        End If
    End Sub

    Protected Sub grdAvailableIntManQuestions_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdAvailableIntManQuestions.SelectedIndexChanged

        Dim lblIntManQuestionID As New System.Web.UI.WebControls.Label()

        lblIntManQuestionID = grdAvailableIntManQuestions.SelectedRow.FindControl("lblIntManQuestionID")

        Dim IntManQuestion As New clsIntManQuestion()

        IntManQuestion.IntManQuestionID = lblIntManQuestionID.Text

        IntManQuestion = IntManQuesData.fnGetIntManQuesByID(IntManQuestion)

        If IntManQuestion Is Nothing Then
            MessageBox("Error Found In Selection.")
            grdAvailableIntManQuestions.SelectedIndex = -1
            Exit Sub
        Else
            If IntManQuestion.IsActive = True Then
                chkIntManQuestionIsActive.Checked = True
            Else
                chkIntManQuestionIsActive.Checked = False
            End If

            txtMandatoryQuestion.Text = IntManQuestion.Question
            txtQuestionOrder.Text = String.Format("{0:#,###}", IntManQuestion.QuestionOrder)
            btnSubmitQuestion.Text = "Update"
        End If

    End Sub
End Class
