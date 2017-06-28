Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsEmployementdataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

    Public Function fnGetEmploymentHistoryByID(ByVal ProposalID As String) As clsEmployement
        Dim Employement As New clsEmployement()
        Dim sp As String = "spGetEmployementInfoByID"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@ProposalID", ProposalID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    Employement.DepartmentID = dr.Item("DepartmentID")
                    Employement.LocationID = dr.Item("ULCBranchID")
                    Employement.PositionID = dr.Item("DesignationID")
                    Employement.EmployeeTypeID = dr.Item("EmployeeTypeID")
                    Employement.Remarks = dr.Item("Remarks")
                    Employement.ExpectedJoiningDate = dr.Item("ExpectedJoiningDate")
                End While
                con.Close()

                Return Employement
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

    Public Function fnGetEmploymentInfoByProposalID(ByVal ProposalID As String) As clsEmployement
        Dim Employement As New clsEmployement()
        Dim sp As String = "spGetEmploymentInfoByProposalID"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@ProposalID", ProposalID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    Employement.DepartmentID = dr.Item("DepartmentID")
                    Employement.LocationID = dr.Item("ULCBranchID")
                    Employement.PositionID = dr.Item("DesignationID")
                    Employement.Salary = dr.Item("Salary")
                    Employement.LocalConveyance = dr.Item("LocalConveyance")
                    Employement.EmployeeTypeID = dr.Item("EmployeeTypeID")
                    Employement.Remarks = dr.Item("Remarks")
                    Employement.ExpectedJoiningDate = dr.Item("ExpectedJoiningDate")
                    Employement.EffectiveFrom = dr.Item("EffectiveFrom")
                    Employement.EffectiveTo = dr.Item("EffectiveTo")
                    Employement.Period = dr.Item("Period")
                End While
                con.Close()

                Return Employement
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

    Public Function fnGetEmploymentInfoByProposalIDTemp(ByVal CandidateID As String) As clsEmployement
        Dim Employement As New clsEmployement()
        Dim sp As String = "spGetEmploymentInfoByProposalIDTemp"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    Employement.DepartmentID = dr.Item("DepartmentID")
                    Employement.LocationID = dr.Item("ULCBranchID")
                    Employement.PositionID = dr.Item("DesignationID")
                    Employement.Salary = dr.Item("Salary")
                    Employement.LocalConveyance = dr.Item("LocalConveyance")
                    Employement.EmployeeTypeID = dr.Item("EmployeeTypeID")
                    Employement.Remarks = dr.Item("Remarks")
                    Employement.ExpectedJoiningDate = dr.Item("ExpectedJoiningDate")
                    Employement.EffectiveFrom = dr.Item("EffectiveFrom")
                    Employement.EffectiveTo = dr.Item("EffectiveTo")
                    Employement.Period = dr.Item("Period")
                End While
                con.Close()

                Return Employement
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

    Public Function fnInsertEmployment(ByVal CandidateID As String, ByVal EmployeeType As String, ByVal JoiningDate As DateTime, ByVal EntryBy As String, ByVal ProposalID As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("InsertEmployeeBasicInfo", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
            cmd.Parameters.AddWithValue("@EmpTypeID", EmployeeType)
            cmd.Parameters.AddWithValue("@JoiningDate", JoiningDate)
            cmd.Parameters.AddWithValue("@EntryBy", EntryBy)
            cmd.Parameters.AddWithValue("@ProposalID", ProposalID)
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

End Class
