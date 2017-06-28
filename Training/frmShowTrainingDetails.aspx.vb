
Partial Class Training_frmShowTrainingDetails
    Inherits System.Web.UI.Page

    Dim TrngInfoData As New clsTrainingInfoDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            '' Chq for Already Applied.
            Dim TrainingID As String = Request.QueryString("TrainingID")
            ShowTrainingDetails(TrainingID)
        End If
    End Sub

    Protected Sub ShowTrainingDetails(ByVal TrainingID As String)
        Dim TrngInfo As New clsTrainingInformation()

        TrngInfo = TrngInfoData.fnShowTrainingDetailsByID(TrainingID)

        lblTrngSubject.Text = TrngInfo.TrngSubName
        txtTrainingDetails.Text = TrngInfo.TrainingDetails
        lblTrngType.Text = TrngInfo.TrngType
        lblCourseLevel.Text = TrngInfo.CourseLevel
        lblInitiatedBy.Text = TrngInfo.TrainingInitiatedBy
        lblCourseDuration.Text = TrngInfo.CourseDuration
        lblDuration.Text = TrngInfo.Duration
        lblClassesStartsOn.Text = TrngInfo.ClassesStartsOn
        lblLastDateOfRegistration.Text = TrngInfo.LastDateOfRegistration
        txtClasschedule.Text = TrngInfo.ClassSchedule
        txtHighlightsOfTheProgram.Text = TrngInfo.HighLightsOfTheProgram
        txtCourseOutline.Text = TrngInfo.CourseOutLine
        txtExpectedBenefits.Text = TrngInfo.BenefitFromTheProgram
        txtHowToApply.Text = TrngInfo.HowToApply
        lblFeesPerAttendees.Text = TrngInfo.FeesPerAttendees
        lblResourcePerson.Text = TrngInfo.ResourcePerson
        txtResourcePersonsProfile.Text = TrngInfo.RPProfile
        lblOrganizedBy.Text = TrngInfo.OrgName

    End Sub

End Class
