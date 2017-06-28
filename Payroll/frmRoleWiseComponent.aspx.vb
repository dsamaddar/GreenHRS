
Partial Class Payroll_frmRoleWiseComponent
    Inherits System.Web.UI.Page

    Dim ComponentData As New clsComponentDefinitionDataAccess()
    Dim RoleWiseComponentData As New clsRoleWiseComponentDataAccess()

    Protected Sub btnAddRole_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddRole.Click

        Dim RoleWiseComponent As New clsRoleWiseComponent()
        Dim Components As String = ""
        Dim chkSelectComponent As New CheckBox
        Dim lblComponentID As New Label

        RoleWiseComponent.RoleName = txtRoleName.Text

        For Each rw As GridViewRow In grdComponents.Rows
            chkSelectComponent = rw.FindControl("chkSelectComponent")

            If chkSelectComponent.Checked = True Then
                lblComponentID = rw.FindControl("lblComponentID")
                Components += lblComponentID.Text + ","
            End If
        Next

        If Components = "" Then
            RoleWiseComponent.Components = Components
        Else
            Components = Components.Remove(Len(Components) - 1, 1)
            RoleWiseComponent.Components = Components
        End If

        RoleWiseComponent.EntryBy = Session("LoginUserID")

        Dim Check As Integer = RoleWiseComponentData.fnInsertRoleWiseComponent(RoleWiseComponent)

        If Check = 1 Then
            MessageBox(" Inserted Successfully. ")
            ClearForm()
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub ClearForm()
        txtRoleName.Text = ""
        Dim chkSelectComponent As New CheckBox
        For Each rw As GridViewRow In grdComponents.Rows
            chkSelectComponent = rw.FindControl("chkSelectComponent")
            chkSelectComponent.Checked = False
        Next

        btnAddRole.Visible = True
        btnUpdateRole.Visible = False

        ShowRoleComponents()

    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnUpdateRole_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateRole.Click
        Dim RoleWiseComponent As New clsRoleWiseComponent()
        Dim Components As String = ""
        Dim chkSelectComponent As New CheckBox
        Dim lblComponentID As New Label

        RoleWiseComponent.RoleComponentID = drpAvailableRoles.SelectedValue
        RoleWiseComponent.RoleName = txtRoleName.Text

        For Each rw As GridViewRow In grdComponents.Rows
            chkSelectComponent = rw.FindControl("chkSelectComponent")

            If chkSelectComponent.Checked = True Then
                lblComponentID = rw.FindControl("lblComponentID")
                Components += lblComponentID.Text + ","
            End If
        Next

        If Components = "" Then
            RoleWiseComponent.Components = Components
        Else
            Components = Components.Remove(Len(Components) - 1, 1)
            RoleWiseComponent.Components = Components
        End If

        Dim Check As Integer = RoleWiseComponentData.fnUpdateRoleWiseComponent(RoleWiseComponent)

        If Check = 1 Then
            MessageBox(" Updated Successfully. ")
            ClearForm()
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub ShowRoleComponents()
        drpAvailableRoles.DataTextField = "RoleName"
        drpAvailableRoles.DataValueField = "RoleComponentID"
        drpAvailableRoles.DataSource = RoleWiseComponentData.fnShowRoleComponents()
        drpAvailableRoles.DataBind()

        Dim A As New ListItem
        A.Text = "N\A"
        A.Value = "N\A"

        drpAvailableRoles.Items.Insert(0, A)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("LoginUserID") = "dsamaddar"
            ShowComponents()
            ShowRoleComponents()

            btnAddRole.Visible = True
            btnUpdateRole.Visible = False
        End If
    End Sub

    Protected Sub ShowComponents()
        grdComponents.DataSource = ComponentData.fnShowComponents()
        grdComponents.DataBind()
    End Sub

    Protected Sub drpAvailableRoles_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpAvailableRoles.SelectedIndexChanged

        Dim chkSelectComponent As New CheckBox
        For Each rw As GridViewRow In grdComponents.Rows
            chkSelectComponent = rw.FindControl("chkSelectComponent")
            chkSelectComponent.Checked = False
        Next

        If drpAvailableRoles.SelectedValue <> "N\A" Then
            Dim RWC As clsRoleWiseComponent = RoleWiseComponentData.fnGetRoleWiseComponents(drpAvailableRoles.SelectedValue)
            Dim lblComponentID As New Label
            txtRoleName.Text = RWC.RoleName

            For Each rw As GridViewRow In grdComponents.Rows
                lblComponentID = rw.FindControl("lblComponentID")

                If InStr(RWC.Components, lblComponentID.Text) Then
                    chkSelectComponent = rw.FindControl("chkSelectComponent")
                    chkSelectComponent.Checked = True
                End If
            Next

            btnAddRole.Visible = False
            btnUpdateRole.Visible = True

        Else
            ClearForm()
            btnAddRole.Visible = True
            btnUpdateRole.Visible = False
        End If
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearForm()
        drpAvailableRoles.SelectedIndex = -1
        btnAddRole.Visible = True
        btnUpdateRole.Visible = False
    End Sub

End Class
