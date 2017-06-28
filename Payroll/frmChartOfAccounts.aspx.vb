
Partial Class Payroll_frmChartOfAccounts
    Inherits System.Web.UI.Page

    Dim COAData As New clsChartOfAccountsDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Session("LoginUserID") = "dsamaddar"
            GetAccountCodeList()
            GetDetailsCOAList()

            btnInsertLedgerName.Enabled = True
            btnUpdate.Enabled = False

        End If
    End Sub

    Protected Sub GetDetailsCOAList()
        grdCOAList.DataSource = COAData.fnGetDetailsLedgerCodeList()
        grdCOAList.DataBind()
    End Sub

    Protected Sub GetAccountCodeList()
        drpParentAccount.DataTextField = "LedgerName"
        drpParentAccount.DataValueField = "AccountCode"
        drpParentAccount.DataSource = COAData.fnGetLedgerList()
        drpParentAccount.DataBind()

        Dim A As New ListItem()
        A.Text = "N\A"
        A.Value = "N\A"

        drpParentAccount.Items.Insert(0, A)

    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnInsertLedgerName_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertLedgerName.Click

        Dim COA As New clsChartOfAccounts()

        COA.LedgerName = txtLedgerName.Text
        COA.ParentCode = drpParentAccount.SelectedValue
        COA.AccountCode = txtLedgerCode.Text
        If chkIsBankAccount.Checked = True Then
            COA.IsBankAccount = True
        Else
            COA.IsBankAccount = False
        End If
        COA.BalanceType = drpBalanceType.SelectedValue
        COA.EntryBy = Session("LoginUserID")
        Dim Result As clsResult = COAData.fnInsertChartOfAccounts(COA)

        If Result.Success = True Then
            ClearForm()
            GetAccountCodeList()
        End If

        MessageBox(Result.Message)


    End Sub

    Protected Sub ClearForm()
        hdFldAccountCode.Value = ""
        txtLedgerName.Text = ""
        txtLedgerCode.Text = ""
        drpBalanceType.SelectedIndex = -1
        drpParentAccount.SelectedIndex = -1
        chkIsBankAccount.Checked = False
        
        btnInsertLedgerName.Enabled = True
        btnUpdate.Enabled = False

        If grdCOAList.Rows.Count > 0 Then
            grdCOAList.SelectedIndex = -1
        End If

    End Sub

    Protected Sub btnCancelLedgerName_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelLedgerName.Click
        ClearForm()
    End Sub

  
    Protected Sub grdCOAList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdCOAList.SelectedIndexChanged
        Dim lblAccountCode, lblLedgerName, lblParentCode, lblIsBankAccount, lblBalanceType, lblEntryBy, lblEntryDate As New Label()

        lblAccountCode = grdCOAList.SelectedRow.FindControl("lblAccountCode")
        lblLedgerName = grdCOAList.SelectedRow.FindControl("lblLedgerName")
        lblParentCode = grdCOAList.SelectedRow.FindControl("lblParentCode")
        lblIsBankAccount = grdCOAList.SelectedRow.FindControl("lblIsBankAccount")
        lblBalanceType = grdCOAList.SelectedRow.FindControl("lblBalanceType")
        lblEntryBy = grdCOAList.SelectedRow.FindControl("lblEntryBy")
        lblEntryDate = grdCOAList.SelectedRow.FindControl("lblEntryDate")

        hdFldAccountCode.Value = lblAccountCode.Text
        txtLedgerName.Text = lblLedgerName.Text
        txtLedgerCode.Text = lblAccountCode.Text
        drpParentAccount.SelectedValue = lblParentCode.Text

        If lblBalanceType.Text = "Debit" Then
            drpBalanceType.SelectedValue = "D"
        Else
            drpBalanceType.SelectedValue = "C"
        End If

        If lblIsBankAccount.Text = "YES" Then
            chkIsBankAccount.Checked = True
        Else
            chkIsBankAccount.Checked = False
        End If

        btnInsertLedgerName.Enabled = False
        btnUpdate.Enabled = True


    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Dim COA As New clsChartOfAccounts()

        COA.AccountCodeID = hdFldAccountCode.Value
        COA.LedgerName = txtLedgerName.Text
        COA.ParentCode = drpParentAccount.SelectedValue
        COA.AccountCode = txtLedgerCode.Text

        If chkIsBankAccount.Checked = True Then
            COA.IsBankAccount = True
        Else
            COA.IsBankAccount = False
        End If
        COA.BalanceType = drpBalanceType.SelectedValue
        COA.EntryBy = Session("LoginUserID")
        Dim Result As clsResult = COAData.fnUpdateChartOfAccounts(COA)

        If Result.Success = True Then
            ClearForm()
            GetAccountCodeList()
            GetDetailsCOAList()
        End If

        MessageBox(Result.Message)
    End Sub
End Class
