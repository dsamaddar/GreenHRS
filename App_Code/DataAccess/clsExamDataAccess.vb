Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsExamDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Exam Definition "
    Public Function fnInsertExamDefinition(ByVal Exam As clsExam) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertExamDefinition", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ExamName", Exam.ExamName)
            cmd.Parameters.AddWithValue("@ExamCode", Exam.ExamCode)
            cmd.Parameters.AddWithValue("@PositiveMarkingPerQuestion", Exam.PositiveMarkingPerQuestion)
            cmd.Parameters.AddWithValue("@NegativeMarkingPerQuestion", Exam.NegativeMarkingPerQuestion)
            cmd.Parameters.AddWithValue("@SkipMarkingPerQuestion", Exam.SkipMarkingPerQuestion)
            cmd.Parameters.AddWithValue("@NotAnsweredMarkingPerQuestion", Exam.NotAnsweredMarkingPerQuestion)
            cmd.Parameters.AddWithValue("@TotalQuestion", Exam.TotalQuestion)
            cmd.Parameters.AddWithValue("@TotalMarks", Exam.TotalMarks)
            cmd.Parameters.AddWithValue("@TotalTime", Exam.TotalTime)
            cmd.Parameters.AddWithValue("@GradingSystem", Exam.GradingSystem)
            cmd.Parameters.AddWithValue("@IsDynamic", Exam.IsDynamic)
            cmd.Parameters.AddWithValue("@GradingSystemData", Exam.GradingSystemData)
            cmd.Parameters.AddWithValue("@ExamWiseSubjectData", Exam.ExamWiseSubjectData)
            cmd.Parameters.AddWithValue("@ExamInstructions", Exam.ExamInstructions)
            cmd.Parameters.AddWithValue("@EntryBy", Exam.EntryBy)
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

#Region " Get Exam Details "
    Public Function fnGetExamDetails(ByVal Exam As clsExam) As clsExam
        Dim sp As String = "spGetExamDetails"
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@ExamID", Exam.ExamID)
                Dim dr As SqlDataReader = cmd.ExecuteReader()
                While dr.Read()
                    Exam.ExamName = dr.Item("ExamName")
                    Exam.ExamCode = dr.Item("ExamCode")
                    Exam.PositiveMarkingPerQuestion = dr.Item("PositiveMarkingPerQuestion")
                    Exam.NegativeMarkingPerQuestion = dr.Item("NegativeMarkingPerQuestion")
                    Exam.SkipMarkingPerQuestion = dr.Item("SkipMarkingPerQuestion")
                    Exam.NotAnsweredMarkingPerQuestion = dr.Item("NotAnsweredMarkingPerQuestion")
                    Exam.TotalQuestion = dr.Item("TotalQuestion")
                    Exam.TotalMarks = dr.Item("TotalMarks")
                    Exam.TotalTime = dr.Item("TotalTime")
                    Exam.GradingSystem = dr.Item("GradingSystem")
                    Exam.IsDynamic = dr.Item("IsDynamic")
                    Exam.IsActive = dr.Item("IsActive")
                    Exam.ExamInstructions = dr.Item("ExamInstructions")
                End While
                con.Close()
                Return Exam
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Finalize Exam "
    Public Function fnFinalizeExam(ByVal Exam As clsExam) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spFinalizeExam", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ExamID", Exam.ExamID)
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

#Region " Get Available Exams "

    Public Function fnGetAvailableExams() As DataSet

        Dim sp As String = "spGetAvailableExams"
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

#Region " Show Total Exam Result "

    Public Function fnShowTotalExamResult(ByVal ExamID As String, ByVal StartDate As DateTime, ByVal EndDate As DateTime) As DataSet

        Dim sp As String = "spShowTotalExamResult"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.CommandTimeout = 99999
                cmd.Parameters.AddWithValue("@ExamID", ExamID)
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

#Region " Get Exam Result Summary "

    Public Function fnGetExamResultSummary(ByVal ExamIDList As String, ByVal PassPercentage As Integer) As DataSet

        Dim sp As String = "spGetExamResultSummary"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@ExamIDList", ExamIDList)
                cmd.Parameters.AddWithValue("@PassPercentage", PassPercentage)
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

#Region " Get Exam Wise Subject Status "

    Public Function fnGetExamWiseSubjectStatus(ByVal ExamID As String) As DataSet

        Dim sp As String = "spGetExamWiseSubjectStatus"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@ExamID", ExamID)
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

#Region " Exam Attendee Report "
    Public Function fnExamAttendeeReport(ByVal StartDate As DateTime, ByVal EndDate As DateTime) As DataSet

        Dim sp As String = "spExamAttendeeReport1"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.CommandTimeout = 99999
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

#Region " Get Branch Wise Exam Attendee "
    Public Function fnGetBranchWiseExamAttendee(ByVal ULCBranchID As String, ByVal StartDate As DateTime, ByVal EndDate As DateTime) As DataSet

        Dim sp As String = "spGetBranchWiseExamAttendee"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.CommandTimeout = 99999
                cmd.Parameters.AddWithValue("@ULCBranchID", ULCBranchID)
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

#Region " Exam Not Attendee Report "
    Public Function fnExamNotAttendeeReport(ByVal StartDate As DateTime, ByVal EndDate As DateTime) As DataSet

        Dim sp As String = "spExamNotAttendeeReport"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.CommandTimeout = 99999
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

#Region "Available Exam Attendee"
    Public Function fnAvailableExamAttendee(ByVal ExamID As String) As DataSet

        Dim sp As String = "spAvailableExamAttendee"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@ExamID", ExamID)
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

#Region " Get Exam Wise Subject Assignment "

    Public Function fnGetExamWiseSubjectAssignment(ByVal ExamID As String) As DataSet

        Dim sp As String = "spGetExamWiseSubjectAssignment"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@ExamID", ExamID)
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

#Region " Get Exam Parameters  "

    Public Function fnGetExamParameters(ByVal Exam As clsExam) As clsExam
        Dim sp As String = "spGetExamParameters"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@ExamID", Exam.ExamID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    Exam.TotalQuestion = dr.Item("TotalQuestion")
                    Exam.TotalMarks = dr.Item("TotalMarks")
                    Exam.TotalTime = dr.Item("TotalTime")
                    Exam.AllocationRemaining = dr.Item("AllocationRemaining")
                    Exam.AllocatedQuestionRemaining = dr.Item("AllocatedQuestionRemaining")
                End While
                con.Close()

                Return Exam
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Exam Sub Wise Allocated Questions "

    Public Function fnGetExamSubWiseAllocatedQuestions(ByVal ExamWiseSubjectID As String) As DataSet

        Dim sp As String = "spGetExamSubWiseAllocatedQuestions"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@ExamWiseSubjectID", ExamWiseSubjectID)
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

#Region "Get Candidate Details BY ExamID "

    Public Function fnGetCandidateDetailsByExamID(ByVal ExamID As String) As DataSet

        Dim sp As String = "spGetCanDetailsBYExamID"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@ExamID", ExamID)
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

#Region "Get Exam wise Summary Report "

    Public Function fnGetExamSummary(ByVal ExamID As String) As DataSet

        Dim sp As String = "spGetExamSummary"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@ExamID", ExamID)
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

#Region " Get Emp Wise Exam Summary Report "

    Public Function fnGetEmpWiseExamSummary(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spGetEmpWiseExamSummary"
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

#Region " Exm Emp Relation Rpt "

    Public Function fnExmEmpRelationRpt() As DataSet

        Dim sp As String = "spExmEmpRelationRpt"
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
