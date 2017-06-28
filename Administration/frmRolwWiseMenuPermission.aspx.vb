
Partial Class Administration_frmRolwWiseMenuPermission
    Inherits System.Web.UI.Page

    Dim MenuData As New clsMenuDataAccess()
    Dim RoleData As New clsRoleDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Dim MenuIDs As String

        'MenuIDs = Session("PermittedMenus")

        'If InStr(MenuIDs, "MngPermission~") = 0 Then
        '    Response.Redirect("~\frmHRMLogin.aspx")
        'End If

        If Not IsPostBack Then

            ShowRoleList()

            ShowMenuList(grdAdministrationMenu, "Administration")
            ShowMenuList(grdRecruitmentProcess, "RecruitmentProcess")
            ShowMenuList(grdRecruitment, "Recruitment")
            ShowMenuList(grdEmployment, "Employment")
            ShowMenuList(grdHRDatabaseAndServices, "HRDBServices")
            ShowMenuList(grdSalarySetup, "SalarySetup")
            ShowMenuList(grdManageBankAcc, "ManageBankAcc")
            ShowMenuList(grdGeneralAdmin, "GenAdmin")
            ShowMenuList(grdCandidatePool, "POOL")

        End If
    End Sub

    Protected Sub ShowMenuList(ByVal grd As GridView, ByVal MenuGroupID As String)
        grd.DataSource = MenuData.fnGetMenuListByGroup(MenuGroupID)
        grd.DataBind()
    End Sub

    Protected Sub ShowRoleList()
        drpRoleList.DataTextField = "RoleName"
        drpRoleList.DataValueField = "RoleID"
        drpRoleList.DataSource = RoleData.fnGetRoleList()
        drpRoleList.DataBind()

        Dim A As New ListItem()

        A.Text = "N\A"
        A.Value = "N\A"

        drpRoleList.Items.Insert(0, A)
    End Sub

    Protected Sub GetMenuPermission(ByVal MenuIDList As String)

        Dim chkSelectAdminMenu, chkSelectRecruitmentProcess, chkSelectRecruitmentMenu, chkSelectEmploymentMenu, chkSelectHRDBAndServicesMenu, chkSelectSalarySetupMenu, chkSelectManageBankAccMenu, chkSelectGenAdminMenu, chkSelectCanPoolMenu As New CheckBox()
        Dim lblAdminMenuID, lblRecruitmentProcessMenuID, lblRecruitmentMenuID, lblEmploymentMenuID, lblHRDBAndServicesMenuID, lblSalarySetupMenuID, lblManageBankAccMenuID, lblGenAdminMenuID, lblCanPoolMenuID As New Label()

        For Each rw As GridViewRow In grdAdministrationMenu.Rows
            lblAdminMenuID = rw.FindControl("lblAdminMenuID")
            If MenuIDList.Contains(lblAdminMenuID.Text) Then
                chkSelectAdminMenu = rw.FindControl("chkSelectAdminMenu")
                chkSelectAdminMenu.Checked = True
                rw.ForeColor = Drawing.Color.Green
                rw.Font.Bold = True
            End If
        Next

        For Each rw As GridViewRow In grdRecruitmentProcess.Rows
            lblRecruitmentProcessMenuID = rw.FindControl("lblRecruitmentProcessMenuID")
            If MenuIDList.Contains(lblRecruitmentProcessMenuID.Text) Then
                chkSelectRecruitmentProcess = rw.FindControl("chkSelectRecruitmentProcess")
                chkSelectRecruitmentProcess.Checked = True
                rw.ForeColor = Drawing.Color.Green
                rw.Font.Bold = True
            End If
        Next

        For Each rw As GridViewRow In grdRecruitment.Rows
            lblRecruitmentMenuID = rw.FindControl("lblRecruitmentMenuID")
            If MenuIDList.Contains(lblRecruitmentMenuID.Text) Then
                chkSelectRecruitmentMenu = rw.FindControl("chkSelectRecruitmentMenu")
                chkSelectRecruitmentMenu.Checked = True
                rw.ForeColor = Drawing.Color.Green
                rw.Font.Bold = True
            End If
        Next

        For Each rw As GridViewRow In grdEmployment.Rows
            lblEmploymentMenuID = rw.FindControl("lblEmploymentMenuID")
            If MenuIDList.Contains(lblEmploymentMenuID.Text) Then
                chkSelectEmploymentMenu = rw.FindControl("chkSelectEmploymentMenu")
                chkSelectEmploymentMenu.Checked = True
                rw.ForeColor = Drawing.Color.Green
                rw.Font.Bold = True
            End If
        Next

        For Each rw As GridViewRow In grdHRDatabaseAndServices.Rows
            lblHRDBAndServicesMenuID = rw.FindControl("lblHRDBAndServicesMenuID")
            If MenuIDList.Contains(lblHRDBAndServicesMenuID.Text) Then
                chkSelectHRDBAndServicesMenu = rw.FindControl("chkSelectHRDBAndServicesMenu")
                chkSelectHRDBAndServicesMenu.Checked = True
                rw.ForeColor = Drawing.Color.Green
                rw.Font.Bold = True
            End If
        Next

        For Each rw As GridViewRow In grdSalarySetup.Rows
            lblSalarySetupMenuID = rw.FindControl("lblSalarySetupMenuID")
            If MenuIDList.Contains(lblSalarySetupMenuID.Text) Then
                chkSelectSalarySetupMenu = rw.FindControl("chkSelectSalarySetupMenu")
                chkSelectSalarySetupMenu.Checked = True
                rw.ForeColor = Drawing.Color.Green
                rw.Font.Bold = True
            End If
        Next

        For Each rw As GridViewRow In grdManageBankAcc.Rows
            lblManageBankAccMenuID = rw.FindControl("lblManageBankAccMenuID")
            If MenuIDList.Contains(lblManageBankAccMenuID.Text) Then
                chkSelectManageBankAccMenu = rw.FindControl("chkSelectManageBankAccMenu")
                chkSelectManageBankAccMenu.Checked = True
                rw.ForeColor = Drawing.Color.Green
                rw.Font.Bold = True
            End If
        Next

        For Each rw As GridViewRow In grdGeneralAdmin.Rows
            lblGenAdminMenuID = rw.FindControl("lblGenAdminMenuID")
            If MenuIDList.Contains(lblGenAdminMenuID.Text) Then
                chkSelectGenAdminMenu = rw.FindControl("chkSelectGenAdminMenu")
                chkSelectGenAdminMenu.Checked = True
                rw.ForeColor = Drawing.Color.Green
                rw.Font.Bold = True
            End If
        Next

        For Each rw As GridViewRow In grdCandidatePool.Rows
            lblCanPoolMenuID = rw.FindControl("lblCanPoolMenuID")
            If MenuIDList.Contains(lblCanPoolMenuID.Text) Then
                chkSelectCanPoolMenu = rw.FindControl("chkSelectCanPoolMenu")
                chkSelectCanPoolMenu.Checked = True
                rw.ForeColor = Drawing.Color.Green
                rw.Font.Bold = True
            End If
        Next

    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click


        If drpRoleList.SelectedValue = "N\A" Then
            MessageBox("Select Proper Role")
            Exit Sub
        End If

        Dim MenuIDList As String = ""

        Dim chkSelectAdminMenu, chkSelectRecruitmentProcess, chkSelectRecruitmentMenu, chkSelectEmploymentMenu, chkSelectHRDBAndServicesMenu, chkSelectSalarySetupMenu, chkSelectManageBankAccMenu, chkSelectGenAdminMenu, chkSelectCanPoolMenu As New CheckBox()
        Dim lblAdminMenuID, lblRecruitmentProcessMenuID, lblRecruitmentMenuID, lblEmploymentMenuID, lblHRDBAndServicesMenuID, lblSalarySetupMenuID, lblManageBankAccMenuID, lblGenAdminMenuID, lblCanPoolMenuID As New Label()


        For Each rw As GridViewRow In grdAdministrationMenu.Rows
            chkSelectAdminMenu = rw.FindControl("chkSelectAdminMenu")

            If chkSelectAdminMenu.Checked = True Then
                lblAdminMenuID = rw.FindControl("lblAdminMenuID")
                MenuIDList += lblAdminMenuID.Text & "~"
            End If
        Next

        For Each rw As GridViewRow In grdRecruitmentProcess.Rows
            chkSelectRecruitmentProcess = rw.FindControl("chkSelectRecruitmentProcess")

            If chkSelectRecruitmentProcess.Checked = True Then
                lblRecruitmentProcessMenuID = rw.FindControl("lblRecruitmentProcessMenuID")
                MenuIDList += lblRecruitmentProcessMenuID.Text & "~"
            End If
        Next

        For Each rw As GridViewRow In grdRecruitment.Rows
            chkSelectRecruitmentMenu = rw.FindControl("chkSelectRecruitmentMenu")

            If chkSelectRecruitmentMenu.Checked = True Then
                lblRecruitmentMenuID = rw.FindControl("lblRecruitmentMenuID")
                MenuIDList += lblRecruitmentMenuID.Text & "~"
            End If
        Next

        For Each rw As GridViewRow In grdEmployment.Rows
            chkSelectEmploymentMenu = rw.FindControl("chkSelectEmploymentMenu")

            If chkSelectEmploymentMenu.Checked = True Then
                lblEmploymentMenuID = rw.FindControl("lblEmploymentMenuID")
                MenuIDList += lblEmploymentMenuID.Text & "~"
            End If
        Next

        For Each rw As GridViewRow In grdHRDatabaseAndServices.Rows
            chkSelectHRDBAndServicesMenu = rw.FindControl("chkSelectHRDBAndServicesMenu")

            If chkSelectHRDBAndServicesMenu.Checked = True Then
                lblHRDBAndServicesMenuID = rw.FindControl("lblHRDBAndServicesMenuID")
                MenuIDList += lblHRDBAndServicesMenuID.Text & "~"
            End If
        Next

        For Each rw As GridViewRow In grdSalarySetup.Rows
            chkSelectSalarySetupMenu = rw.FindControl("chkSelectSalarySetupMenu")

            If chkSelectSalarySetupMenu.Checked = True Then
                lblSalarySetupMenuID = rw.FindControl("lblSalarySetupMenuID")
                MenuIDList += lblSalarySetupMenuID.Text & "~"
            End If
        Next

        For Each rw As GridViewRow In grdManageBankAcc.Rows
            chkSelectManageBankAccMenu = rw.FindControl("chkSelectManageBankAccMenu")

            If chkSelectManageBankAccMenu.Checked = True Then
                lblManageBankAccMenuID = rw.FindControl("lblManageBankAccMenuID")
                MenuIDList += lblManageBankAccMenuID.Text & "~"
            End If
        Next

        For Each rw As GridViewRow In grdGeneralAdmin.Rows
            chkSelectGenAdminMenu = rw.FindControl("chkSelectGenAdminMenu")

            If chkSelectGenAdminMenu.Checked = True Then
                lblGenAdminMenuID = rw.FindControl("lblGenAdminMenuID")
                MenuIDList += lblGenAdminMenuID.Text & "~"
            End If
        Next

        For Each rw As GridViewRow In grdCandidatePool.Rows
            chkSelectCanPoolMenu = rw.FindControl("chkSelectCanPoolMenu")

            If chkSelectCanPoolMenu.Checked = True Then
                lblCanPoolMenuID = rw.FindControl("lblCanPoolMenuID")
                MenuIDList += lblCanPoolMenuID.Text & "~"
            End If
        Next

        Dim Role As New clsRole()

        Role.RoleID = drpRoleList.SelectedValue
        Role.MenuIDList = MenuIDList
        Role.LastUpdatedBy = Session("LoginUserID")

        Dim Check As Integer = RoleData.fnUpdateRolePermission(Role)

        If Check = 1 Then
            MessageBox("Successfully Inserted.")
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub ClearMenuSelection()

        Dim chkSelectAdminMenu, chkSelectRecruitmentProcess, chkSelectRecruitmentMenu, chkSelectEmploymentMenu, chkSelectHRDBAndServicesMenu, chkSelectSalarySetupMenu, chkSelectManageBankAccMenu, chkSelectGenAdminMenu, chkSelectCanPoolMenu As New CheckBox()

        For Each rw As GridViewRow In grdAdministrationMenu.Rows
            chkSelectAdminMenu = rw.FindControl("chkSelectAdminMenu")
            If chkSelectAdminMenu.Checked = True Then
                chkSelectAdminMenu.Checked = False
                rw.ForeColor = Drawing.Color.Black
                rw.Font.Bold = False
            End If
        Next

        For Each rw As GridViewRow In grdRecruitmentProcess.Rows
            chkSelectRecruitmentProcess = rw.FindControl("chkSelectRecruitmentProcess")
            If chkSelectRecruitmentProcess.Checked = True Then
                chkSelectRecruitmentProcess.Checked = False
                rw.ForeColor = Drawing.Color.Black
                rw.Font.Bold = False
            End If
        Next

        For Each rw As GridViewRow In grdRecruitment.Rows
            chkSelectRecruitmentMenu = rw.FindControl("chkSelectRecruitmentMenu")
            If chkSelectRecruitmentMenu.Checked = True Then
                chkSelectRecruitmentMenu.Checked = False
                rw.ForeColor = Drawing.Color.Black
                rw.Font.Bold = False
            End If
        Next

        For Each rw As GridViewRow In grdEmployment.Rows
            chkSelectEmploymentMenu = rw.FindControl("chkSelectEmploymentMenu")
            If chkSelectEmploymentMenu.Checked = True Then
                chkSelectEmploymentMenu.Checked = False
                rw.ForeColor = Drawing.Color.Black
                rw.Font.Bold = False
            End If
        Next

        For Each rw As GridViewRow In grdHRDatabaseAndServices.Rows
            chkSelectHRDBAndServicesMenu = rw.FindControl("chkSelectHRDBAndServicesMenu")
            If chkSelectHRDBAndServicesMenu.Checked = True Then
                chkSelectHRDBAndServicesMenu.Checked = False
                rw.ForeColor = Drawing.Color.Black
                rw.Font.Bold = False
            End If
        Next

        For Each rw As GridViewRow In grdSalarySetup.Rows
            chkSelectSalarySetupMenu = rw.FindControl("chkSelectSalarySetupMenu")
            If chkSelectSalarySetupMenu.Checked = True Then
                chkSelectSalarySetupMenu.Checked = False
                rw.ForeColor = Drawing.Color.Black
                rw.Font.Bold = False
            End If
        Next

        For Each rw As GridViewRow In grdManageBankAcc.Rows
            chkSelectManageBankAccMenu = rw.FindControl("chkSelectManageBankAccMenu")
            If chkSelectManageBankAccMenu.Checked = True Then
                chkSelectManageBankAccMenu.Checked = False
                rw.ForeColor = Drawing.Color.Black
                rw.Font.Bold = False
            End If
        Next

        For Each rw As GridViewRow In grdGeneralAdmin.Rows
            chkSelectGenAdminMenu = rw.FindControl("chkSelectGenAdminMenu")
            If chkSelectGenAdminMenu.Checked = True Then
                chkSelectGenAdminMenu.Checked = False
                rw.ForeColor = Drawing.Color.Black
                rw.Font.Bold = False
            End If
        Next

        For Each rw As GridViewRow In grdCandidatePool.Rows
            chkSelectCanPoolMenu = rw.FindControl("chkSelectCanPoolMenu")
            If chkSelectCanPoolMenu.Checked = True Then
                chkSelectCanPoolMenu.Checked = False
                rw.ForeColor = Drawing.Color.Black
                rw.Font.Bold = False
            End If
        Next

    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub drpRoleList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpRoleList.SelectedIndexChanged
        ClearMenuSelection()
        If drpRoleList.SelectedValue <> "N\A" Then

            Dim MenuIDList As String = RoleData.fnGetRoleWiseMenuIDs(drpRoleList.SelectedValue)
            GetMenuPermission(MenuIDList)
        Else

            MessageBox("Select Role Properly.")
            Exit Sub
        End If

    End Sub

End Class
