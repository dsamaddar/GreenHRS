Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsEmpSalSummaryDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Fund Transfer Details "

    Public Function fnFundTransferDetails(ByVal ULCBankAccID As String, ByVal SalaryYear As Integer, ByVal SalaryMonth As Integer, ByVal EmpTypeList As String, ByVal ProcessWithSalary As Boolean, ByVal ProcessWithFB As Boolean, ByVal ProcessWithPB As Boolean) As DataSet
        Dim sp As String = "spFundTransferDetails"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@ULCBankAccID", ULCBankAccID)
                cmd.Parameters.AddWithValue("@SalaryYear", SalaryYear)
                cmd.Parameters.AddWithValue("@SalaryMonth", SalaryMonth)
                cmd.Parameters.AddWithValue("@EmpTypeList", EmpTypeList)
                cmd.Parameters.AddWithValue("@ProcessWithSalary", ProcessWithSalary)
                cmd.Parameters.AddWithValue("@ProcessWithFB", ProcessWithFB)
                cmd.Parameters.AddWithValue("@ProcessWithPB", ProcessWithPB)
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()
                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Generate Sal Report Large "

    Public Function fnGenerateSalReportLarge(ByVal SalaryYear As Integer, ByVal SalaryMonth As Integer) As DataSet

        Dim sp As String = "spGenerateSalReportLarge"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.CommandTimeout = 1000
                cmd.Parameters.AddWithValue("@SalaryYear", SalaryYear)
                cmd.Parameters.AddWithValue("@SalaryMonth", SalaryMonth)
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()
                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Process Dummy Salary "

    Public Function fnProcessDummySalary(ByVal WithFestival As Boolean, ByVal WithPB As Boolean) As DataSet

        Dim sp As String = "spProcessDummySalary"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.CommandTimeout = 1000
                cmd.Parameters.AddWithValue("@WithFestival", WithFestival)
                cmd.Parameters.AddWithValue("@WithPB", WithPB)
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()
                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Fund Transfer Details Ent Pnt "

    Public Function fnFundTransferDetailsEntPnt(ByVal ULCBankAccID As String, ByVal EntryPointList As String) As DataSet

        Dim sp As String = "spFundTransferDetailsEntPnt"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@ULCBankAccID", ULCBankAccID)
                cmd.Parameters.AddWithValue("@EntryPointList", EntryPointList)
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()
                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Sal Summary By EmpID "

    Public Function fnGetSalSummaryByEmpID(ByVal EmpSal As clsEmpSalary) As clsEmpSalSummary
        Dim EmpSalSummary As New clsEmpSalSummary()
        Dim sp As String = "spGetSalSummaryByEmpID"
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmpSal.EmployeeID)
                cmd.Parameters.AddWithValue("@SalaryYear", EmpSal.SalaryYear)
                cmd.Parameters.AddWithValue("@SalaryMonth", EmpSal.SalaryMonth)
                Dim dr As SqlDataReader = cmd.ExecuteReader()

                While dr.Read()
                    EmpSalSummary.Department = dr.Item("Department")
                    EmpSalSummary.Designation = dr.Item("Designation")
                    EmpSalSummary.ULCBranch = dr.Item("ULCBranch")
                    EmpSalSummary.Bank = dr.Item("Bank")
                    EmpSalSummary.Branch = dr.Item("Branch")
                    EmpSalSummary.BankAccountNo = dr.Item("BankAccountNo")
                    EmpSalSummary.BasicSalary = dr.Item("BasicSalary")
                    EmpSalSummary.Salary = dr.Item("Salary")
                    EmpSalSummary.LoanSettlement = dr.Item("LoanSettlement")
                    EmpSalSummary.TaxDeduction = dr.Item("TaxDeduction")
                End While
                con.Close()
                Return EmpSalSummary
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

End Class
