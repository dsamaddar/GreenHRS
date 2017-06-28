Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class clsRecruitmentTypeDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Recruitment Type "

    Public Function fnInsertRecruitmentType(ByVal RecruitmentType As clsRecruitmentType) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertRecruitmentType", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@RecruitmentType", RecruitmentType.RecruitmentType)
            cmd.Parameters.AddWithValue("@RecruitmentTypeCode", RecruitmentType.RecruitmentTypeCode)
            cmd.Parameters.AddWithValue("@Prerequisite", RecruitmentType.Prerequisite)
            cmd.Parameters.AddWithValue("@Sourcing", RecruitmentType.Sourcing)
            cmd.Parameters.AddWithValue("@InterviewPanel", RecruitmentType.InterviewPanel)
            cmd.Parameters.AddWithValue("@IsActive", RecruitmentType.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", RecruitmentType.EntryBy)
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

#Region " Update Recruitment Type "

    Public Function fnUpdateRecruitmentType(ByVal RecruitmentType As clsRecruitmentType) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateRecruitmentType", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@RecruitmentTypeID", RecruitmentType.RecruitmentTypeID)
            cmd.Parameters.AddWithValue("@RecruitmentType", RecruitmentType.RecruitmentType)
            cmd.Parameters.AddWithValue("@RecruitmentTypeCode", RecruitmentType.RecruitmentTypeCode)
            cmd.Parameters.AddWithValue("@Prerequisite", RecruitmentType.Prerequisite)
            cmd.Parameters.AddWithValue("@Sourcing", RecruitmentType.Sourcing)
            cmd.Parameters.AddWithValue("@InterviewPanel", RecruitmentType.InterviewPanel)
            cmd.Parameters.AddWithValue("@IsActive", RecruitmentType.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", RecruitmentType.EntryBy)
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

#Region " Get Rec Type Details "

    Public Function fnGetRecTypeDetails() As DataSet

        Dim sp As String = "spGetRecTypeDetails"
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

#Region " Get Rec TypeList "

    Public Function fnGetRecTypeList() As DataSet

        Dim sp As String = "spGetRecTypeList"
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

#Region " Get Rec Type List For Emp "

    Public Function fnGetRecTypeListForEmp(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spGetRecTypeListForEmp"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("EmployeeID", EmployeeID)
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
