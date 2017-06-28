Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsInterviewTeamDataAccess


    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert InterView Team "
    Public Function fnInsertInterViewTeam(ByVal InterviewTeam As clsInterviewTeam) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertInterViewTeam", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@IntTeamName", InterviewTeam.IntTeamName)
            cmd.Parameters.AddWithValue("@IsActive", InterviewTeam.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", InterviewTeam.EntryBy)
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

#Region " Get Interview Team List "

    Public Function fnGetInterviewTeamList() As DataSet
        Dim sp As String = "spGetInterviewTeamList"
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

End Class
