﻿Imports Microsoft.VisualBasic

Public Class clsServiceType

    Dim _ServiceTypeID, _ServiceType, _EntryBy As String

    Public Property ServiceTypeID() As String
        Get
            Return _ServiceTypeID
        End Get
        Set(ByVal value As String)
            _ServiceTypeID = value
        End Set
    End Property

    Public Property ServiceType() As String
        Get
            Return _ServiceType
        End Get
        Set(ByVal value As String)
            _ServiceType = value
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

    Dim _EntryDate As DateTime

    Public Property EntryDate() As DateTime
        Get
            Return _EntryDate
        End Get
        Set(ByVal value As DateTime)
            _EntryDate = value
        End Set
    End Property

    Dim _IsActive As Boolean

    Public Property IsActive() As Boolean
        Get
            Return _IsActive
        End Get
        Set(ByVal value As Boolean)
            _IsActive = value
        End Set
    End Property

End Class
