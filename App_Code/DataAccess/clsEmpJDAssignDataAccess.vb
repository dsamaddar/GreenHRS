Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsEmpJDAssignDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Emp JD Assign "

    Public Function fnInsertEmpJDAssign(ByVal EmpJD As clsEmpJDAssign) As Integer

        Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertEmpJDAssign", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", EmpJD.EmployeeID)
            cmd.Parameters.AddWithValue("@JobDescriptionID", EmpJD.JobDescriptionID)
            cmd.Parameters.AddWithValue("@IssueDate", EmpJD.IssueDate)
            cmd.Parameters.AddWithValue("@EffectiveDate", EmpJD.EffectiveDate)
            cmd.Parameters.AddWithValue("@AssignedBy", EmpJD.AssignedBy)
        
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
