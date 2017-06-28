
Partial Class Organizations_frmOrganizationSettings
    Inherits System.Web.UI.Page

    Dim OrgInfoData As New clsOrganizationInfoDataAccess()
    Dim OrgBranchData As New clsOrgBranchData()

    Protected Sub btnInsertBranch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertBranch.Click

        Dim OrgBranchInfo As New clsOrgBranch()

        OrgBranchInfo.OrganizationID = drpOrganizations.SelectedValue
        OrgBranchInfo.BranchName = txtBranchName.Text
        OrgBranchInfo.BranchAddress = txtBranchAddress.Text
        OrgBranchInfo.EntryBy = Session("LoginUserID")

        Dim Check As Integer = OrgBranchData.fnInsertOrgBranch(OrgBranchInfo)

        If Check = 1 Then
            MessageBox("Inserted.")
            ClearForm()
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            ShowOrgList()
            btnInsertBranch.Enabled = True
            btnUpdate.Enabled = False
        End If
    End Sub

    Protected Sub ShowOrgList()
        drpOrganizations.DataTextField = "OrgName"
        drpOrganizations.DataValueField = "OrganizationID"
        drpOrganizations.DataSource = OrgInfoData.fnShowOrgList()
        drpOrganizations.DataBind()
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        btnInsertBranch.Enabled = True
        btnUpdate.Enabled = False
        ClearForm()
    End Sub

    Protected Sub drpOrganizations_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpOrganizations.SelectedIndexChanged
        ShowOrgBranchList(drpOrganizations.SelectedValue)
        ClearForm()
    End Sub

    Protected Sub ClearForm()
        txtBranchAddress.Text = ""
        txtBranchName.Text = ""
        hdFldOrgBranchID.Value = ""

        If grdOrgBranchList.Rows.Count > 0 Then
            grdOrgBranchList.SelectedIndex = -1
        End If
    End Sub

    Protected Sub ShowOrgBranchList(ByVal OrganizationID As String)
        grdOrgBranchList.DataSource = OrgBranchData.fnGetOrgWiseBranchInfo(OrganizationID)
        grdOrgBranchList.DataBind()
    End Sub

    Protected Sub grdOrgBranchList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdOrgBranchList.SelectedIndexChanged
        Dim lblBranchID, lblBranchName, lblBranchAddress As New Label()
        lblBranchID = grdOrgBranchList.SelectedRow.FindControl("lblBranchID")
        lblBranchName = grdOrgBranchList.SelectedRow.FindControl("lblBranchName")
        lblBranchAddress = grdOrgBranchList.SelectedRow.FindControl("lblBranchAddress")

        hdFldOrgBranchID.Value = lblBranchID.Text
        txtBranchName.Text = lblBranchName.Text
        txtBranchAddress.Text = lblBranchAddress.Text

        btnInsertBranch.Enabled = False
        btnUpdate.Enabled = True

    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        If hdFldOrgBranchID.Value = "" Then
            MessageBox("Select A Branch First")
            Exit Sub
        End If


        Dim OrgBranchInfo As New clsOrgBranch()

        OrgBranchInfo.BranchID = hdFldOrgBranchID.Value
        OrgBranchInfo.OrganizationID = drpOrganizations.SelectedValue
        OrgBranchInfo.BranchName = txtBranchName.Text
        OrgBranchInfo.BranchAddress = txtBranchAddress.Text
        OrgBranchInfo.EntryBy = Session("LoginUserID")

        Dim Check As Integer = OrgBranchData.fnUpdateOrgBranch(OrgBranchInfo)

        If Check = 1 Then
            MessageBox("Updated Successfully.")
            ClearForm()
            ShowOrgBranchList(drpOrganizations.SelectedValue)
            btnInsertBranch.Enabled = True
            btnUpdate.Enabled = False
        Else
            MessageBox("Error Found.")
        End If

    End Sub

End Class
