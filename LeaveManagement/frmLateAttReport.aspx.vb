Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Partial Class LeaveManagement_frmLateAttReport
    Inherits System.Web.UI.Page

    Dim UserAttData As New clsUserAttendanceDataAccess()

    Protected Sub btnShowReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShowReport.Click
        ShowDailyAttendanceReport(Convert.ToDateTime(txtReportDate.Text))
    End Sub

    Protected Sub ShowDailyAttendanceReport(ByVal AttDate As DateTime)
        grdAttReport.DataSource = UserAttData.fnGetLateAttReport(AttDate)
        grdAttReport.DataBind()

        If grdAttReport.Rows.Count > 0 Then
            'This replaces <td> with <th> and adds the scope attribute
            grdAttReport.UseAccessibleHeader = True
            'This will add the <thead> and <tbody> elements
            grdAttReport.HeaderRow.TableSection = TableRowSection.TableHeader
            'This adds the <tfoot> element.Remove if you don't have a footer row
            grdAttReport.FooterRow.TableSection = TableRowSection.TableFooter
        End If


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim MenuIDs As String

        MenuIDs = Session("PermittedMenus")

        If InStr(MenuIDs, "LateAttReport~") = 0 Then
            Response.Redirect("~\frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            txtReportDate.Text = Now.Date
        End If

        If grdAttReport.Rows.Count > 0 Then
            'This replaces <td> with <th> and adds the scope attribute
            grdAttReport.UseAccessibleHeader = True
            'This will add the <thead> and <tbody> elements
            grdAttReport.HeaderRow.TableSection = TableRowSection.TableHeader
            'This adds the <tfoot> element.Remove if you don't have a footer row
            grdAttReport.FooterRow.TableSection = TableRowSection.TableFooter
        End If

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
            repName = folder & "LateAttReport.rpt"
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
            myReport.SetParameterValue("@AttDate", Convert.ToDateTime(txtReportDate.Text))
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

End Class
