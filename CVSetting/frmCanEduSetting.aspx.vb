
Partial Class CVSetting_frmCanEduSetting
    Inherits System.Web.UI.Page
    Dim DataAccess As New clsCanEduDataAccess()

#Region "Degree"
    Protected Sub btnInsertDegree_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertDegree.Click
        Dim UserID As String
        UserID = Session("LoginUserID")

        Dim ExamInfo As New clsExamInfo()

        ExamInfo.DegreeName = txtDegreeName.Text
        ExamInfo.Order = txtOrder.Text

        If chkIsActive.Checked = True Then
            ExamInfo.IsActive = True
        Else
            ExamInfo.IsActive = False
        End If

        ExamInfo.EntryBy = UserID

        Dim check As Integer = DataAccess.fnInsertDegree(ExamInfo)

        If check = 1 Then
            ClearDegreeForm()
            ShowDegreeList()
            ShowDegreeListForGrid()
            MessageBox("Inserted.")
        Else
            MessageBox("Error Found.")
        End If
        txtDegreeName.Focus()
    End Sub
    Protected Sub ShowDegreeListForGrid()
        grdDegreeDetails.DataSource = DataAccess.fnGetExamList()
        grdDegreeDetails.DataBind()
    End Sub
    Protected Sub ShowDegreeList()
        drpAvailableDegree.DataTextField = "ExamName"
        drpAvailableDegree.DataValueField = "ExamID"
        drpAvailableDegree.DataSource = DataAccess.fnGetExamList()
        drpAvailableDegree.DataBind()
    End Sub
    Protected Sub ClearDegreeForm()
        txtDegreeName.Text = ""
        chkIsActive.Checked = False
        txtOrder.Text = ""
    End Sub
    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click

        Dim lblExamID As New System.Web.UI.WebControls.Label()
        lblExamID = grdDegreeDetails.SelectedRow.FindControl("lblExamID")

        Dim ExamInfo As New clsExamInfo()

        ExamInfo.DegreeName = txtDegreeName.Text
        ExamInfo.Order = txtOrder.Text

        If chkIsActive.Checked = True Then
            ExamInfo.IsActive = True
        Else
            ExamInfo.IsActive = False
        End If


        Dim check As Integer = DataAccess.fnUpdateDegree(ExamInfo, lblExamID.Text)

        If check = 1 Then
            ClearDegreeForm()
            ShowDegreeList()
            MessageBox("Updated.")
            btnUpdate.Visible = False
            btnInsertDegree.Visible = True
            ShowDegreeListForGrid()
        Else
            MessageBox("Error Found.")
        End If
        txtDegreeName.Focus()
    End Sub
    Protected Sub grdOrgDetails_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdDegreeDetails.SelectedIndexChanged
        Dim lblExamName As New System.Web.UI.WebControls.Label()
        lblExamName = grdDegreeDetails.SelectedRow.FindControl("lblExamName")


        Dim lblDegreeActive As New System.Web.UI.WebControls.Label()
        lblDegreeActive = grdDegreeDetails.SelectedRow.FindControl("lblDegreeActive")

        Dim lblExamOrder As New System.Web.UI.WebControls.Label()
        lblExamOrder = grdDegreeDetails.SelectedRow.FindControl("lblExamOrder")


        txtDegreeName.Text = lblExamName.Text

        If lblDegreeActive.Text = "Active" Then
            chkIsActive.Checked = True
        Else
            chkIsActive.Checked = False
        End If
        'chkIsActive.Checked = lblDegreeActive.Text

        txtOrder.Text = lblExamOrder.Text

        btnInsertDegree.Visible = False
        btnUpdate.Visible = True
    End Sub
    Protected Sub btnCancelSelection_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelSelection.Click
        ClearDegreeForm()
    End Sub

#End Region

