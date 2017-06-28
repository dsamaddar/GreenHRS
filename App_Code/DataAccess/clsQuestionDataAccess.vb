Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsQuestionDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Questions "
    Public Function fnInsertQuestions(ByVal Question As clsQuestion) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertQuestions", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@SubjectID", Question.SubjectID)
            cmd.Parameters.AddWithValue("@Question", Question.Question)
            cmd.Parameters.AddWithValue("@Images", Question.Images)
            cmd.Parameters.AddWithValue("@Answer_A", Question.Answer_A)
            cmd.Parameters.AddWithValue("@Answer_A_Image", Question.Answer_A_Image)
            cmd.Parameters.AddWithValue("@OptA_Partial", Question.OptA_Partial)
            cmd.Parameters.AddWithValue("@Answer_B", Question.Answer_B)
            cmd.Parameters.AddWithValue("@Answer_B_Image", Question.Answer_B_Image)
            cmd.Parameters.AddWithValue("@OptB_Partial", Question.OptB_Partial)
            cmd.Parameters.AddWithValue("@Answer_C", Question.Answer_C)
            cmd.Parameters.AddWithValue("@Answer_C_Image", Question.Answer_C_Image)
            cmd.Parameters.AddWithValue("@OptC_Partial", Question.OptC_Partial)
            cmd.Parameters.AddWithValue("@Answer_D", Question.Answer_D)
            cmd.Parameters.AddWithValue("@Answer_D_Image", Question.Answer_D_Image)
            cmd.Parameters.AddWithValue("@OptD_Partial", Question.OptD_Partial)
            cmd.Parameters.AddWithValue("@Answer_E", Question.Answer_E)
            cmd.Parameters.AddWithValue("@Answer_E_Image", Question.Answer_E_Image)
            cmd.Parameters.AddWithValue("@OptE_Partial", Question.OptE_Partial)
            cmd.Parameters.AddWithValue("@CorrectAnswre", Question.CorrectAnswre)
            cmd.Parameters.AddWithValue("@CorrectAnswre_Image", Question.CorrectAnswre_Image)
            cmd.Parameters.AddWithValue("@AnswerExplanation", Question.AnswerExplanation)
            cmd.Parameters.AddWithValue("@DifficultyLevel", Question.DifficultyLevel)
            cmd.Parameters.AddWithValue("@HasPartialMarking", Question.HasPartialMarking)
            cmd.Parameters.AddWithValue("@IsActive", Question.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", Question.EntryBy)

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

#Region " Update Questions "
    Public Function fnUpdateQuestions(ByVal Question As clsQuestion) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateQuestions", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@QuestionID", Question.QuestionID)
            cmd.Parameters.AddWithValue("@Question", Question.Question)
            cmd.Parameters.AddWithValue("@Images", Question.Images)
            cmd.Parameters.AddWithValue("@Answer_A", Question.Answer_A)
            cmd.Parameters.AddWithValue("@Answer_A_Image", Question.Answer_A_Image)
            cmd.Parameters.AddWithValue("@OptA_Partial", Question.OptA_Partial)
            cmd.Parameters.AddWithValue("@Answer_B", Question.Answer_B)
            cmd.Parameters.AddWithValue("@Answer_B_Image", Question.Answer_B_Image)
            cmd.Parameters.AddWithValue("@OptB_Partial", Question.OptB_Partial)
            cmd.Parameters.AddWithValue("@Answer_C", Question.Answer_C)
            cmd.Parameters.AddWithValue("@Answer_C_Image", Question.Answer_C_Image)
            cmd.Parameters.AddWithValue("@OptC_Partial", Question.OptC_Partial)
            cmd.Parameters.AddWithValue("@Answer_D", Question.Answer_D)
            cmd.Parameters.AddWithValue("@Answer_D_Image", Question.Answer_D_Image)
            cmd.Parameters.AddWithValue("@OptD_Partial", Question.OptD_Partial)
            cmd.Parameters.AddWithValue("@Answer_E", Question.Answer_E)
            cmd.Parameters.AddWithValue("@Answer_E_Image", Question.Answer_E_Image)
            cmd.Parameters.AddWithValue("@OptE_Partial", Question.OptE_Partial)
            cmd.Parameters.AddWithValue("@CorrectAnswre", Question.CorrectAnswre)
            cmd.Parameters.AddWithValue("@CorrectAnswre_Image", Question.CorrectAnswre_Image)
            cmd.Parameters.AddWithValue("@AnswerExplanation", Question.AnswerExplanation)
            cmd.Parameters.AddWithValue("@DifficultyLevel", Question.DifficultyLevel)
            cmd.Parameters.AddWithValue("@HasPartialMarking", Question.HasPartialMarking)
            cmd.Parameters.AddWithValue("@EntryBy", Question.EntryBy)
            cmd.Parameters.AddWithValue("@IsQuestionImagesChanged", Question.IsQuestionImagesChanged)
            cmd.Parameters.AddWithValue("@IsAnswer_A_Image_Changed", Question.IsAnswer_A_Image_Changed)
            cmd.Parameters.AddWithValue("@IsAnswer_B_Image_Changed", Question.IsAnswer_B_Image_Changed)
            cmd.Parameters.AddWithValue("@IsAnswer_C_Image_Changed", Question.IsAnswer_C_Image_Changed)
            cmd.Parameters.AddWithValue("@IsAnswer_D_Image_Changed", Question.IsAnswer_D_Image_Changed)
            cmd.Parameters.AddWithValue("@IsAnswer_E_Image_Changed", Question.IsAnswer_E_Image_Changed)
            cmd.Parameters.AddWithValue("@IsCorrectAnswre_Image_Changed", Question.IsCorrectAnswre_Image_Changed)
            cmd.Parameters.AddWithValue("@IsActive", Question.IsActive)
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

