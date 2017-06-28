Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsCandidateResponseDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Candidate Response "

    Public Function fnInsertCanResponse(ByVal CanResonse As clsCandidateResponse) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertCanResponse", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@CandidateID", CanResonse.CandidateID)
            cmd.Parameters.AddWithValue("@CommunicationMethod", CanResonse.CommunicationMethod)
            cmd.Parameters.AddWithValue("@Options", CanResonse.Options)
            cmd.Parameters.AddWithValue("@Remarks", CanResonse.Remarks)
            cmd.Parameters.AddWithValue("@AssessedBy", CanResonse.AssessedBy)

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

#Region " Reject CV For No Response "
    Public Function fnRejectCVForNoResponse(ByVal CanResonse As clsCandidateResponse) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spRejectCVForNoResponse", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@CandidateID", CanResonse.CandidateID)
            cmd.Parameters.AddWithValue("@RejectionRemarks", CanResonse.Remarks)
            cmd.Parameters.AddWithValue("@RejectedBy", CanResonse.AssessedBy)

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

#Region " Get Can Response Details "

    Public Function fnGetCanResponseDetails(ByVal CandidateID As String) As DataSet

        Dim sp As String = "spGetCanResponseDetails"
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
