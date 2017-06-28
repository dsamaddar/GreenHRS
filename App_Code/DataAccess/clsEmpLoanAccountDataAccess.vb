Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsEmpLoanAccountDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Emp Loan Account "
    Public Function fnInsertEmpLoanAccount(ByVal EmpLoanAccount As clsEmpLoanAccount) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertEmpLoanAccount", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", EmpLoanAccount.EmployeeID)
            cmd.Parameters.AddWithValue("@BenefitTypeID", EmpLoanAccount.BenefitTypeID)
            cmd.Parameters.AddWithValue("@BenefitID", EmpLoanAccount.BenefitID)
            cmd.Parameters.AddWithValue("@LoanAmount", EmpLoanAccount.LoanAmount)
            cmd.Parameters.AddWithValue("@Tenure", EmpLoanAccount.Tenure)
            cmd.Parameters.AddWithValue("@InterestRate", EmpLoanAccount.InterestRate)
            cmd.Parameters.AddWithValue("@ReimbursementDate", EmpLoanAccount.ReimbursementDate)
            cmd.Parameters.AddWithValue("@IsAdjustableFromSalary", EmpLoanAccount.IsAdjustableFromSalary)
            cmd.Parameters.AddWithValue("@IsAbatementApplicable", EmpLoanAccount.IsAbatementApplicable)
            cmd.Parameters.AddWithValue("@IsDepreciatedAutomatically", EmpLoanAccount.IsDepreciatedAutomatically)
            cmd.Parameters.AddWithValue("@LoanStatus", EmpLoanAccount.LoanStatus)
            cmd.Parameters.AddWithValue("@Amortization", EmpLoanAccount.Amortization)
            cmd.Parameters.AddWithValue("@EntryBy", EmpLoanAccount.EntryBy)
            cmd.ExecuteNonQuery()
            con.Close()
            Return 1
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return 0
        End Try
    End Function
#End Region

#Region " Get Emp Wise Loan Acc "

    Public Function fnGetEmpWiseLoanAcc(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spGetEmpWiseLoanAcc"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
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

#Region " Get Loan Availed Emp "

    Public Function fnGetLoanAvailedEmp() As DataSet

        Dim sp As String = "spGetLoanAvailedEmp"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
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

#Region " Get All Approved Loan Acc "

    Public Function fnGetAllApprovedLoanAcc(ByVal BenefitTypeID As String, ByVal StartDate As Date, ByVal EndDate As Date) As DataSet

        Dim sp As String = "spGetAllApprovedLoanAcc"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@BenefitTypeID", BenefitTypeID)
                cmd.Parameters.AddWithValue("@StartDate", StartDate)
                cmd.Parameters.AddWithValue("@EndDate", EndDate)
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

#Region " Get Emp Wise Loan Acc List "

    Public Function fnGetEmpWiseLoanAccList(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spGetEmpWiseLoanAccList"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
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

#Region " Get All Approved Loan Acc By Emp ID "

    Public Function fnGetAllApprovedLoanAccByEmpID(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spGetAllApprovedLoanAccByEmpID"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
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

#Region " Loan Early Settlement "
    Public Function fnLoanEarlySettlement(ByVal EmpLoanAccount As clsEmpLoanAccount) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spLoanEarlySettlement", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", EmpLoanAccount.EmployeeID)
            cmd.Parameters.AddWithValue("@EmpLoanAccountID", EmpLoanAccount.EmpLoanAccountID)
            cmd.Parameters.AddWithValue("@SettlementAmount", EmpLoanAccount.SettlementAmount)
            cmd.Parameters.AddWithValue("@AdjustmentDate", EmpLoanAccount.AdjustmentDate)
            cmd.Parameters.AddWithValue("@AdjustmentRemarks", EmpLoanAccount.AdjustmentRemarks)
            cmd.ExecuteNonQuery()
            con.Close()
            Return 1
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return 0
        End Try
    End Function
#End Region

End Class
