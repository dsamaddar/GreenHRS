Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared
Imports System.Data

Partial Class frmEmpDashBoard
    Inherits System.Web.UI.Page

    Public dtEmpInfo As New DataTable()
    Dim EmpInfoData As New clsEmployeeInfoDataAccess()

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
        If Not IsPostBack Then
            ShowUserList()
            dtEmpInfo = FormatEmpInfoTbl()
        End If
    End Sub

    Protected Function FormatEmpInfoTbl() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("EmployeeName", System.Type.GetType("System.String"))
        dt.Columns.Add("EmpCode", System.Type.GetType("System.String"))
        dt.Columns.Add("OfficialDesignation", System.Type.GetType("System.String"))
        dt.Columns.Add("FunctionalDesignation", System.Type.GetType("System.String"))
        dt.Columns.Add("Department", System.Type.GetType("System.String"))
        dt.Columns.Add("JoiningDate", System.Type.GetType("System.String"))
        dt.Columns.Add("Age", System.Type.GetType("System.String"))
        dt.Columns.Add("Branch", System.Type.GetType("System.String"))
        dt.Columns.Add("Confirmation", System.Type.GetType("System.String"))
        dt.Columns.Add("PromotionText", System.Type.GetType("System.String"))
        dt.Columns.Add("BranchTransferText", System.Type.GetType("System.String"))
        dt.Columns.Add("DeptTransferText", System.Type.GetType("System.String"))
        dt.Columns.Add("Photos", System.Type.GetType("System.String"))
        Return dt
    End Function

    Protected Sub btnExport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExport.Click

        Dim strPath As String = ""
        Dim myImage As System.Drawing.Image
        Dim converter As New System.Drawing.ImageConverter

        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String

        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]

        dtEmpInfo = EmpInfoData.fnGetEmpDashBoard(drpUserList.SelectedValue).Tables(0)

        dtEmpInfo.Columns.Add(New DataColumn("Picture", System.Type.GetType("System.Byte[]")))
        dtEmpInfo.AcceptChanges()
        For Each rw As DataRow In dtEmpInfo.Rows
            strPath = Server.MapPath("~/Attachments/" + rw.Item("Photos"))
            myImage = System.Drawing.Image.FromFile(strPath)
            rw.Item("Picture") = converter.ConvertTo(myImage, System.Type.GetType("System.Byte[]"))
            rw.AcceptChanges()
        Next

        Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionStringRpt").ConnectionString
        Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

        Try
            f = "~/Reports/"
            folder = Server.MapPath(f)
            repName = folder & "rptEmployeeDashBoard.rpt"
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
            myReport.SetDataSource(dtEmpInfo)
            myReport.ExportToHttpResponse(ExportFormatType.WordForWindows, Response, True, "ExportedReport")
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
