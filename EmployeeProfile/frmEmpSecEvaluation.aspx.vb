
Partial Class EmployeeProfile_frmEmpSecEvaluation
    Inherits System.Web.UI.Page

    Dim PerfFactorData As New clsPerformanceFactorDataAccess()
    Dim EvalGradingData As New clsEvaluationGradingDataAccess()
    Dim EmpEvalInfoData As New clsEmpEvalInfoDataAccess()
    Dim EvalSummaryData As New clsEvaluationSummaryDataAccess()
    Dim PerformanceRating As New clsPerformanceRating()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim EmpEvaluationSummaryID As String = Request.QueryString("EmpEvaluationSummaryID")
            If EmpEvaluationSummaryID = "" Then
                MessageBox("Error Generating Form")
                Exit Sub
            End If
            GetSecEvaluationForm(EmpEvaluationSummaryID)
            GetPerformanceRating()
            GetPrimaryRating(EmpEvaluationSummaryID)
        End If
    End Sub

    Protected Sub GetEmpDisagreement(ByVal EmpEvaluationSummaryID As String)

    End Sub

    Protected Sub GetPrimaryRating(ByVal EmpEvaluationSummaryID As String)
        Try
            Dim EvalSummary As New clsEvaluationSummary()
            EvalSummary = EvalSummaryData.fnGetPrimaryPerformanceRating(EmpEvaluationSummaryID)

            If EvalSummary.PerformanceRatingID <> "N\A" Then
                drpOverallPerformance.SelectedValue = EvalSummary.PerformanceRatingID
            Else
                drpOverallPerformance.SelectedIndex = -1
            End If

            If EvalSummary.RecForBonus = True Then
                drpRecForBonus.SelectedValue = "YES"
            Else
                drpRecForBonus.SelectedValue = "NO"
            End If

            If EvalSummary.RecForProgression = True Then
                drpRecForProgression.SelectedValue = "YES"
            Else
                drpRecForProgression.SelectedValue = "NO"
            End If

            lblEmpDisagreement.Text = EvalSummary.Disagreement
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub


    Protected Sub GetPerformanceRating()
        drpOverallPerformance.DataTextField = "PerformanceRating"
        drpOverallPerformance.DataValueField = "PerformanceRatingID"
        drpOverallPerformance.DataSource = PerformanceRating.fnGetPerformanceRating()
        drpOverallPerformance.DataBind()

        drpOverallPerformanceSec.DataTextField = "PerformanceRating"
        drpOverallPerformanceSec.DataValueField = "PerformanceRatingID"
        drpOverallPerformanceSec.DataSource = PerformanceRating.fnGetPerformanceRating()
        drpOverallPerformanceSec.DataBind()

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
        Dim EvalGrading As New clsEvaluationGrading()

        For Each rw As GridViewRow In grdSecEvaluationForm.Rows
            EvalGrading.GradeType = "Secondary"
            rdbtnSecEvaluationGrade = rw.FindControl("rdbtnSecEvaluationGrade")
            rdbtnSecEvaluationGrade.DataTextField = "GradeText"
            rdbtnSecEvaluationGrade.DataValueField = "EvaluationGradingID"
            rdbtnSecEvaluationGrade.DataSource = EvalGradingData.fnGetEvalGradeByType(EvalGrading)
            rdbtnSecEvaluationGrade.DataBind()
        Next

    End Sub

    Protected Sub btnEvaluate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEvaluate.Click
        Dim rdbtnSecEvaluationGrade As New RadioButtonList()
        Dim lblEmpEvaluationID As New Label()
        Dim EvalInfo As New clsEmpEvalInfo()
        Dim Check As Integer = 0
        For Each rw As GridViewRow In grdSecEvaluationForm.Rows
            lblEmpEvaluationID = rw.FindControl("lblEmpEvaluationID")
            rdbtnSecEvaluationGrade = rw.FindControl("rdbtnSecEvaluationGrade")
            EvalInfo.EmpEvaluationID = lblEmpEvaluationID.Text
            EvalInfo.SecondaryEvalGrading = rdbtnSecEvaluationGrade.SelectedValue
            Check = EmpEvalInfoData.fnInsertSecEvalInfo(EvalInfo)
        Next

        If Check = 1 Then
            ' Update Summary Table
            Dim EmpEvaluationSummaryID As String = Request.QueryString("EmpEvaluationSummaryID")
            Dim EvalSummary As New clsEvaluationSummary()
            EvalSummary.EmpEvaluationSummaryID = EmpEvaluationSummaryID
            EvalSummary.PerformanceRatingSecID = drpOverallPerformanceSec.SelectedValue

            If drpRecForBonusSec.SelectedValue = "YES" Then
                EvalSummary.RecForBonusSec = True
            Else
                EvalSummary.RecForBonusSec = False
            End If

            If drpRecForProgressionSec.SelectedValue = "YES" Then
                EvalSummary.RecForProgressionSec = True
            Else
                EvalSummary.RecForProgressionSec = False
            End If

            Check = EvalSummaryData.fnUpdateEvalSummarySecEval(EvalSummary)
            MessageBox("Evaluation Done.")
            ReloadParent()
            btnEvaluate.Enabled = False
        End If

    End Sub

    Protected Sub ReloadParent()
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script type='text/javascript'>RefreshParent();</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub chkIsAgree_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkIsAgree.CheckedChanged
        If chkIsAgree.Checked = True Then
            drpOverallPerformanceSec.SelectedValue = drpOverallPerformance.SelectedValue
            drpRecForBonusSec.SelectedValue = drpRecForBonus.SelectedValue
            drpRecForProgressionSec.SelectedValue = drpRecForProgression.SelectedValue

            drpOverallPerformanceSec.Enabled = False
            drpRecForBonusSec.Enabled = False
            drpRecForProgressionSec.Enabled = False
        Else
            drpOverallPerformanceSec.SelectedIndex = -1
            drpRecForBonusSec.SelectedIndex = -1
            drpRecForProgressionSec.SelectedIndex = -1

            drpOverallPerformanceSec.Enabled = True
            drpRecForBonusSec.Enabled = True
            drpRecForProgressionSec.Enabled = True
        End If
        
    End Sub

End Class
