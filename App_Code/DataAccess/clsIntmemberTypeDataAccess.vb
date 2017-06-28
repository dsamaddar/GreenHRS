Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsIntmemberTypeDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Int Member Type "
    Public Function fnInsertIntMemberType(ByVal IntMemberType As clsIntMemberType) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertIntMemberType", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@MemberType", IntMemberType.MemberType)
            cmd.Parameters.AddWithValue("@IsActive", IntMemberType.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", IntMemberType.EntryBy)
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

#Region " Get Member Type List "

    Public Function fnGetMemberTypeList() As DataSet
        Dim sp As String = "spGetMemberTypeList"
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
