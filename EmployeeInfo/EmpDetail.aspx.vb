
Partial Class EmployeeInfo_EmpDetail
    Inherits System.Web.UI.Page
    Dim BasicData As New clsEmployeeBasicInfoDataAccess()
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim EmployeeID As String = ""

            EmployeeID = Request.QueryString("EmployeeID")

            If EmployeeID = "" Or EmployeeID = "Nothing" Then
                Exit Sub
            End If


            Dim BasicInfo As New EmpBasicInfo()

            BasicInfo = BasicData.fnGetEmployeeAllDetails(EmployeeID)

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
            lblMobileNo.Text = BasicInfo.MobileNumber
            lblEmail.Text = BasicInfo.EMail
            txtAlEmail.Text = BasicInfo.AltEMail
            txtBloodGrp.Text = BasicInfo.BloodGroupID

            lblRelStatus.Text = BasicInfo.RelationshipStatus

            imgValidation.ImageUrl = "~/Attachments/" + BasicInfo.Attachment

            imgSignature.ImageUrl = "~/Attachments/" + BasicInfo.Signature

            If BasicInfo.Attachment = "" Then
                imgValidation.ImageUrl = "~/Attachments/female_avatar.png"
            End If
            If BasicInfo.Signature = "" Then
                imgSignature.ImageUrl = "~/Attachments/signature.jpg"
            End If

        End If
    End Sub
End Class
