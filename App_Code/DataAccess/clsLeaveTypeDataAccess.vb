Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsLeaveTypeDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

    Public Function fnInsertLeaveType(ByVal LeaveType As clsLeaveType) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertLeaveType", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@LeaveType", LeaveType.LeaveType)
            cmd.Parameters.AddWithValue("@OnlyForMale", LeaveType.OnlyForMale)
            cmd.Parameters.AddWithValue("@OnlyForFemale", LeaveType.OnlyForFemale)
            cmd.Parameters.AddWithValue("@IsDedFrmLeaveBalance", LeaveType.IsDedFrmLeaveBalance)
            cmd.Parameters.AddWithValue("@IsActive", LeaveType.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", LeaveType.EntryBy)
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
    Public Function fnUpdateLeaveType(ByVal LeaveType As clsLeaveType) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateLeaveType", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@LeaveTypeID", LeaveType.LeaveTypeID)
            cmd.Parameters.AddWithValue("@LeaveType", LeaveType.LeaveType)
            cmd.Parameters.AddWithValue("@OnlyForMale", LeaveType.OnlyForMale)
            cmd.Parameters.AddWithValue("@OnlyForFemale", LeaveType.OnlyForFemale)
            cmd.Parameters.AddWithValue("@IsDedFrmLeaveBalance", LeaveType.IsDedFrmLeaveBalance)
            cmd.Parameters.AddWithValue("@IsActive", LeaveType.IsActive)
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

    Public Function fnShowLeaveType() As DataSet

        Dim sp As String = "spShowLeaveType"
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
    Public Function fnGetLeaveSettingsByID(ByVal LeaveTypeID As String) As clsLeaveType
        Dim LeaveType As New clsLeaveType()
        Dim sp As String = "spGetLeaveSettingsInfoByID"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@LeaveTypeID", LeaveTypeID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    LeaveType.LeaveType = dr.Item("LeaveType")
                    LeaveType.OnlyForMale = dr.Item("OnlyForMale")
                    LeaveType.OnlyForFemale = dr.Item("OnlyForFemale")
                    LeaveType.IsDedFrmLeaveBalance = dr.Item("IsDedFrmLeaveBalance")
                    LeaveType.IsActive = dr.Item("IsActive")
                End While
                con.Close()

                Return LeaveType
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function
    Public Function fnShowLeaveTypeActive() As DataSet

        Dim sp As String = "spGetLeaveType"
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

    Public Function fnGetQueryForLeave(ByVal EmployeeID As String, ByVal LeaveYear As String, ByVal LeaveTypeID As String) As DataSet

        Dim sp As String = "spGetQueryOnLeave"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                cmd.Parameters.AddWithValue("@LeaveYear", LeaveYear)
                cmd.Parameters.AddWithValue("@LeaveTypeID", LeaveTypeID)
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
End Class
