Imports Microsoft.VisualBasic

Public Class clsConfirmationEvaluation

    Dim _EmployeeID, _EvaluationSummary, _DecisionOfConfirmation, _JoiningDesignation, _ConfirmationDesignation, _ApprovalAttachment, _EvaluationAttachment, _IssuedBy As String

    Public Property EmployeeID() As String
        Get
            Return _EmployeeID
        End Get
        Set(ByVal value As String)
            _EmployeeID = value
        End Set
    End Property

    Public Property EvaluationSummary() As String
        Get
            Return _EvaluationSummary
        End Get
        Set(ByVal value As String)
            _EvaluationSummary = value
        End Set
    End Property

    Public Property DecisionOfConfirmation() As String
        Get
            Return _DecisionOfConfirmation
        End Get
        Set(ByVal value As String)
            _DecisionOfConfirmation = value
        End Set
    End Property

    Public Property JoiningDesignation() As String
        Get
            Return _JoiningDesignation
        End Get
        Set(ByVal value As String)
            _JoiningDesignation = value
        End Set
    End Property

    Public Property ConfirmationDesignation() As String
        Get
            Return _ConfirmationDesignation
        End Get
        Set(ByVal value As String)
            _ConfirmationDesignation = value
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
