Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.OleDb
Imports System.Data.Common
Imports System.IO
Imports System.Math
Imports System.Configuration
Imports System.Web.UI

Partial Class CandidateEducationInfo
    Inherits System.Web.UI.Page

    Dim EducationInformation As New clsCanEduDataAccess()

#Region "Education"

    Protected Sub btnNext_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNext.Click

        Dim UserID As String
        UserID = Session("LoginUserID")

        Dim CandidateID = Session("CandidateID")

        Dim RegistrationID As String
        RegistrationID = Session("RegistrationID")


        If grdEducation.Rows.Count <= 0 Then
            MessageBox("An Exam Must Have At Least One Subject.")
            Exit Sub
        End If

        Dim CandidateEduInfo As String = ""
        Dim isoParts As String = ""

        Dim dtEducationInfo As DataTable = New DataTable()
        dtEducationInfo = Session("CandidateEduInfo")

        Dim EduInfo As New CanEduInfo()
        For Each rw As DataRow In dtEducationInfo.Rows
            EduInfo.DegreeType = rw.Item("DegreeType")
            EduInfo.ExamID = rw.Item("ExamID")
            EduInfo.MajorID = rw.Item("MajorID")
            EduInfo.PassingYear = rw.Item("PassingYear")
            EduInfo.InstitutionID = rw.Item("InstitutionID")
            EduInfo.OtherInstitutionName = rw.Item("OtherInstitutionName")
            EduInfo.ResultType = rw.Item("ResultType")
            EduInfo.Result = rw.Item("Result")

            If rw.Item("OutOf") = "N\A" Then
                EduInfo.OutOf = 0
            Else
                EduInfo.OutOf = rw.Item("OutOf")
            End If


            isoParts = isoParts & EduInfo.DegreeType & "~" & EduInfo.ExamID & "~" & EduInfo.MajorID & "~" & EduInfo.PassingYear & "~" & EduInfo.InstitutionID & "~" & EduInfo.OtherInstitutionName & "~" & EduInfo.ResultType & "~" & EduInfo.Result & "~" & EduInfo.OutOf & "~|"
        Next

        Dim count As Integer = clsCanEduDataAccess.CandidateCount(RegistrationID)
        If count = 0 Then
            MessageBox("Insert Basic Information first")
            grdEducation.DataSource = ""
            grdEducation.DataBind()
            Exit Sub
        End If

        If btnAddInstitution.Text = "Insert" Then
            MessageBox("Insert Institution Name")
            Exit Sub
        End If


        Dim Check As Integer = clsCanEduDataAccess.SubmitEducationInformation(CandidateID, isoParts)
        If Check = 1 Then
            MessageBox("Inserted Successfully")
            btnNext.Enabled = False
            Response.Redirect("~/CVMan/CandidateTrainingInfo.aspx")
        Else
            MessageBox("Error Found.")
        End If

        ' Response.Redirect("CandidateOthersInfo.aspx")
    End Sub

    Protected Function FormatEducationInfo() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("DegreeType", System.Type.GetType("System.String"))
        dt.Columns.Add("ExamID", System.Type.GetType("System.String"))
        dt.Columns.Add("ExamName", System.Type.GetType("System.String"))
        dt.Columns.Add("MajorID", System.Type.GetType("System.String"))
        dt.Columns.Add("Major", System.Type.GetType("System.String"))
        dt.Columns.Add("PassingYear", System.Type.GetType("System.Double"))
        dt.Columns.Add("InstitutionID", System.Type.GetType("System.String"))
        dt.Columns.Add("InstitutionName", System.Type.GetType("System.String"))
        dt.Columns.Add("OtherInstitutionName", System.Type.GetType("System.String"))
        dt.Columns.Add("ResultType", System.Type.GetType("System.String"))
        dt.Columns.Add("Result", System.Type.GetType("System.String"))
        dt.Columns.Add("OutOf", System.Type.GetType("System.Decimal"))
        Return dt
    End Function

    Protected Sub btnAddEdu_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddEdu.Click
        Try
            If ddlBoard.SelectedValue = "N\A" Then
                MessageBox("Select Board/University/College")
                Exit Sub
            End If

            If ddlMajor.SelectedValue = "-Select-" Then
                MessageBox("Select Major Name")
                Exit Sub
            End If

            If ddlPassingYear.SelectedValue = "YYYY" Then
                MessageBox("Select Passing Year")
                Exit Sub
            End If

            If ddlResultType.SelectedValue = "-Select-" Then
                MessageBox("Select Result Type")
                Exit Sub
            End If

            Dim CandidateEduInfo As New CanEduInfo()

            CandidateEduInfo.DegreeType = rdoDegreeType.SelectedValue
            CandidateEduInfo.ExamID = ddlExamName.SelectedValue
            CandidateEduInfo.ExamName = ddlExamName.SelectedItem.ToString()
            CandidateEduInfo.MajorID = ddlMajor.SelectedValue
            CandidateEduInfo.Major = ddlMajor.SelectedItem.ToString()
            CandidateEduInfo.PassingYear = Convert.ToInt16(ddlPassingYear.SelectedValue)
            CandidateEduInfo.InstitutionID = ddlBoard.SelectedValue
            CandidateEduInfo.InstitutionName = ddlBoard.SelectedItem.ToString()
            CandidateEduInfo.OtherInstitutionName = Common.CheckAsciiValue(txtOtherInsName.Text)
            CandidateEduInfo.ResultType = ddlResultType.SelectedValue

            If CandidateEduInfo.ResultType = "GPA" Then
                CandidateEduInfo.Result = txtResult.Text
                CandidateEduInfo.OutOf = txtOutOf.Text

                If CandidateEduInfo.Result > CandidateEduInfo.OutOf Then
                    MessageBox("Result should be less than or Equal to Out of")
                    Exit Sub
                End If

            ElseIf CandidateEduInfo.ResultType = "Division" Then
                CandidateEduInfo.Result = ddlDivision.SelectedValue
                CandidateEduInfo.OutOf = "0"

            ElseIf CandidateEduInfo.ResultType = "Appeared" Then
                CandidateEduInfo.Result = ""
                CandidateEduInfo.OutOf = "0"
            End If

            Dim dt As DataTable = GetEducationData(CandidateEduInfo)
            Session("CandidateEduInfo") = dt

            grdEducation.DataSource = dt
            grdEducation.DataBind()
            If CheckDuplicateEducationEntry() = 1 Then
                ClearEducationData()
            End If

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Function GetEducationData(ByVal CandidateEduInfo As CanEduInfo) As DataTable

        Dim dtEducationInfo = Session("CandidateEduInfo")

        If (CheckDuplicateEducationEntry() = 0) Then
            lblErrorMessageOnEDU.Text = "You Can't Insert Duplicate Exam Name."
            Return dtEducationInfo
        End If
        Dim dr As DataRow
        dr = dtEducationInfo.NewRow()
        dr("DegreeType") = CandidateEduInfo.DegreeType
        dr("ExamID") = CandidateEduInfo.ExamID
        dr("ExamName") = CandidateEduInfo.ExamName
        dr("MajorID") = CandidateEduInfo.MajorID
        dr("Major") = CandidateEduInfo.Major
        dr("PassingYear") = CandidateEduInfo.PassingYear
        dr("InstitutionID") = CandidateEduInfo.InstitutionID
        dr("InstitutionName") = CandidateEduInfo.InstitutionName
        dr("OtherInstitutionName") = CandidateEduInfo.OtherInstitutionName
        dr("ResultType") = CandidateEduInfo.ResultType
        dr("Result") = CandidateEduInfo.Result

        If CandidateEduInfo.InstitutionName = "Others" Then
            dr("InstitutionName") = CandidateEduInfo.InstitutionName + "(" + CandidateEduInfo.OtherInstitutionName + ")"
        Else
            dr("OtherInstitutionName") = "N\A"
        End If
        If CandidateEduInfo.OutOf = 0 Then
            dr("OutOf") = "N\A"
        Else
            dr("OutOf") = CandidateEduInfo.OutOf
        End If

        dtEducationInfo.Rows.Add(dr)
        dtEducationInfo.AcceptChanges()

        btnNext.Enabled = True
        ForGPA.Visible = False
        ForDivision.Visible = False
        idForOthers.Visible = False
        Return dtEducationInfo

    End Function

    Public Function CheckDuplicateEducationEntry() As Integer
        Dim lbl As System.Web.UI.WebControls.Label
        For Each rw As GridViewRow In grdEducation.Rows
            lbl = rw.FindControl("lblExamName")
            If lbl.Text = Nothing Then
                Return 0
            End If
            If ddlExamName.SelectedItem.ToString() = lbl.Text Then
                MessageBox("You Can't Insert Duplicate Exam Name.")
                Return 0
            End If
        Next
        Return 1
    End Function

    Protected Sub ClearEducationData()
        ddlExamName.SelectedIndex = -1
        ddlMajor.SelectedIndex = -1
        ddlPassingYear.SelectedIndex = -1
        ddlBoard.SelectedIndex = -1
        ddlResultType.SelectedIndex = -1
        txtResult.Text = ""
        ddlDivision.SelectedIndex = -1
        txtOutOf.Text = ""
    End Sub

    Protected Sub ddlResultType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlResultType.SelectedIndexChanged
        If ddlResultType.SelectedValue = "GPA" Then
            ForGPA.Visible = True
            ForDivision.Visible = False
        ElseIf ddlResultType.SelectedValue = "Division" Then
            ForGPA.Visible = False
            ForDivision.Visible = True
        Else
            ForGPA.Visible = False
            ForDivision.Visible = False
        End If
    End Sub

    Protected Sub grdEducation_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grdEducation.RowDeleting

        btnNext.Enabled = True
        Dim i As Integer
        Dim dtEducationInfo As DataTable = New DataTable()

        dtEducationInfo = Session("CandidateEduInfo")

        i = e.RowIndex

        dtEducationInfo.Rows(i).Delete()
        dtEducationInfo.AcceptChanges()
        grdEducation.DataSource = dtEducationInfo
        grdEducation.DataBind()

        Dim CandidateID As String
        CandidateID = Session("CandidateID")

        Dim Status As Boolean = clsCanBasicDataAccess.PresentStatus(CandidateID)

        If Status = True Then
            'btnNext.Enabled = False
        End If

        If dtEducationInfo.Rows.Count = 0 Then
            btnNext.Enabled = False
        End If

    End Sub

    Protected Sub btnAddInstitution_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddInstitution.Click
        'idBoard.Visible = True
        'idAddIns.Visible = False
        Dim UserID As String
        UserID = Session("LoginUserID")

        If btnAddInstitution.Text = "ADD" Then
            lblInstitutionAdd.Visible = True
            btnAddInstitution.Text = "Insert"
        Else
            Dim InstitutionName As String
            Dim EntryBy As String
            Dim IsActive As Integer = 1

            'idAddIns.Visible = False

            InstitutionName = txtBoard.Text
            EntryBy = UserID

            If InstitutionName = "" Then
                Exit Sub
            End If


            Dim check As Integer = EducationInformation.AddInstitutionName(InstitutionName, 1, EntryBy)

            If check = 1 Then
                MessageBox("Inserted")
                txtBoard.Text = ""
                ShowInstitutionList()
                lblInstitutionAdd.Visible = False
                btnAddInstitution.Text = "ADD"
            Else
                MessageBox("Error Found")
            End If
        End If

    End Sub

    Protected Sub ShowInstitutionList()
        ddlBoard.DataTextField = "InstitutionName"
        ddlBoard.DataValueField = "InstitutionID"
        ddlBoard.DataSource = EducationInformation.fnGetInstitutionList()
        ddlBoard.DataBind()

        Dim A As New ListItem()
        A.Text = "-Select-"
        A.Value = "N\A"

        ddlBoard.Items.Insert(0, A)
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        lblInstitutionAdd.Visible = False
        btnAddInstitution.Text = "ADD"
    End Sub

    Protected Sub ddlBoard_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlBoard.SelectedIndexChanged
        If ddlBoard.SelectedItem.Text = "Others" Then
            idForOthers.Visible = True
        Else
            idForOthers.Visible = False
        End If
    End Sub

    Protected Sub rdoDegreeType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdoDegreeType.SelectedIndexChanged
        Try
            If rdoDegreeType.SelectedValue = "Foreign" Then
                ddlBoard.SelectedValue = "InstName-00000108"
                ddlBoard.Enabled = False
                idForOthers.Visible = True
            Else
                ShowInstitutionList()
                ddlBoard.Enabled = True
                idForOthers.Visible = False
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
        
    End Sub

