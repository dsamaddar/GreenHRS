Imports System.Data
Imports System.Data.SqlClient
Imports Microsoft.VisualBasic

Public Class clsDocumentTypeDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)


#Region " Insert Update Document Type "
    Public Function fnInsertDocumentType(ByVal DocType As clsDocumentType) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertDocumentType", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@DocumentType", DocType.DocumentType)
            cmd.Parameters.AddWithValue("@DocTypeFor", DocType.DocTypeFor)
            cmd.Parameters.AddWithValue("@DocumentCategory", DocType.DocumentCategory)
            cmd.Parameters.AddWithValue("@IsMandatory", DocType.IsMandatory)
            cmd.Parameters.AddWithValue("@IsActive", DocType.IsActive)
            cmd.Parameters.AddWithValue("@IsPerformanceFactor", DocType.IsPerformanceFactor)
            cmd.Parameters.AddWithValue("@PerformanceCriteria", DocType.PerformanceCriteria)
            cmd.Parameters.AddWithValue("@EntryBy", DocType.EntryBy)
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

    Public Function fnUpdateDocumentType(ByVal DocType As clsDocumentType) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateDocumentType", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@DocTypeID", DocType.DocTypeID)
            cmd.Parameters.AddWithValue("@DocumentType", DocType.DocumentType)
            cmd.Parameters.AddWithValue("@DocTypeFor", DocType.DocTypeFor)
            cmd.Parameters.AddWithValue("@DocumentCategory", DocType.DocumentCategory)
            cmd.Parameters.AddWithValue("@IsMandatory", DocType.IsMandatory)
            cmd.Parameters.AddWithValue("@IsActive", DocType.IsActive)
            cmd.Parameters.AddWithValue("@IsPerformanceFactor", DocType.IsPerformanceFactor)
            cmd.Parameters.AddWithValue("@PerformanceCriteria", DocType.PerformanceCriteria)
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

#Region " Show Document Type "
    Public Function fnShowDocumentType(ByVal DocumentFor As String) As DataSet
        Dim sp As String = "spShowDocumentType"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@DocumentFor", DocumentFor)
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

    Public Function fnShowDocumentTypeForGrid() As DataSet
        Dim sp As String = "spShowDocumentTypeForGrid"
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

    Public Function fnShowDocumentTypeByID(ByVal DocTypeID As String) As clsDocumentType
        Dim DocumentType As New clsDocumentType()
        Dim sp As String = "spShowDocumentTypeByID"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@DocTypeID", DocTypeID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    DocumentType.DocumentType = dr.Item("DocumentType")
                    DocumentType.DocTypeFor = dr.Item("DocumentFor")
                    DocumentType.DocumentCategory = dr.Item("DocumentCategory")
                    DocumentType.IsMandatory = dr.Item("IsMandatory")
                    DocumentType.IsActive = dr.Item("IsActive")
                    DocumentType.IsPerformanceFactor = dr.Item("IsPerformanceFactor")
                End While
                con.Close()

                Return DocumentType
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
