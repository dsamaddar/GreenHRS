Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Partial Class Payroll_frmProvidentFundInfo
    Inherits System.Web.UI.Page

    Dim EmpInfoData As New clsEmployeeInfoDataAccess()
    Dim PFData As New clsProvidentFundDataAccess()
    Dim SumOfEmpContribution, SumOfEmpCreditedInt, SumOfCmpContribution, SumOfCmpCreditedInt As Double


    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        Dim ProvidentFund As New clsProvidentFund()

        ProvidentFund.EmployeeID = drpUserList.SelectedValue
        ProvidentFund.SalMonth = drpSalaryMonth.SelectedValue
        ProvidentFund.SalYear = drpSalaryYear.SelectedValue
        ProvidentFund.EmpContribution = Convert.ToDouble(txtEmpContribution.Text)
        ProvidentFund.CreditedIntEmp = Convert.ToDouble(txtCreditedIntCmp.Text)
        ProvidentFund.ComContribution = Convert.ToDouble(txtCmpContribution.Text)
        ProvidentFund.CreditedIntCom = Convert.ToDouble(txtCreditedIntCmp.Text)
        ProvidentFund.ProcessDate = Convert.ToDateTime(txtProcessingDate.Text)
        ProvidentFund.EntryPoint = ""
        ProvidentFund.Remarks = txtRemarks.Text
        ProvidentFund.EntryBy = Session("LoginUserID")

        Dim Check As Integer = PFData.fnInsertProvidentFundInfo(ProvidentFund)

        If Check = 1 Then
            ClearForm()
            MessageBox("Data Inserted.")
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub ShowPFInfo(ByVal EmployeeID As String)
        grdPFDetails.DataSource = PFData.fnGetPFInfoByEmpID(EmployeeID)
        grdPFDetails.DataBind()
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click

        If hdFldProvidentFundID.Value = "" Then
            MessageBox("Select A Row To Update")
            Exit Sub
        End If

        Dim ProvidentFund As New clsProvidentFund()

        ProvidentFund.ProvidentFundID = hdFldProvidentFundID.Value
        ProvidentFund.EmployeeID = drpUserList.SelectedValue
        ProvidentFund.SalMonth = drpSalaryMonth.SelectedValue
        ProvidentFund.SalYear = drpSalaryYear.SelectedValue
        ProvidentFund.EmpContribution = Convert.ToDouble(txtEmpContribution.Text)
        ProvidentFund.CreditedIntEmp = Convert.ToDouble(txtCreditedIntCmp.Text)
        ProvidentFund.ComContribution = Convert.ToDouble(txtCmpContribution.Text)
        ProvidentFund.CreditedIntCom = Convert.ToDouble(txtCreditedIntCmp.Text)
        ProvidentFund.ProcessDate = Convert.ToDateTime(txtProcessingDate.Text)
        ProvidentFund.Remarks = txtRemarks.Text
        ProvidentFund.EntryBy = Session("LoginUserID")

        Dim Check As Integer = PFData.fnUpdateProvidentFundInfo(ProvidentFund)

        If Check = 1 Then
            ClearForm()
            MessageBox("Data Update Successfully.")
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearForm()
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

    Protected Sub ClearForm()
        drpSalaryMonth.SelectedValue = Now.Month.ToString()
        drpSalaryYear.SelectedValue = Now.Year.ToString()
        hdFldProvidentFundID.Value = ""
        txtEmpContribution.Text = ""
        txtCmpContribution.Text = ""
        txtCreditedIntEmp.Text = ""
        txtCreditedIntCmp.Text = ""

        txtRemarks.Text = ""
        txtProcessingDate.Text = ""

        If grdPFDetails.Rows.Count > 0 Then
            grdPFDetails.SelectedIndex = -1
        End If

        btnUpdate.Enabled = False
        btnSubmit.Enabled = True
        drpUserList.Enabled = True

        ShowPFInfo(drpUserList.SelectedValue)

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            drpSalaryMonth.SelectedValue = Now.Month.ToString()
            drpSalaryYear.SelectedValue = Now.Year.ToString()
            ShowUserList()

            btnSubmit.Enabled = True
            btnUpdate.Enabled = False
            drpUserList.Enabled = True
        End If
    End Sub

    Protected Sub drpUserList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpUserList.SelectedIndexChanged
        ShowPFInfo(drpUserList.SelectedValue)
    End Sub

    Protected Sub grdPFDetails_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdPFDetails.RowDataBound
        Dim lblEmpContribution, lblCreditedIntEmp, lblComContribution, lblCreditedIntCom As New Label

        If e.Row.RowType = DataControlRowType.DataRow Then
            lblEmpContribution = e.Row.FindControl("lblEmpContribution")
            lblCreditedIntEmp = e.Row.FindControl("lblCreditedIntEmp")
            lblComContribution = e.Row.FindControl("lblComContribution")
            lblCreditedIntCom = e.Row.FindControl("lblCreditedIntCom")

            SumOfEmpContribution += Convert.ToDouble(lblEmpContribution.Text)
            SumOfEmpCreditedInt += Convert.ToDouble(lblCreditedIntEmp.Text)
            SumOfCmpContribution += Convert.ToDouble(lblComContribution.Text)
            SumOfCmpCreditedInt += Convert.ToDouble(lblCreditedIntCom.Text)

        End If

        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(4).Text = SumOfEmpContribution.ToString("#,##0.##")
            e.Row.Cells(5).Text = SumOfEmpCreditedInt.ToString("#,##0.##")
            e.Row.Cells(6).Text = SumOfCmpContribution.ToString("#,##0.##")
            e.Row.Cells(7).Text = SumOfCmpCreditedInt.ToString("#,##0.##")
        End If

    End Sub

    Protected Sub grdPFDetails_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdPFDetails.SelectedIndexChanged
        Dim lblProvidentFundID, lblSalYear, lblSalMonth, lblEmpContribution, lblCreditedIntEmp, lblComContribution, lblCreditedIntCom, lblProcessDate, lblRemarks As New Label

        lblProvidentFundID = grdPFDetails.SelectedRow.FindControl("lblProvidentFundID")
        lblSalYear = grdPFDetails.SelectedRow.FindControl("lblSalYear")
        lblSalMonth = grdPFDetails.SelectedRow.FindControl("lblSalMonth")
        lblEmpContribution = grdPFDetails.SelectedRow.FindControl("lblEmpContribution")
        lblCreditedIntEmp = grdPFDetails.SelectedRow.FindControl("lblCreditedIntEmp")
        lblComContribution = grdPFDetails.SelectedRow.FindControl("lblComContribution")
        lblCreditedIntCom = grdPFDetails.SelectedRow.FindControl("lblCreditedIntCom")
        lblProcessDate = grdPFDetails.SelectedRow.FindControl("lblProcessDate")
        lblRemarks = grdPFDetails.SelectedRow.FindControl("lblRemarks")

        hdFldProvidentFundID.Value = lblProvidentFundID.Text
        drpSalaryYear.SelectedValue = lblSalYear.Text
        drpSalaryMonth.SelectedValue = lblSalMonth.Text
        txtEmpContribution.Text = Convert.ToDouble(lblEmpContribution.Text)
        txtCmpContribution.Text = Convert.ToDouble(lblComContribution.Text)
        txtCreditedIntEmp.Text = Convert.ToDouble(lblCreditedIntEmp.Text)
        txtCreditedIntCmp.Text = Convert.ToDouble(lblCreditedIntCom.Text)
        txtRemarks.Text = lblRemarks.Text
        txtProcessingDate.Text = Convert.ToDateTime(lblProcessDate.Text)

        drpUserList.Enabled = False
        btnUpdate.Enabled = True
        btnSubmit.Enabled = False

    End Sub

    Protected Sub btnPFStatement_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPFStatement.Click
        If drpUserList.SelectedValue = "N\A" Then
            MessageBox("Select An Employee First.")
        End If

        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String

        Dim DateFrom, DateTo As DateTime
        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]

        Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString
        Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

        Try

            If txtDateFrom.Text = "" And txtDateTo.Text = "" Then
                DateFrom = "1/1/1900"
                DateTo = "1/1/2099"
            ElseIf txtDateFrom.Text <> "" And txtDateTo.Text = "" Then
                DateFrom = Convert.ToDateTime(txtDateFrom.Text)
                DateTo = "1/1/2099"
            ElseIf txtDateFrom.Text = "" And txtDateTo.Text <> "" Then
                DateFrom = "1/1/1900"
                DateTo = Convert.ToDateTime(txtDateTo.Text)
            Else
                DateFrom = Convert.ToDateTime(txtDateFrom.Text)
                DateTo = Convert.ToDateTime(txtDateTo.Text)
            End If

            Dim ExportRptName As String = "PF-Statement-" + Replace(Replace(drpUserList.SelectedItem.ToString(), " ", "-"), "'", "")

            f = "~/Payroll/Report/"
            folder = Server.MapPath(f)
            repName = folder & "rptPFInfoByEmployeeNew.rpt"
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
            myReport.SetParameterValue("@DateFrom", DateFrom)
            myReport.SetParameterValue("@DateTo", DateTo)
            myReport.ExportToHttpResponse(ExportFormatType.WordForWindows, Response, True, ExportRptName)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

End Class
