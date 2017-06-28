Imports System
Imports System.Data
Imports System.Drawing

Partial Class Recruitment_frmCanSelectionCriteria
    Inherits System.Web.UI.Page

    Dim CanTagData As New clsCanRecruitmentTagDataAccess()
    Dim RecTypeData As New clsRecruitmentTypeDataAccess()
    Dim RegionData As New clsRegionDataAccess()
    Dim ULCBranchData As New clsULCBranchDataAccess()
    Dim SuiBranchData As New clsSuitableBranchDataAccess()

    Protected Function FormatTableRecruitmentType() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("RecruitmentTypeID", System.Type.GetType("System.String"))
        Return dt
    End Function

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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetRecTypeList()
            GetRegions()
            GetBranchList()
            Try
                Dim CandidateID As String = Request.QueryString("CandidateID")

                '' Get Already Tagged Data
                Dim dtRecType As DataTable = FormatTableRecruitmentType()

                dtRecType = CanTagData.fnGetRecTagByCandidate(CandidateID).Tables(0)

                For Each dr As DataRow In dtRecType.Rows
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
            Catch ex As Exception
                MessageBox(ex.Message)
            End Try
            
        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

End Class
