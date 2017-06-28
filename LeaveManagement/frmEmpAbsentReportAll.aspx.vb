Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Partial Class LeaveManagement_frmEmpAbsentReportAll
    Inherits System.Web.UI.Page

    Dim UsrAttData As New clsUserAttendanceDataAccess()
    Dim EmpInfoData As New clsEmployeeInfoDataAccess()


    Protected Sub btnProcessReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcessReport.Click
        Try
            Dim UsrAtt As New clsUserAttendance()
            UsrAtt.AbsentDate = Convert.ToDateTime(txtAbsentDate.Text)
            grdAbsentReport.DataSource = UsrAttData.fnGetAbsentReportAll(UsrAtt)
            grdAbsentReport.DataBind()

            If grdAbsentReport.Rows.Count > 0 Then
                'This replaces <td> with <th> and adds the scope attribute
                grdAbsentReport.UseAccessibleHeader = True
                'This will add the <thead> and <tbody> elements
                grdAbsentReport.HeaderRow.TableSection = TableRowSection.TableHeader
                'This adds the <tfoot> element.Remove if you don't have a footer row
                grdAbsentReport.FooterRow.TableSection = TableRowSection.TableFooter
            End If

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim MenuIDs As String

            MenuIDs = Session("PermittedMenus")

            If InStr(MenuIDs, "AllEmpAbsRpt~") = 0 Then
                Response.Redirect("~\frmHRMLogin.aspx")
            End If

            If Not IsPostBack Then
                txtAbsentDate.Text = Now.Date
            End If
        End If

        If grdAbsentReport.Rows.Count > 0 Then
            'This replaces <td> with <th> and adds the scope attribute
            grdAbsentReport.UseAccessibleHeader = True
            'This will add the <thead> and <tbody> elements
            grdAbsentReport.HeaderRow.TableSection = TableRowSection.TableHeader
            'This adds the <tfoot> element.Remove if you don't have a footer row
            grdAbsentReport.FooterRow.TableSection = TableRowSection.TableFooter
        End If

    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
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
            repName = folder & "EmpAbsentReportAll.rpt"
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
            myReport.SetParameterValue("@AbsentDate", Convert.ToDateTime(txtAbsentDate.Text))
            myReport.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, True, "ExportedReport")
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub
End Class
