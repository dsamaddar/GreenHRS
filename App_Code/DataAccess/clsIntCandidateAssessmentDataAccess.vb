Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsIntCandidateAssessmentDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Int Assessment "
    Public Function fnInsertIntAssessment(ByVal IntCanAssessmentInfo As clsIntCandidateAssessment) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertIntAssessment", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@IntCandidateID", IntCanAssessmentInfo.IntCandidateID)
            cmd.Parameters.AddWithValue("@IntGradeID", IntCanAssessmentInfo.IntGradeID)
            cmd.Parameters.AddWithValue("@DesignationID", IntCanAssessmentInfo.DesignationID)
            cmd.Parameters.AddWithValue("@DepartmentID", IntCanAssessmentInfo.DepartmentID)
            cmd.Parameters.AddWithValue("@ULCBranchID", IntCanAssessmentInfo.ULCBranchID)
            cmd.Parameters.AddWithValue("@Observations", IntCanAssessmentInfo.Observations)
            cmd.Parameters.AddWithValue("@MarksObtained", IntCanAssessmentInfo.MarksObtained)
            cmd.Parameters.AddWithValue("@MarksOutOf", IntCanAssessmentInfo.MarksOutOf)
            cmd.Parameters.AddWithValue("@IntTakerID", IntCanAssessmentInfo.IntTakerID)
            cmd.Parameters.AddWithValue("@IntManQuestionIDList", IntCanAssessmentInfo.IntManQuestionIDList)
            cmd.Parameters.AddWithValue("@AttendeeList", IntCanAssessmentInfo.AttendeeList)
            cmd.Parameters.AddWithValue("@SuitableForRec", IntCanAssessmentInfo.SuitableForRec)
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

#Region " Insert Int POOL "
    Public Function fnInsertIntPOOL(ByVal IntCanAssessmentInfo As clsIntCandidateAssessment) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertIntPOOL", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@IntCandidateID", IntCanAssessmentInfo.IntCandidateID)
            cmd.Parameters.AddWithValue("@IntGradeID", IntCanAssessmentInfo.IntGradeID)
            cmd.Parameters.AddWithValue("@DesignationID", IntCanAssessmentInfo.DesignationID)
            cmd.Parameters.AddWithValue("@DepartmentID", IntCanAssessmentInfo.DepartmentID)
            cmd.Parameters.AddWithValue("@ULCBranchID", IntCanAssessmentInfo.ULCBranchID)
            cmd.Parameters.AddWithValue("@Observations", IntCanAssessmentInfo.Observations)
            cmd.Parameters.AddWithValue("@MarksObtained", IntCanAssessmentInfo.MarksObtained)
            cmd.Parameters.AddWithValue("@MarksOutOf", IntCanAssessmentInfo.MarksOutOf)
            cmd.Parameters.AddWithValue("@IntTakerID", IntCanAssessmentInfo.IntTakerID)
            cmd.Parameters.AddWithValue("@Grading", IntCanAssessmentInfo.Grading)
            cmd.Parameters.AddWithValue("@IsSuitableAnyWhere", IntCanAssessmentInfo.IsSuitableAnyWhere)
            cmd.Parameters.AddWithValue("@SuitableForRegion", IntCanAssessmentInfo.SuitableForRegion)
            cmd.Parameters.AddWithValue("@SuitableForBranch", IntCanAssessmentInfo.SuitableForBranch)
            cmd.Parameters.AddWithValue("@IntReviewList", IntCanAssessmentInfo.IntReviewList)
            cmd.Parameters.AddWithValue("@IntManQuestionIDList", IntCanAssessmentInfo.IntManQuestionIDList)
            cmd.Parameters.AddWithValue("@AttendeeList", IntCanAssessmentInfo.AttendeeList)
            cmd.Parameters.AddWithValue("@SuitableForRec", IntCanAssessmentInfo.SuitableForRec)
            cmd.Parameters.AddWithValue("@EntryBy", IntCanAssessmentInfo.EntryBy)
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

#Region " Insert POOL Panel Interview "
    Public Function fnInsertPOOLPanelInterview(ByVal IntCanAssessmentInfo As clsIntCandidateAssessment) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertPOOLPanelInterview", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@IntCandidateID", IntCanAssessmentInfo.IntCandidateID)
            cmd.Parameters.AddWithValue("@IntGradeID", IntCanAssessmentInfo.IntGradeID)
            cmd.Parameters.AddWithValue("@DesignationID", IntCanAssessmentInfo.DesignationID)
            cmd.Parameters.AddWithValue("@DepartmentID", IntCanAssessmentInfo.DepartmentID)
            cmd.Parameters.AddWithValue("@ULCBranchID", IntCanAssessmentInfo.ULCBranchID)
            cmd.Parameters.AddWithValue("@Observations", IntCanAssessmentInfo.Observations)
            cmd.Parameters.AddWithValue("@MarksObtained", IntCanAssessmentInfo.MarksObtained)
            cmd.Parameters.AddWithValue("@MarksOutOf", IntCanAssessmentInfo.MarksOutOf)
            cmd.Parameters.AddWithValue("@IntTakerID", IntCanAssessmentInfo.IntTakerID)
            cmd.Parameters.AddWithValue("@Grading", IntCanAssessmentInfo.Grading)
            cmd.Parameters.AddWithValue("@IsSuitableAnyWhere", IntCanAssessmentInfo.IsSuitableAnyWhere)
            cmd.Parameters.AddWithValue("@SuitableForRegion", IntCanAssessmentInfo.SuitableForRegion)
            cmd.Parameters.AddWithValue("@SuitableForBranch", IntCanAssessmentInfo.SuitableForBranch)
            cmd.Parameters.AddWithValue("@IntReviewList", IntCanAssessmentInfo.IntReviewList)
            cmd.Parameters.AddWithValue("@IntManQuestionIDList", IntCanAssessmentInfo.IntManQuestionIDList)
            cmd.Parameters.AddWithValue("@AttendeeList", IntCanAssessmentInfo.AttendeeList)
            cmd.Parameters.AddWithValue("@SuitableForRec", IntCanAssessmentInfo.SuitableForRec)
            cmd.Parameters.AddWithValue("@EntryBy", IntCanAssessmentInfo.EntryBy)
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

#Region " Show Int Assessment By CanID "

    Public Function fnShowIntAssessmentByCanID(ByVal IntAssessment As clsIntCandidateAssessment) As DataSet

        Dim sp As String = "spShowIntAssessmentByCanID"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CandidateID", IntAssessment.CandidateID)
                cmd.Parameters.AddWithValue("@CircularID", IntAssessment.CircularID)
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

#Region " Get Int Info By Candidate "

    Public Function fnGetIntInfoByCandidate(ByVal CandidateID As String) As DataSet

        Dim sp As String = "spGetIntInfoByCandidate"
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

#Region " Primary Int Assessment New "
    Public Function fnPrimaryIntAssessmentNew(ByVal IntCanAssessmentInfo As clsIntCandidateAssessment) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spPrimaryIntAssessmentNew", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@IntCandidateID", IntCanAssessmentInfo.IntCandidateID)
            cmd.Parameters.AddWithValue("@IntReviewList", IntCanAssessmentInfo.IntReviewList)
            cmd.Parameters.AddWithValue("@IntTakerID", IntCanAssessmentInfo.IntTakerID)
            cmd.Parameters.AddWithValue("@Grading", IntCanAssessmentInfo.Grading)
            cmd.Parameters.AddWithValue("@EntryBy", IntCanAssessmentInfo.EntryBy)
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

End Class
