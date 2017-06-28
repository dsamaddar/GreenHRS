Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data


Public Class clsMedOfficerDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)


    Public Function fnInsertMedicalOfficer(ByVal MedOfficer As clsMedicalOfficer) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertMedicalOfficer", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@MedOfficerName", MedOfficer.MedOfficerName)
            cmd.Parameters.AddWithValue("@Organization", MedOfficer.Organization)
            cmd.Parameters.AddWithValue("@Branch", MedOfficer.Branch)
            cmd.Parameters.AddWithValue("@Designation", MedOfficer.Designation)
            cmd.Parameters.AddWithValue("@Address_HouseNo", MedOfficer.Address_HouseNo)
            cmd.Parameters.AddWithValue("@Address_Road", MedOfficer.Address_Road)
            cmd.Parameters.AddWithValue("@Address_Telephone", MedOfficer.Address_Telephone)
            cmd.Parameters.AddWithValue("@Address_Mobile", MedOfficer.Address_Mobile)
            cmd.Parameters.AddWithValue("@IsActive", MedOfficer.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", MedOfficer.EntryBy)
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

    Public Function fnUpdateMedicalOfficer(ByVal MedOfficer As clsMedicalOfficer) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateMedicalOfficer", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@MedOffID", MedOfficer.MedOffID)
            cmd.Parameters.AddWithValue("@MedOfficerName", MedOfficer.MedOfficerName)
            cmd.Parameters.AddWithValue("@Organization", MedOfficer.Organization)
            cmd.Parameters.AddWithValue("@Branch", MedOfficer.Branch)
            cmd.Parameters.AddWithValue("@Designation", MedOfficer.Designation)
            cmd.Parameters.AddWithValue("@Address_HouseNo", MedOfficer.Address_HouseNo)
            cmd.Parameters.AddWithValue("@Address_Road", MedOfficer.Address_Road)
            cmd.Parameters.AddWithValue("@Address_Telephone", MedOfficer.Address_Telephone)
            cmd.Parameters.AddWithValue("@Address_Mobile", MedOfficer.Address_Mobile)
            cmd.Parameters.AddWithValue("@IsActive", MedOfficer.IsActive)
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

    Public Function fnShowAllMedicalOfficer() As DataSet
        Dim sp As String = "spShowAllMedicalOfficer"
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

    Public Function fnShowActiveMedicalOffList() As DataSet
        Dim sp As String = "spShowActiveMedicalOffList"
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
