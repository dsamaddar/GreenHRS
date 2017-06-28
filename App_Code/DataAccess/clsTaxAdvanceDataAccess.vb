Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsTaxAdvanceDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Tax Advance "
    Public Function fnInsertTaxAdvance(ByVal TaxAdvance As clsTaxAdvance) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertTaxAdvance", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", TaxAdvance.EmployeeID)
            cmd.Parameters.AddWithValue("@TaxAdvance", TaxAdvance.TaxAdvance)
            cmd.Parameters.AddWithValue("@IssueDate", TaxAdvance.IssueDate)
            cmd.Parameters.AddWithValue("@Remarks", TaxAdvance.Remarks)
            cmd.Parameters.AddWithValue("@EntryBy", TaxAdvance.EntryBy)
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

#Region " Get Tax Adv By Emp ID "

    Public Function fnGetTaxAdvByEmpID(ByVal EmployeeID As String) As DataSet
        Dim sp As String = "spGetTaxAdvByEmpID"
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
