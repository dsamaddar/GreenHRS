Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsJobCircularDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Job Circular "
    Public Function fnInsertJobCircular(ByVal JobCircularInfo As clsJobCircular) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertJobCircular", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
          
            cmd.Parameters.AddWithValue("@JobTitle", JobCircularInfo.JobTitle)
            cmd.Parameters.AddWithValue("@CircularCode", JobCircularInfo.CircularCode)
            cmd.Parameters.AddWithValue("@JobLocation", JobCircularInfo.JobLocation)
            cmd.Parameters.AddWithValue("@OrganizationID", JobCircularInfo.OrganizationID)
            cmd.Parameters.AddWithValue("@DepartmentID", JobCircularInfo.DepartmentID)
            cmd.Parameters.AddWithValue("@JobDescription", JobCircularInfo.JobDescription)
            cmd.Parameters.AddWithValue("@JobResponsibility", JobCircularInfo.JobResponsibility)
            cmd.Parameters.AddWithValue("@SpecialSkillReq", JobCircularInfo.SpecialSkillReq)
            cmd.Parameters.AddWithValue("@AddiJobReq", JobCircularInfo.AddiJobReq)
            cmd.Parameters.AddWithValue("@EducationalReq", JobCircularInfo.EducationalReq)
            cmd.Parameters.AddWithValue("@ExperienceReqInYrs", JobCircularInfo.ExperienceReqInYrs)
            cmd.Parameters.AddWithValue("@DutySchedule", JobCircularInfo.DutySchedule)
            cmd.Parameters.AddWithValue("@SalaryAndBenefits", JobCircularInfo.SalaryAndBenefits)
            cmd.Parameters.AddWithValue("@Vacancies", JobCircularInfo.Vacancies)
            cmd.Parameters.AddWithValue("@Competencies", JobCircularInfo.Competencies)
            cmd.Parameters.AddWithValue("@CommunicationSkill", JobCircularInfo.CommunicationSkill)
            cmd.Parameters.AddWithValue("@MinAgeLimit", JobCircularInfo.MinAgeLimit)
            cmd.Parameters.AddWithValue("@MaxAgeLimit", JobCircularInfo.MaxAgeLimit)
            cmd.Parameters.AddWithValue("@ReportableTo", JobCircularInfo.ReportableTo)
            cmd.Parameters.AddWithValue("@ApplyInstructions", JobCircularInfo.ApplyInstructions)
            cmd.Parameters.AddWithValue("@CompanyAddress", JobCircularInfo.CompanyAddress)
            cmd.Parameters.AddWithValue("@TermsOfReferences", JobCircularInfo.TermsOfReferences)
            cmd.Parameters.AddWithValue("@ClosingDate", JobCircularInfo.ClosingDate)
            cmd.Parameters.AddWithValue("@HeaderNote", JobCircularInfo.HeaderNote)
            cmd.Parameters.AddWithValue("@FooterNote", JobCircularInfo.FooterNote)
            cmd.Parameters.AddWithValue("@MaxApplicant", JobCircularInfo.MaxApplicant)
            cmd.Parameters.AddWithValue("@HeaderImage", JobCircularInfo.HeaderImage)
            cmd.Parameters.AddWithValue("@MiddleImage", JobCircularInfo.MiddleImage)
            cmd.Parameters.AddWithValue("@FooterImage", JobCircularInfo.FooterImage)
            cmd.Parameters.AddWithValue("@Attachment", JobCircularInfo.Attachment)
            cmd.Parameters.AddWithValue("@EntryBy", JobCircularInfo.EntryBy)

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

