Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsFunctionalDesigHistDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)


    Public Function fnInsertFunctionalDesigHistory(ByVal FunctionalDesigHist As clsFunctionalDesigHist) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertFunctionalDesigHistory", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", FunctionalDesigHist.EmployeeID)
            cmd.Parameters.AddWithValue("@OldFuncDesigID", FunctionalDesigHist.OldFuncDesigID)
            cmd.Parameters.AddWithValue("@NewFuncDesigID", FunctionalDesigHist.NewFuncDesigID)
            cmd.Parameters.AddWithValue("@EffectiveDate", FunctionalDesigHist.EffectiveDate)
            cmd.Parameters.AddWithValue("@ApprovalAttachment", FunctionalDesigHist.ApprovalAttachment)
            cmd.Parameters.AddWithValue("@Remarks", FunctionalDesigHist.Remarks)
            cmd.Parameters.AddWithValue("@IssuedBy", FunctionalDesigHist.IssuedBy)
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

    Public Function fnGettFunctionalDesigData(ByVal UniqueUserID As String) As DataSet
        Dim sp As String = "spGetFunctionalDesigData"
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
End Class
