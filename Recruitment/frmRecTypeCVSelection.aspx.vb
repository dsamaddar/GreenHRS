
Partial Class Recruitment_frmRecTypeCVSelection
    Inherits System.Web.UI.Page

    Dim CVSelectionData As New clsCVSelectionDataAccess()
    Dim ExamData As New clsExamDataAccess()
    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()
    Dim QuestionPaperData As New clsQuestionPaperDataAccess()
    Dim RecTypeData As New clsRecruitmentTypeDataAccess()
    Dim IntTeamData As New clsInterviewTeamDataAccess()
    Dim EntryPointData As New clsEntryPointDataAccess()
    Dim IntCandidateData As New clsInterviewCandidateDataAccess()
    Dim IntGradeData As New clsIntGradeDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetRecTypeList()

            '' New CV

            '' End Of New CV

            '' Review CV
            pnlAssignExam.Visible = False
            pnlAssignInterview.Visible = False
            pnlOtherActions.Visible = False
            btnAssignInterview.Enabled = False
            btnGenerateExam.Enabled = False
            GetAvailableExams()
            ShowULCBranch()
            GetEntryPoints()
            GetInterviewTeamList()
            '' End Of Review CV

            '' Exam Assigned But Not Taken

            '' End Of Exam Assigned But Not Taken

            '' Exam Assigned candidate
            pnlAssignOtherExams.Visible = False
            pnlExChangeStatus.Visible = False
            pnlExAssignInterview.Visible = False
            btnGenerateOtherExams.Enabled = False
            GetExamAssignedCandidates()
            GetAvailableExamsInExamCompleted()
            GetExEntryPoints()
            GetExInterviewTeamList()
            'btnIntComIntAssInterview.Enabled = False

            '' Rejected CV 

            '' End Of Rejected CV

            '' Interview Assigned
            GetIntComInterviewTeamList()
            ShowPendingIntCandidates()
            '' End Of Interview Assigned

            '' Interview Completed
            ShowIntCanGradeList()
            '' End Of Interview Completed

            '' Exam Effective Date
            txtExAssOtrExamsEffectiveDate.Text = Now.Date
            txtReviewedExamEffectiveDate.Text = Now.Date

            '' Interview Effective Date
            txtExInterviewDate.Text = Now.Date
            txtIntCompletedInterviewDate.Text = Now.Date

            drpRecTypeList.Visible = True
            drpRecTypeList.SelectedIndex = 0
            RecTypeSelected()

        End If
    End Sub

    Protected Sub ShowPendingIntCandidates()
        grdInterviewNotTaken.DataSource = CVSelectionData.fnGetPendingIntCandidateList("N\A")
        grdInterviewNotTaken.DataBind()
    End Sub

    Protected Sub GetRecTypeList()
        drpRecTypeList.DataTextField = "RecruitmentType"
        drpRecTypeList.DataValueField = "RecruitmentTypeID"
        drpRecTypeList.DataSource = RecTypeData.fnGetRecTypeList()
        drpRecTypeList.DataBind()

        Dim A As New ListItem()
        A.Text = "N\A"
        A.Value = "N\A"
        drpRecTypeList.Items.Insert(0, A)
    End Sub

    Protected Sub drpRecTypeList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpRecTypeList.SelectedIndexChanged
        RecTypeSelected()
    End Sub

    Protected Sub RecTypeSelected()

        'ClearPrevDataAfterCirSelection()

        'GetSummaryOfJobCircular(CircularID)

        '' Get Reviwed Candidates
        GetReviewdCV(drpRecTypeList.SelectedValue)

        '' Get Exam Assigned But Not Taken
        GetExamAssignedCandidatesNotTaken()

        '' Get Exam Assigned Candidates
        GetExamAssignedCandidates()
        'GetAvailableExamsInExamCompleted()

        '' Get Interview Assigned Candidates
        'ShowPendingIntCandidates()

        '' Get Rejected Candidates
        'GetRejectedCV(drpRecTypeList.SelectedValue)
    End Sub

