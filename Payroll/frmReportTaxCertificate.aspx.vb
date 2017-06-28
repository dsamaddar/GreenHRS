Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Partial Class Payroll_frmReportTaxCertificate
    Inherits System.Web.UI.Page

    Dim EmpInfoData As New clsEmployeeInfoDataAccess()

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnExport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExport.Click
        If drpFromYear.SelectedValue = drpToYear.SelectedValue Then
            MessageBox("Select Different Year")
            Exit Sub
        End If

        If Convert.ToInt32(drpFromYear.SelectedValue) > Convert.ToInt32(drpToYear.SelectedValue) Then
            MessageBox("Select Proper Range")
            Exit Sub
        End If

        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String

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
            myReport.SetParameterValue("@EmployeeID", drpEmployeeList.SelectedValue)
            myReport.SetParameterValue("@StartYear", Convert.ToInt32(drpFromYear.SelectedValue))
            myReport.SetParameterValue("@EndYear", Convert.ToInt32(drpToYear.SelectedValue))
            myReport.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, True, "Tax_Certificate_" + drpFromYear.SelectedValue.ToString() + "-" + drpToYear.SelectedValue.ToString() + "_" + Replace(Replace(drpEmployeeList.SelectedItem.Text.ToString(), ".", ""), " ", "_"))
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            drpFromYear.SelectedValue = (Now.Year - 1).ToString()
            drpToYear.SelectedValue = Now.Year.ToString()
            GetEmpList()
        End If
    End Sub

    Protected Sub GetEmpList()
        drpEmployeeList.DataTextField = "EmployeeName"
        drpEmployeeList.DataValueField = "EmployeeID"
        drpEmployeeList.DataSource = EmpInfoData.fnGetEmployeeListAllForTaxCert()
        drpEmployeeList.DataBind()
    End Sub

End Class
