Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsEmpResponsibilityDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Branch Transfer "

    Public Function fnInsertBranchTransfer(ByVal EmpRes As clsEmpResponsibility) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertEmpResponsibility", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", EmpRes.EmployeeID)
            cmd.Parameters.AddWithValue("@DepartmentID", EmpRes.DepartmentID)
            cmd.Parameters.AddWithValue("@OfficialDesignationID", EmpRes.OfficialDesignationID)
            cmd.Parameters.AddWithValue("@FunctionalDesignationID", EmpRes.FunctionalDesignationID)
            cmd.Parameters.AddWithValue("@MajorTask", EmpRes.MajorTask)
            cmd.Parameters.AddWithValue("@Remarks", EmpRes.Remarks)
            cmd.Parameters.AddWithValue("@EffectiveDate", EmpRes.EffectiveDate)
            cmd.Parameters.AddWithValue("@EntryBy", EmpRes.EntryBy)

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

#Region " Revoke Responsibility "

    Public Function fnRevokeResponsibility(ByVal EmpRes As clsEmpResponsibility) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spRevokeResponsibility", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmpResponsibilityID", EmpRes.EmpResponsibilityID)
            cmd.Parameters.AddWithValue("@RevokedCause", EmpRes.RevokedCause)
            cmd.Parameters.AddWithValue("@RevokedBy", EmpRes.RevokedBy)
            cmd.Parameters.AddWithValue("@RevokeDate", EmpRes.RevokeDate)

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

#Region " Show Emp Responsibility "

    Public Function fnShowEmpResponsibility(ByVal EmployeeID As String) As DataSet
        Dim sp As String = "spShowEmpResponsibility"
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

End Class