#Region " Review CV Panel "

    Protected Sub GetReviewdCV(ByVal RecruitmentTypeID As String)
        grdReviewedCV.DataSource = CVSelectionData.fnGetReviewdCVByRecTypeID(RecruitmentTypeID)
        grdReviewedCV.DataBind()
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

    Protected Sub ShowULCBranch()
        drpULCBranchSelectedCV.DataTextField = "ULCBranchName"
        drpULCBranchSelectedCV.DataValueField = "ULCBranchID"
        drpULCBranchSelectedCV.DataSource = EmployeeInfoData.fnGetULCBranch()
        drpULCBranchSelectedCV.DataBind()

        drpULCBranchExamAssigned.DataTextField = "ULCBranchName"
        drpULCBranchExamAssigned.DataValueField = "ULCBranchID"
        drpULCBranchExamAssigned.DataSource = EmployeeInfoData.fnGetULCBranch()
        drpULCBranchExamAssigned.DataBind()

        drpNULCBranch.DataTextField = "ULCBranchName"
        drpNULCBranch.DataValueField = "ULCBranchID"
        drpNULCBranch.DataSource = EmployeeInfoData.fnGetULCBranch()
        drpNULCBranch.DataBind()
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

        drpNAvailableExam.DataTextField = "ExamName"
        drpNAvailableExam.DataValueField = "ExamID"
        drpNAvailableExam.DataSource = ExamData.fnGetAvailableExams()
        drpNAvailableExam.DataBind()

        Dim B As New ListItem
        B.Text = "----- Choose Exam -----"
        B.Value = "N\A"
        drpNAvailableExam.Items.Insert(0, B)

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


        drpNEntryPoint.DataTextField = "EntryPoint"
        drpNEntryPoint.DataValueField = "EntryPoint"
        drpNEntryPoint.DataSource = QuestionPaperData.fnGetEntryPoints()
        drpNEntryPoint.DataBind()

        Dim B As New ListItem()
        B.Text = "-- Select EntryPoints --"
        B.Value = "N\A"

        drpNEntryPoint.Items.Insert(0, B)

    End Sub

    Protected Sub drpEntryPoint_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpEntryPoint.SelectedIndexChanged
        GetUsersByEntryPoints(drpEntryPoint.SelectedValue)
    End Sub

    Public Sub GetUsersByNEntryPoints(ByVal EntryPoint As String)
        grdNEntryPointWiseAttendees.DataSource = QuestionPaperData.fnGetAttendeesByEntryPoint(EntryPoint)
        grdNEntryPointWiseAttendees.DataBind()
    End Sub

    Public Sub GetUsersByEntryPoints(ByVal EntryPoint As String)
        grdEntryPointWiseAttendees.DataSource = QuestionPaperData.fnGetAttendeesByEntryPoint(EntryPoint)
        grdEntryPointWiseAttendees.DataBind()
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

    Protected Sub btnNCheckAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNCheckAll.Click
        Dim Attendees As Boolean = False
        If drpNAvailableExam.SelectedValue = "N\A" Then
            MessageBox("Select Exam First.")
            Exit Sub
        End If

        '' Chq. If Any Attendees Selected.
        Dim chkSelectNReviewed As New CheckBox()

        For Each rw As GridViewRow In grdNewExamAssigned.Rows
            chkSelectNReviewed = rw.FindControl("chkSelectNReviewed")
            If chkSelectNReviewed.Checked = True Then
                Attendees = True
                Exit For
            End If
        Next

        If Attendees = False Then
            MessageBox("Select At Least One Attendees")
            Exit Sub
        End If

        Dim ExistAssignedAttendees As String = ""
        Dim lblEAExaminedCandidateID As New Label()
        Dim lblEAExaminedCandidateName As New Label()
        Dim AlreadyExists As Integer = 0

        '' Check For Already Assigned but Exam not Taken 
        For Each rw As GridViewRow In grdNewExamAssigned.Rows
            chkSelectNReviewed = rw.FindControl("chkSelectNReviewed")
            If chkSelectNReviewed.Checked = True Then

                lblEAExaminedCandidateID = rw.FindControl("lblEAExaminedCandidateID")
                lblEAExaminedCandidateName = rw.FindControl("lblEAExaminedCandidateName")
                AlreadyExists = QuestionPaperData.fnChkAlreadyAssignedAndExamNotTaken(lblEAExaminedCandidateID.Text, drpAvailableExams.SelectedValue)
                If AlreadyExists = 1 Then
                    ExistAssignedAttendees += lblEAExaminedCandidateName.Text + ","
                    chkSelectNReviewed.Checked = False
                End If
            End If
        Next

        If ExistAssignedAttendees <> "" Then
            ExistAssignedAttendees = ExistAssignedAttendees.Remove(Len(ExistAssignedAttendees) - 1)
            MessageBox(drpAvailableExams.SelectedItem.ToString() + " Is Already Assigned For Below Attendees: " + ExistAssignedAttendees)
        End If

        grdNewExamAssigned.Enabled = False
        btnNCheckAll.Enabled = False
        drpNAvailableExam.Enabled = False
        btnNGenerateExam.Enabled = True
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

    Protected Sub btnNGenerateExam_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNGenerateExam.Click
        Dim QuestionPaper As New clsQuestionPaper()
        Dim Attendees As Boolean = False
        Dim Participant As String = ""
        Dim EntryPoint As String = ""

        Try
            '' Chq. If Any Attendees Selected.
            Dim chkSelectNReviewed As New CheckBox()
            Dim lblEAExaminedCandidateID As New Label()

            For Each rw As GridViewRow In grdNewExamAssigned.Rows()
                chkSelectNReviewed = rw.FindControl("chkSelectNReviewed")
                If chkSelectNReviewed.Checked = True Then
                    Attendees = True
                    Exit For
                End If
            Next

            If Attendees = False Then
                MessageBox("Select At Least One Attendees")
                Exit Sub
            End If

            For Each rw As GridViewRow In grdNewExamAssigned.Rows()
                chkSelectNReviewed = rw.FindControl("chkSelectNReviewed")
                If chkSelectNReviewed.Checked = True Then
                    lblEAExaminedCandidateID = rw.FindControl("lblEAExaminedCandidateID")
                    Participant += lblEAExaminedCandidateID.Text + ","
                End If
            Next

            If Participant <> "" Then
                Participant = Participant.Remove(Len(Participant) - 1)
            End If


            ' EntryPoint = Now.Year.ToString + Now.Month.ToString() + Now.Day.ToString() + Now.Hour.ToString() + Now.Minute.ToString()
            EntryPoint = EntryPointData.fnGetEntryPoint()

            QuestionPaper.ExamID = drpNAvailableExam.SelectedValue
            QuestionPaper.Participant = Participant
            QuestionPaper.EntryPoint = EntryPoint
            QuestionPaper.EffectiveDate = txtNExamEffectiveDate.Text & " " & drpNSHour.SelectedValue & ":" & drpNSMin.SelectedValue & ":00" & " " & drpNSAMPM.SelectedValue
            QuestionPaper.CircularID = "N\A" '############################################################ Need TO Change
            QuestionPaper.PreparedBy = Session("LoginUserID")
            QuestionPaper.ULCBranchID = drpNULCBranch.SelectedValue

            Dim Check As Integer = QuestionPaperData.fnAssignQuestionPaper(QuestionPaper)

            If Check = 1 Then
                MessageBox("Successfully Assigned..")
                GetEntryPoints()
                If drpNEntryPoint.Items.Count > 0 Then
                    drpNEntryPoint.SelectedIndex = 0
                    GetUsersByNEntryPoints(drpNEntryPoint.SelectedValue)
                End If
                drpNAvailableExam.Enabled = True
                grdNewExamAssigned.Enabled = True
                btnNCheckAll.Enabled = True
                btnNGenerateExam.Enabled = False
                'GetExamAssignedCandidatesNotTaken()
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
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
            QuestionPaper.CircularID = "N\A" '############################################################ Need TO Change
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
                GetExamAssignedCandidatesNotTaken()
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
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

        IntCandidateInfo.CircularID = "N\A" '############################################################ Need TO Change
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
        IntCandidateInfo.CircularID = "N\A" '############################################################ Need TO Change
        IntCandidateInfo.IntTeamID = drpAvailableIntTeamList.SelectedValue
        IntCandidateInfo.InterviewDate = Convert.ToDateTime(txtInterviewDate.Text & " " & drpSIHour.SelectedValue & ":" & drpSIMin.SelectedValue & ":00" & " " & drpSIAMPM.SelectedValue)
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

        '' Get Reviwed Candidates
        GetReviewdCV(drpRecTypeList.SelectedValue)
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
            'GetSummaryOfJobCircular(drpAvailableCircular.SelectedValue)
            '' Get Reviwed Candidates
            GetReviewdCV(drpRecTypeList.SelectedValue)
        Else
            MessageBox("Error Found.")
        End If

    End Sub