#Region "BoardUniv"
    Protected Sub ShowInstitutionListForGrid()
        grdBU.DataSource = DataAccess.fnGetAllInstitutionListForGrid()
        grdBU.DataBind()
    End Sub
    Protected Sub btnCancelBU_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelSelection.Click
        ClearForm()
    End Sub
    Protected Sub grdBU_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdBU.SelectedIndexChanged
        Dim lblInstitutionName As New System.Web.UI.WebControls.Label()
        lblInstitutionName = grdBU.SelectedRow.FindControl("lblInstitutionName")

        Dim lblBUActive As New System.Web.UI.WebControls.Label()
        lblBUActive = grdBU.SelectedRow.FindControl("lblBUActive")

        Dim lblInstitutionType As New System.Web.UI.WebControls.Label()
        lblInstitutionType = grdBU.SelectedRow.FindControl("lblInstitutionType")


        txtBUName.Text = lblInstitutionName.Text

        ddlBUType.SelectedValue = lblInstitutionType.Text


        If lblBUActive.Text = "Active" Then
            chkBUActive.Checked = True
        Else
            chkBUActive.Checked = False
        End If
        'chkBUActive.Checked = lblBUActive.Text

        btnInsert.Visible = False
        btnUpdateBU.Visible = True
    End Sub
    Protected Sub btnUpdateBU_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateBU.Click
        Dim lblInstitutionID As New System.Web.UI.WebControls.Label()
        lblInstitutionID = grdBU.SelectedRow.FindControl("lblInstitutionID")

        Dim BUName, BUType, EntryBy As String
        Dim IsActive As Integer


        BUName = txtBUName.Text

        BUType = ddlBUType.SelectedValue

        If chkBUActive.Checked = True Then
            IsActive = True
        Else
            IsActive = False
        End If

        If BUType = "-Select-" Then
            MessageBox("Select Board/ University Type")
            Exit Sub
        End If

        Dim check As Integer = DataAccess.fnUpdateInstitutionList(BUName, BUType, IsActive, lblInstitutionID.Text)

        If check = 1 Then
            ClearForm()
            ShowList()
            MessageBox("Updated.")
            btnUpdateBU.Visible = False
            btnInsert.Visible = True
            ShowInstitutionListForGrid()
        Else
            MessageBox("Error Found.")
        End If
        txtBUName.Focus()

    End Sub
    Protected Sub btnInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsert.Click
        Dim UserID As String
        UserID = Session("LoginUserID")

        Dim BUName, EntryBy, BUType As String
        Dim IsActive As Integer


        BUName = txtBUName.Text
        BUType = ddlBUType.SelectedValue

        If chkBUActive.Checked = True Then
            IsActive = True
        Else
            IsActive = False
        End If

        EntryBy = UserID

        If BUType = "-Select-" Then
            MessageBox("Select Board/ University Type")
            Exit Sub
        End If

        Dim check As Integer = DataAccess.fnInsertInstitutionList(BUName, BUType, IsActive, EntryBy)

        If check = 1 Then
            ClearForm()
            ShowList()
            MessageBox("Inserted.")
            ShowInstitutionListForGrid()
        Else
            MessageBox("Error Found.")
        End If
        txtBUName.Focus()
    End Sub
    Protected Sub ShowList()
        drpAvailableBU.DataTextField = "InstitutionName"
        drpAvailableBU.DataValueField = "InstitutionID"
        drpAvailableBU.DataSource = DataAccess.fnGetAllInstitutionList()
        drpAvailableBU.DataBind()
    End Sub
    Protected Sub ClearForm()
        txtBUName.Text = ""
        chkBUActive.Checked = False
        ddlBUType.SelectedIndex = 0
    End Sub
#End Region

