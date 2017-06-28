Imports System
Imports System.Data
Imports System.Data.SqlClient

Partial Class Administration_frmEmpAssignTraining
    Inherits System.Web.UI.Page

    Dim EmpData As New clsEmployeeInfoDataAccess()
    Dim TrngSubData As New clsTrngSubjectDataAccess()
    Dim TrngTypeData As New clsTrainingTypeDataAccess()
    Dim OrgBranchData As New clsOrgBranchData()
    Dim EmployeeData As New clsEmpBasicProfileDataAccess()
    Dim EmpTrngData As New clsEmpTrngDataAccess()

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

    Protected Function FormatEmployee() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("EmployeeID", System.Type.GetType("System.String"))
        dt.Columns.Add("Employee", System.Type.GetType("System.String"))
        Return dt
    End Function

    Protected Sub btnAssignTrng_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAssignTrng.Click
        Dim ToWhomProShow As String = Session("ToWhomProShow")

        If grdTrainee.Rows.Count = 0 Then
            MessageBox("Trainee List Empty.")
            Exit Sub
        End If

        Dim folder As String = ""
        Dim DocExt As String = ""
        Dim DocFullName As String = ""
        Dim FileSize As Integer = 0
        Dim DocFileNameConf As String = ""
        Dim DocFullNameEva As String = ""
        Dim DocFileNameEva As String = ""

        Dim lblEmployeeID As New Label
        Dim EmpIDList As String = ""
        Dim EmpTrngInfo As New clsEmpTrngInfo()

        Try

            If Convert.ToDateTime(txtTrngStartsOn.Text) > Convert.ToDateTime(txtTrngEndsOn.Text) Then
                MessageBox("Start Date Can't Be Greater")
                Exit Sub
            End If
            EmpTrngInfo.EmployeeID = ToWhomProShow
            EmpTrngInfo.TrngTypeID = drpAvailableTrainingType.SelectedValue
            EmpTrngInfo.TrainingName = txtTrainingDetails.Text
            EmpTrngInfo.TrngSubjectID = drpAvailableTrngSubject.SelectedValue
            EmpTrngInfo.TrngTopicID = ddlTrainingTopic.SelectedValue
            EmpTrngInfo.OrganizedBy = ddlOrganizedBy.SelectedValue
            EmpTrngInfo.BranchID = drpOrgBranchList.SelectedValue
            EmpTrngInfo.Location = ""
            EmpTrngInfo.Country = drpCountry.SelectedValue
            EmpTrngInfo.StartsOn = txtTrngStartsOn.Text & " " & drpSHour.SelectedValue & ":" & drpSMin.SelectedValue & ":00" & " " & drpSAMPM.SelectedValue
            EmpTrngInfo.EndsOn = txtTrngEndsOn.Text & " " & drpEHour.SelectedValue & ":" & drpEMin.SelectedValue & ":00" & " " & drpEAMPM.SelectedValue
            EmpTrngInfo.CourseDuration = Convert.ToInt32(txtTrainingDuration.Text)
            EmpTrngInfo.CourseOutline = txtTrngCourseOutline.Text
            EmpTrngInfo.ResourcePerson = txtResourcePersonDetails.Text
            EmpTrngInfo.EntryBy = Session("LoginUserID")

            For Each rw As GridViewRow In grdTrainee.Rows
                lblEmployeeID = rw.FindControl("lblEmployeeID")
                EmpIDList = EmpIDList + lblEmployeeID.Text + "~|"
            Next

            EmpTrngInfo.EmpIDList = EmpIDList

            If drpCountry.SelectedValue = "-Select-" Then
                MessageBox("Please Select Country name")
                Exit Sub
            End If

            If ddlOrganizedBy.SelectedValue = "" Then
                MessageBox("Please Select Organized By")
                Exit Sub
            End If

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

                EmpTrngInfo.Attachment = DocFileNameConf
            Else
                EmpTrngInfo.Attachment = ""
            End If


            Dim check As Integer = EmpTrngData.fnInsertEmpTrngInfoMulti(EmpTrngInfo)

            If check = 1 Then
                MessageBox("Training Assigned Successfully.")
                ClearForm()
            Else
                MessageBox("Error Found.")

            End If

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub ClearForm()
        txtTrngCourseOutline.Text = ""
        txtTrngStartsOn.Text = ""
        txtTrngEndsOn.Text = ""
        txtResourcePersonDetails.Text = ""
        txtTrainingDetails.Text = ""

        ddlOrganizedBy.SelectedIndex = 0
        drpAvailableTrainingType.SelectedIndex = -1
        drpAvailableTrngSubject.SelectedIndex = -1
        drpCountry.SelectedIndex = -1

        grdTrainee.DataSource = ""
        grdTrainee.DataBind()

        Session("dtEmpTrngList") = ""

        Dim dtEmpTrngList As DataTable = New DataTable()
        dtEmpTrngList = FormatEmployee()
        Session("dtEmpTrngList") = dtEmpTrngList

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            ShowTrngSubList()
            ShowTrngTypeList()
            getTrainingTopic(drpAvailableTrngSubject.SelectedValue)

            Session("dtEmpTrngList") = ""

            Dim dtEmpTrngList As DataTable = New DataTable()
            dtEmpTrngList = FormatEmployee()
            Session("dtEmpTrngList") = dtEmpTrngList
            btnAssignTrng.Enabled = False
            GetAllEmployees()
        End If
    End Sub

    Protected Function AddEmployee(ByVal EmployeeID As String, ByVal Employee As String) As DataTable

        Dim dtEmpTrngList As DataTable = New DataTable()
        dtEmpTrngList = Session("dtEmpTrngList")

        '' Chq If Item Already Exists
        If ChqEmployeeAlreadyExists(EmployeeID) = 1 Then
            MessageBox("Item Already In The List.")
            Return dtEmpTrngList
        End If

        Dim dr As DataRow
        dr = dtEmpTrngList.NewRow()
        dr("EmployeeID") = EmployeeID
        dr("Employee") = Employee
        dtEmpTrngList.Rows.Add(dr)
        dtEmpTrngList.AcceptChanges()
        btnAssignTrng.Enabled = True
        Return dtEmpTrngList
    End Function

    Protected Sub getTrainingTopic(ByVal TrngSubjectID As String)
        ddlTrainingTopic.DataTextField = "TrngTopic"
        ddlTrainingTopic.DataValueField = "TrainingTopicID"
        ddlTrainingTopic.DataSource = TrngTypeData.fnShowTrngTopicBySubjectID(TrngSubjectID)
        ddlTrainingTopic.DataBind()
    End Sub

    Protected Function ChqEmployeeAlreadyExists(ByVal EmployeeID As String) As Integer

        Dim dtEmpTrngList As DataTable = New DataTable()
        dtEmpTrngList = Session("dtEmpTrngList")

        Dim IsExists As Boolean = False
        Dim ExistingEmployeeID As String = ""

        For Each rw As DataRow In dtEmpTrngList.Rows
            ExistingEmployeeID = rw.Item("EmployeeID")

            If ExistingEmployeeID = EmployeeID Then
                IsExists = True
                Exit For
            End If
        Next

        If IsExists = True Then
            Return 1
        Else
            Return 0
        End If

    End Function

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        Try
            Dim dtEmpTrngList As DataTable = New DataTable()

            dtEmpTrngList = AddEmployee(drpEmployeeList.SelectedValue, drpEmployeeList.SelectedItem.Text)
            Session("dtEmpTrngList") = dtEmpTrngList

            grdTrainee.DataSource = dtEmpTrngList
            grdTrainee.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub GetAllEmployees()
        drpEmployeeList.DataTextField = "EmployeeName"
        drpEmployeeList.DataValueField = "EmployeeID"
        drpEmployeeList.DataSource = EmpData.fnGetEmployeeList()
        drpEmployeeList.DataBind()
    End Sub

    Protected Sub grdTrainee_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grdTrainee.RowDeleting
        Dim i As Integer
        Dim dtEmpTrngList As DataTable = New DataTable()

        dtEmpTrngList = Session("dtEmpTrngList")

        i = e.RowIndex

        dtEmpTrngList.Rows(i).Delete()
        dtEmpTrngList.AcceptChanges()

        Session("dtEmpTrngList") = dtEmpTrngList

        grdTrainee.DataSource = dtEmpTrngList
        grdTrainee.DataBind()

        If grdTrainee.Rows.Count > 0 Then
            btnAssignTrng.Enabled = True
        Else
            btnAssignTrng.Enabled = False
        End If
    End Sub

End Class
