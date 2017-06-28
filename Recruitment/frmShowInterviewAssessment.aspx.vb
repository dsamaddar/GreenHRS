
Partial Class Recruitment_frmShowInterviewAssessment
    Inherits System.Web.UI.Page

    Dim IntCanAssessmentData As New clsIntCandidateAssessmentDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            Dim intCanAssessInfo As New clsIntCandidateAssessment()

            If Request.QueryString("CandidateID") <> "" And Request.QueryString("CircularID") <> "" Then
                intCanAssessInfo.CandidateID = Request.QueryString("CandidateID")
                intCanAssessInfo.CircularID = Request.QueryString("CircularID")
            Else
                intCanAssessInfo.CandidateID = Session("RecCandidateID")
                intCanAssessInfo.CircularID = Session("RecCircularID")
            End If

            ShowCandidateAssessment(intCanAssessInfo)
        End If
    End Sub

    Protected Sub ShowCandidateAssessment(ByVal intCanAssessInfo As clsIntCandidateAssessment)
        grdInterviewAssessment.DataSource = IntCanAssessmentData.fnShowIntAssessmentByCanID(intCanAssessInfo)
        grdInterviewAssessment.DataBind()
    End Sub

End Class
