Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsSalaryProcessDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Components "

    Public Function fnProcessSalary(ByVal SalaryProcess As clsSalaryProcess) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spProcessSalary", con)
            con.Open()
            cmd.CommandTimeout = 0
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@SalaryMonth", SalaryProcess.SalaryMonth)
            cmd.Parameters.AddWithValue("@SalaryYear", SalaryProcess.SalaryYear)
            cmd.Parameters.AddWithValue("@EffectiveDate", SalaryProcess.EffectiveDate)
            cmd.Parameters.AddWithValue("@SalStartDate", SalaryProcess.SalStartDate)
            cmd.Parameters.AddWithValue("@SalEndDate", SalaryProcess.SalEndDate)
            cmd.Parameters.AddWithValue("@EmployeeIDList", SalaryProcess.EmployeeIDList)
            cmd.Parameters.AddWithValue("@IsFullMonthlySalary", SalaryProcess.IsFullMonthlySalary)
            cmd.Parameters.AddWithValue("@ProcessWithSalary", SalaryProcess.ProcessWithSalary)
            cmd.Parameters.AddWithValue("@ProcessWithTaxDeduction", SalaryProcess.ProcessWithTaxDeduction)
            cmd.Parameters.AddWithValue("@ProcessWithFestivalBonus", SalaryProcess.ProcessWithFestivalBonus)
            cmd.Parameters.AddWithValue("@ProcessWithPerformanceBonus", SalaryProcess.ProcessWithPerformanceBonus)
            cmd.Parameters.AddWithValue("@EntryBy", SalaryProcess.EntryBy)
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

#Region " Reverse Sal By Entry Point "

    Public Function fnReverseSalByEntryPoint(ByVal EntryPoint As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spReverseSalByEntryPoint", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EntryPoint", EntryPoint)

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

#Region " Finalize Entry Point "

    Public Function fnFinalizeEntryPoint(ByVal EntryPoint As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spFinalizeEntryPoint", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EntryPoint", EntryPoint)

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

#Region " CheckSalaryProcessed "

    Public Function fnCheckSalaryProcessed(ByVal SalarySummary As clsEmpSalSummary) As String

        Dim sp As String = "spCheckSalaryProcessed"
        Dim SalaryProcessed As String = ""
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmpCode", SalarySummary.EmpCode)
                cmd.Parameters.AddWithValue("@SalaryYear", SalarySummary.SalaryYear)
                cmd.Parameters.AddWithValue("@SalryMonth", SalarySummary.SalaryMonth)
                cmd.Parameters.AddWithValue("@SalStartDate", SalarySummary.SalStartDate)
                cmd.Parameters.AddWithValue("@SalEndDate", SalarySummary.SalEndDate)
                Dim dr As SqlDataReader = cmd.ExecuteReader()
                While dr.Read()
                    SalaryProcessed = dr.Item("SalaryProcessed")
                End While
                con.Close()
                Return SalaryProcessed
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return ""
        End Try
    End Function

#End Region

#Region " Check Fest Bonus Processed "

    Public Function fnCheckFestBonusProcessed(ByVal SalarySummary As clsEmpSalSummary) As String

        Dim sp As String = "spCheckFestBonusProcessed"
        Dim FBProcessed As String = ""
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmpCode", SalarySummary.EmpCode)
                cmd.Parameters.AddWithValue("@SalaryYear", SalarySummary.SalaryYear)
                cmd.Parameters.AddWithValue("@SalryMonth", SalarySummary.SalaryMonth)
                cmd.Parameters.AddWithValue("@SalStartDate", SalarySummary.SalStartDate)
                cmd.Parameters.AddWithValue("@SalEndDate", SalarySummary.SalEndDate)
                Dim dr As SqlDataReader = cmd.ExecuteReader()
                While dr.Read()
                    FBProcessed = dr.Item("FBProcessed")
                End While
                con.Close()
                Return FBProcessed
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return ""
        End Try
    End Function

#End Region

#Region " Check PB Processed "

    Public Function fnCheckPBProcessed(ByVal SalarySummary As clsEmpSalSummary) As String

        Dim sp As String = "spCheckPBProcessed"
        Dim PBProcessed As String = ""
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmpCode", SalarySummary.EmpCode)
                cmd.Parameters.AddWithValue("@SalaryYear", SalarySummary.SalaryYear)
                cmd.Parameters.AddWithValue("@SalryMonth", SalarySummary.SalaryMonth)
                cmd.Parameters.AddWithValue("@SalStartDate", SalarySummary.SalStartDate)
                cmd.Parameters.AddWithValue("@SalEndDate", SalarySummary.SalEndDate)
                Dim dr As SqlDataReader = cmd.ExecuteReader()
                While dr.Read()
                    PBProcessed = dr.Item("PBProcessed")
                End While
                con.Close()
                Return PBProcessed
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return ""
        End Try
    End Function

#End Region

#Region " Find Process Entry Point "
    Public Function fnFindProcessEntryPoint() As DataSet
        Dim sp As String = "spFindProcessEntryPoint"
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

#Region " Find Process Entry Point To Finalize "
    Public Function fnFindProssEntPntToFinalize() As DataSet
        Dim sp As String = "spFindProssEntPntToFinalize"
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

#Region " Get Bank Info By Entry Point "
    Public Function fnGetBankInfoByEntryPoint(ByVal EntryPoint As String) As DataSet
        Dim sp As String = "spGetBankInfoByEntryPoint"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EntryPoint", EntryPoint)
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
