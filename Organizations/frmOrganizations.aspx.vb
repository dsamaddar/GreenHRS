
Partial Class Training_frmOrganizations
    Inherits System.Web.UI.Page

    Dim OrgInfoData As New clsOrganizationInfoDataAccess()

    Protected Sub btnAddOrganization_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddOrganization.Click

        Dim OrgInfo As New clsOrganizationInfo()

        OrgInfo.OrgName = txtOrganizationName.Text
        OrgInfo.OrgProfile = txtOrgDetails.Text
        OrgInfo.Country = drpCountry.SelectedValue
        OrgInfo.Address = txtAddress.Text
        OrgInfo.Telephone = txtTelephone.Text
        OrgInfo.Mobile = txtMobile.Text
        OrgInfo.Fax = txtFax.Text
        OrgInfo.EntryBy = Session("LoginUserID")

        Dim check As Integer = 0
        If btnAddOrganization.Text = "ADD" Then
            check = OrgInfoData.fnInsertOrganizations(OrgInfo)
        Else
            Dim lblOrganizationID As New System.Web.UI.WebControls.Label()
            lblOrganizationID = grdOrgDetails.SelectedRow.FindControl("lblOrganizationID")

            OrgInfo.OrganizationID = lblOrganizationID.Text
            check = OrgInfoData.fnUpdateOrgranizationInfo(OrgInfo)
        End If

        If check = 1 Then
            MessageBox("Inserted Successfully.")
            ShowOrgInfo()
            ClearForm()
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub ClearForm()
        txtOrganizationName.Text = ""
        txtAddress.Text = ""
        drpCountry.SelectedIndex = -1
        txtOrgDetails.Text = ""
        txtTelephone.Text = ""
        txtMobile.Text = ""
        txtFax.Text = ""

        grdOrgDetails.SelectedIndex = -1
        btnAddOrganization.Text = "ADD"
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearForm()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            ShowOrgInfo()
        End If
    End Sub

    Protected Sub ShowOrgInfo()
        grdOrgDetails.DataSource = OrgInfoData.fnShowOrgInfo()
        grdOrgDetails.DataBind()
    End Sub

    Protected Sub grdOrgDetails_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdOrgDetails.SelectedIndexChanged

        btnAddOrganization.Text = "Update"

        Dim lblOrgName As New System.Web.UI.WebControls.Label()
        Dim lblOrgProfile As New System.Web.UI.WebControls.Label()
        Dim lblCountry As New System.Web.UI.WebControls.Label()
        Dim lblAddress As New System.Web.UI.WebControls.Label()
        Dim lblTelephone As New System.Web.UI.WebControls.Label()
        Dim lblFax As New System.Web.UI.WebControls.Label()
        Dim lblMobile As New System.Web.UI.WebControls.Label()

        lblOrgName = grdOrgDetails.SelectedRow.FindControl("lblOrgName")
        lblOrgProfile = grdOrgDetails.SelectedRow.FindControl("lblOrgProfile")
        lblAddress = grdOrgDetails.SelectedRow.FindControl("lblAddress")
        lblTelephone = grdOrgDetails.SelectedRow.FindControl("lblTelephone")
        lblFax = grdOrgDetails.SelectedRow.FindControl("lblFax")
        lblMobile = grdOrgDetails.SelectedRow.FindControl("lblMobile")

        txtOrganizationName.Text = lblOrgName.Text
        txtOrgDetails.Text = lblOrgProfile.Text
        txtAddress.Text = lblAddress.Text
        drpCountry.SelectedValue = lblCountry.Text
        txtTelephone.Text = lblTelephone.Text
        txtFax.Text = lblFax.Text
        txtMobile.Text = lblMobile.Text

    End Sub
End Class
