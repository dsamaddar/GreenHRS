Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsMobileBenefitDataAccess
    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)


    Public Function fnInsertMobileBenefit(ByVal MobileBenefit As clsMobileBenefit) As String
        Dim dr As SqlDataReader
        Dim MobileBenefitID As String = ""
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertMobileBenefit", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", MobileBenefit.EmployeeID)
            cmd.Parameters.AddWithValue("@BenefitTypeID", MobileBenefit.BenefitTypeID)
            cmd.Parameters.AddWithValue("@IMEINo", MobileBenefit.IMEINo)
            cmd.Parameters.AddWithValue("@Brand", MobileBenefit.Brand)
            cmd.Parameters.AddWithValue("@ModelNo", MobileBenefit.ModelNo)
            cmd.Parameters.AddWithValue("@MobileCost", MobileBenefit.MobileCost)
            cmd.Parameters.AddWithValue("@SIMNo", MobileBenefit.SIMNo)
            cmd.Parameters.AddWithValue("@DateOfPurchse", MobileBenefit.DateOfPurchse)
            cmd.Parameters.AddWithValue("@DateOfReimbursement", MobileBenefit.DateOfReimbursement)
            cmd.Parameters.AddWithValue("@MobileAttachment", MobileBenefit.MobileAttachment)
            cmd.Parameters.AddWithValue("@RemarksOnMobile", MobileBenefit.RemarksOnMobile)
            cmd.Parameters.AddWithValue("@IsInsuranceRequired", MobileBenefit.IsInsuranceRequired)
            cmd.Parameters.AddWithValue("@Entitlement", MobileBenefit.Entitlement)
            cmd.Parameters.AddWithValue("@EntryBy", MobileBenefit.EntryBy)
            dr = cmd.ExecuteReader()
            While dr.Read()
                MobileBenefitID = dr.Item("MobileBenefitID")
            End While
            con.Close()

            Return MobileBenefitID
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return ""
        End Try
    End Function

    Public Function fnUpdateMobileBenefit(ByVal MobileBenefit As clsMobileBenefit) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateMobileBenefit", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@MobileBenefitID", MobileBenefit.MobileBenefitID)
            cmd.Parameters.AddWithValue("@EmployeeID", MobileBenefit.EmployeeID)
            cmd.Parameters.AddWithValue("@IMEINo", MobileBenefit.IMEINo)
            cmd.Parameters.AddWithValue("@Brand", MobileBenefit.Brand)
            cmd.Parameters.AddWithValue("@ModelNo", MobileBenefit.ModelNo)
            cmd.Parameters.AddWithValue("@MobileCost", MobileBenefit.MobileCost)
            cmd.Parameters.AddWithValue("@SIMNo", MobileBenefit.SIMNo)
            cmd.Parameters.AddWithValue("@DateOfPurchse", MobileBenefit.DateOfPurchse)
            cmd.Parameters.AddWithValue("@DateOfReimbursement", MobileBenefit.DateOfReimbursement)
            cmd.Parameters.AddWithValue("@MobileAttachment", MobileBenefit.MobileAttachment)
            cmd.Parameters.AddWithValue("@RemarksOnMobile", MobileBenefit.RemarksOnMobile)
            cmd.Parameters.AddWithValue("@IsInsuranceRequired", MobileBenefit.IsInsuranceRequired)
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

    Public Function fnShowMobileBenefit() As DataSet
        Dim sp As String = "spShowMobileBenefit"
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

    Public Function fnShowMobileBenefitByID(ByVal MobileBenefit As clsMobileBenefit) As clsMobileBenefit

        Dim sp As String = "spShowMobileBenefitByID"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@MobileBenefitID", MobileBenefit.MobileBenefitID)
                dr = cmd.ExecuteReader()

                While dr.Read()
                    MobileBenefit.IMEINo = dr.Item("IMEINo")
                    MobileBenefit.Brand = dr.Item("Brand")
                    MobileBenefit.ModelNo = dr.Item("ModelNo")
                    MobileBenefit.MobileCost = dr.Item("MobileCost")
                    MobileBenefit.SIMNo = dr.Item("SIMNo")
                    MobileBenefit.DateOfPurchse = dr.Item("DateOfPurchse")
                    MobileBenefit.DateOfReimbursement = dr.Item("DateOfReimbursement")
                    MobileBenefit.MobileAttachment = dr.Item("MobileAttachment")
                    MobileBenefit.RemarksOnMobile = dr.Item("RemarksOnMobile")
                    MobileBenefit.EntryBy = dr.Item("EntryBy")
                    MobileBenefit.EntryDate = dr.Item("EntryDate")
                    MobileBenefit.IsInsuranceRequired = dr.Item("IsInsuranceRequired")
                End While
                Return MobileBenefit
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try

    End Function

    Public Function fnShowExisingMobileByEmpID(ByVal EmployeeID As String) As DataSet
        Dim sp As String = "spShowMobileBenefitByEmpID"
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

#Region " Get Mobile Benefit Mail "

    Public Function fnGetMobileBenefitMail(ByVal MobileBenefit As clsMobileBenefit) As clsMailProperty
        Dim sp As String = "spGetMobileBenefitMail"
        Dim dr As SqlDataReader
        Dim MailProp As New clsMailProperty()
        Try
            con.Open()

            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@MobileBenefitID", MobileBenefit.MobileBenefitID)
                cmd.Parameters.AddWithValue("@PerformedByID", MobileBenefit.PerformedByID)
                cmd.Parameters.AddWithValue("@Remarks", MobileBenefit.Remarks)
                cmd.Parameters.AddWithValue("@EventName", MobileBenefit.EventName)
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

    Public Function fnGetMobileEntitlementRpt(ByVal DateFrom As DateTime, ByVal DateTo As DateTime) As DataSet
        Dim sp As String = "spGetMobileEntitlementRpt"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@DateFrom", DateFrom)
                cmd.Parameters.AddWithValue("@DateTo", DateTo)
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
