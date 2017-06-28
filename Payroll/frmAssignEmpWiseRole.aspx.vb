
Partial Class Payroll_frmAssignEmpWiseRole
    Inherits System.Web.UI.Page

    Dim RegisterData As New clsRegisterDataAccess()
    Dim DeptData As New clsDepartmentDataAccess()

    Dim EmployeeData As New clsEmpBasicProfileDataAccess()
    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()
    Dim RoleWiseComponentData As New clsRoleWiseComponentDataAccess()
    Dim EmpWiseComponentData As New clsEmpWiseComponentDataAccess()

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        Dim OrgSrchStr As New clsSearchOrgStructure()

        If drpSelectDesignation.SelectedIndex = 0 Then
            OrgSrchStr.DesignationID = "N\A"
        Else
            OrgSrchStr.DesignationID = drpSelectDesignation.SelectedValue
        End If

        If ddlDepartment.SelectedIndex = 0 Then
            OrgSrchStr.DepartmentID = "N\A"
        Else
            OrgSrchStr.DepartmentID = ddlDepartment.SelectedValue
        End If

        If drpULCBranch.SelectedIndex = 0 Then
            OrgSrchStr.ULCBranchID = "N\A"
        Else
            OrgSrchStr.ULCBranchID = drpULCBranch.SelectedValue
        End If

        If rdbtnGender.SelectedIndex = -1 Then
            OrgSrchStr.Gender = "N\A"
        Else
            OrgSrchStr.Gender = rdbtnGender.SelectedValue
        End If

        OrgSrchStr.BloodGroupID = ddlBloodGrp.SelectedValue
        OrgSrchStr.PerDistrict = Convert.ToInt32(ddlPerDistrict.SelectedValue)

        grdEmployeeList.DataSource = RegisterData.fnGetEmpUserListByDept(OrgSrchStr)
        grdEmployeeList.DataBind()
    End Sub

    Protected Sub ShowRoleComponents()
        grdAvailableRole.DataSource = RoleWiseComponentData.fnShowRoleComponents()
        grdAvailableRole.DataBind()
    End Sub


    Protected Sub ShowULCBranch()
        drpULCBranch.DataTextField = "ULCBranchName"
        drpULCBranch.DataValueField = "ULCBranchID"
        drpULCBranch.DataSource = EmployeeInfoData.fnGetULCBranch()
        drpULCBranch.DataBind()

        Dim A As New ListItem()
        A.Text = "N\A"
        A.Value = "N\A"
        drpULCBranch.Items.Insert(0, A)
    End Sub

    Protected Sub ShowDesignationOfficial()
        drpSelectDesignation.DataTextField = "DesignationName"
        drpSelectDesignation.DataValueField = "DesignationID"
        drpSelectDesignation.DataSource = EmployeeInfoData.fnGetOfficialDesignation()
        drpSelectDesignation.DataBind()

        Dim A As New ListItem()
        A.Text = "N\A"
        A.Value = "N\A"
        drpSelectDesignation.Items.Insert(0, A)

    End Sub

    Protected Sub getBloodGroup()
        ddlBloodGrp.DataTextField = "BloodGroupName"
        ddlBloodGrp.DataValueField = "BloodGroupID"
        ddlBloodGrp.DataSource = EmployeeData.fnGetBloodGroup()
        ddlBloodGrp.DataBind()

        Dim A As New ListItem()
        A.Text = "N\A"
        A.Value = "N\A"
        ddlBloodGrp.Items.Insert(0, A)

    End Sub

    Protected Sub geDistrictName()
        ddlPerDistrict.DataTextField = "DistrictName"
        ddlPerDistrict.DataValueField = "DistrictID"
        ddlPerDistrict.DataSource = EmployeeData.getDistrictName()
        ddlPerDistrict.DataBind()

        Dim A As New ListItem()
        A.Text = "N\A"
        A.Value = "0"
        ddlPerDistrict.Items.Insert(0, A)

    End Sub

    Protected Sub ShowDepertment()
        ddlDepartment.DataTextField = "DeptName"
        ddlDepartment.DataValueField = "DepartmentID"
        ddlDepartment.DataSource = DeptData.fnGetDeptList()
        ddlDepartment.DataBind()
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowULCBranch()
            ShowDepertment()
            geDistrictName()
            getBloodGroup()
            ShowDesignationOfficial()
            ShowDesignationOfficial()
            ShowRoleComponents()

            Session("LoginUserID") = "dsamaddar"
        End If
    End Sub

    Protected Sub grdAvailableRole_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdAvailableRole.SelectedIndexChanged
        Dim lblAvailableRoleComponentID As New Label
        Try
            lblAvailableRoleComponentID = grdAvailableRole.SelectedRow.FindControl("lblAvailableRoleComponentID")

            grdComponents.DataSource = RoleWiseComponentData.fnGetRoleWiseComponentsList(lblAvailableRoleComponentID.Text)
            grdComponents.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnAssignRole_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAssignRole.Click

        Dim ComponentIDList As String = ""
        Dim chkRoleComponents As New CheckBox
        Dim lblComponentID, lblAssignedComponentID, lblUniqueUserID, lblAvailableRoleComponentID, lblIsActive As New Label
        Dim EmpWiseComponent As New clsEmpWiseComponent()

        For Each rw As GridViewRow In grdComponents.Rows
            chkRoleComponents = rw.FindControl("chkRoleComponents")
            If chkRoleComponents.Checked = True Then
                lblComponentID = rw.FindControl("lblComponentID")
                If grdAssignedRole.Rows.Count > 0 Then
                    For Each rwI As GridViewRow In grdAssignedRole.Rows
                        lblAssignedComponentID = rwI.FindControl("lblAssignedComponentID")
                        lblIsActive = rwI.FindControl("lblIsActive")
                        If lblAssignedComponentID.Text = lblComponentID.Text And lblIsActive.Text = "YES" Then
                            chkRoleComponents.Checked = False
                            lblErrorMessage.Text = "Some/All of the Selected Components Are Already Assigned."
                            Exit For
                        End If

                    Next
                Else
                    Exit For
                End If
                
            End If
        Next

        For Each rw As GridViewRow In grdComponents.Rows
            chkRoleComponents = rw.FindControl("chkRoleComponents")
            If chkRoleComponents.Checked = True Then
                lblComponentID = rw.FindControl("lblComponentID")
                ComponentIDList &= lblComponentID.Text + ","
            End If
        Next

        If ComponentIDList = "" Then
            MessageBox("No Component Is Selected.")
            Exit Sub
        Else
            ComponentIDList = ComponentIDList.Remove(Len(ComponentIDList) - 1, 1)
        End If

        If grdEmployeeList.SelectedIndex = -1 Then
            MessageBox("Select An Employee First.")
            Exit Sub
        End If

        If grdAvailableRole.SelectedIndex = -1 Then
            MessageBox("Select A Role To Assign.")
            Exit Sub
        End If

        lblUniqueUserID = grdEmployeeList.SelectedRow.FindControl("lblUniqueUserID")
        EmpWiseComponent.EmployeeID = lblUniqueUserID.Text

        lblAvailableRoleComponentID = grdAvailableRole.SelectedRow.FindControl("lblAvailableRoleComponentID")
        EmpWiseComponent.RoleComponentID = lblAvailableRoleComponentID.Text
        EmpWiseComponent.ComponentIDList = ComponentIDList

        EmpWiseComponent.EntryBy = Session("LoginUserID")

        Dim Check As Integer = EmpWiseComponentData.fnInsertEmployeeWiseComponents(EmpWiseComponent)

        If Check = 1 Then
            MessageBox("Assigned Successfully.")
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

    Protected Sub ClearForm()

        Dim chkRoleComponents As New CheckBox
        For Each rw As GridViewRow In grdComponents.Rows
            chkRoleComponents = rw.FindControl("chkRoleComponents")
            chkRoleComponents.Checked = False
        Next

        GetEmpWiseComponent()

    End Sub

    Protected Sub btnCancelAssign_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelAssign.Click

    End Sub

    Protected Sub grdEmployeeList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdEmployeeList.SelectedIndexChanged
        GetEmpWiseComponent()
        ClearLoanSelection()
    End Sub

    Protected Sub ClearLoanSelection()
        grdComponents.DataSource = ""
        grdComponents.DataBind()

        If grdAvailableRole.Rows.Count > 0 Then
            grdAvailableRole.SelectedIndex = -1
        End If

    End Sub

    Protected Sub GetEmpWiseComponent()
        Dim lblUniqueUserID As New Label
        lblUniqueUserID = grdEmployeeList.SelectedRow.FindControl("lblUniqueUserID")

        grdAssignedRole.DataSource = EmpWiseComponentData.fnShowEmpWiseComponents(lblUniqueUserID.Text)
        grdAssignedRole.DataBind()
    End Sub

    Protected Sub grdEmployeeList_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdEmployeeList.RowDataBound
        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(2).Text = grdEmployeeList.Rows.Count.ToString()
        End If
    End Sub

    Protected Sub grdAssignedRole_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdAssignedRole.RowDataBound

        Dim lblIsActive As New Label
        If e.Row.RowType = DataControlRowType.DataRow Then
            lblIsActive = e.Row.FindControl("lblIsActive")
            If lblIsActive.Text = "NO" Then
                e.Row.Font.Bold = True
                e.Row.BackColor = Drawing.Color.OrangeRed
            End If
        End If
    End Sub

End Class
