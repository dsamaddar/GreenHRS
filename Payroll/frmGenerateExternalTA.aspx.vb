Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Partial Class Payroll_frmGenerateExternalTA
    Inherits System.Web.UI.Page

    Dim EmpData As New clsEmployeeInfoDataAccess()
    Dim TAData As New clsTransportAllowanceDataAccess()

    Protected Sub btnProcessTA_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcessTA.Click

        Dim TA As New clsTransportAllowance()

        Dim EmpList As String = ""

        For Each itm As ListItem In chkEmpList.Items
            If itm.Selected = True Then
                EmpList = EmpList + itm.Value + ","
            End If
        Next

        If EmpList = "" Then
            MessageBox("Select Employees First.")
            Exit Sub
        Else
            EmpList = EmpList.Remove(Len(EmpList) - 1, 1)
        End If

        TA.SalaryMonth = Convert.ToInt32(drpSalaryMonth.SelectedValue)
        TA.SalaryYear = Convert.ToInt32(drpSalaryYear.SelectedValue)
        TA.EntryBy = Session("LoginUserID")
        TA.EmpList = EmpList

        Dim result As clsResult = TAData.fnGenerateTransportAllowance(TA)

        If result.Success = True Then
            ClearForm()
        End If

        MessageBox(result.Message)

    End Sub

    Protected Sub ClearForm()

        btnCheckAll.Enabled = True
        btnProcessTA.Enabled = False
        drpSalaryMonth.Enabled = True
        drpSalaryYear.Enabled = True

        For Each itm As ListItem In chkEmpList.Items
            itm.Selected = False
        Next

        chkSelectAllEmployees.Checked = False

    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnFundTransferLetter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFundTransferLetter.Click

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetEligibleEmpList()

            drpSalaryYear.SelectedValue = Now.Year.ToString()
            drpSalaryMonth.SelectedValue = Now.Month.ToString()

            btnCheckAll.Enabled = True
            btnProcessTA.Enabled = False

        End If
    End Sub

    Protected Sub GetEligibleEmpList()
        chkEmpList.DataTextField = "EmployeeName"
        chkEmpList.DataValueField = "EmployeeID"
        chkEmpList.DataSource = EmpData.fnGetEligibleListOfETA()
        chkEmpList.DataBind()
    End Sub

    Protected Sub chkSelectAllEmployees_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkSelectAllEmployees.CheckedChanged

        If chkSelectAllEmployees.Checked = True Then
            For Each itm As ListItem In chkEmpList.Items
                itm.Selected = True
            Next
        Else
            For Each itm As ListItem In chkEmpList.Items
                itm.Selected = False
            Next
        End If

    End Sub

    Protected Sub btnCheckAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCheckAll.Click

        Dim EmpList As String = ""
        Dim Status As String = ""
        Dim MsgStr As String = ""

        For Each itm As ListItem In chkEmpList.Items
            If itm.Selected = True Then
                EmpList = EmpList + itm.Value + ","
            End If
        Next

        If EmpList = "" Then
            MessageBox("Select Employees First.")
            Exit Sub
        End If

        Dim TA As New clsTransportAllowance()
        TA.SalaryYear = Convert.ToInt32(drpSalaryYear.SelectedValue)
        TA.SalaryMonth = Convert.ToInt32(drpSalaryMonth.SelectedValue)

        For Each itm As ListItem In chkEmpList.Items
            If itm.Selected = True Then
                TA.EmployeeID = itm.Value
                Status = TAData.fnChqAlreadyTAGenerated(TA)
                If Status = "YES" Then
                    MsgStr = MsgStr + itm.Text + " | "
                    itm.Selected = False
                End If
            End If
        Next

        If MsgStr <> "" Then
            MessageBox("..:Transport Allowance For Some Of The Employees Is Already Generated:..\n" + MsgStr)
        End If

        btnCheckAll.Enabled = False
        btnProcessTA.Enabled = True
        drpSalaryMonth.Enabled = False
        drpSalaryYear.Enabled = False
    End Sub

    Protected Sub btnDetailsCalculation_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDetailsCalculation.Click
        GenerateReport("rptDetailETACalReimbursement.rpt")
    End Sub

    Protected Sub btnTransferSummary_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTransferSummary.Click
        GenerateReport("rptETATransferSummary.rpt")
    End Sub

    Protected Sub GenerateReport(ByVal ReportFormat As String)
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
            repName = folder & ReportFormat
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
            myReport.SetParameterValue("@SalaryYear", drpSalaryYear.SelectedValue)
            myReport.SetParameterValue("@SalaryMonth", drpSalaryMonth.SelectedValue)
            myReport.ExportToHttpResponse(Convert.ToInt32(drpReportFormat.SelectedValue), Response, True, "ExportedReport")
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub
End Class


