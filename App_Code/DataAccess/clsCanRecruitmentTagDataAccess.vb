Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsCanRecruitmentTagDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Can Recruitment Tag "

    Public Function fnInsertCanRecruitmentTag(ByVal CanRecTag As clsCanRecruitmentTag) As clsResult
        Dim Result As New clsResult()
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertCanRecruitmentTag", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@CandidateID", CanRecTag.CandidateID)
            cmd.Parameters.AddWithValue("@RecruitmentTypeID", CanRecTag.RecruitmentTypeID)
            cmd.Parameters.AddWithValue("@EntryBy", CanRecTag.EntryBy)
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

#Region " Insert Bulk Tag "

    Public Function fnInsertBulkTag(ByVal CanRecTag As clsCanRecruitmentTag) As clsResult
        Dim Result As New clsResult()
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertBulkTag", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@CandidateID", CanRecTag.CandidateID)
            cmd.Parameters.AddWithValue("@TagList", CanRecTag.TagList)
            cmd.Parameters.AddWithValue("@EntryBy", CanRecTag.EntryBy)
            cmd.ExecuteNonQuery()
            con.Close()
            Result.Success = True
            Result.Message = "Tagged Successfully."
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

#Region " Get Rec Tag By Candidate "

    Public Function fnGetRecTagByCandidate(ByVal CandidateID As String) As DataSet
        Dim sp As String = "spGetRecTagByCandidate"
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

End Class
