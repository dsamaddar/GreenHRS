
Partial Class frmCVSelection
    Inherits System.Web.UI.Page

    Dim IntCanAssessmentData As New clsIntCandidateAssessmentDataAccess()
    Dim IntGradeData As New clsIntGradeDataAccess()
    Dim IntCandidateData As New clsInterviewCandidateDataAccess()
    Dim IntPanelData As New clsInterviewPanelDataAccess()
    Dim JobCircularData As New clsJobCircularDataAccess()
    Dim CVSelectionData As New clsCVSelectionDataAccess()
    Dim DistrictData As New clsDistrictDataAccess()
    Dim EducationData As New clsCanEduDataAccess()
    Dim ExamData As New clsExamDataAccess()
    Dim QuestionPaperData As New clsQuestionPaperDataAccess()
    Dim EntryPointData As New clsEntryPointDataAccess()
    Dim IntTeamData As New clsInterviewTeamDataAccess()
    Dim DeptData As New clsDepartmentDataAccess()
    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetJobCircularList()
            GetPresentDistrictInfo()
            GetPermanentDistrictInfo()
            GetInstitutionList()
            GetAvailableExams()
            ShowDeptList()

            txtAgeFrom.Text = "20"
            txtAgeTo.Text = "60"

            '' Review Page
            pnlAssignExam.Visible = False
            pnlAssignInterview.Visible = False
            pnlOtherActions.Visible = False
            btnAssignInterview.Enabled = False
            btnGenerateExam.Enabled = False
            GetEntryPoints()
            GetInterviewTeamList()
            ShowULCBranch()

            '' Interview taken
            ShowIntCanGradeList()
            lnkbtnInterviewAssessment.Enabled = False
            ShowPendingIntCandidates()

            '' Exam Assigned candidate
            pnlAssignOtherExams.Visible = False
            pnlExChangeStatus.Visible = False
            pnlExAssignInterview.Visible = False
            btnGenerateOtherExams.Enabled = False
            GetExamAssignedCandidates()
            GetAvailableExamsInExamCompleted()
            GetExEntryPoints()
            GetExInterviewTeamList()
            btnExIntAssInterview.Enabled = False

            '' Exam Effective Date
            txtExAssOtrExamsEffectiveDate.Text = Now.Date
            txtReviewedExamEffectiveDate.Text = Now.Date

        End If
    End Sub

    Protected Sub ShowULCBranch()
        drpULCBranchSelectedCV.DataTextField = "ULCBranchName"
        drpULCBranchSelectedCV.DataValueField = "ULCBranchID"
        drpULCBranchSelectedCV.DataSource = EmployeeInfoData.fnGetULCBranch()
        drpULCBranchSelectedCV.DataBind()

        drpULCBranchExamAssigned.DataTextField = "ULCBranchName"
        drpULCBranchExamAssigned.DataValueField = "ULCBranchID"
        drpULCBranchExamAssigned.DataSource = EmployeeInfoData.fnGetULCBranch()
        drpULCBranchExamAssigned.DataBind()
    End Sub

    Protected Sub ShowDeptList()
        chkListSuitableDepartments.DataTextField = "DeptName"
        chkListSuitableDepartments.DataValueField = "DepartmentID"
        chkListSuitableDepartments.DataSource = DeptData.fnGetDeptList()
        chkListSuitableDepartments.DataBind()
    End Sub

    Protected Sub ShowPendingIntCandidates()
        Dim CircularID As String = drpAvailableCircular.SelectedValue
        grdInterviewNotTaken.DataSource = CVSelectionData.fnGetPendingIntCandidateList(CircularID)
        grdInterviewNotTaken.DataBind()
    End Sub

    Protected Sub ShowPendingIntCandidatesSuit(ByVal SuitableFor As String)

        grdInterviewNotTaken.DataSource = ""
        grdInterviewNotTaken.DataBind()

        Dim CircularID As String = drpAvailableCircular.SelectedValue
        grdInterviewNotTaken.DataSource = CVSelectionData.fnGetPendingIntCandidateListSuit(CircularID, SuitableFor)
        grdInterviewNotTaken.DataBind()
    End Sub

    Protected Sub GetExamAssignedCandidates()

        Dim CircularID As String = drpAvailableCircular.SelectedValue

        If CircularID = "" Then
            MessageBox("Select A Circular First.")
            Exit Sub
        End If

        grdExamCompleted.DataSource = CVSelectionData.fnGetExamAssignedCandidate(CircularID)
        grdExamCompleted.DataBind()
    End Sub

    Protected Sub GetExamAssignedCandidatesSuit(ByVal SuitableFor As String)

        Dim CircularID As String = drpAvailableCircular.SelectedValue

        If CircularID = "" Then
            MessageBox("Select A Circular First.")
            Exit Sub
        End If

        grdExamCompleted.DataSource = ""
        grdExamCompleted.DataBind()

        grdExamCompleted.DataSource = CVSelectionData.fnGetExamAssignedCandidateSuit(CircularID, SuitableFor)
        grdExamCompleted.DataBind()
    End Sub

    Protected Sub GetInterviewTeamList()
        drpAvailableIntTeamList.DataTextField = "IntTeamName"
        drpAvailableIntTeamList.DataValueField = "IntTeamID"
        drpAvailableIntTeamList.DataSource = IntTeamData.fnGetInterviewTeamList()
        drpAvailableIntTeamList.DataBind()

        Dim A As New ListItem
        A.Text = "----- Choose Team -----"
        A.Value = "N\A"
        drpAvailableIntTeamList.Items.Insert(0, A)

    End Sub

    Protected Sub GetAvailableExams()
        drpAvailableExams.DataTextField = "ExamName"
        drpAvailableExams.DataValueField = "ExamID"
        drpAvailableExams.DataSource = ExamData.fnGetAvailableExams()
        drpAvailableExams.DataBind()

        Dim A As New ListItem
        A.Text = "----- Choose Exam -----"
        A.Value = "N\A"
        drpAvailableExams.Items.Insert(0, A)

    End Sub

    Protected Sub GetPresentDistrictInfo()
        drpPresentDistrict.DataTextField = "DistrictName"
        drpPresentDistrict.DataValueField = "DistrictID"
        drpPresentDistrict.DataSource = DistrictData.GetDistricts()
        drpPresentDistrict.DataBind()

        Dim a As New ListItem()
        a.Value = "0"
        a.Text = "N\A"

        drpPresentDistrict.Items.Insert(0, a)

    End Sub

    Protected Sub GetInstitutionList()
        drpUniversityList.DataTextField = "InstitutionName"
        drpUniversityList.DataValueField = "InstitutionID"
        drpUniversityList.DataSource = EducationData.fnGetInstitutionList()
        drpUniversityList.DataBind()

        Dim a As New ListItem()
        a.Value = "0"
        a.Text = "N\A"

        drpUniversityList.Items.Insert(0, a)
    End Sub

    Protected Sub GetPermanentDistrictInfo()
        drpPermanentDistrict.DataTextField = "DistrictName"
        drpPermanentDistrict.DataValueField = "DistrictID"
        drpPermanentDistrict.DataSource = DistrictData.GetDistricts()
        drpPermanentDistrict.DataBind()

        Dim a As New ListItem()
        a.Value = "0"
        a.Text = "N\A"

        drpPermanentDistrict.Items.Insert(0, a)
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
            GetSummaryOfJobCircular(CircularID)
            '' Get Reviwed Candidates
            GetReviewdCV(CircularID)

            '' Get Rejected Candidates
            GetRejectedCV(CircularID)
        End If
    End Sub

    Protected Sub ClearPrevDataAfterCirSelection()
        grdInterviewCompletedCandidates.DataSource = ""
        grdInterviewCompletedCandidates.DataBind()
    End Sub

    Protected Sub drpAvailableCircular_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpAvailableCircular.SelectedIndexChanged

        ClearPrevDataAfterCirSelection()

        Dim CircularID As String = drpAvailableCircular.SelectedValue

        GetAppliedCandidates(CircularID)
        GetSummaryOfJobCircular(CircularID)

        '' Get Reviwed Candidates
        GetReviewdCV(CircularID)

        '' Get Exam Assigned Candidates
        GetExamAssignedCandidates()
        GetAvailableExamsInExamCompleted()

        '' Get Interview Assigned Candidates
        ShowPendingIntCandidates()

        '' Get Rejected Candidates
        GetRejectedCV(CircularID)

    End Sub

    Protected Sub GetReviewdCV(ByVal CircularID As String)
        grdReviewedCV.DataSource = CVSelectionData.fnGetReviewdCVByCircularID(CircularID)
        grdReviewedCV.DataBind()
    End Sub

    Protected Sub GetReviewdCVSuit(ByVal CircularID As String, ByVal SuitableFor As String)
        grdReviewedCV.DataSource = CVSelectionData.fnGetReviewdCVByCircularIDSuit(CircularID, SuitableFor)
        grdReviewedCV.DataBind()
    End Sub

    Protected Sub GetRejectedCV(ByVal CircularID As String)
        grdRejectedCV.DataSource = CVSelectionData.fnGetRejectedCVByCircularID(CircularID)
        grdRejectedCV.DataBind()
    End Sub

    Protected Sub GetSummaryOfJobCircular(ByVal CircularID As String)
        Dim JobCircularSummary As New clsSummaryJobCircular()
        JobCircularSummary = JobCircularData.fnSummaryOfJobCircular(CircularID)
        lblTotalApplicant.Text = "( " + JobCircularSummary.TotalApplicant.ToString() + " )"
        lblTotalRecruitment.Text = "( " + JobCircularSummary.TotalRecruitment.ToString() + " )"
        lblTotalExamTaker.Text = "( " + JobCircularSummary.TotalExamTaker.ToString() + " )"
        lblTotalInterviewTaken.Text = "( " + JobCircularSummary.TotalInterviewTaken.ToString() + " )"
        lblTotalRejectedCV.Text = "( " + JobCircularSummary.TotalRejectedCV.ToString() + " )"
        lblCVRemaining.Text = "( " + JobCircularSummary.RemainingCV.ToString() + " )"
    End Sub

    Protected Sub GetAppliedCandidates(ByVal CircularID As String)
        grdNewCV.DataSource = CVSelectionData.fnCVGetForAppliedJobByID(CircularID, "Applied")
        grdNewCV.DataBind()
    End Sub

    Protected Sub GetAppliedCandidatesSuit(ByVal CircularID As String, ByVal SuitableFor As String)
        grdNewCV.DataSource = ""
        grdNewCV.DataBind()
        grdNewCV.DataSource = CVSelectionData.fnCVGetForAppliedJobByIDSuit(CircularID, "Applied", SuitableFor)
        grdNewCV.DataBind()
    End Sub

    Protected Sub btnSearchCV_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearchCV.Click

        Dim CVSelection As New clsCVSelection()

        CVSelection.CircularID = drpAvailableCircular.SelectedValue
        CVSelection.CandidateName = txtCandidateName.Text
        CVSelection.InstitutionID = drpUniversityList.SelectedValue
        CVSelection.PresentDistrictID = drpPresentDistrict.SelectedValue
        CVSelection.PermanentDistrictID = drpPermanentDistrict.SelectedValue
        CVSelection.Gender = drpGenderList.SelectedValue
        CVSelection.AgeFrom = Convert.ToInt32(txtAgeFrom.Text)
        CVSelection.AgeTo = Convert.ToInt32(txtAgeTo.Text)

        grdNewCV.DataSource = CVSelectionData.fnSearchApplicant(CVSelection)
        grdNewCV.DataBind()

    End Sub

    Protected Sub btnCancelCVSelection_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelCVSelection.Click
        ClearNewCVForm()
    End Sub

    Protected Sub ClearNewCVForm()
        drpGenderList.SelectedIndex = -1
        drpPresentDistrict.SelectedIndex = -1
        drpPermanentDistrict.SelectedIndex = -1
        drpUniversityList.SelectedIndex = -1
        txtCandidateName.Text = ""
        txtAgeFrom.Text = "20"
        txtAgeTo.Text = "60"

        GetAppliedCandidates(drpAvailableCircular.SelectedValue)
    End Sub

    Protected Sub btnChooseCV_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnChooseCV.Click

        Dim ChosenApplicant As String = ""

        Dim chkSelectCandidate As New System.Web.UI.WebControls.CheckBox()
        Dim lblAppliedJobID As New System.Web.UI.WebControls.Label()
        For Each rw As GridViewRow In grdNewCV.Rows
            chkSelectCandidate = rw.FindControl("chkSelectCandidate")
            If chkSelectCandidate.Checked = True Then
                lblAppliedJobID = rw.FindControl("lblAppliedJobID")
                ChosenApplicant += "" & lblAppliedJobID.Text & ","
            End If
        Next

        If ChosenApplicant = "" Then
            btnChangeStatus.Enabled = False
            MessageBox("No Candidate Selected.")
            Exit Sub
        End If

        ChosenApplicant = ChosenApplicant.Remove(ChosenApplicant.Length - 1)

        Dim check As Integer = CVSelectionData.fnReviewApplicant(ChosenApplicant, "Reviewed", Session("LoginUserID"))

        If check = 1 Then
            MessageBox("Reviewed.")
            '' Get Rejected Candidates
            GetRejectedCV(drpAvailableCircular.SelectedValue)
            GetAppliedCandidates(drpAvailableCircular.SelectedValue)
            GetSummaryOfJobCircular(drpAvailableCircular.SelectedValue)
            '' Get Reviwed Candidates
            GetReviewdCV(drpAvailableCircular.SelectedValue)
            ClearNewCVForm()
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnCancelCanSelection_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelCanSelection.Click

        Dim chkSelectCandidate As New System.Web.UI.WebControls.CheckBox()

        For Each rw As GridViewRow In grdNewCV.Rows
            chkSelectCandidate = rw.FindControl("chkSelectCandidate")
            If chkSelectCandidate.Checked = True Then
                chkSelectCandidate.Checked = False
            End If
        Next

    End Sub

    Protected Sub rdbtnActions_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdbtnActions.SelectedIndexChanged
        If rdbtnActions.SelectedValue = "Assign Exam" Then
            pnlAssignExam.Visible = True
            pnlAssignInterview.Visible = False
            pnlOtherActions.Visible = False
        ElseIf rdbtnActions.SelectedValue = "Assign Interview" Then
            pnlAssignExam.Visible = False
            pnlOtherActions.Visible = False
            pnlAssignInterview.Visible = True
        Else
            pnlOtherActions.Visible = True
            pnlAssignInterview.Visible = False
            pnlAssignExam.Visible = False
        End If
    End Sub

    Protected Sub btnChangeStatus_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnChangeStatus.Click

        '' Chq. If Any Attendees Selected.
        Dim Attendees As Boolean = False
        Dim chkSelectReviewed As New System.Web.UI.WebControls.CheckBox()
        Dim lblReviewCandidateID As New System.Web.UI.WebControls.Label()

        For Each rw As GridViewRow In grdReviewedCV.Rows
            chkSelectReviewed = rw.FindControl("chkSelectReviewed")
            If chkSelectReviewed.Checked = True Then
                Attendees = True
                Exit For
            End If
        Next

        If Attendees = False Then
            MessageBox("Select At Least One Attendees")
            Exit Sub
        End If

        Dim ChosenApplicant As String = ""

        Dim lblReviewedAppliedJobID As New System.Web.UI.WebControls.Label()
        For Each rw As GridViewRow In grdReviewedCV.Rows
            chkSelectReviewed = rw.FindControl("chkSelectReviewed")
            If chkSelectReviewed.Checked = True Then
                lblReviewedAppliedJobID = rw.FindControl("lblReviewedAppliedJobID")
                ChosenApplicant += lblReviewedAppliedJobID.Text + ","
            End If
        Next

        ChosenApplicant = ChosenApplicant.Remove(ChosenApplicant.Length - 1)

        Dim check As Integer = CVSelectionData.fnReviewApplicant(ChosenApplicant, drpApplicantStatus.SelectedValue, Session("LoginUserID"))

        If check = 1 Then
            MessageBox(drpApplicantStatus.SelectedValue)
            '' Get Rejected Candidates
            GetRejectedCV(drpAvailableCircular.SelectedValue)
            GetAppliedCandidates(drpAvailableCircular.SelectedValue)
            GetSummaryOfJobCircular(drpAvailableCircular.SelectedValue)
            '' Get Reviwed Candidates
            GetReviewdCV(drpAvailableCircular.SelectedValue)
            ClearReviewCVForm()
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub ClearReviewCVForm()

    End Sub

    Protected Sub btnCheckIntCandidates_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCheckIntCandidates.Click
        Dim Attendees As Boolean = False
        Dim ExistAssignedAttendees As String = ""

        If drpAvailableIntTeamList.SelectedValue = "N\A" Then
            MessageBox("Select A Team First.")
            Exit Sub
        End If

        Dim Participant As String = ""
        Dim IntExists As Integer = 0
        '' Chq. If Any Attendees Selected.
        Dim chkSelectReviewed As New System.Web.UI.WebControls.CheckBox()
        Dim lblReviewCandidateID As New System.Web.UI.WebControls.Label()
        Dim lblReviewCandidateName As New System.Web.UI.WebControls.Label()

        For Each rw As GridViewRow In grdReviewedCV.Rows
            chkSelectReviewed = rw.FindControl("chkSelectReviewed")
            If chkSelectReviewed.Checked = True Then
                Attendees = True
                Exit For
            End If
        Next

        If Attendees = False Then
            MessageBox("Select At Least One Attendees")
            Exit Sub
        End If

        Dim IntCandidateInfo As New clsInterviewCandidate()

        IntCandidateInfo.CircularID = drpAvailableCircular.SelectedValue
        IntCandidateInfo.IntTeamID = drpAvailableIntTeamList.SelectedValue

        For Each rw As GridViewRow In grdReviewedCV.Rows
            chkSelectReviewed = rw.FindControl("chkSelectReviewed")
            If chkSelectReviewed.Checked = True Then
                lblReviewCandidateID = rw.FindControl("lblReviewCandidateID")
                lblReviewCandidateName = rw.FindControl("lblReviewCandidateName")

                IntCandidateInfo.CandidateID = lblReviewCandidateID.Text
                IntExists = IntCandidateData.fnChqAlrdyAsndAndIntNotTaken(IntCandidateInfo)

                If IntExists = 1 Then
                    ExistAssignedAttendees += lblReviewCandidateName.Text + ","
                    chkSelectReviewed.Checked = False
                End If

            End If
        Next

        If ExistAssignedAttendees <> "" Then
            ExistAssignedAttendees = ExistAssignedAttendees.Remove(Len(ExistAssignedAttendees) - 1, 1)
            MessageBox("Some Of The Selected Candidates Are Already Assigned. e.g. " + ExistAssignedAttendees)
        End If

        '' For Further Checking .... (Needed.)
        Attendees = False
        For Each rw As GridViewRow In grdReviewedCV.Rows
            chkSelectReviewed = rw.FindControl("chkSelectReviewed")
            If chkSelectReviewed.Checked = True Then
                Attendees = True
                Exit For
            End If
        Next

        If Attendees = False Then
            MessageBox("Select At Least One Attendees")
            Exit Sub
        End If

        btnCheckIntCandidates.Enabled = False
        drpAvailableIntTeamList.Enabled = False
        btnAssignInterview.Enabled = True
        grdReviewedCV.Enabled = False

    End Sub

    Protected Sub btnAssignInterview_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAssignInterview.Click

        Dim Attendees As Boolean = False
        Dim Participant As String = ""

        '' Chq. If Any Attendees Selected.
        Dim chkSelectReviewed As New System.Web.UI.WebControls.CheckBox()
        Dim lblReviewCandidateID As New System.Web.UI.WebControls.Label()

        For Each rw As GridViewRow In grdReviewedCV.Rows
            chkSelectReviewed = rw.FindControl("chkSelectReviewed")
            If chkSelectReviewed.Checked = True Then
                Attendees = True
                Exit For
            End If
        Next

        If Attendees = False Then
            MessageBox("Select At Least One Attendees")
            Exit Sub
        End If

        For Each rw As GridViewRow In grdReviewedCV.Rows
            chkSelectReviewed = rw.FindControl("chkSelectReviewed")
            If chkSelectReviewed.Checked = True Then
                lblReviewCandidateID = rw.FindControl("lblReviewCandidateID")
                Participant += lblReviewCandidateID.Text + ","
            End If
        Next

        If Participant <> "" Then
            Participant = Participant.Remove(Len(Participant) - 1)
        End If

        Dim IntCandidateInfo As New clsInterviewCandidate()

        IntCandidateInfo.Participant = Participant
        IntCandidateInfo.CircularID = drpAvailableCircular.SelectedValue
        IntCandidateInfo.IntTeamID = drpAvailableIntTeamList.SelectedValue
        IntCandidateInfo.InterviewDate = Convert.ToDateTime(txtInterviewDate.Text)
        IntCandidateInfo.EntryBy = Session("LoginUserID")

        Dim check As Integer = IntCandidateData.fnAssignCandidateToIntPanel(IntCandidateInfo)

        If check = 1 Then
            MessageBox("Successfully Assigned.")
            ClearInterviewAssignmentForm()
        Else
            MessageBox("Error Generated.")
        End If
    End Sub

    Protected Sub ClearInterviewAssignmentForm()
        btnAssignInterview.Enabled = False
        btnCheckIntCandidates.Enabled = True
        grdReviewedCV.Enabled = True
        drpAvailableIntTeamList.Enabled = True
        txtInterviewDate.Text = ""

        If drpAvailableIntTeamList.Items.Count >= 0 Then
            drpAvailableIntTeamList.SelectedIndex = -1
        End If

        Dim CircularID As String = drpAvailableCircular.SelectedValue
        '' Get Reviwed Candidates
        GetReviewdCV(CircularID)
    End Sub

    Protected Sub btnGenerateExam_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGenerateExam.Click
        Dim QuestionPaper As New clsQuestionPaper()
        Dim Attendees As Boolean = False
        Dim Participant As String = ""
        Dim EntryPoint As String = ""

        Try
            '' Chq. If Any Attendees Selected.
            Dim chkSelectReviewed As New System.Web.UI.WebControls.CheckBox()
            Dim lblReviewCandidateID As New System.Web.UI.WebControls.Label()

            For Each rw As GridViewRow In grdReviewedCV.Rows
                chkSelectReviewed = rw.FindControl("chkSelectReviewed")
                If chkSelectReviewed.Checked = True Then
                    Attendees = True
                    Exit For
                End If
            Next

            If Attendees = False Then
                MessageBox("Select At Least One Attendees")
                Exit Sub
            End If

            For Each rw As GridViewRow In grdReviewedCV.Rows
                chkSelectReviewed = rw.FindControl("chkSelectReviewed")
                If chkSelectReviewed.Checked = True Then
                    lblReviewCandidateID = rw.FindControl("lblReviewCandidateID")
                    Participant += lblReviewCandidateID.Text + ","
                End If
            Next

            If Participant <> "" Then
                Participant = Participant.Remove(Len(Participant) - 1)
            End If


            ' EntryPoint = Now.Year.ToString + Now.Month.ToString() + Now.Day.ToString() + Now.Hour.ToString() + Now.Minute.ToString()
            EntryPoint = EntryPointData.fnGetEntryPoint()

            QuestionPaper.ExamID = drpAvailableExams.SelectedValue
            QuestionPaper.Participant = Participant
            QuestionPaper.EntryPoint = EntryPoint
            QuestionPaper.EffectiveDate = txtReviewedExamEffectiveDate.Text & " " & drpSHour.SelectedValue & ":" & drpSMin.SelectedValue & ":00" & " " & drpSAMPM.SelectedValue
            QuestionPaper.CircularID = drpAvailableCircular.SelectedValue
            QuestionPaper.PreparedBy = Session("LoginUserID")
            QuestionPaper.ULCBranchID = drpULCBranchSelectedCV.SelectedValue

            Dim Check As Integer = QuestionPaperData.fnAssignQuestionPaper(QuestionPaper)

            If Check = 1 Then
                MessageBox("Successfully Assigned..")
                GetEntryPoints()
                If drpEntryPoint.Items.Count > 0 Then
                    drpEntryPoint.SelectedIndex = 0
                    GetUsersByEntryPoints(drpEntryPoint.SelectedValue)
                End If
                grdReviewedCV.Enabled = True
                btnCheckAll.Enabled = True
                btnGenerateExam.Enabled = False
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Public Sub GetUsersByEntryPoints(ByVal EntryPoint As String)
        grdEntryPointWiseAttendees.DataSource = QuestionPaperData.fnGetAttendeesByEntryPoint(EntryPoint)
        grdEntryPointWiseAttendees.DataBind()
    End Sub

    Protected Sub GetEntryPoints()
        drpEntryPoint.DataTextField = "EntryPoint"
        drpEntryPoint.DataValueField = "EntryPoint"
        drpEntryPoint.DataSource = QuestionPaperData.fnGetEntryPoints()
        drpEntryPoint.DataBind()

        Dim A As New ListItem()
        A.Text = "-- Select EntryPoints --"
        A.Value = "N\A"

        drpEntryPoint.Items.Insert(0, A)
    End Sub

    Protected Sub btnCheckAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCheckAll.Click
        Dim Attendees As Boolean = False
        If drpAvailableExams.SelectedValue = "N\A" Then
            MessageBox("Select Exam First.")
            Exit Sub
        End If

        '' Chq. If Any Attendees Selected.
        Dim chkSelectReviewed As New System.Web.UI.WebControls.CheckBox()

        For Each rw As GridViewRow In grdReviewedCV.Rows
            chkSelectReviewed = rw.FindControl("chkSelectReviewed")
            If chkSelectReviewed.Checked = True Then
                Attendees = True
                Exit For
            End If
        Next

        If Attendees = False Then
            MessageBox("Select At Least One Attendees")
            Exit Sub
        End If

        Dim ExistAssignedAttendees As String = ""
        Dim lblReviewCandidateID As New System.Web.UI.WebControls.Label()
        Dim lblReviewCandidateName As New System.Web.UI.WebControls.Label()
        Dim AlreadyExists As Integer = 0

        '' Check For Already Assigned but Exam not Taken 
        For Each rw As GridViewRow In grdReviewedCV.Rows
            chkSelectReviewed = rw.FindControl("chkSelectReviewed")
            If chkSelectReviewed.Checked = True Then

                lblReviewCandidateID = rw.FindControl("lblReviewCandidateID")
                lblReviewCandidateName = rw.FindControl("lblReviewCandidateName")
                AlreadyExists = QuestionPaperData.fnChkAlreadyAssignedAndExamNotTaken(lblReviewCandidateID.Text, drpAvailableExams.SelectedValue)
                If AlreadyExists = 1 Then
                    ExistAssignedAttendees += lblReviewCandidateName.Text + ","
                    chkSelectReviewed.Checked = False
                End If
            End If
        Next

        If ExistAssignedAttendees <> "" Then
            ExistAssignedAttendees = ExistAssignedAttendees.Remove(Len(ExistAssignedAttendees) - 1)
            MessageBox(drpAvailableExams.SelectedItem.ToString() + " Is Already Assigned For Below Attendees: " + ExistAssignedAttendees)
        End If

        grdReviewedCV.Enabled = False
        btnCheckAll.Enabled = False
        drpAvailableExams.Enabled = False
        btnGenerateExam.Enabled = True
    End Sub

    Protected Sub drpEntryPoint_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpEntryPoint.SelectedIndexChanged
        GetUsersByEntryPoints(drpEntryPoint.SelectedValue)
    End Sub

    Protected Sub btnRejectedChangeStatus_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRejectedChangeStatus.Click
        '' Chq. If Any Attendees Selected.
        Dim Attendees As Boolean = False
        Dim chkSelectRejected As New System.Web.UI.WebControls.CheckBox()
        Dim lblRejectedAppliedJobID As New System.Web.UI.WebControls.Label()

        For Each rw As GridViewRow In grdRejectedCV.Rows
            chkSelectRejected = rw.FindControl("chkSelectRejected")
            If chkSelectRejected.Checked = True Then
                Attendees = True
                Exit For
            End If
        Next

        If Attendees = False Then
            MessageBox("Select At Least One Attendees")
            Exit Sub
        End If

        Dim ChosenApplicant As String = ""

        For Each rw As GridViewRow In grdRejectedCV.Rows
            chkSelectRejected = rw.FindControl("chkSelectRejected")
            If chkSelectRejected.Checked = True Then
                lblRejectedAppliedJobID = rw.FindControl("lblRejectedAppliedJobID")
                ChosenApplicant += lblRejectedAppliedJobID.Text + ","
            End If
        Next

        ChosenApplicant = ChosenApplicant.Remove(ChosenApplicant.Length - 1)

        Dim check As Integer = CVSelectionData.fnReviewApplicant(ChosenApplicant, drpApplicantStatusRejected.SelectedValue, Session("LoginUserID"))

        If check = 1 Then
            MessageBox(drpApplicantStatusRejected.SelectedValue)
            '' Get Rejected Candidates
            GetRejectedCV(drpAvailableCircular.SelectedValue)
            GetAppliedCandidates(drpAvailableCircular.SelectedValue)
            GetSummaryOfJobCircular(drpAvailableCircular.SelectedValue)
            '' Get Reviwed Candidates
            GetReviewdCV(drpAvailableCircular.SelectedValue)

            ClearRejectedCVForm()
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub ClearRejectedCVForm()

    End Sub

   
    Protected Sub drpApplicantGrade_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpApplicantGrade.SelectedIndexChanged
        GetFinallySelectedCandidateList()
    End Sub

    Protected Sub GetFinallySelectedCandidateList()
        Dim IntGradeID As String = drpApplicantGrade.SelectedValue
        Dim CircularID As String = drpAvailableCircular.SelectedValue
        grdInterviewCompletedCandidates.DataSource = CVSelectionData.fnInterviewedCandidates(IntGradeID, CircularID)
        grdInterviewCompletedCandidates.DataBind()
    End Sub

    Protected Sub ShowIntCanGradeList()
        drpApplicantGrade.DataTextField = "GradeName"
        drpApplicantGrade.DataValueField = "IntGradeID"
        drpApplicantGrade.DataSource = IntGradeData.fnShowIntGradeList()
        drpApplicantGrade.DataBind()

        If drpApplicantGrade.Items.Count > 0 Then
            drpApplicantGrade.SelectedIndex = 0
            GetFinallySelectedCandidateList()
        End If

    End Sub

    Protected Sub btnInterviewTakenChangeStatus_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInterviewTakenChangeStatus.Click
        '' Chq. If Any Attendees Selected.
        Dim Attendees As Boolean = False
        Dim chkSelectInterviewTakenCandidate As New System.Web.UI.WebControls.CheckBox()
        Dim lblInterviewedAppliedJobID As New System.Web.UI.WebControls.Label()

        For Each rw As GridViewRow In grdInterviewCompletedCandidates.Rows
            chkSelectInterviewTakenCandidate = rw.FindControl("chkSelectInterviewTakenCandidate")
            If chkSelectInterviewTakenCandidate.Checked = True Then
                Attendees = True
                Exit For
            End If
        Next

        If Attendees = False Then
            MessageBox("Select At Least One Attendees")
            Exit Sub
        End If

        Dim ChosenApplicant As String = ""

        For Each rw As GridViewRow In grdInterviewCompletedCandidates.Rows
            chkSelectInterviewTakenCandidate = rw.FindControl("chkSelectInterviewTakenCandidate")
            If chkSelectInterviewTakenCandidate.Checked = True Then
                lblInterviewedAppliedJobID = rw.FindControl("lblInterviewedAppliedJobID")
                ChosenApplicant += lblInterviewedAppliedJobID.Text + ","
            End If
        Next

        ChosenApplicant = ChosenApplicant.Remove(ChosenApplicant.Length - 1)

        Dim check As Integer = CVSelectionData.fnReviewApplicant(ChosenApplicant, drpInterviewTakenCanStatus.SelectedValue, Session("LoginUserID"))

        If check = 1 Then
            MessageBox(drpApplicantStatusRejected.SelectedValue)
            '' Get Rejected Candidates
            GetRejectedCV(drpAvailableCircular.SelectedValue)
            GetAppliedCandidates(drpAvailableCircular.SelectedValue)
            GetSummaryOfJobCircular(drpAvailableCircular.SelectedValue)
            '' Get Reviwed Candidates
            GetReviewdCV(drpAvailableCircular.SelectedValue)

            ClearRejectedCVForm()
        Else
            MessageBox("Error Found.")
        End If
    End Sub

    Protected Sub grdInterviewCompletedCandidates_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdInterviewCompletedCandidates.SelectedIndexChanged

        Dim lblInterviewedCandidateID As New System.Web.UI.WebControls.Label()
        Dim lblInterviewedCircularID As New System.Web.UI.WebControls.Label()

        lblInterviewedCandidateID = grdInterviewCompletedCandidates.SelectedRow.FindControl("lblInterviewedCandidateID")
        lblInterviewedCircularID = grdInterviewCompletedCandidates.SelectedRow.FindControl("lblInterviewedCircularID")

        Session("RecCandidateID") = lblInterviewedCandidateID.Text
        Session("RecCircularID") = lblInterviewedCircularID.Text

        lnkBtnViewPanelMembers.Enabled = True
    End Sub


    Protected Sub rdbtnOptionsExamWindow_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdbtnOptionsExamWindow.SelectedIndexChanged
        If rdbtnOptionsExamWindow.SelectedValue = "AssOthExams" Then
            pnlAssignOtherExams.Visible = True
            pnlExChangeStatus.Visible = False
            pnlExAssignInterview.Visible = False
        ElseIf rdbtnOptionsExamWindow.SelectedValue = "AssOthInterview" Then
            pnlExAssignInterview.Visible = True
            pnlAssignOtherExams.Visible = False
            pnlExChangeStatus.Visible = False
        Else
            pnlExChangeStatus.Visible = True
            pnlAssignOtherExams.Visible = False
            pnlExAssignInterview.Visible = False
        End If
    End Sub

