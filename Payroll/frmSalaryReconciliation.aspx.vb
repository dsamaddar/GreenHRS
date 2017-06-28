Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Partial Class Payroll_frmSalaryReconciliation
    Inherits System.Web.UI.Page

    Protected Sub btnProcessReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcessReport.Click

        If drpSalaryYear.SelectedValue = drpRightSalaryYear.SelectedValue Then
            If drpSalaryMonth.SelectedValue = drpRightSalaryMonth.SelectedValue Then
                MessageBox("Select Different Month")
                Exit Sub
            End If
        End If

        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String

        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]

        Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionStringRpt").ConnectionString
        Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

        Try
            Dim ExpRepName As String = "SAL-Reconciliation-" + drpSalaryMonth.SelectedItem.ToString + "-" + drpSalaryYear.SelectedItem.ToString() + "-TO-" + drpRightSalaryMonth.SelectedItem.ToString() + "-" + drpRightSalaryYear.SelectedItem.ToString()

            f = "~/Payroll/Report/"
            folder = Server.MapPath(f)
            repName = folder & "rptSalaryReconciliation.rpt"
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
            myReport.SetParameterValue("@SalaryYear", Convert.ToInt32(drpSalaryYear.SelectedValue))
            myReport.SetParameterValue("@SalaryMonth", Convert.ToInt32(drpSalaryMonth.SelectedValue))
            myReport.SetParameterValue("@RightSalaryYear", Convert.ToInt32(drpRightSalaryYear.SelectedValue))
            myReport.SetParameterValue("@RightSalaryMonth", Convert.ToInt32(drpRightSalaryMonth.SelectedValue))
            myReport.ExportToHttpResponse(ExportFormatType.WordForWindows, Response, True, ExpRepName)
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            drpSalaryMonth.SelectedValue = Now.Month - 1
            drpSalaryYear.SelectedValue = Now.Year

            drpRightSalaryYear.SelectedValue = Now.Year
            drpRightSalaryMonth.SelectedValue = Now.Month
        End If
    End Sub
End Class
