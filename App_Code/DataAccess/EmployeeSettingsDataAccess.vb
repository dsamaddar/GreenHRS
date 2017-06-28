Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class EmployeeSettingsDataAccess
    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

    Public Function fnInsertDesignation(ByVal Employee As clsEmployee) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertDesignation", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@DesignationName", Employee.DesignationName)
            cmd.Parameters.AddWithValue("@DesignationLabel", Employee.DesignationLabel)
            cmd.Parameters.AddWithValue("@DesignationType", Employee.DesignationType)
            cmd.Parameters.AddWithValue("@HealthPlanID", Employee.HealthPlanID)
            cmd.Parameters.AddWithValue("@intOrder", Employee.intOrder)
            cmd.Parameters.AddWithValue("@EvaluationGroupID", Employee.EvaluationGroupID)
            cmd.Parameters.AddWithValue("@Fuel", Employee.Fuel)
            cmd.Parameters.AddWithValue("@DriverAllowance", Employee.DriverAllowance)
            cmd.Parameters.AddWithValue("@VehicleMaintenance", Employee.VehicleMaintenance)
            cmd.Parameters.AddWithValue("@CarSubsidy", Employee.CarSubsidy)
            cmd.Parameters.AddWithValue("@NoticePeriod", Employee.NoticePeriod)
            cmd.Parameters.AddWithValue("@MobileAllowance", Employee.MobileAllowance)
            cmd.Parameters.AddWithValue("@TransportAllowance", Employee.TransportAllowance)
            cmd.Parameters.AddWithValue("@IsActive", Employee.isActive)
            cmd.Parameters.AddWithValue("@EntryBy", Employee.EntryBy)
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

    Public Function fnGetDesignationList() As DataSet

        Dim sp As String = "spGetDesignation"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
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

    Public Function fnUpdateDesignation(ByVal Employee As clsEmployee) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateDesignation", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@DesignationID", Employee.DesignationID)
            cmd.Parameters.AddWithValue("@DesignationName", Employee.DesignationName)
            cmd.Parameters.AddWithValue("@DesignationLabel", Employee.DesignationLabel)
            cmd.Parameters.AddWithValue("@DesignationType", Employee.DesignationType)
            cmd.Parameters.AddWithValue("@HealthPlanID", Employee.HealthPlanID)
            cmd.Parameters.AddWithValue("@intOrder", Employee.intOrder)
            cmd.Parameters.AddWithValue("@EvaluationGroupID", Employee.EvaluationGroupID)
            cmd.Parameters.AddWithValue("@Fuel", Employee.Fuel)
            cmd.Parameters.AddWithValue("@DriverAllowance", Employee.DriverAllowance)
            cmd.Parameters.AddWithValue("@VehicleMaintenance", Employee.VehicleMaintenance)
            cmd.Parameters.AddWithValue("@CarSubsidy", Employee.CarSubsidy)
            cmd.Parameters.AddWithValue("@NoticePeriod", Employee.NoticePeriod)
            cmd.Parameters.AddWithValue("@MobileAllowance", Employee.MobileAllowance)
            cmd.Parameters.AddWithValue("@TransportAllowance", Employee.TransportAllowance)
            cmd.Parameters.AddWithValue("@IsActive", Employee.isActive)

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

    Public Function fnGetHealthPlanList() As DataSet

        Dim sp As String = "spGetHealthPlanType"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
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

    Public Function fnGetHealthPlanByDesignation(ByVal DesignationID As String) As String
        Dim HealthPlanID As String = ""
        Dim sp As String = "spGetHealthPlanByDesignation"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@DesignationID", DesignationID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    HealthPlanID = dr.Item("HealthPlanID")
                End While
                con.Close()

                Return HealthPlanID
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return ""
        End Try
    End Function

    Public Function fnManagePayrollAccess(ByVal EventName As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spManagePayrollAccess", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@Event", EventName)
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

    Public Function fnCheckForPayrollAccess() As String
        Dim PayrollAccess As String = ""
        Dim sp As String = "spCheckForPayrollAccess"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                dr = cmd.ExecuteReader()
                While dr.Read()
                    PayrollAccess = dr.Item("PayrollAccess")
                End While
                con.Close()
                Return PayrollAccess
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return ""
        End Try
    End Function


End Class

