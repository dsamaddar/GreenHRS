Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsEmpBasicProfileDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)


    Public Function fnUpdateBasicInfo(ByVal BasicInfo As EmpBasicInfo) As String
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateEmpBasProfileInfo", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", BasicInfo.EmployeeID)
            cmd.Parameters.AddWithValue("@Name", BasicInfo.Name)
            cmd.Parameters.AddWithValue("@JoiningDate", BasicInfo.JoiningDate)
            cmd.Parameters.AddWithValue("@ConfirmationDate", BasicInfo.ConfirmationDate)
            cmd.Parameters.AddWithValue("@OfficialDesignation", BasicInfo.OfficialDesignation)
            cmd.Parameters.AddWithValue("@FunctionalDesignation", BasicInfo.FunctionalDesignation)
            cmd.Parameters.AddWithValue("@CurrentSupervisor", BasicInfo.CurrentSupervisor)
            cmd.Parameters.AddWithValue("@DateOfBirth", BasicInfo.DateOfBirth)
            cmd.Parameters.AddWithValue("@Gender", BasicInfo.Gender)
            cmd.Parameters.AddWithValue("@Nationality", BasicInfo.Nationality)
            cmd.Parameters.AddWithValue("@BloodGroupID", BasicInfo.BloodGroupID)
            cmd.Parameters.AddWithValue("@NIDNo", BasicInfo.NIDNo)
            cmd.Parameters.AddWithValue("@Religion", BasicInfo.Religion)
            cmd.Parameters.AddWithValue("@FatherName", BasicInfo.FatherName)
            cmd.Parameters.AddWithValue("@FathersOccupation", BasicInfo.FathersOccupation)
            cmd.Parameters.AddWithValue("@MotherName", BasicInfo.MotherName)
            cmd.Parameters.AddWithValue("@MothersOccupation", BasicInfo.MothersOccupation)
            cmd.Parameters.AddWithValue("@SpouseName", BasicInfo.SpouseName)
            cmd.Parameters.AddWithValue("@SpouseOccupation", BasicInfo.SpouseOccupation)
            cmd.Parameters.AddWithValue("@RelationshipStatus", BasicInfo.RelationshipStatus)
            cmd.Parameters.AddWithValue("@MobileNumber", BasicInfo.MobileNumber)
            cmd.Parameters.AddWithValue("@OfficePhone", BasicInfo.OfficePhone)
            cmd.Parameters.AddWithValue("@OfficeExtension", BasicInfo.OfficeExtension)
            cmd.Parameters.AddWithValue("@EmmergencyConPerName", BasicInfo.EmmergencyConPerName)
            cmd.Parameters.AddWithValue("@EmmerConPerPhone", BasicInfo.EmmerConPerPhone)
            cmd.Parameters.AddWithValue("@RelWithImmerConPer", BasicInfo.RelWithImmerConPer)
            cmd.Parameters.AddWithValue("@PresentAddress", BasicInfo.PresentAddress)
            cmd.Parameters.AddWithValue("@PreDistrict", BasicInfo.PreDistrict)
            cmd.Parameters.AddWithValue("@PreThana", BasicInfo.PreThana)
            cmd.Parameters.AddWithValue("@PermanentAddress", BasicInfo.PermanentAddress)
            cmd.Parameters.AddWithValue("@PerDistrict", BasicInfo.PerDistrict)
            cmd.Parameters.AddWithValue("@PerThana", BasicInfo.PerThana)
            cmd.Parameters.AddWithValue("@Photo", BasicInfo.Attachment)
            cmd.Parameters.AddWithValue("@Signature", BasicInfo.Signature)
            cmd.Parameters.AddWithValue("@ActualBirthDate", BasicInfo.ActualBirthDate)
            cmd.Parameters.AddWithValue("@ActualBirthMonth", BasicInfo.ActualBirthMonth)
            cmd.Parameters.AddWithValue("@EmployeeTypeName", BasicInfo.EmployeeTypeName)
            cmd.Parameters.AddWithValue("@ULCBranchName", BasicInfo.ULCBranchName)
            cmd.Parameters.AddWithValue("@DepartmentName", BasicInfo.DepartmentName)
            cmd.Parameters.AddWithValue("@EMail", BasicInfo.EMail)
            cmd.Parameters.AddWithValue("@AltEMail", BasicInfo.AltEMail)
            cmd.Parameters.AddWithValue("@BankID", BasicInfo.BankID)
            cmd.Parameters.AddWithValue("@BranchID", BasicInfo.BranchID)
            cmd.Parameters.AddWithValue("@BankAccountNo", BasicInfo.BankAccountNo)
            cmd.Parameters.AddWithValue("@InsuranceNo", BasicInfo.InsuranceNo)
            cmd.Parameters.AddWithValue("@ApproverID", BasicInfo.ApproverID)
            cmd.Parameters.AddWithValue("@RecommenderID", BasicInfo.RecommenderID)
            cmd.Parameters.AddWithValue("@PrimaryEvaluator", BasicInfo.PrimaryEvaluator)
            cmd.Parameters.AddWithValue("@SecondaryEvaluator", BasicInfo.SecondaryEvaluator)
            cmd.Parameters.AddWithValue("@HealthPlanID", BasicInfo.HealthPlanID)
            cmd.Parameters.AddWithValue("@TinNo", BasicInfo.TinNo)
            cmd.Parameters.AddWithValue("@PassportNo", BasicInfo.PassportNo)
            cmd.Parameters.AddWithValue("@DrivingLicenseNo", BasicInfo.DrivingLicenseNo)
            cmd.Parameters.AddWithValue("@EntryBy", BasicInfo.EntryBy)
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

    Public Function fnGetRelationShipStatus() As DataSet

        Dim sp As String = "spGetRelationShipStatus"
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

    Public Function fnGetBloodGroup() As DataSet

        Dim sp As String = "spGetBloodGroup"
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

    Public Function getDistrictName() As DataSet

        Dim sp As String = "spGetPreDistrictName"
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

    Public Function getUpazillaName(ByVal DistrictID As Integer) As DataSet

        Dim sp As String = "spGetUpazillaName"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@DistrictID", DistrictID)
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

    Public Function fnGetEmployeeBasicProfileInfo(ByVal EmployeeID As String) As EmpBasicInfo
        Dim BasicInfo As New EmpBasicInfo()
        Dim sp As String = "spGetEmployeeBasicProfileInfo"
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
                    BasicInfo.FathersOccupation = dr.Item("FathersOccupation")
                    BasicInfo.MotherName = dr.Item("MothersName")
                    BasicInfo.MothersOccupation = dr.Item("MothersOccupation")
                    BasicInfo.SpouseName = dr.Item("SpouseName")
                    BasicInfo.SpouseOccupation = dr.Item("SpouseOccupation")
                    BasicInfo.RelationshipStatus = dr.Item("RelationshipStatus")
                    BasicInfo.MobileNumber = dr.Item("MobileNo")
                    BasicInfo.OfficePhone = dr.Item("OfficePhone")
                    BasicInfo.OfficeExtension = dr.Item("OfficeExtension")
                    BasicInfo.EmmergencyConPerName = dr.Item("EmmergencyConPerName")
                    BasicInfo.EmmerConPerPhone = dr.Item("EmmerConPerPhone")
                    BasicInfo.RelWithImmerConPer = dr.Item("RelWithEmmerConPer")
                    BasicInfo.PresentAddress = dr.Item("PresentAddress")
                    BasicInfo.PreDistrict = dr.Item("PreDistrict")
                    BasicInfo.PreThana = dr.Item("PreThana")
                    BasicInfo.PermanentAddress = dr.Item("PermanentAddress")
                    BasicInfo.PerDistrict = dr.Item("PerDistrict")
                    BasicInfo.PerThana = dr.Item("PerThana")
                    BasicInfo.Gender = dr.Item("Gender")
                    BasicInfo.NIDNo = dr.Item("NIDNo")
                    BasicInfo.Nationality = dr.Item("Nationality")
                    BasicInfo.Religion = dr.Item("Religion")
                    BasicInfo.BloodGroupID = dr.Item("BloodGroupID")
                    BasicInfo.DateOfBirth = dr.Item("DateOfBirth")
                    BasicInfo.JoiningDate = dr.Item("JoiningDate")
                    BasicInfo.ConfirmationDate = dr.Item("ConfirmationDate")
                    BasicInfo.OfficialDesignation = dr.Item("OfficialDesignationID")
                    BasicInfo.FunctionalDesignation = dr.Item("FunctionalDesignationID")
                    BasicInfo.CurrentSupervisor = dr.Item("CurrentSupervisor")
                    BasicInfo.Attachment = dr.Item("photos")
                    BasicInfo.Signature = dr.Item("Signature")
                    BasicInfo.ActualBirthDate = dr.Item("ActualBirthDay")
                    BasicInfo.ActualBirthMonth = dr.Item("ActualBirthMonth")
                    BasicInfo.ULCBranchName = dr.Item("ULCBranchID")
                    BasicInfo.DepartmentName = dr.Item("DepartmentID")
                    BasicInfo.EmployeeTypeName = dr.Item("EmpTypeID")
                    BasicInfo.EMail = dr.Item("Email")
                    BasicInfo.AltEMail = dr.Item("AlternateEmail")
                    BasicInfo.BankID = dr.Item("BankID")
                    BasicInfo.BranchID = dr.Item("BranchID")
                    BasicInfo.BankAccountNo = dr.Item("BankAccountNo")
                    BasicInfo.HealthPlanID = dr.Item("HealthPlanID")
                    BasicInfo.InsuranceNo = dr.Item("InsuranceNo")
                    BasicInfo.TinNo = dr.Item("TinNo")
                    BasicInfo.PassportNo = dr.Item("PassportNo")
                    BasicInfo.DrivingLicenseNo = dr.Item("DrivingLicenseNo")
                    BasicInfo.ApproverID = dr.Item("LeaveApprover")
                    BasicInfo.RecommenderID = dr.Item("LeaveRecommender")
                    BasicInfo.PrimaryEvaluator = dr.Item("PrimaryEvaluator")
                    BasicInfo.SecondaryEvaluator = dr.Item("SecondaryEvaluator")

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

    Public Function fnGetBasicProfile(ByVal EmployeeID As String) As EmpBasicInfo
        Dim BasicInfo As New EmpBasicInfo()
        Dim sp As String = "spGetBasicInfoProfile"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    BasicInfo.Name = dr.Item("Name")
                    BasicInfo.EmpCode = dr.Item("EmpCode")
                    BasicInfo.OfficialDesignation = dr.Item("OfficialDesignation")
                    BasicInfo.FunctionalDesignation = dr.Item("FunctionalDesignation")
                    BasicInfo.DepartmentName = dr.Item("DepartmentName")
                    BasicInfo.CurrentSupervisor = dr.Item("CurrentSupervisor")
                    BasicInfo.EmployeeTypeName = dr.Item("EmployeeTypeName")
                    BasicInfo.ServiceLength = dr.Item("ServiceLength")
                    BasicInfo.ULCBranchName = dr.Item("ULCBranchName")
                    BasicInfo.Attachment = dr.Item("Photos")
                    BasicInfo.CandidateID = dr.Item("CandidateID")

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

    Public Function EmployeeCount(ByVal EmployeeID As String) As Integer

        Dim cmd As New SqlCommand()
        Dim rd As SqlDataReader
        Dim Count As Integer
        Try
            con.Open()
            cmd.Connection = con

            cmd.CommandText = "Select Count(1) from tblEmployeeBasicInfo where EmployeeID='" & EmployeeID & "'"
            rd = cmd.ExecuteReader()
            Count = 0
            While (rd.Read())
                Count = rd.GetValue(0)
            End While
            con.Close()
            Return Count
        Catch ex As SqlException
            con.Close()
            Return Nothing
        End Try
    End Function

    Public Sub fnGetEmpNameCode(ByVal EmployeeID As String, ByRef EmployeeName As String, ByRef EmployeeCode As String)
        Dim sp As String = "spGetEmpNameID"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    EmployeeName = dr.Item("EmployeeName")
                    EmployeeCode = dr.Item("EmpCode")
                End While
                con.Close()
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
        End Try
    End Sub

    Public Function EmpCountForImage(ByVal EmployeeID As String) As Integer
        Dim cmd As New SqlCommand()
        Dim rd As SqlDataReader
        Dim Count As Integer
        Try
            con.Open()
            cmd.Connection = con

            cmd.CommandText = "Select Count(1) from tblEmployeeBasicInfo where Photos<>'' and EmployeeID= '" & EmployeeID & "'"
            rd = cmd.ExecuteReader()
            Count = 0
            While (rd.Read())
                Count = rd.GetValue(0)
            End While
            con.Close()
            Return Count
        Catch ex As SqlException
            con.Close()
            Return Nothing
        End Try
    End Function



    Public Function fnGetDesigForPromotion(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spGetDesigForPromotion"
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

    Public Function fnGetOfficialDesignation() As DataSet

        Dim sp As String = "spGetOfficialDesignation"
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

    Public Function fnGratuityCalculation(ByVal AsOnDate As DateTime) As DataSet

        Dim sp As String = "spGratuityCalculation"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@AsOnDate", AsOnDate)
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
