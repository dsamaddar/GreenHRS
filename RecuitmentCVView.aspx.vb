Imports System
Imports System.Drawing
Imports System.Net
Imports System.IO

Partial Class RecuitmentCVView
    Inherits System.Web.UI.Page

    Dim dataCanBasicInfo As New clsCanBasicDataAccess()
    Dim CVSelectionData As New clsCVSelectionDataAccess()
    Dim DocumentListData As New clsDocumentListDataAccess()
    Dim ExtTestScoreData As New clsExternalTestScoreDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        Try
            Dim CandidateID As String = ""

            CandidateID = Request.QueryString("CandidateID")
            Dim UniqueUserID As String = Session("UniqueUserID")

            If CandidateID = "" Then
                Exit Sub
            End If

            Dim BasicInfo As New CanBasicInfo()

            BasicInfo = dataCanBasicInfo.fnGetCandidateDetailsViewForRecuitment(CandidateID)

            txtName.Text = BasicInfo.Name
            txtDateOfBirth.Text = BasicInfo.DateOfBirth
            txtFatherName.Text = BasicInfo.FatherName
            txtFarherOccupation.Text = BasicInfo.FathersOccupation
            txtMotherName.Text = BasicInfo.MotherName
            txtMotherOccupation.Text = BasicInfo.MothersOccupation
            txtSpouseName.Text = BasicInfo.SpouseName
            txtSpouseOccupation.Text = BasicInfo.SpouseOccupation
            txtgender.Text = BasicInfo.Gender
            txtNID.Text = BasicInfo.NIDNo
            txtPassportNo.Text = BasicInfo.PassportNo
            txtNationality.Text = BasicInfo.Nationality
            txtReligion.Text = BasicInfo.Religion
            txtNoofChildrenAndAge.Text = BasicInfo.NoOfChildrenAge
            txtSibblingsInfo.Text = BasicInfo.SibblingsNameOccupation
            txtPresentAddress.Text = BasicInfo.PresentAddress
            txtPresentDistrict.Text = BasicInfo.PreDistrict
            txtPresentThana.Text = BasicInfo.PreThana
            txtPermanentAddress.Text = BasicInfo.PermanentAddress
            txtPermanentDistrict.Text = BasicInfo.PerDistrict
            txtPermanentThana.Text = BasicInfo.PerThana
            txtHomePhone.Text = BasicInfo.HomePhoneNo
            txtMobileNumber.Text = BasicInfo.MobileNumber
            txtOfficePhone.Text = BasicInfo.OfficePhoneNo
            txtYearofExperience.Text = BasicInfo.YearOfExperience
            txtAlternateEMail.Text = BasicInfo.AltEMail
            txtCareerObjective.Text = BasicInfo.CareerObjective
            txtPresentSalary.Text = BasicInfo.PresentSalary

            If BasicInfo.LastDrawnDate = "01 Jan 1911" Then
                txtPreSalDrawndate.Text = ""
            Else
                txtPreSalDrawndate.Text = BasicInfo.LastDrawnDate
            End If
            txtEmployeer.Text = BasicInfo.Employeer
            txtExpectedSalary.Text = BasicInfo.ExpectedSalary
            txtLookingFor.Text = BasicInfo.LookingFor
            txtAvailableFor.Text = BasicInfo.AvailableFor
            txtEnglishLanguageProficiency.Text = BasicInfo.EnglishProficiency
            txtComputerLiteracy.Text = BasicInfo.ComputerLiteracy
            'txtPreferredJobLocation.Text = BasicInfo.PreferredJobLocation
            txtRelationshipStatus.Text = BasicInfo.RelationshipStatus
            txtBloodGroup.Text = BasicInfo.BloodGroupID
            txtAboutYrself.Text = BasicInfo.AboutYourself
            txtSpecilizedIn.Text = BasicInfo.SpecilizedIn
            lblEmail.Text = BasicInfo.EMail

            If BasicInfo.Attachment = "" Then
                imgValidation.ImageUrl = "~/Attachments/signature.jpg"
            Else
                ShowImage(ConfigurationManager.AppSettings("AttachmentsShow") & BasicInfo.Attachment, "imgValidation")
            End If

            If BasicInfo.Signature = "" Then
                imgSignature.ImageUrl = "~/Attachments/signature.jpg"
            Else
                ShowImage(ConfigurationManager.AppSettings("AttachmentsShow") & BasicInfo.Signature, "imgSignature")
            End If

            GetExamScore(CandidateID)
            GetExtTestScore(CandidateID)
            GetAllInfo(CandidateID)

            grdDocumentList.DataSource = DocumentListData.fnGetUserDocuments(CandidateID)
            grdDocumentList.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
      
    End Sub

    Protected Sub ShowImage(ByVal UrlStr As String, ByVal ControlName As String)
        Dim tClient As WebClient = New WebClient
        Dim memStrmPic As MemoryStream = New MemoryStream(tClient.DownloadData(UrlStr))
        Dim bytesPic As Byte() = memStrmPic.ToArray()
        Dim base64StringPic As String = Convert.ToBase64String(bytesPic, 0, bytesPic.Length)

        Dim imgCtrl As System.Web.UI.WebControls.Image = Me.FindControl(ControlName)
        imgCtrl.ImageUrl = "data:image/png;base64," & base64StringPic
        memStrmPic.Dispose()
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub GetExamScore(ByVal CandidateID As String)
        grdCandidateExamResultSummary.DataSource = CVSelectionData.fnGetCandidateWiseSummaryResult(CandidateID)
        grdCandidateExamResultSummary.DataBind()
    End Sub

    Protected Sub GetExtTestScore(ByVal CandidateID As String)
        grdExternalTestScore.DataSource = ExtTestScoreData.fnGetExtTestScoreByExamTaker(CandidateID)
        grdExternalTestScore.DataBind()
    End Sub

    Protected Sub GetAllInfo(ByVal CandidateID As String)
        grdExpInfo.DataSource = dataCanBasicInfo.fnGetExpForCanDetailView(CandidateID)
        grdExpInfo.DataBind()

        grdProCerti.DataSource = dataCanBasicInfo.fnGetProCerForCanDetailView(CandidateID)
        grdProCerti.DataBind()

        grdEducation.DataSource = dataCanBasicInfo.fnGetEduForCanDetailView(CandidateID)
        grdEducation.DataBind()

        grdTraining.DataSource = dataCanBasicInfo.fnGetTrainingForCanDetailView(CandidateID)
        grdTraining.DataBind()

        grdRefrence.DataSource = dataCanBasicInfo.fnGetReferenceForCanDetailView(CandidateID)
        grdRefrence.DataBind()
    End Sub

End Class
