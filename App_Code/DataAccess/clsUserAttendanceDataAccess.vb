Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Data.OleDb

Public Class clsUserAttendanceDataAccess

    Dim con As OleDbConnection = New OleDbConnection(ConfigurationManager.ConnectionStrings("AttendanceConn").ConnectionString)
    Dim conHRM As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " User Attendance LogIndex "

    Public Function fnUsrAttLogIndex() As clsUserAttendance
        Try
            Dim UsrAtt As New clsUserAttendance()
            Dim cmd As SqlCommand = New SqlCommand("spUsrAttLogIndex", conHRM)
            conHRM.Open()
            cmd.CommandType = CommandType.StoredProcedure
            Dim dr As SqlDataReader = cmd.ExecuteReader()
            While dr.Read()
                UsrAtt.MaxLogIndex = dr.Item("MaxLogIndex")
                UsrAtt.AttendanceIDList = dr.Item("AttendanceIDList")
            End While
            conHRM.Close()
            Return UsrAtt
        Catch ex As Exception
            If conHRM.State = ConnectionState.Open Then
                conHRM.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get User Attendance Info "

    Public Function fnGetUsrAttInfo(ByVal UsrAtt As clsUserAttendance) As DataSet

        Dim da As OleDbDataAdapter = New OleDbDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New OleDbCommand("SELECT * FROM [NGAC_LOG] Where logindex > " + UsrAtt.MaxLogIndex.ToString() + " And userid in (" + UsrAtt.AttendanceIDList + ")", con)
                cmd.CommandType = CommandType.Text
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

#Region " Insert User Attendance "
    Public Function fnInsertUserAttendance(ByVal UsrAtt As clsUserAttendance) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertUserAttendance", conHRM)
            conHRM.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@AttendanceID", UsrAtt.AttendanceID)
            cmd.Parameters.AddWithValue("@LogIndex", UsrAtt.LogIndex)
            cmd.Parameters.AddWithValue("@LogTime", UsrAtt.LogTime)
            cmd.Parameters.AddWithValue("@NodeID", UsrAtt.NodeID)
            cmd.ExecuteNonQuery()
            conHRM.Close()
            Return 1
        Catch ex As Exception
            If conHRM.State = ConnectionState.Open Then
                conHRM.Close()
            End If
            Return 0
        End Try
    End Function
#End Region

#Region " Show Message By User "

    Public Function fnGetUserAttendance(ByVal UsrAtt As clsUserAttendance) As DataSet

        Dim sp As String = "spGetUserAttendance"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            conHRM.Open()
            Using cmd = New SqlCommand(sp, conHRM)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", UsrAtt.EmployeeID)
                cmd.Parameters.AddWithValue("@DateFrom", UsrAtt.DateFrom)
                cmd.Parameters.AddWithValue("@DateTo", UsrAtt.DateTo)
                da.SelectCommand = cmd
                da.Fill(ds)
                conHRM.Close()

                Return ds
            End Using
        Catch ex As Exception
            If conHRM.State = ConnectionState.Open Then
                conHRM.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Daily Att Report "

    Public Function fnGetDailyAttReport(ByVal AttDate As DateTime) As DataSet

        Dim sp As String = "spGetDailyAttReport"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            conHRM.Open()
            Using cmd = New SqlCommand(sp, conHRM)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@AttDate", AttDate)
                da.SelectCommand = cmd
                da.Fill(ds)
                conHRM.Close()

                Return ds
            End Using
        Catch ex As Exception
            If conHRM.State = ConnectionState.Open Then
                conHRM.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Late Att Report "

    Public Function fnGetLateAttReport(ByVal AttDate As DateTime) As DataSet

        Dim sp As String = "spGetLateAttReport"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            conHRM.Open()
            Using cmd = New SqlCommand(sp, conHRM)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@AttDate", AttDate)
                da.SelectCommand = cmd
                da.Fill(ds)
                conHRM.Close()

                Return ds
            End Using
        Catch ex As Exception
            If conHRM.State = ConnectionState.Open Then
                conHRM.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Absent Report "

    Public Function fnGetAbsentReport(ByVal UsrAtt As clsUserAttendance) As DataSet

        Dim sp As String = "spGetAbsentReport"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            conHRM.Open()
            Using cmd = New SqlCommand(sp, conHRM)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", UsrAtt.EmployeeID)
                cmd.Parameters.AddWithValue("@DateFrom", UsrAtt.DateFrom)
                cmd.Parameters.AddWithValue("@DateTo", UsrAtt.DateTo)
                da.SelectCommand = cmd
                da.Fill(ds)
                conHRM.Close()

                Return ds
            End Using
        Catch ex As Exception
            If conHRM.State = ConnectionState.Open Then
                conHRM.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Absent Report All "

    Public Function fnGetAbsentReportAll(ByVal UsrAtt As clsUserAttendance) As DataSet

        Dim sp As String = "spGetAbsentReportAll"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            conHRM.Open()
            Using cmd = New SqlCommand(sp, conHRM)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@AbsentDate", UsrAtt.AbsentDate)
                da.SelectCommand = cmd
                da.Fill(ds)
                conHRM.Close()

                Return ds
            End Using
        Catch ex As Exception
            If conHRM.State = ConnectionState.Open Then
                conHRM.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Att Entry By User "

    Public Function fnGetAttEntryByUser() As DataSet

        Dim sp As String = "spGetAttEntryByUser"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            conHRM.Open()
            Using cmd = New SqlCommand(sp, conHRM)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                conHRM.Close()

                Return ds
            End Using
        Catch ex As Exception
            If conHRM.State = ConnectionState.Open Then
                conHRM.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Insert Admin Attendance "
    Public Function fnInsertAdminAttendance(ByVal UsrAtt As clsUserAttendance) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertAdminAttendance", conHRM)
            conHRM.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", UsrAtt.EmployeeID)
            cmd.Parameters.AddWithValue("@LogTime", UsrAtt.LogTime)
            cmd.Parameters.AddWithValue("@IdealLogTime", UsrAtt.IdealLogTime)
            cmd.Parameters.AddWithValue("@DateTo", UsrAtt.DateTo)
            cmd.Parameters.AddWithValue("@Remarks", UsrAtt.Remarks)
            cmd.Parameters.AddWithValue("@DocumentReference", UsrAtt.DocumentReference)
            cmd.Parameters.AddWithValue("@EntryBy", UsrAtt.EntryBy)
            cmd.ExecuteNonQuery()
            conHRM.Close()
            Return 1
        Catch ex As Exception
            If conHRM.State = ConnectionState.Open Then
                conHRM.Close()
            End If
            Return 0
        End Try
    End Function
