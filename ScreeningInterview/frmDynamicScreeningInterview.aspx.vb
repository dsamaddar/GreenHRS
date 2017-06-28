
Partial Class ScreeningInterview_frmDynamicScreeningInterview
    Inherits System.Web.UI.Page

    Dim DistrictData As New clsDistrictDataAccess()
    Dim EducationData As New clsCanEduDataAccess()
    Dim JobCircularData As New clsJobCircularDataAccess()
    Dim CandidateData As New clsCanBasicDataAccess()
    Dim CVSelectionData As New clsCVSelectionDataAccess()
    Dim EmpInfoData As New clsEmployeeInfoDataAccess()
    Dim CanScrInterviewData As New clsScreeningInterviewDataAccess()
    Dim DeptData As New clsDepartmentDataAccess()
    Dim CanResData As New clsCandidateResponseDataAccess()
    Dim RecTypeData As New clsRecruitmentTypeDataAccess()
    Dim CanEduData As New clsCanEduDataAccess()

    Protected Sub ShowSubjects()
        drpSubjects.DataTextField = "MajorType"
        drpSubjects.DataValueField = "MajorTypeID"
        drpSubjects.DataSource = CanEduData.fnGetAllMajorList()
        drpSubjects.DataBind()

        Dim a As New ListItem()
        a.Value = "0"
        a.Text = "N\A"

        drpSubjects.Items.Insert(0, a)
    End Sub

    Protected Sub rdbtnAnyOneKnownInThisInstitution_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdbtnAnyOneKnownInThisInstitution.SelectedIndexChanged
        If rdbtnAnyOneKnownInThisInstitution.SelectedValue = "1" Then
            pnlAnyOneKnownToCandidate.Visible = True
            drpDesignation.ValidationGroup = "CVScreening"
            txtEmployeeName.ValidationGroup = "CVScreening"
            SetFocus(btnChooseCV)
        Else
            pnlAnyOneKnownToCandidate.Visible = False
            drpDesignation.ValidationGroup = ""
            txtEmployeeName.ValidationGroup = ""
            SetFocus(btnChooseCV)
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetJobCircularList()
            GetRecTypeList()
            ShowOfficialDesignaton()
            ShowSuitableFor()
            ShowDeptList()
            GetPresentDistrictInfo()
            GetInstitutionList()
            GetPermanentDistrictInfo()
            ShowSubjects()
            txtAgeFrom.Text = "20"
            txtAgeTo.Text = "60"
            txtExperience.Text = "0"
            pnlAnyOneKnownToCandidate.Visible = False
            btnRejectCV.Enabled = False
            pnlCandidateResponse.Visible = False
            btnMakeAssessment.Enabled = False
            drpAvailableCircular.Visible = False
        End If
    End Sub

    Protected Sub GetRecTypeList()
        chkLstSuitForRecruitment.DataTextField = "RecruitmentType"
        chkLstSuitForRecruitment.DataValueField = "RecruitmentTypeID"
        chkLstSuitForRecruitment.DataSource = RecTypeData.fnGetRecTypeList()
        chkLstSuitForRecruitment.DataBind()
    End Sub

    Protected Sub GetAppliedJobCircularByCandidate(ByVal CandidateID As String)
        chkLstAppliedCircular.DataTextField = "JobTitle"
        chkLstAppliedCircular.DataValueField = "AppliedJobID"
        chkLstAppliedCircular.DataSource = CanScrInterviewData.fnGetAppliedJobListByCandidate(CandidateID)
        chkLstAppliedCircular.DataBind()
    End Sub

    Protected Sub ShowOfficialDesignaton()
        drpDesignation.DataTextField = "DesignationName"
        drpDesignation.DataValueField = "DesignationID"
        drpDesignation.DataSource = EmpInfoData.fnGetOfficialDesignation()
        drpDesignation.DataBind()
    End Sub

    Protected Sub GetJobCircularList()
        drpAvailableCircular.DataTextField = "JobTitle"
        drpAvailableCircular.DataValueField = "CircularID"
        drpAvailableCircular.DataSource = JobCircularData.fnGetJobCircularList()
        drpAvailableCircular.DataBind()

        Dim a As New ListItem()
        a.Value = "N\A"
        a.Text = "N\A"

        drpAvailableCircular.Items.Insert(0, a)

        Dim CircularID As String = drpAvailableCircular.SelectedValue

        If drpAvailableCircular.Items.Count >= 0 Then
            drpAvailableCircular.SelectedIndex = 0
            If drpAvailableCircular.SelectedValue = "N\A" Then
                GetAppliedCandidates(CircularID, "N\A")
            Else
                GetAppliedCandidates(CircularID, "Applied")
            End If

        End If

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

    Protected Sub GetAppliedCandidates(ByVal CircularID As String, ByVal CurrentStatus As String)
        grdNewCV.DataSource = CanScrInterviewData.fnCVGetForScreening(CircularID, CurrentStatus)
        grdNewCV.DataBind()
    End Sub

    Protected Sub ShowSuitableFor()
        chkbxLstSpecializedIn.DataTextField = "SpecilizedName"
        chkbxLstSpecializedIn.DataValueField = "SpecilizedID"
        chkbxLstSpecializedIn.DataSource = CandidateData.fnGetSpecilizedIn()
        chkbxLstSpecializedIn.DataBind()
    End Sub

    Protected Sub ShowDeptList()
        chkListResponsibilityMatch.DataTextField = "DeptName"
        chkListResponsibilityMatch.DataValueField = "DepartmentID"
        chkListResponsibilityMatch.DataSource = DeptData.fnGetDeptList()
        chkListResponsibilityMatch.DataBind()

        chkListSuitableDepartments.DataTextField = "DeptName"
        chkListSuitableDepartments.DataValueField = "DepartmentID"
        chkListSuitableDepartments.DataSource = DeptData.fnGetDeptList()
        chkListSuitableDepartments.DataBind()
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnChooseCV_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnChooseCV.Click

        Dim CanScreeningIntInfo As New clsScreeningInterview()
        Dim IsResponsibilityMatched As Boolean = False

        Dim lblCandidateID As New System.Web.UI.WebControls.Label()
        Dim CandidateID, SpecilizedID, RecruitmentTypeID, EntryBy As String

        If grdNewCV.SelectedIndex = -1 Then
            MessageBox("Select A Candidate First")
            Exit Sub
        End If
        lblCandidateID = grdNewCV.SelectedRow.FindControl("lblCandidateID")
        CandidateID = lblCandidateID.Text

        EntryBy = Session("LoginUserID")

        If CandidateID = "" Then
            MessageBox("Select Candidate")
            Exit Sub
        End If

        Dim lblScreeningQuesID As New System.Web.UI.WebControls.Label()
        Dim rdbtnScrQuestionOptions As New System.Web.UI.WebControls.RadioButtonList()

        Dim ScrMultipleQuesAnswerData As String = ""
        For Each rw As GridViewRow In grdLoanScrQuestions.Rows
            lblScreeningQuesID = rw.FindControl("lblScreeningQuesID")
            rdbtnScrQuestionOptions = rw.FindControl("rdbtnScrQuestionOptions")

            ScrMultipleQuesAnswerData = ScrMultipleQuesAnswerData & CandidateID & "~" & lblScreeningQuesID.Text & "~" & rdbtnScrQuestionOptions.SelectedValue.ToString() & "~" & EntryBy & "~|"

        Next

        Dim ResponsibilityMatched As String = ""
        For Each itm As ListItem In chkListResponsibilityMatch.Items
            If itm.Selected = True Then
                IsResponsibilityMatched = True
                SpecilizedID = itm.Value
                ResponsibilityMatched = ResponsibilityMatched & CandidateID & "~" & SpecilizedID & "~" & EntryBy & "~|"
            End If
        Next

        If IsResponsibilityMatched = False Then
            MessageBox("Input Matched Responsibility")
            Exit Sub
        End If

        SpecilizedID = ""

        Dim isSuitableForExists As Boolean = False
        Dim SuitableFor As String = ""
        For Each itm As ListItem In chkListSuitableDepartments.Items
            If itm.Selected = True Then
                isSuitableForExists = True
                SpecilizedID = itm.Value
                SuitableFor = SuitableFor & CandidateID & "~" & SpecilizedID & "~" & EntryBy & "~|"
            End If
        Next

        If isSuitableForExists = False Then
            MessageBox("Input Suitable For Which Responsibility")
            Exit Sub
        End If

        Dim isSuitableForRec As Boolean = False
        Dim SuitableForRec As String = ""
        For Each itm As ListItem In chkLstSuitForRecruitment.Items
            If itm.Selected = True Then
                isSuitableForRec = True
                RecruitmentTypeID = itm.Value
                SuitableForRec = SuitableForRec & CandidateID & "~" & RecruitmentTypeID & "~" & EntryBy & "~|"
            End If
        Next

        If SuitableForRec = "" Then
            MessageBox("Select Candidate Suitable For Recruitment.")
            Exit Sub
        End If

        CanScreeningIntInfo.SuitableForRec = SuitableForRec
        CanScreeningIntInfo.CandidateID = CandidateID
        CanScreeningIntInfo.InterviewMethod = rdbtnInterviewMethod.SelectedValue
        CanScreeningIntInfo.IsAccepted = True
        CanScreeningIntInfo.IsRejected = False
        CanScreeningIntInfo.CanResMatchedInfoData = ResponsibilityMatched
        CanScreeningIntInfo.CanSuitableForInfoData = SuitableFor

        If rdbtnAnyOneKnownInThisInstitution.SelectedValue = 0 Then
            CanScreeningIntInfo.IsAnyOneKnownToOurInstitution = False
            CanScreeningIntInfo.KnownDesignationID = "N\A"
            CanScreeningIntInfo.KnownPerson = "N\A"
            CanScreeningIntInfo.HowToKnowThePerson = "N\A"
        Else
            CanScreeningIntInfo.IsAnyOneKnownToOurInstitution = True
            CanScreeningIntInfo.KnownDesignationID = drpDesignation.SelectedValue
            CanScreeningIntInfo.KnownPerson = txtEmployeeName.Text
            CanScreeningIntInfo.HowToKnowThePerson = rdbtnHowToKnowThePerson.SelectedValue
        End If

        CanScreeningIntInfo.Remarks = txtTakeVerbatimNotes.Text
        CanScreeningIntInfo.ScreenedBy = EntryBy
        CanScreeningIntInfo.NextAction = drpNextCourseOfAction.SelectedValue
        CanScreeningIntInfo.ScrMultipleQuesAnswerData = ScrMultipleQuesAnswerData

        Dim AppliedCircularToReject As String = ""

        For Each itm As ListItem In chkLstAppliedCircular.Items
            If itm.Selected = True Then
                AppliedCircularToReject += itm.Value + ","
            End If
        Next

        If AppliedCircularToReject <> "" Then
            AppliedCircularToReject = AppliedCircularToReject.Remove(Len(AppliedCircularToReject) - 1, 1)
        End If



        CanScreeningIntInfo.AppliedCircularToReject = AppliedCircularToReject

        Dim Check As Integer = CanScrInterviewData.fnInsertScreeningInterview(CanScreeningIntInfo)

        If Check = 1 Then
            ClearForm()
            MessageBox("Screened Successfully.")
        Else
            MessageBox("Error Found.")
        End If
    End Sub

    Protected Sub ClearForm()
        Dim rdbtnScrQuestionOptions As New System.Web.UI.WebControls.RadioButtonList()
        'GetJobCircularList()
        'ShowSuitableFor()
        'ShowDeptList()
        pnlAnyOneKnownToCandidate.Visible = False
        grdNewCV.SelectedIndex = -1
        drpDesignation.SelectedIndex = -1
        rdbtnAnyOneKnownInThisInstitution.SelectedIndex = -1
        rdbtnInterviewMethod.SelectedIndex = -1
        txtEmployeeName.Text = ""
        txtTakeVerbatimNotes.Text = ""
        drpNextCourseOfAction.SelectedIndex = -1

        For Each rw As GridViewRow In grdLoanScrQuestions.Rows
            rdbtnScrQuestionOptions = rw.FindControl("rdbtnScrQuestionOptions")
            rdbtnScrQuestionOptions.SelectedIndex = -1
        Next

        For Each itm As ListItem In chkListResponsibilityMatch.Items
            itm.Selected = False
        Next

        For Each itm As ListItem In chkListSuitableDepartments.Items
            itm.Selected = False
        Next

        chkLstAppliedCircular.DataSource = ""
        chkLstAppliedCircular.DataBind()

        If drpAvailableCircular.SelectedValue = "N\A" Then
            GetAppliedCandidates(drpAvailableCircular.SelectedValue, "N\A")
        Else
            GetAppliedCandidates(drpAvailableCircular.SelectedValue, "Applied")
        End If


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
        CVSelection.Religion = drpReligion.SelectedValue
        CVSelection.YearOfExperience = Convert.ToInt32(txtExperience.Text)
        CVSelection.MajorTypeID = drpSubjects.SelectedValue
        CVSelection.SpecializedID = ""

        grdNewCV.DataSource = CVSelectionData.fnSearchApplicantForScreening(CVSelection)
        grdNewCV.DataBind()
    End Sub

    Protected Sub drpAvailableCircular_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpAvailableCircular.SelectedIndexChanged
        If drpAvailableCircular.SelectedValue = "N\A" Then
            GetAppliedCandidates(drpAvailableCircular.SelectedValue, "N\A")
        Else
            GetAppliedCandidates(drpAvailableCircular.SelectedValue, "Applied")
        End If

        grdNewCV.SelectedIndex = -1

        chkLstAppliedCircular.DataSource = ""
        chkLstAppliedCircular.DataBind()
        txtTakeVerbatimNotes.Text = ""
        drpNextCourseOfAction.SelectedIndex = -1

    End Sub

    Protected Sub btnRejectCV_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRejectCV.Click

        If grdNewCV.SelectedIndex = -1 Then
            MessageBox("Select A Candidate First")
            Exit Sub
        End If

        Dim EntryBy = Session("LoginUserID")
        Dim AppliedCircularToReject As String = ""
        Dim lblCandidateID As New System.Web.UI.WebControls.Label()
        Dim CandidateID As String = ""
        lblCandidateID = grdNewCV.SelectedRow.FindControl("lblCandidateID")
        CandidateID = lblCandidateID.Text

        Dim Remarks As String = txtTakeVerbatimNotes.Text

        If txtTakeVerbatimNotes.Text = "" Then
            MessageBox("Please Take verbatim notes")
            Exit Sub
        End If

        For Each itm As ListItem In chkLstAppliedCircular.Items
            If itm.Selected = True Then
                AppliedCircularToReject += itm.Value + ","
            End If
        Next

        If AppliedCircularToReject <> "" Then
            AppliedCircularToReject = AppliedCircularToReject.Remove(Len(AppliedCircularToReject) - 1, 1)
        End If

        If AppliedCircularToReject = "" And drpAvailableCircular.SelectedItem.Text <> "N\A" Then
            MessageBox("Select To Reject from a particular Circular.")
            Exit Sub
        End If

        Dim Check As Integer = CanScrInterviewData.fnRejectCandidate(CandidateID, Remarks, EntryBy, AppliedCircularToReject)

        If Check = 1 Then
            ClearFormForRejection()
            MessageBox("Rejected Successfully.")
            btnRejectCV.Enabled = False
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub ClearFormForRejection()

        Dim rdbtnScrQuestionOptions As New System.Web.UI.WebControls.RadioButtonList()
        pnlAnyOneKnownToCandidate.Visible = False
        txtTakeVerbatimNotes.Text = ""
        drpNextCourseOfAction.SelectedIndex = -1
        grdNewCV.SelectedIndex = -1

        If drpAvailableCircular.Items.Count >= 0 Then
            'drpAvailableCircular.SelectedIndex = 0
            If drpAvailableCircular.SelectedValue = "N\A" Then
                GetAppliedCandidates(drpAvailableCircular.SelectedValue, "N\A")
            Else
                GetAppliedCandidates(drpAvailableCircular.SelectedValue, "Applied")
            End If

        End If

        For Each rw As GridViewRow In grdLoanScrQuestions.Rows
            rdbtnScrQuestionOptions = rw.FindControl("rdbtnScrQuestionOptions")
            rdbtnScrQuestionOptions.SelectedIndex = -1
        Next

        For Each itm As ListItem In chkListResponsibilityMatch.Items
            itm.Selected = False
        Next

        For Each itm As ListItem In chkListSuitableDepartments.Items
            itm.Selected = False
        Next

        chkLstAppliedCircular.DataSource = ""
        chkLstAppliedCircular.DataBind()

    End Sub

    Protected Sub drpNextCourseOfAction_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpNextCourseOfAction.SelectedIndexChanged
        If drpNextCourseOfAction.SelectedValue = "Rejected" Then
            btnRejectCV.Enabled = True
            SetFocus(btnRejectCV)
            For Each itm As ListItem In chkLstAppliedCircular.Items
                itm.Selected = True
            Next

        Else
            For Each itm As ListItem In chkLstAppliedCircular.Items
                itm.Selected = False
            Next
            btnRejectCV.Enabled = False
        End If
    End Sub

    Dim TotalCandidate As Integer = 0

    Protected Sub grdNewCV_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdNewCV.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            TotalCandidate += 1
        End If

        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(2).Text = "Total:"
            e.Row.Cells(3).Text = TotalCandidate.ToString()
        End If
    End Sub

    Protected Sub grdNewCV_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdNewCV.SelectedIndexChanged

        Dim lblCandidateID As New System.Web.UI.WebControls.Label()

        lblCandidateID = grdNewCV.SelectedRow.FindControl("lblCandidateID")
        GetAppliedJobCircularByCandidate(lblCandidateID.Text)
        btnMakeAssessment.Enabled = True

    End Sub

    Protected Sub rdbtnLstDidNotRespond_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdbtnLstDidNotRespond.SelectedIndexChanged
        pnlCandidateResponse.Visible = True
    End Sub

    Protected Sub btnCancelResponse_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelResponse.Click
        pnlCandidateResponse.Visible = False
        txtCandidateResponseRemarks.Text = ""
        rdbtnLstDidNotRespond.SelectedIndex = -1
    End Sub

    Protected Sub btnMakeAssessment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMakeAssessment.Click

        Dim lblCandidateID As New System.Web.UI.WebControls.Label()

        Try

            If rdbtnInterviewMethod.SelectedIndex = -1 Then
                MessageBox("Select Interview Method First.")
                Exit Sub
            End If

            lblCandidateID = grdNewCV.SelectedRow.FindControl("lblCandidateID")
            Dim CanRes As New clsCandidateResponse()

            CanRes.CandidateID = lblCandidateID.Text
            CanRes.CommunicationMethod = rdbtnInterviewMethod.SelectedValue
            CanRes.Options = rdbtnLstDidNotRespond.SelectedValue
            CanRes.Remarks = txtCandidateResponseRemarks.Text
            CanRes.AssessedBy = Session("LoginUserID")

            Dim Check As Integer = CanResData.fnInsertCanResponse(CanRes)

            If Check = 1 Then
                MessageBox("Assessment Done.")
                pnlCandidateResponse.Visible = False
                txtCandidateResponseRemarks.Text = ""
                btnMakeAssessment.Enabled = False
                rdbtnInterviewMethod.SelectedIndex = -1
                rdbtnLstDidNotRespond.SelectedIndex = -1
                grdNewCV.SelectedIndex = -1
                ShowCandidateInfo()
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
       
    End Sub

    Protected Sub ShowCandidateInfo()
        Dim CircularID As String = drpAvailableCircular.SelectedValue

        If drpAvailableCircular.Items.Count >= 0 Then
            drpAvailableCircular.SelectedIndex = 0
            If drpAvailableCircular.SelectedValue = "N\A" Then
                GetAppliedCandidates(CircularID, "N\A")
            Else
                GetAppliedCandidates(CircularID, "Applied")
            End If

        End If
    End Sub

    Protected Sub btnByPassScreening_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnByPassScreening.Click

        Dim CanScreeningIntInfo As New clsScreeningInterview()

        Dim lblCandidateID As New System.Web.UI.WebControls.Label()
        Dim CandidateID, SpecilizedID, EntryBy, RecruitmentTypeID As String
        EntryBy = Session("LoginUserID")

        If grdNewCV.SelectedIndex = -1 Then
            MessageBox("Select A Candidate First")
            Exit Sub
        End If

        lblCandidateID = grdNewCV.SelectedRow.FindControl("lblCandidateID")
        CandidateID = lblCandidateID.Text

        Dim isSuitableForExists As Boolean = False
        Dim SuitableFor As String = ""
        For Each itm As ListItem In chkListSuitableDepartments.Items
            If itm.Selected = True Then
                isSuitableForExists = True
                SpecilizedID = itm.Value
                SuitableFor = SuitableFor & CandidateID & "~" & SpecilizedID & "~" & EntryBy & "~|"
            End If
        Next

        Dim isSuitableForRec As Boolean = False
        Dim SuitableForRec As String = ""
        For Each itm As ListItem In chkLstSuitForRecruitment.Items
            If itm.Selected = True Then
                isSuitableForRec = True
                RecruitmentTypeID = itm.Value
                SuitableForRec = SuitableForRec & CandidateID & "~" & RecruitmentTypeID & "~" & EntryBy & "~|"
            End If
        Next

        If SuitableForRec = "" Then
            MessageBox("Select Candidate Suitable For Recruitment.")
            Exit Sub
        End If

        CanScreeningIntInfo.CandidateID = CandidateID
        CanScreeningIntInfo.ScreenedBy = Session("LoginUserID")
        CanScreeningIntInfo.CanSuitableForInfoData = SuitableFor
        CanScreeningIntInfo.SuitableForRec = SuitableForRec

        Dim Check As Integer = CanScrInterviewData.fnByPassScreening(CanScreeningIntInfo)

        If Check = 1 Then
            ClearForm()
            MessageBox("ByPassed Successfully.")
        Else
            MessageBox("Error Found.")
        End If

    End Sub

End Class
