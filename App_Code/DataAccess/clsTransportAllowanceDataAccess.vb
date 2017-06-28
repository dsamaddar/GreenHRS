Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsTransportAllowanceDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Generate Transport Allowance "
    Public Function fnGenerateTransportAllowance(ByVal TA As clsTransportAllowance) As clsResult
        Dim result As New clsResult()
        Try
            Dim cmd As SqlCommand = New SqlCommand("spGenerateTransportAllowance", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmpList", TA.EmpList)
            cmd.Parameters.AddWithValue("@SalaryYear", TA.SalaryYear)
            cmd.Parameters.AddWithValue("@SalaryMonth", TA.SalaryMonth)
            cmd.Parameters.AddWithValue("@EntryBy", TA.EntryBy)
            cmd.ExecuteNonQuery()
            con.Close()
            result.Message = "Generated Successfully."
            result.Success = True
            Return result
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If

            result.Message = ex.Message
            result.Success = False

            Return result
        End Try
    End Function

#End Region

    Public Function fnChqAlreadyTAGenerated(ByVal TA As clsTransportAllowance) As String
        Dim Status As String = ""
        Dim sp As String = "spChqAlreadyTAGenerated"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", TA.EmployeeID)
                cmd.Parameters.AddWithValue("@SalaryYear", TA.SalaryYear)
                cmd.Parameters.AddWithValue("@SalaryMonth", TA.SalaryMonth)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    Status = dr.Item("Status")
                End While
                con.Close()
                Return Status
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return ""
        End Try
    End Function

End Class
