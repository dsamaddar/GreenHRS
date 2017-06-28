Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsEmployeeBasicInfoDataAccess
    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

    Public Function fnInsertBasicInfo(ByVal EmployeeID As String, ByVal BasicInfo As EmpBasicInfo, ByVal AttachmentFileName As String, ByVal DocFileNameSign As String, ByVal UserDocuments As String, ByVal UserID As String) As String
        Dim CandidateID As String
        Dim rd As SqlDataReader
        CandidateID = ""
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertEmployeeBasicInfo", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
            cmd.Parameters.AddWithValue("@Name", BasicInfo.Name)
            cmd.Parameters.AddWithValue("@FatherName", BasicInfo.FatherName)
            cmd.Parameters.AddWithValue("@FathersOccupation", BasicInfo.FathersOccupation)
            cmd.Parameters.AddWithValue("@MotherName", BasicInfo.MotherName)
            cmd.Parameters.AddWithValue("@MothersOccupation", BasicInfo.MothersOccupation)
            cmd.Parameters.AddWithValue("@SpouseName", BasicInfo.SpouseName)
            cmd.Parameters.AddWithValue("@SpouseOccupation", BasicInfo.SpouseOccupation)
            cmd.Parameters.AddWithValue("@NoOfChildrenAge", BasicInfo.NoOfChildrenAge)
            cmd.Parameters.AddWithValue("@SibblingsNameOccupation", BasicInfo.SibblingsNameOccupation)
            cmd.Parameters.AddWithValue("@Gender", BasicInfo.Gender)
            cmd.Parameters.AddWithValue("@NIDNo", BasicInfo.NIDNo)
            cmd.Parameters.AddWithValue("@Nationality", BasicInfo.Nationality)
            cmd.Parameters.AddWithValue("@Religion", BasicInfo.Religion)
            cmd.Parameters.AddWithValue("@PresentAddress", BasicInfo.PresentAddress)
            cmd.Parameters.AddWithValue("@PreDistrict", BasicInfo.PreDistrict)
            cmd.Parameters.AddWithValue("@PreThana", BasicInfo.PreThana)
            cmd.Parameters.AddWithValue("@PermanentAddress", BasicInfo.PermanentAddress)
            cmd.Parameters.AddWithValue("@PerDistrict", BasicInfo.PerDistrict)
            cmd.Parameters.AddWithValue("@PerThana", BasicInfo.PerThana)
            cmd.Parameters.AddWithValue("@MobileNumber", BasicInfo.MobileNumber)
            cmd.Parameters.AddWithValue("@EMail", BasicInfo.EMail)
            cmd.Parameters.AddWithValue("@AltEMail", BasicInfo.AltEMail)
            cmd.Parameters.AddWithValue("@AttachmentFileName", AttachmentFileName)
            cmd.Parameters.AddWithValue("@DocFileNameSign", DocFileNameSign)
            cmd.Parameters.AddWithValue("@RelationshipStatus", BasicInfo.RelationshipStatus)
            cmd.Parameters.AddWithValue("@BloodGroupID", BasicInfo.BloodGroupID)
            cmd.Parameters.AddWithValue("@UserDocuments", UserDocuments)
            cmd.Parameters.AddWithValue("@UserID", UserID)






            'cmd.ExecuteNonQuery()
            rd = cmd.ExecuteReader()
            rd.Read()
            CandidateID = rd.GetValue(0)
            con.Close()
            'Return CandidateID
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            'Return "0"
        End Try
        Return CandidateID
    End Function



    Public Function fnGetEmployeeBasicInformation(ByVal EmployeeID As String) As CanBasicInfo
        Dim BasicInfo As New CanBasicInfo()
        Dim sp As String = "spGetEmployeeBasicInfo"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    BasicInfo.Name = dr.Item("Name")
                    BasicInfo.FatherName = dr.Item("FathersName")
                    BasicInfo.MotherName = dr.Item("MothersName")
                    BasicInfo.SpouseName = dr.Item("SpouseName")
                    BasicInfo.Gender = dr.Item("Gender")
                    BasicInfo.NIDNo = dr.Item("NIDNo")
                    BasicInfo.Nationality = dr.Item("Nationality")
                    BasicInfo.Religion = dr.Item("Religion")
                    BasicInfo.PresentAddress = dr.Item("PresentAddress")
                    BasicInfo.PreDistrict = dr.Item("PreDistrict")
                    BasicInfo.PreThana = dr.Item("PreThana")
                    BasicInfo.PermanentAddress = dr.Item("PermanentAddress")
                    BasicInfo.PerDistrict = dr.Item("PerDistrict")
                    BasicInfo.PerThana = dr.Item("PerThana")
                    BasicInfo.MobileNumber = dr.Item("MobileNo")
                    BasicInfo.EMail = dr.Item("Email")
                    BasicInfo.AltEMail = dr.Item("AlternateEmail")
                    BasicInfo.Attachment = dr.Item("photos")
                    BasicInfo.FathersOccupation = dr.Item("FathersOccupation")
                    BasicInfo.MothersOccupation = dr.Item("MothersOccupation")
                    BasicInfo.SpouseOccupation = dr.Item("SpouseOccupation")
                    BasicInfo.NoOfChildrenAge = dr.Item("NoOfChildrenAge")
                    BasicInfo.[SibblingsNameOccupation] = dr.Item("SibblingsNameOccupation")
                    BasicInfo.Signature = dr.Item("Signature")
                    BasicInfo.RelationshipStatus = dr.Item("RelationshipStatus")
                    BasicInfo.BloodGroupID = dr.Item("BloodGroupID")
                End While
                con.Close()

                Return BasicInfo
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

    Public Function fnGetEmployeeAllDetails(ByVal EmployeeID As String) As EmpBasicInfo
        Dim BasicInfo As New EmpBasicInfo()
        Dim sp As String = "prGetEmployeeAllInformation"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    BasicInfo.Name = dr.Item("Name")
                    BasicInfo.FatherName = dr.Item("FathersName")
                    BasicInfo.MotherName = dr.Item("MothersName")
                    BasicInfo.SpouseName = dr.Item("SpouseName")
                    BasicInfo.Gender = dr.Item("Gender")
                    BasicInfo.NIDNo = dr.Item("NIDNo")
                    BasicInfo.Nationality = dr.Item("Nationality")
                    BasicInfo.Religion = dr.Item("Religion")
                    BasicInfo.PresentAddress = dr.Item("PresentAddress")
                    BasicInfo.PreDistrict = dr.Item("PreDistrict")
                    BasicInfo.PreThana = dr.Item("PreThana")
                    BasicInfo.PermanentAddress = dr.Item("PermanentAddress")
                    BasicInfo.PerDistrict = dr.Item("PerDistrict")
                    BasicInfo.PerThana = dr.Item("PerThana")
                    BasicInfo.MobileNumber = dr.Item("MobileNo")
                    BasicInfo.AltEMail = dr.Item("AlternateEmail")
                    BasicInfo.Attachment = dr.Item("photos")
                    BasicInfo.FathersOccupation = dr.Item("FathersOccupation")
                    BasicInfo.MothersOccupation = dr.Item("MothersOccupation")
                    BasicInfo.SpouseOccupation = dr.Item("SpouseOccupation")
                    BasicInfo.NoOfChildrenAge = dr.Item("NoOfChildrenAge")
                    BasicInfo.[SibblingsNameOccupation] = dr.Item("SibblingsNameOccupation")
                    BasicInfo.Signature = dr.Item("Signature")
                    BasicInfo.RelationshipStatus = dr.Item("RelationshipStatus")
                    BasicInfo.BloodGroupID = dr.Item("BloodGroupName")
                End While
                con.Close()

                Return BasicInfo
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

    Public Function GetRegisteredInfo(ByVal EmployeeID As String, ByRef EmpCode As String) As Integer
        Dim sp As String = "spGetEmpCode"
        Dim dr As SqlDataReader
        ' Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    EmpCode = dr.Item("EmpCode")
                End While
                con.Close()
                Return 1
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
                Return Nothing
            End If
        End Try
        Return 1
    End Function
End Class
