Imports Microsoft.VisualBasic

Public Class clsChartOfAccounts

    Dim _AccountCodeID, _AccountCode, _LedgerName, _ParentCode, _BalanceType, _EntryBy As String

    Public Property AccountCodeID() As String
        Get
            Return _AccountCodeID
        End Get
        Set(ByVal value As String)
            _AccountCodeID = value
        End Set
    End Property

    Public Property AccountCode() As String
        Get
            Return _AccountCode
        End Get
        Set(ByVal value As String)
            _AccountCode = value
        End Set
    End Property

    Public Property LedgerName() As String
        Get
            Return _LedgerName
        End Get
        Set(ByVal value As String)
            _LedgerName = value
        End Set
    End Property

    Public Property ParentCode() As String
        Get
            Return _ParentCode
        End Get
        Set(ByVal value As String)
            _ParentCode = value
        End Set
    End Property

    Public Property BalanceType() As String
        Get
            Return _BalanceType
        End Get
        Set(ByVal value As String)
            _BalanceType = value
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

    Dim _IsBankAccount As Boolean

    Public Property IsBankAccount() As Boolean
        Get
            Return _IsBankAccount
        End Get
        Set(ByVal value As Boolean)
            _IsBankAccount = value
        End Set
    End Property

    Dim _EntryDate As DateTime

    Public Property EntryDate() As DateTime
        Get
            Return _EntryDate
        End Get
        Set(ByVal value As DateTime)
            _EntryDate = value
        End Set
    End Property

End Class
