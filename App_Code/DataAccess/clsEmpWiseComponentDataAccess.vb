Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsEmpWiseComponentDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Employee Wise Components "

    Public Function fnInsertEmployeeWiseComponents(ByVal EmpComponent As clsEmpWiseComponent) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertEmployeeWiseComponents", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", EmpComponent.EmployeeID)
            cmd.Parameters.AddWithValue("@RoleComponentID", EmpComponent.RoleComponentID)
            cmd.Parameters.AddWithValue("@ComponentIDList", EmpComponent.ComponentIDList)
            cmd.Parameters.AddWithValue("@EntryBy", EmpComponent.EntryBy)
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

#Region " Update Emp Wise Component "

    Public Function fnUpdateEmpWiseComponent(ByVal EmpComponent As clsEmpWiseComponent) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateEmpWiseComponent", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmpComponentID", EmpComponent.EmpComponentID)
            cmd.Parameters.AddWithValue("@CompValue", EmpComponent.CompValue)
            cmd.Parameters.AddWithValue("@CompValDependentOn", EmpComponent.CompValDependentOn)
            cmd.Parameters.AddWithValue("@CompRatio", EmpComponent.CompRatio)
            cmd.Parameters.AddWithValue("@Consolidated", EmpComponent.Consolidated)
            cmd.Parameters.AddWithValue("@IsMonthlyComponent", EmpComponent.IsMonthlyComponent)
            cmd.Parameters.AddWithValue("@IsGrossComponent", EmpComponent.IsGrossComponent)
            cmd.Parameters.AddWithValue("@IsTaxable", EmpComponent.IsTaxable)
            cmd.Parameters.AddWithValue("@TaxExemptionLimit", EmpComponent.TaxExemptionLimit)
            cmd.Parameters.AddWithValue("@IsActive", EmpComponent.IsActive)
            cmd.Parameters.AddWithValue("@CompState", EmpComponent.CompState)
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

#Region " Show Emp Wise Components "

    Public Function fnShowEmpWiseComponents(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spShowEmpWiseComponents"
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

#Region " Get Details By Emp Wise ComponentID "

    Public Function fnGetDetailsByEmpWiseComponentID(ByVal EmpComponentID As String) As clsEmpWiseComponent

        Dim EmpWiseComponent As New clsEmpWiseComponent()
        Dim sp As String = "spGetDetailsByEmpWiseComponentID"
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmpComponentID", EmpComponentID)
                Dim dr As SqlDataReader = cmd.ExecuteReader()
                While dr.Read()
                    EmpWiseComponent.ComponentName = dr.Item("ComponentName")
                    EmpWiseComponent.CompValue = dr.Item("CompValue")
                    EmpWiseComponent.CompValDependentOn = dr.Item("CompValDependentOn")
                    EmpWiseComponent.CompRatio = dr.Item("CompRatio")
                    EmpWiseComponent.Consolidated = dr.Item("Consolidated")
                    EmpWiseComponent.IsMonthlyComponent = dr.Item("IsMonthlyComponent")
                    EmpWiseComponent.IsGrossComponent = dr.Item("IsGrossComponent")
                    EmpWiseComponent.IsTaxable = dr.Item("IsTaxable")
                    EmpWiseComponent.TaxExemptionLimit = dr.Item("TaxExemptionLimit")
                    EmpWiseComponent.IsActive = dr.Item("IsActive")
                    EmpWiseComponent.CompState = dr.Item("CompState")
                End While
                con.Close()
                Return EmpWiseComponent
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
