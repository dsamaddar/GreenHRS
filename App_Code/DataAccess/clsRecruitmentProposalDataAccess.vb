Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsRecruitmentProposalDataAccess


    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Recruitment Proposal "
    Public Function fnInsertRecruitmentProposal(ByVal RecruitmentProp As clsRecruitmentProposal) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertRecruitmentProposal", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@IntCandidateID", RecruitmentProp.IntCandidateID)
            cmd.Parameters.AddWithValue("@CandidateID", RecruitmentProp.CandidateID)
            cmd.Parameters.AddWithValue("@CircularID", RecruitmentProp.CircularID)
            cmd.Parameters.AddWithValue("@DepartmentID", RecruitmentProp.DepartmentID)
            cmd.Parameters.AddWithValue("@ULCBranchID", RecruitmentProp.ULCBranchID)
            cmd.Parameters.AddWithValue("@DesignationID", RecruitmentProp.DesignationID)
            cmd.Parameters.AddWithValue("@EmployeeTypeID", RecruitmentProp.EmployeeTypeID)
            cmd.Parameters.AddWithValue("@Salary", RecruitmentProp.Salary)
            cmd.Parameters.AddWithValue("@ExpectedJoiningDate", RecruitmentProp.ExpectedJoiningDate)
            cmd.Parameters.AddWithValue("@EffectiveFrom", RecruitmentProp.EffectiveFrom)
            cmd.Parameters.AddWithValue("@Remarks", RecruitmentProp.Remarks)
            cmd.Parameters.AddWithValue("@EntryBy", RecruitmentProp.EntryBy)

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

#Region " Not Joined Candidate "
    Public Function fnNotJoinedCandidate(ByVal CandidateID As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spNotJoinedCandidate", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@CandidateID", CandidateID)
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

#Region " Reverse Not Joined Proposal "
    Public Function fnReverseNotJoinedProposal(ByVal ProposalID As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spReverseNotJoinedProposal", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
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
#End Region

#Region " Remove Recruitment Proposal "
    Public Function fnRemoveRecruitmentProposal(ByVal ProposalID As String) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spRemoveRecruitmentProposal", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
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
#End Region

End Class