#Region "Major"
    Protected Sub btnInsertMajorName_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertMajorName.Click
        Dim UserID As String
        UserID = Session("LoginUserID")

        Dim MajorName, EntryBy As String
        Dim IsActive As Integer


        MajorName = txtMajorName.Text

        If chkMajorActive.Checked = True Then
            IsActive = True
        Else
            IsActive = False
        End If

        EntryBy = UserID

        Dim check As Integer = DataAccess.fnInsertMajor(MajorName, IsActive, EntryBy)

        If check = 1 Then
            ClearMajorForm()
            ShowMajorList()
            MessageBox("Inserted.")
            ShowMajorListForGrid()
        Else
            MessageBox("Error Found.")
        End If
        txtMajorName.Focus()
    End Sub

    Protected Sub btnCancelMajor_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelSelection.Click
        ClearMajorForm()
    End Sub
    Protected Sub ClearMajorForm()
        txtMajorName.Text = ""
        chkIsActive.Checked = False
    End Sub
    Protected Sub ShowMajorList()
        drpAvailableMajor.DataTextField = "MajorType"
        drpAvailableMajor.DataValueField = "MajorTypeID"
        drpAvailableMajor.DataSource = DataAccess.fnGetAllMajorList()
        drpAvailableMajor.DataBind()
    End Sub
    Protected Sub grdMajor_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdMajor.SelectedIndexChanged
        Dim lblMajorType As New System.Web.UI.WebControls.Label()
        lblMajorType = grdMajor.SelectedRow.FindControl("lblMajorType")

        Dim lblMajorActive As New System.Web.UI.WebControls.Label()
        lblMajorActive = grdMajor.SelectedRow.FindControl("lblMajorActive")

        txtMajorName.Text = lblMajorType.Text

        If lblMajorActive.Text = "Active" Then
            chkMajorActive.Checked = True
        Else
            chkMajorActive.Checked = False
        End If

        'chkMajorActive.Checked = lblMajorActive.Text

        btnInsertMajorName.Visible = False
        btnUpdateMajor.Visible = True
    End Sub
    Protected Sub ShowMajorListForGrid()
        grdMajor.DataSource = DataAccess.fnGetAllMajorList()
        grdMajor.DataBind()
    End Sub
    Protected Sub btnUpdateMajor_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateMajor.Click
        Dim lblMajorTypeID As New System.Web.UI.WebControls.Label()
        lblMajorTypeID = grdMajor.SelectedRow.FindControl("lblMajorTypeID")

        Dim MajorName As String
        Dim IsActive As Integer


        MajorName = txtMajorName.Text

        If chkMajorActive.Checked = True Then
            IsActive = True
        Else
            IsActive = False
        End If


        Dim check As Integer = DataAccess.fnUpdateMajor(MajorName, IsActive, lblMajorTypeID.Text)

        If check = 1 Then
            ClearMajorForm()
            ShowMajorList()
            MessageBox("Updated.")
            btnUpdateMajor.Visible = False
            btnInsertMajorName.Visible = True
            ShowMajorListForGrid()
        Else
            MessageBox("Error Found.")
        End If
        txtMajorName.Focus()
    End Sub
#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowDegreeList()
            ShowList()
            ShowMajorList()
            ShowAllOccupationList()
            ShowAllRelationList()
            ShowAllSpecilizedList()

            ShowDegreeListForGrid()
            ShowInstitutionListForGrid()
            ShowMajorListForGrid()
            ShowOccupationListForGrid()
            ShowRelationListForGrid()
            ShowSpecilizedListForGrid()

            btnUpdate.Visible = False
            btnUpdateBU.Visible = False
            btnUpdateMajor.Visible = False
            btnOccupationUpdate.Visible = False
            btnRelationUpdate.Visible = False
            btnSpecilizedUpdate.Visible = False

        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

