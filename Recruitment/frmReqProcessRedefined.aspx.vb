Imports System
Imports System.Data
Imports System.Drawing
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared
Imports System.Net.Mail

Partial Class Recruitment_frmReqProcessRedefined
    Inherits System.Web.UI.Page

    Dim RecTypeData As New clsRecruitmentTypeDataAccess()
    Dim RegionData As New clsRegionDataAccess()
    Dim IntManQuesData As New clsIntManQuestionDataAccess()
    Dim ReqProcessData As New clsNewReqProcessDataAccess()
    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()
    Dim IntTeamData As New clsInterviewTeamDataAccess()
    Dim TestTypeData As New clsExternalTestTypeDataAccess()
    Dim ExamData As New clsExamDataAccess()
    Dim QuestionPaperData As New clsQuestionPaperDataAccess()
    Dim DeptData As New clsDepartmentDataAccess()
    Dim EntryPointData As New clsEntryPointDataAccess()
    Dim ExtTestScoreData As New clsExternalTestScoreDataAccess()
    Dim IntCandidateData As New clsInterviewCandidateDataAccess()
    Dim SuiBranchData As New clsSuitableBranchDataAccess()
    Dim CanTagData As New clsCanRecruitmentTagDataAccess()
    Dim ULCBranchData As New clsULCBranchDataAccess()
    Dim IntCanData As New clsInterviewCandidateDataAccess()
    Dim ResReqData As New clsResourceReqDataAccess()
    Dim SrtLstCanData As New clsShortListedCanDataAccess()
    Dim AppliedJobData As New clsAppliedJobDataAccess()
    Dim IntCanAssessmentData As New clsIntCandidateAssessmentDataAccess()
    Dim Employementdata As New clsEmployementdataAccess()
    Dim PausedExamsStatData As New clsPausedExamStatusDataAccess()
    Dim CanBasicData As New clsCanBasicDataAccess()

    Shared IsResReqBtnPressed As Boolean = False
    Shared IsReviewedBtnPressed As Boolean = False
    Shared IsExamAssBtnPressed As Boolean = False
    Shared IsExamComBtnPressed As Boolean = False
    Shared IsPreliIntBtnPressed As Boolean = False
    Shared IsPanelIntBtnPressed As Boolean = False
    Shared IsPoolBtnPressed As Boolean = False
    Shared IsOfferBtnPressed As Boolean = False
    Shared IsJoiningBtnPressed As Boolean = False
    Shared IsAssignInterview As Boolean = False
    Shared IsAssignExam As Boolean = False

#Region " Interview Review "

    Protected Function FormatInterviewerReview() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("EmployeeID", System.Type.GetType("System.String"))
        dt.Columns.Add("Interviewer", System.Type.GetType("System.String"))
        dt.Columns.Add("Grade", System.Type.GetType("System.Decimal"))
        dt.Columns.Add("Remarks", System.Type.GetType("System.String"))
        Return dt
    End Function

    Protected Sub btnAddReview_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddReview.Click
        grdInterviewerReview.DataSource = GetReviewData()
        grdInterviewerReview.DataBind()
    End Sub

    Protected Function GetReviewData() As DataTable

        Dim dtIntReview = Session("dtIntReview")

        If (CheckDuplicateEntry() = 0) Then
            MessageBox("You Can't Insert Duplicate Review")
            Return dtIntReview
        End If
        Dim dr As DataRow
        dr = dtIntReview.NewRow()
        dr("EmployeeID") = drpInterviewer.SelectedValue
        dr("Interviewer") = drpInterviewer.SelectedItem.ToString()
        dr("Grade") = drpGrading.SelectedValue
        dr("Remarks") = txtInterviewerRemarks.Text

        dtIntReview.Rows.Add(dr)
        dtIntReview.AcceptChanges()

        Return dtIntReview
    End Function

    Public Function CheckDuplicateEntry() As Integer
        Dim lbl As System.Web.UI.WebControls.Label
        For Each rw As GridViewRow In grdInterviewerReview.Rows
            lbl = rw.FindControl("lblEmployeeID")
            If lbl.Text = Nothing Then
                Return 0
            End If
            If drpInterviewer.SelectedValue = lbl.Text Then
                MessageBox("You Can't Insert Duplicate Review.")
                Return 0
            End If
        Next
        Return 1
    End Function

    Protected Sub grdInterviewerReview_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdInterviewerReview.RowDataBound
        Dim lblGrade As New Label
        If e.Row.RowType = DataControlRowType.DataRow Then
            lblGrade = e.Row.FindControl("lblGrade")
            TotalGrade += Convert.ToInt32(lblGrade.Text)
        End If

        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(1).Text = "Total : "
            e.Row.Cells(2).Text = String.Format("{0:N2}", Math.Round((TotalGrade / grdInterviewerReview.Rows.Count), 2).ToString())
        End If

    End Sub

    Protected Sub grdInterviewerReview_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grdInterviewerReview.RowDeleting
        Dim i As Integer
        Dim dtIntReview As DataTable = New DataTable()

        dtIntReview = Session("dtIntReview")

        i = e.RowIndex

        dtIntReview.Rows(i).Delete()
        dtIntReview.AcceptChanges()
        grdInterviewerReview.DataSource = dtIntReview
        grdInterviewerReview.DataBind()
    End Sub

