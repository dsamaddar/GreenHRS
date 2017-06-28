Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsSMSServiceDataAccess


    Public Function fnInsertSMSContentList(ByVal SMSService As clsSMSService) As String
        Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
        Dim CandidateID As String
        CandidateID = ""
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertSMSContentList", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@SMSContentList", SMSService.SMSContentList)
            cmd.Parameters.AddWithValue("@Participant", SMSService.Participant)
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

    Public Function fnInsertSMSContentListInterview(ByVal SMSService As clsSMSService) As String
        Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
        Dim CandidateID As String
        CandidateID = ""
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertSMSContentListInterview", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@SMSContentList", SMSService.SMSContentList)
            cmd.Parameters.AddWithValue("@Participant", SMSService.Participant)
            cmd.Parameters.AddWithValue("@NotifiedBy", SMSService.NotifiedBy)
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

    Public Function fnInsertSMSContentList_SMS(ByVal SMSService As clsSMSService) As String
        Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SMSServiceConnectionString").ConnectionString)
        Dim CandidateID As String
        CandidateID = ""
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertSMSContentList_SMS", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@SMSContentList", SMSService.SMSContentList)
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

    Public Function fnGetPendingHRSSMS(ByVal SMSService As clsSMSService) As DataSet
        Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SMSServiceConnectionString").ConnectionString)

        Dim sp As String = "spGetPendingHRSSMS"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@Dept", SMSService.Dept)
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

    Public Function fnAcceptPendingHRSMS(ByVal SMSService As clsSMSService) As Integer
        Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SMSServiceConnectionString").ConnectionString)
        Try
            Dim cmd As SqlCommand = New SqlCommand("spAcceptPendingHRSMS", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@MessageIDList", SMSService.MessageIDList)
            cmd.Parameters.AddWithValue("@Dept", SMSService.Dept)
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

    Public Function fnRejectPendingHRSMS(ByVal SMSService As clsSMSService) As Integer
        Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SMSServiceConnectionString").ConnectionString)
        Try
            Dim cmd As SqlCommand = New SqlCommand("spRejectPendingHRSMS", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@MessageIDList", SMSService.MessageIDList)
            cmd.Parameters.AddWithValue("@Dept", SMSService.Dept)
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

    Public Function fnUpdateThrownSMS(ByVal MessageID As Int32, ByVal EventName As String) As Integer
        Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SMSServiceConnectionString").ConnectionString)
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateThrownSMS", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@MessageID", MessageID)
            cmd.Parameters.AddWithValue("@EventName", EventName)
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

    Public Function fnGetPendingSMSToThrow() As DataSet
        Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("SMSServiceConnectionString").ConnectionString)

        Dim sp As String = "spGetPendingSMSToThrow"
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

End Class
