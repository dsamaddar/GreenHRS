Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsExternalTestTypeDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert External Test Type "
    Public Function fnInsertExternalTestType(ByVal ExternalTestType As clsExternalTestType) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertExternalTestType", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ExternalTest", ExternalTestType.ExternalTest)
            cmd.Parameters.AddWithValue("@Details", ExternalTestType.Details)
            cmd.Parameters.AddWithValue("@IsActive", ExternalTestType.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", ExternalTestType.EntryBy)
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

#Region " Update External Test Type "
    Public Function fnUpdateExternalTestType(ByVal ExternalTestType As clsExternalTestType) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateExternalTestType", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ExternalTestTypeID", ExternalTestType.ExternalTestTypeID)
            cmd.Parameters.AddWithValue("@ExternalTest", ExternalTestType.ExternalTest)
            cmd.Parameters.AddWithValue("@Details", ExternalTestType.Details)
            cmd.Parameters.AddWithValue("@IsActive", ExternalTestType.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", ExternalTestType.EntryBy)
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

#Region " Get External Test Type List "

    Public Function fnGetExternalTestTypeList() As DataSet

        Dim sp As String = "spGetExternalTestTypeList"
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

#Region " Get External Test Type Details "

    Public Function fnGetExternalTestTypeDetails() As DataSet

        Dim sp As String = "spGetExternalTestTypeDetails"
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
