Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class clsPerformancePartDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Performance Part "

    Public Function fnInsertPerformancePart(ByVal PerformancePart As clsPerformancePart) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertPerformancePart", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@PerformancePart", PerformancePart.PerformancePart)
            cmd.Parameters.AddWithValue("@IsActive", PerformancePart.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", PerformancePart.EntryBy)
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

#Region " Get Active Performance Part "

    Public Function fnGetActivePerformancePart() As DataSet
        Dim sp As String = "spGetActivePerformancePart"
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
