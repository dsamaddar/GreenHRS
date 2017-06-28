
Partial Class Payroll_frmInputChallanNo
    Inherits System.Web.UI.Page

    Dim ChallanData As New clsChallanDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetAllChallanInfo()
            btnInsertChallan.Enabled = True
            btnUpdateChallan.Enabled = False
        End If
    End Sub

    Protected Sub GetAllChallanInfo()
        grdChallanNos.DataSource = ChallanData.fnGetAllChallanInfo()
        grdChallanNos.DataBind()
    End Sub

    Protected Sub btnInsertChallan_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertChallan.Click
        Dim Challan As New clsChallan()
        Try
            Challan.ChallanNo = txtChallanNo.Text
            Challan.ChallanDate = Convert.ToDateTime(txtChallanDate.Text)
            Challan.TDSAmount = Convert.ToDouble(txtTDSAmount.Text)
            Challan.TaxYear = drpTaxYear.SelectedValue
            Challan.EntryBy = Session("LoginUserID")

            Dim result As clsResult = ChallanData.fnInsertChallanNo(Challan)

            If result.Success = True Then
                GetAllChallanInfo()
                ClearForm()
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

    Protected Sub btnUpdateChallan_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateChallan.Click
        Dim Challan As New clsChallan()
        Dim lblChallanID As New Label

        If grdChallanNos.SelectedIndex = -1 Then
            MessageBox("Select A Row First.")
            Exit Sub
        End If

        Try
            lblChallanID = grdChallanNos.SelectedRow.FindControl("lblChallanID")
            Challan.ChallanID = lblChallanID.Text
            Challan.ChallanNo = txtChallanNo.Text
            Challan.TDSAmount = Convert.ToDouble(txtTDSAmount.Text)
            Challan.ChallanDate = Convert.ToDateTime(txtChallanDate.Text)
            Challan.TaxYear = drpTaxYear.SelectedValue
            Challan.EntryBy = Session("LoginUserID")
            Dim result As clsResult = ChallanData.fnUpdateChallanNo(Challan)

            If result.Success = True Then
                GetAllChallanInfo()
                ClearForm()
            End If
            MessageBox(result.Message)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
       
    End Sub

    Protected Sub grdChallanNos_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdChallanNos.SelectedIndexChanged

        Dim lblChallanNo, lblTDSAmount, lblChallanDate, lblTaxYear As New Label
        Try
            lblChallanNo = grdChallanNos.SelectedRow.FindControl("lblChallanNo")
            lblTDSAmount = grdChallanNos.SelectedRow.FindControl("lblTDSAmount")
            lblChallanDate = grdChallanNos.SelectedRow.FindControl("lblChallanDate")
            lblTaxYear = grdChallanNos.SelectedRow.FindControl("lblTaxYear")

            txtChallanNo.Text = lblChallanNo.Text
            txtChallanDate.Text = lblChallanDate.Text
            txtTDSAmount.Text = lblTDSAmount.Text
            drpTaxYear.SelectedValue = lblTaxYear.Text

            btnInsertChallan.Enabled = False
            btnUpdateChallan.Enabled = True
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ClearForm()
        txtChallanDate.Text = ""
        txtChallanNo.Text = ""
        txtTDSAmount.Text = ""

        btnInsertChallan.Enabled = True
        btnUpdateChallan.Enabled = False
        grdChallanNos.SelectedIndex = -1
    End Sub

End Class
