
Partial Class Payroll_frmProcessEmpSalary
    Inherits System.Web.UI.Page

    Dim SalaryProcessData As New clsSalaryProcessDataAccess()
    Dim EmpInfoData As New clsEmployeeInfoDataAccess()
    Dim EmpSettings As New EmployeeSettingsDataAccess()

    Protected Sub btnProcessSalary_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcessSalary.Click

        Dim EmployeeIDList As String = ""
        Dim SalaryProcess As New clsSalaryProcess()

        Try
            SalaryProcess.SalaryYear = drpSalaryYear.SelectedValue
            SalaryProcess.SalaryMonth = drpSalaryMonth.SelectedValue
            SalaryProcess.EffectiveDate = Convert.ToDateTime(txtEffectiveDate.Text)
            SalaryProcess.SalStartDate = Convert.ToDateTime(txtSalStartDate.Text)
            SalaryProcess.SalEndDate = Convert.ToDateTime(txtSalEndDate.Text)
            If chkFullMonthlySalary.Checked = True Then
                SalaryProcess.IsFullMonthlySalary = True
            Else
                SalaryProcess.IsFullMonthlySalary = False
            End If

            SalaryProcess.EntryBy = Session("LoginUserID")

            If chkProcessWithSalary.Checked = True Then
                SalaryProcess.ProcessWithSalary = True
            Else
                SalaryProcess.ProcessWithSalary = False
            End If

            If chkDeductTax.Checked = True Then
                SalaryProcess.ProcessWithTaxDeduction = True
            Else
                SalaryProcess.ProcessWithTaxDeduction = False
            End If

            If chkProcessWithFestBonus.Checked = True Then
                SalaryProcess.ProcessWithFestivalBonus = True
            Else
                SalaryProcess.ProcessWithFestivalBonus = False
            End If

            If chkProcessWithPerformanceBonus.Checked = True Then
                SalaryProcess.ProcessWithPerformanceBonus = True
            Else
                SalaryProcess.ProcessWithPerformanceBonus = False
            End If

            For Each itm As ListItem In chkEmpList.Items
                If itm.Selected = True Then
                    EmployeeIDList &= itm.Value + ","
                End If
            Next

            If EmployeeIDList = "" Then
                MessageBox("Select Employees To Process Salary.")
                Exit Sub
            Else
                EmployeeIDList = EmployeeIDList.Remove(Len(EmployeeIDList) - 1, 1)
                SalaryProcess.EmployeeIDList = EmployeeIDList
            End If


            Dim Check As Integer = SalaryProcessData.fnProcessSalary(SalaryProcess)

            If Check = 1 Then
                MessageBox("Processed Successfully.")
                btnProcessSalary.Enabled = False
            Else
                MessageBox("Error Found.")
            End If
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            drpSalaryYear.SelectedValue = Now.Date.Year
            drpSalaryMonth.SelectedValue = Now.Date.Month
            txtEffectiveDate.Text = Now.Date
            Session("LoginUserID") = Session("LoginUserID")
            chkProcessWithSalary.Checked = True
            txtProcessingEntryPoint.Text = Now.Month.ToString() & "." & Now.Day.ToString() & "." & Now.Year.ToString() & "." & Now.Ticks.ToString()

            Dim thisMonth As New DateTime(DateTime.Today.Year, DateTime.Today.Month, 1)
            txtSalStartDate.Text = thisMonth
            txtSalEndDate.Text = thisMonth.AddMonths(1).AddDays(-1)

            btnProcessSalary.Enabled = False
            GetPayrollAccessInfo()
        End If
    End Sub

    Protected Sub ShowEmpByTypeCode(ByVal EmpTypeCode As String)
        chkEmpList.DataTextField = "EmployeeName"
        chkEmpList.DataValueField = "EmpCode"
        chkEmpList.DataSource = EmpInfoData.fnSearchEmpByTypeCode(EmpTypeCode, Session("UniqueUserID"))
        chkEmpList.DataBind()
    End Sub

    Protected Sub rblEmpType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rblEmpType.SelectedIndexChanged
        ShowEmpByTypeCode(rblEmpType.SelectedValue)
    End Sub

    Protected Sub chkSelectAllEmployees_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkSelectAllEmployees.CheckedChanged

        If chkSelectAllEmployees.Checked = True Then
            For Each item As ListItem In chkEmpList.Items
                item.Selected = True
            Next
        Else
            For Each item As ListItem In chkEmpList.Items
                item.Selected = False
            Next
        End If

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        btnCheckSystem.Enabled = True
        btnProcessSalary.Enabled = False
        EnableAllControls()
        ClearAllControls()
    End Sub

    Protected Sub btnCheckSystem_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCheckSystem.Click

        Dim SalarySummary As New clsEmpSalSummary()
        Dim EmpSelected As Boolean = False

        SalarySummary.SalaryYear = drpSalaryYear.SelectedValue
        SalarySummary.SalaryMonth = drpSalaryMonth.SelectedValue
        SalarySummary.SalStartDate = Convert.ToDateTime(txtSalStartDate.Text)
        SalarySummary.SalEndDate = Convert.ToDateTime(txtSalEndDate.Text)

        Dim MsgSalaryProcessed As String = ""
        Dim MsgFestBonusProcessed As String = ""
        Dim MsgPBProcessed As String = ""
        Dim MsgTextTotal As String = ""
        Dim i As Integer = 0
        Dim modVal As Integer = 10

        For Each item As ListItem In chkEmpList.Items
            If item.Selected = True Then
                EmpSelected = True
                Exit For
            End If
        Next

        If EmpSelected = False Then
            MessageBox("Select And Employee First.")
            Exit Sub
        End If

        ''Checking Salary Already Processed 

        If chkProcessWithSalary.Checked = True Then
            For Each item As ListItem In chkEmpList.Items
                If item.Selected = True Then
                    SalarySummary.EmpCode = item.Value
                    If SalaryProcessData.fnCheckSalaryProcessed(SalarySummary) = "YES" Then
                        MsgSalaryProcessed += item.Value & ","
                        If i Mod modVal = 0 Then
                            MsgSalaryProcessed += "\n"
                        End If
                        item.Selected = False
                        i += 1
                    End If
                End If
            Next
        End If

        If MsgSalaryProcessed <> "" Then
            MsgSalaryProcessed = "Salary Already Processed For Below Employees : " & MsgSalaryProcessed
            MessageBox(MsgSalaryProcessed)
        End If

        EmpSelected = False
        For Each item As ListItem In chkEmpList.Items
            If item.Selected = True Then
                EmpSelected = True
                Exit For
            End If
        Next

        '' End Of Checking Salary Already Processed 

        '' Checking Festival Bonus Already Processed
        i = 0
        If chkProcessWithFestBonus.Checked = True Then
            For Each item As ListItem In chkEmpList.Items
                If item.Selected = True Then
                    SalarySummary.EmpCode = item.Value
                    If SalaryProcessData.fnCheckFestBonusProcessed(SalarySummary) = "YES" Then
                        MsgFestBonusProcessed += item.Value & ","
                        If i Mod modVal = 0 Then
                            MsgFestBonusProcessed += "\n"
                        End If
                        item.Selected = False
                        i += 1
                    End If
                End If
            Next
        End If
        i = 0

        If MsgFestBonusProcessed <> "" Then
            MsgFestBonusProcessed = "Festival Bonus Already Processed For Below Employees : " & MsgFestBonusProcessed
            MessageBox(MsgFestBonusProcessed)
        End If

        EmpSelected = False
        For Each item As ListItem In chkEmpList.Items
            If item.Selected = True Then
                EmpSelected = True
                Exit For
            End If
        Next

        '' End Of Checking Festival Bonus Already Processed

        '' Checking Performance Bonus Already Processed
        i = 0
        If chkProcessWithPerformanceBonus.Checked = True Then
            For Each item As ListItem In chkEmpList.Items
                If item.Selected = True Then
                    SalarySummary.EmpCode = item.Value
                    If SalaryProcessData.fnCheckPBProcessed(SalarySummary) = "YES" Then
                        MsgPBProcessed += item.Value & ","
                        If i Mod modVal = 0 Then
                            MsgPBProcessed += "\n"
                        End If
                        item.Selected = False
                        i += 1
                    End If
                End If
            Next
        End If

        If MsgPBProcessed <> "" Then
            MsgPBProcessed = "Performance Bonus Already Processed For Below Employees : " & MsgPBProcessed
            MessageBox(MsgPBProcessed)
        End If

        EmpSelected = False
        For Each item As ListItem In chkEmpList.Items
            If item.Selected = True Then
                EmpSelected = True
                Exit For
            End If
        Next

        '' End Of Checking Performance Bonus Already Processed

        If EmpSelected = False Then
            MsgTextTotal = "Select An Employee First."
            MessageBox(MsgTextTotal)
            Exit Sub
        Else
            DisableAllControls()
            btnCheckSystem.Enabled = False
            btnProcessSalary.Enabled = True
            MessageBox("System Is Ready To Process Salary.")
        End If

    End Sub

    Protected Sub DisableAllControls()
        txtEffectiveDate.Enabled = False
        txtSalEndDate.Enabled = False
        txtSalStartDate.Enabled = False

        drpSalaryMonth.Enabled = False
        drpSalaryYear.Enabled = False

        chkSelectAllEmployees.Enabled = False
        chkEmpList.Enabled = False
        rblEmpType.Enabled = False

        chkProcessWithSalary.Enabled = False
        chkProcessWithFestBonus.Enabled = False
        chkProcessWithPerformanceBonus.Enabled = False
        chkDeductTax.Enabled = False
        chkFullMonthlySalary.Enabled = False
    End Sub

    Protected Sub EnableAllControls()
        txtEffectiveDate.Enabled = True
        txtSalEndDate.Enabled = True
        txtSalStartDate.Enabled = True

        drpSalaryMonth.Enabled = True
        drpSalaryYear.Enabled = True

        chkSelectAllEmployees.Enabled = True
        chkEmpList.Enabled = True
        rblEmpType.Enabled = True

        chkProcessWithSalary.Enabled = True
        chkProcessWithFestBonus.Enabled = True
        chkProcessWithPerformanceBonus.Enabled = True
        chkDeductTax.Enabled = True
        chkFullMonthlySalary.Enabled = True
    End Sub

    Protected Sub ClearAllControls()
        chkSelectAllEmployees.Checked = False

        For Each item As ListItem In chkEmpList.Items
            If item.Selected = True Then
                item.Selected = False
            End If
        Next

    End Sub

    Dim PayrollAccess As String = ""

    Protected Sub btnCloseorOpenAccess_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCloseorOpenAccess.Click
        PayrollAccess = EmpSettings.fnCheckForPayrollAccess()
        Dim Check As Integer = 0
        If PayrollAccess = "YES" Then
            Check = EmpSettings.fnManagePayrollAccess("Denied")
        Else
            Check = EmpSettings.fnManagePayrollAccess("Allowed")
        End If
        GetPayrollAccessInfo()
    End Sub

    Protected Sub GetPayrollAccessInfo()
        PayrollAccess = EmpSettings.fnCheckForPayrollAccess()

        If PayrollAccess = "YES" Then
            btnCloseorOpenAccess.BackColor = Drawing.Color.Red
            btnCloseorOpenAccess.Text = "Close Access For All"
        Else
            btnCloseorOpenAccess.BackColor = Drawing.Color.Green
            btnCloseorOpenAccess.Text = "Open Access For All"
        End If

    End Sub
End Class