#Region "Occupation"
    Protected Sub btnOccupationInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOccupationInsert.Click
        Dim UserID As String
        UserID = Session("LoginUserID")

        Dim OccupationName, EntryBy As String
        Dim IsActive As Integer


        OccupationName = txtOccupationName.Text

        If chkOccupationActive.Checked = True Then
            IsActive = True
        Else
            IsActive = False
        End If

        EntryBy = UserID

        Dim check As Integer = DataAccess.fnInsertOccupation(OccupationName, IsActive, EntryBy)

        If check = 1 Then
            ClearOccupation()
            ShowAllOccupationList()
            MessageBox("Inserted.")
        Else
            MessageBox("Error Found.")
        End If
        txtOccupationName.Focus()
    End Sub

    Protected Sub btnOccupationUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOccupationUpdate.Click
        Dim lblOccupationID As New System.Web.UI.WebControls.Label()
        lblOccupationID = grdOccupation.SelectedRow.FindControl("lblOccupationID")

        Dim OccupationName, EntryBy As String
        Dim IsActive As Integer


        OccupationName = txtOccupationName.Text

        If chkOccupationActive.Checked = True Then
            IsActive = True
        Else
            IsActive = False
        End If


        Dim check As Integer = DataAccess.fnUpdateOccupation(OccupationName, IsActive, lblOccupationID.Text)

        If check = 1 Then
            ClearOccupation()
            ShowAllOccupationList()
            MessageBox("Updated.")
            btnOccupationUpdate.Visible = False
            btnOccupationInsert.Visible = True
            ShowOccupationListForGrid()
        Else
            MessageBox("Error Found.")
        End If
        txtOccupationName.Focus()
    End Sub

    Protected Sub btnOccupationCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOccupationCancel.Click
        ClearOccupation()
    End Sub

    Protected Sub ClearOccupation()
        txtOccupationName.Text = ""
        chkOccupationActive.Checked = False
    End Sub

    Protected Sub ShowAllOccupationList()
        drpAvailOccupation.DataTextField = "OccupationName"
        drpAvailOccupation.DataValueField = "OccupationID"
        drpAvailOccupation.DataSource = DataAccess.fnGetAllOccupationList()
        drpAvailOccupation.DataBind()
    End Sub

    Protected Sub ShowOccupationListForGrid()
        grdOccupation.DataSource = DataAccess.fnGetAllOccupationList()
        grdOccupation.DataBind()
    End Sub

    Protected Sub grdOccupation_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdOccupation.SelectedIndexChanged
        Dim lblOccupationName As New System.Web.UI.WebControls.Label()
        lblOccupationName = grdOccupation.SelectedRow.FindControl("lblOccupationName")

        Dim lblOccupationisActive As New System.Web.UI.WebControls.Label()
        lblOccupationisActive = grdOccupation.SelectedRow.FindControl("lblOccupationisActive")

        txtOccupationName.Text = lblOccupationName.Text

        If lblOccupationisActive.Text = "Active" Then
            chkOccupationActive.Checked = True
        Else
            chkOccupationActive.Checked = False
        End If

        'chkOccupationActive.Checked = lblOccupationisActive.Text

        btnOccupationInsert.Visible = False
        btnOccupationUpdate.Visible = True
    End Sub
#End Region

#Region "Relation Type"
    Protected Sub grdRelationType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdRelationType.SelectedIndexChanged
        Dim lblRefRelationName As New System.Web.UI.WebControls.Label()
        lblRefRelationName = grdRelationType.SelectedRow.FindControl("lblRefRelationName")

        Dim lblRelationisActive As New System.Web.UI.WebControls.Label()
        lblRelationisActive = grdRelationType.SelectedRow.FindControl("lblRelationisActive")

        txtRefRelationName.Text = lblRefRelationName.Text

        If lblRelationisActive.Text = "Active" Then
            chkRelationActive.Checked = True
        Else
            chkRelationActive.Checked = False
        End If
        'chkRelationActive.Checked = lblRelationisActive.Text

        btnRelationInsert.Visible = False
        btnRelationUpdate.Visible = True
    End Sub

    Protected Sub btnRelationInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRelationInsert.Click
        Dim UserID As String
        UserID = Session("LoginUserID")

        Dim RelationName, EntryBy As String
        Dim IsActive As Integer


        RelationName = txtRefRelationName.Text

        If chkRelationActive.Checked = True Then
            IsActive = True
        Else
            IsActive = False
        End If

        EntryBy = UserID

        Dim check As Integer = DataAccess.fnInsertRefRelation(RelationName, IsActive, EntryBy)

        If check = 1 Then
            CancelRelationType()
            ShowAllRelationList()
            ShowRelationListForGrid()
            MessageBox("Inserted.")
        Else
            MessageBox("Error Found.")
        End If
        txtRefRelationName.Focus()
    End Sub

    Protected Sub btnRelationUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRelationUpdate.Click
        Dim lblRefRelationID As New System.Web.UI.WebControls.Label()
        lblRefRelationID = grdRelationType.SelectedRow.FindControl("lblRefRelationID")

        Dim RelationName, EntryBy As String
        Dim IsActive As Integer


        RelationName = txtRefRelationName.Text

        If chkRelationActive.Checked = True Then
            IsActive = True
        Else
            IsActive = False
        End If


        Dim check As Integer = DataAccess.fnUpdateRefRelation(RelationName, IsActive, lblRefRelationID.Text)

        If check = 1 Then
            CancelRelationType()
            ShowAllRelationList()
            MessageBox("Updated.")
            btnRelationUpdate.Visible = False
            btnRelationInsert.Visible = True
            ShowRelationListForGrid()
        Else
            MessageBox("Error Found.")
        End If
        txtRefRelationName.Focus()
    End Sub

    Protected Sub btnRelationCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRelationCancel.Click
        CancelRelationType()
    End Sub

    Protected Sub CancelRelationType()
        txtRefRelationName.Text = ""
        chkRelationActive.Checked = False
    End Sub

    Protected Sub ShowAllRelationList()
        drpRelationType.DataTextField = "RefRelationName"
        drpRelationType.DataValueField = "RefRelationID"
        drpRelationType.DataSource = DataAccess.fnGetAllRefRelationList()
        drpRelationType.DataBind()
    End Sub

    Protected Sub ShowRelationListForGrid()
        grdRelationType.DataSource = DataAccess.fnGetAllRefRelationList()
        grdRelationType.DataBind()
    End Sub
