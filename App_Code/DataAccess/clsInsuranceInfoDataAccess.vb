Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsInsuranceInfoDataAccess
    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

    Public Function fnInsertInsuranceInfo(ByVal InsuranceInfo As clsInsuranceInfo) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertInsuranceInfo", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", InsuranceInfo.EmployeeID)
            cmd.Parameters.AddWithValue("@EmpLoanAccountID", InsuranceInfo.EmpLoanAccountID)
            cmd.Parameters.AddWithValue("@BenefitID", InsuranceInfo.BenefitID)
            cmd.Parameters.AddWithValue("@InsuranceType", InsuranceInfo.InsuranceType)
            cmd.Parameters.AddWithValue("@InsuranceWith", InsuranceInfo.InsuranceWith)
            cmd.Parameters.AddWithValue("@InsuranceNo", InsuranceInfo.InsuranceNo)
            cmd.Parameters.AddWithValue("@InsuredValue", InsuranceInfo.InsuredValue)
            cmd.Parameters.AddWithValue("@InsuranceStartDate", InsuranceInfo.InsuranceStartDate)
            cmd.Parameters.AddWithValue("@InsuranceRenewalDate", InsuranceInfo.InsuranceRenewalDate)
            cmd.Parameters.AddWithValue("@InsuranceAttachment", InsuranceInfo.InsuranceAttachment)
            cmd.Parameters.AddWithValue("@EntryBy", InsuranceInfo.EntryBy)
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

    Public Function fnUpdateInsuranceInfo(ByVal InsuranceInfo As clsInsuranceInfo) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateInsuranceInfo", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@InsuranceID", InsuranceInfo.InsuranceID)
            cmd.Parameters.AddWithValue("@EmployeeID", InsuranceInfo.EmployeeID)
            cmd.Parameters.AddWithValue("@BenefitID", InsuranceInfo.BenefitID)
            cmd.Parameters.AddWithValue("@InsuranceType", InsuranceInfo.InsuranceType)
            cmd.Parameters.AddWithValue("@InsuranceWith", InsuranceInfo.InsuranceWith)
            cmd.Parameters.AddWithValue("@InsuranceNo", InsuranceInfo.InsuranceNo)
            cmd.Parameters.AddWithValue("@InsuredValue", InsuranceInfo.InsuredValue)
            cmd.Parameters.AddWithValue("@InsuranceStartDate", InsuranceInfo.InsuranceStartDate)
            cmd.Parameters.AddWithValue("@InsuranceRenewalDate", InsuranceInfo.InsuranceRenewalDate)
            cmd.Parameters.AddWithValue("@InsuranceAttachment", InsuranceInfo.InsuranceAttachment)
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

    Public Function fnShowInsuranceInfoByID(ByVal InsuranceInfo As clsInsuranceInfo) As clsInsuranceInfo
        Dim sp As String = "spShowInsuranceInfoByID"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@InsuranceID", InsuranceInfo.InsuranceID)
                dr = cmd.ExecuteReader()

                While dr.Read()
                    InsuranceInfo.BenefitID = dr.Item("BenefitID")
                    InsuranceInfo.InsuranceType = dr.Item("InsuranceType")
                    InsuranceInfo.InsuranceWith = dr.Item("InsuranceWith")
                    InsuranceInfo.InsuranceNo = dr.Item("InsuranceNo")
                    InsuranceInfo.InsuredValue = dr.Item("InsuredValue")
                    InsuranceInfo.InsuranceStartDate = dr.Item("InsuranceStartDate")
                    InsuranceInfo.InsuranceRenewalDate = dr.Item("InsuranceRenewalDate")
                    InsuranceInfo.InsuranceAttachment = dr.Item("InsuranceAttachment")
                End While
                Return InsuranceInfo
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try

    End Function

    Public Function fnShowInsuranceInfoByLoanAccID(ByVal EmpLoanAccountID As String) As DataSet
        Dim sp As String = "spShowInsuranceInfoByLoanAccID"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmpLoanAccountID", EmpLoanAccountID)
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
