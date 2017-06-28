Imports System.Data
Imports System.Data.OleDb
Imports System.IO
Imports System.Configuration

Partial Class frmBusinessExGradingUpload
    Inherits System.Web.UI.Page

    Protected Function FormatBusinessExGrading() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("emp_code", System.Type.GetType("System.String"))
        dt.Columns.Add("long_term", System.Type.GetType("System.Double"))
        dt.Columns.Add("long_term_business", System.Type.GetType("System.Double"))
        dt.Columns.Add("credit_sale", System.Type.GetType("System.Double"))
        dt.Columns.Add("distributor_finance", System.Type.GetType("System.Double"))
        dt.Columns.Add("overdue", System.Type.GetType("System.Double"))
        dt.Columns.Add("classification", System.Type.GetType("System.Double"))
        dt.Columns.Add("final_grade", System.Type.GetType("System.String"))
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
        Dim dtBusinessExGrading As New DataTable()
        dtBusinessExGrading = FormatBusinessExGrading()

        cmdExcel.Connection = connExcel
        'Get the name of First Sheet
        connExcel.Open()
        Dim dtExcelSchema As DataTable
        dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, Nothing)
        Dim SheetName As String = dtExcelSchema.Rows(0)("TABLE_NAME").ToString()
        connExcel.Close()

        'Read Data from First Sheet
        connExcel.Open()
        cmdExcel.CommandText = "SELECT emp_code,long_term,long_term_business,credit_sale,distributor_finance,overdue,classification,final_grade From [" & SheetName & "]"
        oda.SelectCommand = cmdExcel
        oda.Fill(dtBusinessExGrading)
        connExcel.Close()

        Session("BusinessExGrading") = dtBusinessExGrading

        'Bind Data to GridView
        grdBusinessExGrad.Caption = Path.GetFileName(FilePath)
        grdBusinessExGrad.DataSource = dtBusinessExGrading
        grdBusinessExGrad.DataBind()

    End Sub

    Protected Sub btnUpload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpload.Click
        If FileUpload1.HasFile Then
            Try
                Dim FileName As String = Path.GetFileName(FileUpload1.PostedFile.FileName)
                Dim Extension As String = Path.GetExtension(FileUpload1.PostedFile.FileName)
                Dim FolderPath As String = ConfigurationManager.AppSettings("FolderPath")
                Dim FilePath As String = Server.MapPath(FolderPath + FileName)

                FileUpload1.SaveAs(FilePath)
                Import_To_Grid(FilePath, Extension, rbHDR.SelectedItem.Text)
                btnUploadInformation.Enabled = True
            Catch ex As Exception
                MessageBox(ex.Message)
            End Try
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("BusinessExGrading") = ""
            btnUploadInformation.Enabled = False
            drpEvaluationYear.SelectedValue = Now.Year.ToString()
        End If
    End Sub

    Protected Sub btnUploadInformation_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUploadInformation.Click

        Dim dtBusinessExGrading As New DataTable()
        dtBusinessExGrading = Session("BusinessExGrading")
        Dim BusinessExGrad As New clsBusinessExGrading()

        Dim ProcessedStr As String = ""
        Dim NotProcessedStr As String = ""

        For Each rw As DataRow In dtBusinessExGrading.Rows
            BusinessExGrad.EmpCode = rw.Item("emp_code")
            BusinessExGrad.EvaluationYear = Convert.ToInt32(drpEvaluationYear.SelectedValue)
            BusinessExGrad.longTerm = Convert.ToDouble(rw.Item("long_term"))
            BusinessExGrad.LongTermBusiness = Convert.ToDouble(rw.Item("long_term_business"))
            BusinessExGrad.CreditSales = Convert.ToDouble(rw.Item("credit_sale"))
            BusinessExGrad.DistributorFinance = Convert.ToDouble(rw.Item("distributor_finance"))
            BusinessExGrad.Overdue = Convert.ToDouble(rw.Item("overdue"))
            BusinessExGrad.Classification = Convert.ToDouble(rw.Item("classification"))
            BusinessExGrad.FinalGrade = rw.Item("final_grade")
            BusinessExGrad.EntryBy = Session("LoginUserID")

            Dim check As Integer = BusinessExGrad.fnInsertBusinessExGrading(BusinessExGrad)
            If check = 0 Then
                NotProcessedStr += BusinessExGrad.EmpCode + ","
            Else
                ProcessedStr += BusinessExGrad.EmpCode + ","
            End If

        Next

        MessageBox("---------------Processed---------------------\n" + ProcessedStr + _
          "\n\n" + "---------------Not Processed-----------------\n" + _
                   NotProcessedStr)
        ClearForm()
    End Sub

    Protected Sub ClearForm()
        Session("BusinessExGrading") = ""
        grdBusinessExGrad.DataSource = ""
        grdBusinessExGrad.DataBind()
        btnUploadInformation.Enabled = False
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

End Class
