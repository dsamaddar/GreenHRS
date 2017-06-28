Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsSuitableBranchDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Get Branch Tag By Candidate "

    Public Function fnGetBranchTagByCandidate(ByVal CandidateID As String) As DataSet

        Dim sp As String = "spGetBranchTagByCandidate"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
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

#Region " Insert Bulk Suitable Region "
    Public Function fnInsertBulkSuitableRegion(ByVal CandidateID As String, ByVal SuitableForRegion As String, ByVal EntryBy As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertBulkSuitableRegion", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
            cmd.Parameters.AddWithValue("@SuitableForRegion", SuitableForRegion)
            cmd.Parameters.AddWithValue("@EntryBy", EntryBy)
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

#Region " Insert Bulk Suitable Branch "
    Public Function fnInsertBulkSuitableBranch(ByVal CandidateID As String, ByVal SuitableForBranch As String, ByVal EntryBy As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertBulkSuitableBranch", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
            cmd.Parameters.AddWithValue("@SuitableForBranch", SuitableForBranch)
            cmd.Parameters.AddWithValue("@EntryBy", EntryBy)
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
