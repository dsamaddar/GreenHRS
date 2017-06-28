
Partial Class Loan_frmBenefitTypeDefinition
    Inherits System.Web.UI.Page

    Dim COAData As New clsChartOfAccountsDataAccess()
    Dim BenefitTypeData As New clsBenefitTypeDataAccess()
    Dim EmpInfoData As New clsEmployeeInfoDataAccess()

    Protected Sub GetEmpList()
        drpEmployeeList.DataTextField = "EmployeeName"
        drpEmployeeList.DataValueField = "EmployeeID"
        drpEmployeeList.DataSource = EmpInfoData.fnGetEmployeeList()
        drpEmployeeList.DataBind()

        Dim A As New ListItem
        A.Text = "N\A"
        A.Value = "N\A"

        drpEmployeeList.Items.Insert(0, A)

        drpPrimaryApprover.DataTextField = "EmployeeName"
        drpPrimaryApprover.DataValueField = "EmployeeID"
        drpPrimaryApprover.DataSource = EmpInfoData.fnGetEmployeeList()
        drpPrimaryApprover.DataBind()

        Dim B As New ListItem
        B.Text = "N\A"
        B.Value = "N\A"

        drpPrimaryApprover.Items.Insert(0, B)

    End Sub


    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        Dim BenefitType As New clsBenefitType()

        BenefitType.BenefitType = txtBenefitType.Text
        BenefitType.BenefitCode = txtBenefitCode.Text
        BenefitType.AccountCode = drpAccountCodeList.SelectedValue
        BenefitType.InterestRate = Convert.ToDouble(txtInterestRate.Text)
        BenefitType.DepreciationYear = Convert.ToInt32(txtDepreciationYear.Text)

        If chkIsAbatementApplicable.Checked = True Then
            BenefitType.IsAbatementApplicable = True
        Else
            BenefitType.IsAbatementApplicable = False
        End If

        If chkIsAdjustableFromSalary.Checked = True Then
            BenefitType.IsAdjustableFromSalary = True
        Else
            BenefitType.IsAdjustableFromSalary = False
        End If

        If chkIsDepreciatePmntAutomatically.Checked = True Then
            BenefitType.IsDepreciatedAutomatically = True
        Else
            BenefitType.IsDepreciatedAutomatically = False
        End If

        If chkIsActive.Checked = True Then
            BenefitType.IsActive = True
        Else
            BenefitType.IsActive = False
        End If

        BenefitType.PrimaryApprover = drpPrimaryApprover.SelectedValue
        BenefitType.ApproverID = drpEmployeeList.SelectedValue
        BenefitType.EntryBy = Session("LoginUserID")

        Dim Result As clsResult = BenefitTypeData.fnInsertBenefitType(BenefitType)

        If Result.Success = True Then
            ClearForm()
            ShowBenefitTypeDetails()
        Else

        End If

        MessageBox(Result.Message)

    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Dim BenefitType As New clsBenefitType()

        BenefitType.BenefitTypeID = hdFldBenefitTypeID.Value
        BenefitType.BenefitType = txtBenefitType.Text
        BenefitType.BenefitCode = txtBenefitCode.Text
        BenefitType.AccountCode = drpAccountCodeList.SelectedValue
        BenefitType.InterestRate = Convert.ToDouble(txtInterestRate.Text)
        BenefitType.DepreciationYear = Convert.ToInt32(txtDepreciationYear.Text)

        If chkIsAbatementApplicable.Checked = True Then
            BenefitType.IsAbatementApplicable = True
        Else
            BenefitType.IsAbatementApplicable = False
        End If

        If chkIsAdjustableFromSalary.Checked = True Then
            BenefitType.IsAdjustableFromSalary = True
        Else
            BenefitType.IsAdjustableFromSalary = False
        End If

        If chkIsDepreciatePmntAutomatically.Checked = True Then
            BenefitType.IsDepreciatedAutomatically = True
        Else
            BenefitType.IsDepreciatedAutomatically = False
        End If

        If chkIsActive.Checked = True Then
            BenefitType.IsActive = True
        Else
            BenefitType.IsActive = False
        End If

        BenefitType.PrimaryApprover = drpPrimaryApprover.SelectedValue
        BenefitType.ApproverID = drpEmployeeList.SelectedValue
        BenefitType.EntryBy = Session("LoginUserID")

        Dim Result As clsResult = BenefitTypeData.fnUpdateBenefitType(BenefitType)

        If Result.Success = True Then
            ClearForm()
            ShowBenefitTypeDetails()
        Else

        End If

        MessageBox(Result.Message)
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearForm()
    End Sub

    Protected Sub ClearForm()
        txtBenefitType.Text = ""
        txtBenefitCode.Text = ""
        txtInterestRate.Text = ""
        txtDepreciationYear.Text = ""
        drpAccountCodeList.SelectedIndex = -1

        chkIsAdjustableFromSalary.Checked = False
        chkIsAbatementApplicable.Checked = False
        chkIsDepreciatePmntAutomatically.Checked = False
        chkIsActive.Checked = False

        btnSubmit.Enabled = True
        btnUpdate.Enabled = False

        If grdBenefitTypeDetails.Rows.Count > 0 Then
            grdBenefitTypeDetails.SelectedIndex = -1
        End If

        chkIsAdjustableFromSalary.Enabled = True
        chkIsAbatementApplicable.Enabled = True
        chkIsDepreciatePmntAutomatically.Enabled = True
        chkIsActive.Enabled = True

    End Sub

    Protected Sub ShowBenefitTypeDetails()
        grdBenefitTypeDetails.DataSource = BenefitTypeData.fnShowBenefitDetails()
        grdBenefitTypeDetails.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetAccountCodeList()
            ShowBenefitTypeDetails()
            GetEmpList()
            btnSubmit.Enabled = True
            btnUpdate.Enabled = False
        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

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

    Protected Sub grdBenefitTypeDetails_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdBenefitTypeDetails.SelectedIndexChanged

        Dim lblBenefitTypeID, lblBenefitType, lblBenefitCode, lblAccountCode, lblInterestRate, lblIsAdjustableFromSalary, lblIsAbatementApplicable, _
        lblIsDepreciatedAutomatically, lblIsActive, lblPrimaryApproverID, lblApproverID, lblEntryBy, lblDepreciationYear As New Label()

        lblBenefitTypeID = grdBenefitTypeDetails.SelectedRow.FindControl("lblBenefitTypeID")
        lblBenefitType = grdBenefitTypeDetails.SelectedRow.FindControl("lblBenefitType")
        lblBenefitCode = grdBenefitTypeDetails.SelectedRow.FindControl("lblBenefitCode")
        lblAccountCode = grdBenefitTypeDetails.SelectedRow.FindControl("lblAccountCode")
        lblInterestRate = grdBenefitTypeDetails.SelectedRow.FindControl("lblInterestRate")
        lblDepreciationYear = grdBenefitTypeDetails.SelectedRow.FindControl("lblDepreciationYear")

        lblIsAdjustableFromSalary = grdBenefitTypeDetails.SelectedRow.FindControl("lblIsAdjustableFromSalary")
        lblIsAbatementApplicable = grdBenefitTypeDetails.SelectedRow.FindControl("lblIsAbatementApplicable")
        lblIsDepreciatedAutomatically = grdBenefitTypeDetails.SelectedRow.FindControl("lblIsDepreciatedAutomatically")
        lblIsActive = grdBenefitTypeDetails.SelectedRow.FindControl("lblIsActive")
        lblPrimaryApproverID = grdBenefitTypeDetails.SelectedRow.FindControl("lblPrimaryApproverID")
        lblApproverID = grdBenefitTypeDetails.SelectedRow.FindControl("lblApproverID")
        lblEntryBy = grdBenefitTypeDetails.SelectedRow.FindControl("lblEntryBy")

        hdFldBenefitTypeID.Value = lblBenefitTypeID.Text
        txtBenefitType.Text = lblBenefitType.Text
        txtBenefitCode.Text = lblBenefitCode.Text
        drpAccountCodeList.SelectedValue = lblAccountCode.Text
        txtInterestRate.Text = lblInterestRate.Text
        txtDepreciationYear.Text = lblDepreciationYear.Text

        If lblIsAdjustableFromSalary.Text = "YES" Then
            chkIsAdjustableFromSalary.Checked = True
            chkIsDepreciatePmntAutomatically.Enabled = False
        Else
            chkIsAdjustableFromSalary.Checked = False
            chkIsDepreciatePmntAutomatically.Enabled = True
        End If

        If lblIsAbatementApplicable.Text = "YES" Then
            chkIsAbatementApplicable.Checked = True
        Else
            chkIsAbatementApplicable.Checked = False
        End If

        If lblIsDepreciatedAutomatically.Text = "YES" Then
            chkIsDepreciatePmntAutomatically.Checked = True
        Else
            chkIsDepreciatePmntAutomatically.Checked = False
        End If

        If lblIsActive.Text = "YES" Then
            chkIsActive.Checked = True
        Else
            chkIsActive.Checked = False
        End If

        drpPrimaryApprover.SelectedValue = lblPrimaryApproverID.Text
        drpEmployeeList.SelectedValue = lblApproverID.Text

        btnSubmit.Enabled = False
        btnUpdate.Enabled = True

    End Sub

    Protected Sub chkIsAdjustableFromSalary_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkIsAdjustableFromSalary.CheckedChanged
        If chkIsAdjustableFromSalary.Checked = True Then
            chkIsDepreciatePmntAutomatically.Checked = False
            chkIsDepreciatePmntAutomatically.Enabled = False
        Else
            chkIsDepreciatePmntAutomatically.Enabled = True
        End If
    End Sub

End Class