#Region " Exam Completed "

    Protected Sub btnChqAvailabilityOfExams_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnChqAvailabilityOfExams.Click

        If drpExAvailableExams.SelectedValue = "N\A" Then
            MessageBox("Select Exam First.")
            Exit Sub
        End If

        '' Chq. If Any Attendees Selected.
        If grdExamCompleted.SelectedIndex = -1 Then
            MessageBox("Select At Least One Attendees")
            Exit Sub
        End If

        Dim lblExaminedCandidateID As New System.Web.UI.WebControls.Label()
        Dim lblExaminedCandidateName As New System.Web.UI.WebControls.Label()
        Dim AlreadyExists As Integer = 0

        '' Check For Already Assigned but Exam not Taken 
        lblExaminedCandidateID = grdExamCompleted.SelectedRow.FindControl("lblExaminedCandidateID")
        AlreadyExists = QuestionPaperData.fnChkAlreadyAssignedAndExamNotTaken(lblExaminedCandidateID.Text, drpAvailableExams.SelectedValue)
        If AlreadyExists = 1 Then
            MessageBox("Already Assigned.")
            Exit Sub
        End If

        grdExamCompleted.Enabled = False
        btnChqAvailabilityOfExams.Enabled = False
        drpExAvailableExams.Enabled = False
        btnGenerateOtherExams.Enabled = True

    End Sub

    Protected Sub btnGenerateOtherExams_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGenerateOtherExams.Click
        Dim QuestionPaper As New clsQuestionPaper()
        Dim Attendees As Boolean = False
        Dim Participant As String = ""
        Dim EntryPoint As String = ""

        Try
            '' Chq. If Any Attendees Selected.
            Dim chkSelectExaminedCandidate As New System.Web.UI.WebControls.CheckBox()
            Dim lblExaminedCandidateID As New System.Web.UI.WebControls.Label()

            If drpExAvailableExams.SelectedValue = "N\A" Then
                MessageBox("Select Exam First.")
                Exit Sub
            End If

            '' Chq. If Any Attendees Selected.
            If grdExamCompleted.SelectedIndex = -1 Then
                MessageBox("Select At Least One Attendees")
                Exit Sub
            End If

            Dim lblExaminedCandidateName As New System.Web.UI.WebControls.Label()
            Dim AlreadyExists As Integer = 0

            '' Check For Already Assigned but Exam not Taken 
            lblExaminedCandidateID = grdExamCompleted.SelectedRow.FindControl("lblExaminedCandidateID")
            AlreadyExists = QuestionPaperData.fnChkAlreadyAssignedAndExamNotTaken(lblExaminedCandidateID.Text, drpAvailableExams.SelectedValue)
            If AlreadyExists = 1 Then
                MessageBox("Already Assigned.")
                Exit Sub
            End If


            lblExaminedCandidateID = grdExamCompleted.SelectedRow.FindControl("lblExaminedCandidateID")
            Participant += lblExaminedCandidateID.Text + ","

            If Participant <> "" Then
                Participant = Participant.Remove(Len(Participant) - 1)
            End If

            EntryPoint = EntryPointData.fnGetEntryPoint()

            QuestionPaper.CircularID = drpAvailableCircular.SelectedValue
            QuestionPaper.ExamID = drpExAvailableExams.SelectedValue
            QuestionPaper.Participant = Participant
            QuestionPaper.EntryPoint = EntryPoint
            QuestionPaper.EffectiveDate = txtExAssOtrExamsEffectiveDate.Text & " " & drpECOEHour.SelectedValue & ":" & drpECOEMin.SelectedValue & ":00" & " " & drpECOEAMPM.SelectedValue
            QuestionPaper.PreparedBy = Session("LoginUserID")
            QuestionPaper.ULCBranchID = drpULCBranchExamAssigned.SelectedValue

            Dim Check As Integer = QuestionPaperData.fnAssignQuestionPaper(QuestionPaper)

            If Check = 1 Then
                MessageBox("Successfully Assigned..")
                GetExEntryPoints()
                If drpExEntryPoint.Items.Count > 0 Then
                    drpExEntryPoint.SelectedIndex = 0
                    GetUsersByEntryPoints(drpExEntryPoint.SelectedValue)
                End If
                grdExamCompleted.Enabled = True
                btnChqAvailabilityOfExams.Enabled = True
                btnGenerateOtherExams.Enabled = False
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub grdExamCompleted_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdExamCompleted.SelectedIndexChanged

        Dim lblExaminedCandidateID As New System.Web.UI.WebControls.Label()
        lblExaminedCandidateID = grdExamCompleted.SelectedRow.FindControl("lblExaminedCandidateID")
        grdCandidateExamResultSummary.DataSource = CVSelectionData.fnGetCandidateWiseSummaryResult(lblExaminedCandidateID.Text)
        grdCandidateExamResultSummary.DataBind()

    End Sub

    Protected Sub GetAvailableExamsInExamCompleted()
        drpExAvailableExams.DataTextField = "ExamName"
        drpExAvailableExams.DataValueField = "ExamID"
        drpExAvailableExams.DataSource = ExamData.fnGetAvailableExams()
        drpExAvailableExams.DataBind()

        Dim A As New ListItem
        A.Text = "----- Choose Exam -----"
        A.Value = "N\A"
        drpExAvailableExams.Items.Insert(0, A)
    End Sub

    Protected Sub GetExEntryPoints()
        drpExEntryPoint.DataTextField = "EntryPoint"
        drpExEntryPoint.DataValueField = "EntryPoint"
        drpExEntryPoint.DataSource = QuestionPaperData.fnGetEntryPoints()
        drpExEntryPoint.DataBind()

        Dim A As New ListItem()
        A.Text = "-- Select EntryPoints --"
        A.Value = "N\A"

        drpExEntryPoint.Items.Insert(0, A)
    End Sub

    Protected Sub drpExEntryPoint_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpExEntryPoint.SelectedIndexChanged
        GetExUsersByEntryPoints(drpExEntryPoint.SelectedValue)
    End Sub

    Public Sub GetExUsersByEntryPoints(ByVal EntryPoint As String)
        grdExEntryPointWiseCandidate.DataSource = QuestionPaperData.fnGetAttendeesByEntryPoint(EntryPoint)
        grdExEntryPointWiseCandidate.DataBind()
    End Sub

    Protected Sub btnExChangeStatus_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExChangeStatus.Click
        '' Chq. If Any Attendees Selected.
        Dim Attendees As Boolean = False
        Dim chkSelectReviewed As New System.Web.UI.WebControls.CheckBox()
        Dim lblExaminedAppliedJobID As New System.Web.UI.WebControls.Label()

        Dim ChosenApplicant As String = ""

        lblExaminedAppliedJobID = grdExamCompleted.SelectedRow.FindControl("lblExaminedAppliedJobID")
        ChosenApplicant += lblExaminedAppliedJobID.Text + ","

        If ChosenApplicant <> "" Then
            ChosenApplicant = ChosenApplicant.Remove(ChosenApplicant.Length - 1)
        Else
            MessageBox("Error In Selection.")
            Exit Sub
        End If

        Dim check As Integer = CVSelectionData.fnReviewApplicant(ChosenApplicant, drpExChangeStatus.SelectedValue, Session("LoginUserID"))

        If check = 1 Then
            MessageBox(drpExChangeStatus.SelectedValue)
            '' Get Rejected Candidates
            GetRejectedCV(drpAvailableCircular.SelectedValue)
            GetAppliedCandidates(drpAvailableCircular.SelectedValue)
            GetSummaryOfJobCircular(drpAvailableCircular.SelectedValue)
            '' Get Reviwed Candidates
            GetReviewdCV(drpAvailableCircular.SelectedValue)
            ClearReviewCVForm()

            '' Exam Completed Window
            GetExamAssignedCandidates()
            GetAvailableExamsInExamCompleted()
            GetExEntryPoints()
            ClearExamCompletedWindow()
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub ClearExamCompletedWindow()
        grdCandidateExamResultSummary.DataSource = ""
        grdCandidateExamResultSummary.DataBind()
        grdExEntryPointWiseCandidate.DataSource = ""
        grdExEntryPointWiseCandidate.DataBind()
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

    Protected Sub btnExIntAssignmentChqAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExIntAssignmentChqAll.Click

        Dim ExistAssignedAttendees As String = ""

        If drpExAvailableIntTeamList.SelectedValue = "N\A" Then
            MessageBox("Select A Team First.")
            Exit Sub
        End If

        Dim Participant As String = ""
        Dim IntExists As Integer = 0

        '' Chq. If Any Attendees Selected.
        Dim lblExaminedCandidateID As New System.Web.UI.WebControls.Label()
        Dim lblExaminedCandidateName As New System.Web.UI.WebControls.Label()

        If grdExamCompleted.SelectedIndex = -1 Then
            MessageBox("Select At Least One Attendees")
            Exit Sub
        End If


        Dim IntCandidateInfo As New clsInterviewCandidate()

        IntCandidateInfo.CircularID = drpAvailableCircular.SelectedValue
        IntCandidateInfo.IntTeamID = drpAvailableIntTeamList.SelectedValue

        lblExaminedCandidateID = grdExamCompleted.SelectedRow.FindControl("lblExaminedCandidateID")
        lblExaminedCandidateName = grdExamCompleted.SelectedRow.FindControl("lblExaminedCandidateName")

        IntCandidateInfo.CandidateID = lblExaminedCandidateID.Text
        IntExists = IntCandidateData.fnChqAlrdyAsndAndIntNotTaken(IntCandidateInfo)

        If IntExists = 1 Then
            ExistAssignedAttendees += lblExaminedCandidateName.Text + ","
            MessageBox("Interview Panel Already Assigned And Not Taken.")
            Exit Sub
        End If

        If ExistAssignedAttendees <> "" Then
            ExistAssignedAttendees = ExistAssignedAttendees.Remove(Len(ExistAssignedAttendees) - 1, 1)
            MessageBox("Some Of The Selected Candidates Are Already Assigned. e.g. " + ExistAssignedAttendees)
            Exit Sub
        End If

        btnExIntAssignmentChqAll.Enabled = False
        drpExAvailableIntTeamList.Enabled = False
        btnExIntAssInterview.Enabled = True
        grdExamCompleted.Enabled = False
    End Sub

    Protected Sub btnExIntAssInterview_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExIntAssInterview.Click
        Dim Attendees As Boolean = False
        Dim Participant As String = ""

        Dim lblExaminedCandidateID As New System.Web.UI.WebControls.Label()
        Dim lblExaminedCandidateName As New System.Web.UI.WebControls.Label()

        '' Chq. If Any Attendees Selected.
        If drpExAvailableIntTeamList.SelectedValue = "N\A" Then
            MessageBox("Select A Team First.")
            Exit Sub
        End If

        If grdExamCompleted.SelectedIndex = -1 Then
            MessageBox("Select At Least One Attendees")
            Exit Sub
        End If

        lblExaminedCandidateID = grdExamCompleted.SelectedRow.FindControl("lblExaminedCandidateID")
        Participant += lblExaminedCandidateID.Text + ","

        If Participant <> "" Then
            Participant = Participant.Remove(Len(Participant) - 1)
        Else
            MessageBox("Error In Selection.")
            Exit Sub
        End If

        Dim IntCandidateInfo As New clsInterviewCandidate()

        IntCandidateInfo.Participant = Participant
        IntCandidateInfo.CircularID = drpAvailableCircular.SelectedValue
        IntCandidateInfo.IntTeamID = drpExAvailableIntTeamList.SelectedValue
        IntCandidateInfo.InterviewDate = Convert.ToDateTime(txtExInterviewDate.Text)
        IntCandidateInfo.EntryBy = Session("LoginUserID")

        Dim check As Integer = IntCandidateData.fnAssignCandidateToIntPanel(IntCandidateInfo)

        If check = 1 Then
            MessageBox("Successfully Assigned.")
            txtExInterviewDate.Text = ""
            btnExIntAssignmentChqAll.Enabled = True
            btnExIntAssInterview.Enabled = False
            pnlExAssignInterview.Visible = False
            grdExamCompleted.SelectedIndex = -1
            '' Get Rejected Candidates
            GetRejectedCV(drpAvailableCircular.SelectedValue)
            GetAppliedCandidates(drpAvailableCircular.SelectedValue)
            GetSummaryOfJobCircular(drpAvailableCircular.SelectedValue)
            '' Get Reviwed Candidates
            GetReviewdCV(drpAvailableCircular.SelectedValue)
            ClearReviewCVForm()

            '' Exam Completed Window
            GetExamAssignedCandidates()
            GetAvailableExamsInExamCompleted()
            GetExEntryPoints()
            ClearExamCompletedWindow()
        Else
            MessageBox("Error Generated.")
        End If
    End Sub

