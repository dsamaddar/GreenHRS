
Partial Class Administration_frmRescheduleTraining
    Inherits System.Web.UI.Page

    Dim EmpData As New clsEmployeeInfoDataAccess()
    Dim TrngSubData As New clsTrngSubjectDataAccess()
    Dim TrngTypeData As New clsTrainingTypeDataAccess()
    Dim OrgBranchData As New clsOrgBranchData()
    Dim EmpTrngData As New clsEmpTrngDataAccess()

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click

        Dim TrngInfo As New clsEmpTrainingInfo()
        TrngInfo.EntryPoint = drpEntryPoint.SelectedValue
        TrngInfo.EmployeeID = drpEmployees.SelectedValue

        grdTrngAssEmps.DataSource = EmpTrngData.fnSearchAssignedTrng(TrngInfo)
        grdTrngAssEmps.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetTrngEntryPoint()
            GetEmployees()
            ShowTrngSubList()
            ShowTrngTypeList()
        End If
    End Sub

    Protected Sub GetEmployees()
        drpEmployees.DataValueField = "EmployeeID"
        drpEmployees.DataTextField = "EmployeeName"
        drpEmployees.DataSource = EmpData.fnGetEmployeeList()
        drpEmployees.DataBind()

        Dim A As New ListItem
        A.Text = "N\A"
        A.Value = "N\A"
        drpEmployees.Items.Insert(0, A)

    End Sub

    Protected Sub GetTrngEntryPoint()
        drpEntryPoint.DataTextField = "EntryPointID"
        drpEntryPoint.DataValueField = "EntryPoint"
        drpEntryPoint.DataSource = Common.fnGetTrngAssEntryPoint()
        drpEntryPoint.DataBind()

        Dim A As New ListItem
        A.Text = "N\A"
        A.Value = "N\A"
        drpEntryPoint.Items.Insert(0, A)
    End Sub

    Protected Sub btnUpdateTrng_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateTrng.Click
        Dim TrngInfo As New clsEmpTrngInfo()
        Dim folder As String = ""
        Dim DocExt As String = ""
        Dim DocFullName As String = ""
        Dim FileSize As Integer = 0
        Dim DocFileNameConf As String = ""
        Dim DocFullNameEva As String = ""
        Dim DocFileNameEva As String = ""

        Try
            If Convert.ToDateTime(txtTrngStartsOn.Text) > Convert.ToDateTime(txtTrngEndsOn.Text) Then
                MessageBox("Start Date Can't Be Greater")
                Exit Sub
            End If

            If drpCountry.SelectedValue = "-Select-" Then
                MessageBox("Please Select Country name")
                Exit Sub
            Else
                TrngInfo.Country = drpCountry.SelectedValue
            End If

            If ddlOrganizedBy.SelectedValue = "" Then
                MessageBox("Please Select Organized By")
                Exit Sub
            Else
                TrngInfo.OrganizedBy = ddlOrganizedBy.SelectedValue
            End If

            TrngInfo.EmpTrngInfoID = hdFldEmpTrngID.Value
            TrngInfo.TrngTypeID = drpAvailableTrainingType.SelectedValue
            TrngInfo.TrainingName = txtTrainingDetails.Text
            TrngInfo.TrngSubjectID = drpAvailableTrngSubject.SelectedValue
            TrngInfo.TrngTopicID = ddlTrainingTopic.SelectedValue
            TrngInfo.BranchID = drpOrgBranchList.SelectedValue
            TrngInfo.Location = ""
            TrngInfo.StartsOn = txtTrngStartsOn.Text & " " & drpSHour.SelectedValue & ":" & drpSMin.SelectedValue & ":00" & " " & drpSAMPM.SelectedValue
            TrngInfo.EndsOn = txtTrngEndsOn.Text & " " & drpEHour.SelectedValue & ":" & drpEMin.SelectedValue & ":00" & " " & drpEAMPM.SelectedValue
            TrngInfo.CourseDuration = Convert.ToInt32(txtTrainingDuration.Text)
            TrngInfo.CourseOutline = txtTrngCourseOutline.Text
            TrngInfo.ResourcePerson = txtResourcePersonDetails.Text

            If chkIsCanceled.Checked = True Then
                TrngInfo.IsCanceled = True
            Else
                TrngInfo.IsCanceled = False
            End If

            TrngInfo.EntryBy = Session("LoginUserID")

            If flupTrngAttachment.HasFile Then
                folder = Server.MapPath("~/Attachments/")

                FileSize = flupTrngAttachment.PostedFile.ContentLength()
                If FileSize > 512000 Then
                    MessageBox("File size should be within 500KB")
                    Exit Sub
                End If

                DocExt = System.IO.Path.GetExtension(flupTrngAttachment.FileName)
                DocFileNameConf = "EMP_Trng_Doc_" & DateTime.Now.ToString("ddMMyyHHmmss") & DocExt
                DocFullName = folder & DocFileNameConf
                flupTrngAttachment.SaveAs(DocFullName)

                TrngInfo.Attachment = DocFileNameConf
            Else
                TrngInfo.Attachment = ""
            End If

            Dim check As Integer = EmpTrngData.fnUpdateTrngInfo(TrngInfo)

            If check = 1 Then
                MessageBox("Training Updated Successfully.")
            Else
                MessageBox("Error Found.")
            End If

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub ddlOrganizedBy_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlOrganizedBy.SelectedIndexChanged
        ShowOrgWiseBranchList(ddlOrganizedBy.SelectedValue)
    End Sub

    Protected Sub drpCountry_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpCountry.SelectedIndexChanged
        ShowOrganizationList(drpCountry.SelectedValue)
    End Sub

    Protected Sub drpAvailableTrngSubject_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpAvailableTrngSubject.SelectedIndexChanged
        getTrainingTopic(drpAvailableTrngSubject.SelectedValue)
    End Sub

    Protected Sub ShowOrgWiseBranchList(ByVal OrganizationID As String)
        drpOrgBranchList.DataTextField = "BranchName"
        drpOrgBranchList.DataValueField = "BranchID"
        drpOrgBranchList.DataSource = OrgBranchData.fnGetOrgWiseBranchInfo(OrganizationID)
        drpOrgBranchList.DataBind()

        Dim A As New ListItem
        A.Text = "N\A"
        A.Value = "N\A"

        drpOrgBranchList.Items.Insert(0, A)
    End Sub

    Protected Sub ShowOrganizationList(ByVal CountryName As String)
        ddlOrganizedBy.DataTextField = "OrgName"
        ddlOrganizedBy.DataValueField = "OrganizationID"
        ddlOrganizedBy.DataSource = TrngTypeData.fnShowOrganizationList(CountryName)
        ddlOrganizedBy.DataBind()

        If ddlOrganizedBy.Items.Count > 0 Then
            ddlOrganizedBy.SelectedIndex = 0
            ShowOrgWiseBranchList(ddlOrganizedBy.SelectedValue)
        End If

    End Sub

    Protected Sub ShowTrngSubList()
        drpAvailableTrngSubject.DataTextField = "TrngSubName"
        drpAvailableTrngSubject.DataValueField = "TrngSubjectID"
        drpAvailableTrngSubject.DataSource = TrngSubData.fnShowTrngSubjects()
        drpAvailableTrngSubject.DataBind()
    End Sub

    Protected Sub ShowTrngTypeList()
        drpAvailableTrainingType.DataTextField = "TrngType"
        drpAvailableTrainingType.DataValueField = "TrngTypeID"
        drpAvailableTrainingType.DataSource = TrngTypeData.fnShowTrngType()
        drpAvailableTrainingType.DataBind()
    End Sub

    Protected Sub getTrainingTopic(ByVal TrngSubjectID As String)
        ddlTrainingTopic.DataTextField = "TrngTopic"
        ddlTrainingTopic.DataValueField = "TrainingTopicID"
        ddlTrainingTopic.DataSource = TrngTypeData.fnShowTrngTopicBySubjectID(TrngSubjectID)
        ddlTrainingTopic.DataBind()
    End Sub

    Protected Sub grdTrngAssEmps_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdTrngAssEmps.SelectedIndexChanged
        Dim lblEmpTrngInfoID As New Label

        Try
            lblEmpTrngInfoID = grdTrngAssEmps.SelectedRow.FindControl("lblEmpTrngInfoID")

            Dim TrngInfo As clsEmpTrngInfo = EmpTrngData.fnTrngDetailsByID(lblEmpTrngInfoID.Text)

            hdFldEmpTrngID.Value = lblEmpTrngInfoID.Text
            drpCountry.SelectedValue = TrngInfo.Country
            ShowOrganizationList(drpCountry.SelectedValue)
            ShowOrgWiseBranchList(ddlOrganizedBy.SelectedValue)

            drpAvailableTrngSubject.SelectedValue = TrngInfo.TrngSubjectID
            getTrainingTopic(drpAvailableTrngSubject.SelectedValue)
            ddlTrainingTopic.SelectedValue = TrngInfo.TrngTopicID

            txtTrainingDetails.Text = TrngInfo.TrainingName
            txtTrngCourseOutline.Text = TrngInfo.CourseOutline
            drpAvailableTrainingType.SelectedValue = TrngInfo.TrngTypeID

            txtTrngStartsOn.Text = Convert.ToDateTime(TrngInfo.StartsOn).Date
            drpSHour.SelectedValue = Convert.ToDateTime(TrngInfo.StartsOn).Hour
            drpSMin.SelectedValue = Convert.ToDateTime(TrngInfo.StartsOn).Minute
            drpSAMPM.SelectedValue = Convert.ToDateTime(TrngInfo.StartsOn).ToString("tt")

            txtTrngEndsOn.Text = Convert.ToDateTime(TrngInfo.EndsOn).Date
            drpEHour.SelectedValue = Convert.ToDateTime(TrngInfo.EndsOn).Hour
            drpEMin.SelectedValue = Convert.ToDateTime(TrngInfo.EndsOn).Minute
            drpEAMPM.SelectedValue = Convert.ToDateTime(TrngInfo.EndsOn).ToString("tt")

            txtTrainingDuration.Text = Convert.ToInt32(TrngInfo.CourseDuration)
            txtResourcePersonDetails.Text = TrngInfo.ResourcePerson

            If TrngInfo.IsCanceled = True Then
                chkIsCanceled.Checked = True
            Else
                chkIsCanceled.Checked = False
            End If

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

End Class