#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            GetRecTypeList()
            GetRegions()
            GetActiveIntManQuestions()
            ShowULCBranch()
            GetInterviewTeamList()
            ShowTestTypeList()
            GetAvailableExams()
            GetEntryPoints()
            ShowDepertment()
            ShowDesignationOfficial()
            ShowEmployeeType()
            GetBranchList()
            DisablingQuesReplyOption()

            pnlSearchParameter.Enabled = False
            pnlHRUseOnly.Enabled = False
            pnlInterviewerReview.Enabled = False

            Session("dtIntReview") = ""
            Dim dtIntReview As DataTable = New DataTable()
            dtIntReview = FormatInterviewerReview()
            Session("dtIntReview") = dtIntReview
            txtExpectedJoiningDate.Text = ""

            drpAppointLetterFormat.Visible = True
            drpOfferLetterFormat.Visible = False

            GetRecruitmentTypeList()
            GetResourceReq()
            GetResourceReqStatus()
            HideAllOtherControls()
            btnResourceRequest.Font.Bold = True
            btnResourceRequest.ForeColor = Color.DarkOrange
            IsResReqBtnPressed = True
            InitializeDropDownStyle()

            txtNewInterviewDate.Text = Now.Date
        End If

        If grdCandidates.Rows.Count > 0 Then
            'This replaces <td> with <th> and adds the scope attribute
            grdCandidates.UseAccessibleHeader = True
            'This will add the <thead> and <tbody> elements
            grdCandidates.HeaderRow.TableSection = TableRowSection.TableHeader
            'This adds the <tfoot> element.Remove if you don't have a footer row
            grdCandidates.FooterRow.TableSection = TableRowSection.TableFooter
        End If

    End Sub

    Protected Sub InitializeDropDownStyle()
        drpBranchList.Style.SelectBoxCssClass = "inputtxtbox"
        drpBranchList.Style.SelectBoxWidth = 200
        drpBranchList.Style.DropDownBoxBoxWidth = 200
        drpBranchList.Style.DropDownBoxBoxHeight = 100
        drpBranchList.Font.Name = "Verdana"
        drpBranchList.Texts.SelectBoxCaption = "Select Branch"
    End Sub

    Protected Sub GetRecruitmentTypeList()
        Try
            drpResourceTypeList.DataTextField = "RecruitmentType"
            drpResourceTypeList.DataValueField = "RecruitmentTypeID"
            drpResourceTypeList.DataSource = RecTypeData.fnGetRecTypeListForEmp(Session("UniqueUserID"))
            drpResourceTypeList.DataBind()

            Dim A As New ListItem
            A.Value = "N\A"
            A.Text = "-- Resource Type --"
            drpResourceTypeList.Items.Insert(0, A)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub GetResourceReq()
        Try
            grdPendingResourceRequests.DataSource = ResReqData.fnGetResourceReqForEmp(Session("UniqueUserID"))
            grdPendingResourceRequests.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub GetResourceReqStatus()
        Try
            grdResReqStatus.DataSource = ResReqData.fnGetResourceReqByUser(Session("UniqueUserID"))
            grdResReqStatus.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub HideAllOtherControls()
        pnlAssessment.Visible = False
        pnlCandidates.Visible = False
        pnlCanRejection.Visible = False
        pnlEvaluation.Visible = False
        pnlHRUseOnly.Visible = False
        pnlInterviewerReview.Visible = False
        pnlMandatoryQuestions.Visible = False
        pnlModalAssignExams.Visible = False
        pnlModalAssignInterview.Visible = False
        pnlModalLocation.Visible = False
        pnlModalPutTestScore.Visible = False
        pnlSearchParameter.Visible = False
        pnlSelectionPanel.Visible = False
        pnlSuitableForList.Visible = False
        pnlTestSummary.Visible = False
        pnlModalIntReschedule.Visible = False
    End Sub

    Protected Sub HideResReqControls()
        pnlPendingResoureceRequests.Visible = False
        pnlResReq.Visible = False
        pnlResReqStatus.Visible = False
        pnlResReqRejection.Visible = False
    End Sub

    Protected Sub ShowResReqControls()
        pnlPendingResoureceRequests.Visible = True
        pnlResReq.Visible = True
        pnlResReqStatus.Visible = True
        pnlResReqRejection.Visible = True
    End Sub

    Protected Sub ShowAllOtherControls()
        pnlAssessment.Visible = True
        pnlCandidates.Visible = True
        pnlCanRejection.Visible = True
        pnlEvaluation.Visible = True
        pnlHRUseOnly.Visible = True
        pnlInterviewerReview.Visible = True
        pnlMandatoryQuestions.Visible = True
        pnlModalAssignExams.Visible = True
        pnlModalAssignInterview.Visible = True
        pnlModalLocation.Visible = True
        pnlModalPutTestScore.Visible = True
        pnlSearchParameter.Visible = True
        pnlSelectionPanel.Visible = True
        pnlSuitableForList.Visible = True
        pnlTestSummary.Visible = True
    End Sub

    Protected Sub GetBranchList()
        chkBranch.DataTextField = "ULCBranchName"
        chkBranch.DataValueField = "ULCBranchID"
        chkBranch.DataSource = ULCBranchData.fnGetTotalULCBranch()
        chkBranch.DataBind()
    End Sub

    Protected Sub ShowDepertment()
        drpRecommendedDepartment.DataTextField = "DeptName"
        drpRecommendedDepartment.DataValueField = "DepartmentID"
        drpRecommendedDepartment.DataSource = DeptData.fnGetDeptList()
        drpRecommendedDepartment.DataBind()

        Dim A As New ListItem()
        A.Text = "N\A"
        A.Value = "N\A"
        drpRecommendedDepartment.Items.Insert(0, A)
    End Sub

    Protected Sub ShowDesignationOfficial()
        drpRecommendedPosition.DataTextField = "DesignationName"
        drpRecommendedPosition.DataValueField = "DesignationID"
        drpRecommendedPosition.DataSource = EmployeeInfoData.fnGetOfficialDesignation()
        drpRecommendedPosition.DataBind()

        Dim A As New ListItem()
        A.Text = "N\A"
        A.Value = "N\A"
        drpRecommendedPosition.Items.Insert(0, A)
    End Sub

    Protected Sub ShowEmployeeType()
        drpEmployeeType.DataTextField = "EmployeeTypeName"
        drpEmployeeType.DataValueField = "EmployeeTypeID"
        drpEmployeeType.DataSource = EmployeeInfoData.fnGetEmployeeType()
        drpEmployeeType.DataBind()
    End Sub

    Protected Sub GetActiveIntManQuestions()
        grdMandatoryIntQuestions.DataSource = IntManQuesData.fnShowActiveIntManQuestion(True)
        grdMandatoryIntQuestions.DataBind()
    End Sub

    Protected Function FormatTableRegions() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("RegionID", System.Type.GetType("System.String"))
        Return dt
    End Function

    Protected Function FormatTableBranch() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("ULCBranchID", System.Type.GetType("System.String"))
        Return dt
    End Function

    Protected Function FormatBranch() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("ULCBranchID", System.Type.GetType("System.String"))
        dt.Columns.Add("ULCBranchName", System.Type.GetType("System.String"))
        Return dt
    End Function

    Protected Sub GetRecTypeList()
        chkLstSuitForRecruitment.DataTextField = "RecruitmentType"
        chkLstSuitForRecruitment.DataValueField = "RecruitmentTypeID"
        chkLstSuitForRecruitment.DataSource = RecTypeData.fnGetRecTypeList()
        chkLstSuitForRecruitment.DataBind()

        drpRecTypeList.DataTextField = "RecruitmentType"
        drpRecTypeList.DataValueField = "RecruitmentTypeID"
        drpRecTypeList.DataSource = RecTypeData.fnGetRecTypeList()
        drpRecTypeList.DataBind()

        Dim A As New ListItem()
        A.Text = "-- Select Suitable For --"
        A.Value = "N\A"
        drpRecTypeList.Items.Insert(0, A)
    End Sub

    Protected Sub GetRegions()
        chkRegions.DataTextField = "Region"
        chkRegions.DataValueField = "RegionID"
        chkRegions.DataSource = RegionData.fnGetRegionList()
        chkRegions.DataBind()
    End Sub

    Dim dtActual As New DataTable
    Public TotalGrade As Double = 0

    Protected Sub LoadBranchByRegions(ByVal dt As DataTable)
        chkBranch.DataTextField = "ULCBranchName"
        chkBranch.DataValueField = "ULCBranchID"
        chkBranch.DataSource = dt
        chkBranch.DataBind()
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub chkIntManQuestion_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim chkIntManQuestion As New CheckBox
        Dim txtQuesAnswer As New TextBox
        For Each rw As GridViewRow In grdMandatoryIntQuestions.Rows
            chkIntManQuestion = rw.FindControl("chkIntManQuestion")
            txtQuesAnswer = rw.FindControl("txtQuesAnswer")
            If chkIntManQuestion.Checked = True Then
                txtQuesAnswer.Enabled = True
            Else
                txtQuesAnswer.Enabled = False
                txtQuesAnswer.Text = ""
            End If
        Next
    End Sub

    Protected Sub btnRefreshWindow_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRefreshWindow.Click
        Response.Redirect("frmReqProcessRedefined.aspx")
    End Sub

    Protected Sub ShowULCBranch()

        Dim ds As DataSet = EmployeeInfoData.fnGetULCBranch()

        drpULCBranchExamAssigned.DataTextField = "ULCBranchName"
        drpULCBranchExamAssigned.DataValueField = "ULCBranchID"
        drpULCBranchExamAssigned.DataSource = ds
        drpULCBranchExamAssigned.DataBind()

        drpULCBranchListIntAss.DataTextField = "ULCBranchName"
        drpULCBranchListIntAss.DataValueField = "ULCBranchID"
        drpULCBranchListIntAss.DataSource = ds
        drpULCBranchListIntAss.DataBind()

        drpRecommendedLocation.DataTextField = "ULCBranchName"
        drpRecommendedLocation.DataValueField = "ULCBranchID"
        drpRecommendedLocation.DataSource = ds
        drpRecommendedLocation.DataBind()

        drpULCBranch.DataTextField = "ULCBranchName"
        drpULCBranch.DataValueField = "ULCBranchID"
        drpULCBranch.DataSource = ds
        drpULCBranch.DataBind()

        drpBranchList.DataTextField = "ULCBranchName"
        drpBranchList.DataValueField = "ULCBranchID"
        drpBranchList.DataSource = ds
        drpBranchList.DataBind()

        Dim A As New ListItem()
        A.Text = "-- Select Branch --"
        A.Value = "N\A"

        drpRecommendedLocation.Items.Insert(0, A)
        drpULCBranch.Items.Insert(0, A)

    End Sub

    Protected Sub GetInterviewTeamList()

        Dim ds As DataSet = IntTeamData.fnGetInterviewTeamList()
        drpIntTeamList.DataTextField = "IntTeamName"
        drpIntTeamList.DataValueField = "IntTeamID"
        drpIntTeamList.DataSource = ds
        drpIntTeamList.DataBind()

        drpAvailableIntTeamList.DataTextField = "IntTeamName"
        drpAvailableIntTeamList.DataValueField = "IntTeamID"
        drpAvailableIntTeamList.DataSource = ds
        drpAvailableIntTeamList.DataBind()
    End Sub

    Protected Sub ShowTestTypeList()
        drpTestType.DataTextField = "ExternalTest"
        drpTestType.DataValueField = "ExternalTestTypeID"
        drpTestType.DataSource = TestTypeData.fnGetExternalTestTypeList()
        drpTestType.DataBind()
    End Sub

    Protected Sub GetAvailableExams()
        drpAvailableExams.DataTextField = "ExamName"
        drpAvailableExams.DataValueField = "ExamID"
        drpAvailableExams.DataSource = ExamData.fnGetAvailableExams()
        drpAvailableExams.DataBind()
    End Sub

    Protected Sub grdCandidates_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdCandidates.RowDataBound
        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(2).Text = "Total"
            e.Row.Cells(3).Text = grdCandidates.Rows.Count.ToString()
        End If
    End Sub

    Protected Sub grdCandidates_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdCandidates.SelectedIndexChanged
        Dim lblCandidateID, lblCandidate, lblID As New Label
        lblCandidateID = grdCandidates.SelectedRow.FindControl("lblCandidateID")
        lblCandidate = grdCandidates.SelectedRow.FindControl("lblCandidate")
        lblID = grdCandidates.SelectedRow.FindControl("lblID")

        ClearRecTypeSelection()
        ClearRegions()
        ClearOfferForm()
        DisablingQuesReplyOption()

        lblAssExamTo.Text = lblCandidate.Text
        lblCanSuiForLoc.Text = lblCandidate.Text
        lblCanSuiForRecType.Text = lblCandidate.Text
        lblAssIntToCan.Text = lblCandidate.Text
        lblAssExtTestScoreToCan.Text = lblCandidate.Text
        GetTestScores(lblCandidateID.Text)
        GetCanTagInfo(lblCandidateID.Text)
        GetExamInfo(lblCandidateID.Text)
        GetAskedQuestionInfo(lblCandidateID.Text)
        GetIntPanelMembers(lblCandidateID.Text)

        If IsOfferBtnPressed = True Then
            GetOfferInfoTemp(lblCandidateID.Text)
        End If

        If IsJoiningBtnPressed = True Then
            GetOfferInfo(lblID.Text)
        End If

        If IsOfferBtnPressed = True Then
            GetShortListSelection(lblCandidateID.Text)
        End If

        If IsPreliIntBtnPressed = True Or IsPanelIntBtnPressed = True Then
            GetAssignedInterviewInfo(lblCandidateID.Text)
            btnRescheduleInterview.Enabled = True
        End If

    End Sub

    Protected Sub GetAssignedInterviewInfo(ByVal CandidateID As String)
        Try
            Dim IC As New clsInterviewCandidate()
            IC = IntCandidateData.fnGetCandidateIntInfo(CandidateID)

            hdFldIntCandidateID.Value = IC.IntCandidateID
            drpAvailableIntTeamList.SelectedValue = IC.IntTeamID
            lblPrevScheduleDate.Text = IC.InterviewDate
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnRescheduleInterview_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRescheduleInterview.Click

        Try
            If drpAvailableIntTeamList.SelectedIndex = 0 Then
                MessageBox("Select Proper Interview Team.")
                Exit Sub
            End If

            Dim IntCan As New clsInterviewCandidate()
            IntCan.IntCandidateID = hdFldIntCandidateID.Value
            IntCan.IntTeamID = drpAvailableIntTeamList.SelectedValue
            IntCan.InterviewDate = txtNewInterviewDate.Text & " " & drpSHour.SelectedValue & ":" & drpSMin.SelectedValue & ":00" & " " & drpSAMPM.SelectedValue

            Dim Check As Integer = IntCanData.fnRescheduleInterview(IntCan)

            If Check = 1 Then
                MessageBox("Rescheduled Successfully.")
                ClearRescheduleIntForm()
                ReloadCandidates()
            Else
                MessageBox("Error Found.")
            End If

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub ClearRescheduleIntForm()
        hdFldIntCandidateID.Value = ""
        drpAvailableIntTeamList.SelectedIndex = -1
        txtNewInterviewDate.Text = ""
        lblPrevScheduleDate.Text = ""

        btnRescheduleInterview.Enabled = False
    End Sub

    Protected Sub GetShortListSelection(ByVal CandidateID As String)
        Try
            Dim SrtCan As New clsShortListedCan()
            SrtCan = SrtLstCanData.fnGetCanShortListedSelection(CandidateID)
            drpRecommendedLocation.SelectedValue = SrtCan.ULCBranchID
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub GetOfferInfo(ByVal ProposalID As String)
        Try
            Dim Employement As New clsEmployement()
            Employement = Employementdata.fnGetEmploymentInfoByProposalID(ProposalID)

            drpRecommendedDepartment.SelectedValue = Employement.DepartmentID
            drpRecommendedLocation.SelectedValue = Employement.LocationID
            drpRecommendedPosition.SelectedValue = Employement.PositionID
            drpEmployeeType.SelectedValue = Employement.EmployeeTypeID
            txtExpectedJoiningDate.Text = Employement.ExpectedJoiningDate
            txtRemarks.Text = Employement.Remarks
            txtEffectiveDate.Text = Employement.EffectiveFrom
            txtEffectiveTo.Text = Employement.EffectiveTo
            txtPeriodInMonths.Text = Employement.Period.ToString()

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub GetOfferInfoTemp(ByVal CandidateID As String)
        Try
            Dim Employement As New clsEmployement()
            Employement = Employementdata.fnGetEmploymentInfoByProposalIDTemp(CandidateID)

            drpRecommendedDepartment.SelectedValue = Employement.DepartmentID
            drpRecommendedLocation.SelectedValue = Employement.LocationID
            drpRecommendedPosition.SelectedValue = Employement.PositionID
            drpEmployeeType.SelectedValue = Employement.EmployeeTypeID
            txtExpectedJoiningDate.Text = Employement.ExpectedJoiningDate
            txtRemarks.Text = Employement.Remarks
            txtEffectiveDate.Text = Employement.EffectiveFrom
            txtEffectiveTo.Text = Employement.EffectiveTo
            txtPeriodInMonths.Text = Employement.Period.ToString()
            txtSalary.Text = Employement.Salary
            txtLocalConveyance.Text = Employement.LocalConveyance

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub CreateEmployment()
        Try
            Dim lblCandidateID, lblCandidate, lblID As New Label
            lblCandidateID = grdCandidates.SelectedRow.FindControl("lblCandidateID")
            lblCandidate = grdCandidates.SelectedRow.FindControl("lblCandidate")
            lblID = grdCandidates.SelectedRow.FindControl("lblID")

            Dim Check As Integer = Employementdata.fnInsertEmployment(lblCandidateID.Text, drpEmployeeType.SelectedValue, Convert.ToDateTime(txtExpectedJoiningDate.Text), Session("LoginUserID"), lblID.Text)

            If Check = 1 Then
                MessageBox("Employment Successful")
                'GetFinallySelectedCandidateList()
                SendJoiningMailToAdmin(lblCandidate.Text)
                SendJoiningMailToICT(lblCandidate.Text)
                'ClearForm()
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub SendJoiningMailToICT(ByVal Name As String)
        Dim sb As StringBuilder = New StringBuilder()
        Dim mail As New Net.Mail.MailMessage()

        Try
            mail.To.Add("sysadmin@ulc.com")
            'mail.CC.Add("HR@ulc.com")
            mail.Bcc.Add("Debayan@ulc.com")
            mail.From = New MailAddress("HR@ulc.com")
            mail.Subject = "GreenHRS: Joining "
            sb.Append("</br></br><html><head></head><table style='border-width:2px;border-style:solid' >")
            sb.Append("<tr><td colspan='4'>A New Employee has joined. Please Create Windows ID & E-Mail ID for the person. Following is the details regarding the person:</td></tr>")
            sb.Append("<tr><td></td><td colspan='3'></td><tr>")
            sb.Append("<tr><td align='right'>Name :</td><td colspan='3'>" + Name + "</td><tr>")
            sb.Append("<tr><td align='right'>Designation :</td><td colspan='3'>" + drpRecommendedPosition.SelectedItem.ToString() + "</td><tr>")
            sb.Append("<tr><td align='right'>Department :</td><td colspan='3'>" + drpRecommendedDepartment.SelectedItem.ToString() + "</td><tr>")
            sb.Append("<tr><td align='right'>Branch :</td><td colspan='3'>" + drpRecommendedLocation.SelectedItem.ToString() + "</td><tr>")
            sb.Append("</table>")
            sb.Append("</html>")
            mail.Body = sb.ToString()
            mail.IsBodyHtml = True
            Dim smtp As New SmtpClient("192.168.1.232", 25)
            smtp.Send(mail)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub SendJoiningMailToAdmin(ByVal Name As String)
        Dim sb As StringBuilder = New StringBuilder()
        Dim mail As New Net.Mail.MailMessage()
        Try
            mail.To.Add("sysadmin@ulc.com")
            mail.Bcc.Add("Debayan@ulc.com")
            mail.From = New MailAddress("HR@ulc.com")
            mail.Subject = "GreenHRS: Joining "
            sb.Append("</br></br><html><head></head><table style='border-width:2px;border-style:solid' >")
            sb.Append("<tr><td colspan='4'>A New Employee has joined. Please take necessary step for insurance of the person.Following is the details regarding the person:</td></tr>")
            sb.Append("<tr><td></td><td colspan='3'></td><tr>")
            sb.Append("<tr><td align='right'>Name :</td><td colspan='3'>" + Name + "</td><tr>")
            sb.Append("<tr><td align='right'>Designation :</td><td colspan='3'>" + drpRecommendedPosition.SelectedItem.ToString() + "</td><tr>")
            sb.Append("<tr><td align='right'>Department :</td><td colspan='3'>" + drpRecommendedDepartment.SelectedItem.ToString() + "</td><tr>")
            sb.Append("<tr><td align='right'>Branch :</td><td colspan='3'>" + drpRecommendedLocation.SelectedItem.ToString() + "</td><tr>")
            sb.Append("</table>")
            sb.Append("</html>")
            mail.Body = sb.ToString()
            mail.IsBodyHtml = True
            Dim smtp As New SmtpClient("192.168.1.242", 25)
            smtp.Send(mail)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub GetIntPanelMembers(ByVal CandidateID As String)
        drpInterviewer.DataValueField = "EmployeeID"
        drpInterviewer.DataTextField = "EmployeeName"
        drpInterviewer.DataSource = ReqProcessData.fnGetReqProIntTeamMember(CandidateID)
        drpInterviewer.DataBind()

        Dim A As New ListItem
        A.Text = "-- Select Interview --"
        A.Value = "N\A"
        drpInterviewer.Items.Insert(0, A)

    End Sub

