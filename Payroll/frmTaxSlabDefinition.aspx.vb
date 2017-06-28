
Partial Class Payroll_frmTaxSlabDefinition
    Inherits System.Web.UI.Page

    Dim TaxRateData As New clsTaxRateDataAccess()

    Protected Sub btnInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsert.Click

        Dim TaxRate As New clsTaxRate()

        Try
            TaxRate.Value = Convert.ToDouble(txtValueAmount.Text)
            TaxRate.Gender = drpGender.SelectedValue
            TaxRate.Rate = Convert.ToDouble(txtTaxRate.Text)
            TaxRate.RateOrder = Convert.ToInt32(drpRateOrder.SelectedValue)
            TaxRate.AgeLimit = drpAgeLimit.SelectedValue
            TaxRate.TaxText = txtTaxText.Text
            TaxRate.TaxYear = drpTaxYear.SelectedValue
            TaxRate.EntryBy = Session("LoginUserID")

            Dim result As clsResult = TaxRateData.fnInsertTaxRate(TaxRate)

            If result.Success = True Then
                ClearForm()
                GetTaxSlabDetails()
            End If

            MessageBox(result.Message)

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub ClearForm()
        txtTaxRate.Text = ""
        txtTaxText.Text = ""
        txtValueAmount.Text = 0

        grdTaxSlab.SelectedIndex = -1

        btnInsert.Enabled = True
        btnUpdate.Enabled = False
        hdFldTaxSlabID.Value = ""

    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click

        If hdFldTaxSlabID.Value = "" Then
            MessageBox("Select An Item From The Grid First.")
            Exit Sub
        End If

        Dim TaxRate As New clsTaxRate()
        Try
            TaxRate.SLNo = Convert.ToInt32(hdFldTaxSlabID.Value)
            TaxRate.Value = Convert.ToDouble(txtValueAmount.Text)
            TaxRate.Gender = drpGender.SelectedValue
            TaxRate.Rate = Convert.ToDouble(txtTaxRate.Text)
            TaxRate.RateOrder = Convert.ToInt32(drpRateOrder.SelectedValue)
            TaxRate.AgeLimit = drpAgeLimit.SelectedValue
            TaxRate.TaxText = txtTaxText.Text
            TaxRate.TaxYear = drpTaxYear.SelectedValue
            TaxRate.EntryBy = Session("LoginUserID")

            Dim result As clsResult = TaxRateData.fnUpdateTaxSlab(TaxRate)

            If result.Success = True Then
                ClearForm()
                GetTaxSlabDetails()
            End If

            MessageBox(result.Message)

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearForm()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim MenuIDs As String

        MenuIDs = Session("PermittedMenus")

        If InStr(MenuIDs, "TaxSlabDef~") = 0 Then
            Response.Redirect("~\frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            Try

                GetTaxSlabDetails()

                If Now.Month <= 6 Then
                    drpTaxYear.SelectedValue = DateAdd(DateInterval.Year, -1.0, Now.Date).Year.ToString() + "-" + Now.Year.ToString()
                Else
                    drpTaxYear.SelectedValue = Now.Year.ToString() + "-" + DateAdd(DateInterval.Year, 1.0, Now.Date).Year.ToString()
                End If

                btnInsert.Enabled = True
                btnUpdate.Enabled = False

            Catch ex As Exception
                MessageBox(ex.Message)
            End Try

        End If
    End Sub

    Protected Sub GetTaxSlabDetails()
        grdTaxSlab.DataSource = TaxRateData.fnGetDetailsTaxSlabInfo()
        grdTaxSlab.DataBind()
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub grdTaxSlab_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdTaxSlab.SelectedIndexChanged

        Dim lblSLNo, lblValue, lblGender, lblRate, lblRateOrder, lblAgeLimit, lblTaxText, lblTaxYear As New Label

        Try
            lblSLNo = grdTaxSlab.SelectedRow.FindControl("lblSLNo")
            lblValue = grdTaxSlab.SelectedRow.FindControl("lblValue")
            lblGender = grdTaxSlab.SelectedRow.FindControl("lblGender")
            lblRate = grdTaxSlab.SelectedRow.FindControl("lblRate")
            lblRateOrder = grdTaxSlab.SelectedRow.FindControl("lblRateOrder")
            lblAgeLimit = grdTaxSlab.SelectedRow.FindControl("lblAgeLimit")
            lblTaxText = grdTaxSlab.SelectedRow.FindControl("lblTaxText")
            lblTaxYear = grdTaxSlab.SelectedRow.FindControl("lblTaxYear")

            hdFldTaxSlabID.Value = lblSLNo.Text
            txtValueAmount.Text = Convert.ToDouble(lblValue.Text)
            drpGender.SelectedValue = lblGender.Text
            txtTaxRate.Text = Convert.ToDouble(lblRate.Text)
            drpRateOrder.SelectedValue = lblRateOrder.Text
            drpAgeLimit.SelectedValue = lblAgeLimit.Text
            txtTaxText.Text = lblTaxText.Text
            drpTaxYear.SelectedValue = lblTaxYear.Text

            btnInsert.Enabled = False
            btnUpdate.Enabled = True

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

End Class
