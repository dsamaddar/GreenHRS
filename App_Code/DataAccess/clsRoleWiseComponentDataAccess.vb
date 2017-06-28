Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsRoleWiseComponentDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Role Wise Component "

    Public Function fnInsertRoleWiseComponent(ByVal RoleWiseComponent As clsRoleWiseComponent) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertRoleWiseComponent", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@RoleName", RoleWiseComponent.RoleName)
            cmd.Parameters.AddWithValue("@Components", RoleWiseComponent.Components)
            cmd.Parameters.AddWithValue("@EntryBy", RoleWiseComponent.EntryBy)

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


#Region " Update Role Wise Component "

    Public Function fnUpdateRoleWiseComponent(ByVal RoleWiseComponent As clsRoleWiseComponent) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateRoleWiseComponent", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@RoleComponentID", RoleWiseComponent.RoleComponentID)
            cmd.Parameters.AddWithValue("@RoleName", RoleWiseComponent.RoleName)
            cmd.Parameters.AddWithValue("@Components", RoleWiseComponent.Components)
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

#Region " Show Role Components "

    Public Function fnShowRoleComponents() As DataSet

        Dim sp As String = "spShowRoleComponents"
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

#End Region

#Region " Get Role Wise Components "

    Public Function fnGetRoleWiseComponents(ByVal RoleComponentID As String) As clsRoleWiseComponent

        Dim sp As String = "spGetRoleWiseComponents"

        Dim RWC As New clsRoleWiseComponent()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@RoleComponentID", RoleComponentID)
                Dim dr As SqlDataReader = cmd.ExecuteReader()
                While dr.Read()
                    RWC.RoleName = dr.Item("RoleName")
                    RWC.Components = dr.Item("Components")
                End While
                con.Close()
                Return RWC

            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

   

#End Region

#Region " Get Role Wise Components List "

    Public Function fnGetRoleWiseComponentsList(ByVal RoleComponentID As String) As DataSet

        Dim sp As String = "spGetRoleWiseComponentsList"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@RoleComponentID", RoleComponentID)
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