#Region " Mandatory Interview Questions "

    Protected Sub GetAskedQuestionInfo(ByVal CandidateID As String)
        '' Get Asked Question Previously
        Dim chkIntManQuestion As New CheckBox
        Dim lblIntManQuestionID As New Label()
        Dim txtQuesAnswer As New TextBox
        Dim Response As String = ""
        For Each rw As GridViewRow In grdMandatoryIntQuestions.Rows
            lblIntManQuestionID = rw.FindControl("lblIntManQuestionID")
            txtQuesAnswer = rw.FindControl("txtQuesAnswer")
            chkIntManQuestion = rw.FindControl("chkIntManQuestion")
            Response = IntManQuesData.fnChqGetIntQuesReply(CandidateID, lblIntManQuestionID.Text)
            If Response <> "" Then
                chkIntManQuestion.Checked = True
                txtQuesAnswer.Enabled = True
            End If
            txtQuesAnswer.Text = Response
            Response = ""
        Next
    End Sub

    Protected Sub DisablingQuesReplyOption()
        Dim chkIntManQuestion As New CheckBox
        Dim txtQuesAnswer As New TextBox
        For Each rw As GridViewRow In grdMandatoryIntQuestions.Rows
            chkIntManQuestion = rw.FindControl("chkIntManQuestion")
            txtQuesAnswer = rw.FindControl("txtQuesAnswer")
            txtQuesAnswer.Enabled = False
            txtQuesAnswer.Text = ""
            chkIntManQuestion.Checked = False
        Next
    End Sub

#End Region

#Region " Exam Info "

    Protected Sub GetExamInfo(ByVal CandidateID As String)
        grdTestSummary.DataSource = ReqProcessData.fnGetTestSummaryByCandidate(CandidateID)
        grdTestSummary.DataBind()
    End Sub

    Protected Sub grdTestSummary_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdTestSummary.RowDataBound
        Dim lblIsActive, lblExamTaken, lblExamReActivate As New Label
        Dim lnkBtnActivateExam, lnkBtnDeleteExam, lnkBtnReActiveExam, lnkBtnDeactiveExam As New LinkButton

        If e.Row.RowType = DataControlRowType.DataRow Then
            lblIsActive = e.Row.FindControl("lblIsActive")
            lblExamTaken = e.Row.FindControl("lblExamTaken")
            lblExamReActivate = e.Row.FindControl("lblExamReActivate")
            lnkBtnActivateExam = e.Row.FindControl("lnkBtnActivateExam")
            lnkBtnDeleteExam = e.Row.FindControl("lnkBtnDeleteExam")
            lnkBtnReActiveExam = e.Row.FindControl("lnkBtnReActiveExam")
            lnkBtnDeactiveExam = e.Row.FindControl("lnkBtnDeactiveExam")

            If lblExamTaken.Text = "N" And lblIsActive.Text = "N" Then
                lnkBtnActivateExam.Enabled = True
                lnkBtnDeleteExam.Enabled = True
                lnkBtnDeactiveExam.Text = ""
                lnkBtnDeactiveExam.Enabled = False
                lnkBtnReActiveExam.Text = ""
                lnkBtnReActiveExam.Enabled = False
            ElseIf lblExamTaken.Text = "N" And lblIsActive.Text = "Y" Then
                lnkBtnDeleteExam.Enabled = True
                lnkBtnDeactiveExam.Enabled = True
                lnkBtnActivateExam.Text = ""
                lnkBtnActivateExam.Enabled = False
                lnkBtnReActiveExam.Text = ""
                lnkBtnReActiveExam.Enabled = False
            Else
                lnkBtnActivateExam.Text = ""
                lnkBtnActivateExam.Enabled = False
                lnkBtnDeleteExam.Text = ""
                lnkBtnDeleteExam.Enabled = False
                lnkBtnDeactiveExam.Text = ""
                lnkBtnDeactiveExam.Enabled = False
                If lblExamReActivate.Text <> "Y" Then
                    lnkBtnReActiveExam.Text = ""
                    lnkBtnReActiveExam.Enabled = False
                End If
            End If
        End If
    End Sub

    Protected Sub grdTestSummary_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdTestSummary.SelectedIndexChanged
        Dim lnk As LinkButton = CType(sender, LinkButton)
        Select Case lnk.CommandName
            Case "Activate"
                ActivateExam(lnk.CommandArgument)
            Case "Remove"
                DeleteExam(lnk.CommandArgument)
            Case "Deactive"
                DeactiveExam(lnk.CommandArgument)
            Case "ReActivate"
                ReActivateExam(lnk.CommandArgument)
        End Select
    End Sub

    Protected Sub ReActivateExam(ByVal ExamRollNo As String)
        Dim lblCandidateID As Label
        Try
            lblCandidateID = grdCandidates.SelectedRow.FindControl("lblCandidateID")
            Dim Check As Integer = PausedExamsStatData.fnReactiveExam(ExamRollNo)

            If Check = 1 Then
                MessageBox("Re-Activated Successfully.")
                GetExamInfo(lblCandidateID.Text)
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub DeactiveExam(ByVal ExamRollNo As String)
        Dim lblCandidateID As Label
        Dim QuestionPaper As New clsQuestionPaper()
        Try
            lblCandidateID = grdCandidates.SelectedRow.FindControl("lblCandidateID")

            QuestionPaper.ExamTakerID = lblCandidateID.Text
            QuestionPaper.ExamRollNo = ExamRollNo

            Dim Check As Integer = QuestionPaperData.fnInActivateExam(QuestionPaper)

            If Check = 1 Then
                MessageBox("In-Active Successfully.")
                GetExamInfo(lblCandidateID.Text)
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ActivateExam(ByVal ExamRollNo As String)
        Dim lblCandidateID As New Label
        Dim QuestionPaper As New clsQuestionPaper()
        Try
            lblCandidateID = grdCandidates.SelectedRow.FindControl("lblCandidateID")
            QuestionPaper.ExamTakerID = lblCandidateID.Text
            QuestionPaper.ExamRollNo = ExamRollNo

            Dim Check As Integer = QuestionPaperData.fnActivateExam(QuestionPaper)

            If Check = 1 Then
                GetExamInfo(lblCandidateID.Text)
                MessageBox("Exam Activated Successfully.")
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub DeleteExam(ByVal ExamRollNo As String)
        Dim lblCandidateID As New Label
        Try
            lblCandidateID = grdCandidates.SelectedRow.FindControl("lblCandidateID")
            Dim Check As Integer = ReqProcessData.fnDeleteExamByRollNo(ExamRollNo)

            If Check = 1 Then
                GetExamInfo(lblCandidateID.Text)
                ReloadCandidates()
                MessageBox("Exam Deleted Successfully.")
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

#End Region

    Protected Sub ClearRecTypeSelection()
        For Each itm As ListItem In chkLstSuitForRecruitment.Items
            itm.Selected = False
        Next
    End Sub

    Protected Sub btnGenerateOtherExams_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGenerateOtherExams.Click
        IsAssignExam = True
        btnGenerateOtherExams.Enabled = False
    End Sub

    Protected Sub AssignExam()
        Dim QuestionPaper As New clsQuestionPaper()
        'Dim Attendees As Boolean = False
        'Dim Participant As String = ""
        Dim EntryPoint As String = ""
        Dim lblCandidateID As New Label

        Try
            '' Chq. If Any Attendees Selected.
            Dim chkSelectExaminedCandidate As New System.Web.UI.WebControls.CheckBox()
            'Dim lblExaminedCandidateID As New System.Web.UI.WebControls.Label()

            If drpAvailableExams.SelectedValue = "N\A" Then
                MessageBox("Select Exam First.")
                Exit Sub
            End If

            '' Chq. If Any Attendees Selected.
            If grdCandidates.SelectedIndex = -1 Then
                MessageBox("Select A Candidate First.")
                Exit Sub
            End If

            ' Dim lblExaminedCandidateName As New System.Web.UI.WebControls.Label()
            Dim AlreadyExists As Integer = 0

            '' Check For Already Assigned but Exam not Taken 
            lblCandidateID = grdCandidates.SelectedRow.FindControl("lblCandidateID")
            AlreadyExists = QuestionPaperData.fnChkAlreadyAssignedAndExamNotTaken(lblCandidateID.Text, drpAvailableExams.SelectedValue)
            If AlreadyExists = 1 Then
                MessageBox("Already Assigned.")
                Exit Sub
            End If

            EntryPoint = EntryPointData.fnGetEntryPoint()

            QuestionPaper.CircularID = "CIR-00000002"
            QuestionPaper.ExamID = drpAvailableExams.SelectedValue
            QuestionPaper.Participant = lblCandidateID.Text
            QuestionPaper.EntryPoint = EntryPoint
            QuestionPaper.EffectiveDate = txtExAssOtrExamsEffectiveDate.Text & " " & drpECOEHour.SelectedValue & ":" & drpECOEMin.SelectedValue & ":00" & " " & drpECOEAMPM.SelectedValue
            QuestionPaper.PreparedBy = Session("LoginUserID")
            QuestionPaper.ULCBranchID = drpULCBranchExamAssigned.SelectedValue

            Dim Check As Integer = QuestionPaperData.fnAssignQuestionPaper(QuestionPaper)

            If Check = 1 Then
                MessageBox("Successfully Assigned..")
                ClearAssignExamForm()
                If IsExamAssBtnPressed = True And lblCandidateID.Text <> "" Then
                    GetExamInfo(lblCandidateID.Text)
                Else
                    ReloadCandidates()
                End If

                GetEntryPoints()
                If drpEntryPoint.Items.Count > 0 Then
                    drpEntryPoint.SelectedIndex = 0
                    GetUsersByEntryPoints(drpEntryPoint.SelectedValue)
                End If
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ClearAssignExamForm()
        drpAvailableExams.SelectedIndex = -1
        txtExAssOtrExamsEffectiveDate.Text = ""
        drpECOEAMPM.SelectedIndex = -1
        drpECOEHour.SelectedIndex = -1
        drpECOEIMin.SelectedIndex = -1
        btnGenerateOtherExams.Enabled = True
        IsAssignExam = False
    End Sub

    Public Sub GetUsersByEntryPoints(ByVal EntryPoint As String)
        grdExEntryPointWiseCandidate.DataSource = QuestionPaperData.fnGetAttendeesByEntryPoint(EntryPoint)
        grdExEntryPointWiseCandidate.DataBind()
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

    Protected Sub drpEntryPoint_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpEntryPoint.SelectedIndexChanged
        GetUsersByEntryPoints(drpEntryPoint.SelectedValue)
    End Sub

