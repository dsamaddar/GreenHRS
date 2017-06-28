Imports Microsoft.VisualBasic

Public Class clsEmpTrngInfo

    Dim _EmpTrngInfoID, _Status, _TrngTopicID, _EmployeeID, _EmpIDList, _TrngTypeID, _TrainingName, _TrngSubjectID, _OrganizedBy, _BranchID, _
    _Location, _Country, _CourseOutline, _ResourcePerson, _Attachment, _EntryBy, _EntryPoint As String

    Public Property TrngTopicID() As String
        Get
            Return _TrngTopicID
        End Get
        Set(ByVal value As String)
            _TrngTopicID = value
        End Set
    End Property

    Public Property EmpTrngInfoID() As String
        Get
            Return _EmpTrngInfoID
        End Get
        Set(ByVal value As String)
            _EmpTrngInfoID = value
        End Set
    End Property

    Public Property Status() As String
        Get
            Return _Status
        End Get
        Set(ByVal value As String)
            _Status = value
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

    Public Property EmpIDList() As String
        Get
            Return _EmpIDList
        End Get
        Set(ByVal value As String)
            _EmpIDList = value
        End Set
    End Property

    Public Property TrngTypeID() As String
        Get
            Return _TrngTypeID
        End Get
        Set(ByVal value As String)
            _TrngTypeID = value
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

    Public Property TrngSubjectID() As String
        Get
            Return _TrngSubjectID
        End Get
        Set(ByVal value As String)
            _TrngSubjectID = value
        End Set
    End Property

    Public Property OrganizedBy() As String
        Get
            Return _OrganizedBy
        End Get
        Set(ByVal value As String)
            _OrganizedBy = value
        End Set
    End Property

    Public Property BranchID() As String
        Get
            Return _BranchID
        End Get
        Set(ByVal value As String)
            _BranchID = value
        End Set
    End Property

    Public Property Location() As String
        Get
            Return _Location
        End Get
        Set(ByVal value As String)
            _Location = value
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

    Public Property CourseOutline() As String
        Get
            Return _CourseOutline
        End Get
        Set(ByVal value As String)
            _CourseOutline = value
        End Set
    End Property

    Public Property ResourcePerson() As String
        Get
            Return _ResourcePerson
        End Get
        Set(ByVal value As String)
            _ResourcePerson = value
        End Set
    End Property

    Public Property Attachment() As String
        Get
            Return _Attachment
        End Get
        Set(ByVal value As String)
            _Attachment = value
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

    Public Property EntryPoint() As String
        Get
            Return _EntryPoint
        End Get
        Set(ByVal value As String)
            _EntryPoint = value
        End Set
    End Property

    Dim _EvalProgram, _EvalTrainer, _YourExperience, _CancellationCause, _CancelledBy As String

    Public Property EvalProgram() As String
        Get
            Return _EvalProgram
        End Get
        Set(ByVal value As String)
            _EvalProgram = value
        End Set
    End Property

    Public Property EvalTrainer() As String
        Get
            Return _EvalTrainer
        End Get
        Set(ByVal value As String)
            _EvalTrainer = value
        End Set
    End Property

    Public Property YourExperience() As String
        Get
            Return _YourExperience
        End Get
        Set(ByVal value As String)
            _YourExperience = value
        End Set
    End Property

    Public Property CancellationCause() As String
        Get
            Return _CancellationCause
        End Get
        Set(ByVal value As String)
            _CancellationCause = value
        End Set
    End Property

    Public Property CancelledBy() As String
        Get
            Return _CancelledBy
        End Get
        Set(ByVal value As String)
            _CancelledBy = value
        End Set
    End Property

    Dim _IsCanceled, _IsTrngDone As Boolean

    Public Property IsCanceled() As Boolean
        Get
            Return _IsCanceled
        End Get
        Set(ByVal value As Boolean)
            _IsCanceled = value
        End Set
    End Property

    Public Property IsTrngDone() As Boolean
        Get
            Return _IsTrngDone
        End Get
        Set(ByVal value As Boolean)
            _IsTrngDone = value
        End Set
    End Property

    Dim _StartsOn, _EndsOn, _AcceptanceDate, _EntryDate, _CancellationDate As DateTime

    Public Property StartsOn() As DateTime
        Get
            Return _StartsOn
        End Get
        Set(ByVal value As DateTime)
            _StartsOn = value
        End Set
    End Property

    Public Property EndsOn() As DateTime
        Get
            Return _EndsOn
        End Get
        Set(ByVal value As DateTime)
            _EndsOn = value
        End Set
    End Property

    Public Property AcceptanceDate() As DateTime
        Get
            Return _AcceptanceDate
        End Get
        Set(ByVal value As DateTime)
            _AcceptanceDate = value
        End Set
    End Property

    Public Property CancellationDate() As DateTime
        Get
            Return _CancellationDate
        End Get
        Set(ByVal value As DateTime)
            _CancellationDate = value
        End Set
    End Property

    Dim _CourseDuration As Integer

    Public Property CourseDuration() As Integer
        Get
            Return _CourseDuration
        End Get
        Set(ByVal value As Integer)
            _CourseDuration = value
        End Set
    End Property

End Class
