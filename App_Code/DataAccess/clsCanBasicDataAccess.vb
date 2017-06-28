Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsCanBasicDataAccess
    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region "Insert Basic Info"
    Public Function fnInsertBasicInfo(ByVal RegistrationID As String, ByVal UserID As String, ByVal BasicInfo As CanBasicInfo, ByVal AttachmentFileName As String, ByVal DocFileNameSign As String, ByVal DocumentInformation As String, ByVal SpecilizedInformation As String) As String
        Dim CandidateID As String
        Dim rd As SqlDataReader
        CandidateID = ""
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertCandidateBasicInfo", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@RegistrationID", RegistrationID)
            cmd.Parameters.AddWithValue("@UserID", UserID)
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
            cmd.Parameters.AddWithValue("@PassportNo", BasicInfo.PassportNo)
            cmd.Parameters.AddWithValue("@Nationality", BasicInfo.Nationality)
            cmd.Parameters.AddWithValue("@Religion", BasicInfo.Religion)
            cmd.Parameters.AddWithValue("@PresentAddress", BasicInfo.PresentAddress)
            cmd.Parameters.AddWithValue("@PreDistrict", BasicInfo.PreDistrict)
            cmd.Parameters.AddWithValue("@PreThana", BasicInfo.PreThana)
            cmd.Parameters.AddWithValue("@PermanentAddress", BasicInfo.PermanentAddress)
            cmd.Parameters.AddWithValue("@PerDistrict", BasicInfo.PerDistrict)
            cmd.Parameters.AddWithValue("@PerThana", BasicInfo.PerThana)
            cmd.Parameters.AddWithValue("@ComputerLiteracy", BasicInfo.ComputerLiteracy)
            cmd.Parameters.AddWithValue("@HomePhoneNo", BasicInfo.HomePhoneNo)
            cmd.Parameters.AddWithValue("@MobileNumber", BasicInfo.MobileNumber)
            cmd.Parameters.AddWithValue("@OfficePhoneNo", BasicInfo.OfficePhoneNo)
            'cmd.Parameters.AddWithValue("@EMail", BasicInfo.EMail)
            cmd.Parameters.AddWithValue("@AltEMail", BasicInfo.AltEMail)
            cmd.Parameters.AddWithValue("@CareerObjective", BasicInfo.CareerObjective)
            cmd.Parameters.AddWithValue("@PreferredJobLocation", BasicInfo.PreferredJobLocation)
            cmd.Parameters.AddWithValue("@LookingFor", BasicInfo.LookingFor)
            cmd.Parameters.AddWithValue("@AvailableFor", BasicInfo.AvailableFor)
            'cmd.Parameters.AddWithValue("@UserID", BasicInfo.UserID)
            'cmd.Parameters.AddWithValue("@Password", BasicInfo.Password)
            cmd.Parameters.AddWithValue("@EnglishProficiency", BasicInfo.EnglishProficiency)
            cmd.Parameters.AddWithValue("@YearOfExperience", BasicInfo.YearOfExperience)
            cmd.Parameters.AddWithValue("@ExpInMonth", BasicInfo.ExpInMonth)
            cmd.Parameters.AddWithValue("@PresentSalary", BasicInfo.PresentSalary)
            cmd.Parameters.AddWithValue("@LastDrawnDate", BasicInfo.LastDrawnDate)
            cmd.Parameters.AddWithValue("@Employeer", BasicInfo.Employeer)
            cmd.Parameters.AddWithValue("@ExpectedSalary", BasicInfo.ExpectedSalary)
            cmd.Parameters.AddWithValue("@AttachmentFileName", AttachmentFileName)
            cmd.Parameters.AddWithValue("@DocFileNameSign", DocFileNameSign)
            cmd.Parameters.AddWithValue("@RelationshipStatus", BasicInfo.RelationshipStatus)
            cmd.Parameters.AddWithValue("@BloodGroupID", BasicInfo.BloodGroupID)
            cmd.Parameters.AddWithValue("@AboutYourself", BasicInfo.AboutYourself)
            cmd.Parameters.AddWithValue("@SpecilizedIn", BasicInfo.SpecilizedIn)
            cmd.Parameters.AddWithValue("@DocumentInformation", DocumentInformation)
            cmd.Parameters.AddWithValue("@SpecilizedInformation", SpecilizedInformation)



            'cmd.ExecuteNonQuery()
            rd = cmd.ExecuteReader()
            While rd.Read()
                CandidateID = rd.GetValue(0)
            End While
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
#End Region

    Public Function fnUpdateBasicInfo(ByVal CandidateID As String, ByVal CandidateName As String, ByVal UserID As String, ByVal BasicInfo As CanBasicInfo, ByVal AttachmentFileName As String, ByVal DocFileNameSign As String, ByVal DocumentInformation As String, ByVal SpecilizedInformation As String) As String
        'Dim rd As SqlDataReader
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateCandidateBasicInfo", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("CandidateID", CandidateID)
            cmd.Parameters.AddWithValue("@UserID", UserID)
            cmd.Parameters.AddWithValue("@CandidateName", CandidateName)
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
            cmd.Parameters.AddWithValue("@PassportNo", BasicInfo.PassportNo)
            cmd.Parameters.AddWithValue("@Nationality", BasicInfo.Nationality)
            cmd.Parameters.AddWithValue("@Religion", BasicInfo.Religion)
            cmd.Parameters.AddWithValue("@PresentAddress", BasicInfo.PresentAddress)
            cmd.Parameters.AddWithValue("@PreDistrict", BasicInfo.PreDistrict)
            cmd.Parameters.AddWithValue("@PreThana", BasicInfo.PreThana)
            cmd.Parameters.AddWithValue("@PermanentAddress", BasicInfo.PermanentAddress)
            cmd.Parameters.AddWithValue("@PerDistrict", BasicInfo.PerDistrict)
            cmd.Parameters.AddWithValue("@PerThana", BasicInfo.PerThana)
            cmd.Parameters.AddWithValue("@ComputerLiteracy", BasicInfo.ComputerLiteracy)
            cmd.Parameters.AddWithValue("@HomePhoneNo", BasicInfo.HomePhoneNo)
            cmd.Parameters.AddWithValue("@MobileNumber", BasicInfo.MobileNumber)
            cmd.Parameters.AddWithValue("@OfficePhoneNo", BasicInfo.OfficePhoneNo)
            cmd.Parameters.AddWithValue("@AltEMail", BasicInfo.AltEMail)
            cmd.Parameters.AddWithValue("@CareerObjective", BasicInfo.CareerObjective)
            cmd.Parameters.AddWithValue("@PreferredJobLocation", BasicInfo.PreferredJobLocation)
            cmd.Parameters.AddWithValue("@LookingFor", BasicInfo.LookingFor)
            cmd.Parameters.AddWithValue("@AvailableFor", BasicInfo.AvailableFor)
            cmd.Parameters.AddWithValue("@EnglishProficiency", BasicInfo.EnglishProficiency)
            cmd.Parameters.AddWithValue("@YearOfExperience", BasicInfo.YearOfExperience)
            cmd.Parameters.AddWithValue("@ExpInMonth", BasicInfo.ExpInMonth)
            cmd.Parameters.AddWithValue("@PresentSalary", BasicInfo.PresentSalary)
            cmd.Parameters.AddWithValue("@LastDrawnDate", BasicInfo.LastDrawnDate)
            cmd.Parameters.AddWithValue("@Employeer", BasicInfo.Employeer)
            cmd.Parameters.AddWithValue("@ExpectedSalary", BasicInfo.ExpectedSalary)
            cmd.Parameters.AddWithValue("@AttachmentFileName", AttachmentFileName)
            cmd.Parameters.AddWithValue("@DocFileNameSign", DocFileNameSign)
            cmd.Parameters.AddWithValue("@RelationshipStatus", BasicInfo.RelationshipStatus)
            cmd.Parameters.AddWithValue("@BloodGroupID", BasicInfo.BloodGroupID)
            cmd.Parameters.AddWithValue("@AboutYourself", BasicInfo.AboutYourself)
            cmd.Parameters.AddWithValue("@SpecilizedIn", BasicInfo.SpecilizedIn)
            cmd.Parameters.AddWithValue("@DocumentInformation", DocumentInformation)
            cmd.Parameters.AddWithValue("@SpecilizedInformation", SpecilizedInformation)



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

    Public Function fnGetCandidateBasicInformation(ByVal RegistrationID As String) As CanBasicInfo
        Dim BasicInfo As New CanBasicInfo()
        Dim sp As String = "prGetCandidateBasicInfo"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@RegistrationID", RegistrationID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    BasicInfo.Name = dr.Item("UserName")
                    BasicInfo.FatherName = dr.Item("FathersName")
                    BasicInfo.MotherName = dr.Item("MothersName")
                    BasicInfo.SpouseName = dr.Item("SpouseName")
                    BasicInfo.Gender = dr.Item("Gender")
                    BasicInfo.NIDNo = dr.Item("NIDNo")
                    BasicInfo.PassportNo = dr.Item("PassportNo")
                    BasicInfo.Nationality = dr.Item("Nationality")
                    BasicInfo.Religion = dr.Item("Religion")
                    BasicInfo.PresentAddress = dr.Item("PresentAddress")
                    BasicInfo.PreDistrict = dr.Item("PreDistrict")
                    BasicInfo.PreThana = dr.Item("PreThana")
                    BasicInfo.PermanentAddress = dr.Item("PermanentAddress")
                    BasicInfo.PerDistrict = dr.Item("PerDistrict")
                    BasicInfo.PerThana = dr.Item("PerThana")
                    BasicInfo.HomePhoneNo = dr.Item("HomePhoneNo")
                    BasicInfo.MobileNumber = dr.Item("PersonalPhoneNo")
                    BasicInfo.OfficePhoneNo = dr.Item("OfficePhoneNo")
                    BasicInfo.AltEMail = dr.Item("AlternateEmail")
                    BasicInfo.CareerObjective = dr.Item("CareerObjective")
                    BasicInfo.YearOfExperience = dr.Item("YearOfExperience")
                    BasicInfo.ExpInMonth = dr.Item("ExpInMonth")
                    BasicInfo.PresentSalary = dr.Item("PresentSalary")
                    BasicInfo.ExpectedSalary = dr.Item("ExpectedSalary")
                    BasicInfo.LookingFor = dr.Item("LookingFor")
                    BasicInfo.AvailableFor = dr.Item("AvailableFor")
                    BasicInfo.ComputerLiteracy = dr.Item("ComputerLiteracy")
                    BasicInfo.EnglishProficiency = dr.Item("EnglishLanguageProficiency")
                    BasicInfo.Attachment = dr.Item("photos")
                    BasicInfo.FathersOccupation = dr.Item("FathersOccupation")
                    BasicInfo.MothersOccupation = dr.Item("MothersOccupation")
                    BasicInfo.SpouseOccupation = dr.Item("SpouseOccupation")
                    BasicInfo.NoOfChildrenAge = dr.Item("NoOfChildrenAge")
                    BasicInfo.[SibblingsNameOccupation] = dr.Item("SibblingsNameOccupation")
                    BasicInfo.LastDrawnDate = dr.Item("LastDrawnDate")
                    BasicInfo.Employeer = dr.Item("Employeer")
                    BasicInfo.PreferredJobLocation = dr.Item("PreferredJobLocation")
                    BasicInfo.Signature = dr.Item("Signature")
                    BasicInfo.RelationshipStatus = dr.Item("RelationshipStatus")
                    BasicInfo.BloodGroupID = dr.Item("BloodGroupID")
                    BasicInfo.AboutYourself = dr.Item("AboutYourself")
                    BasicInfo.SpecilizedIn = dr.Item("SpecilizedIn")
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

    Public Function fnGetCandidateDetailsView(ByRef CircularID As String, ByVal CandidateID As String) As CanBasicInfo
        Dim BasicInfo As New CanBasicInfo()
        Dim sp As String = "spGetCandidateDetailsView"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CircularID", CircularID)
                cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    BasicInfo.Name = dr.Item("UserName")
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
                    BasicInfo.HomePhoneNo = dr.Item("HomePhoneNo")
                    BasicInfo.OfficePhoneNo = dr.Item("OfficePhoneNo")
                    BasicInfo.AltEMail = dr.Item("AlternateEmail")
                    BasicInfo.CareerObjective = dr.Item("CareerObjective")
                    BasicInfo.YearOfExperience = dr.Item("YearOfExperience")
                    BasicInfo.PresentSalary = dr.Item("PresentSalary")
                    BasicInfo.ExpectedSalary = dr.Item("ExpectedSalary")
                    BasicInfo.LookingFor = dr.Item("LookingFor")
                    BasicInfo.AvailableFor = dr.Item("AvailableFor")
                    BasicInfo.ComputerLiteracy = dr.Item("ComputerLiteracy")
                    BasicInfo.EnglishProficiency = dr.Item("EnglishLanguageProficiency")
                    BasicInfo.Attachment = dr.Item("photos")
                    BasicInfo.FathersOccupation = dr.Item("FathersOccupation")
                    BasicInfo.MothersOccupation = dr.Item("MothersOccupation")
                    BasicInfo.SpouseOccupation = dr.Item("SpouseOccupation")
                    BasicInfo.NoOfChildrenAge = dr.Item("NoOfChildrenAge")
                    BasicInfo.[SibblingsNameOccupation] = dr.Item("SibblingsNameOccupation")
                    BasicInfo.LastDrawnDate = dr.Item("LastDrawnDate")
                    BasicInfo.Employeer = dr.Item("Employeer")
                    'BasicInfo.PreferredJobLocation = dr.Item("PreferredJobLocation")
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

    Public Function fnGetCandidateDetailsViewForRecuitment(ByVal CandidateID As String) As CanBasicInfo
        Dim BasicInfo As New CanBasicInfo()
        Dim sp As String = "spGetCandidateDetailsViewForRecuitment"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    BasicInfo.Name = dr.Item("CandidateName")
                    BasicInfo.DateOfBirth = dr.Item("DateOfBirth")
                    BasicInfo.FatherName = dr.Item("FathersName")
                    BasicInfo.MotherName = dr.Item("MothersName")
                    BasicInfo.SpouseName = dr.Item("SpouseName")
                    BasicInfo.Gender = dr.Item("Gender")
                    BasicInfo.NIDNo = dr.Item("NIDNo")
                    BasicInfo.PassportNo = dr.Item("PassportNo")
                    BasicInfo.Nationality = dr.Item("Nationality")
                    BasicInfo.Religion = dr.Item("Religion")
                    BasicInfo.PresentAddress = dr.Item("PresentAddress")
                    BasicInfo.PreDistrict = dr.Item("PreDistrict")
                    BasicInfo.PreThana = dr.Item("PreThana")
                    BasicInfo.PermanentAddress = dr.Item("PermanentAddress")
                    BasicInfo.PerDistrict = dr.Item("PerDistrict")
                    BasicInfo.PerThana = dr.Item("PerThana")
                    BasicInfo.HomePhoneNo = dr.Item("HomePhoneNo")
                    BasicInfo.MobileNumber = dr.Item("PersonalPhoneNo")
                    BasicInfo.OfficePhoneNo = dr.Item("OfficePhoneNo")
                    BasicInfo.AltEMail = dr.Item("AlternateEmail")
                    BasicInfo.CareerObjective = dr.Item("CareerObjective")
                    BasicInfo.YearOfExperience = dr.Item("YearOfExperience")
                    BasicInfo.ExpInMonth = dr.Item("ExpInMonth")
                    BasicInfo.PresentSalary = dr.Item("PresentSalary")
                    BasicInfo.ExpectedSalary = dr.Item("ExpectedSalary")
                    BasicInfo.LookingFor = dr.Item("LookingFor")
                    BasicInfo.AvailableFor = dr.Item("AvailableFor")
                    BasicInfo.ComputerLiteracy = dr.Item("ComputerLiteracy")
                    BasicInfo.EnglishProficiency = dr.Item("EnglishLanguageProficiency")
                    BasicInfo.Attachment = dr.Item("photos")
                    BasicInfo.FathersOccupation = dr.Item("FathersOccupation")
                    BasicInfo.MothersOccupation = dr.Item("MothersOccupation")
                    BasicInfo.SpouseOccupation = dr.Item("SpouseOccupation")
                    BasicInfo.NoOfChildrenAge = dr.Item("NoOfChildrenAge")
                    BasicInfo.[SibblingsNameOccupation] = dr.Item("SibblingsNameOccupation")
                    BasicInfo.LastDrawnDate = dr.Item("LastDrawnDate")
                    BasicInfo.Employeer = dr.Item("Employeer")
                    'BasicInfo.PreferredJobLocation = dr.Item("PreferredJobLocation")
                    BasicInfo.Signature = dr.Item("Signature")
                    BasicInfo.RelationshipStatus = dr.Item("RelationshipStatus")
                    BasicInfo.BloodGroupID = dr.Item("BloodGroupName")
                    BasicInfo.AboutYourself = dr.Item("AboutYourself")
                    BasicInfo.SpecilizedIn = dr.Item("SpecilizedIn")
                    BasicInfo.EMail = dr.Item("EMail")
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

    Public Function fnGetGetCandidateDetails(ByVal CandidateID As String) As CanBasicInfo
        Dim BasicInfo As New CanBasicInfo()
        Dim sp As String = "prGetCandidateBasicInformation"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    BasicInfo.Name = dr.Item("CandidateName")
                    BasicInfo.FatherName = dr.Item("FathersName")
                    BasicInfo.MotherName = dr.Item("MothersName")
                    BasicInfo.SpouseName = dr.Item("SpouseName")
                    BasicInfo.Gender = dr.Item("Gender")
                    BasicInfo.NIDNo = dr.Item("NIDNo")
                    BasicInfo.PassportNo = dr.Item("PassportNo")
                    BasicInfo.Nationality = dr.Item("Nationality")
                    BasicInfo.Religion = dr.Item("Religion")
                    BasicInfo.PresentAddress = dr.Item("PresentAddress")
                    BasicInfo.PreDistrict = dr.Item("PreDistrict")
                    BasicInfo.PreThana = dr.Item("PreThana")
                    BasicInfo.PermanentAddress = dr.Item("PermanentAddress")
                    BasicInfo.PerDistrict = dr.Item("PerDistrict")
                    BasicInfo.PerThana = dr.Item("PerThana")
                    BasicInfo.HomePhoneNo = dr.Item("HomePhoneNo")
                    BasicInfo.MobileNumber = dr.Item("PersonalPhoneNo")
                    BasicInfo.OfficePhoneNo = dr.Item("OfficePhoneNo")
                    BasicInfo.AltEMail = dr.Item("AlternateEmail")
                    BasicInfo.CareerObjective = dr.Item("CareerObjective")
                    BasicInfo.YearOfExperience = dr.Item("YearOfExperience")
                    BasicInfo.ExpInMonth = dr.Item("ExpInMonth")
                    BasicInfo.PresentSalary = dr.Item("PresentSalary")
                    BasicInfo.ExpectedSalary = dr.Item("ExpectedSalary")
                    BasicInfo.LookingFor = dr.Item("LookingFor")
                    BasicInfo.AvailableFor = dr.Item("AvailableFor")
                    BasicInfo.ComputerLiteracy = dr.Item("ComputerLiteracy")
                    BasicInfo.EnglishProficiency = dr.Item("EnglishLanguageProficiency")
                    BasicInfo.Attachment = dr.Item("photos")
                    BasicInfo.FathersOccupation = dr.Item("FathersOccupation")
                    BasicInfo.MothersOccupation = dr.Item("MothersOccupation")
                    BasicInfo.SpouseOccupation = dr.Item("SpouseOccupation")
                    BasicInfo.NoOfChildrenAge = dr.Item("NoOfChildrenAge")
                    BasicInfo.[SibblingsNameOccupation] = dr.Item("SibblingsNameOccupation")
                    BasicInfo.LastDrawnDate = dr.Item("LastDrawnDate")
                    BasicInfo.Employeer = dr.Item("Employeer")
                    'BasicInfo.PreferredJobLocation = dr.Item("PreferredJobLocation")
                    BasicInfo.Signature = dr.Item("Signature")
                    BasicInfo.RelationshipStatus = dr.Item("RelationshipStatus")
                    BasicInfo.BloodGroupID = dr.Item("BloodGroupName")
                    BasicInfo.AboutYourself = dr.Item("AboutYourself")
                    BasicInfo.SpecilizedIn = dr.Item("SpecilizedIn")
                    BasicInfo.EMail = dr.Item("EMail")
                    BasicInfo.DOB = dr.Item("DateOfBirth")
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

    Public Shared Function PresentStatus(ByVal CandidateID As String) As Integer

        Dim cmd As New SqlCommand()
        Dim rd As SqlDataReader
        Dim rtn As Boolean
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
        Try
            cn.Open()
            cmd.Connection = cn

            cmd.CommandText = "Select IsSubmitted from tblCandidateBasicInfo where CandidateID='" & CandidateID & "'"
            rd = cmd.ExecuteReader()

            rtn = 0
            While (rd.Read())
                rtn = rd.GetValue(0)
            End While
            cn.Close()
            Return rtn
        Catch ex As SqlException
            cn.Close()
            Return 0
        End Try
    End Function

    Public Shared Sub GetRegisteredInfo(ByVal RegistrationID As String, ByRef MobileNo As String, ByRef NID As String)
        Dim sp As String = "spGetRegInfo"
        Dim dr As SqlDataReader
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
        Try
            cn.Open()
            Using cmd = New SqlCommand(sp, cn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@RegistrationID", RegistrationID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    MobileNo = dr.Item("MobileNumber")
                    NID = dr.Item("NationalID")
                End While
                cn.Close()
            End Using
        Catch ex As Exception
            If cn.State = ConnectionState.Open Then
                cn.Close()
            End If
        End Try
    End Sub

    Public Shared Function Submit(ByVal CandidateID As String) As Integer

        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
        Try
            Dim cmd As SqlCommand = New SqlCommand("spSubmitted", cn)
            cmd.CommandType = CommandType.StoredProcedure
            cn.Open()
            cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
            cmd.ExecuteNonQuery()
            cn.Close()
            Return 1

        Catch ex As SqlException
            cn.Close()
            Return 0
        End Try
    End Function

    Public Function fnGetOccupationList() As DataSet

        Dim sp As String = "spGetOccupationList"
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

    Public Function fnGetExpForCanDetailView(ByVal CandidateID As String) As DataSet

        Dim sp As String = "spGetExpForCanDetailView"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
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

    Public Function fnGetEduForCanDetailView(ByVal CandidateID As String) As DataSet

        Dim sp As String = "spGetEduForCanDetailView"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
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

    Public Function fnGetReferenceForCanDetailView(ByVal CandidateID As String) As DataSet

        Dim sp As String = "spGetRefForCanDetailView"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
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

#Region " Search Applicant Profile "

    Public Function fnSearchApplicantProfile(ByVal Candidate As String) As DataSet

        Dim sp As String = "spSearchApplicantProfile"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@Candidate", Candidate)
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

    Public Function fnGetSpecilizedIn() As DataSet

        Dim sp As String = "spGetSpecilizedIn"
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

    Public Function fnGetCanSpecilizedInformation(ByVal CandidateID As String) As DataSet

        Dim sp As String = "spGetCanSpecilizedInformation"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@CandidateID", SqlDbType.VarChar, 50).Value = CandidateID
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

    Public Function fnGetProCerForCanDetailView(ByVal CandidateID As String) As DataSet

        Dim sp As String = "spGetProCertiForCanDetailView"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
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

    Public Function fnGetTrainingForCanDetailView(ByVal CandidateID As String) As DataSet

        Dim sp As String = "spGetTrainingForCanDetailView"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
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

    Public Function fnGetEmailDOBofReg(ByVal RegistrationID As String) As CanBasicInfo
        Dim BasicInfo As New CanBasicInfo()
        Dim sp As String = "spGetEmailDOBofReg"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@RegistrationID", RegistrationID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    BasicInfo.EMail = dr.Item("Email")
                    BasicInfo.DOB = dr.Item("DateOfBirth")
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

End Class
