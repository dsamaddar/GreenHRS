Imports System.Data

Partial Class Payroll_frmSalaryCalculator
    Inherits System.Web.UI.Page

    Dim RoleWiseComponentData As New clsRoleWiseComponentDataAccess()
    Dim CompData As New clsComponentDefinitionDataAccess()
   
    Protected Sub drpRoles_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpRoles.SelectedIndexChanged
        If drpRoles.SelectedValue <> "N\A" Then
            grdComponents.DataSource = RoleWiseComponentData.fnGetRoleWiseComponentsList(drpRoles.SelectedValue)
            grdComponents.DataBind()

            imgBtnAddComponents.Visible = True
        Else
            MessageBox("Select Proper Designation")
            ClearForm()
        End If
    End Sub

    Protected Sub ClearForm()
        grdComponents.DataSource = ""
        grdComponents.DataBind()

        imgBtnAddComponents.Visible = False
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowRoleComponents()
            imgBtnAddComponents.Visible = False

            Dim dtSalary As DataTable = New DataTable()
            dtSalary = FormatSalary()
            Session("dtSalary") = dtSalary

        End If
    End Sub

    Protected Sub ShowRoleComponents()
        drpRoles.DataTextField = "RoleName"
        drpRoles.DataValueField = "RoleComponentID"
        drpRoles.DataSource = RoleWiseComponentData.fnShowRoleComponents()
        drpRoles.DataBind()

        Dim A As New ListItem
        A.Text = "N\A"
        A.Value = "N\A"

        drpRoles.Items.Insert(0, A)
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub imgBtnAddComponents_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBtnAddComponents.Click

        Dim chkSelectComponent As New CheckBox
        Dim lblComponentID As New Label
        For Each rw As GridViewRow In grdComponents.Rows
            chkSelectComponent = rw.FindControl("chkSelectComponent")

            If chkSelectComponent.Checked = True Then
                lblComponentID = rw.FindControl("lblComponentID")
                AddComponent(lblComponentID.Text, Convert.ToDouble(txtBasicSalary.Text))
            End If
        Next

        Dim dtSalary As DataTable = New DataTable()
        dtSalary = Session("dtSalary")
        grdSelectedComponents.DataSource = dtSalary
        grdSelectedComponents.DataBind()

    End Sub

    Protected Function FormatSalary() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("CmpID", System.Type.GetType("System.String"))
        dt.Columns.Add("Component", System.Type.GetType("System.String"))
        dt.Columns.Add("SalaryValue", System.Type.GetType("System.Decimal"))
        Return dt
    End Function

    Protected Function AddComponent(ByVal ComponentID As String, ByVal BasicSalary As Double) As DataTable

        Dim dtSalary As DataTable = New DataTable()
        dtSalary = Session("dtSalary")

        Dim Comp As clsComponentDefinition = CompData.fnGetComponentDescription(ComponentID)

        '' Chq If Item Already Exists
        If ChqItemAlreadyExists(ComponentID) = 1 Then
            MessageBox("Component Already In The List.")
            Return dtSalary
        End If

        Dim dr As DataRow
        dr = dtSalary.NewRow()
        dr("CmpID") = Comp.ComponentID
        dr("Component") = Comp.ComponentName

        If Comp.CompState = "Positive" Then
            If Comp.CompValDependentOn = "Basic" Then
                dr("SalaryValue") = BasicSalary * (Comp.CompRatio / 100) + Comp.Consolidated
            Else
                dr("SalaryValue") = Comp.Consolidated
            End If
        ElseIf Comp.CompState = "Negative" Then
            If Comp.CompValDependentOn = "Basic" Then
                dr("SalaryValue") = -BasicSalary * (Comp.CompRatio / 100) + Comp.Consolidated
            Else
                dr("SalaryValue") = -Comp.Consolidated
            End If
        Else
            dr("SalaryValue") = 0
        End If

        dtSalary.Rows.Add(dr)
        dtSalary.AcceptChanges()
        Return dtSalary

    End Function

    Protected Function ChqItemAlreadyExists(ByVal ItemID As String) As Integer

        Dim dtSalary As DataTable = New DataTable()
        dtSalary = Session("dtSalary")

        Dim IsExists As Boolean = False
        Dim ExistingComponentID As String = ""

        For Each rw As DataRow In dtSalary.Rows
            ExistingComponentID = rw.Item("CmpID")

            If ExistingComponentID = ItemID Then
                IsExists = True
                Exit For
            End If
        Next

        If IsExists = True Then
            Return 1
        Else
            Return 0
        End If

    End Function

    Dim TotalSalary As Double = 0

    Protected Sub grdSelectedComponents_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdSelectedComponents.RowDataBound
        Dim lblSalaryValue As New Label
        If e.Row.RowType = DataControlRowType.DataRow Then
            lblSalaryValue = e.Row.FindControl("lblSalaryValue")
            TotalSalary += Convert.ToDouble(lblSalaryValue.Text)
        End If

        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(1).Text = "Total:"
            e.Row.Cells(2).Text = String.Format("{0:0,#.##}", TotalSalary.ToString())
        End If

    End Sub

    Protected Sub grdSelectedComponents_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grdSelectedComponents.RowDeleting
        Dim i As Integer
        Dim dtSalary As DataTable = New DataTable()

        dtSalary = Session("dtSalary")

        i = e.RowIndex
        dtSalary.Rows(i).Delete()
        dtSalary.AcceptChanges()

        Session("dtSalary") = dtSalary

        grdSelectedComponents.DataSource = dtSalary
        grdSelectedComponents.DataBind()
    End Sub

End Class
