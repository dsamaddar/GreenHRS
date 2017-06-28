Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data


Public Class clsEmployeeJDDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Update Employee JD Info  "

    Public Function fnUpdateEmpJDInfo(ByVal EmpJD As clsEmployeeJD) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateEmpJDInfo", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeJDID", EmpJD.EmployeeJDID)
            cmd.Parameters.AddWithValue("@IssueDate", EmpJD.IssueDate)
            cmd.Parameters.AddWithValue("@EffectiveDate", EmpJD.EffectiveDate)
            cmd.Parameters.AddWithValue("@IsActive", EmpJD.IsActive)
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

#Region " Get Emp JD By ID "

    Public Function fnGetEmpJDByID(ByVal EmployeeID As String) As DataSet
        Dim sp As String = "spGetEmpJDByID"
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

#Region " Get Emp JD By ID By Status "

    Public Function fnGetEmpJDByIDByStatus(ByVal EmployeeID As String, ByVal IsActive As Boolean) As DataSet
        Dim sp As String = "spGetEmpJDByIDByStatus"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                cmd.Parameters.AddWithValue("@IsActive", IsActive)
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

#Region " Emp JD Is Accepted "

    Public Function fnEmpJDIsAccepted(ByVal EmployeeJDID As String) As Boolean
        Dim cmd As SqlCommand = New SqlCommand("spEmpJDIsAccepted", con)
        Dim IsAccepted As Boolean = False
        Try
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeJDID", EmployeeJDID)
            Dim dr As SqlDataReader = cmd.ExecuteReader()

            While dr.Read()
                IsAccepted = dr.Item("IsAccepted")
            End While
            con.Close()
            Return IsAccepted
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return IsAccepted
        End Try
    End Function

#End Region

#Region " Chq Emp JD Already Assigned "

    Public Function fnChqEmpJDAlreadyAssigned(ByVal EmpJD As clsEmployeeJD) As Boolean
        Dim cmd As SqlCommand = New SqlCommand("spChqEmpJDAlreadyAssigned", con)
        Dim IsAccepted As Boolean = False
        Try
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", EmpJD.EmployeeID)
            cmd.Parameters.AddWithValue("@JobDescriptionID", EmpJD.JobDescriptionID)
            Dim dr As SqlDataReader = cmd.ExecuteReader()

            While dr.Read()
                IsAccepted = dr.Item("Assigned")
            End While
            cmd.ExecuteNonQuery()
            con.Close()
            Return IsAccepted
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return IsAccepted
        End Try
    End Function

#End Region

#Region " Get Emp Accepted JD "

    Public Function fnGetEmpAcceptedJD(ByVal EmployeeID As String) As DataSet
        Dim sp As String = "spGetEmpAcceptedJD"
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
