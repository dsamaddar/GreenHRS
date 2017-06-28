
Partial Class Recruitment_frmReassignInterview
    Inherits System.Web.UI.Page

    Dim IntCandidateData As New clsInterviewCandidateDataAccess()
    Dim IntGradeData As New clsIntGradeDataAccess()
    Dim IntTeamData As New clsInterviewTeamDataAccess()
    Dim CVSelectionData As New clsCVSelectionDataAccess()

    Protected Sub btnExIntAssignmentChqAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExIntAssignmentChqAll.Click

        Dim ExistAssignedAttendees As String = ""

        If drpExAvailableIntTeamList.SelectedValue = "N\A" Then
            MessageBox("Select A Team First.")
            Exit Sub
        End If

        Dim Participant As String = ""
        Dim IntExists As Integer = 0

        '' Chq. If Any Attendees Selected.
        Dim lblInterviewedCandidateID As New System.Web.UI.WebControls.Label()
        Dim lblCandidateName As New System.Web.UI.WebControls.Label()

        If grdInterviewCompletedCandidates.SelectedIndex = -1 Then
            MessageBox("Select At Least One Attendees")
            Exit Sub
        End If

        Dim IntCandidateInfo As New clsInterviewCandidate()

        Try
            IntCandidateInfo.CircularID = "N\A" ''drpAvailableCircular.SelectedValue
            IntCandidateInfo.IntTeamID = drpExAvailableIntTeamList.SelectedValue

            lblInterviewedCandidateID = grdInterviewCompletedCandidates.SelectedRow.FindControl("lblInterviewedCandidateID")
            lblCandidateName = grdInterviewCompletedCandidates.SelectedRow.FindControl("lblCandidateName")

            IntCandidateInfo.CandidateID = lblInterviewedCandidateID.Text
            IntExists = IntCandidateData.fnChqAlrdyAsndAndIntNotTaken(IntCandidateInfo)

            If IntExists = 1 Then
                ExistAssignedAttendees += lblCandidateName.Text + ","
                MessageBox("Interview Panel Already Assigned And Not Taken.")
                Exit Sub
            End If

            If ExistAssignedAttendees <> "" Then
                ExistAssignedAttendees = ExistAssignedAttendees.Remove(Len(ExistAssignedAttendees) - 1, 1)
                MessageBox("Some Of The Selected Candidates Are Already Assigned. e.g. " + ExistAssignedAttendees)
                Exit Sub
            End If

            BlockForm()

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
       
    End Sub

    Protected Sub BlockForm()
        btnExIntAssignmentChqAll.Enabled = False
        drpExAvailableIntTeamList.Enabled = False
        btnExIntAssInterview.Enabled = True
        txtExInterviewDate.Enabled = False
        grdInterviewCompletedCandidates.Enabled = False
        drpApplicantGrade.Enabled = False
    End Sub

    Protected Sub OpenForm()
        btnExIntAssignmentChqAll.Enabled = True
        drpExAvailableIntTeamList.Enabled = True
        btnExIntAssInterview.Enabled = False
        txtExInterviewDate.Enabled = True
        grdInterviewCompletedCandidates.Enabled = True
        drpApplicantGrade.Enabled = True
        txtExInterviewDate.Text = ""
    End Sub

    Protected Sub btnExIntAssInterview_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExIntAssInterview.Click
        Dim Attendees As Boolean = False
        Dim Participant As String = ""

        Dim lblInterviewedCandidateID As New System.Web.UI.WebControls.Label()
        Dim lblCandidateName As New System.Web.UI.WebControls.Label()

        '' Chq. If Any Attendees Selected.
        If drpExAvailableIntTeamList.SelectedValue = "N\A" Then
            MessageBox("Select A Team First.")
            Exit Sub
        End If

        If grdInterviewCompletedCandidates.SelectedIndex = -1 Then
            MessageBox("Select At Least One Attendees")
            Exit Sub
        End If

        lblInterviewedCandidateID = grdInterviewCompletedCandidates.SelectedRow.FindControl("lblInterviewedCandidateID")
        Participant += lblInterviewedCandidateID.Text + ","

        If Participant <> "" Then
            Participant = Participant.Remove(Len(Participant) - 1)
        Else
            MessageBox("Error In Selection.")
            Exit Sub
        End If

        Dim IntCandidateInfo As New clsInterviewCandidate()
        Try
            IntCandidateInfo.Participant = Participant
            IntCandidateInfo.CircularID = "N\A" ' drpAvailableCircular.SelectedValue
            IntCandidateInfo.IntTeamID = drpExAvailableIntTeamList.SelectedValue
            IntCandidateInfo.InterviewDate = Convert.ToDateTime(txtExInterviewDate.Text & " " & drpECOEIHour.SelectedValue & ":" & drpECOEIMin.SelectedValue & ":00" & " " & drpECOEIAMPM.SelectedValue)
            IntCandidateInfo.EntryBy = Session("LoginUserID")

            Dim check As Integer = IntCandidateData.fnAssignCandidateToIntPanel(IntCandidateInfo)

            If check = 1 Then
                MessageBox("Successfully Assigned.")

                'btnExIntAssignmentChqAll.Enabled = True
                'btnIntComIntAssInterview.Enabled = False
                'pnlExAssignInterview.Visible = False
                grdInterviewCompletedCandidates.SelectedIndex = -1
                OpenForm()
            Else
                MessageBox("Error Generated.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
        
    End Sub


    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowIntCanGradeList()
            GetExInterviewTeamList()
            btnExIntAssInterview.Enabled = False
        End If
    End Sub

    Protected Sub ShowIntCanGradeList()
        drpApplicantGrade.DataTextField = "GradeName"
        drpApplicantGrade.DataValueField = "IntGradeID"
        drpApplicantGrade.DataSource = IntGradeData.fnShowIntGradeList()
        drpApplicantGrade.DataBind()
    End Sub

    Protected Sub GetExInterviewTeamList()
        drpExAvailableIntTeamList.DataTextField = "IntTeamName"
        drpExAvailableIntTeamList.DataValueField = "IntTeamID"
        drpExAvailableIntTeamList.DataSource = IntTeamData.fnGetInterviewTeamList()
        drpExAvailableIntTeamList.DataBind()

        Dim A As New ListItem
        A.Text = "----- Choose Team -----"
        A.Value = "N\A"
        drpExAvailableIntTeamList.Items.Insert(0, A)

    End Sub

    Protected Sub drpApplicantGrade_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpApplicantGrade.SelectedIndexChanged
        GetFinallySelectedCandidateList()

        If grdInterviewCompletedCandidates.Rows.Count > 0 Then
            grdInterviewCompletedCandidates.SelectedIndex = -1
        End If

    End Sub

    Protected Sub GetFinallySelectedCandidateList()
        Dim IntGradeID As String = drpApplicantGrade.SelectedValue
        Dim RecruitmentTypeID As String

        RecruitmentTypeID = "N\A"

        grdInterviewCompletedCandidates.DataSource = CVSelectionData.fnInterviewedCandidatesByRecTypeID(RecruitmentTypeID, IntGradeID)
        grdInterviewCompletedCandidates.DataBind()
    End Sub

End Class