#Region " Get All Questions By Sub ID "

    Public Function fnGetAllQuestionsBySubID(ByVal SubjectID As String) As DataSet

        Dim sp As String = "spGetAllQuestionsBySubID"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@SubjectID", SubjectID)
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

#Region " Get Question Info By QuestionID  "

    Public Function fnGetQuestionInfoByQuestionID(ByVal Question As clsQuestion) As clsQuestion
        Dim sp As String = "spGetQuestionInfoByQuestionID"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@QuestionID", Question.QuestionID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    Question.SubjectID = dr.Item("SubjectID")
                    Question.Question = dr.Item("Question")
                    Question.Images = dr.Item("Images")
                    Question.Answer_A = dr.Item("Answer_A")
                    Question.Answer_A_Image = dr.Item("Answer_A_Image")
                    Question.Answer_B = dr.Item("Answer_B")
                    Question.Answer_B_Image = dr.Item("Answer_B_Image")
                    Question.Answer_C = dr.Item("Answer_C")
                    Question.Answer_C_Image = dr.Item("Answer_C_Image")
                    Question.Answer_D = dr.Item("Answer_D")
                    Question.Answer_D_Image = dr.Item("Answer_D_Image")
                    Question.Answer_E = dr.Item("Answer_E")
                    Question.Answer_E_Image = dr.Item("Answer_E_Image")
                    Question.CorrectAnswre = dr.Item("CorrectAnswre")
                    Question.CorrectAnswre_Image = dr.Item("CorrectAnswre_Image")
                    Question.AnswerExplanation = dr.Item("AnswerExplanation")
                    Question.QuestionOrder = dr.Item("QuestionOrder")
                    Question.DifficultyLevel = dr.Item("DifficultyLevel")
                    Question.IsActive = dr.Item("IsActive")
                    Question.EntryBy = dr.Item("EntryBy")
                End While
                con.Close()

                Return Question
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Question Info By QuestionID  "

    Public Function fnGetSubwiseDifQuesDensity(ByVal SubjectID As String, ByVal DifficultyLevel As String) As Integer
        Dim sp As String = "spGetSubwiseDifQuesDensity"
        Dim QuestionCount As Integer = 0
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@SubjectID", SubjectID)
                cmd.Parameters.AddWithValue("@DifficultyLevel", DifficultyLevel)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    QuestionCount = dr.Item("QuestionCount")

                End While
                con.Close()

                Return QuestionCount
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Questions By EWSID "

    Public Function fnGetQuestionsByEWSID(ByVal ExamWiseSubjectID As String) As DataSet

        Dim sp As String = "spGetQuestionsByEWSID"
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

End Class
