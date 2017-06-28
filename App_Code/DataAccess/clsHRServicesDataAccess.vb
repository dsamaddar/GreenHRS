Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsHRServicesDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

    Public Function fnInsertHRServices(ByVal HRService As clsHRServices) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertHRServices", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@HRService", HRService.HRService)
            cmd.Parameters.AddWithValue("@HRServiceReqInstruction", HRService.HRServiceReqInstruction)
            cmd.Parameters.AddWithValue("@IsActive", HRService.IsActive)
            cmd.Parameters.AddWithValue("@SeqPriority", HRService.SeqPriority)
            cmd.Parameters.AddWithValue("@EntryBy", HRService.EntryBy)
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

    Public Function fnUpdateHRServices(ByVal HRService As clsHRServices) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateHRServices", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@HRServiceID", HRService.HRServiceID)
            cmd.Parameters.AddWithValue("@HRService", HRService.HRService)
            cmd.Parameters.AddWithValue("@HRServiceReqInstruction", HRService.HRServiceReqInstruction)
            cmd.Parameters.AddWithValue("@IsActive", HRService.IsActive)
            cmd.Parameters.AddWithValue("@SeqPriority", HRService.SeqPriority)
            cmd.Parameters.AddWithValue("@EntryBy", HRService.EntryBy)
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

    Public Function fnGetHRServiceList() As DataSet

        Dim sp As String = "spGetHRServiceList"
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

    Public Function fnGetHRServiceInstruction(ByVal HRService As clsHRServices) As clsHRServices
        Dim sp As String = "spGetHRServiceInstruction"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@HRServiceID", HRService.HRServiceID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    HRService.HRServiceReqInstruction = dr.Item("HRServiceReqInstruction")
                End While
                con.Close()

                Return HRService
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

    Public Function fnGetActiveHRServices() As DataSet

        Dim sp As String = "spGetActiveHRServices"
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



End Class