#Region " Menu Buttons Click "

    Protected Sub ClearBtnSelection()
        IsReviewedBtnPressed = False
        IsExamAssBtnPressed = False
        IsExamComBtnPressed = False
        IsPreliIntBtnPressed = False
        IsPanelIntBtnPressed = False
        IsPoolBtnPressed = False
        IsOfferBtnPressed = False
        IsJoiningBtnPressed = False

        IsAssignInterview = False
        btnExIntAssInterview.Enabled = True

        IsAssignExam = False
        btnGenerateOtherExams.Enabled = True

        btnResourceRequest.Font.Bold = False
        btnResourceRequest.ForeColor = Color.White

        btnReview.Font.Bold = False
        btnReview.ForeColor = Color.White

        btnExamAssigned.Font.Bold = False
        btnExamAssigned.ForeColor = Color.White

        btnExamCompleted.Font.Bold = False
        btnExamCompleted.ForeColor = Color.White

        btnPreliminaryInterview.Font.Bold = False
        btnPreliminaryInterview.ForeColor = Color.White

        btnPanelInterview.Font.Bold = False
        btnPanelInterview.ForeColor = Color.White

        btnPool.Font.Bold = False
        btnPool.ForeColor = Color.White

        btnOffer.Font.Bold = False
        btnOffer.ForeColor = Color.White

        btnJoining.Font.Bold = False
        btnJoining.ForeColor = Color.White

        grdCandidates.DataSource = ""
        grdCandidates.DataBind()
        grdCandidates.SelectedIndex = -1

        grdTestSummary.DataSource = ""
        grdTestSummary.DataBind()

        pnlSearchParameter.Enabled = False
        pnlHRUseOnly.Enabled = False
        pnlInterviewerReview.Enabled = False

        btnAccept.ValidationGroup = ""
        drpRecTypeList.SelectedIndex = -1
        drpRegion.SelectedIndex = -1
        drpBranchList.SelectedIndex = -1
        lblDemand.Text = "0"
        lblSupply.Text = "0"

        drpAppointLetterFormat.Visible = False
        drpOfferLetterFormat.Visible = False

        ShowAllOtherControls()
        HideResReqControls()
        ClearAssignExamForm()
        ClearInterviewAssForm()
        ClearIntForm()

        grdPendingResourceRequests.SelectedIndex = -1

    End Sub

    Protected Sub ClearTestSummaryForm()
        grdTestSummary.DataSource = ""
        grdTestSummary.DataBind()
    End Sub

    Protected Sub ClearInterviewerReveiw()
        grdInterviewerReview.DataSource = ""
        grdInterviewerReview.DataBind()

        Session("dtIntReview") = ""
        Dim dtIntReview As DataTable = New DataTable()
        dtIntReview = FormatInterviewerReview()
        Session("dtIntReview") = dtIntReview

        drpInterviewer.SelectedIndex = -1
        drpGrading.SelectedIndex = -1
        txtInterviewerRemarks.Text = ""
    End Sub

    Protected Sub ClearFormForOnlyPool()
        If grdCandidates.Rows.Count > 0 Then
            grdCandidates.SelectedIndex = -1
        End If
        ClearRegions()
        ClearRecTypeSelection()
        ClearTestSummaryForm()
        ClearInterviewerReveiw()
        DisablingQuesReplyOption()
    End Sub

    Protected Sub ClearOfferForm()
        drpRecommendedDepartment.SelectedIndex = -1
        drpRecommendedPosition.SelectedIndex = -1
        drpRecommendedPosition.SelectedIndex = -1
        txtExpectedJoiningDate.Text = ""
        drpEmployeeType.SelectedIndex = -1
        txtRemarks.Text = ""
        txtPeriodInMonths.Text = "0"
        txtSalary.Text = "0"
        txtEffectiveDate.Text = ""
        txtEffectiveTo.Text = ""
        drpAppointLetterFormat.SelectedIndex = -1

        grdSalCalc.DataSource = ""
        grdSalCalc.DataBind()
    End Sub

    Protected Sub ReloadCandidates()
        Try
            Dim ds As New DataSet

            If IsReviewedBtnPressed = True Then
                ds = ReqProcessData.fnGetReqProReviewCan()
            ElseIf IsExamAssBtnPressed = True Then
                ds = ReqProcessData.fnGetReqProExmAss()
            ElseIf IsExamComBtnPressed = True Then
                ds = ReqProcessData.fnGetReqProExmCom()
            ElseIf IsPreliIntBtnPressed = True Then
                ds = ReqProcessData.fnGetPrimaryIntCan()
            ElseIf IsPanelIntBtnPressed = True Then
                ds = ReqProcessData.fnGetPanelIntCan()
            ElseIf IsPoolBtnPressed = True Then
                SearchPOOL()
            ElseIf IsOfferBtnPressed = True Then
                ds = ReqProcessData.fnGetShortListedCandidateNew()
            Else
                ds = ReqProcessData.fnRecProGetJoiningPending()
            End If

            grdCandidates.DataSource = ds
            grdCandidates.DataBind()

            If grdCandidates.Rows.Count > 0 Then
                grdCandidates.SelectedIndex = -1
            End If

            drpRecTypeList.SelectedIndex = -1
            drpRegion.SelectedIndex = -1
            lblDemand.Text = "0"
            lblSupply.Text = "0"
            txtLocalConveyance.Text = "0"

            ClearRegions()
            ClearRecTypeSelection()
            ClearTestSummaryForm()
            ClearInterviewerReveiw()
            DisablingQuesReplyOption()

            If grdCandidates.Rows.Count > 0 Then
                'This replaces <td> with <th> and adds the scope attribute
                grdCandidates.UseAccessibleHeader = True
                'This will add the <thead> and <tbody> elements
                grdCandidates.HeaderRow.TableSection = TableRowSection.TableHeader
                'This adds the <tfoot> element.Remove if you don't have a footer row
                grdCandidates.FooterRow.TableSection = TableRowSection.TableFooter
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ClearIntForm()
        Session("dtIntReview") = ""
        Dim dtIntReview As DataTable = New DataTable()
        dtIntReview = FormatInterviewerReview()
        Session("dtIntReview") = dtIntReview
    End Sub

    Protected Sub btnResourceRequest_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnResourceRequest.Click
        ClearBtnSelection()

        btnResourceRequest.Font.Bold = True
        btnResourceRequest.ForeColor = Color.DarkOrange
        IsResReqBtnPressed = True

        ShowResReqControls()
        GetResourceReq()
        GetResourceReqStatus()
        HideAllOtherControls()
    End Sub

    Protected Sub btnReview_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReview.Click
        ClearBtnSelection()

        grdCandidates.DataSource = ReqProcessData.fnGetReqProReviewCan()
        grdCandidates.DataBind()
        btnReview.Font.Bold = True
        btnReview.ForeColor = Color.DarkOrange
        IsReviewedBtnPressed = True

        If grdCandidates.Rows.Count > 0 Then
            'This replaces <td> with <th> and adds the scope attribute
            grdCandidates.UseAccessibleHeader = True
            'This will add the <thead> and <tbody> elements
            grdCandidates.HeaderRow.TableSection = TableRowSection.TableHeader
            'This adds the <tfoot> element.Remove if you don't have a footer row
            grdCandidates.FooterRow.TableSection = TableRowSection.TableFooter
        End If

    End Sub

    Protected Sub btnExamAssigned_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExamAssigned.Click
        ClearBtnSelection()

        grdCandidates.DataSource = ReqProcessData.fnGetReqProExmAss()
        grdCandidates.DataBind()
        btnExamAssigned.Font.Bold = True
        btnExamAssigned.ForeColor = Color.DarkOrange
        IsExamAssBtnPressed = True

        If grdCandidates.Rows.Count > 0 Then
            'This replaces <td> with <th> and adds the scope attribute
            grdCandidates.UseAccessibleHeader = True
            'This will add the <thead> and <tbody> elements
            grdCandidates.HeaderRow.TableSection = TableRowSection.TableHeader
            'This adds the <tfoot> element.Remove if you don't have a footer row
            grdCandidates.FooterRow.TableSection = TableRowSection.TableFooter
        End If

    End Sub

    Protected Sub btnExamCompleted_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExamCompleted.Click
        ClearBtnSelection()

        grdCandidates.DataSource = ReqProcessData.fnGetReqProExmCom()
        grdCandidates.DataBind()
        btnExamCompleted.Font.Bold = True
        btnExamCompleted.ForeColor = Color.DarkOrange
        IsExamComBtnPressed = True

        If grdCandidates.Rows.Count > 0 Then
            'This replaces <td> with <th> and adds the scope attribute
            grdCandidates.UseAccessibleHeader = True
            'This will add the <thead> and <tbody> elements
            grdCandidates.HeaderRow.TableSection = TableRowSection.TableHeader
            'This adds the <tfoot> element.Remove if you don't have a footer row
            grdCandidates.FooterRow.TableSection = TableRowSection.TableFooter
        End If

    End Sub

    Protected Sub btnPreliminaryInterview_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPreliminaryInterview.Click
        ClearBtnSelection()

        grdCandidates.DataSource = ReqProcessData.fnGetPrimaryIntCan()
        grdCandidates.DataBind()
        btnPreliminaryInterview.Font.Bold = True
        btnPreliminaryInterview.ForeColor = Color.DarkOrange
        IsPreliIntBtnPressed = True
        pnlInterviewerReview.Enabled = True

        If grdCandidates.Rows.Count > 0 Then
            'This replaces <td> with <th> and adds the scope attribute
            grdCandidates.UseAccessibleHeader = True
            'This will add the <thead> and <tbody> elements
            grdCandidates.HeaderRow.TableSection = TableRowSection.TableHeader
            'This adds the <tfoot> element.Remove if you don't have a footer row
            grdCandidates.FooterRow.TableSection = TableRowSection.TableFooter
        End If

    End Sub

    Protected Sub btnPanelInterview_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPanelInterview.Click
        ClearBtnSelection()

        grdCandidates.DataSource = ReqProcessData.fnGetPanelIntCan()
        grdCandidates.DataBind()
        btnPanelInterview.Font.Bold = True
        btnPanelInterview.ForeColor = Color.DarkOrange
        IsPanelIntBtnPressed = True
        pnlInterviewerReview.Enabled = True

        If grdCandidates.Rows.Count > 0 Then
            'This replaces <td> with <th> and adds the scope attribute
            grdCandidates.UseAccessibleHeader = True
            'This will add the <thead> and <tbody> elements
            grdCandidates.HeaderRow.TableSection = TableRowSection.TableHeader
            'This adds the <tfoot> element.Remove if you don't have a footer row
            grdCandidates.FooterRow.TableSection = TableRowSection.TableFooter
        End If

    End Sub

    Protected Sub btnPool_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPool.Click
        ClearBtnSelection()

        btnPool.Font.Bold = True
        btnPool.ForeColor = Color.DarkOrange
        IsPoolBtnPressed = True
        pnlSearchParameter.Enabled = True

        If grdCandidates.Rows.Count > 0 Then
            'This replaces <td> with <th> and adds the scope attribute
            grdCandidates.UseAccessibleHeader = True
            'This will add the <thead> and <tbody> elements
            grdCandidates.HeaderRow.TableSection = TableRowSection.TableHeader
            'This adds the <tfoot> element.Remove if you don't have a footer row
            grdCandidates.FooterRow.TableSection = TableRowSection.TableFooter
        End If

    End Sub

    Protected Sub btnSearchCandidatePool_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearchCandidatePool.Click
        SearchPOOL()
    End Sub

    Protected Sub SearchPOOL()

        'If drpRecTypeList.SelectedValue = "N\A" Then
        '    MessageBox("Select Suitable Recruitment Type.")
        '    Exit Sub
        'End If

        'If drpBranchList.SelectedValue = "N\A" Then
        '    MessageBox("Select Suitable Branch.")
        '    Exit Sub
        'End If
        Dim RecTypeList As String = ""
        Dim SuitableRegion As String = ""
        Dim BranchIDList As String = ""

        If drpRecTypeList.SelectedIndex = -1 Then
            RecTypeList = "N\A"
        Else
            RecTypeList = drpRecTypeList.SelectedValue
        End If

        If drpRegion.SelectedIndex = -1 Then
            SuitableRegion = "N\A"
        Else
            SuitableRegion = drpRegion.SelectedValue
        End If

        For Each Itm As ListItem In drpBranchList.Items
            If Itm.Selected = True Then
                BranchIDList += Itm.Value + ","
            End If
        Next

        If BranchIDList <> "" Then
            BranchIDList = BranchIDList.Remove(Len(BranchIDList) - 1, 1)
        Else
            BranchIDList = "N\A"
        End If

        grdCandidates.DataSource = ReqProcessData.fnFindCanPoolNew(RecTypeList, SuitableRegion, BranchIDList)
        grdCandidates.DataBind()

        lblSupply.Text = grdCandidates.Rows.Count.ToString()
        lblDemand.Text = ResReqData.fnGetResourceReqByType(drpRecTypeList.SelectedValue).ToString()

        If grdCandidates.Rows.Count > 0 Then
            'This replaces <td> with <th> and adds the scope attribute
            grdCandidates.UseAccessibleHeader = True
            'This will add the <thead> and <tbody> elements
            grdCandidates.HeaderRow.TableSection = TableRowSection.TableHeader
            'This adds the <tfoot> element.Remove if you don't have a footer row
            grdCandidates.FooterRow.TableSection = TableRowSection.TableFooter
        End If

    End Sub

    Protected Sub btnOffer_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOffer.Click
        ClearBtnSelection()

        grdCandidates.DataSource = ReqProcessData.fnGetShortListedCandidateNew()
        grdCandidates.DataBind()

        btnOffer.Font.Bold = True
        btnOffer.ForeColor = Color.DarkOrange
        IsOfferBtnPressed = True
        pnlHRUseOnly.Enabled = True
        btnAccept.ValidationGroup = "HRAssessment"
        drpOfferLetterFormat.Visible = True
        drpAppointLetterFormat.Visible = True

        If grdCandidates.Rows.Count > 0 Then
            'This replaces <td> with <th> and adds the scope attribute
            grdCandidates.UseAccessibleHeader = True
            'This will add the <thead> and <tbody> elements
            grdCandidates.HeaderRow.TableSection = TableRowSection.TableHeader
            'This adds the <tfoot> element.Remove if you don't have a footer row
            grdCandidates.FooterRow.TableSection = TableRowSection.TableFooter
        End If

    End Sub

    Protected Sub SendMail(ByVal CandidateName As String, ByVal FileName As String, ByVal Email As String, ByVal AdditionalEmail As String, ByVal Str As String, ByVal ResponseStr As String)
        Try
            Dim sb As StringBuilder = New StringBuilder()
            Dim mail As New Net.Mail.MailMessage()
            mail.Bcc.Add("Debayan@unitedfinance.com.bd")
            mail.Bcc.Add("mbrashid@unitedfinance.com.bd")
            mail.CC.Add("sadiqur@unitedfinance.com.bd")
            mail.From = New MailAddress("mbrashid@unitedfinance.com.bd")
            mail.To.Add(Email)

            If AdditionalEmail <> "" Then
                mail.To.Add(AdditionalEmail)
            End If

            mail.Subject = "United Finance : Recruitment Service (Offer Letter)"
            Dim at As Attachment = New Attachment(Server.MapPath("~/Attachments/LeaveFile/") + FileName)
            mail.Attachments.Add(at)
            sb.Append("<html><head></head><body><table border=0> <tr><td><b>")
            sb.Append("Dear " + CandidateName + ",")
            sb.Append("</b></td></tr>")
            sb.Append("<tr><td></td></tr>")
            sb.Append("<tr><td>Thank you for your interest in United Finance Limited. We would like to offer you a position in our company. Please find the attached offer and go through the conditions provided underneath the salary details. If you have any query regarding the salary, please contact me through a reply to this email or call me directly through the company telephone number provided below. " + Str + "</br></td></tr>")
            sb.Append("<tr><td></td></tr>")
            sb.Append("<tr><td>If you agree to the offer please send your consent as a reply to this email and kindly inform about any notice period you may have to provide your current employer (if any). You are kindly requested to provide your response within the next " + ResponseStr + " days.</br></br></td></tr>")
            sb.Append("<tr><td>Regards,</td></tr>")
            sb.Append("<tr><td>Human Resource</td></tr>")
            sb.Append("<tr><td>United Finance</td></tr>")
            sb.Append("<tr><td>Tel:16354, Ext:1022</td></tr>")
            sb.Append("</body></html>")
            mail.Body = sb.ToString()
            mail.IsBodyHtml = True
            Dim smtp As New SmtpClient("192.168.1.242", 25)
            smtp.Send(mail)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub OfferEmployment()

        If drpRecommendedDepartment.SelectedValue = "N\A" Then
            MessageBox("Select A Valid Department First.")
            Exit Sub
        End If

        If drpRecommendedLocation.SelectedValue = "N\A" Then
            MessageBox("Select A Valid Branch First.")
            Exit Sub
        End If

        If drpRecommendedPosition.SelectedValue = "N\A" Then
            MessageBox("Select A Valid Designation First.")
            Exit Sub
        End If

        Dim lblCandidateID As New Label()
        lblCandidateID = grdCandidates.SelectedRow.FindControl("lblCandidateID")

        Dim RecruitmentPropo As New clsRecruitmentProposal()

        RecruitmentPropo.IntCandidateID = "N\A"
        RecruitmentPropo.CandidateID = lblCandidateID.Text
        RecruitmentPropo.CircularID = "CIR-00000002"
        RecruitmentPropo.DepartmentID = drpRecommendedDepartment.SelectedValue
        RecruitmentPropo.ULCBranchID = drpRecommendedLocation.SelectedValue
        RecruitmentPropo.DesignationID = drpRecommendedPosition.SelectedValue
        RecruitmentPropo.EmployeeTypeID = drpEmployeeType.SelectedValue
        RecruitmentPropo.Salary = Convert.ToDouble(txtSalary.Text)
        RecruitmentPropo.ExpectedJoiningDate = Convert.ToDateTime(txtExpectedJoiningDate.Text)
        RecruitmentPropo.EffectiveFrom = Convert.ToDateTime(txtEffectiveDate.Text)
        If txtEffectiveTo.Text = "" Then
            RecruitmentPropo.EffectiveTo = "1/1/1900"
        Else
            RecruitmentPropo.EffectiveTo = Convert.ToDateTime(txtEffectiveTo.Text)
        End If
        RecruitmentPropo.Period = Convert.ToInt32(txtPeriodInMonths.Text)
        RecruitmentPropo.Remarks = txtRemarks.Text
        RecruitmentPropo.EntryBy = Session("LoginUserID")

        Try
            Dim myReport As New ReportDocument()
            Dim folder As String
            Dim f As String
            Dim repName As String

            f = "~/Reports/"

            folder = Server.MapPath(f)
            repName = folder & drpAppointLetterFormat.SelectedValue.ToString()
            myReport.Load(repName)

            Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]
            Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionStringRpt").ConnectionString
            Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

            retArr = conStr.Split(";")
            serverArr = retArr(0).Split("=")
            dbArr = retArr(1).Split("=")
            usrArr = retArr(2).Split("=")
            pwdArr = retArr(3).Split("=")

            serverName = serverArr(1)
            uid = usrArr(1)
            pwd = pwdArr(1)
            dbName = dbArr(1)

            myReport.SetDatabaseLogon(uid, pwd, serverName, dbName)

            Dim parameters As CrystalDecisions.Web.Parameter = New CrystalDecisions.Web.Parameter()

            myReport.SetParameterValue("@IntCandidateID", RecruitmentPropo.IntCandidateID)
            myReport.SetParameterValue("@CandidateID", RecruitmentPropo.CandidateID)
            myReport.SetParameterValue("@CircularID", RecruitmentPropo.CircularID)
            myReport.SetParameterValue("@DepartmentID", RecruitmentPropo.DepartmentID)
            myReport.SetParameterValue("@ULCBranchID", RecruitmentPropo.ULCBranchID)
            myReport.SetParameterValue("@DesignationID", RecruitmentPropo.DesignationID)
            myReport.SetParameterValue("@EmployeeTypeID", RecruitmentPropo.EmployeeTypeID)
            myReport.SetParameterValue("@Salary", RecruitmentPropo.Salary)
            myReport.SetParameterValue("@ExpectedJoiningDate", RecruitmentPropo.ExpectedJoiningDate)
            myReport.SetParameterValue("@EffectiveFrom", RecruitmentPropo.EffectiveFrom)
            myReport.SetParameterValue("@EffectiveTo", RecruitmentPropo.EffectiveTo)
            myReport.SetParameterValue("@Period", RecruitmentPropo.Period)
            myReport.SetParameterValue("@Remarks", RecruitmentPropo.Remarks)
            myReport.SetParameterValue("@EntryBy", RecruitmentPropo.EntryBy)
            myReport.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, True, "ExportedReport")
            MessageBox("Prposal Submitted.")
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub btnJoining_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnJoining.Click
        ClearBtnSelection()

        grdCandidates.DataSource = ReqProcessData.fnRecProGetJoiningPending()
        grdCandidates.DataBind()

        btnJoining.Font.Bold = True
        btnJoining.ForeColor = Color.DarkOrange
        IsJoiningBtnPressed = True
        pnlHRUseOnly.Enabled = True
        drpAppointLetterFormat.Visible = True

        If grdCandidates.Rows.Count > 0 Then
            'This replaces <td> with <th> and adds the scope attribute
            grdCandidates.UseAccessibleHeader = True
            'This will add the <thead> and <tbody> elements
            grdCandidates.HeaderRow.TableSection = TableRowSection.TableHeader
            'This adds the <tfoot> element.Remove if you don't have a footer row
            grdCandidates.FooterRow.TableSection = TableRowSection.TableFooter
        End If

    End Sub

