Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class clsBranchDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Branch "

    Public Function fnInsertBranch(ByVal Branch As clsBranch) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertBranch", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@BankID", Branch.BankID)
            cmd.Parameters.AddWithValue("@BranchName", Branch.BranchName)
            cmd.Parameters.AddWithValue("@IsActive", Branch.isActive)
            cmd.Parameters.AddWithValue("@EntryBy", Branch.EntryBy)
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