#End Region

#Region "ProCerti"
    Protected Function FormatProfessionalCertificationInfo() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("CertificationName", System.Type.GetType("System.String"))
        dt.Columns.Add("InstituteName", System.Type.GetType("System.String"))
        dt.Columns.Add("Location", System.Type.GetType("System.String"))
        dt.Columns.Add("DateFrom", System.Type.GetType("System.DateTime"))
        dt.Columns.Add("DateTo", System.Type.GetType("System.DateTime"))
        dt.Columns.Add("NeverExpire", GetType(Boolean))
        Return dt
    End Function

    Protected Sub btnAddCerti_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddCerti.Click
        Try
            Dim Checkdate As Boolean
            If drpDay.SelectedValue = "DD" Or drpMonth.SelectedValue = "MM" Or drpYear.SelectedValue = "YYYY" Then
                MessageBox("Select Issuing Date Parameter Correctly.")
                Exit Sub
            End If

            If chkNeverExpire.Checked = False Then
                If drpDayTo.SelectedValue = "DD" Or drpMonthTo.SelectedValue = "MM" Or drpYearTo.SelectedValue = "YYYY" Then
                    MessageBox("Select Expire Date Parameter Correctly.")
                    Exit Sub
                End If

            End If


            Dim CandidateProfessionCerti As New clsProfessionCerti()

            CandidateProfessionCerti.CertificationName = Common.CheckAsciiValue(txtCertificationName.Text)
            CandidateProfessionCerti.InstituteName = Common.CheckAsciiValue(txtInstitutionName.Text)
            CandidateProfessionCerti.Location = Common.CheckAsciiValue(txtLocation.Text)
            'CandidateProfessionCerti.DateFrom = dtDateFrom.Text
            Checkdate = IsDate(drpMonth.SelectedValue + "/" + drpDay.SelectedValue + "/" + drpYear.SelectedValue)
            If Checkdate = False Then
                MessageBox("Please Enter a Valid ISSUING DATE")
                Exit Sub
            End If
            CandidateProfessionCerti.DateFrom = drpMonth.SelectedValue + "/" + drpDay.SelectedValue + "/" + drpYear.SelectedValue

            CandidateProfessionCerti.NeverExpire = chkNeverExpire.Checked

            If chkNeverExpire.Checked = True Then
                CandidateProfessionCerti.DateTo = "1911-01-01"
            Else
                'CandidateProfessionCerti.DateTo = dtDateTo.Text
                Checkdate = IsDate(drpMonthTo.SelectedValue + "/" + drpDayTo.SelectedValue + "/" + drpYearTo.SelectedValue)
                If Checkdate = False Then
                    MessageBox("Please Enter a Valid EXPIRE DATE")
                    Exit Sub
                End If
                CandidateProfessionCerti.DateTo = drpMonthTo.SelectedValue + "/" + drpDayTo.SelectedValue + "/" + drpYearTo.SelectedValue
            End If

            Dim dt As DataTable = GetProfessionalCertificationData(CandidateProfessionCerti)
            Session("CandidateProfessionalCertificationInfo") = dt

            grdCertification.DataSource = dt
            grdCertification.DataBind()
            ClearProfessionalCertificationData()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Function GetProfessionalCertificationData(ByVal CandidateProfessionCerti As clsProfessionCerti) As DataTable

        Dim dtProfessionalCertificationInfo = Session("CandidateProfessionalCertificationInfo")

        Dim dr As DataRow
        dr = dtProfessionalCertificationInfo.NewRow()
        dr("CertificationName") = CandidateProfessionCerti.CertificationName
        dr("InstituteName") = CandidateProfessionCerti.InstituteName
        dr("Location") = CandidateProfessionCerti.Location
        dr("IssuingDate") = String.Format("{0:dd MMM yyyy}", CandidateProfessionCerti.DateFrom)

        If CandidateProfessionCerti.NeverExpire = True Then
            dr("ExpireDate") = ""
        Else
            dr("ExpireDate") = String.Format("{0:dd MMM yyyy}", CandidateProfessionCerti.DateTo)
        End If

        If CandidateProfessionCerti.NeverExpire = True Then
            dr("NeverExpire") = "Never Expire"
        Else
            dr("NeverExpire") = ""
        End If

        ' dr("NeverExpire") = CandidateProfessionCerti.NeverExpire

        dtProfessionalCertificationInfo.Rows.Add(dr)
        dtProfessionalCertificationInfo.AcceptChanges()
        btnSubmit.Enabled = True
        Return dtProfessionalCertificationInfo

    End Function

    Protected Sub ClearProfessionalCertificationData()
        txtCertificationName.Text = ""
        txtInstitutionName.Text = ""
        txtLocation.Text = ""
        drpDay.SelectedIndex = -1
        drpMonth.SelectedIndex = -1
        drpYear.SelectedIndex = -1
        drpDayTo.SelectedIndex = -1
        drpMonthTo.SelectedIndex = -1
        drpYearTo.SelectedIndex = -1
        chkNeverExpire.Checked = False
        drpMonthTo.Visible = True
        drpDayTo.Visible = True
        drpYearTo.Visible = True
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click


        Dim UserID As String
        UserID = Session("LoginUserID")

        Dim CandidateID = Session("CandidateID")

        Dim RegistrationID As String
        RegistrationID = Session("RegistrationID")


        Dim CandidateProfessionalCertificationInfo As String = ""
        Dim isoProfessionalCertificationParts As String = ""

        Dim dtProfessionalCertificationInfo As DataTable = New DataTable()
        dtProfessionalCertificationInfo = Session("CandidateProfessionalCertificationInfo")

        Dim ProInfo As New clsProfessionCerti()
        For Each rw As DataRow In dtProfessionalCertificationInfo.Rows
            ProInfo.CertificationName = rw.Item("CertificationName")
            ProInfo.InstituteName = rw.Item("InstituteName")
            ProInfo.Location = rw.Item("Location")
            ProInfo.DateFrom = rw.Item("IssuingDate")

            If rw.Item("ExpireDate") = "" Then
                ProInfo.DateTo = "1911-01-01"
            Else
                ProInfo.DateTo = rw.Item("ExpireDate")
            End If

            If rw.Item("NeverExpire") = "Never Expire" Then
                ProInfo.NeverExpire = True
            Else
                ProInfo.NeverExpire = False
            End If
            'ProInfo.NeverExpire = rw.Item("NeverExpire")

            isoProfessionalCertificationParts = isoProfessionalCertificationParts & ProInfo.CertificationName & "~" & ProInfo.InstituteName & "~" & ProInfo.Location & "~" & ProInfo.DateFrom & "~" & ProInfo.DateTo & "~" & ProInfo.NeverExpire & "~|"
        Next

        Dim Check As Integer = clsCanEduDataAccess.SubmitOtherInformation(CandidateID, isoProfessionalCertificationParts)
        If Check = 1 Then
            MessageBox("Inserted Successfully")
            'Response.Redirect("CandidateOthersInfo.aspx")
            btnSubmit.Enabled = False
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub grdCertification_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grdCertification.RowDeleting
        btnSubmit.Enabled = True
        Dim i As Integer
        Dim dtProfessionalCertificationInfo As DataTable = New DataTable()

        dtProfessionalCertificationInfo = Session("CandidateProfessionalCertificationInfo")

        i = e.RowIndex

        dtProfessionalCertificationInfo.Rows(i).Delete()
        dtProfessionalCertificationInfo.AcceptChanges()
        grdCertification.DataSource = dtProfessionalCertificationInfo
        grdCertification.DataBind()


        Dim CandidateID As String
        CandidateID = Session("CandidateID")

        Dim Status As Boolean = clsCanBasicDataAccess.PresentStatus(CandidateID)

        If Status = True Then
            btnSubmit.Enabled = False
        End If


        If dtProfessionalCertificationInfo.Rows.Count = 0 Then
            btnSubmit.Enabled = False
        End If
    End Sub

    Protected Sub chkNeverExpire_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkNeverExpire.CheckedChanged

        If chkNeverExpire.Checked = True Then
            'dtDateTo.Visible = False
            'RequiredFieldValidator2.Enabled = False
            drpMonthTo.Visible = False
            drpDayTo.Visible = False
            drpYearTo.Visible = False
        Else
            'dtDateTo.Visible = True
            'RequiredFieldValidator2.Enabled = True
            drpMonthTo.Visible = True
            drpDayTo.Visible = True
            drpYearTo.Visible = True
        End If


    End Sub

