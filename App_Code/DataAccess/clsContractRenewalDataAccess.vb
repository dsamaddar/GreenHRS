Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsContractRenewalDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Contract Renewal "

    Public Function fnInsertContractRenewal(ByVal ContractRenewal As clsContractRenewal) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertContractRenewal", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", ContractRenewal.EmployeeID)
            cmd.Parameters.AddWithValue("@RenewalSummary", ContractRenewal.RenewalSummary)
            cmd.Parameters.AddWithValue("@RenewalPeriod", ContractRenewal.RenewalPeriod)
            cmd.Parameters.AddWithValue("@ApprovalAttachment", ContractRenewal.ApprovalAttachment)
            cmd.Parameters.AddWithValue("@EvaluationAttachment", ContractRenewal.EvaluationAttachment)
            cmd.Parameters.AddWithValue("@EffectiveDate", ContractRenewal.EffectiveDate)
            cmd.Parameters.AddWithValue("@IssuedBy", ContractRenewal.IssuedBy)
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

    Public Function fnGetContractRenewalData(ByVal UniqueUserID As String) As DataSet
        Dim sp As String = "spGetContractRenewalDoc"
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

End Class