#End Region

#Region " Update Emp Wise Att Settings "
    Public Function fnUpdateEmpWiseAttSettings(ByVal UsrAtt As clsUserAttendance) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateEmpWiseAttSettings", conHRM)
            conHRM.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmpList", UsrAtt.EmpList)
            cmd.Parameters.AddWithValue("@IdealLoginTime", UsrAtt.IdealLogTimeText)
            cmd.ExecuteNonQuery()
            conHRM.Close()
            Return 1
        Catch ex As Exception
            If conHRM.State = ConnectionState.Open Then
                conHRM.Close()
            End If
            Return 0
        End Try
    End Function
#End Region

#Region " Insert Usr Att Info OLD System "
    Public Function fnInsertUsrAttInfoOLDSystem() As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertUsrAttInfoOLDSystem", conHRM)
            conHRM.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandTimeout = 999999
            cmd.ExecuteNonQuery()
            conHRM.Close()
            Return 1
        Catch ex As Exception
            If conHRM.State = ConnectionState.Open Then
                conHRM.Close()
            End If
            Return 0
        End Try
    End Function
#End Region

#Region " Get User Att Input By Admin "

    Public Function fnGetUserAttInputByAdmin(ByVal UsrAtt As clsUserAttendance) As DataSet

        Dim sp As String = "spGetUserAttInputByAdmin"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            conHRM.Open()
            Using cmd = New SqlCommand(sp, conHRM)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", UsrAtt.EmployeeID)
                da.SelectCommand = cmd
                da.Fill(ds)
                conHRM.Close()

                Return ds
            End Using
        Catch ex As Exception
            If conHRM.State = ConnectionState.Open Then
                conHRM.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Att Rpt Input By Admin Entry User "

    Public Function fnGetAttRptInputByAdminEntryUser(ByVal UsrAtt As clsUserAttendance) As DataSet

        Dim sp As String = "spGetAttRptInputByAdminEntryUser"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            conHRM.Open()
            Using cmd = New SqlCommand(sp, conHRM)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EntryBy", UsrAtt.EntryBy)
                cmd.Parameters.AddWithValue("@DateFrom", UsrAtt.DateFrom)
                cmd.Parameters.AddWithValue("@DateTo", UsrAtt.DateTo)
                da.SelectCommand = cmd
                da.Fill(ds)
                conHRM.Close()

                Return ds
            End Using
        Catch ex As Exception
            If conHRM.State = ConnectionState.Open Then
                conHRM.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Monthly Att. Summary "

    Public Function fnMonthlyAttSummary(ByVal Month As Integer, ByVal Year As Integer) As DataSet

        Dim sp As String = "spMonthlyAttSummary"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            conHRM.Open()
            Using cmd = New SqlCommand(sp, conHRM)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.CommandTimeout = 999999
                cmd.Parameters.AddWithValue("@Month", Month)
                cmd.Parameters.AddWithValue("@Year", Year)
                da.SelectCommand = cmd
                da.Fill(ds)
                conHRM.Close()
                Return ds
            End Using
        Catch ex As Exception
            If conHRM.State = ConnectionState.Open Then
                conHRM.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Absent Matrix "

    Public Function fnGetAbsentMatrix(ByVal DateFrom As DateTime, ByVal DateTo As DateTime) As DataSet

        Dim sp As String = "spGetAbsentMatrix"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            conHRM.Open()
            Using cmd = New SqlCommand(sp, conHRM)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.CommandTimeout = 999999
                cmd.Parameters.AddWithValue("@DateFrom", DateFrom)
                cmd.Parameters.AddWithValue("@DateTo", DateTo)
                da.SelectCommand = cmd
                da.Fill(ds)
                conHRM.Close()
                Return ds
            End Using
        Catch ex As Exception
            If conHRM.State = ConnectionState.Open Then
                conHRM.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Todays Absent Emp List "

    Public Function fnGetTodaysAbsentEmpList() As DataSet
        Dim sp As String = "spGetTodaysAbsentEmpList"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            conHRM.Open()
            Using cmd = New SqlCommand(sp, conHRM)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                conHRM.Close()
                Return ds
            End Using
        Catch ex As Exception
            If conHRM.State = ConnectionState.Open Then
                conHRM.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Primary Warning Absent Emp List "

    Public Function fnGetPrimaryWarningAbsentEmpList() As DataSet
        Dim sp As String = "spGetPrimaryWarningAbsentEmpList"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            conHRM.Open()
            Using cmd = New SqlCommand(sp, conHRM)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                conHRM.Close()
                Return ds
            End Using
        Catch ex As Exception
            If conHRM.State = ConnectionState.Open Then
                conHRM.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Final Warning Absent Emp List "

    Public Function fnGetFinalWarningAbsentEmpList() As DataSet
        Dim sp As String = "spGetFinalWarningAbsentEmpList"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            conHRM.Open()
            Using cmd = New SqlCommand(sp, conHRM)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                conHRM.Close()
                Return ds
            End Using
        Catch ex As Exception
            If conHRM.State = ConnectionState.Open Then
                conHRM.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

    Public Function fnGetMailForDailyAbsent(ByVal EmployeeID As String) As clsMailProperty
        Dim sp As String = "spGetMailForDailyAbsent"
        Dim dr As SqlDataReader
        Dim MailProp As New clsMailProperty()
        Try
            conHRM.Open()

            Using cmd = New SqlCommand(sp, conHRM)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    MailProp.MailSubject = dr.Item("MailSubject")
                    MailProp.MailBody = dr.Item("MailBody")
                    MailProp.MailFrom = dr.Item("MailFrom")
                    MailProp.MailTo = dr.Item("MailTo")
                    MailProp.MailCC = dr.Item("MailCC")
                    MailProp.MailBCC = dr.Item("MailBCC")
                    MailProp.SMTPServer = dr.Item("SMTPServer")
                    MailProp.SMTPPort = dr.Item("SMTPPort")
                End While
                conHRM.Close()

                Return MailProp
            End Using
        Catch ex As Exception
            If conHRM.State = ConnectionState.Open Then
                conHRM.Close()
            End If
            Return Nothing
        End Try
    End Function

    Public Function fnGetMailForPrimaryWarningAbs(ByVal EmployeeID As String) As clsMailProperty
        Dim sp As String = "spGetMailForPrimaryWarningAbs"
        Dim dr As SqlDataReader
        Dim MailProp As New clsMailProperty()
        Try
            conHRM.Open()

            Using cmd = New SqlCommand(sp, conHRM)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    MailProp.MailSubject = dr.Item("MailSubject")
                    MailProp.MailBody = dr.Item("MailBody")
                    MailProp.MailFrom = dr.Item("MailFrom")
                    MailProp.MailTo = dr.Item("MailTo")
                    MailProp.MailCC = dr.Item("MailCC")
                    MailProp.MailBCC = dr.Item("MailBCC")
                    MailProp.SMTPServer = dr.Item("SMTPServer")
                    MailProp.SMTPPort = dr.Item("SMTPPort")
                End While
                conHRM.Close()

                Return MailProp
            End Using
        Catch ex As Exception
            If conHRM.State = ConnectionState.Open Then
                conHRM.Close()
            End If
            Return Nothing
        End Try
    End Function

    Public Function fnGetMailForFinalWarningAbs(ByVal EmployeeID As String) As clsMailProperty
        Dim sp As String = "spGetMailForFinalWarningAbs"
        Dim dr As SqlDataReader
        Dim MailProp As New clsMailProperty()
        Try
            conHRM.Open()

            Using cmd = New SqlCommand(sp, conHRM)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    MailProp.MailSubject = dr.Item("MailSubject")
                    MailProp.MailBody = dr.Item("MailBody")
                    MailProp.MailFrom = dr.Item("MailFrom")
                    MailProp.MailTo = dr.Item("MailTo")
                    MailProp.MailCC = dr.Item("MailCC")
                    MailProp.MailBCC = dr.Item("MailBCC")
                    MailProp.SMTPServer = dr.Item("SMTPServer")
                    MailProp.SMTPPort = dr.Item("SMTPPort")
                End While
                conHRM.Close()

                Return MailProp
            End Using
        Catch ex As Exception
            If conHRM.State = ConnectionState.Open Then
                conHRM.Close()
            End If
            Return Nothing
        End Try
    End Function

End Class
