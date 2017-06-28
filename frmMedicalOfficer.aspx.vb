
Partial Class frmMedicalOfficer
    Inherits System.Web.UI.Page

    Dim MedOfficerData As New clsMedOfficerDataAccess()

    Protected Sub btnInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsert.Click
        Dim MedOfficer As New clsMedicalOfficer()

        MedOfficer.MedOfficerName = txtOfficerName.Text
        MedOfficer.Organization = txtOrganization.Text
        MedOfficer.Branch = txtBranch.Text
        MedOfficer.Designation = txtDesignation.Text
        MedOfficer.Address_HouseNo = txtHouseNo.Text
        MedOfficer.Address_Road = txtRoadNo.Text
        MedOfficer.Address_Telephone = txtTelephone.Text
        MedOfficer.Address_Mobile = txtMobile.Text
        MedOfficer.EntryBy = Session("LoginUserID")
        If chkIsActive.Checked = True Then
            MedOfficer.IsActive = True
        Else
            MedOfficer.IsActive = False
        End If

        Dim check As Integer = MedOfficerData.fnInsertMedicalOfficer(MedOfficer)

        If check = 1 Then
            MessageBox("Inserted Successfully.")
            ShowAvailableMedOfficers()
            ClearForm()
        Else
            MessageBox("Error Found.")
        End If
    End Sub

    Protected Sub ClearForm()
        txtOfficerName.Text = ""
        txtHouseNo.Text = ""
        txtMobile.Text = ""
        txtDesignation.Text = ""
        txtOrganization.Text = ""
        txtRoadNo.Text = ""
        txtTelephone.Text = ""
        hdFldMedOfficerID.Value = ""
        grdMedOfficerInfo.SelectedIndex = -1
        chkIsActive.Checked = False
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Dim MedOfficer As New clsMedicalOfficer()

        If hdFldMedOfficerID.Value = "" Then
            MessageBox("Select A Person From The List.")
            Exit Sub
        End If

        MedOfficer.MedOffID = hdFldMedOfficerID.Value
        MedOfficer.MedOfficerName = txtOfficerName.Text
        MedOfficer.Organization = txtOrganization.Text
        MedOfficer.Branch = txtBranch.Text
        MedOfficer.Designation = txtDesignation.Text
        MedOfficer.Address_HouseNo = txtHouseNo.Text
        MedOfficer.Address_Road = txtRoadNo.Text
        MedOfficer.Address_Telephone = txtTelephone.Text
        MedOfficer.Address_Mobile = txtMobile.Text

        If chkIsActive.Checked = True Then
            MedOfficer.IsActive = True
        Else
            MedOfficer.IsActive = False
        End If

        Dim check As Integer = MedOfficerData.fnUpdateMedicalOfficer(MedOfficer)

        If check = 1 Then
            MessageBox("Update Successfully..")
            ShowAvailableMedOfficers()
            ClearForm()
        Else
            MessageBox("Error Found.")
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            btnInsert.Visible = True
            btnUpdate.Visible = False
            ShowAvailableMedOfficers()
        End If
    End Sub

    Protected Sub ShowAvailableMedOfficers()
        grdMedOfficerInfo.DataSource = MedOfficerData.fnShowAllMedicalOfficer()
        grdMedOfficerInfo.DataBind()
    End Sub

    Protected Sub grdMedOfficerInfo_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdMedOfficerInfo.SelectedIndexChanged
        Dim lblMedOffID, lblMedOfficerName, lblOrganization, lblBranch, lblDesignation, lblAddress_HouseNo, lblAddress_Road, lblAddress_Telephone, lblAddress_Mobile, lblEntryBy, lblActive As New Label

        lblMedOffID = grdMedOfficerInfo.SelectedRow.FindControl("lblMedOffID")
        lblMedOfficerName = grdMedOfficerInfo.SelectedRow.FindControl("lblMedOfficerName")
        lblOrganization = grdMedOfficerInfo.SelectedRow.FindControl("lblOrganization")
        lblBranch = grdMedOfficerInfo.SelectedRow.FindControl("lblBranch")
        lblDesignation = grdMedOfficerInfo.SelectedRow.FindControl("lblDesignation")
        lblAddress_HouseNo = grdMedOfficerInfo.SelectedRow.FindControl("lblAddress_HouseNo")
        lblAddress_Road = grdMedOfficerInfo.SelectedRow.FindControl("lblAddress_Road")
        lblAddress_Telephone = grdMedOfficerInfo.SelectedRow.FindControl("lblAddress_Telephone")
        lblAddress_Mobile = grdMedOfficerInfo.SelectedRow.FindControl("lblAddress_Mobile")
        lblActive = grdMedOfficerInfo.SelectedRow.FindControl("lblActive")

        hdFldMedOfficerID.Value = lblMedOffID.Text
        txtOfficerName.Text = lblMedOfficerName.Text
        txtOrganization.Text = lblOrganization.Text
        txtBranch.Text = lblBranch.Text
        txtDesignation.Text = lblDesignation.Text
        txtHouseNo.Text = lblAddress_HouseNo.Text
        txtRoadNo.Text = lblAddress_HouseNo.Text
        txtTelephone.Text = lblAddress_Telephone.Text
        txtMobile.Text = lblAddress_Mobile.Text

        If lblActive.Text = "YES" Then
            chkIsActive.Checked = True
        Else
            chkIsActive.Checked = False
        End If

        btnInsert.Visible = False
        btnUpdate.Visible = True

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearForm()
        btnUpdate.Visible = False
        btnInsert.Visible = True
    End Sub
End Class
