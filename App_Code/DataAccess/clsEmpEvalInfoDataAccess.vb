Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class clsEmpEvalInfoDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Primary Emp Evaluation Info "

    Public Function fnInsertPrimaryEmpEvaluationInfo(ByVal EvalInfo As clsEmpEvalInfo) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertPrimaryEmpEvaluationInfo", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmpEvaluationSummaryID", EvalInfo.EmpEvaluationSummaryID)
            cmd.Parameters.AddWithValue("@PerformanceFactorID", EvalInfo.PerformanceFactorID)
            cmd.Parameters.AddWithValue("@PrimaryEvalGrading", EvalInfo.PrimaryEvalGrading)
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

    Public Function fnGetGradingByEvalID(ByVal EmpEvalInfo As clsEmpEvalInfo) As clsEmpEvalInfo

        Dim sp As String = "spGetGradingByEvalID"
        Dim GradingValue As String = ""
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmpEvaluationID", EmpEvalInfo.EmpEvaluationID)
                cmd.Parameters.AddWithValue("@EvaluationType", EmpEvalInfo.EvaluationType)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    EmpEvalInfo.GradingValue = dr.Item("GradingValue")
                End While
                con.Close()

                Return EmpEvalInfo
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#Region " Insert Secondary Evaluation Info "

    Public Function fnInsertSecEvalInfo(ByVal EvalInfo As clsEmpEvalInfo) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertSecEvalInfo", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmpEvaluationID", EvalInfo.EmpEvaluationID)
            cmd.Parameters.AddWithValue("@SecondaryEvalGrading", EvalInfo.SecondaryEvalGrading)
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
