
Partial Class Payroll_frmEmpComponentEdit
    Inherits System.Web.UI.Page

    Dim EmpWiseComponentData As New clsEmpWiseComponentDataAccess()

    Protected Sub btnUpdateEmpComponent_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateEmpComponent.Click
        Dim EmpWiseComponent As New clsEmpWiseComponent()
        Dim EmpComponentID As String = Request.QueryString("EmpComponentID")

        EmpWiseComponent.EmpComponentID = EmpComponentID
        EmpWiseComponent.ComponentName = txtCompName.Text
        EmpWiseComponent.CompValue = txtCompValue.Text
        EmpWiseComponent.CompValDependentOn = drpCompDependency.SelectedValue
        EmpWiseComponent.CompRatio = Convert.ToDouble(txtCompRatio.Text)
        EmpWiseComponent.Consolidated = Convert.ToDouble(txtCompConsolidated.Text)

        If chkIsMonthlyComponent.Checked = True Then
            EmpWiseComponent.IsMonthlyComponent = True
        Else
            EmpWiseComponent.IsMonthlyComponent = False
        End If

        If chkIsGrossComponent.Checked = True Then
            EmpWiseComponent.IsGrossComponent = True
        Else
            EmpWiseComponent.IsGrossComponent = False
        End If

        If chkIsTaxable.Checked = True Then
            EmpWiseComponent.IsTaxable = True
        Else
            EmpWiseComponent.IsTaxable = False
        End If

        EmpWiseComponent.TaxExemptionLimit = txtTaxExemptionLimit.Text

        If chkIsActive.Checked = True Then
            EmpWiseComponent.IsActive = True
        Else
            EmpWiseComponent.IsActive = False
        End If

        EmpWiseComponent.CompState = drpCompState.SelectedValue

        Dim Check As Integer = EmpWiseComponentData.fnUpdateEmpWiseComponent(EmpWiseComponent)

        If Check = 1 Then
            MessageBox("Updated Successfully.")
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub btnCancelCompDefinition_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelCompDefinition.Click

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Try
                Dim EmpComponentID As String = Request.QueryString("EmpComponentID")

                Dim EmpWiseComponent As New clsEmpWiseComponent()
                EmpWiseComponent = EmpWiseComponentData.fnGetDetailsByEmpWiseComponentID(EmpComponentID)

                txtCompName.Text = EmpWiseComponent.ComponentName
                txtCompValue.Text = EmpWiseComponent.CompValue
                drpCompDependency.SelectedValue = EmpWiseComponent.CompValDependentOn
                txtCompRatio.Text = EmpWiseComponent.CompRatio
                txtCompConsolidated.Text = EmpWiseComponent.Consolidated

                If EmpWiseComponent.IsMonthlyComponent = True Then
                    chkIsMonthlyComponent.Checked = True
                Else
                    chkIsMonthlyComponent.Checked = False
                End If

                If EmpWiseComponent.IsGrossComponent = True Then
                    chkIsGrossComponent.Checked = True
                Else
                    chkIsGrossComponent.Checked = False
                End If

                If EmpWiseComponent.IsTaxable = True Then
                    chkIsTaxable.Checked = True
                Else
                    chkIsTaxable.Checked = False
                End If

                txtTaxExemptionLimit.Text = EmpWiseComponent.TaxExemptionLimit

                If EmpWiseComponent.IsActive = True Then
                    chkIsActive.Checked = True
                Else
                    chkIsActive.Checked = False
                End If

                drpCompState.SelectedValue = EmpWiseComponent.CompState

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
