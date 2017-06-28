Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsQuestionPaperDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Chk Already Assigned And Exam Not Taken  "

    Public Function fnChkAlreadyAssignedAndExamNotTaken(ByVal ExamTakerID As String, ByVal ExamID As String) As Integer
        Dim sp As String = "spChkAlreadyAssignedAndExamNotTaken"
        Dim AlreadyAssigned As Integer
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@ExamTakerID", ExamTakerID)
                cmd.Parameters.AddWithValue("@ExamID", ExamID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    AlreadyAssigned = dr.Item("AlreadyAssigned")
                End While
                con.Close()
                Return AlreadyAssigned
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return 0
        End Try
    End Function

#End Region

#Region " Assign Question Paper "
    Public Function fnAssignQuestionPaper(ByVal QuestionPaper As clsQuestionPaper) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spAssignQuestionPaper", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ExamID", QuestionPaper.ExamID)
            cmd.Parameters.AddWithValue("@Participant", QuestionPaper.Participant)
            cmd.Parameters.AddWithValue("@EntryPoint", QuestionPaper.EntryPoint)
            cmd.Parameters.AddWithValue("@EffectiveDate", QuestionPaper.EffectiveDate)
            cmd.Parameters.AddWithValue("@CircularID", QuestionPaper.CircularID)
            cmd.Parameters.AddWithValue("@PreparedBy", QuestionPaper.PreparedBy)
            cmd.Parameters.AddWithValue("@ULCBranchID", QuestionPaper.ULCBranchID)
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

#Region " Activate Exam "
    Public Function fnActivateExam(ByVal QuestionPaper As clsQuestionPaper) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spActivateExam", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ExamTakerID", QuestionPaper.ExamTakerID)
            cmd.Parameters.AddWithValue("@ExamRollNo", QuestionPaper.ExamRollNo)
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

#Region " InActivateExam "
    Public Function fnInActivateExam(ByVal QuestionPaper As clsQuestionPaper) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInActivateExam", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ExamTakerID", QuestionPaper.ExamTakerID)
            cmd.Parameters.AddWithValue("@ExamRollNo", QuestionPaper.ExamRollNo)
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

#Region " Assign Emp Question Paper "
    Public Function fnAssignEmpQuestionPaper(ByVal QuestionPaper As clsQuestionPaper) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spAssignEmpQuestionPaper", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ExamID", QuestionPaper.ExamID)
            cmd.Parameters.AddWithValue("@Participant", QuestionPaper.Participant)
            cmd.Parameters.AddWithValue("@EntryPoint", QuestionPaper.EntryPoint)
            cmd.Parameters.AddWithValue("@EffectiveDate", QuestionPaper.EffectiveDate)
            cmd.Parameters.AddWithValue("@PreparedBy", QuestionPaper.PreparedBy)
            cmd.Parameters.AddWithValue("@ULCBranchID", QuestionPaper.ULCBranchID)
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

#Region " Get Entry Points "

    Public Function fnGetEntryPoints() As DataSet

        Dim sp As String = "spGetEntryPoints"
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

#Region " Get Attendees By Entry Point "

    Public Function fnGetAttendeesByEntryPoint(ByVal EntryPoint As String) As DataSet

        Dim sp As String = "spGetAttendeesByEntryPoint"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EntryPoint", EntryPoint)
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

#Region " Report Exam "

    Public Function fnReportExam(ByVal QuesPaper As clsQuestionPaper) As DataSet

        Dim sp As String = "spReportExam"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.CommandTimeout = 999999
                cmd.Parameters.AddWithValue("@ExamID", QuesPaper.ExamID)
                cmd.Parameters.AddWithValue("@ULCBranchID", QuesPaper.ULCBranchID)
                cmd.Parameters.AddWithValue("@ExamTakerID", QuesPaper.ExamTakerID)
                cmd.Parameters.AddWithValue("@ExamRollNo", QuesPaper.ExamRollNo)
                cmd.Parameters.AddWithValue("@ExamTaken", QuesPaper.ExamTakenStr)
                cmd.Parameters.AddWithValue("@StartDate", QuesPaper.StartTime)
                cmd.Parameters.AddWithValue("@EndDate", QuesPaper.EndTime)
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

