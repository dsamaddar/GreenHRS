
Partial Class EmployeeProfile_frmEmpLoanAmortizationInfo
    Inherits System.Web.UI.Page

    Dim LoanAmtzData As New clsLoanAmortizationData()
    Dim Pmnt As Double = 0
    Dim Prin As Double = 0
    Dim Interest As Double = 0
    Dim PrinAdjusted As Double = 0
    Dim IntAdjusted As Double = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim EmpLoanAccountID As String = Request.QueryString("EmpLoanAccountID")
            ShowAmortizationInfo(EmpLoanAccountID)
        End If
    End Sub

    Protected Sub ShowAmortizationInfo(ByVal EmpLoanAccountID As String)
        grdEmpLoanAmtzInfo.DataSource = LoanAmtzData.fnGetEmpLoanAmtzInfo(EmpLoanAccountID)
        grdEmpLoanAmtzInfo.DataBind()
    End Sub

    Protected Sub grdEmpLoanAmtzInfo_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdEmpLoanAmtzInfo.RowDataBound
        Dim lblPrincipalAdjusted, lblInterestAdjusted, lblPaymentAmount, lblPrincipalPayment, lblInterestPayment, lblPmntStatus As New Label

        If e.Row.RowType = DataControlRowType.DataRow Then
            lblPrincipalAdjusted = e.Row.FindControl("lblPrincipalAdjusted")
            lblInterestAdjusted = e.Row.FindControl("lblInterestAdjusted")
            lblPaymentAmount = e.Row.FindControl("lblPaymentAmount")
            lblPrincipalPayment = e.Row.FindControl("lblPrincipalPayment")
            lblInterestPayment = e.Row.FindControl("lblInterestPayment")
            lblPmntStatus = e.Row.FindControl("lblPmntStatus")

            Pmnt += Convert.ToDouble(lblPaymentAmount.Text)
            Prin += Convert.ToDouble(lblPrincipalPayment.Text)
            Interest += Convert.ToDouble(lblInterestPayment.Text)
            PrinAdjusted += Convert.ToDouble(lblPrincipalAdjusted.Text)
            IntAdjusted += Convert.ToDouble(lblInterestAdjusted.Text)

            If lblPmntStatus.Text = "Due" Or lblPmntStatus.Text = "Overdue" Then
                e.Row.Cells(12).ForeColor = Drawing.Color.Red
            ElseIf lblPmntStatus.Text = "Paid" Or lblPmntStatus.Text = "Depreciated" Then
                e.Row.Cells(12).ForeColor = Drawing.Color.Green
            End If

        End If

        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(3).Text = String.Format("{0:0,#.##}", Pmnt)
            e.Row.Cells(4).Text = String.Format("{0:0,#.##}", Prin)
            e.Row.Cells(5).Text = String.Format("{0:0,#.##}", Interest)
            e.Row.Cells(8).Text = "Total Collected:"
            e.Row.Cells(9).Text = String.Format("{0:0,#.##}", PrinAdjusted)
            e.Row.Cells(10).Text = String.Format("{0:0,#.##}", IntAdjusted)
        End If

    End Sub
End Class
