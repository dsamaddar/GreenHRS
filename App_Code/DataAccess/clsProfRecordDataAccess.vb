Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsProfRecordDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
    Dim _ProfRecordID, _EmployeeID, _ProfRecordTypeID, _RecordDetails, _EntryBy As String

    Public Property ProfRecordID() As String
        Get
            Return _ProfRecordID
        End Get
        Set(ByVal value As String)
            _ProfRecordID = value
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

    Public Property ProfRecordTypeID() As String
        Get
            Return _ProfRecordTypeID
        End Get
        Set(ByVal value As String)
            _ProfRecordTypeID = value
        End Set
    End Property

    Public Property RecordDetails() As String
        Get
            Return _RecordDetails
        End Get
        Set(ByVal value As String)
            _RecordDetails = value
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

    Dim _EntryDate, _EffectiveDate As DateTime

    Public Property EntryDate() As DateTime
        Get
            Return _EntryDate
        End Get
        Set(ByVal value As DateTime)
            _EntryDate = value
        End Set
    End Property

    Public Property EffectiveDate() As String
        Get
            Return _EffectiveDate
        End Get
        Set(ByVal value As String)
            _EffectiveDate = value
        End Set
    End Property

#Region " Insert Prof Record "

    Public Function fnInsertProfRecord(ByVal ProfRec As clsProfRecordDataAccess) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertProfRecord", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", ProfRec.EmployeeID)
            cmd.Parameters.AddWithValue("@ProfRecordTypeID", ProfRec.ProfRecordTypeID)
            cmd.Parameters.AddWithValue("@EffectiveDate", ProfRec.EffectiveDate)
            cmd.Parameters.AddWithValue("@RecordDetails", ProfRec.RecordDetails)
            cmd.Parameters.AddWithValue("@EntryBy", ProfRec.EntryBy)
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

#Region " Update Prof Record "

    Public Function fnUpdateProfRecord(ByVal ProfRec As clsProfRecordDataAccess) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateProfRecord", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ProfRecordID", ProfRec.ProfRecordID)
            cmd.Parameters.AddWithValue("@EmployeeID", ProfRec.EmployeeID)
            cmd.Parameters.AddWithValue("@ProfRecordTypeID", ProfRec.ProfRecordTypeID)
            cmd.Parameters.AddWithValue("@EffectiveDate", ProfRec.EffectiveDate)
            cmd.Parameters.AddWithValue("@RecordDetails", ProfRec.RecordDetails)
            cmd.Parameters.AddWithValue("@EntryBy", ProfRec.EntryBy)
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

#Region " Get Prof Rec By Employee "

    Public Function fnGetProfRecByEmployee(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spGetProfRecByEmployee"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
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

#Region " Get Prof Rec By Emp By Cat "

    Public Function fnGetProfRecByEmpByCat(ByVal EmployeeID As String, ByVal Category As String) As DataSet

        Dim sp As String = "spGetProfRecByEmpByCat"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", EmployeeID)
                cmd.Parameters.AddWithValue("@Category", Category)
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

End Class
