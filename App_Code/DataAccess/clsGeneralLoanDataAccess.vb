Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsGeneralLoanDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert General Loan "

    Public Function fnInsertGeneralLoan(ByVal GenLoan As clsGeneralLoan) As String
        Dim dr As SqlDataReader
        Dim GenLoanID As String = ""
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertGeneralLoan", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", GenLoan.EmployeeID)
            cmd.Parameters.AddWithValue("@BenefitTypeID", GenLoan.BenefitTypeID)
            cmd.Parameters.AddWithValue("@LoanAmount", GenLoan.LoanAmount)
            cmd.Parameters.AddWithValue("@ReimbursementDate", GenLoan.ReimbursementDate)
            cmd.Parameters.AddWithValue("@GenLoanType", GenLoan.GenLoanType)
            cmd.Parameters.AddWithValue("@IsInsuranceRequired", GenLoan.IsInsuranceRequired)
            cmd.Parameters.AddWithValue("@Attachment", GenLoan.Attachment)
            cmd.Parameters.AddWithValue("@Remarks", GenLoan.Remarks)
            cmd.Parameters.AddWithValue("@EntryBy", GenLoan.EntryBy)
            dr = cmd.ExecuteReader()
            While dr.Read()
                GenLoanID = dr.Item("GenLoanID")
            End While
            con.Close()

            Return GenLoanID
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return ""
        End Try
    End Function

#End Region

#Region " Show General Loan Info By Emp "

    Public Function fnShowGenLoanInfoByEmp(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spShowGenLoanInfoByEmp"
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


#Region " Get Gen Benefi tMail "

    Public Function fnGetGenBenefitMail(ByVal GeneralLoan As clsGeneralLoan) As clsMailProperty
        Dim sp As String = "spGetGenBenefitMail"
        Dim dr As SqlDataReader
        Dim MailProp As New clsMailProperty()
        Try
            con.Open()

            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@GenLoanID", GeneralLoan.GenLoanID)
                cmd.Parameters.AddWithValue("@PerformedByID", GeneralLoan.PerformedByID)
                cmd.Parameters.AddWithValue("@Remarks", GeneralLoan.Remarks)
                cmd.Parameters.AddWithValue("@EventName", GeneralLoan.EventName)
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

End Class
