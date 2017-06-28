Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsPromotionHistoryDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Promotion History "

    Public Function fnInsertPromotionHistory(ByVal PromotionHistory As clsPromotionHistory) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertPromotionHistory", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", PromotionHistory.EmployeeID)
            cmd.Parameters.AddWithValue("@EvaluationSummary", PromotionHistory.EvaluationSummary)
            cmd.Parameters.AddWithValue("@OldDesignation", PromotionHistory.OldDesignation)
            cmd.Parameters.AddWithValue("@NewDesignation", PromotionHistory.NewDesignation)
            cmd.Parameters.AddWithValue("@EffectiveDate", PromotionHistory.EffectiveDate)
            cmd.Parameters.AddWithValue("@ApprovalAttachment", PromotionHistory.ApprovalAttachment)
            cmd.Parameters.AddWithValue("@IssuedBy", PromotionHistory.IssuedBy)
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

    Public Function fnGetPromotionHistory(ByVal UniqueUserID As String) As DataSet
        Dim sp As String = "spGetPromotionHistory"
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

    Public Sub fnGetEmpRelatedForCarPro(ByVal EmployeeID As String, ByRef JoiningDesignationID As String, ByRef FunctionalDesignation As String, ByRef CurrentSupervisor As String, ByRef DepartmentID As String, ByRef ULCBranchID As String)
        Dim sp As String = "spGetEmpRelatedForCarPro"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    JoiningDesignationID = dr.Item("OfficialDesignationID")
                    FunctionalDesignation = dr.Item("FunctionalDesignation")
                    CurrentSupervisor = dr.Item("CurrentSupervisor")
                    DepartmentID = dr.Item("DepartmentID")
                    ULCBranchID = dr.Item("ULCBranchID")
                End While
                con.Close()
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
        End Try
    End Sub

#End Region

End Class
