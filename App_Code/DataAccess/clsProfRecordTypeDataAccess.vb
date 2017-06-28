Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsProfRecordTypeDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
    Dim _ProfRecordTypeID, _ProfRecordType, _Category, _EntryBy As String

    Public Property ProfRecordTypeID() As String
        Get
            Return _ProfRecordTypeID
        End Get
        Set(ByVal value As String)
            _ProfRecordTypeID = value
        End Set
    End Property

    Public Property ProfRecordType() As String
        Get
            Return _ProfRecordType
        End Get
        Set(ByVal value As String)
            _ProfRecordType = value
        End Set
    End Property

    Public Property Category() As String
        Get
            Return _Category
        End Get
        Set(ByVal value As String)
            _Category = value
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

    Dim _IsActive As Boolean

    Public Property IsActive() As Boolean
        Get
            Return _IsActive
        End Get
        Set(ByVal value As Boolean)
            _IsActive = value
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

#Region " Insert Prof Record Type "

    Public Function fnInsertProfRecordType(ByVal ProfRecType As clsProfRecordTypeDataAccess) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertProfRecordType", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ProfRecordType", ProfRecType.ProfRecordType)
            cmd.Parameters.AddWithValue("@Category", ProfRecType.Category)
            cmd.Parameters.AddWithValue("@IsActive", ProfRecType.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", ProfRecType.EntryBy)
            cmd.ExecuteNonQuery()
            con.Close()
            Return 1
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return 0
        End Try
    End Function

#End Region

#Region " Update Prof Record Type "

    Public Function fnUpdateProfRecordType(ByVal ProfRecType As clsProfRecordTypeDataAccess) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateProfRecordType", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ProfRecordTypeID", ProfRecType.ProfRecordTypeID)
            cmd.Parameters.AddWithValue("@ProfRecordType", ProfRecType.ProfRecordType)
            cmd.Parameters.AddWithValue("@Category", ProfRecType.Category)
            cmd.Parameters.AddWithValue("@IsActive", ProfRecType.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", ProfRecType.EntryBy)
            cmd.ExecuteNonQuery()
            con.Close()
            Return 1
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return 0
        End Try
    End Function

#End Region

#Region " GetDetailsProfRecordTypeByID "

    Public Function fnGetDetailsProfRecordTypeByID(ByVal ProfRecordTypeID As String) As clsProfRecordTypeDataAccess
        Dim ProfRecType As New clsProfRecordTypeDataAccess()
        Dim sp As String = "spGetDetailsProfRecordTypeByID"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("ProfRecordTypeID", ProfRecordTypeID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    ProfRecType.ProfRecordTypeID = dr.Item("ProfRecordTypeID")
                    ProfRecType.ProfRecordType = dr.Item("ProfRecordType")
                    ProfRecType.Category = dr.Item("Category")
                    ProfRecType.IsActive = dr.Item("IsActive")
                End While
                con.Close()

                Return ProfRecType
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Prof Record Types All "

    Public Function fnGetProfRecordTypesAll() As DataSet

        Dim sp As String = "spGetProfRecordTypesAll"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()
                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

#Region " Get Prof Record Types Active "

    Public Function fnGetProfRecordTypesActive() As DataSet

        Dim sp As String = "spGetProfRecordTypesActive"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()
                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#End Region

End Class
