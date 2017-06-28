Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports dalConn

Public Class clsResourceReqDataAccess

#Region " Insert Resource Req "
    Public Function fnInsertResourceReq(ByVal ResReq As clsResourceReq) As clsMailProperty
        Dim conn As SqlConnection
        Dim dbconn As String
        Dim objDb As dalConn

        Dim dr As SqlDataReader
        Dim MailProp As New clsMailProperty()

        objDb = New dalConn()
        dbconn = objDb.connstr()
        conn = New SqlConnection(dbconn)

        Dim sp As String = "spInsertResourceReq"
        Try
            conn.Open()
            Using cmd = New SqlCommand(sp, conn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@RecruitmentTypeID", ResReq.RecruitmentTypeID)
                cmd.Parameters.AddWithValue("@ULCBranchID", ResReq.ULCBranchID)
                cmd.Parameters.AddWithValue("@ReqNoOfResource", ResReq.ReqNoOfResource)
                cmd.Parameters.AddWithValue("@Remarks", ResReq.Remarks)
                cmd.Parameters.AddWithValue("@SubmittedBy", ResReq.SubmittedBy)
                cmd.Parameters.AddWithValue("@EntryBy", ResReq.EntryBy)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    MailProp.MailSubject = dr.Item("MailSubject")
                    MailProp.MailBody = dr.Item("MailBody")
                    MailProp.MailFrom = dr.Item("MailFrom")
                    MailProp.MailTo = dr.Item("MailTo")
                    MailProp.MailCC = dr.Item("MailCC")
                    MailProp.MailBCC = dr.Item("MailBCC")
                End While
                conn.Close()

                Return MailProp
            End Using
        Catch ex As Exception
            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If
            Return Nothing
        End Try
    End Function
#End Region


#Region " Accept Resource Req "
    Public Function fnAcceptResourceReq(ByVal ResReq As clsResourceReq) As Integer
        Dim conn As SqlConnection
        Dim dbconn As String
        Dim objDb As dalConn
        objDb = New dalConn()
        dbconn = objDb.connstr()
        conn = New SqlConnection(dbconn)

        Dim sp As String = "spAcceptResourceReq"
        Try
            conn.Open()
            Using cmd = New SqlCommand(sp, conn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@ResourceReqID", ResReq.ResourceReqID)
                cmd.Parameters.AddWithValue("@ApproverID", ResReq.ApproverID)
                cmd.ExecuteNonQuery()
                conn.Close()
                Return 1
            End Using
        Catch ex As Exception
            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If
            Return 0
        End Try
    End Function

#End Region

#Region " Provide Support For Res Req "
    Public Function fnProvideSupportForResReq(ByVal ResReq As clsResourceReq) As Integer
        Dim conn As SqlConnection
        Dim dbconn As String
        Dim objDb As dalConn

        objDb = New dalConn()
        dbconn = objDb.connstr()
        conn = New SqlConnection(dbconn)

        Dim sp As String = "spProvideSupportForResReq"
        Try
            conn.Open()
            Using cmd = New SqlCommand(sp, conn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@ResourceReqID", ResReq.ResourceReqID)
                cmd.Parameters.AddWithValue("@ProvidedBy", ResReq.ProvidedBy)
                cmd.Parameters.AddWithValue("@ProviderRemarks", ResReq.ProviderRemarks)
                cmd.Parameters.AddWithValue("@ProvidedOn", ResReq.ProvidedOn)
                cmd.Parameters.AddWithValue("@ProvidedNoOfResource", ResReq.ProvidedNoOfResource)
                cmd.Parameters.AddWithValue("@ProvidedStatus", ResReq.ProvidedStatus)
                cmd.ExecuteNonQuery()
                conn.Close()
                Return 1
            End Using
        Catch ex As Exception
            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If
            Return 0
        End Try
    End Function
#End Region

    Public Function fnGetResourceReqByUser(ByVal SubmittedBy As String) As DataSet

        Dim sp As String = "spGetResourceReqByUser"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Dim conn As SqlConnection
        Dim dbconn As String
        Dim objDb As dalConn

        objDb = New dalConn()
        dbconn = objDb.connstr()
        conn = New SqlConnection(dbconn)
        Try
            conn.Open()
            Using cmd = New SqlCommand(sp, conn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@SubmittedBy", SubmittedBy)
                da.SelectCommand = cmd
                da.Fill(ds)
                conn.Close()

                Return ds
            End Using
        Catch ex As Exception
            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If
            Return Nothing
        End Try
    End Function

    Public Function fnGetResourceReq() As DataSet

        Dim sp As String = "spGetResourceReq"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Dim conn As SqlConnection
        Dim dbconn As String
        Dim objDb As dalConn

        objDb = New dalConn()
        dbconn = objDb.connstr()
        conn = New SqlConnection(dbconn)
        Try
            conn.Open()
            Using cmd = New SqlCommand(sp, conn)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                conn.Close()
                Return ds
            End Using
        Catch ex As Exception
            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If
            Return Nothing
        End Try
    End Function

    Public Function fnGetResourceReqForEmp(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spGetResourceReqForEmp"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Dim conn As SqlConnection
        Dim dbconn As String
        Dim objDb As dalConn

        objDb = New dalConn()
        dbconn = objDb.connstr()
        conn = New SqlConnection(dbconn)
        Try
            conn.Open()
            Using cmd = New SqlCommand(sp, conn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                da.SelectCommand = cmd
                da.Fill(ds)
                conn.Close()
                Return ds
            End Using
        Catch ex As Exception
            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If
            Return Nothing
        End Try
    End Function

    Public Function fnGetResourceReqByType(ByVal RecruitmentTypeID As String) As Integer
        Dim sp As String = "spGetResourceReqByType"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Dim conn As SqlConnection
        Dim dbconn As String
        Dim objDb As dalConn
        Dim ReqNoOfResource As Integer = 0

        objDb = New dalConn()
        dbconn = objDb.connstr()
        conn = New SqlConnection(dbconn)
        Dim dr As SqlDataReader
        Try
            conn.Open()
            Using cmd = New SqlCommand(sp, conn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@RecruitmentTypeID", RecruitmentTypeID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    ReqNoOfResource = dr.Item("ReqNoOfResource")
                End While
                conn.Close()
                Return ReqNoOfResource
            End Using
        Catch ex As Exception
            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If
            Return 0
        End Try
    End Function

    Public Function fnGetResReqSummaryReport() As DataSet

        Dim sp As String = "spGetResReqSummaryReport"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Dim conn As SqlConnection
        Dim dbconn As String
        Dim objDb As dalConn

        objDb = New dalConn()
        dbconn = objDb.connstr()
        conn = New SqlConnection(dbconn)
        Try
            conn.Open()
            Using cmd = New SqlCommand(sp, conn)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                conn.Close()
                Return ds
            End Using
        Catch ex As Exception
            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If
            Return Nothing
        End Try
    End Function

    Public Function fnGetRecTypeWiseReq(ByVal RequirementTypeID As String) As DataSet

        Dim sp As String = "spGetRecTypeWiseReq"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Dim conn As SqlConnection
        Dim dbconn As String
        Dim objDb As dalConn

        objDb = New dalConn()
        dbconn = objDb.connstr()
        conn = New SqlConnection(dbconn)
        Try
            conn.Open()
            Using cmd = New SqlCommand(sp, conn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@RequirementTypeID", RequirementTypeID)
                da.SelectCommand = cmd
                da.Fill(ds)
                conn.Close()
                Return ds
            End Using
        Catch ex As Exception
            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If
            Return Nothing
        End Try
    End Function

    Public Function fnGetResPoolReport() As DataSet

        Dim sp As String = "spGetResPoolReport"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Dim conn As SqlConnection
        Dim dbconn As String
        Dim objDb As dalConn

        objDb = New dalConn()
        dbconn = objDb.connstr()
        conn = New SqlConnection(dbconn)
        Try
            conn.Open()
            Using cmd = New SqlCommand(sp, conn)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                conn.Close()
                Return ds
            End Using
        Catch ex As Exception
            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If
            Return Nothing
        End Try
    End Function

    Public Function fnGetOffDesignationWiseROR(ByVal StartDate As DateTime, ByVal EndDate As DateTime) As DataSet

        Dim sp As String = "spGetOffDesignationWiseROR"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Dim conn As SqlConnection
        Dim dbconn As String
        Dim objDb As dalConn

        objDb = New dalConn()
        dbconn = objDb.connstr()
        conn = New SqlConnection(dbconn)
        Try
            conn.Open()
            Using cmd = New SqlCommand(sp, conn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@StartDate", StartDate)
                cmd.Parameters.AddWithValue("@EndDate", EndDate)
                da.SelectCommand = cmd
                da.Fill(ds)
                conn.Close()
                Return ds
            End Using
        Catch ex As Exception
            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If
            Return Nothing
        End Try
    End Function

    Public Function fnGetFuncDesignationWiseROR(ByVal StartDate As DateTime, ByVal EndDate As DateTime) As DataSet

        Dim sp As String = "spGetFuncDesignationWiseROR"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Dim conn As SqlConnection
        Dim dbconn As String
        Dim objDb As dalConn

        objDb = New dalConn()
        dbconn = objDb.connstr()
        conn = New SqlConnection(dbconn)
        Try
            conn.Open()
            Using cmd = New SqlCommand(sp, conn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@StartDate", StartDate)
                cmd.Parameters.AddWithValue("@EndDate", EndDate)
                da.SelectCommand = cmd
                da.Fill(ds)
                conn.Close()
                Return ds
            End Using
        Catch ex As Exception
            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If
            Return Nothing
        End Try
    End Function

    Public Function fnGetDepartmentWiseROR(ByVal StartDate As DateTime, ByVal EndDate As DateTime) As DataSet

        Dim sp As String = "spGetDepartmentWiseROR"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Dim conn As SqlConnection
        Dim dbconn As String
        Dim objDb As dalConn

        objDb = New dalConn()
        dbconn = objDb.connstr()
        conn = New SqlConnection(dbconn)
        Try
            conn.Open()
            Using cmd = New SqlCommand(sp, conn)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@StartDate", StartDate)
                cmd.Parameters.AddWithValue("@EndDate", EndDate)
                da.SelectCommand = cmd
                da.Fill(ds)
                conn.Close()
                Return ds
            End Using
        Catch ex As Exception
            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If
            Return Nothing
        End Try
    End Function

    Public Function fnGetOffDesignationWiseResource() As DataSet

        Dim sp As String = "spGetOffDesignationWiseResource"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Dim conn As SqlConnection
        Dim dbconn As String
        Dim objDb As dalConn

        objDb = New dalConn()
        dbconn = objDb.connstr()
        conn = New SqlConnection(dbconn)
        Try
            conn.Open()
            Using cmd = New SqlCommand(sp, conn)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                conn.Close()
                Return ds
            End Using
        Catch ex As Exception
            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If
            Return Nothing
        End Try
    End Function

    Public Function fnGetFuncDesignationWiseResource() As DataSet

        Dim sp As String = "spGetFuncDesignationWiseResource"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Dim conn As SqlConnection
        Dim dbconn As String
        Dim objDb As dalConn

        objDb = New dalConn()
        dbconn = objDb.connstr()
        conn = New SqlConnection(dbconn)
        Try
            conn.Open()
            Using cmd = New SqlCommand(sp, conn)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                conn.Close()
                Return ds
            End Using
        Catch ex As Exception
            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If
            Return Nothing
        End Try
    End Function

    Public Function fnGetDeptWiseResource() As DataSet

        Dim sp As String = "spGetDeptWiseResource"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Dim conn As SqlConnection
        Dim dbconn As String
        Dim objDb As dalConn

        objDb = New dalConn()
        dbconn = objDb.connstr()
        conn = New SqlConnection(dbconn)
        Try
            conn.Open()
            Using cmd = New SqlCommand(sp, conn)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                conn.Close()
                Return ds
            End Using
        Catch ex As Exception
            If conn.State = ConnectionState.Open Then
                conn.Close()
            End If
            Return Nothing
        End Try
    End Function

End Class