#End Region

#Region " External Test Score "

    Protected Sub GetTestScores(ByVal ExamTakerID As String)
        grdTestScoreOfUsers.DataSource = ExtTestScoreData.fnGetExtTestScoreByExamTaker(ExamTakerID)
        grdTestScoreOfUsers.DataBind()
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        Dim lblCandidateID As New Label
        lblCandidateID = grdCandidates.SelectedRow.FindControl("lblCandidateID")

        Dim TestScore As New clsExternalTestScore()
        Dim folder As String = ""
        Dim Title As String = ""
        Dim DocExt As String = ""
        Dim DocFullName As String = ""
        Dim DocPrefix As String = ""
        Dim FileSize As Integer = 0
        Dim DocFileName As String = ""

        Try
            If Convert.ToDouble(txtObtainedMarks.Text) > Convert.ToDouble(txtMarksOutOf.Text) Then
                MessageBox("Obtained Marks Can't Be Greater.")
                Exit Sub
            End If

            TestScore.ExternalTestTypeID = drpTestType.SelectedValue
            TestScore.ExamTakerID = lblCandidateID.Text
            TestScore.ExamTakerType = "Candidate"
            TestScore.ExamTakenOn = Convert.ToDateTime(txtExamTakenOn.Text)
            TestScore.MarksObtained = Convert.ToDouble(txtObtainedMarks.Text)
            TestScore.MarksOutOf = Convert.ToDouble(txtMarksOutOf.Text)
            TestScore.Grading = drpGrading.SelectedValue
            TestScore.Remarks = txtRemarks.Text

            If flupAttachment.HasFile Then

                folder = Server.MapPath("~/Attachments/")

                FileSize = flupAttachment.PostedFile.ContentLength()
                If FileSize > 4194304 Then
                    MessageBox("File size should be within 4MB")
                    Exit Sub
                End If

                DocPrefix = Title.Replace(" ", "")

                DocExt = System.IO.Path.GetExtension(flupAttachment.FileName)
                DocFileName = "Ext_Test_" & DateTime.Now.ToString("ddMMyyHHmmss") & DocExt
                DocFullName = folder & DocFileName
                flupAttachment.SaveAs(DocFullName)
                TestScore.Attachment = DocFileName
            Else
                TestScore.Attachment = ""
            End If

            TestScore.EntryBy = Session("LoginUserID")

            Dim check As Integer = ExtTestScoreData.fnInsertExternalTestScore(TestScore)

            If check = 1 Then
                MessageBox("Inserted Successfully.")
                ClearExtTestScoreForm()
                GetTestScores(lblCandidateID.Text)
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub ClearExtTestScoreForm()
        txtExamTakenOn.Text = ""
        txtMarksOutOf.Text = ""
        txtObtainedMarks.Text = ""
        txtRemarks.Text = ""
        drpGrading.SelectedIndex = -1
        drpTestType.SelectedIndex = -1
    End Sub

