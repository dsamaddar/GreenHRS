
Partial Class Payroll_frmEarlySettlement
    Inherits System.Web.UI.Page

    Dim LoanData As New clsEmpLoanAccountDataAccess()
    Dim EmpInfoData As New clsEmployeeInfoDataAccess()

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        GetEmpLoanAccs()
    End Sub

    Protected Sub GetEmpLoanAccs()
        Try
            If drpEmpList.SelectedValue <> "N\A" Then
                grdEmpLoanAcc.DataSource = LoanData.fnGetAllApprovedLoanAccByEmpID(drpEmpList.SelectedValue)
                grdEmpLoanAcc.DataBind()
            Else
                MessageBox("Select An Employee First.")
            End If
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

    Protected Sub ListAllEmployees()
        drpEmpList.DataTextField = "EmployeeName"
        drpEmpList.DataValueField = "EmployeeID"
        drpEmpList.DataSource = EmpInfoData.fnGetEmployeeListAllForTaxCert()
        drpEmpList.DataBind()

        Dim A As New ListItem
        A.Text = "N\A"
        A.Value = "N\A"
        drpEmpList.Items.Insert(0, A)

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ListAllEmployees()
            txtSettlementDate.Text = Now.Date
            btnProcessSettlement.Enabled = False
        End If
    End Sub

    Protected Sub grdEmpLoanAcc_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdEmpLoanAcc.SelectedIndexChanged
        Try
            Dim lblOutstanding As New Label
            lblOutstanding = grdEmpLoanAcc.SelectedRow.FindControl("lblOutstanding")
            txtSettlementAmnt.Text = Convert.ToDouble(lblOutstanding.Text)
            btnProcessSettlement.Enabled = True
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnProcessSettlement_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcessSettlement.Click
        Dim EmpLoanAccount As New clsEmpLoanAccount()
        Dim lblEmpLoanAccountID, lblEmployeeID As New Label
        Try
            lblEmpLoanAccountID = grdEmpLoanAcc.SelectedRow.FindControl("lblEmpLoanAccountID")
            lblEmployeeID = grdEmpLoanAcc.SelectedRow.FindControl("lblEmployeeID")

            EmpLoanAccount.EmployeeID = lblEmployeeID.Text
            EmpLoanAccount.EmpLoanAccountID = lblEmpLoanAccountID.Text
            EmpLoanAccount.SettlementAmount = Convert.ToDouble(txtSettlementAmnt.Text)
            EmpLoanAccount.AdjustmentDate = Convert.ToDateTime(txtSettlementDate.Text)
            EmpLoanAccount.AdjustmentRemarks = txtRemarks.Text

            Dim Check As Integer = LoanData.fnLoanEarlySettlement(EmpLoanAccount)

            If Check = 1 Then
                ClearForm()
                MessageBox("Successfully Processed.")
            Else
                MessageBox("Error Found.")
            End If

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
       
    End Sub

    Protected Sub ClearForm()
        txtRemarks.Text = ""
        txtSettlementAmnt.Text = ""
        txtSettlementDate.Text = Now.Date
        GetEmpLoanAccs()
    End Sub

End Class