#Region "Applied Job"
    Public Function ApplyJobInsert(ByVal CircularID As String, ByVal CandidateID As String, ByVal EntryBy As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertJobApply", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure

            cmd.Parameters.AddWithValue("@CircularID", CircularID)
            cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
            cmd.Parameters.AddWithValue("@EntryBy", EntryBy)

            cmd.ExecuteNonQuery()
            con.Close()
            Return 1
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close 
            End If
            Return 0
        End Try
    End Function
#End Region

#Region "CountApplyJob"

    Public Shared Function CandidateAppliedJobCount(ByVal CircularID As String, ByVal CandidateID As String) As Integer

        Dim cmd As New SqlCommand()
        Dim rd As SqlDataReader
        Dim rtn As Integer
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
        Try
            cn.Open()
            cmd.Connection = cn

            cmd.CommandText = "Select count(1) from tblAppliedJob where CircularID='" & CircularID & "' and CandidateID='" & CandidateID & "'"
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

#End Region

#Region "Get Available Jobs"
    Public Function fnGeAvailableJobs() As DataSet

        Dim sp As String = "spGetAvailableJob"
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

#Region "Job Details"
    Public Function GetApplicationExpenseRequestDetail(ByVal CircularID As String, ByRef JobTitle As String, ByRef CircularCode As String, ByRef DutySchedule As String, ByRef JobLocation As String, ByRef SalaryBenefits As String, ByRef Organization As String, ByRef Vacancies As String, ByRef Department As String, ByRef Competencies As String, ByRef JobDescription As String, ByRef CommunicationSkill As String, ByRef JobResponsibility As String, ByRef MinAgeLimit As String, ByRef SpecialSkillsRequired As String, ByRef AdditionalJobRequirement As String, ByRef MaxAgeLimit As String, ByRef ReportableTo As String, ByRef EducationalsRequirement As String, ByRef HowToApply As String, ByRef ExperienceRequired As String, ByRef CompanyAddress As String, ByRef ClosingDate As String, ByRef TermsOfReferences As String, ByRef MaximumApplicant As String, ByRef HeaderImage As String, ByRef footerImage As String, ByRef MiddleImage As String, ByRef HeaderNote As String, ByRef FooterNote As String, ByRef Attachment As String) As clsJobCircular
        Dim JobCircular As New clsJobCircular()
        Dim sp As String = "spGetJobDetails"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CircularID", CircularID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    JobTitle = dr.Item("JobTitle")
                    CircularCode = dr.Item("CircularCode")
                    JobLocation = dr.Item("JobLocation")
                    Organization = dr.Item("Organization")
                    Department = dr.Item("Department")
                    JobDescription = dr.Item("JobDescription")
                    JobResponsibility = dr.Item("JobResponsibility")
                    SpecialSkillsRequired = dr.Item("SpecialSkillReq")
                    AdditionalJobRequirement = dr.Item("AddiJobReq")
                    EducationalsRequirement = dr.Item("EducationalReq")
                    ExperienceRequired = dr.Item("ExperienceReqInYrs")
                    DutySchedule = dr.Item("DutySchedule")
                    SalaryBenefits = dr.Item("SalaryAndBenefits")
                    Vacancies = dr.Item("Vacancies")
                    Competencies = dr.Item("Competencies")
                    CommunicationSkill = dr.Item("CommunicationSkill")
                    MinAgeLimit = dr.Item("MinAgeLimit")
                    MaxAgeLimit = dr.Item("MaxAgeLimit")
                    ReportableTo = dr.Item("ReportableTo")
                    HowToApply = dr.Item("ApplyInstructions")
                    CompanyAddress = dr.Item("CompanyAddress")
                    TermsOfReferences = dr.Item("TermsOfReferences")
                    ClosingDate = dr.Item("ClosingDate")
                    HeaderNote = dr.Item("HeaderNote")
                    FooterNote = dr.Item("FooterNote")
                    MaximumApplicant = dr.Item("MaxApplicant")
                    HeaderImage = dr.Item("HeaderImage")
                    MiddleImage = dr.Item("MiddleImage")
                    footerImage = dr.Item("FooterImage")
                    Attachment = dr.Item("Attachment")
                End While
                con.Close()

                Return JobCircular
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function
    'Public Shared Sub GetApplicationExpenseRequestDetail(ByVal CircularID As String, ByRef JobTitle As String, ByRef CircularCode As String, ByRef DutySchedule As String, ByRef JobLocation As String, ByRef SalaryBenefits As String, ByRef Organization As String, ByRef Vacancies As String, ByRef Department As String, ByRef Competencies As String, ByRef JobDescription As String, ByRef CommunicationSkill As String, ByRef JobResponsibility As String, ByRef MinAgeLimit As String, ByRef SpecialSkillsRequired As String, ByRef AdditionalJobRequirement As String, ByRef MaxAgeLimit As String, ByRef ReportableTo As String, ByRef EducationalsRequirement As String, ByRef HowToApply As String, ByRef ExperienceRequired As String, ByRef CompanyAddress As String, ByRef ClosingDate As String, ByRef TermsOfReferences As String, ByRef MaximumApplicant As String, ByRef HeaderImage As String, ByRef footerImage As String, ByRef MiddleImage As String, ByRef HeaderNote As String, ByRef FooterNote As String, ByRef Attachment As String)
    '    Dim cmd As New SqlCommand()
    '    Dim rd As SqlDataReader
    '    Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

    '    Try
    '        cn.Open()
    '        cmd.Connection = cn
    '        cmd.CommandText = "exec spGetJobDetails '" & CircularID & "'"
    '        rd = cmd.ExecuteReader()

    '        rd.Read()
    '        'ApplicationType = rd.GetValue(0)
    '        JobTitle = rd.GetValue(0)
    '        CircularCode = rd.GetValue(29)
    '        JobLocation = rd.GetValue(1)
    '        Organization = rd.GetValue(30)
    '        Department = rd.GetValue(31)
    '        JobDescription = rd.GetValue(4)
    '        JobResponsibility = rd.GetValue(5)
    '        SpecialSkillsRequired = rd.GetValue(6)
    '        AdditionalJobRequirement = rd.GetValue(7)
    '        EducationalsRequirement = rd.GetValue(8)
    '        ExperienceRequired = rd.GetValue(9)
    '        DutySchedule = rd.GetValue(10)
    '        SalaryBenefits = rd.GetValue(11)
    '        Vacancies = rd.GetValue(12)
    '        Competencies = rd.GetValue(13)
    '        CommunicationSkill = rd.GetValue(14)
    '        MinAgeLimit = rd.GetValue(15)
    '        MaxAgeLimit = rd.GetValue(16)
    '        ReportableTo = rd.GetValue(17)
    '        HowToApply = rd.GetValue(18)
    '        CompanyAddress = rd.GetValue(19)
    '        TermsOfReferences = rd.GetValue(20)
    '        ClosingDate = rd.GetValue(21)
    '        HeaderNote = rd.GetValue(22)
    '        FooterNote = rd.GetValue(23)
    '        MaximumApplicant = rd.GetValue(24)
    '        HeaderImage = rd.GetValue(25)
    '        MiddleImage = rd.GetValue(26)
    '        footerImage = rd.GetValue(27)
    '        Attachment = rd.GetValue(28)
    '        cn.Close()
    '    Catch ex As SqlException
    '        cn.Close()
    '        'ApplicationId = ""
    '    End Try
    'End Sub
    Public Function fnGetJobCircularDetailsView(ByRef CircularID As String) As clsJobCircular
        Dim JobCircular As New clsJobCircular()
        Dim sp As String = "spGetJobDetails"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CircularID", CircularID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    JobCircular.JobTitle = dr.Item("JobTitle")
                    JobCircular.JobLocation = dr.Item("JobLocation")
                    JobCircular.OrganizationID = dr.Item("Organization")
                    JobCircular.DepartmentID = dr.Item("Department")
                    JobCircular.JobDescription = dr.Item("JobDescription")
                    JobCircular.JobResponsibility = dr.Item("JobResponsibility")
                    JobCircular.SpecialSkillReq = dr.Item("SpecialSkillReq")
                    JobCircular.AddiJobReq = dr.Item("AddiJobReq")
                    JobCircular.EducationalReq = dr.Item("EducationalReq")
                    JobCircular.ExperienceReqInYrs = dr.Item("ExperienceReqInYrs")
                    JobCircular.DutySchedule = dr.Item("DutySchedule")
                    JobCircular.SalaryAndBenefits = dr.Item("SalaryAndBenefits")
                    JobCircular.Vacancies = dr.Item("Vacancies")
                    JobCircular.Competencies = dr.Item("Competencies")
                    JobCircular.CommunicationSkill = dr.Item("CommunicationSkill")
                    JobCircular.MinAgeLimit = dr.Item("MinAgeLimit")
                    JobCircular.MaxAgeLimit = dr.Item("MaxAgeLimit")
                    JobCircular.ReportableTo = dr.Item("ReportableTo")
                    JobCircular.ApplyInstructions = dr.Item("ApplyInstructions")
                    JobCircular.CompanyAddress = dr.Item("CompanyAddress")
                    JobCircular.TermsOfReferences = dr.Item("TermsOfReferences")
                    JobCircular.ClosingDate = dr.Item("ClosingDate")
                    JobCircular.HeaderNote = dr.Item("HeaderNote")
                    JobCircular.FooterNote = dr.Item("FooterNote")
                    JobCircular.MaxApplicant = dr.Item("MaxApplicant")
                    JobCircular.HeaderImage = dr.Item("HeaderImage")
                    JobCircular.MiddleImage = dr.Item("MiddleImage")
                    JobCircular.FooterImage = dr.Item("FooterImage")
                    JobCircular.Attachment = dr.Item("Attachment")
                End While
                con.Close()

                Return JobCircular
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function
#End Region

#Region " Get All Job List "

    Public Function fnGetJobList() As DataSet

        Dim sp As String = "spGetJobList"
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

#Region "Update Job Circular"
    Public Function fnUpdateJobCircular(ByVal CircularID As String, ByVal JobCircularInfo As clsJobCircular) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateJobCircular", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure

            cmd.Parameters.AddWithValue("@CircularID", CircularID)
            cmd.Parameters.AddWithValue("@JobTitle", JobCircularInfo.JobTitle)
            cmd.Parameters.AddWithValue("@CircularCode", JobCircularInfo.CircularCode)
            cmd.Parameters.AddWithValue("@JobLocation", JobCircularInfo.JobLocation)
            cmd.Parameters.AddWithValue("@OrganizationID", JobCircularInfo.OrganizationID)
            cmd.Parameters.AddWithValue("@DepartmentID", JobCircularInfo.DepartmentID)
            cmd.Parameters.AddWithValue("@JobDescription", JobCircularInfo.JobDescription)
            cmd.Parameters.AddWithValue("@JobResponsibility", JobCircularInfo.JobResponsibility)
            cmd.Parameters.AddWithValue("@SpecialSkillReq", JobCircularInfo.SpecialSkillReq)
            cmd.Parameters.AddWithValue("@AddiJobReq", JobCircularInfo.AddiJobReq)
            cmd.Parameters.AddWithValue("@EducationalReq", JobCircularInfo.EducationalReq)
            cmd.Parameters.AddWithValue("@ExperienceReqInYrs", JobCircularInfo.ExperienceReqInYrs)
            cmd.Parameters.AddWithValue("@DutySchedule", JobCircularInfo.DutySchedule)
            cmd.Parameters.AddWithValue("@SalaryAndBenefits", JobCircularInfo.SalaryAndBenefits)
            cmd.Parameters.AddWithValue("@Vacancies", JobCircularInfo.Vacancies)
            cmd.Parameters.AddWithValue("@Competencies", JobCircularInfo.Competencies)
            cmd.Parameters.AddWithValue("@CommunicationSkill", JobCircularInfo.CommunicationSkill)
            cmd.Parameters.AddWithValue("@MinAgeLimit", JobCircularInfo.MinAgeLimit)
            cmd.Parameters.AddWithValue("@MaxAgeLimit", JobCircularInfo.MaxAgeLimit)
            cmd.Parameters.AddWithValue("@ReportableTo", JobCircularInfo.ReportableTo)
            cmd.Parameters.AddWithValue("@ApplyInstructions", JobCircularInfo.ApplyInstructions)
            cmd.Parameters.AddWithValue("@CompanyAddress", JobCircularInfo.CompanyAddress)
            cmd.Parameters.AddWithValue("@TermsOfReferences", JobCircularInfo.TermsOfReferences)
            cmd.Parameters.AddWithValue("@ClosingDate", JobCircularInfo.ClosingDate)
            cmd.Parameters.AddWithValue("@HeaderNote", JobCircularInfo.HeaderNote)
            cmd.Parameters.AddWithValue("@FooterNote", JobCircularInfo.FooterNote)
            cmd.Parameters.AddWithValue("@MaxApplicant", JobCircularInfo.MaxApplicant)
            cmd.Parameters.AddWithValue("@HeaderImage", JobCircularInfo.HeaderImage)
            cmd.Parameters.AddWithValue("@MiddleImage", JobCircularInfo.MiddleImage)
            cmd.Parameters.AddWithValue("@FooterImage", JobCircularInfo.FooterImage)
            cmd.Parameters.AddWithValue("@Attachment", JobCircularInfo.Attachment)

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

#Region " Get Job Circular List "

    Public Function fnGetJobCircularList() As DataSet

        Dim sp As String = "spGetJobCircularList"
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

#Region " All Summary Of Job Circular "

    Public Function fnAllSummaryOfJobCircular() As DataSet

        Dim sp As String = "spAllSummaryOfJobCircular"
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

#Region " Summary Of Job Circular  "

    Public Function fnSummaryOfJobCircular(ByVal CircularID As String) As clsSummaryJobCircular
        Dim JobCircularSummary As New clsSummaryJobCircular()
        Dim sp As String = "spSummaryOfJobCircular"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CircularID", CircularID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    JobCircularSummary.TotalApplicant = dr.Item("TotalApplicant")
                    JobCircularSummary.TotalRecruitment = dr.Item("TotalRecruitment")
                    JobCircularSummary.TotalExamTaker = dr.Item("TotalExamTaker")
                    JobCircularSummary.TotalRejectedCV = dr.Item("TotalRejectedCV")
                    JobCircularSummary.RemainingCV = dr.Item("RemainingCV")
                    JobCircularSummary.TotalInterviewTaken = dr.Item("TotalInterviewTaken")
                End While
                con.Close()

                Return JobCircularSummary
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
