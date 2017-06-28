
Partial Class Payroll_frmFuelPriceSettings
    Inherits System.Web.UI.Page

    Dim FuelPriceData As New clsFuelPriceDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetAllFuelPriceList()
            btnUpdateFuelPrice.Enabled = False
            btnInsertFuelPrice.Enabled = True
        End If
    End Sub

    Protected Sub GetAllFuelPriceList()
        grdFuelPriceList.DataSource = FuelPriceData.fnGetFuelPriceList()
        grdFuelPriceList.DataBind()
    End Sub

    Protected Sub btnInsertFuelPrice_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertFuelPrice.Click
        Dim FuelPrice As New clsFuelPrice()

        Try
            FuelPrice.EffectiveDate = Convert.ToDateTime(txtEffectiveDate.Text)
            FuelPrice.PricePerLtr = Convert.ToDouble(txtFuelPrice.Text)
            FuelPrice.EntryBy = Session("LoginUserID")

            Dim result As clsResult = FuelPriceData.fnInsertFuelPrice(FuelPrice)

            If result.Success = True Then
                ClearForm()
                GetAllFuelPriceList()
            End If

            MessageBox(result.Message)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
        

    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub ClearForm()

        txtEffectiveDate.Text = ""
        txtFuelPrice.Text = ""

        btnUpdateFuelPrice.Enabled = False
        btnInsertFuelPrice.Enabled = True

        hdFldFuelPriceID.Value = ""
        grdFuelPriceList.SelectedIndex = -1

    End Sub

    Protected Sub btnUpdateFuelPrice_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateFuelPrice.Click

        If hdFldFuelPriceID.Value = "" Then
            MessageBox("Select An Item First.")
            Exit Sub
        End If

        Dim FuelPrice As New clsFuelPrice()

        Try
            FuelPrice.FuelPriceID = hdFldFuelPriceID.Value
            FuelPrice.EffectiveDate = Convert.ToDateTime(txtEffectiveDate.Text)
            FuelPrice.PricePerLtr = Convert.ToDouble(txtFuelPrice.Text)
            FuelPrice.EntryBy = Session("LoginUserID")

            Dim result As clsResult = FuelPriceData.fnUpdateFuelPrice(FuelPrice)

            If result.Success = True Then
                ClearForm()
                GetAllFuelPriceList()
            End If

            MessageBox(result.Message)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearForm()
    End Sub

    Protected Sub grdFuelPriceList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdFuelPriceList.SelectedIndexChanged
        Dim lblFuelPriceID, lblDated, lblPricePerLtr As Label

        lblFuelPriceID = grdFuelPriceList.SelectedRow.FindControl("lblFuelPriceID")
        lblDated = grdFuelPriceList.SelectedRow.FindControl("lblDated")
        lblPricePerLtr = grdFuelPriceList.SelectedRow.FindControl("lblPricePerLtr")

        hdFldFuelPriceID.Value = lblFuelPriceID.Text
        txtEffectiveDate.Text = Convert.ToDateTime(lblDated.Text)
        txtFuelPrice.Text = lblPricePerLtr.Text

        btnUpdateFuelPrice.Enabled = True
        btnInsertFuelPrice.Enabled = False

    End Sub
End Class