#End Region

    Protected Sub btnSearchSuitableFor_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearchSuitableFor.Click

        Dim CircularID As String = drpAvailableCircular.SelectedValue

        Dim SpecilizedID As String = ""
        Dim isSuitableForExists As Boolean = False
        Dim SuitableFor As String = ""
        For Each itm As ListItem In chkListSuitableDepartments.Items
            If itm.Selected = True Then
                isSuitableForExists = True
                SpecilizedID = itm.Value
                SuitableFor = SuitableFor & SpecilizedID & ","
            End If
        Next

        If SuitableFor <> "" Then
            SuitableFor = SuitableFor.Remove(Len(SuitableFor) - 1, 1)
        End If

        GetAppliedCandidatesSuit(CircularID, SuitableFor)

        '' Get Reviwed Candidates
        GetReviewdCVSuit(CircularID, SuitableFor)

        '' Get Exam Assigned Candidates
        GetExamAssignedCandidatesSuit(SuitableFor)

        '' Get Interview Assigned Candidates
        ShowPendingIntCandidatesSuit(SuitableFor)

    End Sub

    Protected Sub btnPendingInterviewTakenChangeStatus_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPendingInterviewTakenChangeStatus.Click
        '' Chq. If Any Attendees Selected.
        Dim Attendees As Boolean = False
        Dim chkSelectIntNotTaken As New System.Web.UI.WebControls.CheckBox()
        Dim lblInterviewedNotTakenAppliedJobID As New System.Web.UI.WebControls.Label()

        For Each rw As GridViewRow In grdInterviewNotTaken.Rows
            chkSelectIntNotTaken = rw.FindControl("chkSelectIntNotTaken")
            If chkSelectIntNotTaken.Checked = True Then
                Attendees = True
                Exit For
            End If
        Next

        If Attendees = False Then
            MessageBox("Select At Least One Attendees")
            Exit Sub
        End If

        Dim ChosenApplicant As String = ""

        For Each rw As GridViewRow In grdInterviewNotTaken.Rows
            chkSelectIntNotTaken = rw.FindControl("chkSelectIntNotTaken")
            If chkSelectIntNotTaken.Checked = True Then
                lblInterviewedNotTakenAppliedJobID = rw.FindControl("lblInterviewedNotTakenAppliedJobID")
                ChosenApplicant += lblInterviewedNotTakenAppliedJobID.Text + ","
            End If
        Next

        ChosenApplicant = ChosenApplicant.Remove(ChosenApplicant.Length - 1)

        Dim check As Integer = CVSelectionData.fnChangeApplicantStatusIntPending(ChosenApplicant, drpInterviewPendingTakenCanStatus.SelectedValue, txtPendIntCanChangeStatRemarks.Text, Session("LoginUserID"))

        If check = 1 Then
            MessageBox(drpInterviewPendingTakenCanStatus.SelectedValue)
            '' Get Rejected Candidates
            GetRejectedCV(drpAvailableCircular.SelectedValue)
            GetAppliedCandidates(drpAvailableCircular.SelectedValue)
            GetSummaryOfJobCircular(drpAvailableCircular.SelectedValue)
            '' Get Reviwed Candidates
            GetReviewdCV(drpAvailableCircular.SelectedValue)

            ClearRejectedCVForm()
            txtPendIntCanChangeStatRemarks.Text = ""

        Else
            MessageBox("Error Found.")
        End If
    End Sub

End Class
