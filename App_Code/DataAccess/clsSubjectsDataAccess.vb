Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsSubjectsDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Subjects "
    Public Function fnInsertSubjects(ByVal Subjects As clsSubjects) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertSubjects", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@SubjectName", Subjects.SubjectName)
            cmd.Parameters.AddWithValue("@SubjectCode", Subjects.SubjectCode)
            cmd.Parameters.AddWithValue("@EntryBy", Subjects.EntryBy)
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

#Region " Show Subjects "

    Public Function fnShowSubjects() As DataSet

        Dim sp As String = "spShowSubjects"
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

#Region " Get Subwise Question Order  "

    Public Function fnGetSubwiseQuestionOrder(ByVal Subject As clsSubjects) As clsQuestion
        Dim sp As String = "spGetSubwiseQuestionOrder"
        Dim Ques As New clsQuestion()
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@SubjectID", Subject.SubjectID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    Ques.QuestionOrder = dr.Item("QuestionOrder")
                    Ques.NoOfActiveQuestion = dr.Item("NoOfActiveQuestion")
                    Ques.NoOfInActiveQuestion = dr.Item("NoOfInActiveQuestion")
                    Ques.DifficultyLevelStr = dr.Item("DifficultyLevelStr")
                End While
                con.Close()

                Return Ques
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
