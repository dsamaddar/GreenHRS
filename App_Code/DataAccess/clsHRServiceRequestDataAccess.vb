Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsHRServiceRequestDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

    Public Function fnInsertHRServiceIssue(ByVal HRServiceRequest As clsHRServiceRequest) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertHRServiceIssue", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@HRServiceID", HRServiceRequest.HRServiceID)
            cmd.Parameters.AddWithValue("@EmployeeID", HRServiceRequest.EmployeeID)
            cmd.Parameters.AddWithValue("@EffectiveDate", HRServiceRequest.EffectiveDate)
            cmd.Parameters.AddWithValue("@Remarks", HRServiceRequest.Remarks)
            cmd.Parameters.AddWithValue("@EntryBy", HRServiceRequest.EntryBy)
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

    Public Function fnProvideHRService(ByVal HRServiceRequest As clsHRServiceRequest) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spProvideHRService", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@HRServiceIssueID", HRServiceRequest.HRServiceIssueID)
            cmd.Parameters.AddWithValue("@ServiceProviderRemarks", HRServiceRequest.ServiceProviderRemarks)
            cmd.Parameters.AddWithValue("@ServiceProvider", HRServiceRequest.ServiceProvider)
            cmd.Parameters.AddWithValue("@ServiceEvent", HRServiceRequest.ServiceEvent)
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

    Public Function fnGetHRServiceMailInfoSubmitted(ByVal HRServiceRequest As clsHRServiceRequest) As clsMailProperty
        Dim sp As String = "spGetHRServiceMailInfoSubmitted"
        Dim dr As SqlDataReader
        Dim MailProp As New clsMailProperty()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", HRServiceRequest.EmployeeID)
                cmd.Parameters.AddWithValue("@HRServiceID", HRServiceRequest.HRServiceID)
                cmd.Parameters.AddWithValue("@EffectiveDate", HRServiceRequest.EffectiveDate)
                cmd.Parameters.AddWithValue("@Remarks", HRServiceRequest.Remarks)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    MailProp.MailSubject = dr.Item("MailSubject")
                    MailProp.MailBody = dr.Item("MailBody")
                    MailProp.MailFrom = dr.Item("MailFrom")
                    MailProp.MailTo = dr.Item("MailTo")
                    MailProp.MailCC = dr.Item("MailCC")
                    MailProp.MailBCC = dr.Item("MailBCC")
                End While
                con.Close()

                Return MailProp
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

    Public Function fnGetHRServiceProvidedMail(ByVal HRServiceRequest As clsHRServiceRequest) As clsMailProperty
        Dim sp As String = "spGetHRServiceProvidedMail"
        Dim dr As SqlDataReader
        Dim MailProp As New clsMailProperty()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@HRServiceIssueID", HRServiceRequest.HRServiceIssueID)
                cmd.Parameters.AddWithValue("@ServiceEvent", HRServiceRequest.ServiceEvent)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    MailProp.MailSubject = dr.Item("MailSubject")
                    MailProp.MailBody = dr.Item("MailBody")
                    MailProp.MailFrom = dr.Item("MailFrom")
                    MailProp.MailTo = dr.Item("MailTo")
                    MailProp.MailCC = dr.Item("MailCC")
                    MailProp.MailBCC = dr.Item("MailBCC")
                End While
                con.Close()
                Return MailProp
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

    Public Function fnGetHRServiceIssueByEmp(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spGetHRServiceIssueByEmp"
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

    Public Function fnGetHRServiceRequest() As DataSet

        Dim sp As String = "spGetHRServiceRequest"
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

    Public Function fnReportHRServicesIssue(ByVal HRServices As clsHRServiceRequest) As DataSet

        Dim sp As String = "spReportHRServicesIssue"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@HRServiceID", HRServices.HRServiceID)
                cmd.Parameters.AddWithValue("@EmployeeID", HRServices.EmployeeID)
                cmd.Parameters.AddWithValue("@ServiceStatus", HRServices.ServiceStatus)
                cmd.Parameters.AddWithValue("@IsServiceProvided", HRServices.IsServiceProvidedEX)
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
