Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class EmplIDGenerationDataAccess
    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)


    Public Sub fnGetEmpCode(ByRef EmpCode As String, ByVal EmpType As String)
        Dim sp As String = "spGetLastEmpCode"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmpType", EmpType)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    EmpCode = dr.Item("EmpCode")
                End While
                con.Close()
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
        End Try
    End Sub

    Public Function fnInsertIDGeneration(ByVal EmpCode As String, ByVal EntryBy As String, ByVal UserID As String, ByVal Password As String, ByVal EmpType As String, ByVal PermissionToOwnProfile As String, ByVal PermissionToOtherProfile As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertEmpIDGeneration", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmpCode", EmpCode)
            cmd.Parameters.AddWithValue("@UserID", UserID)
            cmd.Parameters.AddWithValue("@Password", Password)
            cmd.Parameters.AddWithValue("@EntryBy", EntryBy)
            cmd.Parameters.AddWithValue("@EmpType", EmpType)
            cmd.Parameters.AddWithValue("@PermissionToOwnProfile", PermissionToOwnProfile)
            cmd.Parameters.AddWithValue("@PermissionToOtherProfile", PermissionToOtherProfile)

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

    Public Sub CheckDuplicacyEmpCode(ByVal NewEmpCode As String, ByRef Message As String)
        Dim sp As String = "sPCheckDuplicacyEmpCode"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@NewEmpCode", NewEmpCode)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    Message = dr.Item("msg")
                End While
                con.Close()
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
        End Try
    End Sub

    Public Function fnGetEmployeeDetailInfo() As DataSet

        Dim sp As String = "spGetEmpInfoForBasicEdit"
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

    Public Function fnChkDuplicateUserIDForEmp(ByVal UserID As String) As Integer
        Dim sp As String = "spChkDuplicateUserIDForEmployee"
        Dim dr As SqlDataReader
        Dim AlreadyExistsUserID As Integer = 0
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@UserID", UserID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    AlreadyExistsUserID = dr.Item("AlreadyExistsUserID")
                End While
                con.Close()

                Return AlreadyExistsUserID
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return 0
        End Try
    End Function
End Class
