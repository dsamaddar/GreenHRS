Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsVehicleBenefitDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Vehicle Benefit "

    Public Function fnInsertVehicleBenefit(ByVal VehicleBenefit As clsVehicleBenefit) As String
        Dim dr As SqlDataReader
        Dim VehicleBenefitID As String = ""
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertVehicleBenefit", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", VehicleBenefit.EmployeeID)
            cmd.Parameters.AddWithValue("@BenefitTypeID", VehicleBenefit.BenefitTypeID)
            cmd.Parameters.AddWithValue("@VehicleType", VehicleBenefit.VehicleType)
            cmd.Parameters.AddWithValue("@VehicleCondition", VehicleBenefit.VehicleCondition)
            cmd.Parameters.AddWithValue("@Brand", VehicleBenefit.Brand)
            cmd.Parameters.AddWithValue("@YearModel", VehicleBenefit.YearModel)
            cmd.Parameters.AddWithValue("@EngineNo", VehicleBenefit.EngineNo)
            cmd.Parameters.AddWithValue("@ChasisNo", VehicleBenefit.ChasisNo)
            cmd.Parameters.AddWithValue("@CurrentOwner", VehicleBenefit.CurrentOwner)
            cmd.Parameters.AddWithValue("@PreviousOwner", VehicleBenefit.PreviousOwner)
            cmd.Parameters.AddWithValue("@OwnershipTransferDate", VehicleBenefit.OwnershipTransferDate)
            cmd.Parameters.AddWithValue("@VehicleCost", VehicleBenefit.VehicleCost)
            cmd.Parameters.AddWithValue("@LoanAmount", VehicleBenefit.LoanAmount)
            cmd.Parameters.AddWithValue("@InstallmentAmnt", VehicleBenefit.InstallmentAmnt)
            cmd.Parameters.AddWithValue("@RegistrationNo", VehicleBenefit.RegistrationNo)
            cmd.Parameters.AddWithValue("@RegistrationDate", VehicleBenefit.RegistrationDate)
            cmd.Parameters.AddWithValue("@RemarksOnVehicle", VehicleBenefit.RemarksOnVehicle)
            cmd.Parameters.AddWithValue("@ReimbursementDate", VehicleBenefit.ReimbursementDate)
            cmd.Parameters.AddWithValue("@VehicleAttachment", VehicleBenefit.VehicleAttachment)
            cmd.Parameters.AddWithValue("@IsInsuranceRequired", VehicleBenefit.IsInsuranceRequired)
            cmd.Parameters.AddWithValue("@EntryBy", VehicleBenefit.EntryBy)
            dr = cmd.ExecuteReader()
            While dr.Read()
                VehicleBenefitID = dr.Item("VehicleBenefitID")
            End While
            con.Close()

            Return VehicleBenefitID
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return ""
        End Try
    End Function

#End Region

#Region " Show Vehicle Benefit By ID "
    Public Function fnShowVehicleBenefitByID(ByVal VehicleBenefit As clsVehicleBenefit) As clsVehicleBenefit

        Dim sp As String = "spShowVehicleBenefitByID"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@VehicleBenefitID", VehicleBenefit.VehicleBenefitID)
                dr = cmd.ExecuteReader()

                While dr.Read()
                    VehicleBenefit.VehicleType = dr.Item("VehicleType")
                    VehicleBenefit.Brand = dr.Item("Brand")
                    VehicleBenefit.YearModel = dr.Item("YearModel")
                    VehicleBenefit.EngineNo = dr.Item("EngineNo")
                    VehicleBenefit.ChasisNo = dr.Item("ChasisNo")
                    VehicleBenefit.CurrentOwner = dr.Item("CurrentOwner")
                    VehicleBenefit.PreviousOwner = dr.Item("PreviousOwner")
                    VehicleBenefit.OwnershipTransferDate = dr.Item("OwnershipTransferDate")
                    VehicleBenefit.VehicleCost = dr.Item("VehicleCost")
                    VehicleBenefit.RegistrationNo = dr.Item("RegistrationNo")
                    VehicleBenefit.RegistrationDate = dr.Item("RegistrationDate")
                    VehicleBenefit.RemarksOnVehicle = dr.Item("RemarksOnVehicle")
                    VehicleBenefit.ReimbursementDate = dr.Item("ReimbursementDate")
                    VehicleBenefit.VehicleAttachment = dr.Item("VehicleAttachment")
                    VehicleBenefit.IsInsuranceRequired = dr.Item("IsInsuranceRequired")
                End While
                Return VehicleBenefit
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Show Vehicle Benefit By EmpID "

    Public Function fnShowVehicleBenefitByEmpID(ByVal EmployeeID As String) As DataSet
        Dim sp As String = "spShowVehicleBenefitByEmpID"
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


#Region " Get Vehicle Benefit Mail "

    Public Function fnGetVehicleBenefitMail(ByVal VehicleBenefit As clsVehicleBenefit) As clsMailProperty
        Dim sp As String = "spGetVehicleBenefitMail"
        Dim dr As SqlDataReader
        Dim MailProp As New clsMailProperty()
        Try
            con.Open()

            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@VehicleBenefitID", VehicleBenefit.VehicleBenefitID)
                cmd.Parameters.AddWithValue("@PerformedByID", VehicleBenefit.PerformedByID)
                cmd.Parameters.AddWithValue("@Remarks", VehicleBenefit.Remarks)
                cmd.Parameters.AddWithValue("@EventName", VehicleBenefit.EventName)
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
