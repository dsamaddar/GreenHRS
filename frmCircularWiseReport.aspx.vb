
Partial Class frmCircularWiseReport
    Inherits System.Web.UI.Page

    Dim TotalApplicant, TotalRecruitment, TotalExamTaker, TotalRejectedCV, RemainingCV, TotalInterviewTaken As Integer
    Dim JobData As New clsJobCircularDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            TotalApplicant = 0
            TotalRecruitment = 0
            TotalExamTaker = 0
            TotalRejectedCV = 0
            RemainingCV = 0
            TotalInterviewTaken = 0
            ShowCircularWiseReport()
        End If
    End Sub

    Protected Sub ShowCircularWiseReport()
        grdCircularWiseReport.DataSource = JobData.fnAllSummaryOfJobCircular()
        grdCircularWiseReport.DataBind()
    End Sub

    Protected Sub grdCircularWiseReport_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdCircularWiseReport.RowDataBound
        Dim lblTotalApplicant, lblTotalRecruitment, lblTotalExamTaker, lblTotalRejectedCV, lblRemainingCV, lblTotalInterviewTaken As New Label

        If e.Row.RowType = DataControlRowType.DataRow Then
            lblTotalApplicant = e.Row.FindControl("lblTotalApplicant")
            lblTotalRecruitment = e.Row.FindControl("lblTotalRecruitment")
            lblTotalExamTaker = e.Row.FindControl("lblTotalExamTaker")
            lblTotalRejectedCV = e.Row.FindControl("lblTotalRejectedCV")
            lblRemainingCV = e.Row.FindControl("lblRemainingCV")
            lblTotalInterviewTaken = e.Row.FindControl("lblTotalInterviewTaken")

            TotalApplicant += Convert.ToInt32(lblTotalApplicant.Text)
            TotalRecruitment += Convert.ToInt32(lblTotalRecruitment.Text)
            TotalExamTaker += Convert.ToInt32(lblTotalExamTaker.Text)
            TotalRejectedCV += Convert.ToInt32(lblTotalRejectedCV.Text)
            RemainingCV += Convert.ToInt32(lblRemainingCV.Text)
            TotalInterviewTaken += Convert.ToInt32(lblTotalInterviewTaken.Text)

        End If

        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(3).Text = TotalApplicant.ToString()
            e.Row.Cells(3).Font.Bold = True
            e.Row.Cells(4).Text = TotalRecruitment.ToString()
            e.Row.Cells(4).Font.Bold = True
            e.Row.Cells(5).Text = TotalExamTaker.ToString()
            e.Row.Cells(5).Font.Bold = True
            e.Row.Cells(6).Text = TotalRejectedCV.ToString()
            e.Row.Cells(6).Font.Bold = True
            e.Row.Cells(7).Text = RemainingCV.ToString()
            e.Row.Cells(7).Font.Bold = True
            e.Row.Cells(8).Text = TotalInterviewTaken.ToString()
            e.Row.Cells(8).Font.Bold = True
        End If

    End Sub

End Class
