Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared
Imports System

Partial Class CVMan_frmShowCanDetailsResult
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Dim ExamRollNo As String = Request.QueryString("ExamRollNo")

            Dim myReport As New ReportDocument()
            Dim folder As String
            Dim f As String
            Dim repName As String

            Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]
            Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionStringRpt").ConnectionString
            Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

            f = "~/Reports/"
            folder = Server.MapPath(f)
            repName = folder & "DetailExamResult.rpt"
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
            myReport.SetParameterValue("@ExamRollNo", ExamRollNo)
            crystalRptShowResult.ReportSource = myReport
            crystalRptShowResult.DataBind()
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
