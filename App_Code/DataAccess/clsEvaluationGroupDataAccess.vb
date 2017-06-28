Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient


Public Class clsEvaluationGroupDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Evaluation Group "

    Public Function fnInsertEvaluationGroup(ByVal EvalGroup As clsEvaluationGroup) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertEvaluationGroup", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EvaluationGroup", EvalGroup.EvaluationGroup)
            cmd.Parameters.AddWithValue("@IsActive", EvalGroup.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", EvalGroup.EntryBy)
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

#Region " Get Active Eval Group "

    Public Function fnGetActiveEvalGroup() As DataSet
        Dim sp As String = "spGetActiveEvalGroup"
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

End Class
