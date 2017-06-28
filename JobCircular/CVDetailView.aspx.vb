Imports System
Imports System.Drawing
Imports System.IO
Partial Class JobCircular_CVDetailView
    Inherits System.Web.UI.Page

    Dim BasicData As New clsCanBasicDataAccess()

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnReviewed_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReviewed.Click
        Dim CircularID As String
        Dim CandidateID As String
        Dim UserID As String
        Dim msg As String

        UserID = Session("LoginUserID")
        CircularID = Request.QueryString("CircularID")
        CandidateID = Request.QueryString("CandidateID")

        msg = Common.ChangeStatus(CircularID, CandidateID, UserID, "Reviewed")


        If msg = "Successfully Changed Status" Then
            MessageBox("Successful")
        Else
            MessageBox("Error Found")
        End If


    End Sub

    Protected Sub btnReject_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReject.Click
        Dim CircularID As String
        Dim CandidateID As String
        Dim UserID As String
        Dim msg As String

        UserID = Session("LoginUserID")
        CircularID = Request.QueryString("CircularID")
        CandidateID = Request.QueryString("CandidateID")

        msg = Common.ChangeStatus(CircularID, CandidateID, UserID, "Rejected")


        If msg = "Successfully Changed Status" Then
            MessageBox("Successful")
        Else
            MessageBox("Error Found")
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim CircularID As String
        Dim CandidateID As String
        CircularID = Request.QueryString("CircularID")
        CandidateID = Request.QueryString("CandidateID")

        Dim BasicInfo As New CanBasicInfo()

        BasicInfo = BasicData.fnGetCandidateDetailsView(CircularID, CandidateID)


        lblName.Text = BasicInfo.Name

        lblFatherName.Text = BasicInfo.FatherName
        lblFatherOccupation.Text = BasicInfo.FathersOccupation
        lblMotherName.Text = BasicInfo.MotherName
        lblMotherOccupation.Text = BasicInfo.MothersOccupation
        lblSpouseName.Text = BasicInfo.SpouseName
        lblSpouseOccupation.Text = BasicInfo.SpouseOccupation
        lblGender.Text = BasicInfo.Gender
        lblNID.Text = BasicInfo.NIDNo
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


        If BasicInfo.Attachment = "" Then
            imgValidation.ImageUrl = "~/Attachments/female_avatar.png"
        Else
            imgValidation.ImageUrl = "~/Attachments/" + BasicInfo.Attachment
        End If

        If BasicInfo.Signature = "" Then
            imgSignature.ImageUrl = "~/Attachments/signature.jpg"
        Else
            imgSignature.ImageUrl = "~/Attachments/" & BasicInfo.Signature
        End If


    End Sub
End Class
