Imports System
Imports System.IO
Imports System.Drawing
Imports System.Net.Mail

Partial Class JobCircular_frmShowJobCircularDetails
    Inherits System.Web.UI.Page

    Dim JobApply As New clsJobCircularDataAccess()
    Dim JobCircularData As New clsJobCircularDataAccess()
    Dim CanMailInfoData As New clsCandidateMailInfoDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then

            Dim UserID As String
            Dim CircularID As String
            Dim CandidateID As String

            Dim RegistrationID As String
            RegistrationID = Session("RegistrationID")

            UserID = Session("LoginUserID")

            CircularID = Request.QueryString("CircularID")

            CandidateID = Common.GetCandidateID(RegistrationID)

            Dim count As Integer = clsJobCircularDataAccess.CandidateAppliedJobCount(CircularID, CandidateID)

            If count <> 0 Then
                btnApply.Enabled = False
                idLabel.Text = "Already Applied"
            End If

            Dim JobCircular As New clsJobCircular()

            JobCircular = JobCircularData.fnGetJobCircularDetailsView(CircularID)

            lblJobTitle.Text = JobCircular.JobTitle
            lblDutySchedule.Text = JobCircular.DutySchedule
            lblJobLocation.Text = JobCircular.JobLocation
            lblSalaryAndBenefits.Text = JobCircular.SalaryAndBenefits
            lblOrganizations.Text = JobCircular.OrganizationID
            lblVacancies.Text = JobCircular.Vacancies
            lblDepartment.Text = JobCircular.DepartmentID
            lblCompetencies.Text = JobCircular.Competencies
            lblJobDescription.Text = JobCircular.JobDescription
            lblCommunicationSkill.Text = JobCircular.CommunicationSkill
            lblJobResponsibility.Text = JobCircular.JobResponsibility
            lblAgeLimit.Text = "( " + JobCircular.MinAgeLimit.ToString() + " - " + JobCircular.MaxAgeLimit.ToString() + " )"
            lblSpecialSkillsRequired.Text = JobCircular.SpecialSkillReq
            lblAdditionalJobRequiremnt.Text = JobCircular.AddiJobReq
            lblReportableTo.Text = JobCircular.ReportableTo
            lblEducationalRequirement.Text = JobCircular.EducationalReq
            lblHowToApply.Text = JobCircular.ApplyInstructions
            lblExperienceRequired.Text = JobCircular.ExperienceReqInYrs
            lblCompanyAddress.Text = JobCircular.CompanyAddress
            lblClosingDate.Text = JobCircular.ClosingDate
            lblTermsOfReferences.Text = JobCircular.TermsOfReferences
            lblMaximumApplicant.Text = JobCircular.MaxApplicant


            If JobCircular.HeaderNote = "" Then
                lblHeaderNote.Text = "N/A"
            Else
                lblHeaderNote.Text = JobCircular.HeaderNote
            End If

            If JobCircular.FooterNote = "" Then
                lblFooterNote.Text = "N/A"
            Else
                lblFooterNote.Text = JobCircular.FooterNote
            End If


            lblAttachment.NavigateUrl = "~/Sources/Attachments/" & JobCircular.Attachment
            lblAttachment.Text = JobCircular.Attachment

            If JobCircular.HeaderImage <> "" Then
                imgHeader.ImageUrl = "~/Sources/Attachments/" + JobCircular.HeaderImage
            End If


            If JobCircular.MiddleImage <> "" Then
                imgMiddle.ImageUrl = "~/Sources/Attachments/" + JobCircular.MiddleImage
                idPanel.Visible = False
                idMiddleImage.Visible = True
            Else
                idMiddleImage.Visible = False
                idPanel.Visible = True
            End If

            If JobCircular.FooterImage <> "" Then
                imgFooter.ImageUrl = "~/Sources/Attachments/" + JobCircular.FooterImage
            End If


            lblAttachment.NavigateUrl = "~/Sources/Attachments/" & JobCircular.Attachment
            lblAttachment.Text = JobCircular.Attachment
        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnApply_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnApply.Click

        Dim RegistrationID As String
        RegistrationID = Session("RegistrationID")


        If idLabel.Text = "Already Applied" Then
            btnApply.Enabled = False
            Exit Sub
        End If

        Dim CircularID As String
        CircularID = Request.QueryString("CircularID")


        Dim UserID As String
        Dim CandidateID As String
        Dim flag As Double = 0
        UserID = Session("LoginUserID")
        CircularID = Request.QueryString("CircularID")
        CandidateID = Common.GetCandidateID(RegistrationID)

        Dim Status As Boolean = clsCanBasicDataAccess.PresentStatus(CandidateID)

        If Status = False Then
            MessageBox("Please Submit Your Profile")
            Exit Sub
        End If

        Dim count As Integer = clsJobCircularDataAccess.CandidateAppliedJobCount(CircularID, CandidateID)

        If count <> 0 Then
            'Response.Redirect("frmViewJobAdvertisement.aspx?flag=" + "1")
            MessageBox("Already applied for this post")
        Else

            Dim countCandidate As Integer = Common.CandidateCount(RegistrationID)

            If countCandidate = 0 Then
                MessageBox("Please Insert your basic information")
                Exit Sub
            Else
                Dim Message As String = Common.GetMessage(CandidateID)

                If Message <> "" Then
                    MessageBox(Message)
                    Exit Sub
                End If
            End If


            Dim Check As Integer = JobApply.ApplyJobInsert(CircularID, CandidateID, UserID)
            If Check = 1 Then
                'Response.Redirect("frmViewJobAdvertisement.aspx?flag=" + "2")
                MessageBox("Applied Successfully")
                idLabel.Text = "Already Applied"
                btnApply.Enabled = False

                Dim CanMailInfo As clsCandidateMailInfo = CanMailInfoData.fnGetCanMailingInfoAfterAppJob(CandidateID, CircularID)

                Dim CandidateName As String = CanMailInfo.CandidateName
                Dim CandidateEmailAddr As String = CanMailInfo.Email
                Dim CandidateAltEmailAddr As String = CanMailInfo.AlternateEmail
                Dim CircularCode As String = CanMailInfo.CircularCode
                Dim Title As String = CanMailInfo.Title

                Dim sb As StringBuilder = New StringBuilder()
                Dim mail As New Net.Mail.MailMessage()
                If CandidateEmailAddr <> "" Then ' Original E-Mail Addr
                    mail.To.Add(CandidateEmailAddr)
                End If
                If CandidateAltEmailAddr <> "" Then ' Alternate E-Mail Addr
                    mail.To.Add(CandidateAltEmailAddr)
                End If
                mail.Bcc.Add("Debayan@ulc.com")
                mail.Bcc.Add("tahmed1@ulc.com")
                mail.From = New MailAddress("Career@ulc.com.bd")
                mail.Subject = "United Leasing Recruitment Services"
                sb.Append("<html><head></head><body><table border=0> <tr><td><b>")
                sb.Append("Dear " + CandidateName + ",")
                sb.Append("</b></td></br></br></tr>")
                sb.Append("<tr><td></td></tr>")
                sb.Append("<tr><td></td></tr>")
                sb.Append("<tr><td>")
                sb.Append("Thank you for your application to Job # <b>" + CircularCode + "</b> for the position of title <b>" + Title + "</b>.</br>")
                sb.Append("This is to confirm that your application was received and is being reviewed with regards to this vacancy.")
                sb.Append("</td></br></br></tr>")
                sb.Append("<tr><td></td></tr>")
                sb.Append("<tr><td></td></tr>")
                sb.Append("<tr><td>")
                sb.Append("Regards,</td></tr><tr><td>")
                sb.Append("Human Resource</td></tr>")
                sb.Append("<tr><td>United Finance</td></br></br></tr>")
                sb.Append("<tr><td></td></tr>")
                sb.Append("<tr><td><b>NOTE: THIS MESSAGE IS SYSTEM GENERATED.  YOU CANNOT REPLY TO THIS MESSAGE.</b></td></tr>")
                sb.Append("</body></html>")
                mail.Body = sb.ToString()
                mail.IsBodyHtml = True
                Dim smtp As New SmtpClient("192.168.1.242", 25)
                smtp.Send(mail)

            Else
                MessageBox("Error Found.")
            End If
        End If


        'Response.Redirect("frmJobApply.aspx?CircularID=" + CircularID)
    End Sub

End Class
