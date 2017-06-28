Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsTrngSubjectDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Trng Subject "
    Public Function fnInsertTrngSubject(ByVal TrngSub As clsTrngSubject) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertTrngSubject", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@TrngSubName", TrngSub.TrngSubName)
            cmd.Parameters.AddWithValue("@TrngSubDescription", TrngSub.TrngSubDescription)
            cmd.Parameters.AddWithValue("@Objectives", TrngSub.Objectives)
            cmd.Parameters.AddWithValue("@EntryBy", TrngSub.EntryBy)
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

#Region " Show Trng Subjects "

    Public Function fnShowTrngSubjects() As DataSet

        Dim sp As String = "spShowTrngSubjects"
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
