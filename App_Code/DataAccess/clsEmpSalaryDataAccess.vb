Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsEmpSalaryDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Show Emp Salary By Component Status "

    Public Function fnShowEmpSalaryByCompStatus(ByVal EmpSalary As clsEmpSalary) As DataSet

        Dim sp As String = "spShowEmpSalaryByCompStatus"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmpSalary.EmployeeID)
                cmd.Parameters.AddWithValue("@CompStatus", EmpSalary.CompStatus)
                cmd.Parameters.AddWithValue("@SalaryYear", EmpSalary.SalaryYear)
                cmd.Parameters.AddWithValue("@SalaryMonth", EmpSalary.SalaryMonth)

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

#Region " Get Tax Info By Sal "

    Public Function fnGetTaxInfoBySal(ByVal EmpSalary As clsEmpSalary) As DataSet

        Dim sp As String = "spGetTaxInfoBySal"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmpSalary.EmployeeID)
                cmd.Parameters.AddWithValue("@SalaryYear", EmpSalary.SalaryYear)
                cmd.Parameters.AddWithValue("@SalaryMonth", EmpSalary.SalaryMonth)
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


#Region " GetSalTaxableIncome "

    Public Function fnGetSalTaxableIncome(ByVal EmpSalary As clsEmpSalary) As DataSet

        Dim sp As String = "spGetSalTaxableIncome"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmpSalary.EmployeeID)
                cmd.Parameters.AddWithValue("@SalaryYear", EmpSalary.SalaryYear)
                cmd.Parameters.AddWithValue("@SalaryMonth", EmpSalary.SalaryMonth)
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

End Class
