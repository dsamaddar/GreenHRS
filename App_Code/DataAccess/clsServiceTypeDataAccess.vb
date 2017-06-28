Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data


Public Class clsServiceTypeDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Service Type "
    Public Function fnInsertServiceType(ByVal ServiceTypeInfo As clsServiceType) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertServiceType", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ServiceType", ServiceTypeInfo.ServiceType)
            cmd.Parameters.AddWithValue("@IsActive", ServiceTypeInfo.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", ServiceTypeInfo.EntryBy)

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

#Region " Show Service Type "

    Public Function fnShowServiceType() As DataSet

        Dim sp As String = "spShowServiceType"
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
