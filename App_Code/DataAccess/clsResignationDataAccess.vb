Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data


Public Class clsResignationDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Resignation Information "
    Public Function fnInsertResignationInfo(ByVal Resignation As clsResignation) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertResignationInfo", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", Resignation.EmployeeID)
            cmd.Parameters.AddWithValue("@EffectiveDate", Resignation.EffectiveDate)
            cmd.Parameters.AddWithValue("@ReasonOfResignation", Resignation.ReasonOfResignation)
            cmd.Parameters.AddWithValue("@FeedbackAboutCompany", Resignation.FeedbackAboutCompany)
            cmd.Parameters.AddWithValue("@EntryBy", Resignation.EntryBy)
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

#Region " Supervisor Accept Resignation "

    Public Function fnSupervisorAcceptResignation(ByVal Resignation As clsResignation) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spSupervisorAcceptResignation", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ResignationID", Resignation.ResignationID)
            cmd.Parameters.AddWithValue("@ProposedEffectiveDate", Resignation.ProposedEffectiveDate)
            cmd.Parameters.AddWithValue("@SupervisorComment", Resignation.SupervisorComment)
            cmd.Parameters.AddWithValue("@Status", Resignation.Status)
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

#Region " HR Accept Resignation "

    Public Function fnHRAcceptResignation(ByVal Resignation As clsResignation) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spHRAcceptResignation", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ResignationID", Resignation.ResignationID)
            cmd.Parameters.AddWithValue("@Status", Resignation.Status)
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

#Region " Show Resignation Info "

    Public Function fnShowResignationInfo(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spShowResignationInfo"
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

#Region " Get Submitted Resig By Emp ID "

    Public Function fnGetSubmittedResigByEmpID(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spGetSubmittedResigByEmpID"
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

#Region " Get HR Pending Resignation Request "

    Public Function fnGetHRPendingResignationRequest() As DataSet

        Dim sp As String = "spGetHRPendingResignationRequest"
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

#Region " Get Resignation Details "

    Public Function fnGetResignationDetails(ByVal Resignation As clsResignation) As clsResignation

        Dim sp As String = "spGetResignationDetails"
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@ResignationID", Resignation.ResignationID)
                Dim dr As SqlDataReader = cmd.ExecuteReader()
                While dr.Read()
                    Resignation.ResignationID = dr.Item("ResignationID")
                    Resignation.EmployeeID = dr.Item("EmployeeID")
                    Resignation.EmployeeName = dr.Item("EmployeeName")
                    Resignation.Photo = dr.Item("Photo")
                    Resignation.EmpCode = dr.Item("EmpCode")
                    Resignation.Department = dr.Item("Department")
                    Resignation.Supervisor = dr.Item("Supervisor")
                    Resignation.Branch = dr.Item("Branch")
                    Resignation.DateOfJoining = dr.Item("DateOfJoining")
                    Resignation.DateOfConfirmation = dr.Item("DateOfConfirmation")
                    Resignation.DateOfBirth = dr.Item("DateOfBirth")
                    Resignation.EffectiveDate = dr.Item("EffectiveDate")
                    Resignation.ProposedEffectiveDate = dr.Item("ProposedEffectiveDate")
                    Resignation.ReasonOfResignation = dr.Item("ReasonOfResignation")
                    Resignation.FeedbackAboutCompany = dr.Item("FeedbackAboutCompany")
                    Resignation.SupervisorComment = dr.Item("SupervisorComment")
                End While
                con.Close()
                Return Resignation

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
