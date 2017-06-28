Imports System.Data
Imports System.Data.OleDb
Imports System.IO
Imports System.Configuration

Partial Class Payroll_frmPFAuditRptIntegration
    Inherits System.Web.UI.Page

    Dim PFData As New clsProvidentFundDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("AuditedPF") = FormatAuditedPF()
            btnUpload.Enabled = False
            drpSalaryYear.SelectedValue = Now.Year.ToString()
        End If
    End Sub

    Protected Function FormatAuditedPF() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("EmpCode", System.Type.GetType("System.String"))
        dt.Columns.Add("CreditedInterest", System.Type.GetType("System.Double"))
        Return dt
    End Function

    Private Sub Import_To_Grid(ByVal FilePath As String, ByVal Extension As String, ByVal isHDR As String)
        Dim conStr As String = ""
        Select Case Extension
            Case ".xls"
                'Excel 97-03
                conStr = ConfigurationManager.ConnectionStrings("Excel03ConString").ConnectionString()
                Exit Select
            Case ".xlsx"
                'Excel 07
                conStr = ConfigurationManager.ConnectionStrings("Excel07ConString").ConnectionString()
                Exit Select
        End Select

        conStr = String.Format(conStr, FilePath, isHDR)
        Dim connExcel As New OleDbConnection(conStr)
        Dim cmdExcel As New OleDbCommand()
        Dim oda As New OleDbDataAdapter()
        Dim dtAuditedPF As New DataTable()
        dtAuditedPF = FormatAuditedPF()

        cmdExcel.Connection = connExcel
        'Get the name of First Sheet
        connExcel.Open()
        Dim dtExcelSchema As DataTable
        dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, Nothing)
        Dim SheetName As String = dtExcelSchema.Rows(0)("TABLE_NAME").ToString()
        connExcel.Close()

        'Read Data from First Sheet
        connExcel.Open()
        cmdExcel.CommandText = "SELECT EmpCode,ROUND(CreditedInterest,0) as CreditedInterest From [" & SheetName & "]"
        oda.SelectCommand = cmdExcel
        oda.Fill(dtAuditedPF)
        connExcel.Close()

        Session("AuditedPF") = dtAuditedPF

        'Bind Data to GridView
        grdDisplayAuditedPF.Caption = Path.GetFileName(FilePath)
        grdDisplayAuditedPF.DataSource = dtAuditedPF
        grdDisplayAuditedPF.DataBind()

    End Sub

    Protected Sub btnPreview_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPreview.Click
        If flupAttachment.HasFile Then
            Try
                Dim FileName As String = Path.GetFileName(flupAttachment.PostedFile.FileName)
                Dim Extension As String = Path.GetExtension(flupAttachment.PostedFile.FileName)
                Dim FolderPath As String = ConfigurationManager.AppSettings("AuditedPFPath")
                Dim FilePath As String = Server.MapPath(FolderPath + FileName)

                flupAttachment.SaveAs(FilePath)
                Import_To_Grid(FilePath, Extension, rbHDR.SelectedItem.Text)
                btnUpload.Enabled = True
            Catch ex As Exception
                MessageBox(ex.Message)
            End Try
        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Dim TotalCreditedInterest As Double = 0
    Protected Sub grdDisplayAuditedPF_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdDisplayAuditedPF.RowDataBound
        Dim lblCreditedInterest As New Label
        If e.Row.RowType = DataControlRowType.DataRow Then
            lblCreditedInterest = e.Row.FindControl("lblCreditedInterest")
            TotalCreditedInterest += Convert.ToDouble(lblCreditedInterest.Text)
        End If

        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(0).Text = "Total :"
            e.Row.Cells(1).Text = TotalCreditedInterest.ToString("#,##0.00")
        End If

    End Sub

    Protected Sub btnUpload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpload.Click
        Dim lblEmpCode, lblCreditedInterest As New Label
        Dim PF As New clsProvidentFund()
        For Each rw As GridViewRow In grdDisplayAuditedPF.Rows
            lblEmpCode = rw.FindControl("lblEmpCode")
            lblCreditedInterest = rw.FindControl("lblCreditedInterest")

            PF.EmpCode = Replace(Replace(lblEmpCode.Text, " ", ""), ",", "")
            PF.SalMonth = 12
            PF.SalYear = Convert.ToInt32(drpSalaryYear.SelectedValue)
            PF.EmpContribution = 0
            PF.CreditedIntEmp = Convert.ToDouble(lblCreditedInterest.Text)
            PF.ComContribution = 0
            PF.CreditedIntCom = Convert.ToDouble(lblCreditedInterest.Text)
            PF.ProcessDate = Now.Date
            PF.EntryPoint = ""
            PF.Remarks = txtRemarks.Text
            PF.EntryBy = Session("LoginUserID")

            Dim Check As Integer = PFData.fnInsertProvidentFundInfoForBulk(PF)

            If Check <> 1 Then
                MessageBox("Error Found. FOR Emp Code : " + lblEmpCode.Text)
            End If
        Next

        MessageBox("Processing Done.")
        btnUpload.Enabled = False
        btnPreview.Enabled = True
    End Sub
End Class
