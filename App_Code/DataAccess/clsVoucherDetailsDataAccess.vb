Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsVoucherDetailsDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

    Public Function fnViewSalaryVoucher(ByVal VoucherDetails As clsVoucherDetails) As DataSet

        Dim sp As String = "spViewSalaryVoucher"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@SalaryYear", VoucherDetails.SalaryYear)
                cmd.Parameters.AddWithValue("@SalaryMonth", VoucherDetails.SalaryMonth)
                cmd.Parameters.AddWithValue("@EmployeeID", VoucherDetails.EmployeeID)
                cmd.Parameters.AddWithValue("@ULCBranchID", VoucherDetails.ULCBranchID)
                cmd.Parameters.AddWithValue("@EmpTypeList", VoucherDetails.EmpTypeList)
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

    Public Function fnReportBranchWiseSalJV(ByVal VoucherDetails As clsVoucherDetails) As DataSet

        Dim sp As String = "spReportBranchWiseSalJV"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@SalaryYear", VoucherDetails.SalaryYear)
                cmd.Parameters.AddWithValue("@SalaryMonth", VoucherDetails.SalaryMonth)
                cmd.Parameters.AddWithValue("@AccountType", VoucherDetails.AccountType)
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

End Class
