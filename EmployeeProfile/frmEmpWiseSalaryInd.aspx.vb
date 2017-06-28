Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared
Imports System.Net
Imports System.IO

Partial Class EmployeeProfile_frmEmpWiseSalaryInd
    Inherits System.Web.UI.Page

    Dim EmployeeData As New clsEmpBasicProfileDataAccess()
    Dim EmpSalData As New clsEmpSalaryDataAccess()
    Dim EmpSalSummaryData As New clsEmpSalSummaryDataAccess()
    Dim EmpInfoData As New clsEmployeeInfoDataAccess()
    Dim TaxAdvData As New clsTaxAdvanceDataAccess()
    Dim TotalPositiveComponent As Double = 0
    Dim TotalNegativeComponent As Double = 0
    Dim TotalHiddenComponent As Double = 0

    Protected Sub btnViewSalaryInfo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnViewSalaryInfo.Click

        If CheckForPayrollAccess() = 0 Then
            Exit Sub
        End If

        Dim EmpSal As New clsEmpSalary()
        Dim EmpSalSummary As New clsEmpSalSummary()

        Try
            EmpSal.EmployeeID = Session("UniqueUserID")
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

            Dim ToWhomProShow As String = Session("ToWhomProShow")
            getBasicProfileInfo(ToWhomProShow)

        End If
    End Sub

    Protected Sub getBasicProfileInfo(ByVal EmployeeId As String)
        Dim EmpBasicProfile As New EmpBasicInfo()
        EmpBasicProfile = EmployeeData.fnGetBasicProfile(EmployeeId)

        Dim pnlEmpSummary As Panel
        Master.FindControl("pnlEmpSummary")
        pnlEmpSummary = Master.FindControl("pnlEmpSummary")

        Dim lblEmployeeName, lblEmployeeID, lblOfficialDesignation, lblFunctionalDesignation, lblDepartment, lblSupervisorName, lblEmployeeType, lblServiceLength, lblLocation As Label
        Dim imgEmployee As Image
        Dim hpLnkCanProfile As New HyperLink

        lblEmployeeName = pnlEmpSummary.FindControl("lblEmployeeName")
        lblEmployeeID = pnlEmpSummary.FindControl("lblEmployeeID")
        lblOfficialDesignation = pnlEmpSummary.FindControl("lblOfficialDesignation")
        lblFunctionalDesignation = pnlEmpSummary.FindControl("lblFunctionalDesignation")
        lblDepartment = pnlEmpSummary.FindControl("lblDepartment")
        lblSupervisorName = pnlEmpSummary.FindControl("lblSupervisorName")
        lblEmployeeType = pnlEmpSummary.FindControl("lblEmployeeType")
        lblServiceLength = pnlEmpSummary.FindControl("lblServiceLength")
        lblLocation = pnlEmpSummary.FindControl("lblLocation")
        imgEmployee = pnlEmpSummary.FindControl("imgEmployee")
        hpLnkCanProfile = pnlEmpSummary.FindControl("hpLnkCanProfile")

        lblEmployeeName.Text = EmpBasicProfile.Name
        lblEmployeeID.Text = EmpBasicProfile.EmpCode
        lblOfficialDesignation.Text = EmpBasicProfile.OfficialDesignation
        lblFunctionalDesignation.Text = EmpBasicProfile.FunctionalDesignation
        lblDepartment.Text = EmpBasicProfile.DepartmentName
        lblSupervisorName.Text = EmpBasicProfile.CurrentSupervisor
        lblEmployeeType.Text = EmpBasicProfile.EmployeeTypeName
        lblServiceLength.Text = EmpBasicProfile.ServiceLength
        lblLocation.Text = EmpBasicProfile.ULCBranchName
        hpLnkCanProfile.NavigateUrl = "../RecuitmentCVView.aspx?CandidateID=" + EmpBasicProfile.CandidateID

        If EmpBasicProfile.Attachment = "" Then
            imgEmployee.ImageUrl = ""
        Else
            ShowImage(ConfigurationManager.AppSettings("AttachmentsShow") & EmpBasicProfile.Attachment, "imgEmployee")
        End If

    End Sub

    Protected Sub ShowImage(ByVal UrlStr As String, ByVal ControlName As String)
        Dim tClient As WebClient = New WebClient
        Dim memStrmPic As MemoryStream = New MemoryStream(tClient.DownloadData(UrlStr))
        Dim bytesPic As Byte() = memStrmPic.ToArray()
        Dim base64StringPic As String = Convert.ToBase64String(bytesPic, 0, bytesPic.Length)

        Dim imgCtrl As System.Web.UI.WebControls.Image = Master.FindControl(ControlName)
        imgCtrl.ImageUrl = "data:image/png;base64," & base64StringPic
        memStrmPic.Dispose()
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

        If CheckForPayrollAccess() = 0 Then
            Exit Sub
        End If

        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]

        Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionStringRpt").ConnectionString
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
            myReport.SetParameterValue("@EmployeeID", Session("UniqueUserID"))
            myReport.SetParameterValue("@SalaryYear", Convert.ToInt32(drpSalaryYear.SelectedValue))
            myReport.SetParameterValue("@SalaryMonth", Convert.ToInt32(drpSalaryMonth.SelectedValue))
            myReport.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, True, ExpReportName)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Dim EmpSettings As New EmployeeSettingsDataAccess()

    Protected Function CheckForPayrollAccess() As Integer
        Dim PayrollAccess As String = EmpSettings.fnCheckForPayrollAccess()

        If PayrollAccess = "NO" Then
            If drpSalaryMonth.SelectedValue = Now.Month.ToString() And drpSalaryYear.SelectedValue = Now.Year.ToString() Then
                MessageBox("Salary statement has been blocked by HR. Will be open shortly!")
                Return 0
            End If
        End If
        Return 1
    End Function

    Protected Sub btnTaxCertificate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTaxCertificate.Click
        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String

        Dim StartYear As Integer = 0
        Dim EndYear As Integer = 0

        If drpTaxYear.SelectedValue = "2013-2014" Then
            StartYear = 2013
            EndYear = 2014
        ElseIf drpTaxYear.SelectedValue = "2014-2015" Then
            StartYear = 2014
            EndYear = 2015
        ElseIf drpTaxYear.SelectedValue = "2015-2016" Then
            StartYear = 2015
            EndYear = 2016
        ElseIf drpTaxYear.SelectedValue = "2016-2017" Then
            StartYear = 2016
            EndYear = 2017
        ElseIf drpTaxYear.SelectedValue = "2017-2018" Then
            StartYear = 2017
            EndYear = 2018
        ElseIf drpTaxYear.SelectedValue = "2018-2019" Then
            StartYear = 2018
            EndYear = 2019
        ElseIf drpTaxYear.SelectedValue = "2019-2020" Then
            StartYear = 2019
            EndYear = 2020
        End If


        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]

        Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionStringRpt").ConnectionString
        Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

        Try
            f = "~/Payroll/Report/"
            folder = Server.MapPath(f)
            repName = folder & "rptIncomeTax.rpt"
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
            myReport.SetParameterValue("@EmployeeID", Session("UniqueUserID"))
            myReport.SetParameterValue("@StartYear", StartYear)
            myReport.SetParameterValue("@EndYear", EndYear)
            myReport.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, True, "Tax_Certificate_" + drpTaxYear.SelectedValue.ToString() + "_" + Session("LoginUserID"))
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnExportSalaryCertificate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExportSalaryCertificate.Click
        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String

        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]

        Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionStringRpt").ConnectionString
        Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

        Try
            Dim ExportRptName As String = "Sal-Certificate-" + Replace(Replace(Session("UserName"), " ", "-"), "'", "")

            f = "~/Payroll/Report/"
            folder = Server.MapPath(f)
            repName = folder & "rptSalaryCertificate.rpt"
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
            myReport.SetParameterValue("@EmployeeID", Session("UniqueUserID"))
            myReport.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, True, ExportRptName)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

End Class
