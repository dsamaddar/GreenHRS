
Partial Class Recruitment_frmCandidatePool
    Inherits System.Web.UI.Page

    Dim RecTypeData As New clsRecruitmentTypeDataAccess()
    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()
    Dim RegionData As New clsRegionDataAccess()
    Dim IntCanData As New clsInterviewCandidateDataAccess()
    Dim ResReqData As New clsResourceReqDataAccess()
    Dim SrtLstCanData As New clsShortListedCanDataAccess()
    Dim AppliedJobData As New clsAppliedJobDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowULCBranch()
            GetRecTypeList()
            ShowRegions()
        End If
    End Sub

    Protected Sub ShowRegions()
        drpRegion.DataTextField = "Region"
        drpRegion.DataValueField = "RegionID"
        drpRegion.DataSource = RegionData.fnGetRegionList()
        drpRegion.DataBind()

        Dim A As New ListItem()
        A.Text = "N\A"
        A.Value = "N\A"
        drpRegion.Items.Insert(0, A)

    End Sub

    Protected Sub ShowULCBranch()
        drpBranchList.DataTextField = "ULCBranchName"
        drpBranchList.DataValueField = "ULCBranchID"
        drpBranchList.DataSource = EmployeeInfoData.fnGetULCBranch()
        drpBranchList.DataBind()

        Dim A As New ListItem()
        A.Text = "N\A"
        A.Value = "N\A"
        drpBranchList.Items.Insert(0, A)
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

    Protected Sub btnSearchCandidatePool_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearchCandidatePool.Click
        SearchPOOL()
    End Sub

    Protected Sub SearchPOOL()
        grdShortListedCandidate.DataSource = IntCanData.fnFindCanPool(drpRecTypeList.SelectedValue, drpRegion.SelectedValue, drpBranchList.SelectedValue)
        grdShortListedCandidate.DataBind()

        lblSupply.Text = grdShortListedCandidate.Rows.Count.ToString()
        lblDemand.Text = ResReqData.fnGetResourceReqByType(drpRecTypeList.SelectedValue).ToString()
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Public Shared CandidateID As String = ""

    Protected Sub grdShortListedCandidate_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdShortListedCandidate.SelectedIndexChanged
        Dim lnk As LinkButton = CType(sender, LinkButton)
        Select Case lnk.CommandName
            Case "reject"
                CandidateID = lnk.CommandArgument
                mpe.Show()
            Case "accept"
                AcceptCandidate(lnk.CommandArgument)
        End Select
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

    Protected Sub btnRejectCandidate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRejectCandidate.Click
        Dim res As clsResult = AppliedJobData.fnChangeCanStatus(CandidateID, txtRejectionRemarks.Text, Session("LoginUserID"))

        If res.Success Then
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
End Class
