Imports System.Data
Imports System
Imports System.Net.Mail

Partial Class Payroll_frmLoanApproval
    Inherits System.Web.UI.Page

    Dim LoanAppData As New clsLoanApplicationDataAccess()
    Dim BenefitTypeData As New clsBenefitTypeDataAccess()
    Dim AbatementRaioData As New clsAbatementRatioDataAccess()
    Dim EmpLoanData As New clsEmpLoanAccountDataAccess()
    Dim MobileBenefitData As New clsMobileBenefitDataAccess()
    Dim VehicleBenefitData As New clsVehicleBenefitDataAccess()
    Dim GenLoanData As New clsGeneralLoanDataAccess()

    Dim TotalPayment As Double = 0
    Dim TotalPrinciplePayment As Double = 0
    Dim TotalIntPayment As Double = 0
    Dim TotalAbatement As Double = 0

    Protected Function FormatAmortizationTable() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("PaymentDate", System.Type.GetType("System.DateTime"))
        dt.Columns.Add("PaymentAmount", System.Type.GetType("System.Double"))
        dt.Columns.Add("PrincipalPayment", System.Type.GetType("System.Double"))
        dt.Columns.Add("InterestPayment", System.Type.GetType("System.Double"))
        dt.Columns.Add("Abatement", System.Type.GetType("System.Double"))
        dt.Columns.Add("URPA", System.Type.GetType("System.Double"))
        Return dt
    End Function

    Protected Function FormatAbatementTable() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("AbatementMonth", System.Type.GetType("System.Decimal"))
        dt.Columns.Add("RateOfAbatement", System.Type.GetType("System.Double"))
        Return dt
    End Function

    Protected Sub btnMakeMobileSchedule_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMakeMobileSchedule.Click

        Session("VehicleSchedule") = ""

        Dim dtVehicleSchedule As DataTable = New DataTable()
        dtVehicleSchedule = FormatAmortizationTable()

        Dim IsAbatementApplicable As Boolean

        If chkIsAbatementApplicable.Checked = True Then
            IsAbatementApplicable = True
        Else
            IsAbatementApplicable = False
        End If
        'dtVehicleSchedule = MakeSchedule(Convert.ToDouble(txtMobileLoanAmntSch.Text), Convert.ToDateTime(txtMobileAmortizationStartDate.Text), Convert.ToDouble(txtMobileIntRate.Text), Convert.ToInt32(txtMobileDepreciationYear.Text), IsAbatementApplicable)
        dtVehicleSchedule = MakeScheduleForMonths(Convert.ToDouble(txtMobileLoanAmntSch.Text), Convert.ToDateTime(txtMobileAmortizationStartDate.Text), Convert.ToDouble(txtMobileIntRate.Text), Convert.ToInt32(txtMobileDepreciationYear.Text), IsAbatementApplicable)
        grdMobileSchedule.DataSource = dtVehicleSchedule
        grdMobileSchedule.DataBind()

        Session("VehicleSchedule") = dtVehicleSchedule

        btnFinalizeMobileAmortization.Enabled = True
    End Sub


    Protected Function MakeScheduleForMonths(ByVal LoanAmount As Double, ByVal AmortizationStartDate As DateTime, ByVal InterestRate As Double, ByVal NoOfMonth As Integer, ByVal IsAbatementApplicable As Boolean) As DataTable
        Dim dtVehicleSchedule As DataTable = New DataTable()
        dtVehicleSchedule = FormatAmortizationTable()

        Dim TotalAbatementPercentage As Double = 0
        Dim PaymentAmount, PrincipalPayment, InterestPayment, Abatement, URPA, DisbursedAmount, URPAL As Double
        PaymentAmount = 0
        PrincipalPayment = 0
        InterestPayment = 0
        Abatement = 0
        URPA = 0
        URPAL = 0
        DisbursedAmount = 0

        Dim dtAbatement As DataTable = New DataTable()
        dtAbatement = Session("Abatement")
        URPA = LoanAmount
        DisbursedAmount = LoanAmount

        If IsAbatementApplicable = True Then

            For Each rw As DataRow In dtAbatement.Rows
                If Convert.ToInt32(rw.Item("AbatementMonth")) <= NoOfMonth Then
                    TotalAbatementPercentage += rw.Item("RateOfAbatement")
                End If
            Next
            LoanAmount = LoanAmount - (LoanAmount * TotalAbatementPercentage * 0.01)
            URPAL = LoanAmount
            For i As Integer = 1 To NoOfMonth
                Dim dr As DataRow
                dr = dtVehicleSchedule.NewRow()
                AmortizationStartDate = AmortizationStartDate.AddMonths(1)
                dr("PaymentDate") = AmortizationStartDate

                PaymentAmount = Pmt((InterestRate / 12) * 0.01, NoOfMonth, -LoanAmount, 0, DueDate.EndOfPeriod)
                dr("PaymentAmount") = Math.Round(PaymentAmount, 2)

                InterestPayment = URPAL * ((InterestRate * 0.01) / 12)
                dr("InterestPayment") = Math.Round(InterestPayment, 2)

                PrincipalPayment = PaymentAmount - InterestPayment
                dr("PrincipalPayment") = Math.Round(PrincipalPayment, 2)

                If i Mod 12 = 0 Then
                    For Each rw As DataRow In dtAbatement.Rows
                        If rw.Item("AbatementMonth") = i Then
                            dr("Abatement") = Math.Round(Convert.ToDouble(rw.Item("RateOfAbatement")) * 0.01 * DisbursedAmount, 2)
                            Abatement = Math.Round(Convert.ToDouble(rw.Item("RateOfAbatement")) * 0.01 * DisbursedAmount, 2)
                        End If
                    Next

                Else
                    dr("Abatement") = 0
                    Abatement = 0
                End If

                URPA = URPA - PrincipalPayment - Abatement
                dr("URPA") = Math.Round(URPA, 2)
                URPAL = URPAL - PrincipalPayment
                dtVehicleSchedule.Rows.Add(dr)
                dtVehicleSchedule.AcceptChanges()

            Next

        Else '' EMI

            If chkIsLinearAmortization.Checked = True Then
                URPAL = LoanAmount
                LoanAmount = LoanAmount + ((LoanAmount * InterestRate * 0.01) * (NoOfMonth / 12))
                PaymentAmount = LoanAmount / NoOfMonth

                For i As Integer = 1 To NoOfMonth
                    Dim dr As DataRow
                    dr = dtVehicleSchedule.NewRow()
                    AmortizationStartDate = AmortizationStartDate.AddMonths(1)
                    dr("PaymentDate") = AmortizationStartDate

                    dr("PaymentAmount") = Math.Round(PaymentAmount, 2)

                    PrincipalPayment = URPAL / NoOfMonth
                    dr("PrincipalPayment") = Math.Round(PrincipalPayment, 2)

                    InterestPayment = PaymentAmount - PrincipalPayment
                    dr("InterestPayment") = Math.Round(InterestPayment, 2)


                    dr("Abatement") = 0

                    URPA = URPA - PrincipalPayment
                    dr("URPA") = Math.Round(URPA, 2)

                    dtVehicleSchedule.Rows.Add(dr)
                    dtVehicleSchedule.AcceptChanges()

                Next

            Else
                PaymentAmount = Pmt((InterestRate * 0.01) / 12, NoOfMonth, -LoanAmount, 0, DueDate.EndOfPeriod)

                For i As Integer = 1 To NoOfMonth
                    Dim dr As DataRow
                    dr = dtVehicleSchedule.NewRow()
                    AmortizationStartDate = AmortizationStartDate.AddMonths(1)
                    dr("PaymentDate") = AmortizationStartDate

                    dr("PaymentAmount") = Math.Round(PaymentAmount, 2)

                    InterestPayment = URPA * ((InterestRate * 0.01) / 12)
                    dr("InterestPayment") = Math.Round(InterestPayment, 2)

                    PrincipalPayment = PaymentAmount - InterestPayment
                    dr("PrincipalPayment") = Math.Round(PrincipalPayment, 2)

                    dr("Abatement") = 0

                    URPA = URPA - PrincipalPayment
                    dr("URPA") = Math.Round(URPA, 2)

                    dtVehicleSchedule.Rows.Add(dr)
                    dtVehicleSchedule.AcceptChanges()

                Next
            End If

        End If

        Return dtVehicleSchedule

    End Function

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Function MakeSchedule(ByVal LoanAmount As Double, ByVal AmortizationStartDate As DateTime, ByVal InterestRate As Double, ByVal DepreciationYear As Integer, ByVal IsAbatementApplicable As Boolean) As DataTable
        Dim dtVehicleSchedule As DataTable = New DataTable()
        dtVehicleSchedule = FormatAmortizationTable()

        Dim TotalAbatementPercentage As Double = 0
        Dim PaymentAmount, PrincipalPayment, InterestPayment, Abatement, URPA, DisbursedAmount, URPAL As Double
        PaymentAmount = 0
        PrincipalPayment = 0
        InterestPayment = 0
        Abatement = 0
        URPA = 0
        URPAL = 0
        DisbursedAmount = 0

        Dim dtAbatement As DataTable = New DataTable()
        dtAbatement = Session("Abatement")
        URPA = LoanAmount
        DisbursedAmount = LoanAmount

        If IsAbatementApplicable = True Then

            For Each rw As DataRow In dtAbatement.Rows
                If Convert.ToInt32(rw.Item("AbatementMonth")) <= DepreciationYear * 12 Then
                    TotalAbatementPercentage += rw.Item("RateOfAbatement")
                End If
            Next
            LoanAmount = LoanAmount - (LoanAmount * TotalAbatementPercentage * 0.01)
            URPAL = LoanAmount
            For i As Integer = 1 To DepreciationYear * 12
                Dim dr As DataRow
                dr = dtVehicleSchedule.NewRow()
                AmortizationStartDate = AmortizationStartDate.AddMonths(1)
                dr("PaymentDate") = AmortizationStartDate

                PaymentAmount = Pmt((InterestRate / 12) * 0.01, DepreciationYear * 12, -LoanAmount, 0, DueDate.EndOfPeriod)
                dr("PaymentAmount") = Math.Round(PaymentAmount, 2)

                InterestPayment = URPAL * ((InterestRate * 0.01) / 12)
                dr("InterestPayment") = Math.Round(InterestPayment, 2)

                PrincipalPayment = PaymentAmount - InterestPayment
                dr("PrincipalPayment") = Math.Round(PrincipalPayment, 2)

                If i Mod 12 = 0 Then
                    For Each rw As DataRow In dtAbatement.Rows
                        If rw.Item("AbatementMonth") = i Then
                            dr("Abatement") = Math.Round(Convert.ToDouble(rw.Item("RateOfAbatement")) * 0.01 * DisbursedAmount, 2)
                            Abatement = Math.Round(Convert.ToDouble(rw.Item("RateOfAbatement")) * 0.01 * DisbursedAmount, 2)
                        End If
                    Next

                Else
                    dr("Abatement") = 0
                    Abatement = 0
                End If

                URPA = URPA - PrincipalPayment - Abatement
                dr("URPA") = Math.Round(URPA, 2)
                URPAL = URPAL - PrincipalPayment
                dtVehicleSchedule.Rows.Add(dr)
                dtVehicleSchedule.AcceptChanges()

            Next

        Else '' EMI

            If chkIsLinearAmortization.Checked = True Then
                URPAL = LoanAmount
                LoanAmount = LoanAmount + ((LoanAmount * InterestRate * 0.01) * DepreciationYear)
                PaymentAmount = LoanAmount / (DepreciationYear * 12)

                For i As Integer = 1 To DepreciationYear * 12
                    Dim dr As DataRow
                    dr = dtVehicleSchedule.NewRow()
                    AmortizationStartDate = AmortizationStartDate.AddMonths(1)
                    dr("PaymentDate") = AmortizationStartDate

                    dr("PaymentAmount") = Math.Round(PaymentAmount, 2)

                    PrincipalPayment = URPAL / (DepreciationYear * 12)
                    dr("PrincipalPayment") = Math.Round(PrincipalPayment, 2)

                    InterestPayment = PaymentAmount - PrincipalPayment
                    dr("InterestPayment") = Math.Round(InterestPayment, 2)


                    dr("Abatement") = 0

                    URPA = URPA - PrincipalPayment
                    dr("URPA") = Math.Round(URPA, 2)

                    dtVehicleSchedule.Rows.Add(dr)
                    dtVehicleSchedule.AcceptChanges()

                Next

            Else
                PaymentAmount = Pmt((InterestRate * 0.01) / 12, DepreciationYear * 12, -LoanAmount, 0, DueDate.EndOfPeriod)

                For i As Integer = 1 To DepreciationYear * 12
                    Dim dr As DataRow
                    dr = dtVehicleSchedule.NewRow()
                    AmortizationStartDate = AmortizationStartDate.AddMonths(1)
                    dr("PaymentDate") = AmortizationStartDate

                    dr("PaymentAmount") = Math.Round(PaymentAmount, 2)

                    InterestPayment = URPA * ((InterestRate * 0.01) / 12)
                    dr("InterestPayment") = Math.Round(InterestPayment, 2)

                    PrincipalPayment = PaymentAmount - InterestPayment
                    dr("PrincipalPayment") = Math.Round(PrincipalPayment, 2)

                    dr("Abatement") = 0

                    URPA = URPA - PrincipalPayment
                    dr("URPA") = Math.Round(URPA, 2)

                    dtVehicleSchedule.Rows.Add(dr)
                    dtVehicleSchedule.AcceptChanges()

                Next
            End If

        End If

        Return dtVehicleSchedule

    End Function

    Protected Sub grdMobileSchedule_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdMobileSchedule.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim lblPaymentAmount As Label = CType(e.Row.FindControl("lblPaymentAmount"), Label)
            Dim lblPrincipalPayment As Label = CType(e.Row.FindControl("lblPrincipalPayment"), Label)
            Dim lblInterestPayment As Label = CType(e.Row.FindControl("lblInterestPayment"), Label)
            Dim lblAbatement As Label = CType(e.Row.FindControl("lblAbatement"), Label)

            TotalPayment = TotalPayment + Convert.ToDouble(lblPaymentAmount.Text)
            TotalPrinciplePayment = TotalPrinciplePayment + Convert.ToDouble(lblPrincipalPayment.Text)
            TotalIntPayment = TotalIntPayment + Convert.ToDouble(lblInterestPayment.Text)
            TotalAbatement += Convert.ToDouble(lblAbatement.Text)
        End If

        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(2).Text = String.Format("{0:n2}", Math.Round(TotalPayment, 2))
            e.Row.Cells(3).Text = String.Format("{0:n2}", Math.Round(TotalPrinciplePayment, 2))
            e.Row.Cells(4).Text = String.Format("{0:n2}", Math.Round(TotalIntPayment, 2))
            e.Row.Cells(5).Text = String.Format("{0:n2}", Math.Round(TotalAbatement, 2))
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetPendingLoanApproval()
            ShowAbatementRatio()

            Dim dtAbatement As DataTable = New DataTable()
            dtAbatement = FormatAbatementTable()

            dtAbatement = AbatementRaioData.fnShowAbatementRatio().Tables(0)
            Session("Abatement") = dtAbatement

            btnFinalizeMobileAmortization.Enabled = False

        End If
    End Sub

    Protected Sub GetPendingLoanApproval()
        grdAppliedLoanApplication.DataSource = LoanAppData.fnGetGetLoanAppForApproval()
        grdAppliedLoanApplication.DataBind()
    End Sub

    Protected Sub ShowAbatementRatio()
        grdMobileAbatement.DataSource = AbatementRaioData.fnShowAbatementRatio()
        grdMobileAbatement.DataBind()
    End Sub

    Protected Sub grdAppliedLoanApplication_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdAppliedLoanApplication.SelectedIndexChanged

        Dim lblBenefitTypeID, lblAmount, lblReimbursementDate As New Label()

        lblBenefitTypeID = grdAppliedLoanApplication.SelectedRow.FindControl("lblBenefitTypeID")
        lblAmount = grdAppliedLoanApplication.SelectedRow.FindControl("lblAmount")
        lblReimbursementDate = grdAppliedLoanApplication.SelectedRow.FindControl("lblReimbursementDate")

        Dim BenType As clsBenefitType = BenefitTypeData.fnGetBenefityTypeInfoByID(lblBenefitTypeID.Text)

        txtMobileAmortizationStartDate.Text = lblReimbursementDate.Text
        txtMobileLoanAmntSch.Text = lblAmount.Text
        txtMobileIntRate.Text = BenType.InterestRate
        txtMobileDepreciationYear.Text = BenType.DepreciationYear

        If BenType.IsAdjustableFromSalary = True Then
            chkIsAdjustableFromSalary.Checked = True
            chkIsDepreciatePmntAutomatically.Checked = False
            chkIsDepreciatePmntAutomatically.Enabled = False
        Else
            chkIsAdjustableFromSalary.Checked = False
            chkIsDepreciatePmntAutomatically.Enabled = True
        End If

        If BenType.IsDepreciatedAutomatically = True Then
            chkIsDepreciatePmntAutomatically.Checked = True
            chkIsAdjustableFromSalary.Checked = False
            chkIsAdjustableFromSalary.Enabled = False
        Else
            chkIsDepreciatePmntAutomatically.Checked = False
            chkIsAdjustableFromSalary.Enabled = True
        End If

        If BenType.IsAbatementApplicable = True Then
            chkIsAbatementApplicable.Checked = True
        Else
            chkIsAbatementApplicable.Checked = False
        End If

    End Sub

    Protected Sub chkIsAdjustableFromSalary_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkIsAdjustableFromSalary.CheckedChanged
        If chkIsAdjustableFromSalary.Checked = True Then
            chkIsDepreciatePmntAutomatically.Checked = False
            chkIsDepreciatePmntAutomatically.Enabled = False
        Else
            chkIsDepreciatePmntAutomatically.Enabled = True
        End If
    End Sub

    Protected Sub chkIsDepreciatePmntAutomatically_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkIsDepreciatePmntAutomatically.CheckedChanged
        If chkIsDepreciatePmntAutomatically.Checked = True Then
            chkIsAdjustableFromSalary.Checked = False
            chkIsAdjustableFromSalary.Enabled = False
        Else
            chkIsAdjustableFromSalary.Enabled = True
        End If

    End Sub

    Protected Sub chkIsAbatementApplicable_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkIsAbatementApplicable.CheckedChanged

        If chkIsAbatementApplicable.Checked = True Then
            grdMobileAbatement.Visible = True
        Else
            grdMobileAbatement.Visible = False
        End If

    End Sub

    Protected Sub btnFinalizeMobileAmortization_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFinalizeMobileAmortization.Click

        Dim Amortization As String = ""
        Dim EmpLoan As New clsEmpLoanAccount()

        Dim lblBenefitID, lblEmployeeID, lblBenefitTypeID As New Label()

        lblBenefitID = grdAppliedLoanApplication.SelectedRow.FindControl("lblBenefitID")
        lblEmployeeID = grdAppliedLoanApplication.SelectedRow.FindControl("lblEmployeeID")
        lblBenefitTypeID = grdAppliedLoanApplication.SelectedRow.FindControl("lblBenefitTypeID")

        Dim dtVehicleSchedule As DataTable = New DataTable()
        dtVehicleSchedule = FormatAmortizationTable()
        If lblBenefitID.Text = "" Then
            MessageBox("Select Benefit from the List")
            Exit Sub
        End If
        EmpLoan.EmployeeID = lblEmployeeID.Text
        EmpLoan.BenefitTypeID = lblBenefitTypeID.Text
        EmpLoan.BenefitID = lblBenefitID.Text
        EmpLoan.LoanAmount = Convert.ToDouble(txtMobileLoanAmntSch.Text)
        EmpLoan.Tenure = Convert.ToInt32(txtMobileDepreciationYear.Text)
        EmpLoan.InterestRate = Convert.ToDouble(txtMobileIntRate.Text)
        EmpLoan.ReimbursementDate = Convert.ToDateTime(txtMobileAmortizationStartDate.Text)

        If chkIsAdjustableFromSalary.Checked = True Then
            EmpLoan.IsAdjustableFromSalary = True
        Else
            EmpLoan.IsAdjustableFromSalary = False
        End If

        If chkIsAbatementApplicable.Checked = True Then
            EmpLoan.IsAbatementApplicable = True
        Else
            EmpLoan.IsAbatementApplicable = False
        End If

        If chkIsDepreciatePmntAutomatically.Checked = True Then
            EmpLoan.IsDepreciatedAutomatically = True
        Else
            EmpLoan.IsDepreciatedAutomatically = False
        End If

        dtVehicleSchedule = Session("VehicleSchedule")
        For Each rw As DataRow In dtVehicleSchedule.Rows
            Amortization = Amortization & rw.Item("PaymentDate") & "~" & rw.Item("PaymentAmount") & "~" & rw.Item("PrincipalPayment") & "~" & rw.Item("InterestPayment") & "~" & rw.Item("Abatement") & "~" & rw.Item("URPA") & "~|"
        Next

        EmpLoan.LoanStatus = "Active"
        EmpLoan.Amortization = Amortization
        EmpLoan.EntryBy = Session("LoginUserID")

        Dim Check As Integer = EmpLoanData.fnInsertEmpLoanAccount(EmpLoan)

        If Check = 1 Then
            MessageBox("Successful.")
            SendApprovalMail()
            ClearTotalForm()
            pnlMakeMobileSchedule.Visible = False
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub SendApprovalMail()
        Dim lblBenefitID, lblBenefitType As New Label()
        Dim MobileBenefit As New clsMobileBenefit()
        Dim VehicleBenefit As New clsVehicleBenefit()
        Dim GenLoan As New clsGeneralLoan()
        Dim MailProp As New clsMailProperty()
        Try
            lblBenefitID = grdAppliedLoanApplication.SelectedRow.FindControl("lblBenefitID")
            lblBenefitType = grdAppliedLoanApplication.SelectedRow.FindControl("lblBenefitType")

            If lblBenefitType.Text.Contains("Mobile") Then
                MobileBenefit.MobileBenefitID = lblBenefitID.Text
                MobileBenefit.PerformedByID = Session("UniqueUserID")
                MobileBenefit.Remarks = txtRemarks.Text
                MobileBenefit.EventName = "Approved"

                MailProp = MobileBenefitData.fnGetMobileBenefitMail(MobileBenefit)
                SendBenefitReqMail(MailProp)
            ElseIf lblBenefitType.Text.Contains("Vehicle") Then
                VehicleBenefit.VehicleBenefitID = lblBenefitID.Text
                VehicleBenefit.PerformedByID = Session("UniqueUserID")
                VehicleBenefit.Remarks = txtRemarks.Text
                VehicleBenefit.EventName = "Approved"

                MailProp = VehicleBenefitData.fnGetVehicleBenefitMail(VehicleBenefit)
                SendBenefitReqMail(MailProp)
            Else
                GenLoan.GenLoanID = lblBenefitID.Text
                GenLoan.PerformedByID = Session("UniqueUserID")
                GenLoan.Remarks = txtRemarks.Text
                GenLoan.EventName = "Approved"

                MailProp = GenLoanData.fnGetGenBenefitMail(GenLoan)
                SendBenefitReqMail(MailProp)
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ClearTotalForm()

        txtMobileAmortizationStartDate.Text = ""
        txtMobileDepreciationYear.Text = ""
        txtMobileIntRate.Text = ""
        txtMobileLoanAmntSch.Text = ""
        txtRemarks.Text = ""

        chkIsAdjustableFromSalary.Enabled = True
        chkIsAdjustableFromSalary.Checked = False

        chkIsAbatementApplicable.Enabled = True
        chkIsAbatementApplicable.Checked = False

        chkIsDepreciatePmntAutomatically.Enabled = True
        chkIsDepreciatePmntAutomatically.Checked = False

        grdMobileSchedule.DataSource = ""
        grdMobileSchedule.DataBind()

        If grdAppliedLoanApplication.Rows.Count > 0 Then
            grdAppliedLoanApplication.SelectedIndex = -1
        End If

        GetPendingLoanApproval()

        btnFinalizeMobileAmortization.Enabled = False


    End Sub

    Protected Sub btnCancelMobileAmortization_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelMobileAmortization.Click
        ClearTotalForm()
    End Sub

    Protected Sub btnReject_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReject.Click
        Dim LoanApp As New clsLoanApplication()
        Dim lblBenefitID, lblBenefitType As New Label()

        Dim MobileBenefit As New clsMobileBenefit()
        Dim VehicleBenefit As New clsVehicleBenefit()
        Dim GenLoan As New clsGeneralLoan()
        Dim MailProp As New clsMailProperty()

        If grdAppliedLoanApplication.SelectedIndex = -1 Then
            MessageBox("Select An Applicatoin First.")
            Exit Sub
        End If

        Try
            lblBenefitID = grdAppliedLoanApplication.SelectedRow.FindControl("lblBenefitID")
            lblBenefitType = grdAppliedLoanApplication.SelectedRow.FindControl("lblBenefitType")

            LoanApp.BenefitID = lblBenefitID.Text
            LoanApp.RecommendationRemarks = txtRemarks.Text
            LoanApp.LoanAppEvent = "Rejected"
            LoanApp.EntryBy = Session("LoginUserID")
            LoanApp.AppStatus = "Rejected"

            Dim Result As clsResult = LoanAppData.fnRecommendBenefit(LoanApp)

            If Result.Success = True Then

                If lblBenefitType.Text.Contains("Mobile") Then
                    MobileBenefit.MobileBenefitID = lblBenefitID.Text
                    MobileBenefit.PerformedByID = Session("UniqueUserID")
                    MobileBenefit.Remarks = txtRemarks.Text
                    MobileBenefit.EventName = "Rejected"

                    MailProp = MobileBenefitData.fnGetMobileBenefitMail(MobileBenefit)
                    SendBenefitReqMail(MailProp)
                ElseIf lblBenefitType.Text.Contains("Vehicle") Then
                    VehicleBenefit.VehicleBenefitID = lblBenefitID.Text
                    VehicleBenefit.PerformedByID = Session("UniqueUserID")
                    VehicleBenefit.Remarks = txtRemarks.Text
                    VehicleBenefit.EventName = "Rejected"

                    MailProp = VehicleBenefitData.fnGetVehicleBenefitMail(VehicleBenefit)
                    SendBenefitReqMail(MailProp)
                Else
                    GenLoan.GenLoanID = lblBenefitID.Text
                    GenLoan.PerformedByID = Session("UniqueUserID")
                    GenLoan.Remarks = txtRemarks.Text
                    GenLoan.EventName = "Rejected"

                    MailProp = GenLoanData.fnGetGenBenefitMail(GenLoan)
                    SendBenefitReqMail(MailProp)
                End If

                Result.Message = "Rejected " + Result.Message
                ClearTotalForm()
            End If

            MessageBox(Result.Message)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub SendBenefitReqMail(ByVal MailProp As clsMailProperty)
        Dim mail As New Net.Mail.MailMessage()
        Try
            mail.From = New MailAddress(MailProp.MailFrom)
            mail.To.Add(MailProp.MailTo)
            mail.CC.Add(MailProp.MailCC)
            mail.Bcc.Add(MailProp.MailBCC)
            mail.Subject = MailProp.MailSubject
            mail.Body = MailProp.MailBody
            mail.IsBodyHtml = True
            Dim smtp As New SmtpClient("192.168.1.232", 25)
            smtp.Send(mail)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub


End Class
