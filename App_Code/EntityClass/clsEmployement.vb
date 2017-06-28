Imports Microsoft.VisualBasic

Public Class clsEmployement
    Dim _DepartmentID, _LocationID, _PositionID, _EmployeeTypeID, _Remarks, _ProposalID As String
    Dim _ExpectedJoiningDate, _EffectiveFrom, _EffectiveTo, _JoiningDate As DateTime
    Dim _Period As Integer

    Public Property DepartmentID() As String
        Get
            Return _DepartmentID
        End Get
        Set(ByVal value As String)
            _DepartmentID = value
        End Set
    End Property

    Public Property LocationID() As String
        Get
            Return _LocationID
        End Get
        Set(ByVal value As String)
            _LocationID = value
        End Set
    End Property

    Public Property PositionID() As String
        Get
            Return _PositionID
        End Get
        Set(ByVal value As String)
            _PositionID = value
        End Set
    End Property

    Public Property EmployeeTypeID() As String
        Get
            Return _EmployeeTypeID
        End Get
        Set(ByVal value As String)
            _EmployeeTypeID = value
        End Set
    End Property

    Public Property Remarks() As String
        Get
            Return _Remarks
        End Get
        Set(ByVal value As String)
            _Remarks = value
        End Set
    End Property

    Public Property ProposalID() As String
        Get
            Return _ProposalID
        End Get
        Set(ByVal value As String)
            _ProposalID = value
        End Set
    End Property

    Public Property ExpectedJoiningDate() As DateTime
        Get
            Return _ExpectedJoiningDate
        End Get
        Set(ByVal value As DateTime)
            _ExpectedJoiningDate = value
        End Set
    End Property

    Public Property JoiningDate() As DateTime
        Get
            Return _JoiningDate
        End Get
        Set(ByVal value As DateTime)
            _JoiningDate = value
        End Set
    End Property

    Public Property EffectiveFrom() As DateTime
        Get
            Return _EffectiveFrom
        End Get
        Set(ByVal value As DateTime)
            _EffectiveFrom = value
        End Set
    End Property

    Public Property EffectiveTo() As DateTime
        Get
            Return _EffectiveTo
        End Get
        Set(ByVal value As DateTime)
            _EffectiveTo = value
        End Set
    End Property

    Public Property Period() As Integer
        Get
            Return _Period
        End Get
        Set(ByVal value As Integer)
            _Period = value
        End Set
    End Property

    Dim _Salary, _LocalConveyance As Double

    Public Property Salary() As Double
        Get
            Return _Salary
        End Get
        Set(ByVal value As Double)
            _Salary = value
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

End Class
