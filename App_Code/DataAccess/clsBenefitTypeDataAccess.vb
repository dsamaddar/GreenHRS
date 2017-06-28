Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data


Public Class clsBenefitTypeDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Benefit Type "

    Public Function fnInsertBenefitType(ByVal BenefitType As clsBenefitType) As clsResult
        Dim Result As New clsResult()
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertBenefitType", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@BenefitType", BenefitType.BenefitType)
            cmd.Parameters.AddWithValue("@BenefitCode", BenefitType.BenefitCode)
            cmd.Parameters.AddWithValue("@AccountCode", BenefitType.AccountCode)
            cmd.Parameters.AddWithValue("@InterestRate", BenefitType.InterestRate)
            cmd.Parameters.AddWithValue("@DepreciationYear", BenefitType.DepreciationYear)
            cmd.Parameters.AddWithValue("@IsAdjustableFromSalary", BenefitType.IsAdjustableFromSalary)
            cmd.Parameters.AddWithValue("@IsAbatementApplicable", BenefitType.IsAbatementApplicable)
            cmd.Parameters.AddWithValue("@IsDepreciatedAutomatically", BenefitType.IsDepreciatedAutomatically)
            cmd.Parameters.AddWithValue("@PrimaryApprover", BenefitType.PrimaryApprover)
            cmd.Parameters.AddWithValue("@ApproverID", BenefitType.ApproverID)
            cmd.Parameters.AddWithValue("@IsActive", BenefitType.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", BenefitType.EntryBy)

            cmd.ExecuteNonQuery()
            con.Close()
            Result.Success = True
            Result.Message = "Inserted Successfully."
            Return Result
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Result.Success = False
            Result.Message = "Error Found" & ex.Message
            Return Result
        End Try
    End Function

#End Region

#Region " Update Benefit Type "

    Public Function fnUpdateBenefitType(ByVal BenefitType As clsBenefitType) As clsResult
        Dim Result As New clsResult()
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateBenefitType", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@BenefitTypeID", BenefitType.BenefitTypeID)
            cmd.Parameters.AddWithValue("@BenefitType", BenefitType.BenefitType)
            cmd.Parameters.AddWithValue("@BenefitCode", BenefitType.BenefitCode)
            cmd.Parameters.AddWithValue("@AccountCode", BenefitType.AccountCode)
            cmd.Parameters.AddWithValue("@InterestRate", BenefitType.InterestRate)
            cmd.Parameters.AddWithValue("@DepreciationYear", BenefitType.DepreciationYear)
            cmd.Parameters.AddWithValue("@IsAdjustableFromSalary", BenefitType.IsAdjustableFromSalary)
            cmd.Parameters.AddWithValue("@IsAbatementApplicable", BenefitType.IsAbatementApplicable)
            cmd.Parameters.AddWithValue("@IsDepreciatedAutomatically", BenefitType.IsDepreciatedAutomatically)
            cmd.Parameters.AddWithValue("@PrimaryApprover", BenefitType.PrimaryApprover)
            cmd.Parameters.AddWithValue("@ApproverID", BenefitType.ApproverID)
            cmd.Parameters.AddWithValue("@IsActive", BenefitType.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", BenefitType.EntryBy)

            cmd.ExecuteNonQuery()
            con.Close()
            Result.Success = True
            Result.Message = "Updated Successfully."
            Return Result
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Result.Success = False
            Result.Message = "Error Found" & ex.Message
            Return Result
        End Try

    End Function

#End Region

#Region " Show Benefit Details "

    Public Function fnShowBenefitDetails() As DataSet

        Dim sp As String = "spShowBenefitDetails"
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

    Public Function fnGetBenefityTypeInfoByID(ByVal BenefitTypeID As String) As clsBenefitType
        Dim BenType As New clsBenefitType()
        Dim sp As String = "spGetBenefityTypeInfoByID"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@BenefitTypeID", BenefitTypeID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    BenType.InterestRate = dr.Item("InterestRate")
                    BenType.DepreciationYear = dr.Item("DepreciationYear")
                    BenType.IsAdjustableFromSalary = dr.Item("IsAdjustableFromSalary")
                    BenType.IsAbatementApplicable = dr.Item("IsAbatementApplicable")
                    BenType.IsDepreciatedAutomatically = dr.Item("IsDepreciatedAutomatically")
                End While
                con.Close()
                Return BenType
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#Region " Get Benefit List "

    Public Function fnGetBenefitList() As DataSet

        Dim sp As String = "spGetBenefitList"
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

End Class
