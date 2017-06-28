Imports Microsoft.VisualBasic

Public Class clsTaxAdvAdjHistory

    Dim _TaxAdvanceAdjID, _TaxAdvanceID, _EmpSalSummaryID, _EntryBy As String

    Public Property TaxAdvanceAdjID() As String
        Get
            Return _TaxAdvanceAdjID
        End Get
        Set(ByVal value As String)
            _TaxAdvanceAdjID = value
        End Set
    End Property

    Public Property TaxAdvanceID() As String
        Get
            Return _TaxAdvanceID
        End Get
        Set(ByVal value As String)
            _TaxAdvanceID = value
        End Set
    End Property

    Public Property EmpSalSummaryID() As String
        Get
            Return _EmpSalSummaryID
        End Get
        Set(ByVal value As String)
            _EmpSalSummaryID = value
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

    Dim _AdjustedAmount As Double

    Public Property AdjustedAmount() As Double
        Get
            Return _AdjustedAmount
        End Get
        Set(ByVal value As Double)
            _AdjustedAmount = value
        End Set
    End Property

    Dim _AdjustmentDate, _EntryDate As DateTime

    Public Property AdjustmentDate() As DateTime
        Get
            Return _AdjustmentDate
        End Get
        Set(ByVal value As DateTime)
            _AdjustmentDate = value
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
