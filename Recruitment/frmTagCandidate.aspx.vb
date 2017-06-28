Imports System.Data

Partial Class Recruitment_frmTagCandidate
    Inherits System.Web.UI.Page

    Dim DistrictData As New clsDistrictDataAccess()
    Dim EducationData As New clsCanEduDataAccess()
    Dim CanEduData As New clsCanEduDataAccess()
    Dim CVSelectionData As New clsCVSelectionDataAccess()
    Dim RecTypeData As New clsRecruitmentTypeDataAccess()
    Dim CanTagData As New clsCanRecruitmentTagDataAccess()
    Dim RegionData As New clsRegionDataAccess()
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

    Protected Sub GetRegions()
        chkRegions.DataTextField = "Region"
        chkRegions.DataValueField = "RegionID"
        chkRegions.DataSource = RegionData.fnGetRegionList()
        chkRegions.DataBind()
    End Sub

    Protected Sub GetBranchList()
        chkBranch.DataTextField = "ULCBranchName"
        chkBranch.DataValueField = "ULCBranchID"
        chkBranch.DataSource = ULCBranchData.fnGetTotalULCBranch()
        chkBranch.DataBind()
    End Sub

    Protected Sub btnSearchApplicant_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearchApplicant.Click
        If Trim(txtCandidate.Text) = "" Then
            MessageBox("Search Criteria Can't be blank.")
        End If

        grdMatchedApplicant.SelectedIndex = -1

        grdMatchedApplicant.DataSource = ""
        grdMatchedApplicant.DataBind()

        'SearchApplicantProfile(Trim(txtCandidate.Text))

        Dim CVSelection As New clsCVSelection()

        CVSelection.CandidateName = txtCandidate.Text
        CVSelection.InstitutionID = drpUniversityList.SelectedValue
        CVSelection.PresentDistrictID = drpPresentDistrict.SelectedValue
        CVSelection.PermanentDistrictID = drpPermanentDistrict.SelectedValue
        CVSelection.Gender = drpGenderList.SelectedValue
        CVSelection.AgeFrom = Convert.ToInt32(txtAgeFrom.Text)
        CVSelection.AgeTo = Convert.ToInt32(txtAgeTo.Text)
        CVSelection.YearOfExperience = Convert.ToInt32(txtExperience.Text)
        CVSelection.MajorTypeID = drpSubjects.SelectedValue
        CVSelection.SpecializedID = ""

        grdMatchedApplicant.DataSource = CVSelectionData.fnSearchTotalApplicant(CVSelection)
        grdMatchedApplicant.DataBind()
    End Sub

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

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetPresentDistrictInfo()
            GetInstitutionList()
            GetPermanentDistrictInfo()
            ShowSubjects()
            GetRecTypeList()

            GetRegions()
            GetBranchList()

            txtAgeFrom.Text = "20"
            txtAgeTo.Text = "60"
            txtExperience.Text = "0"

            btnTagCandidate.Enabled = False
            btnClearSelection.Enabled = False
        End If
    End Sub

    Protected Sub GetRecTypeList()
        chkBxLstRecType.DataTextField = "RecruitmentType"
        chkBxLstRecType.DataValueField = "RecruitmentTypeID"
        chkBxLstRecType.DataSource = RecTypeData.fnGetRecTypeList()
        chkBxLstRecType.DataBind()
    End Sub

    Protected Sub btnClearSelection_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClearSelection.Click
        ClearForm()
    End Sub

    Protected Sub ClearForm()
        If grdMatchedApplicant.Rows.Count > 0 Then
            grdMatchedApplicant.SelectedIndex = -1
        End If

        For Each itm As ListItem In chkBxLstRecType.Items
            itm.Selected = False
        Next

        btnTagCandidate.Enabled = False
        btnClearSelection.Enabled = False

    End Sub

    Protected Function FormatTable() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("RecruitmentTypeID", System.Type.GetType("System.String"))
        Return dt
    End Function

    Protected Sub grdMatchedApplicant_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdMatchedApplicant.SelectedIndexChanged
        Dim lblCandidateID As New Label()
        Dim dt As DataTable = FormatTable()


        '' Get Already Tagged Data
        lblCandidateID = grdMatchedApplicant.SelectedRow.FindControl("lblCandidateID")
        dt = CanTagData.fnGetRecTagByCandidate(lblCandidateID.Text).Tables(0)

        For Each dr As DataRow In dt.Rows
            Dim indx As Integer = chkBxLstRecType.Items.IndexOf(chkBxLstRecType.Items.FindByValue(dr.Item("RecruitmentTypeID")))
            If indx <> -1 Then
                chkBxLstRecType.Items(indx).Selected = True
                chkBxLstRecType.Items(indx).Attributes.Add("style", "font:bold")
            End If
        Next

        ' Get Tagged Regions
        Dim dtRegions As DataTable = FormatTableRegions()

        dtRegions = RegionData.fnGetRegionTagByCandidate(lblCandidateID.Text).Tables(0)

        For Each dr As DataRow In dtRegions.Rows
            Dim indx As Integer = chkRegions.Items.IndexOf(chkRegions.Items.FindByValue(dr.Item("RegionID")))
            If indx <> -1 Then
                chkRegions.Items(indx).Selected = True
                chkRegions.Items(indx).Attributes.Add("style", "font:bold")
            End If
        Next

        ' Get Tagged Branches
        Dim dtBranch As DataTable = FormatTableBranch()

        dtBranch = SuiBranchData.fnGetBranchTagByCandidate(lblCandidateID.Text).Tables(0)

        For Each dr As DataRow In dtBranch.Rows
            Dim indx As Integer = chkBranch.Items.IndexOf(chkBranch.Items.FindByValue(dr.Item("ULCBranchID")))
            If indx <> -1 Then
                chkBranch.Items(indx).Selected = True
                chkBranch.Items(indx).Attributes.Add("style", "font:bold")
            End If
        Next

        btnTagCandidate.Enabled = True
        btnClearSelection.Enabled = True
    End Sub

    Protected Sub btnTagCandidate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTagCandidate.Click

        Dim lblCandidateID As New Label()
        Dim TagList As String = ""
        Dim CanTag As New clsCanRecruitmentTag()

        lblCandidateID = grdMatchedApplicant.SelectedRow.FindControl("lblCandidateID")

        For Each itm As ListItem In chkBxLstRecType.Items
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
            ClearForm()
        End If

        UpdateRegion(lblCandidateID.Text, Session("LoginUserID"))
        ClearRegions()
        MessageBox(Result.Message)

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

End Class
