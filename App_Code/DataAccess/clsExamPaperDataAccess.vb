Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsExamPaperDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Exam Paper "
    Public Function fnInsertExamPaper(ByVal ExamPaper As clsExamPaper) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertExamPaper", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ExamWiseSubjectID", ExamPaper.ExamWiseSubjectID)
            cmd.Parameters.AddWithValue("@QuestionID", ExamPaper.QuestionID)
            cmd.Parameters.AddWithValue("@EntryBy", ExamPaper.EntryBy)

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

#Region " Inactive Exam Wise Question "
    Public Function fnInactiveExamWiseQuestion(ByVal ExamPaper As clsExamPaper) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInactiveExamWiseQuestion", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ExamWiseSubjectID", ExamPaper.ExamWiseSubjectID)
            cmd.Parameters.AddWithValue("@QuestionID", ExamPaper.QuestionID)
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
