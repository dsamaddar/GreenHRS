Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsEmpRelativesDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

    Public Function fnInsertEmpRelatives(ByVal EmpRelative As clsRelatives) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertEmpRelatives", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", EmpRelative.EmployeeID)
            cmd.Parameters.AddWithValue("@RelationTypeID", EmpRelative.RelationTypeID)
            cmd.Parameters.AddWithValue("@NameOfRelative", EmpRelative.NameOfRelative)
            cmd.Parameters.AddWithValue("@DateOfBirth", EmpRelative.DateOfBirth)
            cmd.Parameters.AddWithValue("@Gender", EmpRelative.Gender)
            cmd.Parameters.AddWithValue("@RelAddress", EmpRelative.RelAddress)
            cmd.Parameters.AddWithValue("@FamilyInsuranceNo", EmpRelative.FamilyInsuranceNo)
            cmd.Parameters.AddWithValue("@ContactNumber", EmpRelative.ContactNumber)
            cmd.Parameters.AddWithValue("@Details", EmpRelative.Details)
            cmd.Parameters.AddWithValue("@EntryBy", EmpRelative.EntryBy)
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

    Public Function fnUpdateEmpRelatives(ByVal EmpRelative As clsRelatives) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateEmpRelatives", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@RelativeID", EmpRelative.RelativeID)
            cmd.Parameters.AddWithValue("@EmployeeID", EmpRelative.EmployeeID)
            cmd.Parameters.AddWithValue("@RelationTypeID", EmpRelative.RelationTypeID)
            cmd.Parameters.AddWithValue("@NameOfRelative", EmpRelative.NameOfRelative)
            cmd.Parameters.AddWithValue("@DateOfBirth", EmpRelative.DateOfBirth)
            cmd.Parameters.AddWithValue("@Gender", EmpRelative.Gender)
            cmd.Parameters.AddWithValue("@RelAddress", EmpRelative.RelAddress)
            cmd.Parameters.AddWithValue("@FamilyInsuranceNo", EmpRelative.FamilyInsuranceNo)
            cmd.Parameters.AddWithValue("@ContactNumber", EmpRelative.ContactNumber)
            cmd.Parameters.AddWithValue("@Details", EmpRelative.Details)
            cmd.Parameters.AddWithValue("@EntryBy", EmpRelative.EntryBy)
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

    Public Function fnShowEmpRelatives(ByVal EmployeeID As String) As DataSet
        Dim sp As String = "spShowEmpRelatives"
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


    Public Sub fnGetEmpInsuranceNo(ByRef EmployeeID As String, ByRef BaseInsuranceNo As String)
        Dim sp As String = "spGeEmpInsuranceNo"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    BaseInsuranceNo = dr.Item("InsuranceNo")
                End While
                con.Close()
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
        End Try
    End Sub

End Class
