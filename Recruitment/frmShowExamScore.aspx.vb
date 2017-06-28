
Partial Class Recruitment_frmShowExamScore
    Inherits System.Web.UI.Page

    Dim CVSelectionData As New clsCVSelectionDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            Dim ExamTakerID As String = Session("RecCandidateID")

            grdExamScoreSummary.DataSource = CVSelectionData.fnGetCandidateWiseSummaryResult(ExamTakerID)
            grdExamScoreSummary.DataBind()

        End If
    End Sub
End Class
