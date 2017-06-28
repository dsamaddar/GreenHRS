
Partial Class ScreeningInterview_frmScreeningInterview
    Inherits System.Web.UI.Page

    Dim JobCircularData As New clsJobCircularDataAccess()
    Dim CandidateData As New clsCanBasicDataAccess()
    Dim CVSelectionData As New clsCVSelectionDataAccess()

    Protected Sub rdbtnAnyOneKnownInThisInstitution_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdbtnAnyOneKnownInThisInstitution.SelectedIndexChanged
        If rdbtnAnyOneKnownInThisInstitution.SelectedValue = "YES" Then
            pnlAnyOneKnownToCandidate.Visible = True
        Else
            pnlAnyOneKnownToCandidate.Visible = False
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetJobCircularList()
            ShowSuitableFor()
            pnlAnyOneKnownToCandidate.Visible = False

            lblQ01.Text = "=>"

        End If
    End Sub

    Protected Sub GetJobCircularList()
        drpAvailableCircular.DataTextField = "JobTitle"
        drpAvailableCircular.DataValueField = "CircularID"
        drpAvailableCircular.DataSource = JobCircularData.fnGetJobCircularList()
        drpAvailableCircular.DataBind()

        Dim CircularID As String = drpAvailableCircular.SelectedValue

        If drpAvailableCircular.Items.Count >= 0 Then
            drpAvailableCircular.SelectedIndex = 0
            GetAppliedCandidates(CircularID)
        End If

    End Sub

    Protected Sub GetAppliedCandidates(ByVal CircularID As String)
        grdNewCV.DataSource = CVSelectionData.fnCVGetForAppliedJobByID(CircularID, "Applied")
        grdNewCV.DataBind()
    End Sub

    Protected Sub ShowSuitableFor()
        chkListResponsibilityMatch.DataTextField = "SpecilizedName"
        chkListResponsibilityMatch.DataValueField = "SpecilizedID"
        chkListResponsibilityMatch.DataSource = CandidateData.fnGetSpecilizedIn()
        chkListResponsibilityMatch.DataBind()

        chkListSuitableDepartments.DataTextField = "SpecilizedName"
        chkListSuitableDepartments.DataValueField = "SpecilizedID"
        chkListSuitableDepartments.DataSource = CandidateData.fnGetSpecilizedIn()
        chkListSuitableDepartments.DataBind()

    End Sub



    Protected Sub rdbtnInterviewMethod_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdbtnInterviewMethod.SelectedIndexChanged
        lblQ01.Text = ""
        lblQ02.Text = "=>"
    End Sub
End Class
