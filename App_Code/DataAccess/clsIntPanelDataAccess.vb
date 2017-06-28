Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsIntPanelDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Interview Panel "
    Public Function fnInsertInterviewPanel(ByVal InterviewPanel As clsIntPanel) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertInterviewPanel", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@IntTeamID", InterviewPanel.IntTeamID)
            cmd.Parameters.AddWithValue("@IntMemberTypeID", InterviewPanel.IntMemberTypeID)
            cmd.Parameters.AddWithValue("@IntPanelMemberID", InterviewPanel.IntPanelMemberID)
            cmd.Parameters.AddWithValue("@EntryBy", InterviewPanel.EntryBy)

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
