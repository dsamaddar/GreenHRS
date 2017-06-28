Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsContactUsDataAccess
    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)
    Public Function fnInsertContactUsInfo(ByVal ContactUs As clsContactUs) As String
        Dim CandidateID As String
        'Dim rd As SqlDataReader
        CandidateID = ""
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertContactUs", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@Name", ContactUs.Name)
            cmd.Parameters.AddWithValue("@Email", ContactUs.Email)
            cmd.Parameters.AddWithValue("@PhoneNo", ContactUs.PhoneNo)
            cmd.Parameters.AddWithValue("@ValidationCode", ContactUs.ValidationCode)
            cmd.Parameters.AddWithValue("@Message", ContactUs.Message)
            cmd.Parameters.AddWithValue("@EntryBy", ContactUs.EntryBy)

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

    Public Function fnInsertReplyedMsg(ByVal ContactUs As clsContactUs) As String
        Dim CandidateID As String
        CandidateID = ""
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertReplyedMessage", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ContactUsID", ContactUs.ContactUsID)
            cmd.Parameters.AddWithValue("@Message", ContactUs.RepMessage)
            cmd.Parameters.AddWithValue("@EntryBy", ContactUs.EntryBy)

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
    Public Function fnGetCandidateMessageList() As DataSet

        Dim sp As String = "spGetCandidateMessage"
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
End Class
