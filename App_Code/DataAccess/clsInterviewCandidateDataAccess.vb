Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsInterviewCandidateDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Assign Candidate To Int Panel "

    Public Function fnAssignCandidateToIntPanel(ByVal IntCandidate As clsInterviewCandidate) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spAssignCandidateToIntPanel", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@Participant", IntCandidate.Participant)
            cmd.Parameters.AddWithValue("@CircularID", IntCandidate.CircularID)
            cmd.Parameters.AddWithValue("@IntTeamID", IntCandidate.IntTeamID)
            cmd.Parameters.AddWithValue("@InterviewDate", IntCandidate.InterviewDate)
            cmd.Parameters.AddWithValue("@EntryBy", IntCandidate.EntryBy)
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

#Region " Assign Candidate To Int Panel New "

    Public Function fnAssignCandidateToIntPanelNew(ByVal IntCandidate As clsInterviewCandidate) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spAssignCandidateToIntPanelNew", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@Participant", IntCandidate.Participant)
            cmd.Parameters.AddWithValue("@CircularID", IntCandidate.CircularID)
            cmd.Parameters.AddWithValue("@IntTeamID", IntCandidate.IntTeamID)
            cmd.Parameters.AddWithValue("@InterviewDate", IntCandidate.InterviewDate)
            cmd.Parameters.AddWithValue("@ULCBranchID", IntCandidate.ULCBranchID)
            cmd.Parameters.AddWithValue("@EntryBy", IntCandidate.EntryBy)
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

#Region " Chq Alrdy Asnd And Int Not Taken "

    Public Function fnChqAlrdyAsndAndIntNotTaken(ByVal IntCandidate As clsInterviewCandidate) As Integer
        Dim IntExists As Integer = 0
        Try
            Dim cmd As SqlCommand = New SqlCommand("spChqAlrdyAsndAndIntNotTaken", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@CandidateID", IntCandidate.CandidateID)
            cmd.Parameters.AddWithValue("@CircularID", IntCandidate.CircularID)
            cmd.Parameters.AddWithValue("@IntTeamID", IntCandidate.IntTeamID)
            Dim dr As SqlDataReader = cmd.ExecuteReader()

            While dr.Read()
                IntExists = dr.Item("IntExists")
            End While

            con.Close()
            Return IntExists
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return 999
        End Try

    End Function

#End Region

#Region " Get Int Candidates By Int Taker "

    Public Function fnGetIntCandidatesByIntTaker(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spGetIntCandidatesByIntTaker"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
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

#Region " Get Int Candidates By Int Taker Primary "

    Public Function fnGetIntCandidatesByIntTakerPrimary(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spGetIntCandidatesByIntTakerPrimary"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
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

#Region " Get Int Candidates By Int Taker Sec "

    Public Function fnGetIntCandidatesByIntTakerSec(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spGetIntCandidatesByIntTakerSec"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
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

#Region " Get Int Candidates Result "

    Public Function fnGetIntCandidatesResult(ByVal StartDate As DateTime, ByVal EndDate As DateTime) As DataSet

        Dim sp As String = "spGetIntCandidatesResult"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@StartDate", StartDate)
                cmd.Parameters.AddWithValue("@EndDate", EndDate)
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

#Region " Available Interview Attendee To Notify "

    Public Function fnAvailableIntAttendeeToNotify() As DataSet

        Dim sp As String = "spAvailableIntAttendeeToNotify"
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

#Region " Get All Int Candidate List "

    Public Function fnGetAllIntCandidateList() As DataSet

        Dim sp As String = "spGetAllIntCandidateList"
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

#Region " Find Can Pool "

    Public Function fnFindCanPool(ByVal SuitableFor As String, ByVal SuitableRegion As String, ByVal SuitableBranch As String) As DataSet

        Dim sp As String = "spFindCanPool"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@SuitableFor", SuitableFor)
                cmd.Parameters.AddWithValue("@SuitableRegion", SuitableRegion)
                cmd.Parameters.AddWithValue("@SuitableBranch", SuitableBranch)
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

#Region " Reschedule Interview "

    Public Function fnRescheduleInterview(ByVal IntCandidate As clsInterviewCandidate) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spRescheduleInterview", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@IntCandidateID", IntCandidate.IntCandidateID)
            cmd.Parameters.AddWithValue("@IntTeamID", IntCandidate.IntTeamID)
            cmd.Parameters.AddWithValue("@InterviewDate", IntCandidate.InterviewDate)

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

#Region " Reject Interview "

    Public Function fnRejectInterview(ByVal IntCandidate As clsInterviewCandidate) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spRejectInterview", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@IntCandidateID", IntCandidate.IntCandidateID)
            cmd.Parameters.AddWithValue("@RejectedBy", IntCandidate.RejectedBy)
            cmd.Parameters.AddWithValue("@RejectionRemarks", IntCandidate.RejectionRemarks)

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

#Region " Reject Candidate After Interview "

    Public Function fnRejectCanAfterInterview(ByVal IntCandidate As clsInterviewCandidate) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spRejectCanAfterInterview", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@IntCandidateID", IntCandidate.IntCandidateID)
            cmd.Parameters.AddWithValue("@RejectedBy", IntCandidate.RejectedBy)
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

#Region " Get Interview Notification Mail Info "

    Public Function fnGetIntNotificationMailInfo(ByVal IntCandidateID As String, ByVal MailMessage As String) As clsMailProperty

        Dim sp As String = "spGetIntNotificationMailInfo"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim dr As SqlDataReader
        Dim MailProp As New clsMailProperty()

        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@IntCandidateID", IntCandidateID)
                cmd.Parameters.AddWithValue("@MailMessage", MailMessage)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    MailProp.MailSubject = dr.Item("MailSubject")
                    MailProp.MailBody = dr.Item("MailBody")
                    MailProp.MailFrom = dr.Item("MailFrom")
                    MailProp.MailTo = dr.Item("MailTo")
                    MailProp.MailCC = dr.Item("MailCC")
                    MailProp.MailBCC = dr.Item("MailBCC")
                End While
                con.Close()
                Return MailProp
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Candidate Int Info "

    Public Function fnGetCandidateIntInfo(ByVal CandidateID As String) As clsInterviewCandidate

        Dim sp As String = "spGetCandidateIntInfo"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim dr As SqlDataReader
        Dim MailProp As New clsMailProperty()
        Dim IC As New clsInterviewCandidate()

        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    IC.IntCandidateID = dr.Item("IntCandidateID")
                    IC.IntTeamID = dr.Item("IntTeamID")
                    IC.InterviewDate = dr.Item("InterviewDate")
                End While
                con.Close()
                Return IC
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
