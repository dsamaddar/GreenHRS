Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsInterviewPanelDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Interview Panel "
    Public Function fnInsertInterviewPanel(ByVal IntPanelInfo As clsInterviewPanel) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertInterviewPanel", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@IntTeamID", IntPanelInfo.IntTeamID)
            cmd.Parameters.AddWithValue("@IntMemberTypeID", IntPanelInfo.IntMemberTypeID)
            cmd.Parameters.AddWithValue("@IntPanelMemberID", IntPanelInfo.IntPanelMemberID)
            cmd.Parameters.AddWithValue("@EntryBy", IntPanelInfo.EntryBy)
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

#Region " Get Int Panel wise MemberInfo "

    Public Function fnGetIntPanelwiseMemberInfo(ByVal IntPanelInfo As clsInterviewPanel) As DataSet

        Dim sp As String = "spGetIntPanelwiseMemberInfo"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@IntTeamID", IntPanelInfo.IntTeamID)
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

#Region " Authenticate Interview Attendee "
    Public Function fnAuthenticateIntAttendee(ByVal EmployeeID As String, ByVal UserID As String, ByVal Password As String) As Integer
        Try
            Dim Authenticated As Integer = 0
            Dim cmd As SqlCommand = New SqlCommand("spAuthenticateIntAttendee", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
            cmd.Parameters.AddWithValue("@UserID", UserID)
            cmd.Parameters.AddWithValue("@Password", Password)
            Dim dr As SqlDataReader = cmd.ExecuteReader()
            While dr.Read()
                Authenticated = dr.Item("Authenticated")
            End While
            con.Close()
            Return Authenticated
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return 0
        End Try
    End Function
#End Region

#Region " Get Emp Already Exists In Team  "

    Public Function fnGetEmpAlreadyExistsInTeam(ByVal IntPanelInfo As clsInterviewPanel) As Integer
        Dim sp As String = "spGetEmpAlreadyExistsInTeam"
        Dim dr As SqlDataReader
        Dim Exists As Integer = 0
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@IntTeamID", IntPanelInfo.IntTeamID)
                cmd.Parameters.AddWithValue("@EmployeeID", IntPanelInfo.IntPanelMemberID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    Exists = dr.Item("Exists")
                End While
                con.Close()

                Return Exists
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return 0
        End Try
    End Function

#End Region


End Class
