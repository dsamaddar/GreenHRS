Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsIntGradeDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Int Grade "
    Public Function fnInsertIntGrade(ByVal IntGrade As clsIntGrade) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertIntGrade", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@GradeName", IntGrade.GradeName)
            cmd.Parameters.AddWithValue("@GradePoint", IntGrade.GradePoint)
            cmd.Parameters.AddWithValue("@IsActive", IntGrade.IsActive)
            cmd.Parameters.AddWithValue("@EntryBy", IntGrade.EntryBy)
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

#Region " Show Int Grade Info "

    Public Function fnShowIntGradeInfo() As DataSet

        Dim sp As String = "spShowIntGradeInfo"
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



#Region " Show Int Grade List "

    Public Function fnShowIntGradeList() As DataSet
        Dim sp As String = "spShowIntGradeList"
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


#Region " Get Grade Info ByID  "

    Public Function fnGetGradeInfoByID(ByVal IntGrade As clsIntGrade) As clsIntGrade
        Dim sp As String = "spGetGradeInfoByID"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@IntGradeID", IntGrade.IntGradeID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    IntGrade.GradeName = dr.Item("GradeName")
                    IntGrade.GradePoint = dr.Item("GradePoint")
                    IntGrade.IsActive = dr.Item("IsActive")
                End While
                con.Close()

                Return IntGrade
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
