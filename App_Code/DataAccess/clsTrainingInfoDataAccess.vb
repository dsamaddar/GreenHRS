Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsTrainingInfoDataAccess

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString)

#Region " Insert Training Info "
    Public Function fnInsertTrainingInfo(ByVal TrainingInfo As clsTrainingInformation) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertTrainingInfo", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@TrngSubjectID", TrainingInfo.TrngSubjectID)
            cmd.Parameters.AddWithValue("@TrainingDetails", TrainingInfo.TrainingDetails)
            cmd.Parameters.AddWithValue("@TrngTypeID", TrainingInfo.TrngTypeID)
            cmd.Parameters.AddWithValue("@CourseLevelID", TrainingInfo.CourseLevelID)
            cmd.Parameters.AddWithValue("@TrainingInitiatedBy", TrainingInfo.TrainingInitiatedBy)
            cmd.Parameters.AddWithValue("@CourseDuration", TrainingInfo.CourseDuration)
            cmd.Parameters.AddWithValue("@Duration", TrainingInfo.Duration)
            cmd.Parameters.AddWithValue("@ClassesStartsOn", TrainingInfo.ClassesStartsOn)
            cmd.Parameters.AddWithValue("@LastDateOfRegistration", TrainingInfo.LastDateOfRegistration)
            cmd.Parameters.AddWithValue("@ClassSchedule", TrainingInfo.ClassSchedule)
            cmd.Parameters.AddWithValue("@HighLightsOfTheProgram", TrainingInfo.HighLightsOfTheProgram)
            cmd.Parameters.AddWithValue("@CourseOutLine", TrainingInfo.CourseOutLine)
            cmd.Parameters.AddWithValue("@BenefitFromTheProgram", TrainingInfo.BenefitFromTheProgram)
            cmd.Parameters.AddWithValue("@HowToApply", TrainingInfo.HowToApply)
            cmd.Parameters.AddWithValue("@FeesPerAttendees", TrainingInfo.FeesPerAttendees)
            cmd.Parameters.AddWithValue("@ResourcePerson", TrainingInfo.ResourcePerson)
            cmd.Parameters.AddWithValue("@RPProfile", TrainingInfo.RPProfile)
            cmd.Parameters.AddWithValue("@OrganizationID", TrainingInfo.OrganizationID)
            cmd.Parameters.AddWithValue("@EntryBy", TrainingInfo.EntryBy)
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

#Region " Show Available Training "

    Public Function fnShowAvailableTraining() As DataSet

        Dim sp As String = "spShowAvailableTraining"
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

#Region " Show Training Details ByID  "
    Public Function fnShowTrainingDetailsByID(ByVal TrainingID As String) As clsTrainingInformation
        Dim TrngInfo As New clsTrainingInformation()
        Dim sp As String = "spShowTrainingDetailsByID"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@TrainingID", TrainingID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    TrngInfo.TrainingID = dr.Item("TrainingID")
                    TrngInfo.TrngSubName = dr.Item("TrngSubName")
                    TrngInfo.TrainingDetails = dr.Item("TrainingDetails")
                    TrngInfo.TrngType = dr.Item("TrngType")
                    TrngInfo.CourseLevel = dr.Item("CourseLevel")
                    TrngInfo.TrainingInitiatedBy = dr.Item("TrainingInitiatedBy")
                    TrngInfo.CourseDuration = dr.Item("CourseDuration")
                    TrngInfo.Duration = dr.Item("Duration")
                    TrngInfo.ClassesStartsOn = dr.Item("ClassesStartsOn")
                    TrngInfo.LastDateOfRegistration = dr.Item("LastDateOfRegistration")
                    TrngInfo.ClassSchedule = dr.Item("ClassSchedule")
                    TrngInfo.HighLightsOfTheProgram = dr.Item("HighlightsOfTheProgram")
                    TrngInfo.BenefitFromTheProgram = dr.Item("BenefitFromTheProgram")
                    TrngInfo.HowToApply = dr.Item("HowToApply")
                    TrngInfo.FeesPerAttendees = dr.Item("FeesPerAttendees")
                    TrngInfo.ResourcePerson = dr.Item("ResourcePerson")
                    TrngInfo.RPProfile = dr.Item("RPProfile")
                    TrngInfo.OrgName = dr.Item("OrgName")
                    TrngInfo.EntryBy = dr.Item("EntryBy")
                    TrngInfo.EntryDate = dr.Item("EntryDate")
                End While
                con.Close()

                Return TrngInfo
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