#End Region

    Protected Sub btnExIntAssInterview_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExIntAssInterview.Click
        IsAssignInterview = True
        btnExIntAssInterview.Enabled = False
    End Sub

    Protected Sub AssignInterviewNew()
        Dim lblCandidateID As New Label
        lblCandidateID = grdCandidates.SelectedRow.FindControl("lblCandidateID")

        Dim IntCandidateInfo As New clsInterviewCandidate()

        IntCandidateInfo.Participant = lblCandidateID.Text
        IntCandidateInfo.CircularID = "CIR-00000002"
        IntCandidateInfo.IntTeamID = drpIntTeamList.SelectedValue
        IntCandidateInfo.InterviewDate = Convert.ToDateTime(txtExInterviewDate.Text & " " & drpECOEIHour.SelectedValue & ":" & drpECOEIMin.SelectedValue & ":00" & " " & drpECOEIAMPM.SelectedValue)
        IntCandidateInfo.ULCBranchID = drpULCBranchListIntAss.SelectedValue
        IntCandidateInfo.EntryBy = Session("LoginUserID")

        Dim check As Integer = IntCandidateData.fnAssignCandidateToIntPanelNew(IntCandidateInfo)

        If check = 1 Then
            MessageBox("Interview Assigned Successfully.")
            ClearInterviewAssForm()
            ReloadCandidates()
        Else
            MessageBox("Error Generated.")
        End If
    End Sub

    Protected Sub ClearInterviewAssForm()
        txtExInterviewDate.Text = ""
        drpIntTeamList.SelectedIndex = -1
        drpULCBranchListIntAss.SelectedIndex = -1
        btnExIntAssInterview.Enabled = True
        IsAssignInterview = False
    End Sub

    Protected Function FormatTable() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("RecruitmentTypeID", System.Type.GetType("System.String"))
        Return dt
    End Function

