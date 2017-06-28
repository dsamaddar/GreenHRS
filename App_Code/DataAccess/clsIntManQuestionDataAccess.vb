Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data


Public Class clsIntManQuestionDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Int Man Question "
    Public Function fnInsertIntManQuestion(ByVal IntManQuestion As clsIntManQuestion) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertIntManQuestion", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@Question", IntManQuestion.Question)
            cmd.Parameters.AddWithValue("@QuestionOrder", IntManQuestion.QuestionOrder)
            cmd.Parameters.AddWithValue("@IsActive", IntManQuestion.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", IntManQuestion.EntryBy)
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

#Region " Update Int Man Question "
    Public Function fnUpdateIntManQuestion(ByVal IntManQuestion As clsIntManQuestion) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateIntManQuestion", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@IntManQuestionID", IntManQuestion.IntManQuestionID)
            cmd.Parameters.AddWithValue("@Question", IntManQuestion.Question)
            cmd.Parameters.AddWithValue("@QuestionOrder", IntManQuestion.QuestionOrder)
            cmd.Parameters.AddWithValue("@IsActive", IntManQuestion.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", IntManQuestion.EntryBy)
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

#Region " Show Man Questions "

    Public Function fnShowManQuestions(ByVal IsActive As Boolean) As DataSet

        Dim sp As String = "spShowManQuestions"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@IsActive", IsActive)
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

#Region " Show Active Int Man Question "

    Public Function fnShowActiveIntManQuestion(ByVal IsActive As Boolean) As DataSet

        Dim sp As String = "spShowActiveIntManQuestion"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@IsActive", IsActive)
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

#Region " Get Int Man Ques By ID  "

    Public Function fnGetIntManQuesByID(ByVal IntManQuestion As clsIntManQuestion) As clsIntManQuestion
        Dim sp As String = "spGetIntManQuesByID"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@IntManQuestionID", IntManQuestion.IntManQuestionID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    IntManQuestion.Question = dr.Item("Question")
                    IntManQuestion.QuestionOrder = dr.Item("QuestionOrder")
                    IntManQuestion.IsActive = dr.Item("IsActive")
                End While
                con.Close()

                Return IntManQuestion
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Chq Get Int Ques Reply  "

    Public Function fnChqGetIntQuesReply(ByVal CandidateID As String, ByVal IntManQuestionID As String) As String
        Dim sp As String = "spChqGetIntQuesReply"
        Dim dr As SqlDataReader
        Dim Response As String = ""
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
                cmd.Parameters.AddWithValue("@IntManQuestionID", IntManQuestionID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    Response = dr.Item("Response")
                End While
                con.Close()

                Return Response
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return ""
        End Try
    End Function

#End Region

End Class
