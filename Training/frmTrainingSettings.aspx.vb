
Partial Class Training_frmTrainingSettings
    Inherits System.Web.UI.Page

    Dim TrngSubData As New clsTrngSubjectDataAccess()
    Dim TrngTypeData As New clsTrainingTypeDataAccess()
    Dim CourseLevelData As New clsCourseLevelDataAccess()

    Protected Sub btnAddSubject_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddSubject.Click
        Dim TrngSub As New clsTrngSubject()

        TrngSub.TrngSubName = txtTrngSubject.Text
        TrngSub.TrngSubDescription = txtTrngDescription.Text
        TrngSub.Objectives = txtTrngObjectives.Text
        TrngSub.EntryBy = "dsamaddar"

        Dim Check As Integer = TrngSubData.fnInsertTrngSubject(TrngSub)

        If Check = 1 Then
            ShowTrngSubList()
            ClearTrngSub()
            MessageBox("Inserted Successfully.")
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub ShowTrngSubList()
        drpAvailableTrngSubject.DataTextField = "TrngSubName"
        drpAvailableTrngSubject.DataValueField = "TrngSubjectID"
        drpAvailableTrngSubject.DataSource = TrngSubData.fnShowTrngSubjects()
        drpAvailableTrngSubject.DataBind()

        ddlTrainingSubject.DataTextField = "TrngSubName"
        ddlTrainingSubject.DataValueField = "TrngSubjectID"
        ddlTrainingSubject.DataSource = TrngSubData.fnShowTrngSubjects()
        ddlTrainingSubject.DataBind()
    End Sub

    Protected Sub btnAddTrainingType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddTrainingType.Click

        Dim TrainingType As New clsTrainingType()

        TrainingType.TrngType = txtTrainingType.Text
        TrainingType.EntryBy = "dsamaddar"

        Dim Check As Integer = TrngTypeData.fnspInsertTrngType(TrainingType)

        If Check = 1 Then
            ShowTrngTypeList()
            ClearTrngType()
            MessageBox("Inserted Successfully.")
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub ClearTrngType()
        txtTrainingType.Text = ""
    End Sub

    Protected Sub ShowTrngTypeList()
        drpAvailableTrainingType.DataTextField = "TrngType"
        drpAvailableTrainingType.DataValueField = "TrngTypeID"
        drpAvailableTrainingType.DataSource = TrngTypeData.fnShowTrngType()
        drpAvailableTrainingType.DataBind()
    End Sub

    Protected Sub btnAddCourseLevel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddCourseLevel.Click
        Dim CourseLevel As New clsCourseLevel()

        CourseLevel.CourseLevel = txtCourseLevel.Text
        CourseLevel.EntryBy = "dsamaddar"

        Dim Check As Integer = CourseLevelData.fnInsertCourseLevel(CourseLevel)

        If Check = 1 Then
            ShowCourseLevel()
            ClearCourseLevel()
            MessageBox("Inserted Successfully.")
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub ShowCourseLevel()
        drpAvailableCourseLevel.DataTextField = "CourseLevel"
        drpAvailableCourseLevel.DataValueField = "CourseLevelID"
        drpAvailableCourseLevel.DataSource = CourseLevelData.fnShowCourseLevel()
        drpAvailableCourseLevel.DataBind()
    End Sub

    Protected Sub btnCancelCourseLevel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelCourseLevel.Click
        ClearCourseLevel()
    End Sub

    Protected Sub ClearCourseLevel()
        txtCourseLevel.Text = ""
    End Sub

    Protected Sub btnCancelTrainingType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelTrainingType.Click
        ClearTrngType()
    End Sub

    Protected Sub ClearTrngSub()
        txtTrngDescription.Text = ""
        txtTrngObjectives.Text = ""
        txtTrngSubject.Text = ""
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        txtTrngSubject.Text = ""
        txtTrngDescription.Text = ""
        txtTrngObjectives.Text = ""
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowTrngSubList()
            ShowTrngTypeList()
            ShowCourseLevel()
            ShowTrngTopicList(ddlTrainingSubject.SelectedValue)
        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnTrainingTopic_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTrainingTopic.Click
        Dim TrainingTopic As New clsTrainingTopic()

        TrainingTopic.TrngSubjectID = ddlTrainingSubject.SelectedValue
        TrainingTopic.TrngTopic = txtTrainingTopic.Text
        TrainingTopic.EntryBy = "tahmed1" 'Session("tahmed1")

        Dim Check As Integer = TrngTypeData.fnspInsertTrngTopic(TrainingTopic)

        If Check = 1 Then
            ShowTrngTopicList(ddlTrainingSubject.SelectedValue)
            ClearTrainingTopic()
            MessageBox("Inserted Successfully.")
        Else
            MessageBox("Error Found.")
        End If
    End Sub

    Protected Sub btnTrainingCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTrainingCancel.Click
        ClearTrainingTopic()
    End Sub

    Protected Sub ClearTrainingTopic()
        ddlTrainingSubject.SelectedIndex = 0
        txtTrainingTopic.Text = ""
    End Sub

    Protected Sub ShowTrngTopicList(ByVal TrngSubjectID As String)
        ddlTrngTopic.DataTextField = "TrngTopic"
        ddlTrngTopic.DataValueField = "TrainingTopicID"
        ddlTrngTopic.DataSource = TrngTypeData.fnShowTrngTopic(TrngSubjectID)
        ddlTrngTopic.DataBind()
    End Sub

    Protected Sub ddlTrainingSubject_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlTrainingSubject.SelectedIndexChanged
        ShowTrngTopicList(ddlTrainingSubject.SelectedValue)
    End Sub

End Class
