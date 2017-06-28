Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsNewReqProcessDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Get Req Pro Review Can "

    Public Function fnGetReqProReviewCan() As DataSet
        Dim sp As String = "spGetReqProReviewCan"
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

#Region " Get Req Pro Exm Ass "

    Public Function fnGetReqProExmAss() As DataSet
        Dim sp As String = "spGetReqProExmAss"
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

#Region " Calculate Offer Salary "

    Public Function fnCalculateOfferSalary(ByVal BasicSalary As Double, ByVal DesignationID As String, ByVal LocalConveyance As Double, ByVal OfferLetterFormat As String) As DataSet
        Dim sp As String = "spCalculateOfferSalary"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@BasicSalary", BasicSalary)
                cmd.Parameters.AddWithValue("@DesignationID", DesignationID)
                cmd.Parameters.AddWithValue("@LocalConveyance", LocalConveyance)
                cmd.Parameters.AddWithValue("@OfferLetterFormat", OfferLetterFormat)
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

#Region " Get Req Pro Exm Com "

    Public Function fnGetReqProExmCom() As DataSet
        Dim sp As String = "spGetReqProExmCom"
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

#Region " Get Primary Int Can "

    Public Function fnGetPrimaryIntCan() As DataSet
        Dim sp As String = "spGetPrimaryIntCan"
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

#Region " Get Panel Int Can "

    Public Function fnGetPanelIntCan() As DataSet
        Dim sp As String = "spGetPanelIntCan"
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

#Region " Rec Pro Get Joining Pending "

    Public Function fnRecProGetJoiningPending() As DataSet
        Dim sp As String = "spRecProGetJoiningPending"
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

#Region " Get Test Summary By Candidate "

    Public Function fnGetTestSummaryByCandidate(ByVal CandidateID As String) As DataSet
        Dim sp As String = "spGetTestSummaryByCandidate"
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

#Region " Delete Exam By Roll No "

    Public Function fnDeleteExamByRollNo(ByVal ExamRollNo As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spDeleteExamByRollNo", con)
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

#Region " Insert Bulk Int Ques Reply "

    Public Function fnInsertBulkIntQuesReply(ByVal CandidateID As String, ByVal IntManQuestionIDList As String, ByVal EntryBy As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertBulkIntQuesReply", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
            cmd.Parameters.AddWithValue("@IntQuesReplyList", IntManQuestionIDList)
            cmd.Parameters.AddWithValue("@EntryBy", EntryBy)
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

#Region " Change Can Status To POOL "

    Public Function fnChangeCanStatusToPOOL(ByVal CandidateID As String, ByVal EntryBy As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spChangeCanStatusToPOOL", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
            cmd.Parameters.AddWithValue("@EntryBy", EntryBy)
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

#Region " Find Can Pool New "

    Public Function fnFindCanPoolNew(ByVal SuitableFor As String, ByVal SuitableRegion As String, ByVal SuitableBranch As String) As DataSet

        Dim sp As String = "spFindCanPoolNew"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@SuitableFor", SuitableFor)
                cmd.Parameters.AddWithValue("@SuitableRegion", SuitableRegion)
                cmd.Parameters.AddWithValue("@SuitableBranch", SuitableBranch)
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

#Region " Get Short Listed Candidate New "

    Public Function fnGetShortListedCandidateNew() As DataSet

        Dim sp As String = "spGetShortListedCandidateNew"
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

#Region " Get Req Pro Int Team Member "

    Public Function fnGetReqProIntTeamMember(ByVal CandidateID As String) As DataSet

        Dim sp As String = "spGetReqProIntTeamMember"
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

End Class
