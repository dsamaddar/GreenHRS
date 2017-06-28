Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data


Public Class clsComponentDefinitionDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Components "

    Public Function fnInsertComponents(ByVal Components As clsComponentDefinition) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertComponents", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ComponentName", Components.ComponentName)
            cmd.Parameters.AddWithValue("@ComponentCode", Components.ComponentCode)
            cmd.Parameters.AddWithValue("@CompValue", Components.CompValue)
            cmd.Parameters.AddWithValue("@CompValDependentOn", Components.CompValDependentOn)
            cmd.Parameters.AddWithValue("@CompRatio", Components.CompRatio)
            cmd.Parameters.AddWithValue("@Consolidated", Components.Consolidated)
            cmd.Parameters.AddWithValue("@IsGrossComponent", Components.IsGrossComponent)
            cmd.Parameters.AddWithValue("@IsTaxable", Components.IsTaxable)
            cmd.Parameters.AddWithValue("@IsMonthlyComponent", Components.IsMonthlyComponent)
            cmd.Parameters.AddWithValue("@TaxExemptionLimit", Components.TaxExemptionLimit)
            cmd.Parameters.AddWithValue("@CompState", Components.CompState)
            cmd.Parameters.AddWithValue("@AccountCode", Components.AccountCode)
            cmd.Parameters.AddWithValue("@EntryBy", Components.EntryBy)

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

#Region " Update Components "

    Public Function fnUpdateComponents(ByVal Components As clsComponentDefinition) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateComponents", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ComponentID", Components.ComponentID)
            cmd.Parameters.AddWithValue("@ComponentName", Components.ComponentName)
            cmd.Parameters.AddWithValue("@ComponentCode", Components.ComponentCode)
            cmd.Parameters.AddWithValue("@CompValue", Components.CompValue)
            cmd.Parameters.AddWithValue("@CompValDependentOn", Components.CompValDependentOn)
            cmd.Parameters.AddWithValue("@CompRatio", Components.CompRatio)
            cmd.Parameters.AddWithValue("@Consolidated", Components.Consolidated)
            cmd.Parameters.AddWithValue("@IsGrossComponent", Components.IsGrossComponent)
            cmd.Parameters.AddWithValue("@IsTaxable", Components.IsTaxable)
            cmd.Parameters.AddWithValue("@IsMonthlyComponent", Components.IsMonthlyComponent)
            cmd.Parameters.AddWithValue("@TaxExemptionLimit", Components.TaxExemptionLimit)
            cmd.Parameters.AddWithValue("@CompState", Components.CompState)
            cmd.Parameters.AddWithValue("@AccountCode", Components.AccountCode)
            cmd.Parameters.AddWithValue("@EntryBy", Components.EntryBy)

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

#Region " Show Components "

    Public Function fnShowComponents() As DataSet

        Dim sp As String = "spShowComponents"
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

#Region " Show Component List "

    Public Function fnShowComponentList() As DataSet

        Dim sp As String = "spShowComponentList"
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

#Region " Get Comp Wise Emp sList "

    Public Function fnGetCompWiseEmpList(ByVal ComponentID As String) As DataSet

        Dim sp As String = "spGetCompWiseEmpList"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("ComponentID", ComponentID)
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

#Region " Get Reset Needed Comp List "

    Public Function fnGetResetNeededCompList() As DataSet

        Dim sp As String = "spGetResetNeededCompList"
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

    Public Function fnGetComponentDescription(ByVal ComponentID As String) As clsComponentDefinition
        Dim Comp As New clsComponentDefinition()
        Dim sp As String = "spGetComponentDescription"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@ComponentID", ComponentID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    Comp.ComponentID = dr.Item("ComponentID")
                    Comp.ComponentName = dr.Item("ComponentName")
                    Comp.CompValDependentOn = dr.Item("CompValDependentOn")
                    Comp.CompRatio = dr.Item("CompRatio")
                    Comp.Consolidated = dr.Item("Consolidated")
                    Comp.CompState = dr.Item("CompState")
                End While
                con.Close()
                Return Comp
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

End Class
