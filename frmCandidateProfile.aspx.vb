Imports System.Net.Mail

Partial Class frmCandidateProfile
    Inherits System.Web.UI.Page

    Dim CandidateData As New clsCanBasicDataAccess()
    Dim AppliedJobData As New clsAppliedJobDataAccess()
    Dim CVSelectionData As New clsCVSelectionDataAccess()
    Dim DistrictData As New clsDistrictDataAccess()
    Dim EducationData As New clsCanEduDataAccess()
    Dim CanEduData As New clsCanEduDataAccess()
    Dim SMSServiceData As New clsSMSServiceDataAccess()
    Dim CandidateResData As New clsCandidateResponseDataAccess()

    Dim TotalCandidate As Integer = 0

    Protected Sub btnSearchApplicant_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearchApplicant.Click

        If Trim(txtCandidate.Text) = "" Then
            MessageBox("Search Criteria Can't be blank.")
        End If

        grdMatchedApplicant.SelectedIndex = -1

        grdMatchedApplicant.DataSource = ""
        grdMatchedApplicant.DataBind()

        grdAppliedJobStatus.DataSource = ""
        grdAppliedJobStatus.DataBind()

        'SearchApplicantProfile(Trim(txtCandidate.Text))

        Dim CVSelection As New clsCVSelection()

        Try
            CVSelection.CandidateName = txtCandidate.Text
            CVSelection.InstitutionID = drpUniversityList.SelectedValue
            CVSelection.PresentDistrictID = drpPresentDistrict.SelectedValue
            CVSelection.PermanentDistrictID = drpPermanentDistrict.SelectedValue
            CVSelection.Gender = drpGenderList.SelectedValue
            CVSelection.AgeFrom = Convert.ToInt32(txtAgeFrom.Text)
            CVSelection.AgeTo = Convert.ToInt32(txtAgeTo.Text)
            CVSelection.YearOfExperience = Convert.ToInt32(txtExperience.Text)
            CVSelection.MajorTypeID = drpSubjects.SelectedValue
            CVSelection.SpecializedID = ""

            grdMatchedApplicant.DataSource = CVSelectionData.fnSearchTotalApplicant(CVSelection)
            grdMatchedApplicant.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub SearchApplicantProfile(ByVal Candidate As String)
        Try
            grdMatchedApplicant.DataSource = CandidateData.fnSearchApplicantProfile(Candidate)
            grdMatchedApplicant.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetPresentDistrictInfo()
            GetInstitutionList()
            GetPermanentDistrictInfo()
            ShowSubjects()
            txtAgeFrom.Text = "20"
            txtAgeTo.Text = "60"
            txtExperience.Text = "0"
        End If
    End Sub

    Protected Sub ShowSubjects()
        drpSubjects.DataTextField = "MajorType"
        drpSubjects.DataValueField = "MajorTypeID"
        drpSubjects.DataSource = CanEduData.fnGetAllMajorList()
        drpSubjects.DataBind()

        Dim a As New ListItem()
        a.Value = "0"
        a.Text = "N\A"

        drpSubjects.Items.Insert(0, a)
    End Sub

    Protected Sub GetPresentDistrictInfo()
        drpPresentDistrict.DataTextField = "DistrictName"
        drpPresentDistrict.DataValueField = "DistrictID"
        drpPresentDistrict.DataSource = DistrictData.GetDistricts()
        drpPresentDistrict.DataBind()

        Dim a As New ListItem()
        a.Value = "0"
        a.Text = "N\A"

        drpPresentDistrict.Items.Insert(0, a)

    End Sub

    Protected Sub GetInstitutionList()
        drpUniversityList.DataTextField = "InstitutionName"
        drpUniversityList.DataValueField = "InstitutionID"
        drpUniversityList.DataSource = EducationData.fnGetInstitutionList()
        drpUniversityList.DataBind()

        Dim a As New ListItem()
        a.Value = "0"
        a.Text = "N\A"

        drpUniversityList.Items.Insert(0, a)
    End Sub

    Protected Sub GetPermanentDistrictInfo()
        drpPermanentDistrict.DataTextField = "DistrictName"
        drpPermanentDistrict.DataValueField = "DistrictID"
        drpPermanentDistrict.DataSource = DistrictData.GetDistricts()
        drpPermanentDistrict.DataBind()

        Dim a As New ListItem()
        a.Value = "0"
        a.Text = "N\A"

        drpPermanentDistrict.Items.Insert(0, a)
    End Sub


    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub ClearForm()

        grdMatchedApplicant.SelectedIndex = -1

        grdMatchedApplicant.DataSource = ""
        grdMatchedApplicant.DataBind()

        txtCandidate.Text = ""

        grdAppliedJobStatus.DataSource = ""
        grdAppliedJobStatus.DataBind()

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearForm()
    End Sub

    Protected Sub grdMatchedApplicant_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdMatchedApplicant.RowDataBound
        Try
            If e.Row.RowType = DataControlRowType.DataRow Then
                TotalCandidate += 1
            End If

            If e.Row.RowType = DataControlRowType.Footer Then
                e.Row.Cells(2).Text = "Total:"
                e.Row.Cells(3).Text = TotalCandidate.ToString()
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub grdMatchedApplicant_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdMatchedApplicant.SelectedIndexChanged
        Try
            Dim lblCandidateID As Label
            lblCandidateID = grdMatchedApplicant.SelectedRow.FindControl("lblCandidateID")

            grdAppliedJobStatus.DataSource = AppliedJobData.fnGetAppStatusByCandidate(lblCandidateID.Text)
            grdAppliedJobStatus.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        Dim SMSService As New clsSMSService()
        Dim SMSContentList As String = ""
        Dim chkSelectExamTaker As New CheckBox
        Dim lblExamRollNo, lblExamTakerID, lblUserName, lblContactNo, lblEmail, lblAlternateEmail As New Label
        Dim CanResponse As New clsCandidateResponse()

        If grdMatchedApplicant.SelectedIndex = -1 Then
            MessageBox("Select An Applicant First.")
            Exit Sub
        End If

        If chkLstCommMethod.SelectedValue = "SMS" And Trim(txtSMSContent.Text) = "" Then
            MessageBox("SMS Content Can't Be Empty.")
            Exit Sub
        End If

        If chkLstCommMethod.SelectedValue = "EMail" And Trim(txtEMailContent.Text) = "" Then
            MessageBox("Email Content Can't Be Empty.")
            Exit Sub
        End If

        Try

            Dim CanRes As Integer = 0

            CanResponse.Options = "Interview Notification"
            CanResponse.AssessedBy = Session("LoginUserID")

            For Each chkbx As System.Web.UI.WebControls.ListItem In chkLstCommMethod.Items
                If chkbx.Selected = True Then
                    If chkbx.Text = "SMS" Then

                        lblUserName = grdMatchedApplicant.SelectedRow.FindControl("lblCandidateName")
                        lblExamTakerID = grdMatchedApplicant.SelectedRow.FindControl("lblCandidateID")
                        lblContactNo = grdMatchedApplicant.SelectedRow.FindControl("lblContactNo")
                        CanResponse.CandidateID = lblExamTakerID.Text
                        SMSContentList = SMSContentList & lblUserName.Text & "~" & lblExamTakerID.Text & "~" & lblContactNo.Text & "~" & txtSMSContent.Text & "~|"

                        SMSService.SMSContentList = SMSContentList
                        '' Send SMS
                        Dim chk As Integer = SMSServiceData.fnInsertSMSContentList_SMS(SMSService)

                        If chk = 1 Then
                            CanResponse.CommunicationMethod = "SMS"
                            CanResponse.Remarks = txtSMSContent.Text
                            CanRes = CandidateResData.fnInsertCanResponse(CanResponse)
                            MessageBox("SMS Sent Successfully.")
                        Else
                            MessageBox("Error While SMS Sent.")
                        End If
                    End If
                End If

                If chkbx.Text = "EMail" Then

                    Dim sb As StringBuilder = New StringBuilder()
                    Dim mail As New Net.Mail.MailMessage()

                    mail.Bcc.Add("Debayan@ulc.com")
                    mail.From = New MailAddress("Career@ulc.com.bd")
                    mail.Subject = "United Leasing Recruitment Services"

                    lblExamRollNo = grdMatchedApplicant.SelectedRow.FindControl("lblExamRollNo")
                    lblUserName = grdMatchedApplicant.SelectedRow.FindControl("lblCandidateName")
                    lblEmail = grdMatchedApplicant.SelectedRow.FindControl("lblEmail")
                    lblAlternateEmail = grdMatchedApplicant.SelectedRow.FindControl("lblAlternateEmail")
                    lblExamTakerID = grdMatchedApplicant.SelectedRow.FindControl("lblCandidateID")

                    CanResponse.CandidateID = lblExamTakerID.Text
                    CanResponse.CommunicationMethod = "EMail"
                    CanResponse.Remarks = txtEMailContent.Text
                    CanRes = CandidateResData.fnInsertCanResponse(CanResponse)

                    If lblEmail.Text <> "" Then ' Original E-Mail Addr
                        mail.To.Add(lblEmail.Text)
                    End If
                    If lblAlternateEmail.Text <> "" Then ' Alternate E-Mail Addr
                        mail.To.Add(lblAlternateEmail.Text)
                    End If

                    sb.Append("<html><head></head><body><table border=0> <tr><td><b>")
                    sb.Append("Dear " + lblUserName.Text + ",")
                    sb.Append("</b></td></br></br></tr>")
                    sb.Append("<tr><td></td></tr>")
                    sb.Append("<tr><td></td></tr>")
                    sb.Append("<tr><td>")
                    sb.Append("" + txtEMailContent.Text + "")
                    sb.Append("</td></tr>")
                    sb.Append("<tr><td>")
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
                    sb.Remove(0, sb.Length)

                End If

            Next
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

End Class
