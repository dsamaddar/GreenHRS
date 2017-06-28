Imports Microsoft.VisualBasic

Public Class clsContractRenewal

    Dim _ContractRenewalID, _EmployeeID, _ApprovalAttachment, _EvaluationAttachment, _IssuedBy, _RenewalSummary As String

    Public Property ContractRenewalID() As String
        Get
            Return _ContractRenewalID
        End Get
        Set(ByVal value As String)
            _ContractRenewalID = value
        End Set
    End Property

    Public Property RenewalSummary() As String
        Get
            Return _RenewalSummary
        End Get
        Set(ByVal value As String)
            _RenewalSummary = value
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

    Public Property ApprovalAttachment() As String
        Get
            Return _ApprovalAttachment
        End Get
        Set(ByVal value As String)
            _ApprovalAttachment = value
        End Set
    End Property

    Public Property EvaluationAttachment() As String
        Get
            Return _EvaluationAttachment
        End Get
        Set(ByVal value As String)
            _EvaluationAttachment = value
        End Set
    End Property

    Public Property IssuedBy() As String
        Get
            Return _IssuedBy
        End Get
        Set(ByVal value As String)
            _IssuedBy = value
        End Set
    End Property

    Dim _RenewalPeriod As Integer

    Public Property RenewalPeriod() As Integer
        Get
            Return _RenewalPeriod
        End Get
        Set(ByVal value As Integer)
            _RenewalPeriod = value
        End Set
    End Property

    Dim _EffectiveDate, _UpdateDate, _IssuedDate As DateTime

    Public Property EffectiveDate() As DateTime
        Get
            Return _EffectiveDate
        End Get
        Set(ByVal value As DateTime)
            _EffectiveDate = value
        End Set
    End Property

    Public Property UpdateDate() As DateTime
        Get
            Return _UpdateDate
        End Get
        Set(ByVal value As DateTime)
            _UpdateDate = value
        End Set
    End Property

    Public Property IssuedDate() As DateTime
        Get
            Return _IssuedDate
        End Get
        Set(ByVal value As DateTime)
            _IssuedDate = value
        End Set
    End Property

    Dim _IsSystemUpdated As Boolean

    Public Property IsSystemUpdated() As Boolean
        Get
            Return _IsSystemUpdated
        End Get
        Set(ByVal value As Boolean)
            _IsSystemUpdated = value
        End Set
    End Property

End Class
