Imports System
Imports System.Collections
Imports System.Configuration
Imports System.Linq
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Management
Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Xml.Linq
Imports System.IO

Public Class Common

    Public Shared Function isLogin(ByVal UserID As String, ByVal Password As String, ByVal IP As String, ByRef UserName As String, ByRef DefaultPage As String, ByRef UniqueUserID As String, ByRef UserType As String, ByRef PermittedMenus As String) As Integer
        Dim sp As String = "prLogin"
        Dim isAut As Integer
        Dim dr As SqlDataReader
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
        Try
            cn.Open()
            Using cmd = New SqlCommand(sp, cn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@UserID", UserID)
                cmd.Parameters.AddWithValue("@Password", Password)
                cmd.Parameters.AddWithValue("@IP", IP)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    isAut = dr.Item("isAuth")
                    UserName = dr.Item("username")
                    DefaultPage = dr.Item("defaultpage")
                    UniqueUserID = dr.Item("UniqueUserID")
                    UserType = dr.Item("UserType")
                    PermittedMenus = dr.Item("PermittedMenus")
                End While
                cn.Close()
            End Using
        Catch ex As Exception
            If cn.State = ConnectionState.Open Then
                cn.Close()
                isAut = 0
            End If
        End Try
        Return isAut
    End Function


    Public Shared Sub GetCandidateWiseData(ByVal UserID As String, ByRef Name As String, ByRef FatherName As String, ByRef MotherName As String, ByRef SpouseName As String, ByRef Gender As String, ByRef NID As String, ByRef Nationality As String, ByRef Religion As String, ByRef PreAddress As String, ByRef PreDistrict As String, ByRef PreThana As String, ByRef PerAddress As String, ByRef PerDistrict As String, ByRef PerThana As String, ByRef HomePhoneNo As String, ByRef MobileNumber As String, ByRef OfficePhoneNo As String, ByRef AlEmail As String, ByRef CareerObjective As String, ByRef yrOfExp As String, ByRef PresentSalary As String, ByRef ExpectedSalary As String, ByRef LookingFor As String, ByRef AvailableFor As String, ByRef EnLagPro As String, ByRef ComputerLiteracy As String, ByRef Attachment As String, ByRef Signature As String, ByRef FathersOccupation As String, ByRef MothersOccupation As String, ByRef SpouseOccupation As String, ByRef NoofChildrenAge As String, ByRef SibblingsNameOccupation As String, ByRef PreferredJobLocation As String, ByRef LastDrawnDate As String, ByRef Employeer As String)
        Dim cmd As New SqlCommand()
        Dim rd As SqlDataReader
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

        Try
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "exec prGetCandidateBasicInfo '" & UserID & "'"
            rd = cmd.ExecuteReader()

            rd.Read()

            PreThana = rd.GetValue(10)
            PerAddress = rd.GetValue(11)
            Name = rd.GetValue(0)
            FatherName = rd.GetValue(1)
            MotherName = rd.GetValue(2)
            SpouseName = rd.GetValue(3)
            Gender = rd.GetValue(4)
            NID = rd.GetValue(5)
            Nationality = rd.GetValue(6)
            Religion = rd.GetValue(7)
            PreAddress = rd.GetValue(8)
            PreDistrict = rd.GetValue(9)
            PreThana = rd.GetValue(10)
            PreAddress = rd.GetValue(11)
            PerDistrict = rd.GetValue(12)
            PerThana = rd.GetValue(13)
            HomePhoneNo = rd.GetValue(14)
            MobileNumber = rd.GetValue(15)
            OfficePhoneNo = rd.GetValue(16)
            AlEmail = rd.GetValue(17)
            CareerObjective = rd.GetValue(18)
            yrOfExp = rd.GetValue(19)
            PresentSalary = rd.GetValue(20)
            ExpectedSalary = rd.GetValue(21)
            LookingFor = rd.GetValue(22)
            AvailableFor = rd.GetValue(23)
            EnLagPro = rd.GetValue(25)
            ComputerLiteracy = rd.GetValue(24)
            Attachment = rd.GetValue(27)
            Signature = rd.GetValue(36)
            FathersOccupation = rd.GetValue(28)
            MothersOccupation = rd.GetValue(29)
            SpouseOccupation = rd.GetValue(30)
            NoofChildrenAge = rd.GetValue(31)
            SibblingsNameOccupation = rd.GetValue(32)
            LastDrawnDate = rd.GetValue(33)
            Employeer = rd.GetValue(34)
            PreferredJobLocation = rd.GetValue(35)
            cn.Close()
        Catch ex As SqlException
            cn.Close()
            UserID = ""
        End Try
    End Sub

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
            If cn.State = ConnectionState.Open Then
                cn.Close()
                Return 0
            End If
        End Try
    End Function

    Public Shared Function GetCandidateID(ByVal RegistrationID As String) As String

        Dim cmd As New SqlCommand()
        Dim rd As SqlDataReader
        Dim rtn As String = ""
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
        Try
            cn.Open()
            cmd.Connection = cn

            cmd.CommandText = "Select CandidateID from tblCandidateBasicInfo where RegistrationID='" & RegistrationID & "'"
            rd = cmd.ExecuteReader()

            'rtn = 0
            While (rd.Read())
                rtn = rd.GetValue(0)
            End While
            cn.Close()
            Return rtn
        Catch ex As SqlException
            If cn.State = ConnectionState.Open Then
                cn.Close()
                Return Nothing
            End If
        End Try
        Return ""
    End Function

    Public Shared Function InsertApplicationProcess(ByVal ProcessName As String, ByVal ProcessDescription As String, ByVal Stage As Integer, ByVal loginid As String) As Integer
        Dim cmd As New SqlCommand()
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

        Try
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "exec prInsertApplicationProcess '" & ProcessName & "','" & ProcessDescription & "'," & Stage & ",'" & loginid & "'"
            cmd.ExecuteNonQuery()
            cn.Close()
            Return 1
        Catch ex As SqlException
            If cn.State = ConnectionState.Open Then
                cn.Close()
                Return 0
            End If
        End Try
    End Function

    Public Shared Sub UpdateApplicationProcess(ByVal AppProcessID As String, ByVal ProcessName As String, ByVal Description As String, ByVal Stage As String)
        Dim cmd As New SqlCommand()
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

        Try
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "exec prUpdateApplicationProcess '" & AppProcessID & "','" & ProcessName & "','" & Description & "','" & Stage & "'"
            cmd.ExecuteNonQuery()
            cn.Close()
        Catch ex As SqlException
            If cn.State = ConnectionState.Open Then
                cn.Close()
            End If
        End Try
    End Sub

    Public Shared Sub GetApplicationProcess(ByVal AppProcessID As String, ByRef ProcessName As String, ByRef Description As String, ByRef Stage As Integer)
        Dim cmd As New SqlCommand()
        Dim rd As SqlDataReader
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

        Try
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "exec prApplicationProcess '" & AppProcessID & "'"

            rd = cmd.ExecuteReader()

            rd.Read()
            ProcessName = rd.GetValue(1)
            Description = rd.GetValue(2)
            Stage = rd.GetValue(3)

            cn.Close()
        Catch ex As SqlException
            If cn.State = ConnectionState.Open Then
                cn.Close()
            End If
        End Try
    End Sub

    Public Shared Sub GetApplicationDescription(ByVal AppProcessID As String, ByRef Description As String)
        Dim cmd As New SqlCommand()
        Dim rd As SqlDataReader
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

        Try
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "exec prGetApplicationProcessDescription '" & AppProcessID & "'"
            rd = cmd.ExecuteReader()

            rd.Read()

            Description = rd.GetValue(0)

            cn.Close()
        Catch ex As SqlException
            If cn.State = ConnectionState.Open Then
                cn.Close()
            End If
        End Try
    End Sub

    Public Function AddJobType(ByVal JobType As String, ByVal IsActive As Integer, ByVal EntryBy As String) As Integer

        Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertJobType", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@JobType", JobType)
            cmd.Parameters.AddWithValue("@IsActive", IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", EntryBy)

            cmd.ExecuteNonQuery()
            con.Close()
            Return 1
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
                Return 0
            End If
        End Try
    End Function


    Public Function fnShowJobType() As DataSet

        Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

        Dim sp As String = "spShowJobType"
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
                Return Nothing
            End If
        End Try
        Return Nothing
    End Function
    Public Function AddServiceType(ByVal ServiceType As String, ByVal IsActive As Integer, ByVal EntryBy As String) As Integer

        Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertServiceType", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ServiceType", ServiceType)
            cmd.Parameters.AddWithValue("@IsActive", IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", EntryBy)

            cmd.ExecuteNonQuery()
            con.Close()
            Return 1
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
                Return 0
            End If
        End Try
    End Function

    Public Function fnShowServiceType() As DataSet

        Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

        Dim sp As String = "spShowServiceType"
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
                Return Nothing
            End If
        End Try
        Return Nothing
    End Function


    Public Function AddMajorType(ByVal MajorType As String, ByVal IsActive As Integer, ByVal EntryBy As String) As Integer

        Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertMajorType", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@MajorType", MajorType)
            cmd.Parameters.AddWithValue("@IsActive", IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", EntryBy)

            cmd.ExecuteNonQuery()
            con.Close()
            Return 1
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
                Return 0
            End If
        End Try
    End Function

    Public Function fnShowMajorType() As DataSet

        Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

        Dim sp As String = "spShowMajorType"
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
                Return Nothing
            End If
        End Try
        Return Nothing
    End Function

    Public Shared Function fnGetTrngAssEntryPoint() As DataSet

        Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

        Dim sp As String = "spGetTrngAssEntryPoint"
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
                Return Nothing
            End If
        End Try
        Return Nothing
    End Function


    Public Shared Function ChangeStatus(ByVal CircularID As String, ByVal CandidateID As String, ByVal UserID As String, ByVal TakenAction As String) As String
        Dim cmd As New SqlCommand()
        Dim rd As SqlDataReader
        Dim Flag As String = ""
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

        Try
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "exec spChangeStatus '" & CircularID & "','" & CandidateID & "','" & UserID & "','" & TakenAction & "'"
            rd = cmd.ExecuteReader()
            rd.Read()
            Flag = rd.GetValue(0)
            cn.Close()
        Catch ex As SqlException
            If cn.State = ConnectionState.Open Then
                cn.Close()
            End If
        End Try
        Return Flag
    End Function

    Public Shared Function GetMessage(ByVal CandidateID As String) As String
        Dim rd As SqlDataReader
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

        Dim Message As String = ""
        Try
            Dim cmd As SqlCommand = New SqlCommand("spMessageShow", cn)
            cn.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
            rd = cmd.ExecuteReader()
            While rd.Read()
                Message = rd.Item("Message")
            End While
            cn.Close()
            Return Message
        Catch ex As SqlException
            If cn.State = ConnectionState.Open Then
                cn.Close()
                Return ""
            End If
        End Try
        Return Message
    End Function

    Public Shared Function CandidateEducationCount(ByVal CandidateID As String) As Integer

        Dim cmd As New SqlCommand()
        Dim rd As SqlDataReader
        Dim rtn As Integer
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
        Try
            cn.Open()
            cmd.Connection = cn

            cmd.CommandText = "Select count(1) from tblCandidateEducationInfo where CandidateID='" & CandidateID & "'"
            rd = cmd.ExecuteReader()

            rtn = 0
            While (rd.Read())
                rtn = rd.GetValue(0)
            End While
            cn.Close()
            Return rtn
        Catch ex As SqlException
            If cn.State = ConnectionState.Open Then
                cn.Close()
                Return 0
            End If
        End Try
    End Function

    Public Shared Function CandidateReferenceCount(ByVal CandidateID As String) As Integer

        Dim cmd As New SqlCommand()
        Dim rd As SqlDataReader
        Dim rtn As Integer
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
        Try
            cn.Open()
            cmd.Connection = cn

            cmd.CommandText = "Select count(1) from tblCandidateReferenceInfo where CandidateID='" & CandidateID & "'"
            rd = cmd.ExecuteReader()

            rtn = 0
            While (rd.Read())
                rtn = rd.GetValue(0)
            End While
            cn.Close()
            Return rtn
        Catch ex As SqlException
            If cn.State = ConnectionState.Open Then
                cn.Close()
                Return 0
            End If
        End Try
    End Function

    Public Shared Function CandidateExperienceCount(ByVal CandidateID As String) As Integer

        Dim cmd As New SqlCommand()
        Dim rd As SqlDataReader
        Dim rtn As Integer
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
        Try
            cn.Open()
            cmd.Connection = cn

            cmd.CommandText = "Select count(1) from tblCandidateExperienceInfo where CandidateID='" & CandidateID & "'"
            rd = cmd.ExecuteReader()

            rtn = 0
            While (rd.Read())
                rtn = rd.GetValue(0)
            End While
            cn.Close()
            Return rtn
        Catch ex As SqlException
            If cn.State = ConnectionState.Open Then
                cn.Close()
                Return 0
            End If
        End Try
    End Function

    Public Shared Function CheckAsciiValue(ByVal str As String) As String
        Dim Ch As Char() = str
        Dim strVar As String = ""
        Dim Holder As Integer

        Dim Dch As Char = ""

        For i = 0 To str.Length - 1
            Holder = Asc(Ch(i))

            If i > 0 Then
                Dch = Ch(i - 1)
            Else
                Dch = Ch(i)
            End If

            If Holder >= 32 And Holder <= 122 Then
                If Ch(i) = Chr(32) And Dch = Chr(32) Then

                Else
                    strVar += Convert.ToString(Ch(i))
                End If
            Else
                strVar += Chr(32).ToString()
            End If

        Next
        Return Trim(strVar)
    End Function

    Public Shared Function EmployeeBasicCount(ByVal EmployeeID As String) As Integer

        Dim cmd As New SqlCommand()
        Dim rd As SqlDataReader
        Dim rtn As Integer
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
        Try
            cn.Open()
            cmd.Connection = cn

            cmd.CommandText = "Select count(1) from tblEmployeeBasicInfo where EmployeeID='" & EmployeeID & "'"
            rd = cmd.ExecuteReader()

            rtn = 0
            While (rd.Read())
                rtn = rd.GetValue(0)
            End While
            cn.Close()
            Return rtn
        Catch ex As SqlException
            If cn.State = ConnectionState.Open Then
                cn.Close()
                Return 0
            End If
        End Try
    End Function

    Public Shared Function EmployeeEduCount(ByVal EmployeeID As String) As Integer

        Dim cmd As New SqlCommand()
        Dim rd As SqlDataReader
        Dim rtn As Integer
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
        Try
            cn.Open()
            cmd.Connection = cn

            cmd.CommandText = "Select count(1) from tblEmployeeEducationInfo where EmployeeID='" & EmployeeID & "'"
            rd = cmd.ExecuteReader()

            rtn = 0
            While (rd.Read())
                rtn = rd.GetValue(0)
            End While
            cn.Close()
            Return rtn
        Catch ex As SqlException
            If cn.State = ConnectionState.Open Then
                cn.Close()
                Return 0
            End If
        End Try
    End Function

    Public Shared Function SubmitUserLogInfo(ByVal UserID As String, ByVal PassWord As String, ByVal IPAddress As String, ByVal RegistrationID As String) As Integer
        Dim cmd As New SqlCommand()
        'Dim rd As SqlDataReader
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

        Try
            cn.Open()
            cmd.Connection = cn
            cmd.CommandText = "exec prUserLoginLogAdd '" & UserID & "','" & PassWord & "','" & IPAddress & "','" & RegistrationID & "'"
            cmd.CommandType = CommandType.Text
            cmd.ExecuteNonQuery()
            cn.Close()

            cn.Close()
            Return 1
        Catch ex As SqlException
            If cn.State = ConnectionState.Open Then
                cn.Close()
                Return 0
            End If
        End Try

        'Return Nothing
    End Function
    Public Shared Function GetRegistrationID(ByVal UserID As String, ByVal Password As String) As String

        Dim cmd As New SqlCommand()
        Dim rd As SqlDataReader
        Dim rtn As String = ""
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
        Try
            cn.Open()
            cmd.Connection = cn

            cmd.CommandText = "Select RegistrationID from tblRegisterUser where UserID='" & UserID & "'and Password='" & Password & "'"
            rd = cmd.ExecuteReader()

            'rtn = 0
            While (rd.Read())
                rtn = rd.GetValue(0)
            End While
            cn.Close()
            Return rtn
        Catch ex As SqlException
            If cn.State = ConnectionState.Open Then
                cn.Close()
                Return Nothing
            End If
        End Try
        Return rtn
    End Function

    Public Shared Function fnForgetPassword(ByVal Email As String, ByVal DOB As DateTime, ByRef UserID As String, ByRef Password As String, ByRef Name As String, ByRef EmailToMail As String, ByRef AltEmail As String) As Integer
        Dim sp As String = "spForgetPassword"
        Dim dr As SqlDataReader
        Dim cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
        Try
            cn.Open()
            Using cmd = New SqlCommand(sp, cn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@Email", Email)
                cmd.Parameters.AddWithValue("@DOB", DOB)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    UserID = dr.Item("UserID")
                    Password = dr.Item("Password")
                    Name = dr.Item("UserName")
                    EmailToMail = dr.Item("Email")
                    AltEmail = dr.Item("AltEmail")
                End While
                cn.Close()
                Return 1
            End Using
        Catch ex As Exception
            If cn.State = ConnectionState.Open Then
                cn.Close()
                Return Nothing
            End If
        End Try
    End Function

    Public Shared Sub ExportToExel(ByVal grdvw As GridView, ByVal rptname As String)

        Dim attachment As String = "attachment; filename=" & rptname & ".xls"
        HttpContext.Current.Response.ClearContent()
        HttpContext.Current.Response.AddHeader("content-disposition", attachment)
        HttpContext.Current.Response.ContentType = "application/ms-excel"
        Dim sw As New StringWriter()
        Dim htw As New HtmlTextWriter(sw)

        grdvw.AllowSorting = False
        grdvw.AllowPaging = False
        grdvw.AutoGenerateSelectButton = False
        grdvw.AutoGenerateEditButton = False
        grdvw.AutoGenerateDeleteButton = False
        grdvw.DataBind()

        ' Create a form to contain the grid
        Dim frm As New HtmlForm()
        grdvw.Parent.Controls.Add(frm)
        frm.Attributes("runat") = "server"
        frm.Controls.Add(grdvw)

        frm.RenderControl(htw)
        'grdvw.RenderControl(htw)
        HttpContext.Current.Response.Write(sw.ToString())
        HttpContext.Current.Response.[End]()

    End Sub

    Public Shared Sub ExportToExel(ByVal grdvw As GridView, ByVal dt As DataTable, ByVal rptname As String)
        Dim attachment As String = "attachment; filename=" & rptname & ".xls"
        HttpContext.Current.Response.ClearContent()
        HttpContext.Current.Response.AddHeader("content-disposition", attachment)
        HttpContext.Current.Response.ContentType = "application/vnd.ms-excel"
        Dim sw As New StringWriter()
        Dim htw As New HtmlTextWriter(sw)
        Dim dg As New DataGrid
        dg.DataSource = dt
        dg.DataBind()
        dg.RenderControl(htw)
        dt = Nothing
        HttpContext.Current.Response.Write(sw.ToString())
        HttpContext.Current.Response.[End]()
    End Sub

End Class
