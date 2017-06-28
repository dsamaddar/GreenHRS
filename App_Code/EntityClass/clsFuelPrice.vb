Imports Microsoft.VisualBasic

Public Class clsFuelPrice

    Dim _FuelPriceID, _EntryBy As String

    Public Property FuelPriceID() As String
        Get
            Return _FuelPriceID
        End Get
        Set(ByVal value As String)
            _FuelPriceID = value
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

    Dim _PricePerLtr As Double

    Public Property PricePerLtr() As Double
        Get
            Return _PricePerLtr
        End Get
        Set(ByVal value As Double)
            _PricePerLtr = value
        End Set
    End Property

    Dim _EffectiveDate, _EntryDate As DateTime

    Public Property EffectiveDate() As DateTime
        Get
            Return _EffectiveDate
        End Get
        Set(ByVal value As DateTime)
            _EffectiveDate = value
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
