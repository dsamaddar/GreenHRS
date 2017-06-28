Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsEvaluationSummaryDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

    Public Function fnInsertEmpEvaluationSummary(ByVal EvalSummary As clsEvaluationSummary) As String
        Dim sp As String = "spInsertEmpEvaluationSummary"
        Dim EmpEvaluationSummaryID As String = ""
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EvalSummary.EmployeeID)
                cmd.Parameters.AddWithValue("@EvaluationFrom", EvalSummary.EvaluationFrom)
                cmd.Parameters.AddWithValue("@EvaluationTo", EvalSummary.EvaluationTo)
                cmd.Parameters.AddWithValue("@EvaluationYear", EvalSummary.EvaluationYear)
                cmd.Parameters.AddWithValue("@Remarks", EvalSummary.Remarks)
                cmd.Parameters.AddWithValue("@PerformanceRatingID", EvalSummary.PerformanceRatingID)
                cmd.Parameters.AddWithValue("@RecForBonus", EvalSummary.RecForBonus)
                cmd.Parameters.AddWithValue("@RecForProgression", EvalSummary.RecForProgression)
                cmd.Parameters.AddWithValue("@PrimaryEvaluator", EvalSummary.PrimaryEvaluator)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    EmpEvaluationSummaryID = dr.Item("EmpEvaluationSummaryID")
                End While
                con.Close()

                Return EmpEvaluationSummaryID
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return ""
        End Try
    End Function

#Region " Update Evaluation Summary Secondary Eval "

    Public Function fnUpdateEvalSummarySecEval(ByVal EvalSummary As clsEvaluationSummary) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateEvalSummarySecEval", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmpEvaluationSummaryID", EvalSummary.EmpEvaluationSummaryID)
            cmd.Parameters.AddWithValue("@PerformanceRatingSecID", EvalSummary.PerformanceRatingSecID)
            cmd.Parameters.AddWithValue("@RecForBonusSec", EvalSummary.RecForBonusSec)
            cmd.Parameters.AddWithValue("@RecForProgressionSec", EvalSummary.RecForProgressionSec)
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

#Region " Get Secondary Evaluation Pending List "

    Public Function fnGetSecEvalPendingList(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spGetSecEvalPendingList"
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

#Region " Get Primary Performance Rating "

    Public Function fnGetPrimaryPerformanceRating(ByVal EmpEvaluationSummaryID As String) As clsEvaluationSummary

        Dim sp As String = "spGetPrimaryPerformanceRating"
        Dim dr As SqlDataReader
        Dim EvalSummary As New clsEvaluationSummary()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmpEvaluationSummaryID", EmpEvaluationSummaryID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    EvalSummary.PerformanceRatingID = dr.Item("PerformanceRatingID")
                    EvalSummary.RecForBonus = dr.Item("RecForBonus")
                    EvalSummary.RecForProgression = dr.Item("RecForProgression")
                    EvalSummary.Disagreement = dr.Item("Disagreement")
                End While
                con.Close()

                Return EvalSummary
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Complete Evaluation "

    Public Function fnGetCompleteEvaluation(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spGetCompleteEvaluation"
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

#Region " Get Complete Eval By Me "

    Public Function fnGetCompleteEvalByMe(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spGetCompleteEvalByMe"
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

#Region " Get All Completed Eval By Year "

    Public Function fnGetAllCompletedEvalByYear(ByVal EvaluationYear As Integer) As DataSet

        Dim sp As String = "spGetAllCompletedEvalByYear"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EvaluationYear", EvaluationYear)
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

#Region " Chq For Existing Evaluation "

    Public Function fnChqForExistingEvaluation(ByVal EmployeeID As String, ByVal EvaluationFrom As DateTime, ByVal EvaluationTo As DateTime) As Boolean

        Dim sp As String = "spChqForExistingEvaluation"
        Dim Existing As Boolean = False
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                cmd.Parameters.AddWithValue("@EvaluationFrom", EvaluationFrom)
                cmd.Parameters.AddWithValue("@EvaluationTo", EvaluationTo)
                con.Close()
                dr = cmd.ExecuteReader()
                While dr.Read()
                    Existing = dr.Item("Existing")
                End While
                Return Existing
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
