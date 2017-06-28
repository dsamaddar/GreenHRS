Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Partial Class Payroll_frmEmpWiseSalary
    Inherits System.Web.UI.Page

    Dim EmpSalData As New clsEmpSalaryDataAccess()
    Dim EmpSalSummaryData As New clsEmpSalSummaryDataAccess()
    Dim EmpInfoData As New clsEmployeeInfoDataAccess()
    Dim TaxAdvData As New clsTaxAdvanceDataAccess()
    Dim TotalPositiveComponent As Double = 0
    Dim TotalNegativeComponent As Double = 0
    Dim TotalHiddenComponent As Double = 0

    Protected Sub btnViewSalaryInfo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnViewSalaryInfo.Click

        Dim EmpSal As New clsEmpSalary()
        Dim EmpSalSummary As New clsEmpSalSummary()

        Try
            EmpSal.EmployeeID = drpEmployeeList.SelectedValue
            EmpSal.SalaryYear = Convert.ToInt32(drpSalaryYear.SelectedValue)
            EmpSal.SalaryMonth = Convert.ToInt32(drpSalaryMonth.SelectedValue)

            EmpSal.CompStatus = "Positive"

            grdPositiveComponent.DataSource = EmpSalData.fnShowEmpSalaryByCompStatus(EmpSal)
            grdPositiveComponent.DataBind()

            EmpSal.CompStatus = "Negative"
            grdNegativeComponent.DataSource = EmpSalData.fnShowEmpSalaryByCompStatus(EmpSal)
            grdNegativeComponent.DataBind()

            EmpSal.CompStatus = "Hidden"
            grdHiddenComponent.DataSource = EmpSalData.fnShowEmpSalaryByCompStatus(EmpSal)
            grdHiddenComponent.DataBind()

            EmpSal.CompStatus = "Bonus"
            grdBonusComponent.DataSource = EmpSalData.fnShowEmpSalaryByCompStatus(EmpSal)
            grdBonusComponent.DataBind()

            GetEmpWiseTaxAdvace(EmpSal.EmployeeID)

            grdSalTaxableIncome.DataSource = EmpSalData.fnGetSalTaxableIncome(EmpSal)
            grdSalTaxableIncome.DataBind()

            grdTaxCalculation.DataSource = EmpSalData.fnGetTaxInfoBySal(EmpSal)
            grdTaxCalculation.DataBind()

            EmpSalSummary = EmpSalSummaryData.fnGetSalSummaryByEmpID(EmpSal)

            lblDepartment.Text = EmpSalSummary.Department
            lblDesignation.Text = EmpSalSummary.Designation
            lblOrgBranch.Text = EmpSalSummary.ULCBranch
            lblBank.Text = EmpSalSummary.Bank
            lblBankBranch.Text = EmpSalSummary.Branch
            lblBankAccNo.Text = EmpSalSummary.BankAccountNo
            lblSalary.Text = EmpSalSummary.Salary.ToString("N2")
            lblLoanSettlement.Text = EmpSalSummary.LoanSettlement.ToString("N2")
            lblTaxDeduction.Text = EmpSalSummary.TaxDeduction.ToString("N2")

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
        
    End Sub

    Protected Sub GetEmpList()
        drpEmployeeList.DataTextField = "EmployeeName"
        drpEmployeeList.DataValueField = "EmployeeID"
        drpEmployeeList.DataSource = EmpInfoData.fnGetEmployeeList()
        drpEmployeeList.DataBind()
    End Sub

    Protected Sub GetEmpWiseTaxAdvace(ByVal EmployeeID As String)
        grdAdvanceTax.DataSource = TaxAdvData.fnGetTaxAdvByEmpID(EmployeeID)
        grdAdvanceTax.DataBind()
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            drpSalaryYear.SelectedValue = Now.Year
            drpSalaryMonth.SelectedValue = Now.Month
            GetEmpList()
        End If
    End Sub

    Protected Sub grdPositiveComponent_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdPositiveComponent.RowDataBound
        Dim lblPositiveSalValue As New Label
        If e.Row.RowType = DataControlRowType.DataRow Then
            lblPositiveSalValue = e.Row.FindControl("lblPositiveSalValue")
            TotalPositiveComponent += Convert.ToDouble(lblPositiveSalValue.Text)
        End If

        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(0).Text = "Total :"
            e.Row.Cells(1).Text = TotalPositiveComponent.ToString("N2")
        End If


    End Sub

    Protected Sub grdNegativeComponent_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdNegativeComponent.RowDataBound
        Dim lblNegativeSalValue As New Label
        If e.Row.RowType = DataControlRowType.DataRow Then
            lblNegativeSalValue = e.Row.FindControl("lblNegativeSalValue")
            TotalNegativeComponent += Convert.ToDouble(lblNegativeSalValue.Text)
        End If

        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(0).Text = "Total :"
            e.Row.Cells(1).Text = TotalNegativeComponent.ToString("N2")
        End If
    End Sub


    Protected Sub grdHiddenComponent_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdHiddenComponent.RowDataBound
        Dim lblHiddenSalValue As New Label
        If e.Row.RowType = DataControlRowType.DataRow Then
            lblHiddenSalValue = e.Row.FindControl("lblHiddenSalValue")
            TotalHiddenComponent += Convert.ToDouble(lblHiddenSalValue.Text)
        End If

        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(0).Text = "Total :"
            e.Row.Cells(1).Text = TotalHiddenComponent.ToString("N2")
        End If
    End Sub

    Dim TotalTaxableIncome As Double = 0
    Protected Sub grdSalTaxableIncome_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdSalTaxableIncome.RowDataBound
        Dim lblTaxableIncome As New Label()

        If e.Row.RowType = DataControlRowType.DataRow Then
            lblTaxableIncome = e.Row.FindControl("lblTaxableIncome")
            TotalTaxableIncome += Convert.ToDouble(lblTaxableIncome.Text)
        End If

        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(0).Text = "Total:"
            e.Row.Cells(1).Text = TotalTaxableIncome.ToString("N2")
        End If

    End Sub

    Protected Sub btnProcessReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcessReport.Click
        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String

        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]

        Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString
        Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

        Try
            Dim ExpReportName As String = "PaySlip-" + drpSalaryMonth.SelectedItem.Text + "-" + drpSalaryYear.SelectedItem.ToString()

            f = "~/Payroll/Report/"
            folder = Server.MapPath(f)
            repName = folder & "rptMonthlyPaySlip.rpt"
            myReport.Load(repName)

            retArr = conStr.Split(";")
            serverArr = retArr(0).Split("=")
            dbArr = retArr(1).Split("=")
            usrArr = retArr(2).Split("=")
            pwdArr = retArr(3).Split("=")

            serverName = serverArr(1)
            uid = usrArr(1)
            pwd = pwdArr(1)
            dbName = dbArr(1)

            myReport.SetDatabaseLogon(uid, pwd, serverName, dbName)

            Dim parameters As CrystalDecisions.Web.Parameter = New CrystalDecisions.Web.Parameter()
            myReport.SetParameterValue("@EmployeeID", drpEmployeeList.SelectedValue)
            myReport.SetParameterValue("@SalaryYear", Convert.ToInt32(drpSalaryYear.SelectedValue))
            myReport.SetParameterValue("@SalaryMonth", Convert.ToInt32(drpSalaryMonth.SelectedValue))
            myReport.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, True, ExpReportName)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub
End Class
