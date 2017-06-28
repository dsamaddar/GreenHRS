Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class clsAssessMyEval

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

    Public Function fnGetSelfEvalPendingByEmp(ByVal EmployeeID As String) As DataSet
        Dim sp As String = "spGetSelfEvalPendingByEmp"
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

    Public Function fnGetEvalFactorGradeForSelfAssessment(ByVal EmpEvaluationSummaryID As String) As DataSet
        Dim sp As String = "spGetEvalFactorGradeForSelfAssessment"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmpEvaluationSummaryID", EmpEvaluationSummaryID)
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

#Region " Submit Self Evaluation "

    Public Function fnSubmitSelfEvaluation(ByVal EmpEvaluationSummaryID As String, ByVal Disagreement As Boolean, ByVal DisagreementIDList As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spSubmitSelfEvaluation", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmpEvaluationSummaryID", EmpEvaluationSummaryID)
            cmd.Parameters.AddWithValue("@Disagreement", Disagreement)
            cmd.Parameters.AddWithValue("@DisagreementIDList", DisagreementIDList)
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
