Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsCVSelectionDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " CV Get For Applied Job By ID "

    Public Function fnCVGetForAppliedJobByID(ByVal CircularID As String, ByVal CurrentStatus As String) As DataSet

        Dim sp As String = "spCVGetForAppliedJobByID"
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

#Region " CV Get For Applied Job By Rec Type ID "

    Public Function fnCVGetForAppliedJobByRecTypeID(ByVal RecruitmentTypeID As String, ByVal CurrentStatus As String) As DataSet

        Dim sp As String = "spCVGetForAppliedJobByRecTypeID"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@RecruitmentTypeID", RecruitmentTypeID)
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

#Region " CV Get For Applied Job By ID Suit "

    Public Function fnCVGetForAppliedJobByIDSuit(ByVal CircularID As String, ByVal CurrentStatus As String, ByVal SuitableFor As String) As DataSet

        Dim sp As String = "spCVGetForAppliedJobByIDSuit"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CircularID", CircularID)
                cmd.Parameters.AddWithValue("@CurrentStatus", CurrentStatus)
                cmd.Parameters.AddWithValue("@SuitableFor", SuitableFor)
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

#Region " Search Applicant "

    Public Function fnSearchApplicant(ByVal CVSelection As clsCVSelection) As DataSet

        Dim sp As String = "spSearchApplicant"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CircularID", CVSelection.CircularID)
                cmd.Parameters.AddWithValue("@CandidateName", CVSelection.CandidateName)
                cmd.Parameters.AddWithValue("@InstitutionID", CVSelection.InstitutionID)
                cmd.Parameters.AddWithValue("@PresentDistrictID", CVSelection.PresentDistrictID)
                cmd.Parameters.AddWithValue("@PermanentDistrictID", CVSelection.PermanentDistrictID)
                cmd.Parameters.AddWithValue("@Gender", CVSelection.Gender)
                cmd.Parameters.AddWithValue("@AgeFrom", CVSelection.AgeFrom)
                cmd.Parameters.AddWithValue("@AgeTo", CVSelection.AgeTo)
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

#Region " Search Applicant For Screening "

    Public Function fnSearchApplicantForScreening(ByVal CVSelection As clsCVSelection) As DataSet

        Dim sp As String = "spSearchApplicantForScreening"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CircularID", CVSelection.CircularID)
                cmd.Parameters.AddWithValue("@CandidateName", CVSelection.CandidateName)
                cmd.Parameters.AddWithValue("@InstitutionID", CVSelection.InstitutionID)
                cmd.Parameters.AddWithValue("@PresentDistrictID", CVSelection.PresentDistrictID)
                cmd.Parameters.AddWithValue("@PermanentDistrictID", CVSelection.PermanentDistrictID)
                cmd.Parameters.AddWithValue("@Gender", CVSelection.Gender)
                cmd.Parameters.AddWithValue("@AgeFrom", CVSelection.AgeFrom)
                cmd.Parameters.AddWithValue("@AgeTo", CVSelection.AgeTo)
                cmd.Parameters.AddWithValue("@Religion", CVSelection.Religion)
                cmd.Parameters.AddWithValue("@YearOfExperience", CVSelection.YearOfExperience)
                cmd.Parameters.AddWithValue("@SpecializedID", CVSelection.SpecializedID)
                cmd.Parameters.AddWithValue("@MajorTypeID", CVSelection.MajorTypeID)

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

#Region " Search Total Applicant "

    Public Function fnSearchTotalApplicant(ByVal CVSelection As clsCVSelection) As DataSet

        Dim sp As String = "spSearchTotalApplicant"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CandidateName", CVSelection.CandidateName)
                cmd.Parameters.AddWithValue("@InstitutionID", CVSelection.InstitutionID)
                cmd.Parameters.AddWithValue("@PresentDistrictID", CVSelection.PresentDistrictID)
                cmd.Parameters.AddWithValue("@PermanentDistrictID", CVSelection.PermanentDistrictID)
                cmd.Parameters.AddWithValue("@Gender", CVSelection.Gender)
                cmd.Parameters.AddWithValue("@AgeFrom", CVSelection.AgeFrom)
                cmd.Parameters.AddWithValue("@AgeTo", CVSelection.AgeTo)
                cmd.Parameters.AddWithValue("@YearOfExperience", CVSelection.YearOfExperience)
                cmd.Parameters.AddWithValue("@SpecializedID", CVSelection.SpecializedID)
                cmd.Parameters.AddWithValue("@MajorTypeID", CVSelection.MajorTypeID)

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

#Region " Get Not Submitted CV "

    Public Function fnGetNotSubmittedCV() As DataSet

        Dim sp As String = "spGetNotSubmittedCV"
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

#Region " Get Reviewd CV By CircularID "

    Public Function fnGetReviewdCVByCircularID(ByVal CircularID As String) As DataSet

        Dim sp As String = "spGetReviewdCVByCircularID"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CircularID", CircularID)
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

#Region " Get Reviewd CV By Rec TypeID "

    Public Function fnGetReviewdCVByRecTypeID(ByVal RecruitmentTypeID As String) As DataSet

        Dim sp As String = "spGetReviewdCVByRecTypeID"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@RecruitmentTypeID", RecruitmentTypeID)
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

