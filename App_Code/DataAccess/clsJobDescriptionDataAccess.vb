Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsJobDescriptionDataAccess
    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

    Public Function fnInsertJobDescription(ByVal JobDescription As clsJobDescription, ByVal UserID As String, ByVal KeyResponsibilityParts As String, ByVal ExceptionParts As String, ByVal KPIParts As String) As String
        Dim JDID As String
        Dim rd As SqlDataReader
        JDID = ""
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertJobDescription", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure

            cmd.Parameters.AddWithValue("@JobDescriptionNo", JobDescription.JobDescriptionNo)
            cmd.Parameters.AddWithValue("@JobTitle", JobDescription.JobTitle)
            cmd.Parameters.AddWithValue("@LastModifiedDate", JobDescription.LastModifiedDate)
            cmd.Parameters.AddWithValue("@JDGoal", JobDescription.JDGoal)
            cmd.Parameters.AddWithValue("@UserID", UserID)
            cmd.Parameters.AddWithValue("@KeyResponsibilityParts", KeyResponsibilityParts)
            cmd.Parameters.AddWithValue("@ExceptionParts", ExceptionParts)
            cmd.Parameters.AddWithValue("@KPIParts", KPIParts)

            rd = cmd.ExecuteReader()
            rd.Read()
            JDID = rd.GetValue(0)
            con.Close()
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
        End Try
        Return JDID
    End Function

    Public Function AddkyRes(ByVal KeyResName As String, ByVal IsActive As Integer, ByVal EntryBy As String) As Integer

        Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertKeyResponsibilityType", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@KeyResTypeName", KeyResName)
            cmd.Parameters.AddWithValue("@IsActive", IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", "tahmed1")

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

    Public Function fnGetKeyResList() As DataSet

        Dim sp As String = "spGetKeyResponsibilityList"
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

    Public Function fnGetJobDescriptionByID(ByVal JDID As String) As clsJobDescription
        Dim JobDescription As New clsJobDescription()
        Dim sp As String = "spGetJobDescriptionByID"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@JDID", JDID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    'JobDescription.JobDescriptionID = dr.Item("UserJobDescriptionIDID")
                    JobDescription.JobDescriptionNo = dr.Item("JobDescriptionNo")
                    JobDescription.JobTitle = dr.Item("JobTitle")
                    JobDescription.LastModifiedDate = dr.Item("LastModifiedDate")
                    JobDescription.JDGoal = dr.Item("JDGoal")
                End While
                con.Close()

                Return JobDescription
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function


    Public Function fnGetKeyResponsibility(ByVal JDID As String) As DataSet

        Dim sp As String = "spGetKeyResponsibility"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@JDID", SqlDbType.VarChar, 50).Value = JDID
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

    Public Function fnGetException(ByVal JDID As String) As DataSet

        Dim sp As String = "spGetJDException"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@JDID", SqlDbType.VarChar, 50).Value = JDID
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

    Public Function fnGetKPI(ByVal JDID As String) As DataSet

        Dim sp As String = "spGetJDKPI"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add("@JDID", SqlDbType.VarChar, 50).Value = JDID
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

    Public Function fnUpdateJobDescription(ByVal JDID As String, ByVal JobDescription As clsJobDescription, ByVal KeyResponsibilityParts As String, ByVal ExceptionParts As String, ByVal KPIParts As String) As String
        Dim ID As String
        Dim rd As SqlDataReader
        ID = ""
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateInsertJobDescription", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure

            cmd.Parameters.AddWithValue("@JDID", JDID)
            cmd.Parameters.AddWithValue("@JobDescriptionNo", JobDescription.JobDescriptionNo)
            cmd.Parameters.AddWithValue("@JobTitle", JobDescription.JobTitle)
            cmd.Parameters.AddWithValue("@LastModifiedDate", JobDescription.LastModifiedDate)
            cmd.Parameters.AddWithValue("@JDGoal", JobDescription.JDGoal)
            cmd.Parameters.AddWithValue("@KeyResponsibilityParts", KeyResponsibilityParts)
            cmd.Parameters.AddWithValue("@ExceptionParts", ExceptionParts)
            cmd.Parameters.AddWithValue("@KPIParts", KPIParts)

            rd = cmd.ExecuteReader()
            rd.Read()
            ID = rd.GetValue(0)
            con.Close()
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
        End Try
        Return ID
    End Function

    Public Function fnGetJobDescriptionInfo() As DataSet

        Dim sp As String = "spGetJobDescriptionInfo"
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

    Public Function fnGetCurrentJD(ByVal EmployeeID As String) As DataSet
        Dim sp As String = "spShowCurrentJD"
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

    Public Function fnGetEmpCurrentJD(ByVal EmployeeID As String) As DataSet
        Dim sp As String = "spGetEmpCurrentJD"
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

End Class
