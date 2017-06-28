
Partial Class Payroll_frmEmpWiseETASettings
    Inherits System.Web.UI.Page

    Dim EmpData As New clsEmployeeInfoDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetOfficialDesignation()
            ShowBankName()
        End If
    End Sub

    Protected Sub GetOfficialDesignation()
        ddlOfficialDesignation.DataTextField = "DesignationName"
        ddlOfficialDesignation.DataValueField = "DesignationID"
        ddlOfficialDesignation.DataSource = EmpData.fnGetOfficialDesignation()
        ddlOfficialDesignation.DataBind()
    End Sub

    Protected Sub ddlBankName_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlBankName.SelectedIndexChanged
        ShowBranchName(ddlBankName.SelectedValue)
    End Sub

    Protected Sub ddlOfficialDesignation_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlOfficialDesignation.SelectedIndexChanged
        If grdEmployees.Rows.Count > 0 Then
            ClearForm()
        End If
        grdEmployees.DataSource = EmpData.fnGetEmpListByDesignation(ddlOfficialDesignation.SelectedValue)
        grdEmployees.DataBind()
    End Sub

    Protected Sub ClearForm()
        grdEmployees.SelectedIndex = -1

        txtAccountNo.Text = ""
        txtCarSubsidy.Text = ""
        txtDriverAllowance.Text = ""
        txtFuel.Text = ""
        txtVehicleMaintenance.Text = ""
        btnUpdate.Enabled = False
        chkIsEligible.Checked = False
    End Sub

    Protected Sub grdEmployees_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdEmployees.RowDataBound
        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(2).Text = "Total:" + grdEmployees.Rows.Count.ToString()
        End If
    End Sub

    Protected Sub grdEmployees_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdEmployees.SelectedIndexChanged
        Try
            Dim lblEmployeeID As New Label
            lblEmployeeID = grdEmployees.SelectedRow.FindControl("lblEmployeeID")

            Dim Emp As clsEmployeeInfo = EmpData.fnGetETAInfoByEmp(lblEmployeeID.Text)

            ddlBankName.SelectedValue = Emp.SecondaryBankID
            ShowBranchName(ddlBankName.SelectedValue)
            ddlBranchName.SelectedValue = Emp.SecondaryBranchID
            txtAccountNo.Text = Emp.SecondaryBankAccountNo
            txtCarSubsidy.Text = Emp.CarSubsidy
            txtDriverAllowance.Text = Emp.DriverAllowance
            txtFuel.Text = Emp.Fuel
            txtVehicleMaintenance.Text = Emp.VehicleMaintenance

            If Emp.IsEligibleForExternalTA = True Then
                chkIsEligible.Checked = True
            Else
                chkIsEligible.Checked = False
            End If

            btnUpdate.Enabled = True

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

    Protected Sub ShowBankName()
        ddlBankName.DataTextField = "BankName"
        ddlBankName.DataValueField = "BankID"
        ddlBankName.DataSource = EmpData.fnGetBankName()
        ddlBankName.DataBind()

        Dim BankID As String

        BankID = ddlBankName.SelectedValue
        ShowBranchName(BankID)
    End Sub

    Protected Sub ShowBranchName(ByVal BankID As String)
        ddlBranchName.DataTextField = "BranchName"
        ddlBranchName.DataValueField = "BranchID"
        ddlBranchName.DataSource = EmpData.fnGetBranchName(BankID)
        ddlBranchName.DataBind()
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearForm()
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Dim Emp As New clsEmployeeInfo()
        Try
            Dim lblEmployeeID As New Label
            lblEmployeeID = grdEmployees.SelectedRow.FindControl("lblEmployeeID")

            Emp.EmployeeID = lblEmployeeID.Text
            Emp.SecondaryBankID = ddlBankName.SelectedValue
            Emp.SecondaryBranchID = ddlBranchName.SelectedValue
            Emp.SecondaryBankAccountNo = txtAccountNo.Text
            Emp.Fuel = Convert.ToInt32(txtFuel.Text)
            Emp.DriverAllowance = Convert.ToDouble(txtDriverAllowance.Text)
            Emp.VehicleMaintenance = Convert.ToDouble(txtVehicleMaintenance.Text)
            Emp.CarSubsidy = Convert.ToDouble(txtCarSubsidy.Text)

            If chkIsEligible.Checked = True Then
                Emp.IsEligibleForExternalTA = True
            Else
                Emp.IsEligibleForExternalTA = False
            End If

            Dim res As clsResult = EmpData.fnUpdateETAInfoByEmp(Emp)

            If res.Success = True Then
                ClearForm()
            End If
            MessageBox(res.Message)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

End Class
