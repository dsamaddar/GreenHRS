Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data


Public Class clsSupervisorChangeDataAccess


    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Supervisor Change History "

    Public Function fnInsertSupervisorChangeHistory(ByVal SupervisorChange As clsSupervisorChange) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertSupervisorChangeHistory", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", SupervisorChange.EmployeeID)
            cmd.Parameters.AddWithValue("@PrevSupervisor", SupervisorChange.PrevSupervisor)
            cmd.Parameters.AddWithValue("@NewSupervisor", SupervisorChange.NewSupervisor)
            cmd.Parameters.AddWithValue("@EffectiveDate", SupervisorChange.EffectiveDate)
            cmd.Parameters.AddWithValue("@IssuedBy", SupervisorChange.IssuedBy)
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

#Region " Show Supervisor Change History"

    Public Function fnShowSupervisorChngHistory(ByVal EmployeeID As String) As DataSet
        Dim sp As String = "spShowSupervisorChngHistory"
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
