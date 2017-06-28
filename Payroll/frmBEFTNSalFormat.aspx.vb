Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Partial Class Payroll_frmBEFTNSalFormat
    Inherits System.Web.UI.Page

    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()

    Protected Sub btnExport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExport.Click

        Dim ProcessWithSalary As Boolean = False
        Dim ProcessWithFB As Boolean = False
        Dim ProcessWithPB As Boolean = False

        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String
        Dim ExpReportName As String = ""

        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]

        Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionStringRpt").ConnectionString
        Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

        Try

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

            ExpReportName = Replace(ddlBankName.SelectedItem.ToString(), " ", "-") + "-BEFTN-Trans-" + drpSalaryMonth.SelectedValue.ToString() + "-" + drpSalaryYear.SelectedValue.ToString()

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

            f = "Report/rptSCBSalBEFTNTransfer.rpt"
            folder = Server.MapPath(f)
            repName = folder
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
            myReport.SetParameterValue("@BankID", ddlBankName.SelectedValue)
            myReport.SetParameterValue("@PaymentDate", Convert.ToDateTime(txtPaymentDate.Text))
            myReport.SetParameterValue("@SalaryYear", Convert.ToInt32(drpSalaryYear.SelectedValue))
            myReport.SetParameterValue("@SalaryMonth", Convert.ToInt32(drpSalaryMonth.SelectedValue))
            myReport.SetParameterValue("@EmpTypeList", EmpTypeList)
            myReport.SetParameterValue("@ProcessWithSalary", ProcessWithSalary)
            myReport.SetParameterValue("@ProcessWithFB", ProcessWithFB)
            myReport.SetParameterValue("@ProcessWithPB", ProcessWithPB)
            myReport.ExportToHttpResponse(Convert.ToInt32(drpReportFormat.SelectedValue), Response, True, ExpReportName)

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ShowEmployeeType()
        chkEmployeeGroup.DataTextField = "EmployeeTypeName"
        chkEmployeeGroup.DataValueField = "EmployeeTypeID"
        chkEmployeeGroup.DataSource = EmployeeInfoData.fnGetEmployeeType()
        chkEmployeeGroup.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowBankName()
            ShowEmployeeType()
            txtPaymentDate.Text = Now.Date
            drpSalaryMonth.SelectedValue = Now.Month
            drpSalaryYear.SelectedValue = Now.Year
        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub ShowBankName()
        ddlBankName.DataTextField = "BankName"
        ddlBankName.DataValueField = "BankID"
        ddlBankName.DataSource = EmployeeInfoData.fnGetBankName()
        ddlBankName.DataBind()
    End Sub

End Class