#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If
        If Not IsPostBack Then
            btnAddInstitution.Enabled = False

            pnlCanProfCertificationInfo.Visible = False
            pnlCertification.Visible = False
            rdbtnIsProfessionalCertificationExists.SelectedIndex = 1

            '' Chq. If Any Information Exists related To Prof. Certification thn show

            Dim Secmsg As String = Request.QueryString("msg")

            If Secmsg <> 1 Then
                Session("Message") = ""
            End If

            Dim lblMessage As String

            lblMessage = Session("Message")

            If lblMessage <> "" Then
                lblRedirectMsg.Text = lblMessage
            End If

            Dim UserID As String
            Dim UserName As String
            UserID = Session("LoginUserID")
            UserName = Session("UserName")
            Dim RegistrationID As String
            RegistrationID = Session("RegistrationID")

            Dim Message As String = ""
            Dim msg As String = ""

            Dim CandidateID As String

            CandidateID = Common.GetCandidateID(RegistrationID)

            CandidateID = Session("CandidateID")

            Dim Status As Boolean = clsCanBasicDataAccess.PresentStatus(CandidateID)

            If Status = True Then
                'btnAddEdu.Enabled = False
                'btnAddCerti.Enabled = False
            End If

            Dim CanCount As Integer = Common.CandidateCount(RegistrationID)

            If CanCount = 0 Then
                'msg = "Please Insert Basic Information First"
                'Response.Redirect("HRMCandidateBasicInfo.aspx?Message=" + msg)
                Session("Message") = "Please Insert Basic Information First"
                Response.Redirect("HRMCandidateBasicInfo.aspx?msg=1")
            End If

            Dim YearOfExp As Double

            Dim YrExp As Double = EducationInformation.CandidateExperirnce(CandidateID, YearOfExp)

            If YrExp <> 0 Then
                Dim CanExpCount As Integer = Common.CandidateExperienceCount(CandidateID)

                If CanExpCount = 0 Then
                    'msg = "Please Insert Experience Information as Your Year of Experience is " + YrExp.ToString()
                    Session("Message") = "Please Insert Experience Information as You Have Experience"
                    'msg = "Please Insert Experience Information as You Have Experience"
                    Response.Redirect("CandidateExperienceInfo.aspx?msg=1")
                End If
            End If

            btnNext.Enabled = False
            idForOthers.Visible = False

            lblInstitutionAdd.Visible = False
            ShowInstitutionList()

            ddlMajor.DataBind()
            dsMajor.DataBind()
            ddlMajor.Items.Insert(0, "-Select-")

            If ddlResultType.SelectedValue = "-Select-" Then
                ForGPA.Visible = False
                ForDivision.Visible = False
            End If

            Dim dtEducationInfo As DataTable = New DataTable()
            dtEducationInfo = FormatEducationInfo()
            Session("CandidateEduInfo") = dtEducationInfo

            Dim count As Integer = Common.CandidateCount(RegistrationID)

            If count = 0 Then
                Exit Sub
            Else
                dtEducationInfo = EducationInformation.fnGetEducationInformation(CandidateID).Tables(0)
                grdEducation.DataSource = dtEducationInfo
                grdEducation.DataBind()
                Session("CandidateEduInfo") = dtEducationInfo

            End If

            btnSubmit.Enabled = False
            Dim dtProfessionalCertificationInfo As DataTable = New DataTable()
            dtProfessionalCertificationInfo = FormatProfessionalCertificationInfo()
            Session("CandidateProfessionalCertificationInfo") = dtProfessionalCertificationInfo

            If count = 0 Then
                Exit Sub
            Else

                dtProfessionalCertificationInfo = EducationInformation.fnGetProCertificationInformation(CandidateID).Tables(0)
                grdCertification.DataSource = dtProfessionalCertificationInfo
                grdCertification.DataBind()
                Session("CandidateProfessionalCertificationInfo") = dtProfessionalCertificationInfo

                If dtProfessionalCertificationInfo.Rows.Count <> 0 Then
                    rdbtnIsProfessionalCertificationExists.SelectedValue = "YES"
                    pnlCanProfCertificationInfo.Visible = True
                    pnlCertification.Visible = True
                End If
            End If
        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub rdbtnIsProfessionalCertificationExists_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdbtnIsProfessionalCertificationExists.SelectedIndexChanged
        If rdbtnIsProfessionalCertificationExists.SelectedValue = "YES" Then
            pnlCanProfCertificationInfo.Visible = True
            pnlCertification.Visible = True
        Else
            pnlCanProfCertificationInfo.Visible = False
            pnlCertification.Visible = False
        End If
    End Sub
End Class
