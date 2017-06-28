Imports System.Data

Partial Class frmAssignExam
    Inherits System.Web.UI.Page

    Dim RegisterData As New clsRegisterDataAccess()
    Dim ExamData As New clsExamDataAccess()
    Dim QuestionPaperData As New clsQuestionPaperDataAccess()
    Dim EntryPointData As New clsEntryPointDataAccess()
    Dim DeptData As New clsDepartmentDataAccess()

    Dim EmployeeData As New clsEmpBasicProfileDataAccess()
    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            GetAvailableExams()
            GetAttendees("User")
            btnCheckAll.Enabled = False
            btnGenerateExam.Enabled = False
            GetEntryPoints()
            ShowDepertment()
            ShowULCBranch()
            ShowDesignationOfficial()
            getBloodGroup()
            geDistrictName()
            If drpEntryPoint.Items.Count > 0 Then
                drpEntryPoint.SelectedIndex = 0
                GetUsersByEntryPoints(drpEntryPoint.SelectedValue)
            End If

        End If
    End Sub

    Protected Sub ShowULCBranch()
        Dim dt As New datatable
        drpULCBranch.DataTextField = "ULCBranchName"
        drpULCBranch.DataValueField = "ULCBranchID"
        dt = EmployeeInfoData.fnGetULCBranch().Tables(0)
        drpULCBranch.DataSource = dt
        drpULCBranch.DataBind()

        drpULCBranchToExam.DataTextField = "ULCBranchName"
        drpULCBranchToExam.DataValueField = "ULCBranchID"
        drpULCBranchToExam.DataSource = dt
        drpULCBranchToExam.DataBind()
    End Sub



    Protected Sub ShowDesignationOfficial()
        drpSelectDesignation.DataTextField = "DesignationName"
        drpSelectDesignation.DataValueField = "DesignationID"
        drpSelectDesignation.DataSource = EmployeeInfoData.fnGetOfficialDesignation()
        drpSelectDesignation.DataBind()
    End Sub

    Protected Sub getBloodGroup()
        ddlBloodGrp.DataTextField = "BloodGroupName"
        ddlBloodGrp.DataValueField = "BloodGroupID"
        ddlBloodGrp.DataSource = EmployeeData.fnGetBloodGroup()
        ddlBloodGrp.DataBind()

        Dim A As New ListItem()
        A.Text = "N\A"
        A.Value = "N\A"
        ddlBloodGrp.Items.Insert(0, A)

    End Sub

    Protected Sub geDistrictName()
        ddlPerDistrict.DataTextField = "DistrictName"
        ddlPerDistrict.DataValueField = "DistrictID"
        ddlPerDistrict.DataSource = EmployeeData.getDistrictName()
        ddlPerDistrict.DataBind()

        Dim A As New ListItem()
        A.Text = "N\A"
        A.Value = "0"
        ddlPerDistrict.Items.Insert(0, A)

    End Sub

    Protected Sub ShowDepertment()
        ddlDepartment.DataTextField = "DeptName"
        ddlDepartment.DataValueField = "DepartmentID"
        ddlDepartment.DataSource = DeptData.fnGetDeptList()
        ddlDepartment.DataBind()
    End Sub

    Protected Sub GetEntryPoints()
        drpEntryPoint.DataTextField = "EntryPoint"
        drpEntryPoint.DataValueField = "EntryPoint"
        drpEntryPoint.DataSource = QuestionPaperData.fnGetEntryPoints()
        drpEntryPoint.DataBind()
    End Sub

    Public Sub GetUsersByEntryPoints(ByVal EntryPoint As String)
        grdEntryPointWiseAttendees.DataSource = QuestionPaperData.fnGetAttendeesByEntryPoint(EntryPoint)
        grdEntryPointWiseAttendees.DataBind()
    End Sub

    Protected Sub GetAttendees(ByVal UserType As String)

        chkListAttendees.DataTextField = "UserName"
        chkListAttendees.DataValueField = "UniqueUserID"
        chkListAttendees.DataSource = RegisterData.fnGetUserListByType(UserType)
        chkListAttendees.DataBind()
    End Sub

    Protected Sub GetAvailableExams()
        drpAvailableExams.DataTextField = "ExamName"
        drpAvailableExams.DataValueField = "ExamID"
        drpAvailableExams.DataSource = ExamData.fnGetAvailableExams()
        drpAvailableExams.DataBind()

        Dim A As New ListItem
        A.Text = "----- Choose Exam -----"
        A.Value = "N\A"
        drpAvailableExams.Items.Insert(0, A)

    End Sub

    Protected Sub drpAvailableExams_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpAvailableExams.SelectedIndexChanged

        If drpAvailableExams.SelectedValue = "N\A" Then
            btnCheckAll.Enabled = False
            For i = 0 To chkListAttendees.Items.Count - 1
                chkListAttendees.Items(i).Selected = False
            Next
        Else
            btnCheckAll.Enabled = True
        End If


    End Sub

    Protected Sub chkSelectAllItems_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkSelectAllItems.CheckedChanged

        If chkSelectAllItems.Checked = False Then
            For i = 0 To chkListAttendees.Items.Count - 1
                chkListAttendees.Items(i).Selected = False
            Next
            chkSelectAllItems.Text = "Select All"
        Else
            For i = 0 To chkListAttendees.Items.Count - 1
                chkListAttendees.Items(i).Selected = True
            Next
            chkSelectAllItems.Text = "Deselect All"
        End If

    End Sub

    Protected Sub btnGenerateExam_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGenerateExam.Click
        Dim QuestionPaper As New clsQuestionPaper()
        Dim Attendees As Boolean = False
        Dim Participant As String = ""
        Dim EntryPoint As String = ""
        Dim UserID As String = ""

        UserID = Session("LoginUserID")

        Try
            For i = 0 To chkListAttendees.Items.Count - 1
                If chkListAttendees.Items(i).Selected = True Then
                    Attendees = True
                    Exit For
                End If
            Next

            If Attendees = False Then
                MessageBox("Select At Least One Attendees")
                Exit Sub
            End If

            For i = 0 To chkListAttendees.Items.Count - 1
                If chkListAttendees.Items(i).Selected = True Then
                    Participant += chkListAttendees.Items(i).Value + ","
                End If
            Next

            Participant = Participant.Remove(Len(Participant) - 1)

            'EntryPoint = Now.Year.ToString + Now.Month.ToString() + Now.Day.ToString() + Now.Hour.ToString() + Now.Minute.ToString()
            EntryPoint = EntryPointData.fnGetEntryPoint()

            QuestionPaper.ExamID = drpAvailableExams.SelectedValue
            QuestionPaper.Participant = Participant
            QuestionPaper.EntryPoint = EntryPoint
            QuestionPaper.EffectiveDate = txtExAssOtrExamsEffectiveDate.Text & " " & drpECOEHour.SelectedValue & ":" & drpECOEMin.SelectedValue & ":00" & " " & drpECOEAMPM.SelectedValue
            QuestionPaper.PreparedBy = UserID
            QuestionPaper.ULCBranchID = drpULCBranchToExam.SelectedValue

            Dim Check As Integer = QuestionPaperData.fnAssignEmpQuestionPaper(QuestionPaper)

            If Check = 1 Then
                MessageBox("Successfully Assigned.")
                GetEntryPoints()
                If drpEntryPoint.Items.Count > 0 Then
                    drpEntryPoint.SelectedIndex = 0
                    GetUsersByEntryPoints(drpEntryPoint.SelectedValue)
                End If
                ClearWindow()
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub ClearWindow()
        drpAvailableExams.SelectedIndex = -1
        drpAvailableExams.Enabled = True

        chkListAttendees.Enabled = True
        chkSelectAllItems.Enabled = True

    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnCheckAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCheckAll.Click

        Dim Attendees As Boolean = False
        If drpAvailableExams.SelectedValue = "N\A" Then
            MessageBox("Select Exam First.")
            Exit Sub
        End If

        For i = 0 To chkListAttendees.Items.Count - 1
            If chkListAttendees.Items(i).Selected = True Then
                Attendees = True
                Exit For
            End If
        Next

        If Attendees = False Then
            MessageBox("Select At Least One Attendees")
            Exit Sub
        End If

        Dim ExistAssignedAttendees As String = ""

        Dim AlreadyExists As Integer = 0
        '' Check For Already Assigned but Exam not Taken 
        For i = 0 To chkListAttendees.Items.Count - 1
            If chkListAttendees.Items(i).Selected = True Then
                AlreadyExists = QuestionPaperData.fnChkAlreadyAssignedAndExamNotTaken(chkListAttendees.Items(i).Value, drpAvailableExams.SelectedValue)
                If AlreadyExists = 1 Then
                    ExistAssignedAttendees += chkListAttendees.Items(i).Text + ","
                    chkListAttendees.Items(i).Selected = False
                End If
            End If
            AlreadyExists = 0
        Next

        If ExistAssignedAttendees <> "" Then
            ExistAssignedAttendees = ExistAssignedAttendees.Remove(Len(ExistAssignedAttendees) - 1)
            MessageBox(drpAvailableExams.SelectedItem.ToString() + " Is Already Assigned For Below Attendees: " + ExistAssignedAttendees)
        End If

        chkSelectAllItems.Enabled = False
        drpAvailableExams.Enabled = False
        chkListAttendees.Enabled = False
        btnGenerateExam.Enabled = True

    End Sub

    Protected Sub drpEntryPoint_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpEntryPoint.SelectedIndexChanged
        GetUsersByEntryPoints(drpEntryPoint.SelectedValue)
    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        chkListAttendees.DataTextField = "UserName"
        chkListAttendees.DataValueField = "UniqueUserID"


        Dim OrgSrchStr As New clsSearchOrgStructure()

        If drpSelectDesignation.SelectedIndex = 0 Then
            OrgSrchStr.DesignationID = "N\A"
        Else
            OrgSrchStr.DesignationID = drpSelectDesignation.SelectedValue
        End If

        If ddlDepartment.SelectedIndex = 0 Then
            OrgSrchStr.DepartmentID = "N\A"
        Else
            OrgSrchStr.DepartmentID = ddlDepartment.SelectedValue
        End If

        If drpULCBranch.SelectedIndex = 0 Then
            OrgSrchStr.ULCBranchID = "N\A"
        Else
            OrgSrchStr.ULCBranchID = drpULCBranch.SelectedValue
        End If

        If rdbtnGender.SelectedIndex = -1 Then
            OrgSrchStr.Gender = "N\A"
        Else
            OrgSrchStr.Gender = rdbtnGender.SelectedValue
        End If

        OrgSrchStr.BloodGroupID = ddlBloodGrp.SelectedValue
        OrgSrchStr.PerDistrict = Convert.ToInt32(ddlPerDistrict.SelectedValue)

        chkListAttendees.DataSource = RegisterData.fnGetEmpUserListByDept(OrgSrchStr)
        chkListAttendees.DataBind()
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        drpEntryPoint.SelectedIndex = -1
        drpSelectDesignation.SelectedIndex = -1
        drpULCBranch.SelectedIndex = -1
        ddlBloodGrp.SelectedIndex = -1
        ddlDepartment.SelectedIndex = -1
        ddlPerDistrict.SelectedIndex = -1
    End Sub

End Class