#Region " Get Available Exams By UserID "

    Public Function fnGetAvailableExamsByUserID(ByVal UniqueUserID As String) As DataSet

        Dim sp As String = "spGetAvailableExamsByUserID"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@UniqueUserID", UniqueUserID)
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

#Region " Verify RollNo  "

    Public Function fnVerifyRollNo(ByVal UniqueUserID As String, ByVal ExamID As String, ByVal ExamRollNo As String) As Integer
        Dim sp As String = "spVerifyRollNo"
        Dim Verified As Integer
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@UniqueUserID", UniqueUserID)
                cmd.Parameters.AddWithValue("@ExamID", ExamID)
                cmd.Parameters.AddWithValue("@ExamRollNo", ExamRollNo)

                dr = cmd.ExecuteReader()
                While dr.Read()
                    Verified = dr.Item("Verified")
                End While
                con.Close()
                Return Verified
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return 0
        End Try
    End Function

#End Region

#Region " Start Quiz "
    Public Function fnStartQuiz(ByVal QuestionPaper As clsQuestionPaper) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spStartQuiz", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ExamRollNo", QuestionPaper.ExamRollNo)
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

#Region " Skip Question "
    Public Function fnSkipQuestion(ByVal QuestionPaper As clsQuestionPaper) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spSkipQuestion", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandTimeout = 99999
            cmd.Parameters.AddWithValue("@QuestionPaperID", QuestionPaper.QuestionPaperID)
            cmd.Parameters.AddWithValue("@ExamRollNo", QuestionPaper.ExamRollNo)
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

#Region " LoadNextQuestion "
    Public Function fnLoadNextQuestion(ByVal QuestionPaper As clsQuestionPaper) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spLoadNextQuestion", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandTimeout = 999999
            cmd.Parameters.AddWithValue("@QuestionPaperID", QuestionPaper.QuestionPaperID)
            cmd.Parameters.AddWithValue("@GivenAnswer", QuestionPaper.GivenAnswer)
            cmd.Parameters.AddWithValue("@GivenAnswerImage", QuestionPaper.GivenAnswerImage)
            cmd.Parameters.AddWithValue("@ExamRollNo", QuestionPaper.ExamRollNo)
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

#Region " Finalized Exam "
    Public Function fnFinalizedExam(ByVal QuestionPaper As clsQuestionPaper) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spFinalizedExam", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ExamRollNo", QuestionPaper.ExamRollNo)
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

#Region " Time Outs "
    Public Function fnTimeOuts(ByVal QuestionPaper As clsQuestionPaper) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spTimeOuts", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ExamRollNo", QuestionPaper.ExamRollNo)
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

#Region " Reschedule Exam "
    Public Function fnRescheduleExam(ByVal QuestionPaper As clsQuestionPaper) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spRescheduleExam", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ExamTakerID", QuestionPaper.ExamTakerID)
            cmd.Parameters.AddWithValue("@ExamRollNo", QuestionPaper.ExamRollNo)
            cmd.Parameters.AddWithValue("@EffectiveDate", QuestionPaper.EffectiveDate)
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

#Region " Get Remaining Question Status  "

    Public Function fnGetRemainingQuestionStatus(ByVal ExamRollNo As String, ByVal Status As String) As Integer
        Dim sp As String = "spGetRemainingQuestionStatus"
        Dim NotAnsweredCount As Integer
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@ExamRollNo", ExamRollNo)
                cmd.Parameters.AddWithValue("@Status", Status)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    NotAnsweredCount = dr.Item("Remaining")
                End While
                con.Close()
                Return NotAnsweredCount
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return 0
        End Try
    End Function

#End Region

#Region " Get Total Remaining Question  "

    Public Function fnGetTotalRemainingQuestion(ByVal ExamRollNo As String) As Integer
        Dim sp As String = "spGetTotalRemainingQuestion"
        Dim NotAnsweredCount As Integer
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@ExamRollNo", ExamRollNo)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    NotAnsweredCount = dr.Item("Remaining")
                End While
                con.Close()
                Return NotAnsweredCount
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return 0
        End Try
    End Function

#End Region

End Class
