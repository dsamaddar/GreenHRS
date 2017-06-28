Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsPausedExamStatusDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

    Public Function fnGetPausedExams() As DataSet

        Dim sp As String = "spGetPausedExams"
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

#Region " Get Paused Exam Status  "

    Public Function fnGetPausedExamStatus(ByVal ExamRollNo As String) As clsPausedExamStatus
        Dim sp As String = "spGetPausedExamStatus"
        Dim PausedExamStat As New clsPausedExamStatus()
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@ExamRollNo", ExamRollNo)

                dr = cmd.ExecuteReader()
                While dr.Read()
                    PausedExamStat.ExamRollNo = dr.Item("ExamRollNo")
                    PausedExamStat.QuestionLeft = dr.Item("QuestionLeft")
                    PausedExamStat.TimeTaken = dr.Item("TimeTaken")
                    PausedExamStat.SkippedQuestion = dr.Item("SkippedQuestion")
                End While
                con.Close()
                Return PausedExamStat
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Reactive Exam "
    Public Function fnReactiveExam(ByVal ExamRollNo As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spReactiveExam", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ExamRollNo", ExamRollNo)
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
