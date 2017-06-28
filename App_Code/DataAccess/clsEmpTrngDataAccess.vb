Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsEmpTrngDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Emp Trng Info "
    Public Function fnInsertEmpTrngInfo(ByVal EmpTrngInfo As clsEmpTrngInfo) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertEmpTrngInfo", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmployeeID", EmpTrngInfo.EmployeeID)
            cmd.Parameters.AddWithValue("@TrngTypeID", EmpTrngInfo.TrngTypeID)
            cmd.Parameters.AddWithValue("@TrainingName", EmpTrngInfo.TrainingName)
            cmd.Parameters.AddWithValue("@TrngSubjectID", EmpTrngInfo.TrngSubjectID)
            cmd.Parameters.AddWithValue("@TrngTopicID", EmpTrngInfo.TrngTopicID)
            cmd.Parameters.AddWithValue("@OrganizedBy", EmpTrngInfo.OrganizedBy)
            cmd.Parameters.AddWithValue("@BranchID", EmpTrngInfo.BranchID)
            cmd.Parameters.AddWithValue("@Location", EmpTrngInfo.Location)
            cmd.Parameters.AddWithValue("@Country", EmpTrngInfo.Country)
            cmd.Parameters.AddWithValue("@StartsOn", EmpTrngInfo.StartsOn)
            cmd.Parameters.AddWithValue("@EndsOn", EmpTrngInfo.EndsOn)
            cmd.Parameters.AddWithValue("@CourseOutline", EmpTrngInfo.CourseOutline)
            cmd.Parameters.AddWithValue("@ResourcePerson", EmpTrngInfo.ResourcePerson)
            cmd.Parameters.AddWithValue("@Attachment", EmpTrngInfo.Attachment)
            cmd.Parameters.AddWithValue("@EntryBy", EmpTrngInfo.EntryBy)

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

#Region " Update Trng Info "
    Public Function fnUpdateTrngInfo(ByVal EmpTrngInfo As clsEmpTrngInfo) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateTrngInfo", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmpTrngInfoID", EmpTrngInfo.EmpTrngInfoID)
            cmd.Parameters.AddWithValue("@TrngTypeID", EmpTrngInfo.TrngTypeID)
            cmd.Parameters.AddWithValue("@TrainingName", EmpTrngInfo.TrainingName)
            cmd.Parameters.AddWithValue("@TrngSubjectID", EmpTrngInfo.TrngSubjectID)
            cmd.Parameters.AddWithValue("@TrngTopicID", EmpTrngInfo.TrngTopicID)
            cmd.Parameters.AddWithValue("@OrganizedBy", EmpTrngInfo.OrganizedBy)
            cmd.Parameters.AddWithValue("@BranchID", EmpTrngInfo.BranchID)
            cmd.Parameters.AddWithValue("@Country", EmpTrngInfo.Country)
            cmd.Parameters.AddWithValue("@Location", EmpTrngInfo.Location)
            cmd.Parameters.AddWithValue("@StartsOn", EmpTrngInfo.StartsOn)
            cmd.Parameters.AddWithValue("@EndsOn", EmpTrngInfo.EndsOn)
            cmd.Parameters.AddWithValue("@CourseDuration", EmpTrngInfo.CourseDuration)
            cmd.Parameters.AddWithValue("@CourseOutline", EmpTrngInfo.CourseOutline)
            cmd.Parameters.AddWithValue("@ResourcePerson", EmpTrngInfo.ResourcePerson)
            cmd.Parameters.AddWithValue("@IsCanceled", EmpTrngInfo.IsCanceled)
            cmd.Parameters.AddWithValue("@Attachment", EmpTrngInfo.Attachment)
            cmd.Parameters.AddWithValue("@EntryBy", EmpTrngInfo.EntryBy)
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

#Region " Insert Emp Trng Info Multi "
    Public Function fnInsertEmpTrngInfoMulti(ByVal EmpTrngInfo As clsEmpTrngInfo) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertEmpTrngInfoMulti", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@TrngTypeID", EmpTrngInfo.TrngTypeID)
            cmd.Parameters.AddWithValue("@TrainingName", EmpTrngInfo.TrainingName)
            cmd.Parameters.AddWithValue("@TrngSubjectID", EmpTrngInfo.TrngSubjectID)
            cmd.Parameters.AddWithValue("@TrngTopicID", EmpTrngInfo.TrngTopicID)
            cmd.Parameters.AddWithValue("@OrganizedBy", EmpTrngInfo.OrganizedBy)
            cmd.Parameters.AddWithValue("@BranchID", EmpTrngInfo.BranchID)
            cmd.Parameters.AddWithValue("@Location", EmpTrngInfo.Location)
            cmd.Parameters.AddWithValue("@Country", EmpTrngInfo.Country)
            cmd.Parameters.AddWithValue("@StartsOn", EmpTrngInfo.StartsOn)
            cmd.Parameters.AddWithValue("@EndsOn", EmpTrngInfo.EndsOn)
            cmd.Parameters.AddWithValue("@CourseDuration", EmpTrngInfo.CourseDuration)
            cmd.Parameters.AddWithValue("@CourseOutline", EmpTrngInfo.CourseOutline)
            cmd.Parameters.AddWithValue("@ResourcePerson", EmpTrngInfo.ResourcePerson)
            cmd.Parameters.AddWithValue("@Attachment", EmpTrngInfo.Attachment)
            cmd.Parameters.AddWithValue("@EntryBy", EmpTrngInfo.EntryBy)
            cmd.Parameters.AddWithValue("@EmpIDList", EmpTrngInfo.EmpIDList)
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

