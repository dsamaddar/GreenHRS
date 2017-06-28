Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Partial Class LeaveManagement_frmMonthlyAttReport
    Inherits System.Web.UI.Page

    Dim UserAttData As New clsUserAttendanceDataAccess()

    Protected Sub btnShowReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShowReport.Click
        Try
            ShowMonthAttReport(Convert.ToInt32(drpMonth.SelectedValue), Convert.ToInt32(drpYear.SelectedValue))
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ShowMonthAttReport(ByVal Month As Integer, ByVal Year As Integer)
        grdMonthlyAttReport.DataSource = UserAttData.fnMonthlyAttSummary(Month, Year)
        grdMonthlyAttReport.DataBind()
    End Sub

    Protected Sub btnExportReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExportReport.Click
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
            repName = folder & "MonthlyAttReport.rpt"
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
            myReport.SetParameterValue("@Month", Convert.ToInt32(drpMonth.SelectedValue))
            myReport.SetParameterValue("@Year", Convert.ToInt32(drpYear.SelectedValue))
            myReport.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, True, "ExportedReport")
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

        Dim MenuIDs As String

        MenuIDs = Session("PermittedMenus")

        If InStr(MenuIDs, "MnthlyAttRpt~") = 0 Then
            Response.Redirect("~\frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            drpMonth.SelectedValue = Now.Month
            drpYear.SelectedValue = Now.Year
        End If
    End Sub

    Protected Sub grdMonthlyAttReport_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdMonthlyAttReport.RowDataBound
        Dim lblLateAttendance As New Label()

        If e.Row.RowType = DataControlRowType.DataRow Then
            lblLateAttendance = e.Row.FindControl("lblLateAttendance")

            e.Row.Cells(10).Font.Bold = True
            If Convert.ToInt32(lblLateAttendance.Text) > 3 Then
                e.Row.Cells(10).ForeColor = Drawing.Color.Red
            Else
                e.Row.Cells(10).ForeColor = Drawing.Color.Green
            End If

        End If

    End Sub
End Class
