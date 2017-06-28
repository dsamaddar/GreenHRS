
Partial Class Training_frmTrainingInfo
    Inherits System.Web.UI.Page

    Dim OrgInfoData As New clsOrganizationInfoDataAccess()
    Dim TrngSubData As New clsTrngSubjectDataAccess()
    Dim TrngTypeData As New clsTrainingTypeDataAccess()
    Dim CourseLevelData As New clsCourseLevelDataAccess()
    Dim TrainingInfoData As New clsTrainingInfoDataAccess()

    Protected Sub btnAddTraining_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddTraining.Click

        If drpOrganizedBy.Items.Count <= 0 Then
            MessageBox("Select An Organization.")
            Exit Sub
        End If

        Dim TrainingInfo As New clsTrainingInformation()

        TrainingInfo.TrainingDetails = txtTrainingDetails.Text
        TrainingInfo.TrngSubjectID = drpAvailableTrngSubject.SelectedValue
        TrainingInfo.TrngTypeID = drpAvailableTrainingType.SelectedValue
        TrainingInfo.CourseLevelID = drpAvailableCourseLevel.SelectedValue

        TrainingInfo.TrainingInitiatedBy = drpTrainingInitiatedBy.SelectedValue
        TrainingInfo.CourseDuration = Convert.ToInt32(txtCourseDuration.Text)
        TrainingInfo.Duration = Convert.ToInt32(txtDuration.Text)
        TrainingInfo.ClassesStartsOn = Convert.ToDateTime(txtClassesStartsOn.Text)
        TrainingInfo.LastDateOfRegistration = Convert.ToDateTime(txtLastDateOfRegistration.Text)

        TrainingInfo.ClassSchedule = txtClassSchedule.Text
        TrainingInfo.HighLightsOfTheProgram = txtHighLightsOfTheProgram.Text
        TrainingInfo.CourseOutLine = txtCourseOutLine.Text
        TrainingInfo.BenefitFromTheProgram = txtExpectedBenefits.Text

        TrainingInfo.HowToApply = txtHowToApply.Text
        TrainingInfo.FeesPerAttendees = Convert.ToDouble(txtFees.Text)
        TrainingInfo.ResourcePerson = txtResourcePerson.Text
        TrainingInfo.RPProfile = txtResourcePersonsProfile.Text
        TrainingInfo.OrganizationID = drpOrganizedBy.SelectedValue
        TrainingInfo.EntryBy = "dsamaddar"

        Dim Check As Integer = TrainingInfoData.fnInsertTrainingInfo(TrainingInfo)

        If Check = 1 Then
            ClearTrainingInfo()
            MessageBox("Inserted.")
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub ClearTrainingInfo()
        txtTrainingDetails.Text = ""
        drpAvailableTrngSubject.SelectedIndex = -1
        drpAvailableTrainingType.SelectedIndex = -1
        drpAvailableCourseLevel.SelectedIndex = -1

        drpTrainingInitiatedBy.SelectedIndex = -1
        txtCourseDuration.Text = ""
        txtDuration.Text = ""
        txtClassesStartsOn.Text = ""
        txtLastDateOfRegistration.Text = ""
        txtClassSchedule.Text = ""

        txtHighLightsOfTheProgram.Text = ""
        txtCourseOutLine.Text = ""
        txtExpectedBenefits.Text = ""
        txtHowToApply.Text = ""
        txtFees.Text = ""
        txtResourcePerson.Text = ""
        txtResourcePersonsProfile.Text = ""
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowOrgList()
            ShowTrngSubList()
            ShowCourseLevel()
            ShowTrngTypeList()
        End If
    End Sub

    Protected Sub ShowTrngSubList()
        drpAvailableTrngSubject.DataTextField = "TrngSubName"
        drpAvailableTrngSubject.DataValueField = "TrngSubjectID"
        drpAvailableTrngSubject.DataSource = TrngSubData.fnShowTrngSubjects()
        drpAvailableTrngSubject.DataBind()
    End Sub

    Protected Sub ShowCourseLevel()
        drpAvailableCourseLevel.DataTextField = "CourseLevel"
        drpAvailableCourseLevel.DataValueField = "CourseLevelID"
        drpAvailableCourseLevel.DataSource = CourseLevelData.fnShowCourseLevel()
        drpAvailableCourseLevel.DataBind()
    End Sub

    Protected Sub ShowTrngTypeList()
        drpAvailableTrainingType.DataTextField = "TrngType"
        drpAvailableTrainingType.DataValueField = "TrngTypeID"
        drpAvailableTrainingType.DataSource = TrngTypeData.fnShowTrngType()
        drpAvailableTrainingType.DataBind()
    End Sub

    Protected Sub ShowOrgList()
        drpOrganizedBy.DataTextField = "OrgName"
        drpOrganizedBy.DataValueField = "OrganizationID"
        drpOrganizedBy.DataSource = OrgInfoData.fnShowOrgList()
        drpOrganizedBy.DataBind()
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click

    End Sub
End Class
