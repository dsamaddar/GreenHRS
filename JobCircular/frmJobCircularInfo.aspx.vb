
Partial Class JobCircular_frmJobCircularInfo
    Inherits System.Web.UI.Page

    Dim JobCircularData As New clsJobCircularDataAccess()
    Dim DeptData As New clsDepartmentDataAccess()
    Dim OrgInfoData As New clsOrganizationInfoDataAccess()

    Protected Sub btnInsertCircularInfo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertCircularInfo.Click
        Dim ImageUpChecker As New clsImageUpLoader()
        Dim JobCircularInfo As New clsJobCircular()

        JobCircularInfo.JobTitle = txtJobTitle.Text
        JobCircularInfo.CircularCode = txtCircularCode.Text
        JobCircularInfo.JobLocation = txtJobLocation.Text
        JobCircularInfo.OrganizationID = drpOrganizations.SelectedValue
        JobCircularInfo.DepartmentID = drpDepartment.SelectedValue
        JobCircularInfo.JobDescription = txtJobDescription.Text
        JobCircularInfo.JobResponsibility = txtJobResponsibility.Text
        JobCircularInfo.SpecialSkillReq = txtSpecialSkillsRequired.Text
        JobCircularInfo.AddiJobReq = txtAdditionalJobRequiremnt.Text
        JobCircularInfo.EducationalReq = txtEducationalRequirement.Text
        JobCircularInfo.ExperienceReqInYrs = Convert.ToInt32(txtExperienceRequired.Text)
        JobCircularInfo.DutySchedule = txtDutySchedule.Text
        JobCircularInfo.SalaryAndBenefits = txtSalaryAndBenefits.Text
        JobCircularInfo.Vacancies = txtVacancies.Text
        JobCircularInfo.Competencies = txtCompetencies.Text
        JobCircularInfo.CommunicationSkill = txtCommunicationSkill.Text
        JobCircularInfo.MinAgeLimit = Convert.ToInt32(txtMinAgeLimit.Text)
        JobCircularInfo.MaxAgeLimit = Convert.ToInt32(txtMaxAgeLimit.Text)
        JobCircularInfo.ReportableTo = txtReportableTo.Text
        JobCircularInfo.ApplyInstructions = txtHowToApply.Text
        JobCircularInfo.CompanyAddress = txtCompanyAddress.Text
        JobCircularInfo.TermsOfReferences = txtTermsOfReferences.Text
        JobCircularInfo.ClosingDate = Convert.ToDateTime(txtClosingDate.Text)
        JobCircularInfo.HeaderNote = txtHeaderNote.Text
        JobCircularInfo.FooterNote = txtFooterNote.Text
        JobCircularInfo.MaxApplicant = Convert.ToInt32(txtMaximumApplicant.Text)

        '' Header Image.
        If flupHeaderImage.HasFile Then
            ImageUpChecker = fnUploadImage(flupHeaderImage)

            If ImageUpChecker.Successful = 1 Then
                JobCircularInfo.HeaderImage = ImageUpChecker.ImageName
            Else
                Exit Sub
            End If
        Else
            JobCircularInfo.HeaderImage = ""
        End If

        '' Middle Image
        If flupMiddleImage.HasFile Then
            ImageUpChecker = fnUploadImage(flupMiddleImage)

            If ImageUpChecker.Successful = 1 Then
                JobCircularInfo.MiddleImage = ImageUpChecker.ImageName
            Else
                Exit Sub
            End If
        Else
            JobCircularInfo.MiddleImage = ""
        End If

        '' Footer Image
        If flupFooterImage.HasFile Then
            ImageUpChecker = fnUploadImage(flupFooterImage)

            If ImageUpChecker.Successful = 1 Then
                JobCircularInfo.FooterImage = ImageUpChecker.ImageName
            Else
                Exit Sub
            End If
        Else
            JobCircularInfo.FooterImage = ""
        End If

        '' Attachments
        If flupAttachment.HasFile Then
            ImageUpChecker = fnUploadImage(flupAttachment)

            If ImageUpChecker.Successful = 1 Then
                JobCircularInfo.Attachment = ImageUpChecker.ImageName
            Else
                Exit Sub
            End If
        Else
            JobCircularInfo.Attachment = ""
        End If


        Dim UserID As String
        UserID = Session("LoginUserID")

        JobCircularInfo.EntryBy = UserID

        Dim Check As Integer = JobCircularData.fnInsertJobCircular(JobCircularInfo)

        If Check = 1 Then
            ClearJobCircularForm()
            ShowJobList()
            MessageBox("Inserted.")
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Function fnUploadData(ByVal fileUploader As FileUpload) As clsImageUpLoader

        Dim ImageUploader As New clsImageUpLoader()

        Dim folder As String = ""
        Dim DocExt As String = ""
        Dim DocFullName As String = ""
        Dim DocPrefix As String = ""
        Dim FileSize As Integer = 0
        Dim DocFileName As String = ""
        Try
            folder = Server.MapPath("~/Sources/Attachments/")

            FileSize = fileUploader.PostedFile.ContentLength()
            If FileSize > 512000 Then
                MessageBox("File size should be within 500KB")
                Return Nothing
            End If

            ' DocPrefix = Title.Replace(" ", "")
            DocExt = System.IO.Path.GetExtension(fileUploader.FileName)
            DocPrefix = fileUploader.FileName.Replace(DocExt, "").Replace(" ", "")

            DocFileName = "FILE_" & DateTime.Now.ToString("ddMMyyHHmmss") & "_" & DocPrefix & DocExt
            DocFullName = folder & DocFileName
            fileUploader.SaveAs(DocFullName)
            ImageUploader.ImageName = DocFileName
            ImageUploader.Successful = 1
            Return ImageUploader

        Catch ex As Exception
            MessageBox(ex.Message)
            Return ImageUploader
        End Try

    End Function

    Protected Function fnUploadImage(ByVal fileUploader As FileUpload) As clsImageUpLoader

        Dim ImageUploader As New clsImageUpLoader()

        Dim folder As String = ""
        Dim DocExt As String = ""
        Dim DocFullName As String = ""
        Dim DocPrefix As String = ""
        Dim FileSize As Integer = 0
        Dim DocFileName As String = ""
        Try
            folder = Server.MapPath("~/Sources/Attachments/")

            FileSize = fileUploader.PostedFile.ContentLength()
            If FileSize > 512000 Then
                MessageBox("File size should be within 500KB")
                Return Nothing
            End If

            ' DocPrefix = Title.Replace(" ", "")
            DocExt = System.IO.Path.GetExtension(fileUploader.FileName)
            DocPrefix = fileUploader.FileName.Replace(DocExt, "").Replace(" ", "")

            If DocExt = ".jpg" Or DocExt = ".gif" Or DocExt = ".png" Then
                DocFileName = "JC_IMG_" & DateTime.Now.ToString("ddMMyyHHmmss") & "_" & DocPrefix & DocExt
                DocFullName = folder & DocFileName
                fileUploader.SaveAs(DocFullName)
                ImageUploader.ImageName = DocFileName
                ImageUploader.Successful = 1
                Return ImageUploader
            Else
                ImageUploader.ImageName = "Error"
                ImageUploader.Successful = 0
                MessageBox("Select Image File Only")
                Return ImageUploader
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
            Return ImageUploader
        End Try

    End Function

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub ClearJobCircularForm()
        txtJobTitle.Text = ""
        txtCircularCode.Text = ""
        txtJobLocation.Text = ""
        drpOrganizations.SelectedIndex = -1
        drpDepartment.SelectedIndex = -1
        txtJobDescription.Text = ""
        txtJobResponsibility.Text = ""
        txtSpecialSkillsRequired.Text = ""
        txtAdditionalJobRequiremnt.Text = ""
        txtEducationalRequirement.Text = ""
        txtExperienceRequired.Text = ""
        txtClosingDate.Text = ""
        txtHeaderNote.Text = ""
        txtMaximumApplicant.Text = ""

        txtDutySchedule.Text = ""
        txtSalaryAndBenefits.Text = ""
        txtVacancies.Text = ""
        txtCompetencies.Text = ""
        txtCommunicationSkill.Text = ""
        txtMinAgeLimit.Text = ""
        txtMaxAgeLimit.Text = ""
        txtReportableTo.Text = ""
        txtHowToApply.Text = ""
        txtCompanyAddress.Text = ""
        txtTermsOfReferences.Text = ""
        txtFooterNote.Text = ""

        hpHeaderImage.Visible = False
        hpFooterImage.Visible = False
        hpMiddleImage.Visible = False
        hpAttachment.Visible = False

        idTr.Visible = False

        btnInsertCircularInfo.Enabled = True
        btnUpdateCircular.Enabled = False

    End Sub

    Protected Sub btnCancelSelection_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelSelection.Click
        ClearJobCircularForm()
        drpAvailableJobCircular.SelectedIndex = 0
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            ShowOrgList()
            ShowDeptList()
            ShowJobList()

            idTr.Visible = False
            hpHeaderImage.Visible = False
            hpFooterImage.Visible = False
            hpMiddleImage.Visible = False
            hpAttachment.Visible = False

            btnUpdateCircular.Enabled = False
        End If
    End Sub

    Protected Sub ShowOrgList()
        drpOrganizations.DataTextField = "OrgName"
        drpOrganizations.DataValueField = "OrganizationID"
        drpOrganizations.DataSource = OrgInfoData.fnShowOrgList()
        drpOrganizations.DataBind()
    End Sub

    Protected Sub ShowDeptList()
        drpDepartment.DataTextField = "DeptName"
        drpDepartment.DataValueField = "DepartmentID"
        drpDepartment.DataSource = DeptData.fnGetDeptList()
        drpDepartment.DataBind()
    End Sub

    Protected Sub btnReCreate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReCreate.Click

    End Sub

    Protected Sub btnUpdateCircular_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateCircular.Click
        Dim ImageUpChecker As New clsImageUpLoader()
        Dim JobCircularInfo As New clsJobCircular()
        Dim CircularID As String

        CircularID = drpAvailableJobCircular.SelectedValue

        JobCircularInfo.JobTitle = txtJobTitle.Text
        JobCircularInfo.CircularCode = txtCircularCode.Text
        JobCircularInfo.JobLocation = txtJobLocation.Text
        JobCircularInfo.OrganizationID = drpOrganizations.SelectedValue
        JobCircularInfo.DepartmentID = drpDepartment.SelectedValue
        JobCircularInfo.JobDescription = txtJobDescription.Text
        JobCircularInfo.JobResponsibility = txtJobResponsibility.Text
        JobCircularInfo.SpecialSkillReq = txtSpecialSkillsRequired.Text
        JobCircularInfo.AddiJobReq = txtAdditionalJobRequiremnt.Text
        JobCircularInfo.EducationalReq = txtEducationalRequirement.Text
        JobCircularInfo.ExperienceReqInYrs = Convert.ToInt32(txtExperienceRequired.Text)
        JobCircularInfo.DutySchedule = txtDutySchedule.Text
        JobCircularInfo.SalaryAndBenefits = txtSalaryAndBenefits.Text
        JobCircularInfo.Vacancies = txtVacancies.Text
        JobCircularInfo.Competencies = txtCompetencies.Text
        JobCircularInfo.CommunicationSkill = txtCommunicationSkill.Text
        JobCircularInfo.MinAgeLimit = Convert.ToInt32(txtMinAgeLimit.Text)
        JobCircularInfo.MaxAgeLimit = Convert.ToInt32(txtMaxAgeLimit.Text)
        JobCircularInfo.ReportableTo = txtReportableTo.Text
        JobCircularInfo.ApplyInstructions = txtHowToApply.Text
        JobCircularInfo.CompanyAddress = txtCompanyAddress.Text
        JobCircularInfo.TermsOfReferences = txtTermsOfReferences.Text
        JobCircularInfo.ClosingDate = Convert.ToDateTime(txtClosingDate.Text)
        JobCircularInfo.HeaderNote = txtHeaderNote.Text
        JobCircularInfo.FooterNote = txtFooterNote.Text
        JobCircularInfo.MaxApplicant = Convert.ToInt32(txtMaximumApplicant.Text)

        '' Header Image.
        JobCircularInfo.HeaderImage = ""

        If hpHeaderImage.NavigateUrl <> "" Then
            JobCircularInfo.HeaderImage = Replace(hpHeaderImage.NavigateUrl, "~/Sources/Attachments/", "")
        End If


        If flupHeaderImage.HasFile Then
            ImageUpChecker = fnUploadImage(flupHeaderImage)

            If ImageUpChecker.Successful = 1 Then
                JobCircularInfo.HeaderImage = ImageUpChecker.ImageName
            Else
                Exit Sub
            End If
        End If

        '' Middle Image
        JobCircularInfo.MiddleImage = ""

        If hpMiddleImage.NavigateUrl <> "" Then
            JobCircularInfo.MiddleImage = Replace(hpMiddleImage.NavigateUrl, "~/Sources/Attachments/", "")
        End If

        If flupMiddleImage.HasFile Then
            ImageUpChecker = fnUploadImage(flupMiddleImage)

            If ImageUpChecker.Successful = 1 Then
                JobCircularInfo.MiddleImage = ImageUpChecker.ImageName
            Else
                Exit Sub
            End If
        End If

        '' Footer Image
        JobCircularInfo.FooterImage = ""

        If hpFooterImage.NavigateUrl <> "" Then
            JobCircularInfo.FooterImage = Replace(hpFooterImage.NavigateUrl, "~/Sources/Attachments/", "")
        End If

        If flupFooterImage.HasFile Then
            ImageUpChecker = fnUploadImage(flupFooterImage)

            If ImageUpChecker.Successful = 1 Then
                JobCircularInfo.FooterImage = ImageUpChecker.ImageName
            Else
                Exit Sub
            End If
        End If

        '' Attachments
        JobCircularInfo.Attachment = ""

        If hpAttachment.NavigateUrl <> "" Then
            JobCircularInfo.Attachment = Replace(hpAttachment.NavigateUrl, "~/Sources/Attachments/", "")
        End If

        If flupAttachment.HasFile Then
            ImageUpChecker = fnUploadImage(flupAttachment)

            If ImageUpChecker.Successful = 1 Then
                JobCircularInfo.Attachment = ImageUpChecker.ImageName
            Else
                Exit Sub
            End If
        End If


        Dim UserID As String
        UserID = Session("LoginUserID")

        JobCircularInfo.EntryBy = UserID

        Dim Check As Integer = JobCircularData.fnUpdateJobCircular(CircularID, JobCircularInfo)

        If Check = 1 Then
            ClearJobCircularForm()
            ShowJobList()
            MessageBox("Updated.")
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub drpAvailableJobCircular_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpAvailableJobCircular.SelectedIndexChanged

        If drpAvailableJobCircular.SelectedValue = "-Select-" Then
            ClearJobCircularForm()
            btnInsertCircularInfo.Enabled = True
            btnUpdateCircular.Enabled = False
            Exit Sub
        End If

        Dim JobTitle As String = ""
        Dim CircularCode As String = ""
        Dim DutySchedule As String = ""
        Dim JobLocation As String = ""
        Dim SalaryBenefits As String = ""
        Dim Organization As String = ""
        Dim Vacancies As String = ""
        Dim Department As String = ""
        Dim Competencies As String = ""
        Dim JobDescription As String = ""
        Dim CommunicationSkill As String = ""
        Dim JobResponsibility As String = ""
        Dim MinAgeLimit As String = ""
        Dim SpecialSkillsRequired As String = ""
        Dim MaxAgeLimit As String = ""
        Dim AdditionalJobRequirement As String = ""
        Dim ReportableTo As String = ""
        Dim EducationalsRequirement As String = ""
        Dim HowToApply As String = ""
        Dim ExperienceRequired As String = ""
        Dim CompanyAddress As String = ""
        Dim ClosingDate As String = ""
        Dim TermsOfReferences As String = ""
        Dim MaximumApplicant As String = ""
        Dim Attachment As String = ""

        Dim CircularID As String = ""

        Dim HeaderImage As String = ""
        Dim footerImage As String = ""
        Dim MiddleImage As String = ""

        Dim HeaderNote As String = ""
        Dim FooterNote As String = ""

        Dim CharClosingDate As String = ""


        CircularID = drpAvailableJobCircular.SelectedValue

        JobCircularData.GetApplicationExpenseRequestDetail(CircularID, JobTitle, CircularCode, DutySchedule, JobLocation, SalaryBenefits, Organization, Vacancies, Department, Competencies, JobDescription, CommunicationSkill, JobResponsibility, MinAgeLimit, SpecialSkillsRequired, AdditionalJobRequirement, MaxAgeLimit, ReportableTo, EducationalsRequirement, HowToApply, ExperienceRequired, CompanyAddress, ClosingDate, TermsOfReferences, MaximumApplicant, HeaderImage, footerImage, MiddleImage, HeaderNote, FooterNote, Attachment)

        txtJobTitle.Text = JobTitle
        txtCircularCode.Text = CircularCode
        txtDutySchedule.Text = DutySchedule
        txtJobLocation.Text = JobLocation
        txtSalaryAndBenefits.Text = SalaryBenefits
        drpOrganizations.SelectedItem.Text = Organization
        txtVacancies.Text = Vacancies
        drpDepartment.SelectedItem.Text = Department
        txtCompetencies.Text = Competencies
        txtJobDescription.Text = JobDescription
        txtCommunicationSkill.Text = CommunicationSkill
        txtJobResponsibility.Text = JobResponsibility
        txtMinAgeLimit.Text = MinAgeLimit
        txtSpecialSkillsRequired.Text = SpecialSkillsRequired
        txtMaxAgeLimit.Text = MaxAgeLimit
        txtAdditionalJobRequiremnt.Text = AdditionalJobRequirement
        txtReportableTo.Text = ReportableTo
        txtEducationalRequirement.Text = EducationalsRequirement
        txtHowToApply.Text = HowToApply
        txtExperienceRequired.Text = ExperienceRequired
        txtCompanyAddress.Text = CompanyAddress
        txtClosingDate.Text = ClosingDate
        txtTermsOfReferences.Text = TermsOfReferences
        txtHeaderNote.Text = HeaderNote
        txtFooterNote.Text = FooterNote
        txtMaximumApplicant.Text = MaximumApplicant

        Dim DateToday As DateTime = DateTime.Today()
        Dim datechar As String = DateToday.ToString("dd MMM yyyy")


        If datechar > ClosingDate Then
            idTr.Visible = True
            idLabel.Text = "Duration of this job already expired"

        Else
            idTr.Visible = False
        End If

        If HeaderImage <> "" Then
            hpHeaderImage.Visible = True
            hpHeaderImage.NavigateUrl = "~/Sources/Attachments/" & HeaderImage
        Else
            hpHeaderImage.Visible = False
        End If

        If footerImage <> "" Then
            hpFooterImage.Visible = True
            hpFooterImage.NavigateUrl = "~/Sources/Attachments/" & footerImage
        Else
            hpFooterImage.Visible = False
        End If

        If MiddleImage <> "" Then
            hpMiddleImage.Visible = True
            hpMiddleImage.NavigateUrl = "~/Sources/Attachments/" & MiddleImage
        Else
            hpMiddleImage.Visible = False
        End If

        If Attachment <> "" Then
            hpAttachment.Visible = True
            hpAttachment.NavigateUrl = "~/Sources/Attachments/" & Attachment
        Else
            hpAttachment.Visible = False
        End If

        btnInsertCircularInfo.Enabled = False
        btnUpdateCircular.Enabled = True


    End Sub

    Protected Sub ShowJobList()
        drpAvailableJobCircular.DataTextField = "JobTitle"
        drpAvailableJobCircular.DataValueField = "CircularID"
        drpAvailableJobCircular.DataSource = JobCircularData.fnGetJobList()
        drpAvailableJobCircular.DataBind()
        drpAvailableJobCircular.Items.Insert(0, "-Select-")
    End Sub
End Class
