
Partial Class ScreeningInterview_frmScreeningSettings
    Inherits System.Web.UI.Page
    Dim DataAccess As New clsScreeningInterviewSettingsDataAccess()

#Region "Question"
    Protected Sub ClearScreeningQuestion()
        txtQSerial.Text = ""
        txtScreeningQuestion.Text = ""
        chkScrQuesIsActive.Checked = False
    End Sub

    Protected Sub ShowScreeningQuestionForGrid()
        grdQuestion.DataSource = DataAccess.fnGetAllScreeningQuestions()
        grdQuestion.DataBind()
    End Sub
    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnAddScrQuestion_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddScrQuestion.Click
        Dim UserID As String
        UserID = Session("LoginUserID")

        Dim QuestionSerial, Question, EntryBy As String
        Dim IsActive As Integer

        QuestionSerial = txtQSerial.Text
        Question = txtScreeningQuestion.Text

        If chkScrQuesIsActive.Checked = True Then
            IsActive = True
        Else
            IsActive = False
        End If

        EntryBy = UserID

        Dim check As Integer = DataAccess.fnInsertScreeningQuestions(Question, QuestionSerial, IsActive, EntryBy)

        If check = 1 Then
            ClearScreeningQuestion()
            GetScreeningQuestion()
            ShowScreeningQuestionForGrid()
            MessageBox("Inserted.")
        Else
            MessageBox("Error Found.")
        End If
        txtQSerial.Focus()
    End Sub

    Protected Sub btnCancelScrQuestionInput_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelScrQuestionInput.Click
        ClearScreeningQuestion()
    End Sub
#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowScreeningQuestionForGrid()
            GetScreeningQuestion()
            ShowScreeningQuestionOptionsForGrid()
        End If
        
    End Sub

#Region "Options"

    Protected Sub GetScreeningQuestion()
        drpScreeningQuestionSelection.DataTextField = "Question"
        drpScreeningQuestionSelection.DataValueField = "ScreeningQuesID"
        drpScreeningQuestionSelection.DataSource = DataAccess.fnGetActiveScreeningQuestions()
        drpScreeningQuestionSelection.DataBind()
    End Sub

    Protected Sub btnAddScrQuesOption_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddScrQuesOption.Click
        Dim UserID As String
        UserID = Session("LoginUserID")
        Dim ScreeningQuesTypeID, OptionType, Options, EntryBy As String
        Dim IsActive As Boolean = False

        ScreeningQuesTypeID = drpScreeningQuestionSelection.SelectedValue
        OptionType = drpScreeningQuestionOptionType.SelectedValue
        Options = txtScrQuesOption.Text

        EntryBy = UserID

        Dim check As Integer = DataAccess.fnInsertScreeningQuestionsOptions(ScreeningQuesTypeID, OptionType, Options, EntryBy)

        If check = 1 Then
            ClearScreeningQuestionOptions()
            ShowScreeningQuestionOptionsForGrid()
            MessageBox("Inserted.")
            drpScreeningQuestionSelection.Focus()
        Else
            MessageBox("Error Found.")
        End If
        txtQSerial.Focus()
    End Sub

    Protected Sub btnCancelScrQuesOptions_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelScrQuesOptions.Click
        ClearScreeningQuestionOptions()
    End Sub

    Protected Sub ClearScreeningQuestionOptions()
        drpScreeningQuestionSelection.SelectedIndex = -1
        drpScreeningQuestionOptionType.SelectedIndex = -1
        txtScrQuesOption.Text = ""
    End Sub

    Protected Sub ShowScreeningQuestionOptionsForGrid()
        grdOptionType.DataSource = DataAccess.fnGetAllScreeningQuestionsOptions()
        grdOptionType.DataBind()
    End Sub

#End Region

    
End Class
