Imports Microsoft.VisualBasic

Public Class clsExternalTestScore

    Dim _ExternalTestScoreID, _ExternalTestTypeID, _ExamTakerID, _ExamTakerType, _Grading, _Remarks, _Attachment, _EntryBy As String

    Public Property ExternalTestScoreID() As String
        Get
            Return _ExternalTestScoreID
        End Get
        Set(ByVal value As String)
            _ExternalTestScoreID = value
        End Set
    End Property

    Public Property ExternalTestTypeID() As String
        Get
            Return _ExternalTestTypeID
        End Get
        Set(ByVal value As String)
            _ExternalTestTypeID = value
        End Set
    End Property

    Public Property ExamTakerID() As String
        Get
            Return _ExamTakerID
        End Get
        Set(ByVal value As String)
            _ExamTakerID = value
        End Set
    End Property

    Public Property ExamTakerType() As String
        Get
            Return _ExamTakerType
        End Get
        Set(ByVal value As String)
            _ExamTakerType = value
        End Set
    End Property

    Public Property Grading() As String
        Get
            Return _Grading
        End Get
        Set(ByVal value As String)
            _Grading = value
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

    Dim _MarksObtained, _MarksOutOf As Double

    Public Property MarksObtained() As Double
        Get
            Return _MarksObtained
        End Get
        Set(ByVal value As Double)
            _MarksObtained = value
        End Set
    End Property

    Public Property MarksOutOf() As Double
        Get
            Return _MarksOutOf
        End Get
        Set(ByVal value As Double)
            _MarksOutOf = value
        End Set
    End Property

    Dim _ExamTakenOn, _EntryDate As DateTime

    Public Property ExamTakenOn() As DateTime
        Get
            Return _ExamTakenOn
        End Get
        Set(ByVal value As DateTime)
            _ExamTakenOn = value
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
