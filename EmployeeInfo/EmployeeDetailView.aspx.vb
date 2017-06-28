
Partial Class EmployeeInfo_EmployeeDetailView
    Inherits System.Web.UI.Page
    Dim BasicData As New clsEmployeeBasicInfoDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            Dim EmployeeID As String = ""

            Dim EmpCode As String = ""

            EmployeeID = Session("EmployeeID")

            Dim EmpCount As Integer = Common.EmployeeBasicCount(EmployeeID)

            If EmpCount = 0 Then
                Dim msg As String = "Please Insert Basic Information First"
                Response.Redirect("EmployeeBasicInfo.aspx?Message=" + msg)
            End If


            Dim EmpEduCount As Integer = Common.EmployeeEduCount(EmployeeID)

            If EmpEduCount = 0 Then
                Dim msg As String = "Please Insert Education Information"
                Response.Redirect("EmployeeEducationInfo.aspx?Message=" + msg)
            End If



            If EmployeeID = "" Or EmployeeID = "Nothing" Then
                EmployeeID = Request.QueryString("EmployeeID")
            End If

            If EmployeeID = "" Or EmployeeID = "Nothing" Then
                Exit Sub
            End If


            BasicData.GetRegisteredInfo(EmployeeID, EmpCode)

            lblECode.Text = EmpCode

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

            lblRelStatus.Text = BasicInfo.RelationshipStatus
            txtBloodGroup.Text = BasicInfo.BloodGroupID

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
