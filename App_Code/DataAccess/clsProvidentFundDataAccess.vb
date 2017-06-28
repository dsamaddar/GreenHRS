Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsProvidentFundDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

    Public Function fnInsertProvidentFundInfo(ByVal ProvidentFund As clsProvidentFund) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertProvidentFundInfo", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", ProvidentFund.EmployeeID)
            cmd.Parameters.AddWithValue("@SalMonth", ProvidentFund.SalMonth)
            cmd.Parameters.AddWithValue("@SalYear", ProvidentFund.SalYear)
            cmd.Parameters.AddWithValue("@EmpContribution", ProvidentFund.EmpContribution)
            cmd.Parameters.AddWithValue("@CreditedIntEmp", ProvidentFund.CreditedIntEmp)
            cmd.Parameters.AddWithValue("@ComContribution", ProvidentFund.ComContribution)
            cmd.Parameters.AddWithValue("@CreditedIntCom", ProvidentFund.CreditedIntCom)
            cmd.Parameters.AddWithValue("@ProcessDate", ProvidentFund.ProcessDate)
            cmd.Parameters.AddWithValue("@EntryPoint", ProvidentFund.EntryPoint)
            cmd.Parameters.AddWithValue("@Remarks", ProvidentFund.Remarks)
            cmd.Parameters.AddWithValue("@EntryBy", ProvidentFund.EntryBy)
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

    Public Function fnInsertProvidentFundInfoForBulk(ByVal ProvidentFund As clsProvidentFund) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertProvidentFundInfoForBulk", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmpCode", ProvidentFund.EmpCode)
            cmd.Parameters.AddWithValue("@SalMonth", ProvidentFund.SalMonth)
            cmd.Parameters.AddWithValue("@SalYear", ProvidentFund.SalYear)
            cmd.Parameters.AddWithValue("@EmpContribution", ProvidentFund.EmpContribution)
            cmd.Parameters.AddWithValue("@CreditedIntEmp", ProvidentFund.CreditedIntEmp)
            cmd.Parameters.AddWithValue("@ComContribution", ProvidentFund.ComContribution)
            cmd.Parameters.AddWithValue("@CreditedIntCom", ProvidentFund.CreditedIntCom)
            cmd.Parameters.AddWithValue("@ProcessDate", ProvidentFund.ProcessDate)
            cmd.Parameters.AddWithValue("@EntryPoint", ProvidentFund.EntryPoint)
            cmd.Parameters.AddWithValue("@Remarks", ProvidentFund.Remarks)
            cmd.Parameters.AddWithValue("@EntryBy", ProvidentFund.EntryBy)
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

    Public Function fnUpdateProvidentFundInfo(ByVal ProvidentFund As clsProvidentFund) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateProvidentFundInfo", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ProvidentFundID", ProvidentFund.ProvidentFundID)
            cmd.Parameters.AddWithValue("@EmployeeID", ProvidentFund.EmployeeID)
            cmd.Parameters.AddWithValue("@SalMonth", ProvidentFund.SalMonth)
            cmd.Parameters.AddWithValue("@SalYear", ProvidentFund.SalYear)
            cmd.Parameters.AddWithValue("@EmpContribution", ProvidentFund.EmpContribution)
            cmd.Parameters.AddWithValue("@CreditedIntEmp", ProvidentFund.CreditedIntEmp)
            cmd.Parameters.AddWithValue("@ComContribution", ProvidentFund.ComContribution)
            cmd.Parameters.AddWithValue("@CreditedIntCom", ProvidentFund.CreditedIntCom)
            cmd.Parameters.AddWithValue("@ProcessDate", ProvidentFund.ProcessDate)
            cmd.Parameters.AddWithValue("@Remarks", ProvidentFund.Remarks)
            cmd.Parameters.AddWithValue("@EntryBy", ProvidentFund.EntryBy)
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

    Public Function fnGetPFInfoByEmpID(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spGetPFInfoByEmpID"
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

End Class
