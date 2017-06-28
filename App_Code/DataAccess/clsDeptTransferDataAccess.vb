Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsDeptTransferDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Dept Transfer "

    Public Function fnInsertDeptTransfer(ByVal DeptTransfer As clsDeptTransfer) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertDeptTransfer", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", DeptTransfer.EmployeeID)
            cmd.Parameters.AddWithValue("@OldDepartment", DeptTransfer.OldDepartment)
            cmd.Parameters.AddWithValue("@PrevSupervisor", DeptTransfer.PrevSupervisor)
            cmd.Parameters.AddWithValue("@NewDepartment", DeptTransfer.NewDepartment)
            cmd.Parameters.AddWithValue("@NewSupervisor", DeptTransfer.NewSupervisor)
            cmd.Parameters.AddWithValue("@EffectiveDate", DeptTransfer.EffectiveDate)
            cmd.Parameters.AddWithValue("@IssuedBy", DeptTransfer.IssuedBy)
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

    Public Function fnGetDepartmentTransferData(ByVal UniqueUserID As String) As DataSet
        Dim sp As String = "spGetDepartmentTransferData"
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