#End Region
#Region "Specilized"
    Protected Sub btnSpecilizedInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSpecilizedInsert.Click
        Dim UserID As String
        UserID = Session("LoginUserID")

        Dim SpecilizedName, EntryBy As String
        Dim IsActive As Integer


        SpecilizedName = txtSpecilized.Text

        If chkSpecilizedActive.Checked = True Then
            IsActive = True
        Else
            IsActive = False
        End If

        EntryBy = UserID

        Dim check As Integer = DataAccess.fnInsertSpecilizedIn(SpecilizedName, IsActive, EntryBy)

        If check = 1 Then
            ClearSpecilizedIn()
            ShowAllSpecilizedList()
            ShowSpecilizedListForGrid()
            MessageBox("Inserted.")
        Else
            MessageBox("Error Found.")
        End If
        txtSpecilized.Focus()
    End Sub

    Protected Sub btnSpecilizedUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSpecilizedUpdate.Click
        Dim lblSpecilizedID As New System.Web.UI.WebControls.Label()
        lblSpecilizedID = grdSpecilized.SelectedRow.FindControl("lblSpecilizedID")

        Dim SpecilizedName, EntryBy As String
        Dim IsActive As Integer


        SpecilizedName = txtSpecilized.Text

        If chkSpecilizedActive.Checked = True Then
            IsActive = True
        Else
            IsActive = False
        End If


        Dim check As Integer = DataAccess.fnUpdateSpecilizedIn(SpecilizedName, IsActive, lblSpecilizedID.Text)

        If check = 1 Then
            ClearSpecilizedIn()
            ShowAllSpecilizedList()
            MessageBox("Updated.")
            btnSpecilizedUpdate.Visible = False
            btnSpecilizedInsert.Visible = True
            ShowSpecilizedListForGrid()
        Else
            MessageBox("Error Found.")
        End If
        txtSpecilized.Focus()
    End Sub

    Protected Sub btnSpecilizedCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSpecilizedCancel.Click
        ClearSpecilizedIn()
    End Sub
    Protected Sub grdSpecilized_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdSpecilized.SelectedIndexChanged
        Dim lblSpecilizedName As New System.Web.UI.WebControls.Label()
        lblSpecilizedName = grdSpecilized.SelectedRow.FindControl("lblSpecilizedName")

        Dim lblSpecilizedActive As New System.Web.UI.WebControls.Label()
        lblSpecilizedActive = grdSpecilized.SelectedRow.FindControl("lblSpecilizedActive")

        txtSpecilized.Text = lblSpecilizedName.Text

        If lblSpecilizedActive.Text = "Active" Then
            chkSpecilizedActive.Checked = True
        Else
            chkSpecilizedActive.Checked = False
        End If

        btnSpecilizedInsert.Visible = False
        btnSpecilizedUpdate.Visible = True
    End Sub

    Protected Sub ClearSpecilizedIn()
        txtSpecilized.Text = ""
        chkSpecilizedActive.Checked = False
    End Sub
    Protected Sub ShowAllSpecilizedList()
        drpSpecilized.DataTextField = "SpecilizedName"
        drpSpecilized.DataValueField = "SpecilizedID"
        drpSpecilized.DataSource = DataAccess.fnGetAllSpecilizedList()
        drpSpecilized.DataBind()
    End Sub

    Protected Sub ShowSpecilizedListForGrid()
        grdSpecilized.DataSource = DataAccess.fnGetAllSpecilizedList()
        grdSpecilized.DataBind()
    End Sub
#End Region

   
End Class
