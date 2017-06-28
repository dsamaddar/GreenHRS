Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class cldJDAssignDataAccess
    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

    Public Function fnInsertAssignJD(ByVal EmpJDAssign As clsEmpJDAssign) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertEmpJDAssign", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", EmpJDAssign.EmployeeID)
            cmd.Parameters.AddWithValue("@JobDescriptionID", EmpJDAssign.JobDescriptionID)
            cmd.Parameters.AddWithValue("@IssueDate", EmpJDAssign.IssueDate)
            cmd.Parameters.AddWithValue("@EffectiveDate", EmpJDAssign.EffectiveDate)
            cmd.Parameters.AddWithValue("@AssignedBy", EmpJDAssign.AssignedBy)

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
End Class
