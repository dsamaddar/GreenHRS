Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data


Public Class clsOrgBranchData

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Org Branch "
    Public Function fnInsertOrgBranch(ByVal OrgBranch As clsOrgBranch) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertOrgBranch", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@OrganizationID", OrgBranch.OrganizationID)
            cmd.Parameters.AddWithValue("@BranchName", OrgBranch.BranchName)
            cmd.Parameters.AddWithValue("@BranchAddress", OrgBranch.BranchAddress)
            cmd.Parameters.AddWithValue("@EntryBy", OrgBranch.EntryBy)

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

#Region " Update Org Branch "
    Public Function fnUpdateOrgBranch(ByVal OrgBranch As clsOrgBranch) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateOrgBranch", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@BranchID", OrgBranch.BranchID)
            cmd.Parameters.AddWithValue("@OrganizationID", OrgBranch.OrganizationID)
            cmd.Parameters.AddWithValue("@BranchName", OrgBranch.BranchName)
            cmd.Parameters.AddWithValue("@BranchAddress", OrgBranch.BranchAddress)
            cmd.Parameters.AddWithValue("@EntryBy", OrgBranch.EntryBy)

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

#Region " Get Org Wise Branch Info "
    Public Function fnGetOrgWiseBranchInfo(ByVal OrganizationID As String) As DataSet
        Dim sp As String = "spGetOrgWiseBranchInfo"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@OrganizationID", OrganizationID)
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
