Imports Microsoft.VisualBasic

Public Class clsChallan

    Dim _ChallanID, _ChallanNo, _TaxYear, _EntryBy As String

    Public Property ChallanID() As String
        Get
            Return _ChallanID
        End Get
        Set(ByVal value As String)
            _ChallanID = value
        End Set
    End Property

    Public Property ChallanNo() As String
        Get
            Return _ChallanNo
        End Get
        Set(ByVal value As String)
            _ChallanNo = value
        End Set
    End Property

    Public Property TaxYear() As String
        Get
            Return _TaxYear
        End Get
        Set(ByVal value As String)
            _TaxYear = value
        End Set
    End Property

    Public Property EntryBy() As String
        Get
            Return _EntryBy
        End Get
        Set(ByVal value As String)
            _EntryBy = value
        End Set
    End Property

    Dim _TDSAmount As Double

    Public Property TDSAmount() As Double
        Get
            Return _TDSAmount
        End Get
        Set(ByVal value As Double)
            _TDSAmount = value
        End Set
    End Property

    Dim _ChallanDate, _EntryDate As DateTime

    Public Property ChallanDate() As DateTime
        Get
            Return _ChallanDate
        End Get
        Set(ByVal value As DateTime)
            _ChallanDate = value
        End Set
    End Property

    Public Property EntryDate() As DateTime
        Get
            Return _EntryDate
        End Get
        Set(ByVal value As DateTime)
            _EntryDate = value
        End Set
    End Property

End Class
