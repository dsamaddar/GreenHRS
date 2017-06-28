Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports dalConn

Public Class clsDistrictDataAccess

#Region " District Entry "
    Public Function InsertDistrict(ByVal District As clsDistrict) As Integer
        Dim conn As SqlConnection
        Dim dbconn As String
        Dim objDb As dalConn

        objDb = New dalConn()
        dbconn = objDb.connstr()
        conn = New SqlConnection(dbconn)

        Dim sp As String = "spInsertDistrict"
        Try
            conn.Open()
            Using cmd = New SqlCommand(sp, conn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@DivisionID", District.DivisionID)
                cmd.Parameters.AddWithValue("@DistrictName", District.DistrictName)
                cmd.Parameters.AddWithValue("@EntryUser", District.EntryUser)
                cmd.ExecuteNonQuery()
                conn.Close()
                Return 1
            End Using
        Catch ex As Exception
            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If
            Return 0
        End Try
    End Function
#End Region

#Region " Get Districts "
    Public Function GetDistricts() As DataSet
        Dim conn As SqlConnection
        Dim dbconn As String
        Dim objDb As dalConn

        objDb = New dalConn()
        dbconn = objDb.connstr()
        conn = New SqlConnection(dbconn)
        Dim comm As SqlCommand = New SqlCommand("spGetDistricts", conn)
        Dim ds As DataSet = New DataSet()
        Try
            conn.Open()
            comm.CommandType = CommandType.StoredProcedure
            Dim da As SqlDataAdapter = New SqlDataAdapter()
            da.SelectCommand = comm
            da.Fill(ds)
            conn.Close()
        Catch ex As Exception
            conn.Close()
        End Try
        Return ds
    End Function
#End Region

#Region " Get Districts By Division "
    Public Function GetDistrictsByDivision(ByVal District As clsDistrict) As DataSet
        Dim conn As SqlConnection
        Dim dbconn As String
        Dim objDb As dalConn

        objDb = New dalConn()
        dbconn = objDb.connstr()
        conn = New SqlConnection(dbconn)
        Dim comm As SqlCommand = New SqlCommand("spGetDistrictsByDivision", conn)
        Dim ds As DataSet = New DataSet()
        Try
            conn.Open()
            comm.CommandType = CommandType.StoredProcedure
            comm.Parameters.AddWithValue("@DivisionID", District.DivisionID)
            Dim da As SqlDataAdapter = New SqlDataAdapter()
            da.SelectCommand = comm
            da.Fill(ds)
            conn.Close()
        Catch ex As Exception
            conn.Close()
        End Try
        Return ds
    End Function
#End Region

End Class
