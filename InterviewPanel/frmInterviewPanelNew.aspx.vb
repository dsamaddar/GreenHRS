Imports System
Imports System.Data
Imports System.Drawing

Partial Class InterviewPanel_frmInterviewPanelNew
    Inherits System.Web.UI.Page

    Dim DeptData As New clsDepartmentDataAccess()
    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()
    Dim IntManQuesData As New clsIntManQuestionDataAccess()
    Dim IntGradeData As New clsIntGradeDataAccess()
    Dim IntCandidateData As New clsInterviewCandidateDataAccess()
    Dim dataCanBasicInfo As New clsCanBasicDataAccess()
    Dim IntCanAssessmentData As New clsIntCandidateAssessmentDataAccess()
    Dim IntPanelData As New clsInterviewPanelDataAccess()
    Dim IntTeamData As New clsInterviewTeamDataAccess()
    Dim RecTypeData As New clsRecruitmentTypeDataAccess()
    Dim RegionData As New clsRegionDataAccess()
    Dim CanTagData As New clsCanRecruitmentTagDataAccess()
    Dim AppliedJobData As New clsAppliedJobDataAccess()
    Dim ULCBranchData As New clsULCBranchDataAccess()
    Dim SuiBranchData As New clsSuitableBranchDataAccess()

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

    Protected Sub GetRecTypeList()
        chkLstSuitForRecruitment.DataTextField = "RecruitmentType"
        chkLstSuitForRecruitment.DataValueField = "RecruitmentTypeID"
        chkLstSuitForRecruitment.DataSource = RecTypeData.fnGetRecTypeList()
        chkLstSuitForRecruitment.DataBind()
    End Sub

    Protected Sub ClearIntAssessmentForm()

        Session("CandidateID") = ""

        ' Claring Assess Info.
        grdInterviewCandidate.SelectedIndex = -1
        txtObservation.Text = ""
        txtMarksObtained.Text = "0"
        drpApplicantGrade.SelectedIndex = -1
        drpRecommendedDepartment.SelectedIndex = -1
        drpRecommendedLocation.SelectedIndex = -1
        drpRecommendedPosition.SelectedIndex = -1

        Dim chkIntManQuestion As New System.Web.UI.WebControls.CheckBox()
        For Each rw As GridViewRow In grdMandatoryIntQuestions.Rows
            chkIntManQuestion = rw.FindControl("chkIntManQuestion")
            If chkIntManQuestion.Checked = True Then
                chkIntManQuestion.Checked = False
            End If
        Next

        grdInterviewCandidate.SelectedIndex = -1

        btnMakeAssessment.Enabled = False
    End Sub

    Protected Sub ShowULCBranch()
        drpRecommendedLocation.DataTextField = "ULCBranchName"
        drpRecommendedLocation.DataValueField = "ULCBranchID"
        drpRecommendedLocation.DataSource = EmployeeInfoData.fnGetULCBranch()
        drpRecommendedLocation.DataBind()

        Dim A As New ListItem()
        A.Text = "N\A"
        A.Value = "N\A"
        drpRecommendedLocation.Items.Insert(0, A)
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            GetActiveIntManQuestions()
            DisablingQuesReplyOption()
            GetRecTypeList()
            ShowIntCanGradeList()
            ShowULCBranch()
            ShowDepertment()
            ShowDesignationOfficial()
            GetAvailableIntCandidats()
            GetRegions()
            btnMakeAssessment.Enabled = False
            btnSelectRecommLocation.Enabled = False
            chkAvailableAnyWhere.Checked = True

            txtMarksObtained.Text = String.Format("{0:N2}", 0)
            txtMarksOutOf.Text = String.Format("{0:N2}", 0)

            Session("dtIntReview") = ""
            Dim dtIntReview As DataTable = New DataTable()
            dtIntReview = FormatInterviewerReview()
            Session("dtIntReview") = dtIntReview

            dtActual = FormatBranch()
        End If
    End Sub

    Protected Sub GetAvailableIntCandidats()
        Dim EmployeeID As String = Session("UniqueUserID")
        grdInterviewCandidate.DataSource = IntCandidateData.fnGetIntCandidatesByIntTakerSec(EmployeeID)
        grdInterviewCandidate.DataBind()
    End Sub

    Protected Sub ShowIntCanGradeList()
        drpApplicantGrade.DataTextField = "GradeName"
        drpApplicantGrade.DataValueField = "IntGradeID"
        drpApplicantGrade.DataSource = IntGradeData.fnShowIntGradeList()
        drpApplicantGrade.DataBind()
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub GetActiveIntManQuestions()
        grdMandatoryIntQuestions.DataSource = IntManQuesData.fnShowActiveIntManQuestion(True)
        grdMandatoryIntQuestions.DataBind()
    End Sub

    Protected Sub grdInterviewCandidate_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdInterviewCandidate.RowDataBound
        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(2).Text = "Total:"
            e.Row.Cells(3).Text = grdInterviewCandidate.Rows.Count.ToString()
        End If
    End Sub

    Protected Function FormatTable() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("RecruitmentTypeID", System.Type.GetType("System.String"))
        Return dt
    End Function

    Protected Sub grdInterviewCandidate_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdInterviewCandidate.SelectedIndexChanged

        Dim lblCandidateID, lblIntTeamID As New System.Web.UI.WebControls.Label()
        lblCandidateID = grdInterviewCandidate.SelectedRow.FindControl("lblCandidateID")
        lblIntTeamID = grdInterviewCandidate.SelectedRow.FindControl("lblIntTeamID")

        DisablingQuesReplyOption()

        Session("CandidateID") = lblCandidateID.Text
        Dim CandidateID As String

        CandidateID = Session("CandidateID")
        GetIntTeamMemberList()
        btnMakeAssessment.Enabled = True

        '' Get Already Tagged Data
        Dim dt As DataTable = FormatTable()
        lblCandidateID = grdInterviewCandidate.SelectedRow.FindControl("lblCandidateID")
        dt = CanTagData.fnGetRecTagByCandidate(lblCandidateID.Text).Tables(0)

        For Each dr As DataRow In dt.Rows
            Dim indx As Integer = chkLstSuitForRecruitment.Items.IndexOf(chkLstSuitForRecruitment.Items.FindByValue(dr.Item("RecruitmentTypeID")))
            If indx <> -1 Then
                chkLstSuitForRecruitment.Items(indx).Selected = True
                chkLstSuitForRecruitment.Items(indx).Attributes.Add("style", "font:bold")
            End If
        Next

        '' Get Asked Question Previously
        Dim chkIntManQuestion As New CheckBox
        Dim lblIntManQuestionID As New Label()
        Dim txtQuesAnswer As New TextBox
        Dim Response As String = ""
        For Each rw As GridViewRow In grdMandatoryIntQuestions.Rows
            lblIntManQuestionID = rw.FindControl("lblIntManQuestionID")
            txtQuesAnswer = rw.FindControl("txtQuesAnswer")
            chkIntManQuestion = rw.FindControl("chkIntManQuestion")
            Response = IntManQuesData.fnChqGetIntQuesReply(lblCandidateID.Text, lblIntManQuestionID.Text)
            If Response <> "" Then
                chkIntManQuestion.Checked = True
                txtQuesAnswer.Enabled = True
            End If
            txtQuesAnswer.Text = Response
            Response = ""
        Next

        ClearRegions()
        GetRegions()
        FetchSelection(CandidateID)
    End Sub

    Protected Sub FetchSelection(ByVal CandidateID As String)
        ' Get Tagged Regions
        Dim IsRegionExists As Boolean = False
        Dim dtRegions As DataTable = FormatTableRegions()
        dtRegions = RegionData.fnGetRegionTagByCandidate(CandidateID).Tables(0)

        For Each dr As DataRow In dtRegions.Rows
            Dim indx As Integer = chkRegions.Items.IndexOf(chkRegions.Items.FindByValue(dr.Item("RegionID")))
            If indx <> -1 Then
                chkRegions.Items(indx).Selected = True
                chkRegions.Items(indx).Attributes.Add("style", "font:bold")
                IsRegionExists = True
            End If
        Next

        Dim dtFetch As New DataTable
        dtFetch = FormatBranch()
        dtActual = FormatBranch()
        For Each itm As ListItem In chkRegions.Items
            If itm.Selected = True Then
                dtFetch = RegionData.fnGetBranchListByRegion(itm.Value).Tables(0)

                For Each rw As DataRow In dtFetch.Rows

                    Dim dr As DataRow
                    dr = dtActual.NewRow()
                    dr.Item("ULCBranchID") = rw.Item("ULCBranchID")
                    dr.Item("ULCBranchName") = rw.Item("ULCBranchName")

                    dtActual.Rows.Add(dr)
                    dtActual.AcceptChanges()

                Next
            End If
        Next

        LoadBranchByRegions(dtActual)

        ' Get Tagged Branches
        Dim IsBranchExists As Boolean = False
        Dim dtBranch As DataTable = FormatTableBranch()

        dtBranch = SuiBranchData.fnGetBranchTagByCandidate(CandidateID).Tables(0)

        For Each dr As DataRow In dtBranch.Rows
            Dim indx As Integer = chkBranch.Items.IndexOf(chkBranch.Items.FindByValue(dr.Item("ULCBranchID")))
            If indx <> -1 Then
                chkBranch.Items(indx).Selected = True
                chkBranch.Items(indx).Attributes.Add("style", "font:bold")
                IsBranchExists = True
            End If
        Next

        If IsRegionExists = True Or IsBranchExists = True Then
            chkAvailableAnyWhere.Checked = False
            btnSelectRecommLocation.Enabled = True
        Else
            chkAvailableAnyWhere.Checked = True
            btnSelectRecommLocation.Enabled = False
        End If

    End Sub

    Protected Function FormatActualAttendee() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("EmployeeID", System.Type.GetType("System.String"))
        dt.Columns.Add("EmployeeName", System.Type.GetType("System.String"))
        Return dt
    End Function

    Protected Sub chkAvailableAnyWhere_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkAvailableAnyWhere.CheckedChanged
        If chkAvailableAnyWhere.Checked = True Then
            btnSelectRecommLocation.Enabled = False
            ClearRegions()
        Else
            btnSelectRecommLocation.Enabled = True
        End If
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

    Protected Function FormatBranch() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("ULCBranchID", System.Type.GetType("System.String"))
        dt.Columns.Add("ULCBranchName", System.Type.GetType("System.String"))
        Return dt
    End Function

    Protected Function FormatInterviewerReview() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("EmployeeID", System.Type.GetType("System.String"))
        dt.Columns.Add("Interviewer", System.Type.GetType("System.String"))
        dt.Columns.Add("Grade", System.Type.GetType("System.Decimal"))
        dt.Columns.Add("Remarks", System.Type.GetType("System.String"))
        Return dt
    End Function

    Protected Sub ClearNewInterviewPanel()
        Session("dtIntReview") = ""
        grdInterviewerReview.DataSource = ""
        grdInterviewerReview.DataBind()

        For Each itm As ListItem In chkRegions.Items
            If itm.Selected = True Then
                itm.Selected = False
            End If
        Next

        For Each itm As ListItem In chkBranch.Items
            If itm.Selected = True Then
                itm.Selected = False
            End If
        Next

        chkBranch.DataSource = ""
        chkBranch.DataBind()

        drpInterviewer.SelectedIndex = -1
        drpGrading.SelectedIndex = -1
        txtInterviewerRemarks.Text = ""

        chkAvailableAnyWhere.Checked = True
        btnSelectRecommLocation.Enabled = False

    End Sub

    Dim dtActual As New DataTable
    Public TotalGrade As Double = 0

    Protected Sub chkRegions_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkRegions.SelectedIndexChanged
        Dim dtFetch As New DataTable
        dtFetch = FormatBranch()
        dtActual = FormatBranch()
        Dim MyColors() As Color = {Color.Black, Color.Blue, Color.Red, Color.Green, Color.Aqua}
        Dim i As Integer = 0
        Try
            For Each itm As ListItem In chkRegions.Items
                If itm.Selected = True Then
                    dtFetch = RegionData.fnGetBranchListByRegion(itm.Value).Tables(0)

                    For Each rw As DataRow In dtFetch.Rows

                        Dim dr As DataRow
                        dr = dtActual.NewRow()
                        dr.Item("ULCBranchID") = rw.Item("ULCBranchID")
                        dr.Item("ULCBranchName") = rw.Item("ULCBranchName")

                        dtActual.Rows.Add(dr)
                        dtActual.AcceptChanges()

                    Next
                End If
            Next

            LoadBranchByRegions(dtActual)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub LoadBranchByRegions(ByVal dt As DataTable)
        chkBranch.DataTextField = "ULCBranchName"
        chkBranch.DataValueField = "ULCBranchID"
        chkBranch.DataSource = dt
        chkBranch.DataBind()
    End Sub

    Protected Sub GetRegions()
        chkRegions.DataTextField = "Region"
        chkRegions.DataValueField = "RegionID"
        chkRegions.DataSource = RegionData.fnGetRegionList()
        chkRegions.DataBind()
    End Sub

    Protected Sub GetIntTeamMemberList()
        Dim panel As New clsInterviewPanel
        Dim lblIntTeamID As New Label
        lblIntTeamID = grdInterviewCandidate.SelectedRow.FindControl("lblIntTeamID")
        panel.IntTeamID = lblIntTeamID.Text
        drpInterviewer.DataTextField = "EmployeeName"
        drpInterviewer.DataValueField = "EmployeeID"
        drpInterviewer.DataSource = IntPanelData.fnGetIntPanelwiseMemberInfo(panel)
        drpInterviewer.DataBind()
    End Sub

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

    Protected Function CalculateAverageGrading() As Double
        Dim Grading As Double = 0
        Dim lblGrade As System.Web.UI.WebControls.Label
        For Each rw As GridViewRow In grdInterviewerReview.Rows
            lblGrade = rw.FindControl("lblGrade")
            Grading += Convert.ToInt32(lblGrade.Text)
        Next
        Return Grading / grdInterviewerReview.Rows.Count
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

    Protected Sub ClearSuitableFor()
        For Each chk As ListItem In chkLstSuitForRecruitment.Items
            If chk.Selected = True Then
                chk.Selected = False
            End If
        Next
    End Sub

    Protected Sub btnCancelSelection_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelSelection.Click
        'ClearIntAssessmentForm()
        Response.Redirect("frmInterviewPanelNew.aspx")
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

    Protected Sub btnMakeAssessment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMakeAssessment.Click

        Dim lblIntManQuestionID As New Label()
        Dim chkIntManQuestion As New CheckBox()
        Dim txtQuesAnswer As New TextBox()
        Dim AskedManQuestions As String = ""
        Dim IntCanAssessmentInfo As New clsIntCandidateAssessment()
        Dim EmployeeID As String = Session("UniqueUserID")
        Dim AttendeeList As String = ""

        Dim lblIntCandidateID As New System.Web.UI.WebControls.Label()
        lblIntCandidateID = grdInterviewCandidate.SelectedRow.FindControl("lblIntCandidateID")

        IntCanAssessmentInfo.IntCandidateID = lblIntCandidateID.Text
        IntCanAssessmentInfo.IntGradeID = "N\A" 'drpApplicantGrade.SelectedValue
        IntCanAssessmentInfo.DesignationID = drpRecommendedPosition.SelectedValue
        IntCanAssessmentInfo.DepartmentID = drpRecommendedDepartment.SelectedValue
        IntCanAssessmentInfo.ULCBranchID = drpRecommendedLocation.SelectedValue
        IntCanAssessmentInfo.Observations = txtObservation.Text
        IntCanAssessmentInfo.MarksObtained = Convert.ToDouble(txtMarksObtained.Text)
        IntCanAssessmentInfo.MarksOutOf = Convert.ToDouble(txtMarksOutOf.Text)
        IntCanAssessmentInfo.IntTakerID = EmployeeID
        IntCanAssessmentInfo.Grading = CalculateAverageGrading()

        For Each rw As GridViewRow In grdMandatoryIntQuestions.Rows
            chkIntManQuestion = rw.FindControl("chkIntManQuestion")
            If chkIntManQuestion.Checked = True Then
                lblIntManQuestionID = rw.FindControl("lblIntManQuestionID")
                txtQuesAnswer = rw.FindControl("txtQuesAnswer")
                AskedManQuestions = AskedManQuestions & lblIntManQuestionID.Text & "~" & txtQuesAnswer.Text & "~|"
            End If
        Next

        If AskedManQuestions <> "" Then
            IntCanAssessmentInfo.IntManQuestionIDList = AskedManQuestions
        Else
            IntCanAssessmentInfo.IntManQuestionIDList = ""
        End If

        If AttendeeList <> "" Then
            IntCanAssessmentInfo.AttendeeList = AttendeeList
        Else
            IntCanAssessmentInfo.AttendeeList = ""
        End If

        '' Suitable For Recruitment
        Dim isSuitableForRec As Boolean = False
        Dim SuitableForRec As String = ""
        For Each itm As ListItem In chkLstSuitForRecruitment.Items
            If itm.Selected = True Then
                isSuitableForRec = True
                SuitableForRec = SuitableForRec & itm.Value & ","
            End If
        Next

        If SuitableForRec <> "" Then
            SuitableForRec = SuitableForRec.Remove(Len(SuitableForRec) - 1, 1)
        End If

        IntCanAssessmentInfo.SuitableForRec = SuitableForRec
        '' Suitable For Recruitment

        Dim SuitableForRegion As String = ""
        Dim SuitableForBranch As String = ""
        If chkAvailableAnyWhere.Checked = True Then
            IntCanAssessmentInfo.IsSuitableAnyWhere = True
            IntCanAssessmentInfo.SuitableForRegion = ""
            IntCanAssessmentInfo.SuitableForBranch = ""

        Else
            IntCanAssessmentInfo.IsSuitableAnyWhere = False
            '' Suitable For Region
            For Each itm As ListItem In chkRegions.Items
                If itm.Selected = True Then
                    SuitableForRegion = SuitableForRegion & itm.Value & ","
                End If
            Next

            If SuitableForRegion <> "" Then
                SuitableForRegion = SuitableForRegion.Remove(Len(SuitableForRegion) - 1, 1)
            End If
            IntCanAssessmentInfo.SuitableForRegion = SuitableForRegion
            '' Suitable For Region

            '' Suitable For Branch 
            For Each itm As ListItem In chkBranch.Items
                If itm.Selected = True Then
                    SuitableForBranch = SuitableForBranch & itm.Value & ","
                End If
            Next

            If SuitableForBranch <> "" Then
                SuitableForBranch = SuitableForBranch.Remove(Len(SuitableForBranch) - 1, 1)
            End If
            IntCanAssessmentInfo.SuitableForBranch = SuitableForBranch
            '' Suitable For Branch
        End If

        Dim dtIntReview = Session("dtIntReview")
        Dim IntReview As String = ""
        For Each rw As DataRow In dtIntReview.Rows
            IntReview = IntReview & rw.Item("EmployeeID") & "~" & rw.Item("Grade") & "~" & rw.Item("Remarks") & "~|"
        Next

        IntCanAssessmentInfo.IntReviewList = IntReview
        IntCanAssessmentInfo.EntryBy = Session("LoginUserID")

        If chkAvailableAnyWhere.Checked = False Then
            If SuitableForRegion = "" Or SuitableForBranch = "" Then
                MessageBox("Select Suitable Region & Branch For The Candidate")
                Exit Sub
            End If
        End If

        Dim check As Integer = IntCanAssessmentData.fnInsertIntPOOL(IntCanAssessmentInfo)

        If check = 1 Then
            MessageBox("Assessment Done.")
            ClearIntAssessmentForm()
            GetAvailableIntCandidats()
            ClearNewInterviewPanel()
            DisablingQuesReplyOption()
            ClearSuitableFor()
            ClearRegions()
        Else
            MessageBox("Error Found While Making Assessment.")
        End If

    End Sub

    Protected Sub btnRejectCandidate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRejectCandidate.Click
        Try

            If grdInterviewCandidate.SelectedIndex = -1 Then
                MessageBox("Select A Candidate First.")
                Exit Sub
            End If

            ''''''''''''''''''''''''''''''''''''''''''''''
            Dim lblIntManQuestionID As New Label()
            Dim chkIntManQuestion As New CheckBox()
            Dim txtQuesAnswer As New TextBox()
            Dim AskedManQuestions As String = ""
            Dim IntCanAssessmentInfo As New clsIntCandidateAssessment()
            Dim EmployeeID As String = Session("UniqueUserID")
            Dim AttendeeList As String = ""

            Dim lblIntCandidateID As New System.Web.UI.WebControls.Label()
            lblIntCandidateID = grdInterviewCandidate.SelectedRow.FindControl("lblIntCandidateID")

            IntCanAssessmentInfo.IntCandidateID = lblIntCandidateID.Text
            IntCanAssessmentInfo.IntGradeID = "N\A" 'drpApplicantGrade.SelectedValue
            IntCanAssessmentInfo.DesignationID = drpRecommendedPosition.SelectedValue
            IntCanAssessmentInfo.DepartmentID = drpRecommendedDepartment.SelectedValue
            IntCanAssessmentInfo.ULCBranchID = drpRecommendedLocation.SelectedValue
            IntCanAssessmentInfo.Observations = txtObservation.Text
            IntCanAssessmentInfo.MarksObtained = Convert.ToDouble(txtMarksObtained.Text)
            IntCanAssessmentInfo.MarksOutOf = Convert.ToDouble(txtMarksOutOf.Text)
            IntCanAssessmentInfo.IntTakerID = EmployeeID
            IntCanAssessmentInfo.Grading = CalculateAverageGrading()

            For Each rw As GridViewRow In grdMandatoryIntQuestions.Rows
                chkIntManQuestion = rw.FindControl("chkIntManQuestion")
                If chkIntManQuestion.Checked = True Then
                    lblIntManQuestionID = rw.FindControl("lblIntManQuestionID")
                    txtQuesAnswer = rw.FindControl("txtQuesAnswer")
                    AskedManQuestions = AskedManQuestions & lblIntManQuestionID.Text & "~" & txtQuesAnswer.Text & "~|"
                End If
            Next

            If AskedManQuestions <> "" Then
                IntCanAssessmentInfo.IntManQuestionIDList = AskedManQuestions
            Else
                IntCanAssessmentInfo.IntManQuestionIDList = ""
            End If

            If AttendeeList <> "" Then
                IntCanAssessmentInfo.AttendeeList = AttendeeList
            Else
                IntCanAssessmentInfo.AttendeeList = ""
            End If

            '' Suitable For Recruitment
            Dim isSuitableForRec As Boolean = False
            Dim SuitableForRec As String = ""
            For Each itm As ListItem In chkLstSuitForRecruitment.Items
                If itm.Selected = True Then
                    isSuitableForRec = True
                    SuitableForRec = SuitableForRec & itm.Value & ","
                End If
            Next

            If SuitableForRec <> "" Then
                SuitableForRec = SuitableForRec.Remove(Len(SuitableForRec) - 1, 1)
            End If

            IntCanAssessmentInfo.SuitableForRec = SuitableForRec
            '' Suitable For Recruitment

            Dim SuitableForRegion As String = ""
            Dim SuitableForBranch As String = ""
            If chkAvailableAnyWhere.Checked = True Then
                IntCanAssessmentInfo.IsSuitableAnyWhere = True
                IntCanAssessmentInfo.SuitableForRegion = ""
                IntCanAssessmentInfo.SuitableForBranch = ""

            Else
                IntCanAssessmentInfo.IsSuitableAnyWhere = False
                '' Suitable For Region
                For Each itm As ListItem In chkRegions.Items
                    If itm.Selected = True Then
                        SuitableForRegion = SuitableForRegion & itm.Value & ","
                    End If
                Next

                If SuitableForRegion <> "" Then
                    SuitableForRegion = SuitableForRegion.Remove(Len(SuitableForRegion) - 1, 1)
                End If
                IntCanAssessmentInfo.SuitableForRegion = SuitableForRegion
                '' Suitable For Region

                '' Suitable For Branch 
                For Each itm As ListItem In chkBranch.Items
                    If itm.Selected = True Then
                        SuitableForBranch = SuitableForBranch & itm.Value & ","
                    End If
                Next

                If SuitableForBranch <> "" Then
                    SuitableForBranch = SuitableForBranch.Remove(Len(SuitableForBranch) - 1, 1)
                End If
                IntCanAssessmentInfo.SuitableForBranch = SuitableForBranch
                '' Suitable For Branch
            End If

            Dim dtIntReview = Session("dtIntReview")
            Dim IntReview As String = ""
            For Each rw As DataRow In dtIntReview.Rows
                IntReview = IntReview & rw.Item("EmployeeID") & "~" & rw.Item("Grade") & "~" & rw.Item("Remarks") & "~|"
            Next

            IntCanAssessmentInfo.IntReviewList = IntReview
            IntCanAssessmentInfo.EntryBy = Session("LoginUserID")

            If chkAvailableAnyWhere.Checked = False Then
                If SuitableForRegion = "" Or SuitableForBranch = "" Then
                    MessageBox("Select Suitable Region & Branch For The Candidate")
                    Exit Sub
                End If
            End If

            Dim check As Integer = IntCanAssessmentData.fnInsertPOOLPanelInterview(IntCanAssessmentInfo)

            If check = 1 Then
                '' Assign Interview 
                Dim lblCandidateID As New Label
                lblCandidateID = grdInterviewCandidate.SelectedRow.FindControl("lblCandidateID")
                Dim res As clsResult = AppliedJobData.fnChangeCanStatus(lblCandidateID.Text, txtRejectionRemarks.Text, Session("LoginUserID"))

                MessageBox(res.Message)
                MessageBox("Primary Assessment Done.")

                ClearIntAssessmentForm()
                GetAvailableIntCandidats()
                ClearNewInterviewPanel()
                DisablingQuesReplyOption()
                ClearSuitableFor()
                ClearRegions()
            Else
                MessageBox("Error Found While Making Assessment.")
            End If
            ''''''''''''''''''''''''''''''''''''''''''''''
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

End Class
