Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsCandidateMailInfoDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Get Can Mailing Info "

    Public Function fnGetCanMailingInfo(ByVal CandidateID As String) As clsCandidateMailInfo

        Dim sp As String = "spGetCanMailingInfo"
        Dim dr As SqlDataReader
        Dim CanMailInfo As New clsCandidateMailInfo()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CandidateID", CandidateID)

                dr = cmd.ExecuteReader()

                While dr.Read()
                    CanMailInfo.CandidateName = dr.Item("CandidateName")
                    CanMailInfo.Email = dr.Item("Email")
                    CanMailInfo.AlternateEmail = dr.Item("AlternateEmail")
                End While
                Return CanMailInfo
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

    Public Function fnGetCanMailingInfoAfterAppJob(ByVal CandidateID As String, ByVal CircularID As String) As clsCandidateMailInfo

        Dim sp As String = "spGetCanMailingInfoAfterAppJob"
        Dim dr As SqlDataReader
        Dim CanMailInfo As New clsCandidateMailInfo()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
                cmd.Parameters.AddWithValue("@CircularID", CircularID)

                dr = cmd.ExecuteReader()

                While dr.Read()
                    CanMailInfo.CandidateName = dr.Item("CandidateName")
                    CanMailInfo.Email = dr.Item("Email")
                    CanMailInfo.AlternateEmail = dr.Item("AlternateEmail")
                    CanMailInfo.CircularCode = dr.Item("CircularCode")
                    CanMailInfo.Title = dr.Item("JobTitle")
                End While
                Return CanMailInfo
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
