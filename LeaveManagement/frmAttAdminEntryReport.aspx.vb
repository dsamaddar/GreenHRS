Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Partial Class LeaveManagement_frmAttAdminEntryReport
    Inherits System.Web.UI.Page

    Dim UserAttData As New clsUserAttendanceDataAccess()

    Protected Sub btnShowReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShowReport.Click
        GetUsrAttData()
    End Sub

    Protected Sub btnExport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExport.Click
        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String

        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]

        Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionStringRpt").ConnectionString
        Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

        Try
            f = "~/Reports/"
            folder = Server.MapPath(f)
            repName = folder & "EmpAttReportByEntryUser.rpt"
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
            myReport.SetParameterValue("@EntryBy", drpEntryUser.SelectedValue)
            myReport.SetParameterValue("@DateFrom", Convert.ToDateTime(txtDateFrom.Text))
            myReport.SetParameterValue("@DateTo", Convert.ToDateTime(txtDateTo.Text))
            myReport.ExportToHttpResponse(ExportFormatType.Excel, Response, True, "ExportedReport")
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

    Protected Sub GetUsrAttData()
        Dim UsrAtt As New clsUserAttendance()
        UsrAtt.EntryBy = drpEntryUser.SelectedValue
        UsrAtt.DateFrom = Convert.ToDateTime(txtDateFrom.Text)
        UsrAtt.DateTo = Convert.ToDateTime(txtDateTo.Text)

        grdUserAttendance.DataSource = UserAttData.fnGetAttRptInputByAdminEntryUser(UsrAtt)
        grdUserAttendance.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetAttEntryByUser()
            txtDateFrom.Text = Now.Date
            txtDateTo.Text = Now.Date
        End If
    End Sub

    Protected Sub GetAttEntryByUser()
        drpEntryUser.DataTextField = "EmployeeName"
        drpEntryUser.DataValueField = "UserID"
        drpEntryUser.DataSource = UserAttData.fnGetAttEntryByUser()
        drpEntryUser.DataBind()
    End Sub

End Class
