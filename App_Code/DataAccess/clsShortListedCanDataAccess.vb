Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient


Public Class clsShortListedCanDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Srt Listed Candidate "

    Public Function fnInsertSrtListedCandidate(ByVal SrtListedCan As clsShortListedCan) As clsResult
        Dim res As New clsResult()
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertSrtListedCandidate", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@CandidateID", SrtListedCan.CandidateID)
            cmd.Parameters.AddWithValue("@RecruitmentTypeID", SrtListedCan.RecruitmentTypeID)
            cmd.Parameters.AddWithValue("@ULCBranchID", SrtListedCan.ULCBranchID)
            cmd.Parameters.AddWithValue("@EntryBy", SrtListedCan.EntryBy)
            cmd.ExecuteNonQuery()
            con.Close()
            res.Success = 1
            res.Message = "Candidate Short Listed To Offer Employment."
            Return res
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
                res.Success = 0
                res.Message = ex.Message
            End If
            Return res
        End Try
    End Function

#End Region

#Region " Get Short Listed Candidate "

    Public Function fnGetShortListedCandidate() As DataSet

        Dim sp As String = "spGetShortListedCandidate"
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

#Region " Get Candidate Short Listed Selection "

    Public Function fnGetCanShortListedSelection(ByVal CandidateID As String) As clsShortListedCan
        Dim SrtCan As New clsShortListedCan()
        Dim sp As String = "spGetCanShortListedSelection"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    SrtCan.RecruitmentTypeID = dr.Item("RecruitmentTypeID")
                    SrtCan.ULCBranchID = dr.Item("ULCBranchID")
                End While
                con.Close()

                Return SrtCan
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
