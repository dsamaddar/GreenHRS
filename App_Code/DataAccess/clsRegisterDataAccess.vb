Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data


Public Class clsRegisterDataAccess
    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Registration Info "
    Public Function fnInsertRegistrationInfo(ByVal Register As clsRegister) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertRegistrationInfo", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@UserName", Register.UserName)
            cmd.Parameters.AddWithValue("@UserID", Register.UserID)
            cmd.Parameters.AddWithValue("@Password", Register.Password)
            cmd.Parameters.AddWithValue("@Email", Register.Email)
            cmd.Parameters.AddWithValue("@DateOfBirth", Register.DateOfBirth)
            cmd.Parameters.AddWithValue("@MobileNumber", Register.MobileNumber)
            cmd.Parameters.AddWithValue("@ValidationCode", Register.ValidationCode)
            cmd.Parameters.AddWithValue("@NationalID", Register.NationalID)

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

#Region " Chk Duplicate UserID  "

    Public Function fnChkDuplicateUserID(ByVal UserID As String) As Integer
        Dim sp As String = "spChkDuplicateUserID"
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

#End Region

#Region " Chk Duplicate NID  "

    Public Function fnChkDuplicateNID(ByVal NID As String) As Integer
        Dim sp As String = "spChkDuplicateNID"
        Dim dr As SqlDataReader
        Dim AlreadyExistsNID As Integer = 0
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@NID", NID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    AlreadyExistsNID = dr.Item("AlreadyExistsNID")
                End While
                con.Close()
                Return AlreadyExistsNID
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return 0
        End Try
    End Function

#End Region

#Region " Get Registered User List "

    Public Function fnGetRegisteredUserList() As DataSet

        Dim sp As String = "spGetRegisteredUserList"
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

#Region " Get User List By Type "

    Public Function fnGetUserListByType(ByVal UserType As String) As DataSet

        Dim sp As String = "spGetUserListByType"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@UserType", UserType)
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

#Region " Get Emp User List By Dept "

    Public Function fnGetEmpUserListByDept(ByVal OrgSrchStr As clsSearchOrgStructure) As DataSet

        Dim sp As String = "spGetEmpUserListByDept"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@DepartmentID", OrgSrchStr.DepartmentID)
                cmd.Parameters.AddWithValue("@DesignationID", OrgSrchStr.DesignationID)
                cmd.Parameters.AddWithValue("@BloodGroupID", OrgSrchStr.BloodGroupID)
                cmd.Parameters.AddWithValue("@ULCBranchID", OrgSrchStr.ULCBranchID)
                cmd.Parameters.AddWithValue("@Gender", OrgSrchStr.Gender)
                cmd.Parameters.AddWithValue("@PerDistrict", OrgSrchStr.PerDistrict)
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