#Region " Get Reviewd CV By Circular ID Suit "

    Public Function fnGetReviewdCVByCircularIDSuit(ByVal CircularID As String, ByVal SuitableFor As String) As DataSet

        Dim sp As String = "spGetReviewdCVByCircularIDSuit"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CircularID", CircularID)
                cmd.Parameters.AddWithValue("@SuitableFor", SuitableFor)
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

#Region " Get Rejected CV By CircularID "

    Public Function fnGetRejectedCVByCircularID(ByVal CircularID As String) As DataSet

        Dim sp As String = "spGetRejectedCVByCircularID"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CircularID", CircularID)
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

#Region " Get Rejected CV By Rec Type ID "

    Public Function fnGetRejectedCVByRecTypeID(ByVal RecruitmentTypeID As String) As DataSet

        Dim sp As String = "spGetRejectedCVByRecTypeID"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@RecruitmentTypeID", RecruitmentTypeID)
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

#Region " Review Applicant "
    Public Function fnReviewApplicant(ByVal ApplicantList As String, ByVal TakenAction As String, ByVal UserID As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spChangeApplicantStatus", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ApplicantList", ApplicantList)
            cmd.Parameters.AddWithValue("@TakenAction", TakenAction)
            cmd.Parameters.AddWithValue("@UserID", UserID)
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

#Region " Change Applicant Status Int Pending "
    Public Function fnChangeApplicantStatusIntPending(ByVal ApplicantList As String, ByVal TakenAction As String, ByVal RejectionRemarks As String, ByVal UserID As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spChangeApplicantStatusIntPending", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ApplicantList", ApplicantList)
            cmd.Parameters.AddWithValue("@TakenAction", TakenAction)
            cmd.Parameters.AddWithValue("@RejectionRemarks", RejectionRemarks)
            cmd.Parameters.AddWithValue("@UserID", UserID)
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

#Region " Get Exam Assigned Candidate "
    Public Function fnGetExamAssignedCandidate(ByVal CircularID As String) As DataSet

        Dim sp As String = "spGetExamAssignedCandidate"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CircularID", CircularID)
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

#Region " Get Exam Assigned Not Taken By Rec Type ID "
    Public Function fnGetExamAssignedNotTakenByRecTypeID(ByVal RecruitmentTypeID As String) As DataSet

        Dim sp As String = "spGetExamAssignedNotTakenByRecTypeID"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@RecruitmentTypeID", RecruitmentTypeID)
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

#Region " Get Exam Assigned By Rec Type ID "
    Public Function fnGetExamAssignedByRecTypeID(ByVal RecruitmentTypeID As String) As DataSet

        Dim sp As String = "spGetExamAssignedByRecTypeID"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@RecruitmentTypeID", RecruitmentTypeID)
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

#Region " Get Exam Assigned Candidate Suit "
    Public Function fnGetExamAssignedCandidateSuit(ByVal CircularID As String, ByVal SuitableFor As String) As DataSet

        Dim sp As String = "spGetExamAssignedCandidateSuit"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CircularID", CircularID)
                cmd.Parameters.AddWithValue("@SuitableFor", SuitableFor)
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

#Region " Get Candidate Wise Summary Result "
    Public Function fnGetCandidateWiseSummaryResult(ByVal CandidateID As String) As DataSet

        Dim sp As String = "spGetCandidateWiseSummaryResult"
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

#Region " Finally Selected Candidates "

    Public Function fnFinallySelectedCandidates(ByVal IntGradeID As String) As DataSet

        Dim sp As String = "spFinallySelectedCandidates"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@IntGradeID", IntGradeID)
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

#Region " Interviewed Candidates "

    Public Function fnInterviewedCandidates(ByVal IntGradeID As String, ByVal CircularID As String) As DataSet

        Dim sp As String = "spInterviewedCandidates"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@IntGradeID", IntGradeID)
                cmd.Parameters.AddWithValue("@CircularID", CircularID)
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

#Region " Interviewed Candidates By Rec Type ID "

    Public Function fnInterviewedCandidatesByRecTypeID(ByVal RecruitmentTypeID As String, ByVal IntGradeID As String) As DataSet

        Dim sp As String = "spInterviewedCandidatesByRecTypeID"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@RecruitmentTypeID", RecruitmentTypeID)
                cmd.Parameters.AddWithValue("@IntGradeID", IntGradeID)
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

#Region " Get Pending Interview Candidate List "

    Public Function fnGetPendingIntCandidateList(ByVal CircularID As String) As DataSet

        Dim sp As String = "spGetPendingIntCandidateList"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CircularID", CircularID)
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

#Region " Get Pending Int Candidate List Suit "

    Public Function fnGetPendingIntCandidateListSuit(ByVal CircularID As String, ByVal SuitableFor As String) As DataSet

        Dim sp As String = "spGetPendingIntCandidateListSuit"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CircularID", CircularID)
                cmd.Parameters.AddWithValue("@SuitableFor", SuitableFor)
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

#Region "Selected Candidates for Employeement"
    Public Function fnSelectedCandidatesForEmployment() As DataSet

        Dim sp As String = "spSelectedCandidatesForEmployment"
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

#Region " Get Candidates Not Joined "
    Public Function fnGetCandidatesNotJoined() As DataSet

        Dim sp As String = "spGetCandidatesNotJoined"
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
