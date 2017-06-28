Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsExternalTestScoreDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert External Test Score "

    Public Function fnInsertExternalTestScore(ByVal ExternalTestScore As clsExternalTestScore) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertExternalTestScore", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ExternalTestTypeID", ExternalTestScore.ExternalTestTypeID)
            cmd.Parameters.AddWithValue("@ExamTakerID", ExternalTestScore.ExamTakerID)
            cmd.Parameters.AddWithValue("@ExamTakerType", ExternalTestScore.ExamTakerType)
            cmd.Parameters.AddWithValue("@ExamTakenOn", ExternalTestScore.ExamTakenOn)
            cmd.Parameters.AddWithValue("@MarksObtained", ExternalTestScore.MarksObtained)
            cmd.Parameters.AddWithValue("@MarksOutOf", ExternalTestScore.MarksOutOf)
            cmd.Parameters.AddWithValue("@Grading", ExternalTestScore.Grading)
            cmd.Parameters.AddWithValue("@Remarks", ExternalTestScore.Remarks)
            cmd.Parameters.AddWithValue("@Attachment", ExternalTestScore.Attachment)
            cmd.Parameters.AddWithValue("@EntryBy", ExternalTestScore.EntryBy)
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

#Region " Get Ext Test Score By Exam Taker "

    Public Function fnGetExtTestScoreByExamTaker(ByVal ExamTakerID As String) As DataSet

        Dim sp As String = "spGetExtTestScoreByExamTaker"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@ExamTakerID", ExamTakerID)
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

#Region " Search Exam Taker "

    Public Function fnSearchExamTaker(ByVal UserIDOrName As String) As DataSet

        Dim sp As String = "spSearchExamTaker"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@UserIDOrName", UserIDOrName)
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
