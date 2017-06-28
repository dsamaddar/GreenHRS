Imports Microsoft.VisualBasic

Public Class clsTaxAdvance

    Dim _TaxAdvanceID, _EmployeeID, _Remarks, _EntryBy As String

    Public Property TaxAdvanceID() As String
        Get
            Return _TaxAdvanceID
        End Get
        Set(ByVal value As String)
            _TaxAdvanceID = value
        End Set
    End Property

    Public Property EmployeeID() As String
        Get
            Return _EmployeeID
        End Get
        Set(ByVal value As String)
            _EmployeeID = value
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

    Public Property EntryBy() As String
        Get
            Return _EntryBy
        End Get
        Set(ByVal value As String)
            _EntryBy = value
        End Set
    End Property

    Dim _TaxAdvance, _TaxAdvanceAdjusted As Double

    Public Property TaxAdvance() As Double
        Get
            Return _TaxAdvance
        End Get
        Set(ByVal value As Double)
            _TaxAdvance = value
        End Set
    End Property

    Public Property TaxAdvanceAdjusted() As Double
        Get
            Return _TaxAdvanceAdjusted
        End Get
        Set(ByVal value As Double)
            _TaxAdvanceAdjusted = value
        End Set
    End Property

    Dim _IsAdjusted As Boolean

    Public Property IsAdjusted() As Boolean
        Get
            Return _IsAdjusted
        End Get
        Set(ByVal value As Boolean)
            _IsAdjusted = value
        End Set
    End Property

    Dim _AdjustmentDate, _IssueDate, _EntryDate As DateTime

    Public Property AdjustmentDate() As DateTime
        Get
            Return _AdjustmentDate
        End Get
        Set(ByVal value As DateTime)
            _AdjustmentDate = value
        End Set
    End Property

    Public Property IssueDate() As DateTime
        Get
            Return _IssueDate
        End Get
        Set(ByVal value As DateTime)
            _IssueDate = value
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
