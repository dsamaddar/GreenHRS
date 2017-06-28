Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Partial Class Payroll_frmLoanCertificate
    Inherits System.Web.UI.Page

    Dim EmpLoanData As New clsEmpLoanAccountDataAccess()

    Protected Sub btnGenerateReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGenerateReport.Click
        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String

        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]

        Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionStringRpt").ConnectionString
        Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

        Try
            Dim ExportedReportName As String = "LOAN" + "-" + drpEmpLoanAcc.SelectedItem.Text

            f = "~/Payroll/Report/"
            folder = Server.MapPath(f)
            repName = folder & "rptLoanCertificate.rpt"
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
            myReport.SetParameterValue("@EmployeeID", drpEmpList.SelectedValue)
            myReport.SetParameterValue("@EmpLoanAccountID", drpEmpLoanAcc.SelectedValue)
            myReport.SetParameterValue("@AsOnDate", Convert.ToDateTime(txtAsOnDate.Text))
            myReport.ExportToHttpResponse(Convert.ToInt32(drpReportFormat.SelectedValue), Response, True, ExportedReportName)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetLoanAvailedEmp()
        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub GetLoanAvailedEmp()
        drpEmpList.DataTextField = "EmployeeName"
        drpEmpList.DataValueField = "EmployeeID"
        drpEmpList.DataSource = EmpLoanData.fnGetLoanAvailedEmp()
        drpEmpList.DataBind()

        Dim A As New ListItem()
        A.Text = " -- Select Employee -- "
        A.Value = "N\A"
        drpEmpList.Items.Insert(0, A)

    End Sub

    Protected Sub GetEmpWiseLoanAccList(ByVal EmployeeID As String)
        drpEmpLoanAcc.DataTextField = "LoanAccount"
        drpEmpLoanAcc.DataValueField = "EmpLoanAccountID"
        drpEmpLoanAcc.DataSource = EmpLoanData.fnGetEmpWiseLoanAccList(EmployeeID)
        drpEmpLoanAcc.DataBind()
    End Sub

    Protected Sub drpEmpList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpEmpList.SelectedIndexChanged
        GetEmpWiseLoanAccList(drpEmpList.SelectedValue)
    End Sub

End Class
