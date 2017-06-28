Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsMailSettingsDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

    Public Function fnInsertMailType(ByVal MailType As clsMailType) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertMailType", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@MailType", MailType.MailType)
            cmd.Parameters.AddWithValue("@IsActive", MailType.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", MailType.EntryBy)
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

    Public Function fnGetMailTypeList() As DataSet

        Dim sp As String = "spGetMailTypeList"
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

    Public Function fnInsertMailProperty(ByVal MailProperty As clsMailProperty) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertMailProperty", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@MailTypeID", MailProperty.MailTypeID)
            cmd.Parameters.AddWithValue("@MailSubject", MailProperty.MailSubject)
            cmd.Parameters.AddWithValue("@MailBody", MailProperty.MailBody)
            cmd.Parameters.AddWithValue("@MailFrom", MailProperty.MailFrom)
            cmd.Parameters.AddWithValue("@MailTo", MailProperty.MailTo)
            cmd.Parameters.AddWithValue("@MailCC", MailProperty.MailCC)
            cmd.Parameters.AddWithValue("@MailBCC", MailProperty.MailBCC)
            cmd.Parameters.AddWithValue("@MailHeader", MailProperty.MailHeader)
            cmd.Parameters.AddWithValue("@MailFooter", MailProperty.MailFooter)
            cmd.Parameters.AddWithValue("@IsAutomated", MailProperty.IsAutomated)
            cmd.Parameters.AddWithValue("@IsActive", MailProperty.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", MailProperty.EntryBy)
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


    Public Function fnGetMailTypeActiveList() As DataSet

        Dim sp As String = "spGetMailTypeActiveList"
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

    Public Function fnGetPropertyByType(ByVal MailType As String) As clsMailProperty
        Dim MailProperty As New clsMailProperty()
        Dim sp As String = "spGetMailPropertyByMailType"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@MailType", MailType)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    MailProperty.MailTypeID = dr.Item("MailTypeID")
                    MailProperty.MailSubject = dr.Item("MailSubject")
                    MailProperty.MailBody = dr.Item("MailBody")
                    MailProperty.MailFrom = dr.Item("MailFrom")
                    MailProperty.MailTo = dr.Item("MailTo")
                    MailProperty.MailCC = dr.Item("MailCC")
                    MailProperty.MailBCC = dr.Item("MailBCC")
                    MailProperty.IsAutomated = dr.Item("IsAutomated")
                    MailProperty.IsActive = dr.Item("IsActive")
                    MailProperty.MailHeader = dr.Item("MailHeader")
                    MailProperty.MailFooter = dr.Item("MailFooter")
                End While
                con.Close()

                Return MailProperty
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function


    Public Function fnGeListToSendMail() As DataSet

        Dim sp As String = "spGetEmployeeInfoToSentMail"
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


    Public Function fnGetInformationToSendMail(ByVal MailID As String, ByVal EmployeeID As String) As clsMail
        Dim Mail As New clsMail()
        Dim sp As String = "spGetInformationToSendMail"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@MailID", MailID)
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    Mail.EmployeeName = dr.Item("EmployeeName")
                    Mail.OfficialDesignationName = dr.Item("OfficialDesignationName")
                    Mail.FunctionalDesignationName = dr.Item("FunctionalDesignationName")
                    Mail.DeptName = dr.Item("DeptName")
                    Mail.ULCBranchName = dr.Item("ULCBranchName")
                    Mail.JoiningDate = dr.Item("JoiningDate")
                    Mail.Photos = dr.Item("Photos")
                End While
                con.Close()
                Return Mail
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function


    Public Function fnGetInfoMailDesigChange(ByVal MailID As String, ByVal EmployeeID As String) As clsMail
        Dim Mail As New clsMail()
        Dim sp As String = "spGetInfoMailforDesigChange"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@MailID", MailID)
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    Mail.EmployeeName = dr.Item("EmployeeeName")
                    Mail.OldDesigName = dr.Item("OldDesigName")
                    Mail.NewDesigName = dr.Item("NewDesigName")
                    Mail.EffectiveDate = dr.Item("EffectiveDate")
                    Mail.Photos = dr.Item("Photos")
                End While
                con.Close()
                Return Mail
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

    Public Function fnGetInfoMailNewBornBaby(ByVal MailID As String, ByVal EmployeeID As String) As clsMail
        Dim Mail As New clsMail()
        Dim sp As String = "spGetInfoMailforNewBornBaby"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@MailID", MailID)
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    Mail.EmployeeName = dr.Item("EmployeeeName")
                    Mail.OfficialDesignationName = dr.Item("DesignationName")
                    Mail.Gender = dr.Item("Gender")
                    Mail.SpouseName = dr.Item("SpouseName")
                    Mail.DateOfBirth = dr.Item("DateOfBirth")
                    Mail.ULCBranchName = dr.Item("ULCBranchName")
                End While
                con.Close()
                Return Mail
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

End Class
