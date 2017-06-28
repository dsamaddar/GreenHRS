Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsAppliedJobDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

    Public Function fnGetAppStatusByCandidate(ByVal CandidateID As String) As DataSet

        Dim sp As String = "spGetAppStatusByCandidate"
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

#Region " Change Can Status "

    Public Function fnChangeCanStatus(ByVal CandidateID As String, ByVal RejectionRemarks As String, ByVal EntryBy As String) As clsResult
        Dim res As New clsResult()
        Try
            Dim cmd As SqlCommand = New SqlCommand("spChangeCanStatus", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
            cmd.Parameters.AddWithValue("@RejectionRemarks", RejectionRemarks)
            cmd.Parameters.AddWithValue("@EntryBy", EntryBy)
            cmd.ExecuteNonQuery()
            con.Close()
            res.Success = 1
            res.Message = "Candidate Rejected"
            Return res
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            res.Success = 0
            res.Message = ex.Message
            Return res
        End Try
    End Function

#End Region

#Region " Upload Emp From XML "

    Public Function fnUploadEmpFromXML(ByVal CanXML As String) As clsResult
        Dim res As New clsResult()
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUploadEmpFromXML", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@CanXML", CanXML)
            cmd.ExecuteNonQuery()
            con.Close()
            res.Success = 1
            res.Message = "Employee Uploaded."
            Return res
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            res.Success = 0
            res.Message = ex.Message
            Return res
        End Try
    End Function

#End Region

End Class
