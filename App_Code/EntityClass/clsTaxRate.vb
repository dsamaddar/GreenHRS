Imports Microsoft.VisualBasic

Public Class clsTaxRate


    Dim _SLNo, _RateOrder, _AgeLimit As Integer

    Public Property SLNo() As Integer
        Get
            Return _SLNo
        End Get
        Set(ByVal value As Integer)
            _SLNo = value
        End Set
    End Property

    Public Property RateOrder() As Integer
        Get
            Return _RateOrder
        End Get
        Set(ByVal value As Integer)
            _RateOrder = value
        End Set
    End Property

    Public Property AgeLimit() As Integer
        Get
            Return _AgeLimit
        End Get
        Set(ByVal value As Integer)
            _AgeLimit = value
        End Set
    End Property

    Dim _Value, _Rate As Double

    Public Property Value() As Double
        Get
            Return _Value
        End Get
        Set(ByVal value As Double)
            _Value = value
        End Set
    End Property

    Public Property Rate() As Double
        Get
            Return _Rate
        End Get
        Set(ByVal value As Double)
            _Rate = value
        End Set
    End Property

    Dim _Gender, _TaxText, _TaxYear, _EntryBy As String

    Public Property Gender() As String
        Get
            Return _Gender
        End Get
        Set(ByVal value As String)
            _Gender = value
        End Set
    End Property

    Public Property TaxText() As String
        Get
            Return _TaxText
        End Get
        Set(ByVal value As String)
            _TaxText = value
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

End Class
