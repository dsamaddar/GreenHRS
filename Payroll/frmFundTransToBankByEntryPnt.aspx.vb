Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Partial Class Payroll_frmFundTransToBankByEntryPnt
    Inherits System.Web.UI.Page

    Dim ULCBankAccData As New clsULCBankAccDataAccess()
    Dim EmpSalSumData As New clsEmpSalSummaryDataAccess()
    Dim SalProcessData As New clsSalaryProcessDataAccess()
    Dim TotalSalary As Double = 0

    Protected Sub ShowULCBanAccInfo()
        drpBanlAccList.DataTextField = "BankAcc"
        drpBanlAccList.DataValueField = "ULCBankAccID"
        drpBanlAccList.DataSource = ULCBankAccData.fnShowULCBankAccountList()
        drpBanlAccList.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ''ShowULCBanAccInfo()
            ShowEntryPoints()
            txtPaymentDate.Text = Now.Date
        End If
    End Sub

    Protected Sub ShowEntryPoints()
        chkBxSalEntryPoint.DataTextField = "EntryPointText"
        chkBxSalEntryPoint.DataValueField = "EntryPoint"
        chkBxSalEntryPoint.DataSource = SalProcessData.fnFindProcessEntryPoint()
        chkBxSalEntryPoint.DataBind()
    End Sub

    Protected Sub btnProcessReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcessReport.Click
        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String

        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]

        Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString
        Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

        Dim EntryPointList As String = ""

        For Each itm As ListItem In chkBxSalEntryPoint.Items
            If itm.Selected = True Then
                EntryPointList += itm.Value + ","
            End If
        Next

        If EntryPointList <> "" Then
            EntryPointList = EntryPointList.Remove(Len(EntryPointList) - 1, 1)
        End If

        Try
            f = "~/Payroll/Report/"
            folder = Server.MapPath(f)
            repName = folder & "rptFundTransferToBankEntPnt.rpt"
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
            myReport.SetParameterValue("@EntryPointList", EntryPointList)
            myReport.SetParameterValue("@PaymentDate", Convert.ToDateTime(txtPaymentDate.Text))
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

    Protected Sub btnShowDetails_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShowDetails.Click
        Try

            Dim EntryPointList As String = ""

            For Each itm As ListItem In chkBxSalEntryPoint.Items
                If itm.Selected = True Then
                    EntryPointList += itm.Value + ","
                End If
            Next

            If EntryPointList <> "" Then
                EntryPointList = EntryPointList.Remove(Len(EntryPointList) - 1, 1)
            End If

            grdSalaryDetails.DataSource = EmpSalSumData.fnFundTransferDetailsEntPnt(drpBanlAccList.SelectedValue, EntryPointList)
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
            e.Row.Cells(1).Text = "Total Salary:"
            e.Row.Cells(2).Text = TotalSalary.ToString("#,##0.00")
        End If
    End Sub

    Protected Sub chkBxSalEntryPoint_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkBxSalEntryPoint.SelectedIndexChanged



        drpHiddenList.DataTextField = "BankName"
        drpHiddenList.DataValueField = "ULCBankAccID"
        drpHiddenList.DataSource = SalProcessData.fnGetBankInfoByEntryPoint(chkBxSalEntryPoint.SelectedValue)
        drpHiddenList.DataBind()

        Dim Exists As Boolean = False
        For Each itm As ListItem In drpHiddenList.Items

            For Each itm1 As ListItem In drpBanlAccList.Items
                If itm.Value = itm1.Value Then
                    Exists = True
                    Exit For
                End If
            Next

            If Exists = False Then
                drpBanlAccList.Items.Add(itm)
            Else
                Exists = False
            End If

        Next

    End Sub

End Class
