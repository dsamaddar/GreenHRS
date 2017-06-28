
Partial Class Payroll_frmComponentDefinition
    Inherits System.Web.UI.Page

    Dim ComponentData As New clsComponentDefinitionDataAccess()
    Dim COAData As New clsChartOfAccountsDataAccess()

    Protected Sub GetAccountCodeList()
        drpAccountCodeList.DataTextField = "LedgerName"
        drpAccountCodeList.DataValueField = "AccountCode"
        drpAccountCodeList.DataSource = COAData.fnGetLedgerList()
        drpAccountCodeList.DataBind()

        Dim A As New ListItem()
        A.Text = "N\A"
        A.Value = "N\A"

        drpAccountCodeList.Items.Insert(0, A)

    End Sub


    Protected Sub btnAddComponent_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddComponent.Click

        Dim Components As New clsComponentDefinition()

        Components.ComponentName = txtCompName.Text
        Components.ComponentCode = txtComponentCode.Text
        Components.CompValue = Convert.ToDouble(txtCompValue.Text)
        Components.CompValDependentOn = drpCompDependency.SelectedValue
        Components.CompRatio = Convert.ToDouble(txtCompRatio.Text)
        Components.Consolidated = Convert.ToDouble(txtCompConsolidated.Text)

        If chkIsGrossComponent.Checked = True Then
            Components.IsGrossComponent = True
        Else
            Components.IsGrossComponent = False
        End If

        If chkIsTaxable.Checked = True Then
            Components.IsTaxable = True
        Else
            Components.IsTaxable = False
        End If

        If chkIsMonthlyComponent.Checked = True Then
            Components.IsMonthlyComponent = True
        Else
            Components.IsMonthlyComponent = False
        End If

        Components.TaxExemptionLimit = Convert.ToDouble(txtTaxExemptionLimit.Text)
        Components.CompState = drpCompState.SelectedValue
        Components.AccountCode = drpAccountCodeList.SelectedValue
        Components.EntryBy = Session("LoginUserID")

        Dim Check As Integer = ComponentData.fnInsertComponents(Components)

        If Check = 1 Then
            MessageBox("Inserted Successfully.")
            ShowComponents()
            ClearForm()
        Else
            MessageBox("Error Found.")
        End If


    End Sub

    Protected Sub ClearForm()
        txtCompName.Text = ""
        txtComponentCode.Text = ""
        txtCompRatio.Text = ""
        txtCompValue.Text = ""
        txtCompConsolidated.Text = ""
        txtTaxExemptionLimit.Text = ""

        drpCompDependency.SelectedIndex = -1
        drpCompState.SelectedIndex = -1

        btnAddComponent.Visible = True
        btnUpdateComponent.Visible = False

        chkIsGrossComponent.Checked = False
        chkIsTaxable.Checked = False
        chkIsMonthlyComponent.Checked = False

        grdAvailableComponents.SelectedIndex = -1

    End Sub

    Protected Sub ShowComponents()
        grdAvailableComponents.DataSource = ComponentData.fnShowComponents()
        grdAvailableComponents.DataBind()
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnCancelCompDefinition_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelCompDefinition.Click
        ClearForm()
        ShowComponents()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowComponents()
            GetAccountCodeList()
            btnAddComponent.Visible = True
            btnUpdateComponent.Visible = False
        End If
    End Sub

    Protected Sub grdAvailableComponents_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdAvailableComponents.SelectedIndexChanged

        Dim lblComponentID, lblComponentName, lblComponentCode, lblCompValue, lblCompValDependentOn, lblCompRatio, lblConsolidated, lblTaxable, lblMonthlyComponent, lblTaxExemptionLimit, lblGrossComponent, lblCompState, lblAccountCode As New Label

        lblComponentID = grdAvailableComponents.SelectedRow.FindControl("lblComponentID")
        lblComponentName = grdAvailableComponents.SelectedRow.FindControl("lblComponentName")
        lblComponentCode = grdAvailableComponents.SelectedRow.FindControl("lblComponentCode")
        lblCompValue = grdAvailableComponents.SelectedRow.FindControl("lblCompValue")
        lblCompValDependentOn = grdAvailableComponents.SelectedRow.FindControl("lblCompValDependentOn")
        lblCompRatio = grdAvailableComponents.SelectedRow.FindControl("lblCompRatio")
        lblConsolidated = grdAvailableComponents.SelectedRow.FindControl("lblConsolidated")
        lblGrossComponent = grdAvailableComponents.SelectedRow.FindControl("lblGrossComponent")
        lblTaxable = grdAvailableComponents.SelectedRow.FindControl("lblTaxable")
        lblTaxExemptionLimit = grdAvailableComponents.SelectedRow.FindControl("lblTaxExemptionLimit")
        lblCompState = grdAvailableComponents.SelectedRow.FindControl("lblCompState")
        lblMonthlyComponent = grdAvailableComponents.SelectedRow.FindControl("lblMonthlyComponent")
        lblAccountCode = grdAvailableComponents.SelectedRow.FindControl("lblAccountCode")

        hdFldComponentID.Value = lblComponentID.Text
        txtCompName.Text = lblComponentName.Text
        txtComponentCode.Text = lblComponentCode.Text
        txtCompValue.Text = lblCompValue.Text
        drpCompDependency.SelectedValue = lblCompValDependentOn.Text
        txtCompRatio.Text = lblCompRatio.Text
        drpAccountCodeList.SelectedValue = lblAccountCode.Text
        txtCompConsolidated.Text = lblConsolidated.Text

        If lblGrossComponent.Text = "YES" Then
            chkIsGrossComponent.Checked = True
        Else
            chkIsGrossComponent.Checked = False
        End If

        If lblTaxable.Text = "YES" Then
            chkIsTaxable.Checked = True
        Else
            chkIsTaxable.Checked = False
        End If

        If lblMonthlyComponent.Text = "YES" Then
            chkIsMonthlyComponent.Checked = True
        Else
            chkIsMonthlyComponent.Checked = False
        End If

        txtTaxExemptionLimit.Text = lblTaxExemptionLimit.Text
        drpCompState.SelectedValue = lblCompState.Text
        btnAddComponent.Visible = False
        btnUpdateComponent.Visible = True

    End Sub

    Protected Sub btnUpdateComponent_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateComponent.Click
        Dim Components As New clsComponentDefinition()

        Components.ComponentID = hdFldComponentID.Value
        Components.ComponentName = txtCompName.Text
        Components.ComponentCode = txtComponentCode.Text
        Components.CompValue = Convert.ToDouble(txtCompValue.Text)
        Components.CompValDependentOn = drpCompDependency.SelectedValue
        Components.CompRatio = Convert.ToDouble(txtCompRatio.Text)
        Components.Consolidated = Convert.ToDouble(txtCompConsolidated.Text)
        If chkIsGrossComponent.Checked = True Then
            Components.IsGrossComponent = True
        Else
            Components.IsGrossComponent = False
        End If

        If chkIsTaxable.Checked = True Then
            Components.IsTaxable = True
        Else
            Components.IsTaxable = False
        End If

        If chkIsMonthlyComponent.Checked = True Then
            Components.IsMonthlyComponent = True
        Else
            Components.IsMonthlyComponent = False
        End If

        Components.TaxExemptionLimit = Convert.ToDouble(txtTaxExemptionLimit.Text)
        Components.CompState = drpCompState.SelectedValue
        Components.AccountCode = drpAccountCodeList.SelectedValue
        Components.EntryBy = Session("LoginUserID")

        Dim Check As Integer = ComponentData.fnUpdateComponents(Components)

        If Check = 1 Then
            MessageBox("Updated Successfully.")
            ShowComponents()
            ClearForm()
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub drpCompDependency_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpCompDependency.SelectedIndexChanged

        If drpCompDependency.SelectedValue = "Gross" Then
            chkIsGrossComponent.Checked = False
        End If

    End Sub

    Protected Sub chkIsGrossComponent_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkIsGrossComponent.CheckedChanged
        If chkIsGrossComponent.Checked = True Then
            If drpCompDependency.SelectedValue = "Gross" Then
                drpCompDependency.SelectedIndex = -1
            End If
        End If
    End Sub
End Class
