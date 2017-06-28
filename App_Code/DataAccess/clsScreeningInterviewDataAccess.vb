Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsScreeningInterviewDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Screening Interview "
    Public Function fnInsertScreeningInterview(ByVal ScrIntInfo As clsScreeningInterview) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertScreeningInterview", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@CandidateID", ScrIntInfo.CandidateID)
            cmd.Parameters.AddWithValue("@InterviewMethod", ScrIntInfo.InterviewMethod)
            cmd.Parameters.AddWithValue("@IsAnyOneKnownToOurInstitution", ScrIntInfo.IsAnyOneKnownToOurInstitution)
            cmd.Parameters.AddWithValue("@KnownDesignationID", ScrIntInfo.KnownDesignationID)
            cmd.Parameters.AddWithValue("@KnownPerson", ScrIntInfo.KnownPerson)
            cmd.Parameters.AddWithValue("@HowToKnowThePerson", ScrIntInfo.HowToKnowThePerson)
            cmd.Parameters.AddWithValue("@Remarks", ScrIntInfo.Remarks)
            cmd.Parameters.AddWithValue("@NextAction", ScrIntInfo.NextAction)
            cmd.Parameters.AddWithValue("@IsAccepted", ScrIntInfo.IsAccepted)
            cmd.Parameters.AddWithValue("@IsRejected", ScrIntInfo.IsRejected)
            cmd.Parameters.AddWithValue("@ScreenedBy", ScrIntInfo.ScreenedBy)
            cmd.Parameters.AddWithValue("@CanResMatchedInfoData", ScrIntInfo.CanResMatchedInfoData)
            cmd.Parameters.AddWithValue("@CanSuitableForInfoData", ScrIntInfo.CanSuitableForInfoData)
            cmd.Parameters.AddWithValue("@SuitableForRec", ScrIntInfo.SuitableForRec)
            cmd.Parameters.AddWithValue("@ScrMultipleQuesAnswerData", ScrIntInfo.ScrMultipleQuesAnswerData)
            cmd.Parameters.AddWithValue("@AppliedCircularToReject", ScrIntInfo.AppliedCircularToReject)
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

#Region " ByPass Screening "
    Public Function fnByPassScreening(ByVal ScrIntInfo As clsScreeningInterview) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spByPassScreening", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@CandidateID", ScrIntInfo.CandidateID)
            cmd.Parameters.AddWithValue("@ScreenedBy", ScrIntInfo.ScreenedBy)
            cmd.Parameters.AddWithValue("@CanSuitableForInfoData", ScrIntInfo.CanSuitableForInfoData)
            cmd.Parameters.AddWithValue("@SuitableForRec", ScrIntInfo.SuitableForRec)
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

#Region " CV Get For Screening "

    Public Function fnCVGetForScreening(ByVal CircularID As String, ByVal CurrentStatus As String) As DataSet

        Dim sp As String = "spCVGetForScreening"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CircularID", CircularID)
                cmd.Parameters.AddWithValue("@CurrentStatus", CurrentStatus)
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

#Region " Get Default CV "

    Public Function fnGetDefaultCV() As DataSet

        Dim sp As String = "spGetDefaultCV"
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

#Region " Get Scr Interview Info  "

    Public Function fnGetScrInterviewInfo(ByVal CandidateID As String) As clsScreeningInterview
        Dim ScrIntInfo As New clsScreeningInterview()
        Dim sp As String = "spGetScrInterviewInfo"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
                dr = cmd.ExecuteReader()

                While dr.Read()
                    ScrIntInfo.InterviewMethod = dr.Item("InterviewMethod")
                    ScrIntInfo.IsAnyOneKnownToOurInstitution = dr.Item("IsAnyOneKnownToOurInstitution")
                    ScrIntInfo.KnownDesignationID = dr.Item("KnownDesignationID")
                    ScrIntInfo.KnownPerson = dr.Item("KnownPerson")
                    ScrIntInfo.Remarks = dr.Item("Remarks")
                    ScrIntInfo.NextAction = dr.Item("NextAction")
                    ScrIntInfo.ScreenedBy = dr.Item("ScreenedBy")
                    ScrIntInfo.ScreenedDate = dr.Item("ScreenedDate")
                    ScrIntInfo.KnownDesignation = dr.Item("KnownDesignation")
                    ScrIntInfo.HowToKnowThePerson = dr.Item("HowToKnowThePerson")
                End While
                con.Close()
                Return ScrIntInfo
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
        End Try
        Return Nothing

    End Function

#End Region

#Region " Get Candidate Res Matched "

    Public Function fnGetCandidateResMatched(ByVal CandidateID As String) As DataSet

        Dim sp As String = "spGetCandidateResMatched"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
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

#Region " Get Candidate Suitable For "

    Public Function fnGetCandidateSuitableFor(ByVal CandidateID As String) As DataSet

        Dim sp As String = "spGetCandidateSuitableFor"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
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

#Region " Show Can Scr Ques Options Selected "

    Public Function fnShowCanScrQuesOptionsSelected(ByVal CandidateID As String) As DataSet

        Dim sp As String = "spShowCanScrQuesOptionsSelected"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
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

#Region " Reject Candidate "
    Public Function fnRejectCandidate(ByVal CandidateID As String, ByVal Remarks As String, ByVal ScreenedBy As String, ByVal AppliedCircularToReject As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spChangeStatusAfterScreening", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
            cmd.Parameters.AddWithValue("@Remarks", Remarks)
            cmd.Parameters.AddWithValue("@ScreenedBy", ScreenedBy)
            cmd.Parameters.AddWithValue("@AppliedCircularToReject", AppliedCircularToReject)
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

#Region "Get Applied Job List By Candidate "
    Public Function fnGetAppliedJobListByCandidate(ByVal CandidateID As String) As DataSet

        Dim sp As String = "spGetAppliedJobListByCandidate"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
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
