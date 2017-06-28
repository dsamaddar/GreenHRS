Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Public Class clsEmployeeAllInfoDataAccess
    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

    Public Shared Function SubmitExperienceInformation(ByVal EmployeeID As String, ByVal isoExperienceParts As String) As String
        Dim cmd As New SqlCommand()
        Dim rd As SqlDataReader
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

        Dim ApplicationID As String
        Try
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "exec prEmployeeExpInputAdd '" & EmployeeID & "','" & isoExperienceParts & "'"
            rd = cmd.ExecuteReader()

            rd.Read()
            'ApplicationID = rd.GetValue(0)

            cn.Close()
            Return 1
        Catch ex As SqlException
            cn.Close()
            ApplicationID = ""
            Return 0
        End Try

        'Return ApplicationID
    End Function

    Public Function SubmitEducationInformation(ByVal EmployeeID As String, ByVal isoParts As String) As String
        Dim ApplicationID As String
        Try
            Dim cmd As SqlCommand = New SqlCommand("prEmployeeEducationInputAdd", con)
            cmd.CommandType = CommandType.StoredProcedure
            con.Open()
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
            cmd.Parameters.AddWithValue("@isoParts", isoParts)
            cmd.ExecuteNonQuery()
            con.Close()
            Return 1
        Catch ex As SqlException
            con.Close()
            ApplicationID = ""
            Return 0
        End Try
    End Function

    Public Shared Function SubmitTrainingInformation(ByVal EmployeeID As String, ByVal isoTrainingParts As String) As String
        Dim cmd As New SqlCommand()
        Dim rd As SqlDataReader
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

        Dim ApplicationID As String
        Try
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "exec prEmployeeTrainingInputAdd '" & EmployeeID & "','" & isoTrainingParts & "'"
            rd = cmd.ExecuteReader()

            rd.Read()
            'ApplicationID = rd.GetValue(0)

            cn.Close()
            Return 1
        Catch ex As SqlException
            cn.Close()
            ApplicationID = ""
            Return 0
        End Try

        'Return ApplicationID
    End Function

    Public Function SubmitOtherInformation(ByVal EmployeeID As String, ByVal isoProfessionalCertificationParts As String) As String
        Dim ApplicationID As String
        Try
            Dim cmd As SqlCommand = New SqlCommand("prEmployeeProCerInputAdd", con)
            cmd.CommandType = CommandType.StoredProcedure
            con.Open()
            cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
            cmd.Parameters.AddWithValue("@isoProfessionalCertificationParts", isoProfessionalCertificationParts)
            cmd.ExecuteNonQuery()
            con.Close()
            Return 1
        Catch ex As SqlException
            con.Close()
            ApplicationID = ""
            Return 0
        End Try
    End Function

    Public Function fnGetEducationInformation(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spGetEmployeeEduInformation"
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


    Public Shared Function CandidateCount(ByVal UserID As String) As Integer

        Dim cmd As New SqlCommand()
        Dim rd As SqlDataReader
        Dim rtn As Integer
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
        Try
            cn.Open()
            cmd.Connection = cn

            cmd.CommandText = "Select count(1) from tblCandidateBasicInfo where UserID='" & UserID & "'"
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

    Public Function fnGetExperienceInformation(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spGetEmployeeExpInformation"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@EmployeeID", SqlDbType.VarChar, 50).Value = EmployeeID
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

    Public Function fnGetTrainingInformation(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spGetEmployeeTrainingInformation"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@EmployeeID", SqlDbType.VarChar, 50).Value = EmployeeID
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

    Public Function fnGetProCertificationInformation(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spGetEmployeeProCertiInformation"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@EmployeeID", SqlDbType.VarChar, 50).Value = EmployeeID
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

            cmd.CommandText = "Select count(1) from tblCandidateEducationInfo inner join dbo.tblExamName on dbo.tblExamName.ExamID=tblCandidateEducationInfo.ExamID where (tblExamName.ExamName='Honors' or tblExamName.ExamName='Degree' ) and CandidateID='" & CandidateID & "'"
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

    Public Function EmployeeCount(ByVal EmployeeID As String) As Integer

        Dim cmd As New SqlCommand()
        Dim rd As SqlDataReader
        Dim rtn As Integer
        Try
            con.Open()
            cmd.Connection = con

            cmd.CommandText = "Select count(1) from tblEmployeeBasicInfo where EmployeeID='" & EmployeeID & "'"
            rd = cmd.ExecuteReader()

            rtn = 0
            While (rd.Read())
                rtn = rd.GetValue(0)
            End While
            con.Close()
            Return rtn
        Catch ex As SqlException
            If con.State = ConnectionState.Open Then
                con.Close()
                Return 0
            End If
        End Try
    End Function

    Public Function fnGetInstituteName() As DataSet

        Dim sp As String = "spGetInstitutionName"
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

    Public Function fnGetExamName() As DataSet

        Dim sp As String = "spGetExamName"
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

    Public Function fnGetMajorName() As DataSet

        Dim sp As String = "spGetMajorTypeName"
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

    Public Function CheckPermissionForOwnInfo(ByVal LoginUserId As String) As Boolean
        Dim sp As String = "spPermissionForOwnInfo"
        Dim dr As SqlDataReader
        Dim ReturnValue As Boolean
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@LoginUserId", LoginUserId)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    ReturnValue = dr.Item("Result")
                End While
                con.Close()

                Return ReturnValue
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
                Return Nothing
            End If
        End Try
        Return ReturnValue
    End Function
    Public Function CheckPermissionForOthers(ByVal LoginUserId As String) As String
        Dim sp As String = "spPermissionForOthers"
        Dim dr As SqlDataReader
        Dim ReturnValue As String = ""
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@LoginUserId", LoginUserId)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    ReturnValue = dr.Item("Result")
                End While
                con.Close()

                Return ReturnValue
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
                Return Nothing
            End If
        End Try
        Return ReturnValue
    End Function
End Class
