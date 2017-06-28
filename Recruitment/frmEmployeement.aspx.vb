Imports System.Data
Imports System.Net.Mail

Partial Class Recruitment_frmEmployeement
    Inherits System.Web.UI.Page

    Dim IntGradeData As New clsIntGradeDataAccess()
    Dim DeptData As New clsDepartmentDataAccess()
    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()
    Dim CVSelectionData As New clsCVSelectionDataAccess()
    Dim RecruitmentPropoData As New clsRecruitmentProposalDataAccess()
    Dim Employementdata As New clsEmployementdataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            ShowULCBranch()
            ShowDepertment()
            ShowDesignationOfficial()
            GetNotJoinedCandidateList()
            GetFinallySelectedCandidateList()
        End If
    End Sub

    Protected Sub GetNotJoinedCandidateList()
        grdNotJoinedCandidates.DataSource = CVSelectionData.fnGetCandidatesNotJoined()
        grdNotJoinedCandidates.DataBind()
    End Sub

    Protected Sub GetFinallySelectedCandidateList()
        grdInterviewCompletedCandidates.DataSource = CVSelectionData.fnSelectedCandidatesForEmployment()
        grdInterviewCompletedCandidates.DataBind()
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

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnCancelSelection_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelSelection.Click
        ClearForm()
    End Sub

    Protected Sub ClearForm()
        drpRecommendedDepartment.SelectedIndex = -1
        drpRecommendedLocation.SelectedIndex = -1
        drpRecommendedPosition.SelectedIndex = -1

        txtExpectedJoiningDate.Text = ""
        txtRemarks.Text = ""
    End Sub

    Protected Sub grdInterviewCompletedCandidates_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdInterviewCompletedCandidates.RowDataBound
        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(5).Text = "Total:"
            e.Row.Cells(6).Text = grdInterviewCompletedCandidates.Rows.Count.ToString()
        End If
    End Sub

    Protected Sub grdInterviewCompletedCandidates_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdInterviewCompletedCandidates.SelectedIndexChanged
        Dim lblProposalID As New System.Web.UI.WebControls.Label()
        Dim lblCircularID As New System.Web.UI.WebControls.Label()
        Dim lblCandidateID As New System.Web.UI.WebControls.Label()

        lblProposalID = grdInterviewCompletedCandidates.SelectedRow.FindControl("lblProposalID")
        lblCandidateID = grdInterviewCompletedCandidates.SelectedRow.FindControl("lblCandidateID")
        lblCircularID = grdInterviewCompletedCandidates.SelectedRow.FindControl("lblCircularID")

        Dim Employement As New clsEmployement()
        Employement.ProposalID = lblProposalID.Text
        Try
            Employement = Employementdata.fnGetEmploymentHistoryByID(Employement.ProposalID)

            drpRecommendedDepartment.SelectedValue = Employement.DepartmentID
            drpRecommendedLocation.SelectedValue = Employement.LocationID
            drpRecommendedPosition.SelectedValue = Employement.PositionID
            drpEmployeeType.SelectedValue = Employement.EmployeeTypeID
            txtExpectedJoiningDate.Text = Employement.ExpectedJoiningDate
            txtRemarks.Text = Employement.Remarks

            Session("RecCandidateID") = lblCandidateID.Text
            Session("RecCircularID") = lblCircularID.Text
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
      
    End Sub

    Protected Sub btnEmployeement_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEmployeement.Click
        Dim lblCandidateID, lblProposalID, lblReviewCandidateName As New Label()
        Dim CandidateID As String = ""
        Dim ProposalID As String = ""
        Dim JoiningDate As DateTime
        Dim EntryBy As String
        Dim EmployeeType As String

        If grdInterviewCompletedCandidates.SelectedIndex = -1 Then
            MessageBox("Select A Candidate First.")
            Exit Sub
        End If

        lblCandidateID = grdInterviewCompletedCandidates.SelectedRow.FindControl("lblCandidateID")
        lblReviewCandidateName = grdInterviewCompletedCandidates.SelectedRow.FindControl("lblReviewCandidateName")
        lblProposalID = grdInterviewCompletedCandidates.SelectedRow.FindControl("lblProposalID")

        CandidateID = lblCandidateID.Text
        ProposalID = lblProposalID.Text
        JoiningDate = Convert.ToDateTime(txtJoiningDate.Text)
        EntryBy = Session("LoginUserID")
        EmployeeType = drpEmployeeType.SelectedValue


        Dim Check As Integer = Employementdata.fnInsertEmployment(CandidateID, EmployeeType, JoiningDate, EntryBy, ProposalID)

        If Check = 1 Then
            MessageBox("Inserted Successfully")
            GetFinallySelectedCandidateList()
            If chkSendMailToAdmin.Checked = True Then
                SendJoiningMailToAdmin(lblReviewCandidateName.Text)
            End If

            If chkSendMailToICT.Checked = True Then
                SendJoiningMailToICT(lblReviewCandidateName.Text)
            End If

            ClearForm()
        Else
            MessageBox("Error Found.")
        End If
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
            Dim smtp As New SmtpClient("192.168.1.232", 25)
            smtp.Send(mail)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Public Property dir() As SortDirection
        Get
            If ViewState("dirState") Is Nothing Then
                ViewState("dirState") = SortDirection.Ascending
            End If
            Return DirectCast(ViewState("dirState"), SortDirection)
        End Get
        Set(ByVal value As SortDirection)
            ViewState("dirState") = value
        End Set
    End Property

    Protected Sub grdInterviewCompletedCandidates_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles grdInterviewCompletedCandidates.Sorting
        Dim sortingDirection As String = String.Empty
        If Dir() = SortDirection.Ascending Then
            Dir = SortDirection.Descending
            sortingDirection = "Desc"
        Else
            Dir = SortDirection.Ascending
            sortingDirection = "Asc"
        End If

        Dim sortedView As New DataView(CVSelectionData.fnSelectedCandidatesForEmployment().Tables(0))
        sortedView.Sort = Convert.ToString(e.SortExpression) & " " & sortingDirection
        grdInterviewCompletedCandidates.DataSource = sortedView
        grdInterviewCompletedCandidates.DataBind()
    End Sub

    Protected Sub btnNotJoined_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNotJoined.Click
        If grdInterviewCompletedCandidates.SelectedIndex = -1 Then
            MessageBox("Select A Candidate First.")
            Exit Sub
        End If

        Dim lblCandidateID As Label
        lblCandidateID = grdInterviewCompletedCandidates.SelectedRow.FindControl("lblCandidateID")
        Dim Check As Integer = RecruitmentPropoData.fnNotJoinedCandidate(lblCandidateID.Text)

        If Check = 1 Then
            MessageBox("Not Joined Shown.")
            GetNotJoinedCandidateList()
            GetFinallySelectedCandidateList()
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub grdNotJoinedCandidates_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdNotJoinedCandidates.RowDataBound
        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(5).Text = "Total:"
            e.Row.Cells(6).Text = grdNotJoinedCandidates.Rows.Count.ToString()
        End If
    End Sub

    Protected Sub grdNotJoinedCandidates_Sorting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSortEventArgs) Handles grdNotJoinedCandidates.Sorting
        Dim sortingDirection As String = String.Empty
        If dir() = SortDirection.Ascending Then
            dir = SortDirection.Descending
            sortingDirection = "Desc"
        Else
            dir = SortDirection.Ascending
            sortingDirection = "Asc"
        End If

        Dim sortedView As New DataView(CVSelectionData.fnGetCandidatesNotJoined().Tables(0))
        sortedView.Sort = Convert.ToString(e.SortExpression) & " " & sortingDirection
        grdNotJoinedCandidates.DataSource = sortedView
        grdNotJoinedCandidates.DataBind()
    End Sub

    Protected Sub grdNotJoinedCandidates_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdNotJoinedCandidates.SelectedIndexChanged

        Dim lblProposalIDNotJoined As New Label

        lblProposalIDNotJoined = grdNotJoinedCandidates.SelectedRow.FindControl("lblProposalIDNotJoined")

        Dim Check As Integer = RecruitmentPropoData.fnReverseNotJoinedProposal(lblProposalIDNotJoined.Text)

        If Check = 1 Then
            MessageBox("Reversed Successfully.")
            grdNotJoinedCandidates.SelectedIndex = -1
            GetNotJoinedCandidateList()
            GetFinallySelectedCandidateList()
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub btnRemoveAppointment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRemoveAppointment.Click
        Dim lblProposalID As New Label

        lblProposalID = grdInterviewCompletedCandidates.SelectedRow.FindControl("lblProposalID")

        Dim Check As Integer = RecruitmentPropoData.fnRemoveRecruitmentProposal(lblProposalID.Text)

        If Check = 1 Then
            MessageBox("Removed Successfully.")
            GetNotJoinedCandidateList()
            GetFinallySelectedCandidateList()
        Else
            MessageBox("Error Found.")
        End If
    End Sub

End Class
