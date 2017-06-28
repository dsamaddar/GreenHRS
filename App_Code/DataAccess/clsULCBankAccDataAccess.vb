Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsULCBankAccDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert ULC Bank Account "

    Public Function fnInsertULCBankAccount(ByVal ULCBankAcc As clsULCBankAccount) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertULCBankAccount", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@BankID", ULCBankAcc.BankID)
            cmd.Parameters.AddWithValue("@BranchID", ULCBankAcc.BranchID)
            cmd.Parameters.AddWithValue("@AccountNo", ULCBankAcc.AccountNo)
            cmd.Parameters.AddWithValue("@AccountCode", ULCBankAcc.AccountCode)
            cmd.Parameters.AddWithValue("@AccountType", ULCBankAcc.AccountType)
            cmd.Parameters.AddWithValue("@AddressingPerson", ULCBankAcc.AddressingPerson)
            cmd.Parameters.AddWithValue("@Address_HouseNo", ULCBankAcc.Address_HouseNo)
            cmd.Parameters.AddWithValue("@Address_RoadNo", ULCBankAcc.Address_RoadNo)
            cmd.Parameters.AddWithValue("@Address_Post", ULCBankAcc.Address_Post)
            cmd.Parameters.AddWithValue("@IsActive", ULCBankAcc.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", ULCBankAcc.EntryBy)

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

#Region " Update ULC Bank Account "

    Public Function fnUpdateULCBankAccount(ByVal ULCBankAcc As clsULCBankAccount) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateULCBankAccount", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ULCBankAccID", ULCBankAcc.ULCBankAccID)
            cmd.Parameters.AddWithValue("@BankID", ULCBankAcc.BankID)
            cmd.Parameters.AddWithValue("@BranchID", ULCBankAcc.BranchID)
            cmd.Parameters.AddWithValue("@AccountNo", ULCBankAcc.AccountNo)
            cmd.Parameters.AddWithValue("@AccountCode", ULCBankAcc.AccountCode)
            cmd.Parameters.AddWithValue("@AccountType", ULCBankAcc.AccountType)
            cmd.Parameters.AddWithValue("@AddressingPerson", ULCBankAcc.AddressingPerson)
            cmd.Parameters.AddWithValue("@Address_HouseNo", ULCBankAcc.Address_HouseNo)
            cmd.Parameters.AddWithValue("@Address_RoadNo", ULCBankAcc.Address_RoadNo)
            cmd.Parameters.AddWithValue("@Address_Post", ULCBankAcc.Address_Post)
            cmd.Parameters.AddWithValue("@IsActive", ULCBankAcc.IsActive)

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

#Region " Show ULC Bank Account List "

    Public Function fnShowULCBankAccountList() As DataSet

        Dim sp As String = "spShowULCBankAccountList"
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

#Region " Show ULC Bank Acc "

    Public Function fnShowULCBankAcc() As DataSet

        Dim sp As String = "spShowULCBankAcc"
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

#Region " Get Export Report Name "

    Public Function fnGetExportReportName(ByVal ULCBankAccID As String) As String

        Dim sp As String = "spGetExportReportName"
        Dim dr As SqlDataReader
        Dim ReportName As String = ""
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@ULCBankAccID", ULCBankAccID)

                dr = cmd.ExecuteReader()

                While dr.Read()
                    ReportName = dr.Item("ReportName")
                End While

                con.Close()

                Return ReportName
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
