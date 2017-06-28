
Partial Class frmIntAssessmentInfo
    Inherits System.Web.UI.Page

    Dim IntAssessData As New clsIntCandidateAssessmentDataAccess()
    Dim IntReviewData As New clsInterviewerReviewDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Try
                Dim CandidateID = Request.QueryString("CandidateID")
                GetIntAssessment(CandidateID)
            Catch ex As Exception
                MessageBox(ex.Message)
            End Try
           
        End If
    End Sub

    Protected Sub GetIntAssessment(ByVal CandidateID As String)
        grdIntAssessment.DataSource = IntAssessData.fnGetIntInfoByCandidate(CandidateID)
        grdIntAssessment.DataBind()

        If grdIntAssessment.Rows.Count > 0 Then
            GetIntReview()
        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub GetIntReview()

        Dim lblIntCandidateID As New Label
        Dim grdIntReview As New GridView()

        For Each rw As GridViewRow In grdIntAssessment.Rows
            lblIntCandidateID = rw.FindControl("lblIntCandidateID")

            grdIntReview = rw.FindControl("grdIntReview")
            grdIntReview.DataSource = IntReviewData.fnGetIntReviewByIntCan(lblIntCandidateID.Text).Tables(0)
            grdIntReview.DataBind()
        Next
    End Sub

End Class
