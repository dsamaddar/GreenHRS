Imports Microsoft.VisualBasic

Public Class clsEmpExpInfo
    Dim _CompanyName, _PositionHeld, _Department, _Responsibilities As String
    Dim _DateFrom, _DateTo As DateTime
    Dim _TillDate As Boolean

    Public Property CompanyName() As String
        Get
            Return _CompanyName
        End Get
        Set(ByVal value As String)
            _CompanyName = value
        End Set
    End Property

    Public Property PositionHeld() As String
        Get
            Return _PositionHeld
        End Get
        Set(ByVal value As String)
            _PositionHeld = value
        End Set
    End Property

    Public Property Department() As String
        Get
            Return _Department
        End Get
        Set(ByVal value As String)
            _Department = value
        End Set
    End Property
    Public Property Responsibilities() As String
        Get
            Return _Responsibilities
        End Get
        Set(ByVal value As String)
            _Responsibilities = value
        End Set
    End Property
    Public Property DateFrom() As DateTime
        Get
            Return _DateFrom
        End Get
        Set(ByVal value As DateTime)
            _DateFrom = value
        End Set
    End Property
    Public Property DateTo() As DateTime
        Get
            Return _DateTo
        End Get
        Set(ByVal value As DateTime)
            _DateTo = value
        End Set
    End Property
    Public Property TillDate() As Boolean
        Get
            Return _TillDate
        End Get
        Set(ByVal value As Boolean)
            _TillDate = value
        End Set
    End Property
End Class
