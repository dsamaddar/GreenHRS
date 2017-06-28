Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared
Imports System.IO

Partial Class Payroll_frmJVReport
    Inherits System.Web.UI.Page

    Dim EmpInfoData As New clsEmployeeInfoDataAccess()
    Dim VoucherDetailsData As New clsVoucherDetailsDataAccess()
    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()
    Dim TotalDebit As Double = 0
    Dim TotalCredit As Double = 0

    Protected Sub ShowEmployeeType()
        chkEmployeeGroup.DataTextField = "EmployeeTypeName"
        chkEmployeeGroup.DataValueField = "EmployeeTypeID"
        chkEmployeeGroup.DataSource = EmployeeInfoData.fnGetEmployeeType()
        chkEmployeeGroup.DataBind()
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

    Protected Sub btnShowReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShowReport.Click

        Dim VoucherDetails As New clsVoucherDetails()

        VoucherDetails.EmployeeID = drpUserList.SelectedValue
        VoucherDetails.ULCBranchID = drpULCBranch.SelectedValue
        VoucherDetails.SalaryYear = drpSalaryYear.SelectedValue
        VoucherDetails.SalaryMonth = drpSalaryMonth.SelectedValue

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

        VoucherDetails.EmpTypeList = EmpTypeList

        grdSalVoucher.DataSource = VoucherDetailsData.fnViewSalaryVoucher(VoucherDetails)
        grdSalVoucher.DataBind()

    End Sub

    Protected Sub btnExportReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExportReport.Click
        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String

        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]

        Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionStringRpt").ConnectionString
        Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

        Try
            Dim ExportedReportName As String = "JV" + "-" + drpSalaryMonth.SelectedItem.Text + "-" + drpSalaryYear.SelectedItem.Text

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

            f = "~/Payroll/Report/"
            folder = Server.MapPath(f)
            repName = folder & "rptSalaryJV.rpt"
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
            myReport.SetParameterValue("@SalaryYear", Convert.ToInt32(drpSalaryYear.SelectedValue))
            myReport.SetParameterValue("@SalaryMonth", Convert.ToInt32(drpSalaryMonth.SelectedValue))
            myReport.SetParameterValue("@EmployeeID", drpUserList.SelectedValue)
            myReport.SetParameterValue("@ULCBranchID", drpULCBranch.SelectedValue)
            myReport.SetParameterValue("@EmpTypeList", EmpTypeList)
            myReport.ExportToHttpResponse(Convert.ToInt32(drpReportFormat.SelectedValue), Response, True, ExportedReportName)
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
            ShowUserList()
            ShowEmployeeType()
            ShowULCBranch()
            drpSalaryYear.SelectedValue = Now.Year.ToString()
            drpSalaryMonth.SelectedValue = Now.Month.ToString()
        End If
    End Sub

    Protected Sub ShowULCBranch()
        drpULCBranch.DataTextField = "ULCBranchName"
        drpULCBranch.DataValueField = "ULCBranchID"
        drpULCBranch.DataSource = EmployeeInfoData.fnGetULCBranch()
        drpULCBranch.DataBind()

        Dim A As New ListItem
        A.Text = "N\A"
        A.Value = "N\A"
        drpULCBranch.Items.Insert(0, A)
    End Sub

    Protected Sub grdSalVoucher_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdSalVoucher.RowDataBound
        Dim lblDebit, lblCredit As New Label()

        If e.Row.RowType = DataControlRowType.DataRow Then
            lblDebit = e.Row.FindControl("lblDebit")
            lblCredit = e.Row.FindControl("lblCredit")
            TotalDebit += Convert.ToDouble(lblDebit.Text)
            TotalCredit += Convert.ToDouble(lblCredit.Text)
        End If

        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(2).Text = String.Format("{0:0,#.##}", TotalDebit.ToString())
            e.Row.Cells(3).Text = String.Format("{0:0,#.##}", TotalCredit.ToString())
        End If

    End Sub

    Protected Sub btnGenVoucherRpt_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGenVoucherRpt.Click

        Dim VoucherDetails As New clsVoucherDetails()

        VoucherDetails.AccountType = drpAccountType.SelectedValue
        VoucherDetails.SalaryYear = drpSalaryYear.SelectedValue
        VoucherDetails.SalaryMonth = drpSalaryMonth.SelectedValue

        grdVoucherRpt.DataSource = VoucherDetailsData.fnReportBranchWiseSalJV(VoucherDetails)
        grdVoucherRpt.DataBind()

        Dim sw As New StringWriter()
        Dim hw As New System.Web.UI.HtmlTextWriter(sw)
        Dim frm As HtmlForm = New HtmlForm()

        Page.Response.AddHeader("content-disposition", "attachment;filename=SalaryVoucherReport_" & drpAccountType.SelectedValue.ToString() & "_" & drpSalaryMonth.SelectedValue.ToString() & "_" & drpSalaryYear.SelectedValue.ToString() & ".xls")
        Page.Response.ContentType = "application/vnd.ms-excel"
        Page.Response.Charset = ""
        Page.EnableViewState = False
        frm.Attributes("runat") = "server"
        Controls.Add(frm)
        frm.Controls.Add(grdVoucherRpt)
        frm.RenderControl(hw)
        Response.Write(sw.ToString())
        Response.End()
    End Sub

End Class