#Region " Candidate Tagging "

    Protected Sub GetCanTagInfo(ByVal CandidateID As String)
        '' Get Already Tagged Data
        Dim dt As DataTable = FormatTable()
        dt = CanTagData.fnGetRecTagByCandidate(CandidateID).Tables(0)

        For Each dr As DataRow In dt.Rows
            Dim indx As Integer = chkLstSuitForRecruitment.Items.IndexOf(chkLstSuitForRecruitment.Items.FindByValue(dr.Item("RecruitmentTypeID")))
            If indx <> -1 Then
                chkLstSuitForRecruitment.Items(indx).Selected = True
                chkLstSuitForRecruitment.Items(indx).Attributes.Add("style", "font:bold")
            End If
        Next

        ' Get Tagged Regions
        Dim dtRegions As DataTable = FormatTableRegions()

        dtRegions = RegionData.fnGetRegionTagByCandidate(CandidateID).Tables(0)

        For Each dr As DataRow In dtRegions.Rows
            Dim indx As Integer = chkRegions.Items.IndexOf(chkRegions.Items.FindByValue(dr.Item("RegionID")))
            If indx <> -1 Then
                chkRegions.Items(indx).Selected = True
                chkRegions.Items(indx).Attributes.Add("style", "font:bold")
            End If
        Next

        ' Get Tagged Branches
        Dim dtBranch As DataTable = FormatTableBranch()

        dtBranch = SuiBranchData.fnGetBranchTagByCandidate(CandidateID).Tables(0)

        For Each dr As DataRow In dtBranch.Rows
            Dim indx As Integer = chkBranch.Items.IndexOf(chkBranch.Items.FindByValue(dr.Item("ULCBranchID")))
            If indx <> -1 Then
                chkBranch.Items(indx).Selected = True
                chkBranch.Items(indx).Attributes.Add("style", "font:bold")
            End If
        Next
    End Sub

    Protected Sub UpdateRegion(ByVal CandidateID As String, ByVal EntryBy As String)
        Dim SuitableForRegion As String = ""
        Dim SuitableForBranch As String = ""
        '' Suitable For Region
        For Each itm As ListItem In chkRegions.Items
            If itm.Selected = True Then
                SuitableForRegion = SuitableForRegion & itm.Value & ","
            End If
        Next

        If SuitableForRegion <> "" Then
            SuitableForRegion = SuitableForRegion.Remove(Len(SuitableForRegion) - 1, 1)
            Dim check As Integer = SuiBranchData.fnInsertBulkSuitableRegion(CandidateID, SuitableForRegion, EntryBy)
            If check <> 1 Then
                MessageBox("Error Occured.")
            End If
        End If



        '' Suitable For Region

        '' Suitable For Branch 
        For Each itm As ListItem In chkBranch.Items
            If itm.Selected = True Then
                SuitableForBranch = SuitableForBranch & itm.Value & ","
            End If
        Next

        If SuitableForBranch <> "" Then
            SuitableForBranch = SuitableForBranch.Remove(Len(SuitableForBranch) - 1, 1)
            Dim check As Integer = SuiBranchData.fnInsertBulkSuitableBranch(CandidateID, SuitableForBranch, EntryBy)
            If check <> 1 Then
                MessageBox("Error Occured.")
            Else
                MessageBox("Suitable Region Updated.")
            End If
        End If
        '' Suitable For Branch
    End Sub

    Protected Sub ClearRegions()
        For Each itm As ListItem In chkBranch.Items
            If itm.Selected = True Then
                itm.Selected = False
            End If
        Next

        For Each itm As ListItem In chkRegions.Items
            If itm.Selected = True Then
                itm.Selected = False
            End If
        Next
    End Sub

    Protected Sub imgBtnUpdateRecType_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBtnUpdateRecType.Click
        Dim lblCandidateID As New Label()
        Dim TagList As String = ""
        Dim CanTag As New clsCanRecruitmentTag()

        lblCandidateID = grdCandidates.SelectedRow.FindControl("lblCandidateID")

        For Each itm As ListItem In chkLstSuitForRecruitment.Items
            If itm.Selected = True Then
                TagList += itm.Value + ","
            End If
        Next

        If Trim(TagList) = "" Then
            MessageBox("Select Suitable Category For The Candidate")
            Exit Sub
        End If

        TagList = TagList.Remove(Len(TagList) - 1, 1)

        CanTag.TagList = TagList
        CanTag.CandidateID = lblCandidateID.Text
        CanTag.EntryBy = Session("LoginUserID")

        Dim Result As clsResult = CanTagData.fnInsertBulkTag(CanTag)

        If Result.Success = True Then

        End If

        MessageBox(Result.Message)


    End Sub

    Protected Sub imgBtnUpdateLocation_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBtnUpdateLocation.Click
        Dim lblCandidateID As New Label()
        lblCandidateID = grdCandidates.SelectedRow.FindControl("lblCandidateID")
        UpdateRegion(lblCandidateID.Text, Session("LoginUserID"))
        'ClearRegions()
    End Sub

    Protected Sub imgBtnUpdateIntManQues_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBtnUpdateIntManQues.Click
        Dim AskedManQuestions As String = ""
        Dim chkIntManQuestion As New CheckBox()
        Dim lblIntManQuestionID, lblCandidateID As New Label()
        Dim txtQuesAnswer As New TextBox()

        Try
            lblCandidateID = grdCandidates.SelectedRow.FindControl("lblCandidateID")

            For Each rw As GridViewRow In grdMandatoryIntQuestions.Rows
                chkIntManQuestion = rw.FindControl("chkIntManQuestion")
                If chkIntManQuestion.Checked = True Then
                    lblIntManQuestionID = rw.FindControl("lblIntManQuestionID")
                    txtQuesAnswer = rw.FindControl("txtQuesAnswer")
                    AskedManQuestions = AskedManQuestions & lblIntManQuestionID.Text & "~" & txtQuesAnswer.Text & "~|"
                End If
            Next

            Dim check As Integer = ReqProcessData.fnInsertBulkIntQuesReply(lblCandidateID.Text, AskedManQuestions, Session("LoginUserID"))
            If check = 1 Then
                MessageBox("Updated Successfully.")
            Else
                MessageBox("Error Found While Question Reply.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

#End Region

    Protected Sub btnAccept_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAccept.Click

        If grdCandidates.SelectedIndex = -1 Then
            MessageBox("Select A Candidate First.")
            Exit Sub
        End If

        Try
            Dim lblCandidateID As New Label()
            lblCandidateID = grdCandidates.SelectedRow.FindControl("lblCandidateID")

            If IsAssignInterview = True And IsPreliIntBtnPressed <> True And IsPanelIntBtnPressed <> True Then
                AssignInterviewNew()
            End If

            If IsAssignExam = True Then
                AssignExam()
            End If

            If IsPoolBtnPressed = True Then
                AcceptCandidate(lblCandidateID.Text)
                ClearFormForOnlyPool()
            End If

            If IsOfferBtnPressed = True Then
                PrintOfferLetter()
                OfferEmployment()
                ClearOfferForm()
                ReloadCandidates()
            End If

            If IsPreliIntBtnPressed = True Then

                If grdInterviewerReview.Rows.Count = 0 Then
                    MessageBox("Interviewer Review Required.")
                    Exit Sub
                End If

                If IsAssignInterview = False Then
                    MessageBox("Assign Another Interview First.")
                    Exit Sub
                End If

                ' Section For Interview Assessment
                PrimaryIntAssessment()
                AssignInterviewNew()
                ClearIntForm()
            End If

            If IsPanelIntBtnPressed = True Then
                If grdInterviewerReview.Rows.Count = 0 Then
                    MessageBox("Interviewer Review Required.")
                    Exit Sub
                End If

                ' Section For Interview Assessment
                PrimaryIntAssessment()

                ' Change Status To POOL
                Dim check As Integer = ReqProcessData.fnChangeCanStatusToPOOL(lblCandidateID.Text, Session("LoginUserID"))

                If check = 1 Then
                    MessageBox("Candidate Assigned To POOL")
                    ReloadCandidates()
                Else
                    MessageBox("Error Occured.")
                End If

            End If

            If IsJoiningBtnPressed = True Then
                CreateEmployment()
            End If

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Public Sub PrimaryIntAssessment()

        Dim lblID As New Label
        lblID = grdCandidates.SelectedRow.FindControl("lblID")
        Dim IntCanAssessmentInfo As New clsIntCandidateAssessment()
        Dim dtIntReview = Session("dtIntReview")
        Dim IntReview As String = ""

        For Each rw As DataRow In dtIntReview.Rows
            IntReview = IntReview & rw.Item("EmployeeID") & "~" & rw.Item("Grade") & "~" & rw.Item("Remarks") & "~|"
        Next

        IntCanAssessmentInfo.IntCandidateID = lblID.Text
        IntCanAssessmentInfo.IntTakerID = Session("UniqueUserID")
        IntCanAssessmentInfo.Grading = CalculateAverageGrading()
        IntCanAssessmentInfo.IntReviewList = IntReview
        IntCanAssessmentInfo.EntryBy = Session("LoginUserID")

        Dim check As Integer = IntCanAssessmentData.fnPrimaryIntAssessmentNew(IntCanAssessmentInfo)

        If check = 1 Then
            ClearIntForm()
        End If

    End Sub

    Protected Function CalculateAverageGrading() As Double
        Dim Grading As Double = 0
        Dim lblGrade As System.Web.UI.WebControls.Label
        For Each rw As GridViewRow In grdInterviewerReview.Rows
            lblGrade = rw.FindControl("lblGrade")
            Grading += Convert.ToInt32(lblGrade.Text)
        Next
        Return Grading / grdInterviewerReview.Rows.Count
    End Function

    Protected Sub btnRejectCandidate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRejectCandidate.Click

        If grdCandidates.SelectedIndex = -1 Then
            MessageBox("Select A Candidate First.")
            Exit Sub
        End If

        Try
            If IsPreliIntBtnPressed = True Or IsPanelIntBtnPressed = True Then

                If grdInterviewerReview.Rows.Count = 0 Then
                    MessageBox("Interviewer Review Required.")
                    Exit Sub
                End If
                ' Section For Interview Assessment
                PrimaryIntAssessment()
            End If

            Dim lblCandidateID As New Label()
            lblCandidateID = grdCandidates.SelectedRow.FindControl("lblCandidateID")

            Dim res As clsResult = AppliedJobData.fnChangeCanStatus(lblCandidateID.Text, txtRejectionRemarks.Text, Session("LoginUserID"))

            If res.Success Then
                SearchPOOL()
            End If
            MessageBox(res.Message)
            ReloadCandidates()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub AcceptCandidate(ByVal CandidateID As String)
        Dim SrtlstCan As New clsShortListedCan()
        SrtlstCan.CandidateID = CandidateID
        SrtlstCan.RecruitmentTypeID = drpRecTypeList.SelectedValue
        SrtlstCan.ULCBranchID = drpBranchList.SelectedValue
        SrtlstCan.EntryBy = Session("LoginUserID")

        Dim res As clsResult = SrtLstCanData.fnInsertSrtListedCandidate(SrtlstCan)

        If res.Success = True Then
            SearchPOOL()
        End If

        MessageBox(res.Message)
    End Sub

    Protected Sub lblDemand_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lblDemand.Click
        Try
            Dim lbl As New System.Web.UI.WebControls.Label()
            lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                       & "openWindow('../frmResReqByRecType.aspx?RecruitmentTypeID=" & drpRecTypeList.SelectedValue & "','Popup',900,600);</script>"
            Page.Controls.Add(lbl)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub txtEffectiveDate_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtEffectiveDate.TextChanged
        If txtPeriodInMonths.Text <> "" Then
            txtEffectiveTo.Text = Convert.ToDateTime(txtEffectiveDate.Text).AddMonths(Convert.ToInt32(txtPeriodInMonths.Text))
        End If
    End Sub

    Protected Sub btnCalculateSal_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCalculateSal.Click
        Try
            grdSalCalc.DataSource = ReqProcessData.fnCalculateOfferSalary(Convert.ToDouble(txtSalary.Text), drpRecommendedPosition.SelectedValue, Convert.ToDouble(txtLocalConveyance.Text), drpOfferLetterFormat.SelectedItem.Text)
            grdSalCalc.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Dim TotalSal As Double = 0

    Protected Sub grdSalCalc_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdSalCalc.RowDataBound
        Try
            Dim lblAmount As New Label
            If e.Row.RowType = DataControlRowType.DataRow Then
                lblAmount = e.Row.FindControl("lblAmount")
                TotalSal += Convert.ToDouble(lblAmount.Text)
            End If

            If e.Row.RowType = DataControlRowType.Footer Then
                e.Row.Cells(0).Text = "Total:"
                e.Row.Cells(1).Text = String.Format("{0:#,##.##}", TotalSal.ToString())
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub btnSendTempOffer_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSendTempOffer.Click
        PrintTempOfferLetter()
        ClearOfferForm()
        ReloadCandidates()
    End Sub

    Protected Sub PrintOfferLetter()

        If drpRecommendedDepartment.SelectedValue = "N\A" Then
            MessageBox("Select A Valid Department First.")
            Exit Sub
        End If

        If drpRecommendedLocation.SelectedValue = "N\A" Then
            MessageBox("Select A Valid Branch First.")
            Exit Sub
        End If

        If drpRecommendedPosition.SelectedValue = "N\A" Then
            MessageBox("Select A Valid Designation First.")
            Exit Sub
        End If

        Dim lblCandidateID As New Label()
        lblCandidateID = grdCandidates.SelectedRow.FindControl("lblCandidateID")

        Dim CanInfo As CanBasicInfo = CanBasicData.fnGetCandidateDetailsViewForRecuitment(lblCandidateID.Text)
        Dim RecruitmentPropo As New clsRecruitmentProposal()

        RecruitmentPropo.IntCandidateID = "N\A"
        RecruitmentPropo.CandidateID = lblCandidateID.Text
        RecruitmentPropo.CircularID = "CIR-00000002"
        RecruitmentPropo.DepartmentID = drpRecommendedDepartment.SelectedValue
        RecruitmentPropo.ULCBranchID = drpRecommendedLocation.SelectedValue
        RecruitmentPropo.DesignationID = drpRecommendedPosition.SelectedValue
        RecruitmentPropo.EmployeeTypeID = drpEmployeeType.SelectedValue
        RecruitmentPropo.Salary = Convert.ToDouble(txtSalary.Text)
        RecruitmentPropo.LocalConveyance = Convert.ToDouble(txtLocalConveyance.Text)
        RecruitmentPropo.ExpectedJoiningDate = Convert.ToDateTime(txtExpectedJoiningDate.Text)
        RecruitmentPropo.EffectiveFrom = Convert.ToDateTime(txtEffectiveDate.Text)
        If txtEffectiveTo.Text = "" Then
            RecruitmentPropo.EffectiveTo = "1/1/1900"
        Else
            RecruitmentPropo.EffectiveTo = Convert.ToDateTime(txtEffectiveTo.Text)
        End If
        RecruitmentPropo.Period = Convert.ToInt32(txtPeriodInMonths.Text)
        RecruitmentPropo.Remarks = txtRemarks.Text
        RecruitmentPropo.EntryBy = Session("LoginUserID")

        Try
            Dim myReport As New ReportDocument()
            Dim folder As String
            Dim f As String
            Dim repName As String
            Dim ExportFileName As String = ""
            Dim InValidEmailStr As String = ""

            f = "~/Reports/"

            folder = Server.MapPath(f)
            repName = folder & drpOfferLetterFormat.SelectedValue.ToString() & ".rpt"
            myReport.Load(repName)

            Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]
            Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionStringRpt").ConnectionString
            Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

            retArr = conStr.Split(";")
            serverArr = retArr(0).Split("=")
            dbArr = retArr(1).Split("=")
            usrArr = retArr(2).Split("=")
            pwdArr = retArr(3).Split("=")

            serverName = serverArr(1)
            uid = usrArr(1)
            pwd = pwdArr(1)
            dbName = dbArr(1)

            myReport.SetDatabaseLogon(uid, pwd, serverName, dbName)

            Dim parameters As CrystalDecisions.Web.Parameter = New CrystalDecisions.Web.Parameter()

            myReport.SetParameterValue("@IntCandidateID", RecruitmentPropo.IntCandidateID)
            myReport.SetParameterValue("@CandidateID", RecruitmentPropo.CandidateID)
            myReport.SetParameterValue("@CircularID", RecruitmentPropo.CircularID)
            myReport.SetParameterValue("@DepartmentID", RecruitmentPropo.DepartmentID)
            myReport.SetParameterValue("@ULCBranchID", RecruitmentPropo.ULCBranchID)
            myReport.SetParameterValue("@DesignationID", RecruitmentPropo.DesignationID)
            myReport.SetParameterValue("@EmployeeTypeID", RecruitmentPropo.EmployeeTypeID)
            myReport.SetParameterValue("@Salary", RecruitmentPropo.Salary)
            myReport.SetParameterValue("@ExpectedJoiningDate", RecruitmentPropo.ExpectedJoiningDate)
            myReport.SetParameterValue("@EffectiveFrom", RecruitmentPropo.EffectiveFrom)
            myReport.SetParameterValue("@EffectiveTo", RecruitmentPropo.EffectiveTo)
            myReport.SetParameterValue("@Period", RecruitmentPropo.Period)
            myReport.SetParameterValue("@LocalConveyance", RecruitmentPropo.LocalConveyance)
            myReport.SetParameterValue("@Remarks", RecruitmentPropo.Remarks)
            myReport.SetParameterValue("@EntryBy", RecruitmentPropo.EntryBy)

            ExportFileName = RecruitmentPropo.CandidateID.ToString() + "-" + Now.Ticks.ToString() + ".pdf"
            Dim CrDiskFileDestinationOptions As New DiskFileDestinationOptions
            CrDiskFileDestinationOptions.DiskFileName = Server.MapPath("~/Attachments/LeaveFile/") + ExportFileName

            Dim CrExportOptions As New ExportOptions()
            Dim CrFormatTypeOptions As New PdfRtfWordFormatOptions()
            CrExportOptions = myReport.ExportOptions
            CrExportOptions.ExportDestinationType = ExportDestinationType.DiskFile
            CrExportOptions.ExportFormatType = ExportFormatType.PortableDocFormat
            CrExportOptions.DestinationOptions = CrDiskFileDestinationOptions
            CrExportOptions.FormatOptions = CrFormatTypeOptions
            myReport.Export(CrExportOptions)

            'Dim Str As String = ""
            'Dim ResponseStr As String = ""
            'If drpOfferLetterFormat.SelectedItem.Text = "Probation" Then
            '    ResponseStr = "3"
            '    Str = "This is a Permanent position (under Probation of " & txtPeriodInMonths.Text.ToString() & " months)."
            '    SendMail(CanInfo.Name, ExportFileName, CanInfo.EMail, CanInfo.AltEMail, Str, ResponseStr)
            'ElseIf drpOfferLetterFormat.SelectedItem.Text = "Confirmed" Then
            '    ResponseStr = "3"
            '    Str = "This is a Permanent position."
            '    SendMail(CanInfo.Name, ExportFileName, CanInfo.EMail, CanInfo.AltEMail, Str, ResponseStr)
            'ElseIf drpOfferLetterFormat.SelectedItem.Text = "Contractual" Then
            '    ResponseStr = "5"
            '    Str = "This is a contractual position (under contract of " & txtPeriodInMonths.Text.ToString() & " months)."
            '    SendMail(CanInfo.Name, ExportFileName, CanInfo.EMail, CanInfo.AltEMail, Str, ResponseStr)
            'Else
            '    ResponseStr = "3"
            '    Str = "This is a Permanent position (under Probation of " & txtPeriodInMonths.Text.ToString() & " months)."
            '    SendMail(CanInfo.Name, ExportFileName, CanInfo.EMail, CanInfo.AltEMail, Str, ResponseStr)
            'End If

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub PrintTempOfferLetter()

        If drpRecommendedDepartment.SelectedValue = "N\A" Then
            MessageBox("Select A Valid Department First.")
            Exit Sub
        End If

        If drpRecommendedLocation.SelectedValue = "N\A" Then
            MessageBox("Select A Valid Branch First.")
            Exit Sub
        End If

        If drpRecommendedPosition.SelectedValue = "N\A" Then
            MessageBox("Select A Valid Designation First.")
            Exit Sub
        End If

        Dim lblCandidateID As New Label()
        lblCandidateID = grdCandidates.SelectedRow.FindControl("lblCandidateID")

        Dim CanInfo As CanBasicInfo = CanBasicData.fnGetCandidateDetailsViewForRecuitment(lblCandidateID.Text)
        Dim RecruitmentPropo As New clsRecruitmentProposal()

        RecruitmentPropo.IntCandidateID = "N\A"
        RecruitmentPropo.CandidateID = lblCandidateID.Text
        RecruitmentPropo.CircularID = "CIR-00000002"
        RecruitmentPropo.DepartmentID = drpRecommendedDepartment.SelectedValue
        RecruitmentPropo.ULCBranchID = drpRecommendedLocation.SelectedValue
        RecruitmentPropo.DesignationID = drpRecommendedPosition.SelectedValue
        RecruitmentPropo.EmployeeTypeID = drpEmployeeType.SelectedValue
        RecruitmentPropo.Salary = Convert.ToDouble(txtSalary.Text)
        RecruitmentPropo.LocalConveyance = Convert.ToDouble(txtLocalConveyance.Text)
        RecruitmentPropo.ExpectedJoiningDate = Convert.ToDateTime(txtExpectedJoiningDate.Text)
        RecruitmentPropo.EffectiveFrom = Convert.ToDateTime(txtEffectiveDate.Text)
        If txtEffectiveTo.Text = "" Then
            RecruitmentPropo.EffectiveTo = "1/1/1900"
        Else
            RecruitmentPropo.EffectiveTo = Convert.ToDateTime(txtEffectiveTo.Text)
        End If
        RecruitmentPropo.Period = Convert.ToInt32(txtPeriodInMonths.Text)
        RecruitmentPropo.Remarks = txtRemarks.Text
        RecruitmentPropo.EntryBy = Session("LoginUserID")

        Try
            Dim myReport As New ReportDocument()
            Dim folder As String
            Dim f As String
            Dim repName As String
            Dim ExportFileName As String = ""
            Dim InValidEmailStr As String = ""

            f = "~/Reports/"

            folder = Server.MapPath(f)
            repName = folder & drpOfferLetterFormat.SelectedValue.ToString() & "Temp.rpt"
            myReport.Load(repName)

            Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]
            Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionStringRpt").ConnectionString
            Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

            retArr = conStr.Split(";")
            serverArr = retArr(0).Split("=")
            dbArr = retArr(1).Split("=")
            usrArr = retArr(2).Split("=")
            pwdArr = retArr(3).Split("=")

            serverName = serverArr(1)
            uid = usrArr(1)
            pwd = pwdArr(1)
            dbName = dbArr(1)

            myReport.SetDatabaseLogon(uid, pwd, serverName, dbName)

            Dim parameters As CrystalDecisions.Web.Parameter = New CrystalDecisions.Web.Parameter()

            myReport.SetParameterValue("@IntCandidateID", RecruitmentPropo.IntCandidateID)
            myReport.SetParameterValue("@CandidateID", RecruitmentPropo.CandidateID)
            myReport.SetParameterValue("@CircularID", RecruitmentPropo.CircularID)
            myReport.SetParameterValue("@DepartmentID", RecruitmentPropo.DepartmentID)
            myReport.SetParameterValue("@ULCBranchID", RecruitmentPropo.ULCBranchID)
            myReport.SetParameterValue("@DesignationID", RecruitmentPropo.DesignationID)
            myReport.SetParameterValue("@EmployeeTypeID", RecruitmentPropo.EmployeeTypeID)
            myReport.SetParameterValue("@Salary", RecruitmentPropo.Salary)
            myReport.SetParameterValue("@ExpectedJoiningDate", RecruitmentPropo.ExpectedJoiningDate)
            myReport.SetParameterValue("@EffectiveFrom", RecruitmentPropo.EffectiveFrom)
            myReport.SetParameterValue("@EffectiveTo", RecruitmentPropo.EffectiveTo)
            myReport.SetParameterValue("@Period", RecruitmentPropo.Period)
            myReport.SetParameterValue("@LocalConveyance", RecruitmentPropo.LocalConveyance)
            myReport.SetParameterValue("@Remarks", RecruitmentPropo.Remarks)
            myReport.SetParameterValue("@EntryBy", RecruitmentPropo.EntryBy)

            ExportFileName = RecruitmentPropo.CandidateID.ToString() + "-" + Now.Ticks.ToString() + ".pdf"
            Dim CrDiskFileDestinationOptions As New DiskFileDestinationOptions
            CrDiskFileDestinationOptions.DiskFileName = Server.MapPath("~/Attachments/LeaveFile/") + ExportFileName

            Dim CrExportOptions As New ExportOptions()
            Dim CrFormatTypeOptions As New PdfRtfWordFormatOptions()
            CrExportOptions = myReport.ExportOptions
            CrExportOptions.ExportDestinationType = ExportDestinationType.DiskFile
            CrExportOptions.ExportFormatType = ExportFormatType.PortableDocFormat
            CrExportOptions.DestinationOptions = CrDiskFileDestinationOptions
            CrExportOptions.FormatOptions = CrFormatTypeOptions
            myReport.Export(CrExportOptions)

            Dim Str As String = ""
            Dim ResponseStr As String = ""
            If drpOfferLetterFormat.SelectedItem.Text = "Probation" Then
                ResponseStr = "3"
                Str = "This is a Permanent position (under Probation of " & txtPeriodInMonths.Text.ToString() & " months)."
                SendMail(CanInfo.Name, ExportFileName, CanInfo.EMail, CanInfo.AltEMail, Str, ResponseStr)
            ElseIf drpOfferLetterFormat.SelectedItem.Text = "Confirmed" Then
                ResponseStr = "3"
                Str = "This is a Permanent position."
                SendMail(CanInfo.Name, ExportFileName, CanInfo.EMail, CanInfo.AltEMail, Str, ResponseStr)
            ElseIf drpOfferLetterFormat.SelectedItem.Text = "Contractual" Then
                ResponseStr = "5"
                Str = "This is a contractual position (under contract of " & txtPeriodInMonths.Text.ToString() & " months)."
                SendMail(CanInfo.Name, ExportFileName, CanInfo.EMail, CanInfo.AltEMail, Str, ResponseStr)
            Else
                ResponseStr = "3"
                Str = "This is a Permanent position (under Probation of " & txtPeriodInMonths.Text.ToString() & " months)."
                SendMail(CanInfo.Name, ExportFileName, CanInfo.EMail, CanInfo.AltEMail, Str, ResponseStr)
            End If

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub txtExpectedJoiningDate_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtExpectedJoiningDate.TextChanged
        Try
            txtEffectiveDate.Text = txtExpectedJoiningDate.Text
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub txtPeriodInMonths_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtPeriodInMonths.TextChanged
        Try
            If Trim(txtExpectedJoiningDate.Text) = "" Then
                MessageBox("Expected Joining Date Required.")
                Exit Sub
            End If

            txtEffectiveTo.Text = DateAdd(DateInterval.Month, Convert.ToInt32(txtPeriodInMonths.Text), Convert.ToDateTime(txtEffectiveDate.Text))
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

