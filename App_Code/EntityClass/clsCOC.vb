Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data


Public Class clsCOC

    Dim _BasicSalary, _HouseRent, _TransportAllowance, _Salary, _PFContribution, _FestivalComponent, _MobileAllowance, _
    _LocalConveyance, _MedicalAllowance, _MotorbikeAllowance, _SpecialAllowance, _
    _DriverAllowance, _VehicleMaintenance, _CarSubsidy, _FuelAllowance, _Benefits, _TotalTransport, _TotalCashComo, _TotalNonCashComp As Double

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

    Public Property Benefits() As Double
        Get
            Return FestivalComponent + MedicalAllowance + LocalConveyance + MotorbikeAllowance + SpecialAllowance
        End Get
        Set(ByVal value As Double)
            _Benefits = value
        End Set
    End Property

    Public Property TotalTransport() As Double
        Get
            Return FuelAllowance + DriverAllowance + VehicleMaintenance + CarSubsidy
        End Get
        Set(ByVal value As Double)
            _TotalTransport = value
        End Set
    End Property

    Public Property TotalCashComp() As Double
        Get
            Return Benefits + TotalTransport + Salary + FestivalComponent
        End Get
        Set(ByVal value As Double)
            _TotalCashComo = value
        End Set
    End Property

    Public Property BasicSalary() As Double
        Get
            Return _BasicSalary
        End Get
        Set(ByVal value As Double)
            _BasicSalary = value
        End Set
    End Property

    Public Property HouseRent() As Double
        Get
            Return _HouseRent
        End Get
        Set(ByVal value As Double)
            _HouseRent = value
        End Set
    End Property

    Public Property TransportAllowance() As Double
        Get
            Return _TransportAllowance
        End Get
        Set(ByVal value As Double)
            _TransportAllowance = value
        End Set
    End Property

    Public Property Salary() As Double
        Get
            Return _BasicSalary + _HouseRent + _TransportAllowance
        End Get
        Set(ByVal value As Double)
            _Salary = value
        End Set
    End Property

    Public Property PFContribution() As Double
        Get
            Return _PFContribution
        End Get
        Set(ByVal value As Double)
            _PFContribution = value
        End Set
    End Property

    Public Property FestivalComponent() As Double
        Get
            Return _FestivalComponent
        End Get
        Set(ByVal value As Double)
            _FestivalComponent = value
        End Set
    End Property

    Public Property MobileAllowance() As Double
        Get
            Return _MobileAllowance
        End Get
        Set(ByVal value As Double)
            _MobileAllowance = value
        End Set
    End Property

    Public Property LocalConveyance() As Double
        Get
            Return _LocalConveyance
        End Get
        Set(ByVal value As Double)
            _LocalConveyance = value
        End Set
    End Property

    Public Property MedicalAllowance() As Double
        Get
            Return _MedicalAllowance
        End Get
        Set(ByVal value As Double)
            _MedicalAllowance = value
        End Set
    End Property

    Public Property MotorbikeAllowance() As Double
        Get
            Return _MotorbikeAllowance
        End Get
        Set(ByVal value As Double)
            _MotorbikeAllowance = value
        End Set
    End Property

    Public Property SpecialAllowance() As Double
        Get
            Return _SpecialAllowance
        End Get
        Set(ByVal value As Double)
            _SpecialAllowance = value
        End Set
    End Property

    Public Property DriverAllowance() As Double
        Get
            Return _DriverAllowance
        End Get
        Set(ByVal value As Double)
            _DriverAllowance = value
        End Set
    End Property

    Public Property VehicleMaintenance() As Double
        Get
            Return _VehicleMaintenance
        End Get
        Set(ByVal value As Double)
            _VehicleMaintenance = value
        End Set
    End Property

    Public Property CarSubsidy() As Double
        Get
            Return _CarSubsidy
        End Get
        Set(ByVal value As Double)
            _CarSubsidy = value
        End Set
    End Property

    Public Property FuelAllowance() As Double
        Get
            Return _FuelAllowance
        End Get
        Set(ByVal value As Double)
            _FuelAllowance = value
        End Set
    End Property

#Region " Get COC By Emp"

    Public Function fnGetCOCByEmp(ByVal EmployeeID As String) As clsCOC
        Dim COC As New clsCOC()
        Dim sp As String = "spGetCOCByEmp"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    COC.BasicSalary = dr.Item("BasicSalary")
                    COC.HouseRent = dr.Item("HouseRent")
                    COC.TransportAllowance = dr.Item("TransportAllowance")
                    COC.PFContribution = dr.Item("PFContribution")
                    COC.FestivalComponent = dr.Item("FestivalComponent")
                    COC.MobileAllowance = dr.Item("MobileAllowance")
                    COC.LocalConveyance = dr.Item("LocalConveyance")
                    COC.MedicalAllowance = dr.Item("MedicalAllowance")
                    COC.MotorbikeAllowance = dr.Item("MotorbikeAllowance")
                    COC.SpecialAllowance = dr.Item("SpecialAllowance")

                    COC.DriverAllowance = dr.Item("DriverAllowance")
                    COC.VehicleMaintenance = dr.Item("VehicleMaintenance")
                    COC.CarSubsidy = dr.Item("CarSubsidy")
                    COC.FuelAllowance = dr.Item("FuelAllowance")

                End While
                con.Close()
                Return COC
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
