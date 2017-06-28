
Partial Class EmployeeProfile_frmEmpCompleteEvaluation
    Inherits System.Web.UI.Page

    Dim PerfFactorData As New clsPerformanceFactorDataAccess()
    Dim EvalGradingData As New clsEvaluationGradingDataAccess()
    Dim EmpEvalInfoData As New clsEmpEvalInfoDataAccess()
    Dim EvalSummaryData As New clsEvaluationSummaryDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim EmpEvaluationSummaryID As String = Request.QueryString("EmpEvaluationSummaryID")
            If EmpEvaluationSummaryID = "" Then
                MessageBox("Error Generating Form")
                Exit Sub
            End If
            GetSecEvaluationForm(EmpEvaluationSummaryID)
        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub GetSecEvaluationForm(ByVal EmpEvaluationSummaryID As String)
        grdSecEvaluationForm.DataSource = PerfFactorData.fnGetEvalFormForSecEval(EmpEvaluationSummaryID).Tables(0)
        grdSecEvaluationForm.DataBind()

        PopulatePrimaryEvalGrading()
        PopulateSecondaryEvalGrading()
    End Sub

    Protected Sub PopulatePrimaryEvalGrading()
        Dim rdbtnEvaluationGrade As New RadioButtonList()
        Dim lblEmpEvaluationID As New Label()
        Dim EvalGrading As New clsEvaluationGrading()
        Dim EvalInfo As New clsEmpEvalInfo()

        For Each rw As GridViewRow In grdSecEvaluationForm.Rows
            EvalGrading.GradeType = "Primary"
            rdbtnEvaluationGrade = rw.FindControl("rdbtnEvaluationGrade")
            lblEmpEvaluationID = rw.FindControl("lblEmpEvaluationID")

            EvalInfo.EmpEvaluationID = lblEmpEvaluationID.Text
            EvalInfo.EvaluationType = "Primary"

            rdbtnEvaluationGrade.DataTextField = "GradeText"
            rdbtnEvaluationGrade.DataValueField = "EvaluationGradingID"
            rdbtnEvaluationGrade.DataSource = EvalGradingData.fnGetEvalGradeByType(EvalGrading)
            rdbtnEvaluationGrade.DataBind()

            EvalInfo = EmpEvalInfoData.fnGetGradingByEvalID(EvalInfo)

            If EvalInfo.GradingValue <> "N\A" Then
                rdbtnEvaluationGrade.SelectedValue = EvalInfo.GradingValue
            End If


        Next

    End Sub

    Protected Sub PopulateSecondaryEvalGrading()
        Dim rdbtnSecEvaluationGrade As New RadioButtonList()
        Dim lblEmpEvaluationID As New Label()
        Dim EvalGrading As New clsEvaluationGrading()
        Dim EvalInfo As New clsEmpEvalInfo()

        For Each rw As GridViewRow In grdSecEvaluationForm.Rows
            EvalGrading.GradeType = "Secondary"
            rdbtnSecEvaluationGrade = rw.FindControl("rdbtnSecEvaluationGrade")
            lblEmpEvaluationID = rw.FindControl("lblEmpEvaluationID")

            EvalInfo.EmpEvaluationID = lblEmpEvaluationID.Text
            EvalInfo.EvaluationType = "Secondary"

            rdbtnSecEvaluationGrade.DataTextField = "GradeText"
            rdbtnSecEvaluationGrade.DataValueField = "EvaluationGradingID"
            rdbtnSecEvaluationGrade.DataSource = EvalGradingData.fnGetEvalGradeByType(EvalGrading)
            rdbtnSecEvaluationGrade.DataBind()

            EvalInfo = EmpEvalInfoData.fnGetGradingByEvalID(EvalInfo)

            If EvalInfo.GradingValue <> "N\A" Then
                rdbtnSecEvaluationGrade.SelectedValue = EvalInfo.GradingValue
            End If
        Next

    End Sub

End Class
