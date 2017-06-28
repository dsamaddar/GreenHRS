
Partial Class BankInfo_frmBankBranchInfo
    Inherits System.Web.UI.Page

    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()
    Dim BankData As New clsBankDataAccess()
    Dim BranchData As New clsBranchDataAccess()

    Protected Sub ShowBankName()
        drpSelectBank.DataTextField = "BankName"
        drpSelectBank.DataValueField = "BankID"
        drpSelectBank.DataSource = EmployeeInfoData.fnGetBankName()
        drpSelectBank.DataBind()

        drpAvailableBankInfo.DataTextField = "BankName"
        drpAvailableBankInfo.DataValueField = "BankID"
        drpAvailableBankInfo.DataSource = EmployeeInfoData.fnGetBankName()
        drpAvailableBankInfo.DataBind()

        Dim BankID As String

        BankID = drpSelectBank.SelectedValue
        ShowBranchName(BankID)
    End Sub


    Protected Sub ShowBranchName(ByVal BankID As String)
        drpAvailableBranch.DataTextField = "BranchName"
        drpAvailableBranch.DataValueField = "BranchID"
        drpAvailableBranch.DataSource = EmployeeInfoData.fnGetBranchName(BankID)
        drpAvailableBranch.DataBind()
    End Sub

    Protected Sub drpSelectBank_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSelectBank.SelectedIndexChanged
        Dim BankID As String
        BankID = drpSelectBank.SelectedValue
        ShowBranchName(BankID)
    End Sub

    Protected Sub btnInsertBank_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertBank.Click
        Dim Bank As New clsBank()

        Bank.BankName = txtBankName.Text
        If chkIsBankActive.Checked = True Then
            Bank.isActive = True
        Else
            Bank.isActive = False
        End If
        Bank.EntryBy = Session("LoginUserID")

        Dim check As Integer = BankData.fnInsertBank(Bank)

        If check = 1 Then
            MessageBox("Inserted Successfully.")
            ClearBankInfo()
            ShowBankName()
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub ClearBankInfo()
        txtBankName.Text = ""
        chkIsBankActive.Checked = False
    End Sub

    Protected Sub ClearBranchInfo()
        txtBranchName.Text = ""
        chkBranchIsActive.Checked = False
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnInsertBranchInfo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertBranchInfo.Click
        Dim Branch As New clsBranch()

        Branch.BankID = drpSelectBank.SelectedValue
        Branch.BranchName = txtBranchName.Text
        If chkBranchIsActive.Checked = True Then
            Branch.isActive = True
        Else
            Branch.isActive = False
        End If
        Branch.EntryBy = Session("LoginUserID")

        Dim Check As Integer = BranchData.fnInsertBranch(Branch)

        If Check = 1 Then
            MessageBox("Inserted Successfully.")
            ClearBranchInfo()
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowBankName()
        End If
    End Sub

    Protected Sub drpAvailableBankInfo_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpAvailableBankInfo.SelectedIndexChanged

    End Sub

End Class
