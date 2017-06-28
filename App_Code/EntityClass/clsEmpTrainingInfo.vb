Imports Microsoft.VisualBasic

Public Class clsEmpTrainingInfo
    Dim _EmployeeID, _TrainingName, _InstituteName, _Country, _CountryID, _EntryPoint As String
    Dim _TrainingYear As Integer
    Dim _DateFrom, _DateTo As DateTime

    Public Property EmployeeID() As String
        Get
            Return _EmployeeID
        End Get
        Set(ByVal value As String)
            _EmployeeID = value
        End Set
    End Property

    Public Property TrainingName() As String
        Get
            Return _TrainingName
        End Get
        Set(ByVal value As String)
            _TrainingName = value
        End Set
    End Property

    Public Property InstituteName() As String
        Get
            Return _InstituteName
        End Get
        Set(ByVal value As String)
            _InstituteName = value
        End Set
    End Property

    Public Property CountryID() As String
        Get
            Return _CountryID
        End Get
        Set(ByVal value As String)
            _CountryID = value
        End Set
    End Property

    Public Property Country() As String
        Get
            Return _Country
        End Get
        Set(ByVal value As String)
            _Country = value
        End Set
    End Property

    Public Property EntryPoint() As String
        Get
            Return _EntryPoint
        End Get
        Set(ByVal value As String)
            _EntryPoint = value
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

    Public Property TrainingYear() As Integer
        Get
            Return _TrainingYear
        End Get
        Set(ByVal value As Integer)
            _TrainingYear = value
        End Set
    End Property
End Class
