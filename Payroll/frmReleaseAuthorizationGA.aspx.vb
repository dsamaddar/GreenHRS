Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Partial Class Payroll_frmReleaseAuthorizationGA
    Inherits System.Web.UI.Page

    Dim EmpInfoData As New clsEmployeeInfoDataAccess()

    Protected Sub btnExportReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExportReport.Click
        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String

        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]

        Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString
        Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

        Try
            Dim ReportName As String = "Release-Authorization-GA-" + Replace(Replace(drpResignedEmpList.SelectedItem.Text, " ", ""), "'", "")

            f = "~/Payroll/Report/"
            folder = Server.MapPath(f)
            repName = folder & "rptReleaseAuthorizationGA.rpt"
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
            myReport.SetParameterValue("@EmployeeID", drpResignedEmpList.SelectedValue)
            myReport.ExportToHttpResponse(Convert.ToInt32(drpReportFormat.SelectedValue), Response, True, ReportName)
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
            GetResignedEmpList()
        End If
    End Sub

    Protected Sub GetResignedEmpList()
        drpResignedEmpList.DataTextField = "EmployeeName"
        drpResignedEmpList.DataValueField = "EmployeeID"
        drpResignedEmpList.DataSource = EmpInfoData.fnGetResignedEmpList()
        drpResignedEmpList.DataBind()
    End Sub

    Protected Sub btnPFStatement_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPFStatement.Click
        If drpResignedEmpList.SelectedValue = "N\A" Then
            MessageBox("Select An Employee First.")
        End If

        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String

        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]

        Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString
        Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

        Try
            Dim ExportRptName As String = "PF-Statement-" + Replace(Replace(drpResignedEmpList.SelectedItem.ToString(), " ", "-"), "'", "")

            f = "~/Payroll/Report/"
            folder = Server.MapPath(f)
            repName = folder & "rptPFInfoByEmployee.rpt"
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
            myReport.SetParameterValue("@EmployeeID", drpResignedEmpList.SelectedValue)
            myReport.ExportToHttpResponse(ExportFormatType.WordForWindows, Response, True, ExportRptName)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub
End Class
