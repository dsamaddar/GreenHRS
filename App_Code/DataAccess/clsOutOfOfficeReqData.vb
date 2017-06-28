Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsOutOfOfficeReqData

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Out Of Office Req "

    Public Function fnInsertOutOfOfficeReq(ByVal OutOfOfficeReq As clsOutOfficeReq) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertOutOfOfficeReq", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", OutOfOfficeReq.EmployeeID)
            cmd.Parameters.AddWithValue("@LateAttCauseID", OutOfOfficeReq.LateAttCauseID)
            cmd.Parameters.AddWithValue("@DateFrom", OutOfOfficeReq.DateFrom)
            cmd.Parameters.AddWithValue("@DateTo", OutOfOfficeReq.DateTo)
            cmd.Parameters.AddWithValue("@Remarks", OutOfOfficeReq.Remarks)
            cmd.Parameters.AddWithValue("@Attachment", OutOfOfficeReq.Attachment)
            cmd.Parameters.AddWithValue("@EntryBy", OutOfOfficeReq.EntryBy)
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

#Region " Approve Out Of Office Req "

    Public Function fnApproveOutOfOfficeReq(ByVal OutOfOfficeReq As clsOutOfficeReq) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spApproveOutOfOfficeReq", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@OutOfOfficeReqID", OutOfOfficeReq.OutOfOfficeReqID)
            cmd.Parameters.AddWithValue("@ApproverRemarks", OutOfOfficeReq.ApproverRemarks)
            cmd.Parameters.AddWithValue("@EventName", OutOfOfficeReq.EventName)
            cmd.Parameters.AddWithValue("@EntryBy", OutOfOfficeReq.EntryBy)
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

#Region " Out Of Office Req. Submitted "

    Public Function fnGetOutOfOfficeReqSubmitted(ByVal OutOfOfficeReq As clsOutOfficeReq) As clsMailProperty
        Dim sp As String = "spGetOutOfOfficeReqSubmitted"
        Dim dr As SqlDataReader
        Dim MailProp As New clsMailProperty()
        Try
            con.Open()

            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", OutOfOfficeReq.EmployeeID)
                cmd.Parameters.AddWithValue("@DateFrom", OutOfOfficeReq.DateFrom)
                cmd.Parameters.AddWithValue("@DateTo", OutOfOfficeReq.DateTo)
                cmd.Parameters.AddWithValue("@LateAttCauseID", OutOfOfficeReq.LateAttCauseID)
                cmd.Parameters.AddWithValue("@Remarks", OutOfOfficeReq.Remarks)
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

#End Region

#Region " Get Out Of Office Req Approved Mail "

    Public Function fnGetOutOfOfficeReqApprovedMail(ByVal OutOfOfficeReq As clsOutOfficeReq) As clsMailProperty
        Dim sp As String = "spGetOutOfOfficeReqApprovedMail"
        Dim dr As SqlDataReader
        Dim MailProp As New clsMailProperty()
        Try
            con.Open()

            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@OutOfOfficeReqID", OutOfOfficeReq.OutOfOfficeReqID)
                cmd.Parameters.AddWithValue("@ApproverRemarks", OutOfOfficeReq.ApproverRemarks)
                cmd.Parameters.AddWithValue("@EventName", OutOfOfficeReq.EventName)
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

#End Region


#Region " Get Pending Out Of Office Req "

    Public Function fnGetPendingOutOfOfficeReq(ByVal ApproverID As String) As DataSet
        Dim sp As String = "spGetPendingOutOfOfficeReq"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@ApproverID", ApproverID)
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

#Region " Get Out Of Office Req By User "

    Public Function fnGetOutOfOfficeReqByUser(ByVal EmployeeID As String) As DataSet
        Dim sp As String = "spGetOutOfOfficeReqByUser"
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

#End Region

End Class
