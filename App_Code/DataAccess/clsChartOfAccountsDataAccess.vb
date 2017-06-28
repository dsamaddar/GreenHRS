Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsChartOfAccountsDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

    Public Function fnGetLedgerList() As DataSet

        Dim sp As String = "spGetLedgerList"
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

    Public Function fnGetDetailsLedgerCodeList() As DataSet

        Dim sp As String = "spGetDetailsLedgerCodeList"
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

#Region " Insert Chart Of Accounts "

    Public Function fnInsertChartOfAccounts(ByVal COA As clsChartOfAccounts) As clsResult
        Dim Result As New clsResult()
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertChartOfAccounts", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@AccountCode", COA.AccountCode)
            cmd.Parameters.AddWithValue("@LedgerName", COA.LedgerName)
            cmd.Parameters.AddWithValue("@ParentCode", COA.ParentCode)
            cmd.Parameters.AddWithValue("@IsBankAccount", COA.IsBankAccount)
            cmd.Parameters.AddWithValue("@BalanceType", COA.BalanceType)
            cmd.Parameters.AddWithValue("@EntryBy", COA.EntryBy)
            cmd.ExecuteNonQuery()
            con.Close()
            Result.Success = True
            Result.Message = "Inserted Successfully."
            Return Result
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Result.Success = False
            Result.Message = "Error Found" & ex.Message
            Return Result
        End Try
    End Function

#End Region


#Region " Update Chart Of Accounts "

    Public Function fnUpdateChartOfAccounts(ByVal COA As clsChartOfAccounts) As clsResult
        Dim Result As New clsResult()
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateChartOfAccounts", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@AccountCodeID", COA.AccountCodeID)
            cmd.Parameters.AddWithValue("@AccountCode", COA.AccountCode)
            cmd.Parameters.AddWithValue("@LedgerName", COA.LedgerName)
            cmd.Parameters.AddWithValue("@ParentCode", COA.ParentCode)
            cmd.Parameters.AddWithValue("@IsBankAccount", COA.IsBankAccount)
            cmd.Parameters.AddWithValue("@BalanceType", COA.BalanceType)
            cmd.Parameters.AddWithValue("@EntryBy", COA.EntryBy)
            cmd.ExecuteNonQuery()
            con.Close()
            Result.Success = True
            Result.Message = "Updated Successfully."
            Return Result
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Result.Success = False
            Result.Message = "Error Found" & ex.Message
            Return Result
        End Try
    End Function

#End Region



End Class
