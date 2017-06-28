Imports System
Imports System.IO
Imports System.Drawing
Imports System.Net.Mail
Imports System.Net

Partial Class CandidateCvView
    Inherits System.Web.UI.Page
    Dim BasicData As New clsCanBasicDataAccess()
    Dim EducationInformation As New clsCanEduDataAccess()
    Dim CanMailInfoData As New clsCandidateMailInfoDataAccess()
    Dim DocumentListData As New clsDocumentListDataAccess()


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If
        If Not IsPostBack Then

            Dim Message As String = ""
            Dim msg As String = ""
            Dim UserID As String
            Dim UserName As String

            UserID = Session("LoginUserID")
            UserName = Session("UserName")

            Dim RegistrationID As String
            RegistrationID = Session("RegistrationID")

            Dim UniqueUserID As String = Session("UniqueUserID")

            Dim CandidateID As String = ""

            CandidateID = Session("CandidateID")


            Dim CanCount As Integer = Common.CandidateCount(RegistrationID)

            If CanCount = 0 Then
                Session("Message") = "Please Insert Basic Information First"
                Response.Redirect("HRMCandidateBasicInfo.aspx?msg=1")
            End If


            Dim YearOfExp As Double

            Dim YrExp As Double = EducationInformation.CandidateExperirnce(CandidateID, YearOfExp)

            If YrExp <> 0 Then
                Dim CanExpCount As Integer = Common.CandidateExperienceCount(CandidateID)

                If CanExpCount = 0 Then
                    Session("Message") = "Please Insert Experience Information as You Have Experience"
                    Response.Redirect("CandidateExperienceInfo.aspx?msg=1")
                End If
            End If



            Dim CanEduCount As Integer = Common.CandidateEducationCount(CandidateID)

            If CanEduCount = 0 Then
                Session("Message") = "Please Insert Education Information"
                Response.Redirect("CandidateEducationInfo.aspx?msg=1")
            End If


            Dim CanRefCount As Integer = Common.CandidateReferenceCount(CandidateID)

            If CanRefCount = 0 Or CanRefCount = 1 Then
                Session("Message") = "Please Insert at least two References"
                Response.Redirect("CandidateReferenceInfo.aspx?msg=1")
            End If


            If CandidateID = "" Or CandidateID = "Nothing" Then
                Exit Sub
            End If



            Dim PresentStatus As Boolean = clsCanBasicDataAccess.PresentStatus(CandidateID)

            If PresentStatus = True Then
                btnSubmit.Enabled = False
                lblMsg.Text = "Information Submitted"
                chkAccept.Checked = True
            Else
                btnSubmit.Enabled = True
                lblMsg.Text = ""
            End If

            Dim BasicInfo As New CanBasicInfo()

            BasicInfo = BasicData.fnGetGetCandidateDetails(CandidateID)

            lblName.Text = BasicInfo.Name
            lblFatherName.Text = BasicInfo.FatherName
            lblFatherOccupation.Text = BasicInfo.FathersOccupation
            lblMotherName.Text = BasicInfo.MotherName
            lblMotherOccupation.Text = BasicInfo.MothersOccupation
            lblSpouseName.Text = BasicInfo.SpouseName
            lblSpouseOccupation.Text = BasicInfo.SpouseOccupation
            lblGender.Text = BasicInfo.Gender
            lblNID.Text = BasicInfo.NIDNo
            lblPassportNo.Text = BasicInfo.PassportNo
            lblNationality.Text = BasicInfo.Nationality
            lblReligion.Text = BasicInfo.Religion
            lblNoofChildrenAge.Text = BasicInfo.NoOfChildrenAge
            lblSibblingsInfo.Text = BasicInfo.SibblingsNameOccupation
            lblPreAddress.Text = BasicInfo.PresentAddress
            lblPreDistrict.Text = BasicInfo.PreDistrict
            lblPreThana.Text = BasicInfo.PreThana
            lblPerAddress.Text = BasicInfo.PermanentAddress
            lblPerDistrict.Text = BasicInfo.PerDistrict
            lblPerThana.Text = BasicInfo.PerThana
            lblHomePhone.Text = BasicInfo.HomePhoneNo
            lblMobileNo.Text = BasicInfo.MobileNumber
            lblOfficePhone.Text = BasicInfo.OfficePhoneNo
            lblYrExp.Text = BasicInfo.YearOfExperience
            lblMonth.Text = BasicInfo.ExpInMonth
            lblEmail.Text = BasicInfo.EMail
            lblAltEmail.Text = BasicInfo.AltEMail
            lblCareerSum.Text = BasicInfo.CareerObjective
            lblPreSalary.Text = BasicInfo.PresentSalary

            If BasicInfo.LastDrawnDate = "01 Jan 1911" Then
                lblDrawnDate.Text = ""
            Else
                lblDrawnDate.Text = BasicInfo.LastDrawnDate
            End If
            lblEmployeer.Text = BasicInfo.Employeer
            lblExpSalary.Text = BasicInfo.ExpectedSalary
            lblLookingFor.Text = BasicInfo.LookingFor
            lblAvailableFor.Text = BasicInfo.AvailableFor
            lblLanPro.Text = BasicInfo.EnglishProficiency
            lblComLiter.Text = BasicInfo.ComputerLiteracy
            'lblPreferredJobLocation.Text = BasicInfo.PreferredJobLocation
            lblRelStatus.Text = BasicInfo.RelationshipStatus
            txtBloodGroup.Text = BasicInfo.BloodGroupID
            lblAboutYrself.Text = BasicInfo.AboutYourself
            lblSpecilizedIn.Text = BasicInfo.SpecilizedIn
            lblDOB.Text = BasicInfo.DOB

            'Setting Profile Picture
            Dim absoluteFilePath As String = ConfigurationManager.AppSettings("AttachmentsShow") & BasicInfo.Attachment

            Dim tClient As WebClient = New WebClient
            Dim memStrmPic As MemoryStream = New MemoryStream(tClient.DownloadData(absoluteFilePath))
            Dim bytesPic As Byte() = memStrmPic.ToArray()
            Dim base64StringPic As String = Convert.ToBase64String(bytesPic, 0, bytesPic.Length)
            imgValidation.ImageUrl = "data:image/png;base64," & base64StringPic
            memStrmPic.Dispose()
            'Setting Profile Picture Ends

            'Setting Signature
            absoluteFilePath = ConfigurationManager.AppSettings("AttachmentsShow") & BasicInfo.Signature
            Dim memStrmSig As MemoryStream = New MemoryStream(tClient.DownloadData(absoluteFilePath))
            Dim bytesSig As Byte() = memStrmSig.ToArray()
            Dim base64StringSig As String = Convert.ToBase64String(bytesSig, 0, bytesSig.Length)
            imgSignature.ImageUrl = "data:image/png;base64," & base64StringSig
            memStrmSig.Dispose()
            'Setting Signature Ends

            If BasicInfo.Attachment = "" Then
                imgValidation.ImageUrl = "~/Sources/images/" & "female_avatar.png"
            End If
            If BasicInfo.Signature = "" Then
                imgSignature.ImageUrl = "~/Sources/images/" & "signature.jpg"
            End If


            grdDocumentList.DataSource = DocumentListData.fnGetUserDocuments(UniqueUserID)
            grdDocumentList.DataBind()

        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        Dim CandidateID As String = ""
        CandidateID = Session("CandidateID")

        If chkAccept.Checked = False Then
            MessageBox("Please Accept the Declaration")
            Exit Sub
        End If

        Dim Message As String = Common.GetMessage(CandidateID)

        If Message <> "" Then
            MessageBox(Message)
            Exit Sub
        End If

        Try
            Dim check As Integer = clsCanBasicDataAccess.Submit(CandidateID)

            If check = 1 Then
                MessageBox("Submitted Successfully")
                lblMsg.Text = "Information Submitted"
                btnSubmit.Enabled = False
                chkAccept.Checked = True

                Dim CanMailInfo As clsCandidateMailInfo = CanMailInfoData.fnGetCanMailingInfo(CandidateID)

                Dim CandidateName As String = CanMailInfo.CandidateName
                Dim CandidateEmailAddr As String = Trim(CanMailInfo.Email)
                Dim CandidateAltEmailAddr As String = Trim(CanMailInfo.AlternateEmail)

                Dim sb As StringBuilder = New StringBuilder()
                Dim mail As New Net.Mail.MailMessage()
                If CandidateEmailAddr <> "" Then ' Original E-Mail Addr
                    mail.To.Add(CandidateEmailAddr)
                End If
                If CandidateAltEmailAddr <> "" Then ' Alternate E-Mail Addr
                    mail.To.Add(CandidateAltEmailAddr)
                End If
                mail.Bcc.Add("Debayan@ulc.com")
                mail.Bcc.Add("mmrahman5@ulc.com")
                mail.Bcc.Add("mbrashid@ulc.com")
                mail.From = New MailAddress("Career@ulc.com.bd")
                mail.Subject = "United Leasing Recruitment Services"
                sb.Append("<html><head></head><body><table border=0> <tr><td><b>")
                sb.Append("Dear " + CandidateName + ",")
                sb.Append("</b></td></br></br></tr>")
                sb.Append("<tr><td></td></tr>")
                sb.Append("<tr><td></td></tr>")
                sb.Append("<tr><td>")
                sb.Append("Thanks For CV Submission. You are requested to apply from currently available jobs.")
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
                MessageBox("Error Found")
                lblMsg.Text = ""
                btnSubmit.Enabled = True
                chkAccept.Checked = False
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub grdDocumentList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdDocumentList.SelectedIndexChanged
        Dim lnk As LinkButton = CType(sender, LinkButton)
        Select Case lnk.CommandName
            Case "Download"
                DlownLoadFile(lnk.CommandArgument)
        End Select
    End Sub

    Protected Sub DlownLoadFile(ByVal FileName As String)
        Try
            Dim StrURL As String = ConfigurationManager.AppSettings("AttachmentsShow") & FileName
            Dim req As WebClient = New WebClient()
            Dim response As HttpResponse = HttpContext.Current.Response
            response.Clear()
            response.ClearContent()
            response.ClearHeaders()
            response.Buffer = True
            response.AddHeader("Content-Disposition", "attachment;filename=" & FileName)
            Dim data As Byte() = req.DownloadData(StrURL)
            response.BinaryWrite(data)
            response.End()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub
End Class
