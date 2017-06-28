Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsOrganizationInfoDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Organizations "
    Public Function fnInsertOrganizations(ByVal OrgInfo As clsOrganizationInfo) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertOrganizations", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@OrgName", OrgInfo.OrgName)
            cmd.Parameters.AddWithValue("@OrgProfile", OrgInfo.OrgProfile)
            cmd.Parameters.AddWithValue("@Country", OrgInfo.Country)
            cmd.Parameters.AddWithValue("@Address", OrgInfo.Address)
            cmd.Parameters.AddWithValue("@Telephone", OrgInfo.Telephone)
            cmd.Parameters.AddWithValue("@Fax", OrgInfo.Fax)
            cmd.Parameters.AddWithValue("@Mobile", OrgInfo.Mobile)
            cmd.Parameters.AddWithValue("@EntryBy", OrgInfo.EntryBy)

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

#Region " Update Organizations "
    Public Function fnUpdateOrgranizationInfo(ByVal OrgInfo As clsOrganizationInfo) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateOrgranizationInfo", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@OrganizationID", OrgInfo.OrganizationID)
            cmd.Parameters.AddWithValue("@OrgName", OrgInfo.OrgName)
            cmd.Parameters.AddWithValue("@OrgProfile", OrgInfo.OrgProfile)
            cmd.Parameters.AddWithValue("@Country", OrgInfo.Country)
            cmd.Parameters.AddWithValue("@Address", OrgInfo.Address)
            cmd.Parameters.AddWithValue("@Telephone", OrgInfo.Telephone)
            cmd.Parameters.AddWithValue("@Fax", OrgInfo.Fax)
            cmd.Parameters.AddWithValue("@Mobile", OrgInfo.Mobile)

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

#Region " Get Org Info "

    Public Function fnShowOrgInfo() As DataSet

        Dim sp As String = "spShowOrgInfo"
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

#Region " Show Org List "

    Public Function fnShowOrgList() As DataSet

        Dim sp As String = "spShowOrgList"
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

End Class
