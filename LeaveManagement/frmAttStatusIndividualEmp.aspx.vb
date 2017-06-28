Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Partial Class LeaveManagement_frmAttStatusIndividualEmp
    Inherits System.Web.UI.Page

    Dim UsrAttData As New clsUserAttendanceDataAccess()
    Dim EmpInfoData As New clsEmployeeInfoDataAccess()

    Protected Sub btnProcessReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcessReport.Click
        Try
            Dim UsrAtt As New clsUserAttendance()
            UsrAtt.EmployeeID = drpUserList.SelectedValue


            If Convert.ToDateTime(txtDateFrom.Text) > Convert.ToDateTime(txtDateTo.Text) Then
                Dim TempDate As DateTime = txtDateTo.Text
                txtDateTo.Text = txtDateFrom.Text
                txtDateFrom.Text = TempDate
            End If

            UsrAtt.DateFrom = Convert.ToDateTime(txtDateFrom.Text)
            UsrAtt.DateTo = Convert.ToDateTime(txtDateTo.Text)
            grdEmpAttendanceReport.DataSource = UsrAttData.fnGetUserAttendance(UsrAtt)
            grdEmpAttendanceReport.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ShowUserList()
        drpUserList.DataTextField = "EmployeeName"
        drpUserList.DataValueField = "EmployeeID"
        drpUserList.DataSource = EmpInfoData.fnGetEmployeeList()
        drpUserList.DataBind()

        Dim A As New ListItem()

        A.Text = "N\A"
        A.Value = "N\A"

        drpUserList.Items.Insert(0, A)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim MenuIDs As String

        MenuIDs = Session("PermittedMenus")

        If InStr(MenuIDs, "AttStatInd~") = 0 Then
            Response.Redirect("~\frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            ShowUserList()
            txtDateFrom.Text = Now.Month.ToString() + "/1" + "/" + Now.Year.ToString()
            txtDateTo.Text = Now.Month.ToString() + "/" + Now.Day.ToString() + "/" + Now.Year.ToString()
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
            repName = folder & "IndividualAttReport.rpt"
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
            myReport.SetParameterValue("@EmployeeID", drpUserList.SelectedValue)
            myReport.SetParameterValue("@DateFrom", Convert.ToDateTime(txtDateFrom.Text))
            myReport.SetParameterValue("@DateTo", Convert.ToDateTime(txtDateTo.Text))
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
