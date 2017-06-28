Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class clsBankDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Bank "

    Public Function fnInsertBank(ByVal Bank As clsBank) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertBank", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@BankName", Bank.BankName)
            cmd.Parameters.AddWithValue("@IsActive", Bank.isActive)
            cmd.Parameters.AddWithValue("@EntryBy", Bank.EntryBy)
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
