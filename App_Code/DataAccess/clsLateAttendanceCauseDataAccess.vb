Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data


Public Class clsLateAttendanceCauseDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Late Att Cause "
    Public Function fnInsertLateAttCause(ByVal LateAttCause As clsLateAttendanceCause) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertLateAttCause", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@Cause", LateAttCause.Cause)
            cmd.Parameters.AddWithValue("@IsDetailsMandatory", LateAttCause.IsDetailsMandatory)
            cmd.Parameters.AddWithValue("@IsReportable", LateAttCause.IsReportable)
            cmd.Parameters.AddWithValue("@IsActive", LateAttCause.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", LateAttCause.EntryBy)

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

#Region " Update Late Att Cause "
    Public Function fnUpdateLateAttCause(ByVal LateAttCause As clsLateAttendanceCause) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateLateAttCause", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@LateAttCauseID", LateAttCause.LateAttCauseID)
            cmd.Parameters.AddWithValue("@Cause", LateAttCause.Cause)
            cmd.Parameters.AddWithValue("@IsDetailsMandatory", LateAttCause.IsDetailsMandatory)
            cmd.Parameters.AddWithValue("@IsReportable", LateAttCause.IsReportable)
            cmd.Parameters.AddWithValue("@IsActive", LateAttCause.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", LateAttCause.EntryBy)
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

#Region " Show Late Att Cause List "

    Public Function fnShowLateAttCauseList() As DataSet

        Dim sp As String = "spShowLateAttCauseList"
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

#Region " Get Active Late Att Cause "

    Public Function fnGetActiveLateAttCause() As DataSet

        Dim sp As String = "spGetActiveLateAttCause"
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
