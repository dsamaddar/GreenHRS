
Partial Class BankInfo_frmManageULCBankAccount
    Inherits System.Web.UI.Page

    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()
    Dim ULCBankAccData As New clsULCBankAccDataAccess()
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

    Protected Sub ClearForm()
        hdfldULCBankAccID.Value = ""
        drpSelectBank.SelectedIndex = -1
        ShowBranchName(drpSelectBank.SelectedValue)
        txtAccountNo.Text = ""
        txtAddressHouseNo.Text = ""
        txtAddressingPerson.Text = ""
        txtRoadNo.Text = ""
        txtAddressPost.Text = ""
        drpAccountType.SelectedIndex = -1
        chkIsActive.Checked = False

        btnUpdateBankAccount.Visible = False
        btnSubmitBankAccInfo.Visible = True

    End Sub

    Protected Sub btnSubmitBankAccInfo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmitBankAccInfo.Click

        Dim ULCBankAcc As New clsULCBankAccount()

        ULCBankAcc.BankID = drpSelectBank.SelectedValue
        ULCBankAcc.BranchID = drpBranchInfo.SelectedValue
        ULCBankAcc.AccountNo = txtAccountNo.Text
        ULCBankAcc.AccountType = drpAccountType.SelectedValue
        ULCBankAcc.AddressingPerson = txtAddressingPerson.Text
        ULCBankAcc.Address_HouseNo = txtAddressHouseNo.Text
        ULCBankAcc.Address_RoadNo = txtRoadNo.Text
        ULCBankAcc.Address_Post = txtAddressPost.Text
        ULCBankAcc.AccountCode = drpAccountCodeList.SelectedValue

        If chkIsActive.Checked = True Then
            ULCBankAcc.IsActive = True
        Else
            ULCBankAcc.IsActive = False
        End If

        ULCBankAcc.EntryBy = Session("LoginUserID")

        Dim Check As Integer = ULCBankAccData.fnInsertULCBankAccount(ULCBankAcc)

        If Check = 1 Then
            MessageBox("Bank Account Inserted.")
            ClearForm()
            ShowULCBankAccounts()
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

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearForm()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowBankName()
            ShowULCBankAccounts()
            ClearForm()
            btnUpdateBankAccount.Visible = False
            btnSubmitBankAccInfo.Visible = True
            GetAccountCodeList()
        End If
    End Sub

    Protected Sub ShowULCBankAccounts()
        grdBankAccounts.DataSource = ULCBankAccData.fnShowULCBankAcc()
        grdBankAccounts.DataBind()
    End Sub

    Protected Sub ShowBankName()
        drpSelectBank.DataTextField = "BankName"
        drpSelectBank.DataValueField = "BankID"
        drpSelectBank.DataSource = EmployeeInfoData.fnGetBankName()
        drpSelectBank.DataBind()

        Dim BankID As String

        BankID = drpSelectBank.SelectedValue
        ShowBranchName(BankID)
    End Sub


    Protected Sub ShowBranchName(ByVal BankID As String)
        drpBranchInfo.DataTextField = "BranchName"
        drpBranchInfo.DataValueField = "BranchID"
        drpBranchInfo.DataSource = EmployeeInfoData.fnGetBranchName(BankID)
        drpBranchInfo.DataBind()
    End Sub

    Protected Sub drpSelectBank_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSelectBank.SelectedIndexChanged
        Dim BankID As String
        BankID = drpSelectBank.SelectedValue
        ShowBranchName(BankID)
    End Sub

    Protected Sub grdBankAccounts_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdBankAccounts.SelectedIndexChanged

        Dim lblULCBankAccID, lblBankID, lblBranchID, lblAccountNo, lblAccountType, lblAddressingPerson, lblAddress_HouseNo, lblAddress_RoadNo, lblAddress_Post, lblActive, lblAccountCode As New Label

        lblULCBankAccID = grdBankAccounts.SelectedRow.FindControl("lblULCBankAccID")
        lblBankID = grdBankAccounts.SelectedRow.FindControl("lblBankID")
        lblBranchID = grdBankAccounts.SelectedRow.FindControl("lblBranchID")
        lblAccountNo = grdBankAccounts.SelectedRow.FindControl("lblAccountNo")
        lblAccountType = grdBankAccounts.SelectedRow.FindControl("lblAccountType")
        lblAddressingPerson = grdBankAccounts.SelectedRow.FindControl("lblAddressingPerson")
        lblAddress_HouseNo = grdBankAccounts.SelectedRow.FindControl("lblAddress_HouseNo")
        lblAddress_RoadNo = grdBankAccounts.SelectedRow.FindControl("lblAddress_RoadNo") '
        lblAddress_Post = grdBankAccounts.SelectedRow.FindControl("lblAddress_Post")
        lblActive = grdBankAccounts.SelectedRow.FindControl("lblActive")
        lblAccountCode = grdBankAccounts.SelectedRow.FindControl("lblAccountCode")

        hdfldULCBankAccID.Value = lblULCBankAccID.Text
        drpSelectBank.SelectedValue = lblBankID.Text

        Dim BankID As String

        BankID = drpSelectBank.SelectedValue
        ShowBranchName(BankID)

        drpBranchInfo.SelectedValue = lblBranchID.Text
        txtAccountNo.Text = lblAccountNo.Text
        drpAccountType.SelectedValue = lblAccountType.Text
        txtAddressingPerson.Text = lblAddressingPerson.Text
        txtAddressHouseNo.Text = lblAddress_HouseNo.Text
        txtRoadNo.Text = lblAddress_RoadNo.Text
        txtAddressPost.Text = lblAddress_Post.Text
        drpAccountCodeList.SelectedValue = lblAccountCode.Text

        If lblActive.Text = "YES" Then
            chkIsActive.Checked = True
        Else
            chkIsActive.Checked = False
        End If

        btnUpdateBankAccount.Visible = True
        btnSubmitBankAccInfo.Visible = False


    End Sub

    Protected Sub btnUpdateBankAccount_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateBankAccount.Click
        Dim ULCBankAcc As New clsULCBankAccount()

        If hdfldULCBankAccID.Value = "" Then
            MessageBox("Select An Account First.")
            Exit Sub
        End If

        ULCBankAcc.ULCBankAccID = hdfldULCBankAccID.Value
        ULCBankAcc.BankID = drpSelectBank.SelectedValue
        ULCBankAcc.BranchID = drpBranchInfo.SelectedValue
        ULCBankAcc.AccountNo = txtAccountNo.Text
        ULCBankAcc.AccountType = drpAccountType.SelectedValue
        ULCBankAcc.AddressingPerson = txtAddressingPerson.Text
        ULCBankAcc.Address_HouseNo = txtAddressHouseNo.Text
        ULCBankAcc.Address_RoadNo = txtRoadNo.Text
        ULCBankAcc.Address_Post = txtAddressPost.Text
        ULCBankAcc.AccountCode = drpAccountCodeList.SelectedValue

        If chkIsActive.Checked = True Then
            ULCBankAcc.IsActive = True
        Else
            ULCBankAcc.IsActive = False
        End If

        Dim Check As Integer = ULCBankAccData.fnUpdateULCBankAccount(ULCBankAcc)

        If Check = 1 Then
            MessageBox("Bank Account Updated.")
            ClearForm()
            ShowULCBankAccounts()
        Else
            MessageBox("Error Found.")
        End If
    End Sub
End Class