#End Region

#Region " Exam Not Taken "

    Protected Sub GetExamAssignedCandidatesNotTaken()
        grdNewExamAssigned.DataSource = CVSelectionData.fnGetExamAssignedNotTakenByRecTypeID(drpRecTypeList.SelectedValue)
        grdNewExamAssigned.DataBind()
    End Sub

#End Region

#Region " Exam Assigned "

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

    Protected Sub GetExamAssignedCandidates()
        grdExamCompleted.DataSource = CVSelectionData.fnGetExamAssignedByRecTypeID(drpRecTypeList.SelectedValue)
        grdExamCompleted.DataBind()
    End Sub

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

            QuestionPaper.CircularID = "N\A"
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

        IntCandidateInfo.CircularID = "N\A" ''drpAvailableCircular.SelectedValue
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
        'btnIntComIntAssInterview.Enabled = True
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
        IntCandidateInfo.CircularID = "N\A" ' drpAvailableCircular.SelectedValue
        IntCandidateInfo.IntTeamID = drpExAvailableIntTeamList.SelectedValue
        IntCandidateInfo.InterviewDate = Convert.ToDateTime(txtExInterviewDate.Text & " " & drpECOEIHour.SelectedValue & ":" & drpECOEIMin.SelectedValue & ":00" & " " & drpECOEIAMPM.SelectedValue)
        IntCandidateInfo.EntryBy = Session("LoginUserID")

        Dim check As Integer = IntCandidateData.fnAssignCandidateToIntPanel(IntCandidateInfo)

        If check = 1 Then
            MessageBox("Successfully Assigned.")
            txtExInterviewDate.Text = ""
            btnExIntAssignmentChqAll.Enabled = True
            'btnIntComIntAssInterview.Enabled = False
            pnlExAssignInterview.Visible = False
            grdExamCompleted.SelectedIndex = -1

            ShowPendingIntCandidates()

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

