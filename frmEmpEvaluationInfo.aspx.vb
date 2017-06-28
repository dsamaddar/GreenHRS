Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Partial Class frmEmpEvaluationInfo
    Inherits System.Web.UI.Page

    Dim EmpEvalData As New clsEvaluationSummaryDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            drpEvaluationYear.SelectedValue = Now.Year.ToString()
        End If
    End Sub

    Protected Sub btnShow_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShow.Click
        Try
            grdEvaluationByMe.DataSource = EmpEvalData.fnGetAllCompletedEvalByYear(Convert.ToInt32(drpEvaluationYear.SelectedValue))
            grdEvaluationByMe.DataBind()
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

    Protected Sub grdEvaluationByMe_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdEvaluationByMe.SelectedIndexChanged
        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String
        Dim lblEmpEvaluationSummaryID As New Label

        lblEmpEvaluationSummaryID = grdEvaluationByMe.SelectedRow.FindControl("lblEmpEvaluationSummaryID")

        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]

        Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionStringRpt").ConnectionString
        Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

        Try
            Dim ExpReportName As String = "Evaluation"

            f = "~/Reports/"
            folder = Server.MapPath(f)
            repName = folder & "EmpEvaluationNew.rpt"
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
            myReport.SetParameterValue("@EmpEvaluationSummaryID", lblEmpEvaluationSummaryID.Text)
            myReport.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, True, ExpReportName)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

End Class
