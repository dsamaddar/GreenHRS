Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsConfirmationEvaluationDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " InsertConfEvaluation "

    Public Function fnInsertConfEvaluation(ByVal ConfEvaluation As clsConfirmationEvaluation) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertConfEvaluation", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", ConfEvaluation.EmployeeID)
            cmd.Parameters.AddWithValue("@EvaluationSummary", ConfEvaluation.EvaluationSummary)
            cmd.Parameters.AddWithValue("@DecisionOfConfirmation", ConfEvaluation.DecisionOfConfirmation)
            cmd.Parameters.AddWithValue("@JoiningDesignation", ConfEvaluation.JoiningDesignation)
            cmd.Parameters.AddWithValue("@ConfirmationDesignation", ConfEvaluation.ConfirmationDesignation)
            cmd.Parameters.AddWithValue("@EffectiveDate", ConfEvaluation.EffectiveDate)
            cmd.Parameters.AddWithValue("@ApprovalAttachment", ConfEvaluation.ApprovalAttachment)
            cmd.Parameters.AddWithValue("@EvaluationAttachment", ConfEvaluation.EvaluationAttachment)
            cmd.Parameters.AddWithValue("@IssuedBy", ConfEvaluation.IssuedBy)
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

    Public Function fnGetUserDocuments(ByVal UniqueUserID As String) As DataSet
        Dim sp As String = "spGetConfEvaDoc"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@UniqueUserID", UniqueUserID)
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

    Public Function EmpCheckForConfirmation(ByVal EmployeeID As String) As Integer
        Dim cmd As New SqlCommand()
        Dim rd As SqlDataReader
        Dim Count As Integer
        Try
            con.Open()
            cmd.Connection = con

            cmd.CommandText = "Select Count(1) from tblEmployeeInfo where (ConfirmationDate<>'' and ConfirmationDate<>'01-01-1911') and EmployeeID= '" & EmployeeID & "'"
            rd = cmd.ExecuteReader()
            Count = 0
            While (rd.Read())
                Count = rd.GetValue(0)
            End While
            con.Close()
            Return Count
        Catch ex As SqlException
            con.Close()
            Return Nothing
        End Try
    End Function

End Class
