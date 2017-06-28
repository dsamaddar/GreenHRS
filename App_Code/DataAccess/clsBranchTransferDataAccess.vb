Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsBranchTransferDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Branch Transfer "

    Public Function fnInsertBranchTransfer(ByVal BranchTransfer As clsBranchTransfer) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertBranchTransfer", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", BranchTransfer.EmployeeID)
            cmd.Parameters.AddWithValue("@OldBranchID", BranchTransfer.OldBranchID)
            cmd.Parameters.AddWithValue("@NewBranchID", BranchTransfer.NewBranchID)
            cmd.Parameters.AddWithValue("@PrevSupervisor", BranchTransfer.PrevSupervisor)
            cmd.Parameters.AddWithValue("@NewSupervisor", BranchTransfer.NewSupervisor)
            cmd.Parameters.AddWithValue("@EffectiveDate", BranchTransfer.EffectiveDate)
            cmd.Parameters.AddWithValue("@IssuedBy", BranchTransfer.IssuedBy)
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


    Public Function fnGetLocationTransferData(ByVal UniqueUserID As String) As DataSet
        Dim sp As String = "spGetBranchTransferData"
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
