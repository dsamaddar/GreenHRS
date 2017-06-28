
Partial Class ScreeningInterview_frmViewScreeningInterview
    Inherits System.Web.UI.Page

    Dim ScrIntData As New clsScreeningInterviewDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim ScrIntInfo As New clsScreeningInterview()
            Dim CandidateID = Request.QueryString("CandidateID")

            If CandidateID = "" Then
                MessageBox("No Candidate Information Provided.")
                Exit Sub
            End If

            Try
                ScrIntInfo = ScrIntData.fnGetScrInterviewInfo(CandidateID)

                lblScreenedBy.Text = ScrIntInfo.ScreenedBy
                lblScreenedDate.Text = ScrIntInfo.ScreenedDate
                lblInterviewMethod.Text = ScrIntInfo.InterviewMethod
                lblNextCourseOfAction.Text = ScrIntInfo.NextAction
                lblRemarks.Text = ScrIntInfo.Remarks

                If ScrIntInfo.IsAnyOneKnownToOurInstitution = 0 Then
                    lblDoKnowAnyOne.Text = "NO"
                Else
                    lblDoKnowAnyOne.Text = "YES" + " (" + ScrIntInfo.KnownDesignation + "[" + ScrIntInfo.KnownPerson + "]" + " )"
                End If
                lblHowToKnow.Text = ScrIntInfo.HowToKnowThePerson

                '' Show Responsibility Matched
                ShowResponsibilityMatched(CandidateID)

                '' Show Candidate Suitable For
                ShowCanSuitableFor(CandidateID)

                '' Show Question Options Selected
                ShowCanScrQuesOptionsSelected(CandidateID)



            Catch ex As Exception
                MessageBox(ex.Message)
            End Try
        End If
    End Sub

    Protected Sub ShowCanScrQuesOptionsSelected(ByVal CandidateID As String)
        grdQuestionAndAnswer.DataSource = ScrIntData.fnShowCanScrQuesOptionsSelected(CandidateID)
        grdQuestionAndAnswer.DataBind()
    End Sub

    Protected Sub ShowResponsibilityMatched(ByVal CandidateID As String)
        lstbxMatchWithCurrentJob.DataTextField = "DeptName"
        lstbxMatchWithCurrentJob.DataValueField = "DepartmentID"
        lstbxMatchWithCurrentJob.DataSource = ScrIntData.fnGetCandidateResMatched(CandidateID)
        lstbxMatchWithCurrentJob.DataBind()
    End Sub

    Protected Sub ShowCanSuitableFor(ByVal CandidateID As String)
        lstbxSuitableFor.DataTextField = "DeptName"
        lstbxSuitableFor.DataValueField = "DepartmentID"
        lstbxSuitableFor.DataSource = ScrIntData.fnGetCandidateSuitableFor(CandidateID)
        lstbxSuitableFor.DataBind()
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

End Class
