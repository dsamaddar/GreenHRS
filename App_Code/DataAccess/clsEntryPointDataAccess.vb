Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsEntryPointDataAccess


    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Get EntryPoint  "

    Public Function fnGetEntryPoint() As String
        Dim sp As String = "spGetEntryPoint"
        Dim EntryPoint As String = ""
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                dr = cmd.ExecuteReader()
                While dr.Read()
                    EntryPoint = dr.Item("EntryPoint")
                End While
                con.Close()

                Return EntryPoint
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return ""
        End Try
    End Function

#End Region

End Class
