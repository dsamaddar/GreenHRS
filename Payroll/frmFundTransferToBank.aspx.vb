Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Partial Class Payroll_frmFundTransferToBank
    Inherits System.Web.UI.Page

    Dim ULCBankAccData As New clsULCBankAccDataAccess()
    Dim EmpSalSumData As New clsEmpSalSummaryDataAccess()
    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()
    Dim TotalSalary As Double = 0

    Protected Sub ShowULCBanAccInfo()
        drpBanlAccList.DataTextField = "BankAcc"
        drpBanlAccList.DataValueField = "ULCBankAccID"
        drpBanlAccList.DataSource = ULCBankAccData.fnShowULCBankAccountList()
        drpBanlAccList.DataBind()
    End Sub
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowULCBanAccInfo()
            ShowEmployeeType()
            drpSalaryYear.SelectedValue = Now.Year
            drpSalaryMonth.SelectedValue = Now.Month
            txtPaymentDate.Text = Now.Date
        End If
    End Sub

    Protected Sub ShowEmployeeType()
        chkEmployeeGroup.DataTextField = "EmployeeTypeName"
        chkEmployeeGroup.DataValueField = "EmployeeTypeID"
        chkEmployeeGroup.DataSource = EmployeeInfoData.fnGetEmployeeType()
        chkEmployeeGroup.DataBind()
    End Sub

    Protected Sub btnProcessReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcessReport.Click
        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String

        Dim ProcessWithSalary As Boolean = False
        Dim ProcessWithFB As Boolean = False
        Dim ProcessWithPB As Boolean = False

        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]

        Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionStringRpt").ConnectionString
        Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

        Try
            Dim ReportName As String = ULCBankAccData.fnGetExportReportName(drpBanlAccList.SelectedValue)
            Dim EmpTypeList As String = ""
            For Each itm As ListItem In chkEmployeeGroup.Items
                If itm.Selected = True Then
                    EmpTypeList &= itm.Value + ","
                End If
            Next

            If EmpTypeList = "" Then
                MessageBox("Select At Least One Employee Group.")
                Exit Sub
            Else
                EmpTypeList = EmpTypeList.Remove(Len(EmpTypeList) - 1, 1)
            End If

            If chkProcessWithSalary.Checked = True Then
                ProcessWithSalary = True
            Else
                ProcessWithSalary = False
            End If

            If chkProcessWithFB.Checked = True Then
                ProcessWithFB = True
            Else
                ProcessWithFB = False
            End If

            If chkProcessWithPB.Checked = True Then
                ProcessWithPB = True
            Else
                ProcessWithPB = False
            End If

            f = "~/Payroll/Report/"
            folder = Server.MapPath(f)
            repName = folder & "rptFundTransferToBank.rpt"
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
            myReport.SetParameterValue("@ULCBankAccID", drpBanlAccList.SelectedValue)
            myReport.SetParameterValue("@SalaryYear", Convert.ToInt32(drpSalaryYear.SelectedValue))
            myReport.SetParameterValue("@SalaryMonth", Convert.ToInt32(drpSalaryMonth.SelectedValue))
            myReport.SetParameterValue("@PaymentDate", Convert.ToDateTime(txtPaymentDate.Text))
            myReport.SetParameterValue("@EmpTypeList", EmpTypeList)
            myReport.SetParameterValue("@ProcessWithSalary", ProcessWithSalary)
            myReport.SetParameterValue("@ProcessWithFB", ProcessWithFB)
            myReport.SetParameterValue("@ProcessWithPB", ProcessWithPB)
            myReport.ExportToHttpResponse(Convert.ToInt32(drpReportFormat.SelectedValue), Response, True, ReportName)
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

    Protected Sub btnShowDetails_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShowDetails.Click
        Try
            Dim ProcessWithSalary As Boolean = False
            Dim ProcessWithFB As Boolean = False
            Dim ProcessWithPB As Boolean = False

            Dim EmpTypeList As String = ""
            For Each itm As ListItem In chkEmployeeGroup.Items
                If itm.Selected = True Then
                    EmpTypeList &= itm.Value + ","
                End If
            Next

            If EmpTypeList = "" Then
                MessageBox("Select At Least One Employee Group.")
                Exit Sub
            Else
                EmpTypeList = EmpTypeList.Remove(Len(EmpTypeList) - 1, 1)
            End If

            If chkProcessWithSalary.Checked = True Then
                ProcessWithSalary = True
            Else
                ProcessWithSalary = False
            End If

            If chkProcessWithFB.Checked = True Then
                ProcessWithFB = True
            Else
                ProcessWithFB = False
            End If

            If chkProcessWithPB.Checked = True Then
                ProcessWithPB = True
            Else
                ProcessWithPB = False
            End If

            grdSalaryDetails.DataSource = EmpSalSumData.fnFundTransferDetails(drpBanlAccList.SelectedValue, Convert.ToInt32(drpSalaryYear.SelectedValue), Convert.ToInt32(drpSalaryMonth.SelectedValue), EmpTypeList, ProcessWithSalary, ProcessWithFB, ProcessWithPB)
            grdSalaryDetails.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub grdSalaryDetails_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdSalaryDetails.RowDataBound
        Dim lblSalary As New Label()

        If e.Row.RowType = DataControlRowType.DataRow Then
            lblSalary = e.Row.FindControl("lblSalary")
            TotalSalary += Convert.ToDouble(lblSalary.Text)
        End If

        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(0).Text = "Count=" + grdSalaryDetails.Rows.Count.ToString()
            e.Row.Cells(1).Text = "Total Salary:"
            e.Row.Cells(2).Text = TotalSalary.ToString("#,##0.00")
        End If
    End Sub
End Class