#Region " Resource Request "

    Protected Sub btnSendResourceRequest_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSendResourceRequest.Click
        Dim ResReq As New clsResourceReq()

        Try
            If drpResourceTypeList.SelectedValue = "N\A" Then
                MessageBox("Select Resource Type.")
                Exit Sub
            End If

            If drpULCBranch.SelectedValue = "N\A" Then
                MessageBox("Select Branch")
                Exit Sub
            End If

            ResReq.RecruitmentTypeID = drpResourceTypeList.SelectedValue
            ResReq.ULCBranchID = drpULCBranch.SelectedValue
            ResReq.ReqNoOfResource = Convert.ToInt32(drpNoOfResource.SelectedValue)
            ResReq.Remarks = txtRemarks.Text
            ResReq.SubmittedBy = Session("UniqueUserID")
            ResReq.EntryBy = Session("LoginUserID")

            Dim MailProp As clsMailProperty = ResReqData.fnInsertResourceReq(ResReq)

            If Not MailProp Is Nothing Then
                MessageBox("Submitted Successfully")
                SendResourceReqMail(MailProp)
                ClearResourceForm()
                GetResourceReqStatus()
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub SendResourceReqMail(ByVal MailProp As clsMailProperty)
        Dim mail As New Net.Mail.MailMessage()
        Try
            mail.From = New MailAddress(MailProp.MailFrom)
            mail.To.Add(MailProp.MailTo)
            mail.CC.Add(MailProp.MailCC)
            mail.Bcc.Add(MailProp.MailBCC)
            mail.Subject = MailProp.MailSubject
            mail.Body = MailProp.MailBody
            mail.IsBodyHtml = True
            Dim smtp As New SmtpClient("192.168.1.232", 25)
            smtp.Send(mail)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ClearResourceForm()
        txtResReqRemarks.Text = ""
        drpNoOfResource.SelectedIndex = -1
        drpResourceTypeList.SelectedIndex = -1
        drpULCBranch.SelectedIndex = -1

        If grdPendingResourceRequests.Rows.Count > 0 Then
            grdPendingResourceRequests.SelectedIndex = -1
        End If

    End Sub

    Protected Sub grdResReqStatus_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdResReqStatus.RowDataBound
        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(2).Text = "Total:"
            e.Row.Cells(3).Text = grdResReqStatus.Rows.Count.ToString()
        End If
    End Sub

    Protected Sub grdPendingResourceRequests_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdPendingResourceRequests.RowDataBound
        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(2).Text = "Total:"
            e.Row.Cells(3).Text = grdPendingResourceRequests.Rows.Count.ToString()
        End If
    End Sub

    Protected Sub btnResReqRejectionModal_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnResReqRejectionModal.Click
        Dim ResReq As New clsResourceReq()
        Dim lblResourceReqID As New Label
        Try
            If grdPendingResourceRequests.SelectedIndex = -1 Then
                MessageBox("Select A Request.")
            End If

            lblResourceReqID = grdPendingResourceRequests.SelectedRow.FindControl("lblResourceReqID")
            ResReq.ResourceReqID = lblResourceReqID.Text
            ResReq.ProvidedBy = Session("UniqueUserID")
            ResReq.ProviderRemarks = txtResReqRejectionRemarks.Text
            ResReq.ProvidedOn = Now.Date
            ResReq.ProvidedNoOfResource = "0"
            ResReq.ProvidedStatus = "Rejected"

            Dim Check As Integer = ResReqData.fnProvideSupportForResReq(ResReq)

            If Check = 1 Then
                ClearResourceForm()
                GetResourceReq()
                GetResourceReqStatus()
                MessageBox("Process Done.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnAcceptResReq_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAcceptResReq.Click
        Dim ResReq As New clsResourceReq()
        Dim lblResourceReqID As New Label

        Try
            If grdPendingResourceRequests.SelectedIndex = -1 Then
                MessageBox("Select A Request.")
            End If

            lblResourceReqID = grdPendingResourceRequests.SelectedRow.FindControl("lblResourceReqID")

            ResReq.ResourceReqID = lblResourceReqID.Text
            ResReq.ApproverID = Session("UniqueUserID")

            Dim Check As Integer = ResReqData.fnAcceptResourceReq(ResReq)

            If Check = 1 Then
                ClearResourceForm()
                GetResourceReq()
                GetResourceReqStatus()
                MessageBox("Accepted.")
            End If

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

#End Region

    Protected Sub btnMnuIntReschedule_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMnuIntReschedule.Click
        pnlModalIntReschedule.Visible = True
    End Sub
End Class
