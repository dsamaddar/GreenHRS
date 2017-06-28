Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsCanEduDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

    Public Shared Function SubmitExperienceInformation(ByVal CandidateID As String, ByVal isoExperienceParts As String) As String
        'Dim rd As SqlDataReader
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

        Dim ApplicationID As String
        Try
            Dim cmd As SqlCommand = New SqlCommand("prExperienceInputAdd", cn)
            cmd.CommandType = CommandType.StoredProcedure
            cn.Open()
            cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
            cmd.Parameters.AddWithValue("@isoExperienceParts", isoExperienceParts)
            cmd.ExecuteNonQuery()
            cn.Close()
            Return 1
        Catch ex As SqlException
            cn.Close()
            ApplicationID = ""
            Return 0
        End Try

        'Return ApplicationID
    End Function

    Public Shared Function SubmitEducationInformation(ByVal CandidateID As String, ByVal isoParts As String) As String
        'Dim rd As SqlDataReader
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

        Dim ApplicationID As String
        Try
            Dim cmd As SqlCommand = New SqlCommand("prEducationInputAdd", cn)
            cmd.CommandType = CommandType.StoredProcedure
            cn.Open()
            cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
            cmd.Parameters.AddWithValue("@isoParts", isoParts)
            cmd.ExecuteNonQuery()
            cn.Close()
            Return 1
        Catch ex As SqlException
            cn.Close()
            ApplicationID = ""
            Return 0
        End Try

        'Return ApplicationID
    End Function

    Public Shared Function SubmitTrainingInformation(ByVal CandidateID As String, ByVal isoTrainingParts As String) As String
        'Dim rd As SqlDataReader
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

        Dim ApplicationID As String
        Try
            Dim cmd As SqlCommand = New SqlCommand("prTrainingInputAdd", cn)
            cmd.CommandType = CommandType.StoredProcedure
            cn.Open()
            cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
            cmd.Parameters.AddWithValue("@isoTrainingParts", isoTrainingParts)
            cmd.ExecuteNonQuery()
            cn.Close()
            Return 1
        Catch ex As SqlException
            cn.Close()
            ApplicationID = ""
            Return 0
        End Try

        'Return ApplicationID
    End Function

    Public Shared Function SubmitOtherInformation(ByVal CandidateID As String, ByVal isoProfessionalCertificationParts As String) As String
        'Dim rd As SqlDataReader
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

        Dim ApplicationID As String
        Try
            Dim cmd As SqlCommand = New SqlCommand("prCandidateOthersInputAdd", cn)
            cmd.CommandType = CommandType.StoredProcedure
            cn.Open()
            cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
            cmd.Parameters.AddWithValue("@isoProfessionalCertificationParts", isoProfessionalCertificationParts)
            cmd.ExecuteNonQuery()
            cn.Close()
            Return 1
        Catch ex As SqlException
            cn.Close()
            ApplicationID = ""
            Return 0
        End Try

        'Return ApplicationID
    End Function

    Public Shared Function SubmitRefInformation(ByVal CandidateID As String, ByVal isoReference As String) As String
        ' Dim rd As SqlDataReader
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

        Dim ApplicationID As String
        Try
            Dim cmd As SqlCommand = New SqlCommand("prCandidateReferenceInputAdd", cn)
            cmd.CommandType = CommandType.StoredProcedure
            cn.Open()
            cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
            cmd.Parameters.AddWithValue("@isoReference", isoReference)
            cmd.ExecuteNonQuery()
            cn.Close()
            Return 1
        Catch ex As SqlException
            cn.Close()
            ApplicationID = ""
            Return 0
        End Try

        'Return ApplicationID
    End Function

    Public Function fnGetEducationInformation(ByVal CandidateID As String) As DataSet

        Dim sp As String = "spGetEducationInformation"
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
    Public Function AddInstitutionName(ByVal InstitutionName As String, ByVal IsActive As Integer, ByVal EntryBy As String) As Integer

        Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertInstitutionName", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@InstitutionName", InstitutionName)
            cmd.Parameters.AddWithValue("@IsActive", IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", EntryBy)

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

    Public Function fnGetInstitutionList() As DataSet

        Dim sp As String = "spGetInstitutionList"
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

    'Public Shared Function CandidateEducationCount(ByVal UserID As String) As Integer

    '    Dim cmd As New SqlCommand()
    '    Dim rd As SqlDataReader
    '    Dim rtn As Integer
    '    Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
    '    Try
    '        cn.Open()
    '        cmd.Connection = cn

    '        cmd.CommandText = "Select count(1) from tblCandidateEducationInfo inner join tblCandidateBasicInfo on tblCandidateEducationInfo.CandidateID=tblCandidateBasicInfo.CandidateID where tblCandidateBasicInfo.UserID='" & UserID & "'"
    '        rd = cmd.ExecuteReader()

    '        rtn = 0
    '        While (rd.Read())
    '            rtn = rd.GetValue(0)
    '        End While
    '        cn.Close()
    '        Return rtn
    '    Catch ex As SqlException
    '        cn.Close()
    '        Return 0
    '    End Try
    'End Function

    'Public Shared Function CandidateExperienceCount(ByVal UserID As String) As Integer

    '    Dim cmd As New SqlCommand()
    '    Dim rd As SqlDataReader
    '    Dim rtn As Integer
    '    Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
    '    Try
    '        cn.Open()
    '        cmd.Connection = cn

    '        cmd.CommandText = "Select count(1) from tblCandidateExperienceInfo inner join tblCandidateBasicInfo on tblCandidateExperienceInfo.CandidateID=tblCandidateBasicInfo.CandidateID where tblCandidateBasicInfo.UserID='" & UserID & "'"
    '        rd = cmd.ExecuteReader()

    '        rtn = 0
    '        While (rd.Read())
    '            rtn = rd.GetValue(0)
    '        End While
    '        cn.Close()
    '        Return rtn
    '    Catch ex As SqlException
    '        cn.Close()
    '        Return 0
    '    End Try
    'End Function

    'Public Shared Function CandidateCertificationCount(ByVal UserID As String) As Integer

    '    Dim cmd As New SqlCommand()
    '    Dim rd As SqlDataReader
    '    Dim rtn As Integer
    '    Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
    '    Try
    '        cn.Open()
    '        cmd.Connection = cn

    '        cmd.CommandText = "Select count(1) from tblCandidateProfessionalCertificationInfo inner join tblCandidateBasicInfo on tblCandidateProfessionalCertificationInfo.CandidateID=tblCandidateBasicInfo.CandidateID where tblCandidateBasicInfo.UserID='" & UserID & "'"
    '        rd = cmd.ExecuteReader()

    '        rtn = 0
    '        While (rd.Read())
    '            rtn = rd.GetValue(0)
    '        End While
    '        cn.Close()
    '        Return rtn
    '    Catch ex As SqlException
    '        cn.Close()
    '        Return 0
    '    End Try
    'End Function

    'Public Shared Function CandidateReferenceCount(ByVal UserID As String) As Integer

    '    Dim cmd As New SqlCommand()
    '    Dim rd As SqlDataReader
    '    Dim rtn As Integer
    '    Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
    '    Try
    '        cn.Open()
    '        cmd.Connection = cn

    '        cmd.CommandText = "Select count(1) from tblCandidateReferenceInfo inner join tblCandidateBasicInfo on tblCandidateReferenceInfo.CandidateID=tblCandidateBasicInfo.CandidateID where tblCandidateBasicInfo.UserID='" & UserID & "'"
    '        rd = cmd.ExecuteReader()

    '        rtn = 0
    '        While (rd.Read())
    '            rtn = rd.GetValue(0)
    '        End While
    '        cn.Close()
    '        Return rtn
    '    Catch ex As SqlException
    '        cn.Close()
    '        Return 0
    '    End Try
    'End Function

    'Public Shared Function CandidateTrainingCount(ByVal UserID As String) As Integer

    '    Dim cmd As New SqlCommand()
    '    Dim rd As SqlDataReader
    '    Dim rtn As Integer
    '    Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
    '    Try
    '        cn.Open()
    '        cmd.Connection = cn

    '        cmd.CommandText = "Select count(1) from tblCandidateTrainingInfo inner join tblCandidateBasicInfo on tblCandidateTrainingInfo.CandidateID=tblCandidateBasicInfo.CandidateID where tblCandidateBasicInfo.UserID='" & UserID & "'"
    '        rd = cmd.ExecuteReader()

    '        rtn = 0
    '        While (rd.Read())
    '            rtn = rd.GetValue(0)
    '        End While
    '        cn.Close()
    '        Return rtn
    '    Catch ex As SqlException
    '        cn.Close()
    '        Return 0
    '    End Try
    'End Function

    Public Shared Function CandidateCount(ByVal RegistrationID As String) As Integer

        Dim cmd As New SqlCommand()
        Dim rd As SqlDataReader
        Dim rtn As Integer
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
        Try
            cn.Open()
            cmd.Connection = cn

            cmd.CommandText = "Select count(1) from tblCandidateBasicInfo where RegistrationID='" & RegistrationID & "'"
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

    Public Function fnGetExperienceInformation(ByVal CandidateID As String) As DataSet

        Dim sp As String = "spGetExperienceInformation"
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

    Public Function fnGetTrainingInformation(ByVal CandidateID As String) As DataSet

        Dim sp As String = "spGetTrainingInformation"
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

    Public Function fnGetProCertificationInformation(ByVal CandidateID As String) As DataSet

        Dim sp As String = "spGetProCertificationInformation"
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

    Public Function fnGetReferenceInformation(ByVal CandidateID As String) As DataSet

        Dim sp As String = "spGetReferenceInformation"
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

    Public Function CandidateFindOut(ByVal CandidateID As String, ByVal tblName As String) As Integer

        Dim cmd As New SqlCommand()
        Dim rd As SqlDataReader
        Dim rtn As Integer
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
        Try
            cn.Open()
            cmd.Connection = cn

            cmd.CommandText = "Select count(1) from " & tblName & " where CandidateID='" & CandidateID & "'"
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

    Public Function CandidateFindOutForEducation(ByVal CandidateID As String) As Integer

        Dim cmd As New SqlCommand()
        Dim rd As SqlDataReader
        Dim rtn As Integer
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
        Try
            cn.Open()
            cmd.Connection = cn

            cmd.CommandText = "Select count(1) from tblCandidateEducationInfo inner join dbo.tblExamName on dbo.tblExamName.ExamID=tblCandidateEducationInfo.ExamID where (tblExamName.ExamName<>'S.S.C (Equivalent)' and tblExamName.ExamName<>'H.S.C (Equvalent)' ) and CandidateID='" & CandidateID & "'"
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

    Public Function fnGetExamList() As DataSet

        Dim sp As String = "spGetAllExamList"
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

    Public Function fnInsertDegree(ByVal ExamInfo As clsExamInfo) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertExamName", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ExamName", ExamInfo.DegreeName)
            cmd.Parameters.AddWithValue("@Order", ExamInfo.Order)
            cmd.Parameters.AddWithValue("@IsActive", ExamInfo.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", ExamInfo.EntryBy)

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

    Public Function fnUpdateDegree(ByVal ExamInfo As clsExamInfo, ByVal ExamID As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateExamName", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ExamName", ExamInfo.DegreeName)
            cmd.Parameters.AddWithValue("@Order", ExamInfo.Order)
            cmd.Parameters.AddWithValue("@IsActive", ExamInfo.IsActive)
            cmd.Parameters.AddWithValue("@ExamID", ExamID)

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

    Public Function fnGetMajorList() As DataSet

        Dim sp As String = "spGetMajorList"
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

    Public Function fnInsertMajor(ByVal MajorName As String, ByVal IsActive As Integer, ByVal EntryBy As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertMajorType", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@MajorType", MajorName)
            cmd.Parameters.AddWithValue("@IsActive", IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", EntryBy)

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
    'Public Function fnGetInstitutionList() As DataSet

    '    Dim sp As String = "spGetInstitutionList"
    '    Dim da As SqlDataAdapter = New SqlDataAdapter()
    '    Dim ds As DataSet = New DataSet()
    '    Try
    '        con.Open()
    '        Using cmd = New SqlCommand(sp, con)
    '            cmd.CommandType = CommandType.StoredProcedure
    '            da.SelectCommand = cmd
    '            da.Fill(ds)
    '            con.Close()

    '            Return ds
    '        End Using
    '    Catch ex As Exception
    '        If con.State = ConnectionState.Open Then
    '            con.Close()
    '        End If
    '        Return Nothing
    '    End Try
    'End Function
    Public Function fnInsertInstitutionList(ByVal BUName As String, ByVal BUType As String, ByVal IsActive As Integer, ByVal EntryBy As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertInstitutionName", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@InstitutionName", BUName)
            cmd.Parameters.AddWithValue("@BUType", BUType)
            cmd.Parameters.AddWithValue("@IsActive", IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", EntryBy)

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
    Public Function fnUpdateInstitutionList(ByVal BUName As String, ByVal BUType As String, ByVal IsActive As Integer, ByVal InstitutionID As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateInstitutionName", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@InstitutionName", BUName)
            cmd.Parameters.AddWithValue("@BUType", BUType)
            cmd.Parameters.AddWithValue("@IsActive", IsActive)
            cmd.Parameters.AddWithValue("@InstitutionID", InstitutionID)

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


    Public Function CandidateExperirnce(ByVal CandidateID As String, ByRef YearOfExp As Double) As Double
        Dim sp As String = "spCandidateExperirnce"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    YearOfExp = dr.Item("YearOfExperience")
                End While
                con.Close()

                Return YearOfExp
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function
    Public Function fnUpdateMajor(ByVal MajorName As String, ByVal IsActive As Integer, ByVal MajorID As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateMajorType", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@MajorType", MajorName)
            cmd.Parameters.AddWithValue("@IsActive", IsActive)
            cmd.Parameters.AddWithValue("@MajorID", MajorID)

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

    Public Function fnGetAllOccupationList() As DataSet

        Dim sp As String = "spGetAlloccupationList"
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

    Public Function fnInsertOccupation(ByVal OccupationName As String, ByVal IsActive As Integer, ByVal EntryBy As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertOccupation", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@OccupationName", OccupationName)
            cmd.Parameters.AddWithValue("@IsActive", IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", EntryBy)

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
    Public Function fnUpdateOccupation(ByVal OccupationName As String, ByVal IsActive As Integer, ByVal OccupationID As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateOccupation", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@OccupationName", OccupationName)
            cmd.Parameters.AddWithValue("@IsActive", IsActive)
            cmd.Parameters.AddWithValue("@OccupationID", OccupationID)

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


    Public Function fnGetAllInstitutionList() As DataSet

        Dim sp As String = "spGetAllInstitutionList"
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
    Public Function fnGetAllInstitutionListForGrid() As DataSet

        Dim sp As String = "spGetAllInstitutionListForGrid"
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

    Public Function fnGetAllMajorList() As DataSet

        Dim sp As String = "spGetAllMajorList"
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
    Public Function fnGetAllRefRelationList() As DataSet

        Dim sp As String = "spGetAllRefRelationList"
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
    Public Function fnInsertRefRelation(ByVal RelationName As String, ByVal IsActive As Integer, ByVal EntryBy As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertRefRelationType", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@RefRelationName", RelationName)
            cmd.Parameters.AddWithValue("@IsActive", IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", EntryBy)

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
    Public Function fnUpdateRefRelation(ByVal RelationName As String, ByVal IsActive As Integer, ByVal RefRelationID As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateRefRelationType", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@RefRelationName", RelationName)
            cmd.Parameters.AddWithValue("@IsActive", IsActive)
            cmd.Parameters.AddWithValue("@RefRelationID", RefRelationID)

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
    Public Function fnInsertSpecilizedIn(ByVal SpecilizedName As String, ByVal IsActive As Integer, ByVal EntryBy As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertSpecilizedIn", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@SpecilizedName", SpecilizedName)
            cmd.Parameters.AddWithValue("@IsActive", IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", EntryBy)

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
    Public Function fnGetAllSpecilizedList() As DataSet

        Dim sp As String = "spGetAllSpecilizedList"
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

    Public Function fnUpdateSpecilizedIn(ByVal SpecilizedName As String, ByVal IsActive As Integer, ByVal SpecilizedID As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateSpecilizedIn", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@SpecilizedName", SpecilizedName)
            cmd.Parameters.AddWithValue("@IsActive", IsActive)
            cmd.Parameters.AddWithValue("@SpecilizedID", SpecilizedID)

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
End Class
