Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class clsPerformanceFactorDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Performance Factor "

    Public Function fnInsertPerformanceFactor(ByVal PerformanceFactor As clsPerformanceFactor) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertPerformanceFactor", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EvaluationGroupID", PerformanceFactor.EvaluationGroupID)
            cmd.Parameters.AddWithValue("@PerformancePartID", PerformanceFactor.PerformancePartID)
            cmd.Parameters.AddWithValue("@PerformanceTitle", PerformanceFactor.PerformanceTitle)
            cmd.Parameters.AddWithValue("@Explanation", PerformanceFactor.Explanation)
            cmd.Parameters.AddWithValue("@ViewOrder", PerformanceFactor.ViewOrder)
            cmd.Parameters.AddWithValue("@IsActive", PerformanceFactor.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", PerformanceFactor.EntryBy)
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

#Region " Update Performance Factor "

    Public Function fnUpdatePerformanceFactor(ByVal PerformanceFactor As clsPerformanceFactor) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdatePerformanceFactor", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@PerformanceFactorID", PerformanceFactor.PerformanceFactorID)
            cmd.Parameters.AddWithValue("@EvaluationGroupID", PerformanceFactor.EvaluationGroupID)
            cmd.Parameters.AddWithValue("@PerformancePartID", PerformanceFactor.PerformancePartID)
            cmd.Parameters.AddWithValue("@PerformanceTitle", PerformanceFactor.PerformanceTitle)
            cmd.Parameters.AddWithValue("@Explanation", PerformanceFactor.Explanation)
            cmd.Parameters.AddWithValue("@ViewOrder", PerformanceFactor.ViewOrder)
            cmd.Parameters.AddWithValue("@IsActive", PerformanceFactor.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", PerformanceFactor.EntryBy)
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

    Public Function fnGetPerformanceFactors() As DataSet
        Dim sp As String = "spGetPerformanceFactors"
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

    Public Function fnGetEvaluationForm(ByVal EmployeeID As String) As DataSet
        Dim sp As String = "spGetEvaluationForm"
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

    Public Function fnGetEvalFormForSecEval(ByVal EmpEvaluationSummaryID As String) As DataSet
        Dim sp As String = "spGetEvalFormForSecEval"
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

End Class