#Region " Interview Assigned "

    Protected Sub GetIntComInterviewTeamList()
        drpInterviewCompletedIntTeamList.DataTextField = "IntTeamName"
        drpInterviewCompletedIntTeamList.DataValueField = "IntTeamID"
        drpInterviewCompletedIntTeamList.DataSource = IntTeamData.fnGetInterviewTeamList()
        drpInterviewCompletedIntTeamList.DataBind()

        Dim A As New ListItem
        A.Text = "----- Choose Team -----"
        A.Value = "N\A"
        drpInterviewCompletedIntTeamList.Items.Insert(0, A)
    End Sub

#End Region

#Region " Interview Completed "

    Protected Sub drpApplicantGrade_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpApplicantGrade.SelectedIndexChanged
        GetFinallySelectedCandidateList()
    End Sub

    Protected Sub GetFinallySelectedCandidateList()
        Dim IntGradeID As String = drpApplicantGrade.SelectedValue
        Dim RecruitmentTypeID As String

        RecruitmentTypeID = "N\A"

        grdInterviewCompletedCandidates.DataSource = CVSelectionData.fnInterviewedCandidatesByRecTypeID(RecruitmentTypeID, IntGradeID)
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

#End Region


    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    '' Gridview Summary
 
    Protected Sub grdReviewedCV_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdReviewedCV.RowDataBound
        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(3).Text = "Total: "
            e.Row.Cells(4).Text = grdReviewedCV.Rows.Count.ToString()
        End If
    End Sub

    Protected Sub grdNewExamAssigned_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdNewExamAssigned.RowDataBound
        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(3).Text = "Total: "
            e.Row.Cells(4).Text = grdNewExamAssigned.Rows.Count.ToString()
        End If
    End Sub

    Protected Sub grdExamCompleted_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdExamCompleted.RowDataBound
        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(3).Text = "Total: "
            e.Row.Cells(4).Text = grdExamCompleted.Rows.Count.ToString()
        End If
    End Sub

    Protected Sub grdInterviewNotTaken_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdInterviewNotTaken.RowDataBound
        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(3).Text = "Total: "
            e.Row.Cells(4).Text = grdInterviewNotTaken.Rows.Count.ToString()
        End If
    End Sub

    Protected Sub grdInterviewCompletedCandidates_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdInterviewCompletedCandidates.RowDataBound
        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(3).Text = "Total: "
            e.Row.Cells(4).Text = grdInterviewNotTaken.Rows.Count.ToString()
        End If
    End Sub

    '' End Of Gridview Summary
   
    Protected Sub drpNEntryPoint_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpNEntryPoint.SelectedIndexChanged
        GetUsersByNEntryPoints(drpNEntryPoint.SelectedValue)
    End Sub

End Class