#Region " Accept Emp Training "
    Public Function fnAcceptEmpTraining(ByVal EmpTrngInfo As clsEmpTrngInfo) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spAcceptEmpTraining", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmpTrngInfoID", EmpTrngInfo.EmpTrngInfoID)
            cmd.Parameters.AddWithValue("@StartsOn", EmpTrngInfo.StartsOn)
            cmd.Parameters.AddWithValue("@EndsOn", EmpTrngInfo.EndsOn)
            cmd.Parameters.AddWithValue("@EvalProgram", EmpTrngInfo.EvalProgram)
            cmd.Parameters.AddWithValue("@EvalTrainer", EmpTrngInfo.EvalTrainer)
            cmd.Parameters.AddWithValue("@YourExperience", EmpTrngInfo.YourExperience)

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

#Region " Cancel Training "
    Public Function fnCancelTraining(ByVal EmpTrngInfo As clsEmpTrngInfo) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spCancelTraining", con)
            con.Open()

            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@EmpTrngInfoID", EmpTrngInfo.EmpTrngInfoID)
            cmd.Parameters.AddWithValue("@CancellationCause", EmpTrngInfo.CancellationCause)
            cmd.Parameters.AddWithValue("@CancelledBy", EmpTrngInfo.CancelledBy)
            cmd.Parameters.AddWithValue("@CancellationDate", EmpTrngInfo.CancellationDate)

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

#Region " Show Emp Trng Info "

    Public Function fnShowEmpTrngInfo(ByVal EmployeeID As String) As DataSet

        Dim sp As String = "spShowEmpTrngInfo"
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

#Region " Get Trng Report "

    Public Function fnGetTrngReport(ByVal TrngInfo As clsEmpTrngInfo) As DataSet

        Dim sp As String = "spGetTrngReport"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmployeeID", TrngInfo.EmployeeID)
                cmd.Parameters.AddWithValue("@TrngTypeID", TrngInfo.TrngTypeID)
                cmd.Parameters.AddWithValue("@TrngSubjectID", TrngInfo.TrngSubjectID)
                cmd.Parameters.AddWithValue("@TrngTopicID", TrngInfo.TrngTopicID)
                cmd.Parameters.AddWithValue("@Country", TrngInfo.Country)
                cmd.Parameters.AddWithValue("@OrganizedBy", TrngInfo.OrganizedBy)
                cmd.Parameters.AddWithValue("@StartsOn", TrngInfo.StartsOn)
                cmd.Parameters.AddWithValue("@EndsOn", TrngInfo.EndsOn)
                cmd.Parameters.AddWithValue("@IsCanceled", TrngInfo.IsCanceled)
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

    Public Function fnGetDetailTrainingInformation(ByVal EmpTrngInfoID As String) As clsEmpTrngInfo
        Dim EmpTrngInfo As New clsEmpTrngInfo()
        Dim sp As String = "spShowEmpTrngInfoDeails"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmpTrngInfoID", EmpTrngInfoID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    EmpTrngInfo.TrngTypeID = dr.Item("TrainingType")
                    EmpTrngInfo.TrainingName = dr.Item("TrainingName")
                    EmpTrngInfo.TrngSubjectID = dr.Item("TrainingSubject")
                    EmpTrngInfo.OrganizedBy = dr.Item("OrganizedBy")
                    EmpTrngInfo.Location = dr.Item("Location")
                    EmpTrngInfo.Country = dr.Item("Country")
                    EmpTrngInfo.StartsOn = dr.Item("StartsOn")
                    EmpTrngInfo.EndsOn = dr.Item("EndsOn")
                    EmpTrngInfo.CourseOutline = dr.Item("CourseOutline")
                    EmpTrngInfo.ResourcePerson = dr.Item("ResourcePerson")
                    EmpTrngInfo.YourExperience = dr.Item("YourExperience")
                    EmpTrngInfo.Status = dr.Item("TrngDone")
                End While
                con.Close()

                Return EmpTrngInfo
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

    Public Function fnTrngDetailsByID(ByVal EmpTrngInfoID As String) As clsEmpTrngInfo
        Dim EmpTrngInfo As New clsEmpTrngInfo()
        Dim sp As String = "spTrngDetailsByID"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmpTrngInfoID", EmpTrngInfoID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    EmpTrngInfo.TrngTypeID = dr.Item("TrngTypeID")
                    EmpTrngInfo.TrainingName = dr.Item("TrainingName")
                    EmpTrngInfo.TrngSubjectID = dr.Item("TrngSubjectID")
                    EmpTrngInfo.TrngTopicID = dr.Item("TrngTopicID")
                    EmpTrngInfo.OrganizedBy = dr.Item("OrganizedBy")
                    EmpTrngInfo.BranchID = dr.Item("BranchID")
                    EmpTrngInfo.Location = dr.Item("Location")
                    EmpTrngInfo.Country = dr.Item("Country")
                    EmpTrngInfo.StartsOn = dr.Item("StartsOn")
                    EmpTrngInfo.EndsOn = dr.Item("EndsOn")
                    EmpTrngInfo.CourseDuration = dr.Item("CourseDuration")
                    EmpTrngInfo.CourseOutline = dr.Item("CourseOutline")
                    EmpTrngInfo.ResourcePerson = dr.Item("ResourcePerson")
                    EmpTrngInfo.IsCanceled = dr.Item("IsCanceled")
                End While
                con.Close()

                Return EmpTrngInfo
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

#Region " Search Assigned Trng "

    Public Function fnSearchAssignedTrng(ByVal TrngInfo As clsEmpTrainingInfo) As DataSet

        Dim sp As String = "spSearchAssignedTrng"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EntryPoint", TrngInfo.EntryPoint)
                cmd.Parameters.AddWithValue("@EmployeeID", TrngInfo.EmployeeID)
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
