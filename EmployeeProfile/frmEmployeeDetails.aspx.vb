Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared
Imports System.Net
Imports System.IO

Partial Class EmployeeProfile_frmEmployeeDetails
    Inherits System.Web.UI.Page

    Dim EmployeeData As New clsEmpBasicProfileDataAccess()
    Dim EmployeeSettingsData As New EmployeeSettingsDataAccess()
    Dim EducationInformation As New clsEmployeeAllInfoDataAccess()
    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()
    Dim DeptData As New clsDepartmentDataAccess()
    Dim Cypher As New clsCaesarCypher()


    Protected Sub btnUpdateEmployee_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateEmployee.Click
        Dim EmpBasicProfile As New EmpBasicInfo()

        Try
            EmpBasicProfile.EmployeeID = lblHolder.Text
            EmpBasicProfile.Name = txtEmployeeName.Text
            EmpBasicProfile.JoiningDate = Convert.ToDateTime(txtJoiningDate.Text)
            If txtConfirmationDate.Text = "" Then
                EmpBasicProfile.ConfirmationDate = "1/1/1900"
            Else
                EmpBasicProfile.ConfirmationDate = Convert.ToDateTime(txtConfirmationDate.Text)
            End If

            EmpBasicProfile.OfficialDesignation = ddlOfficialDesignation.SelectedValue
            EmpBasicProfile.FunctionalDesignation = ddlFunctionalDesignation.SelectedValue
            EmpBasicProfile.CurrentSupervisor = ddlCurrentSupervisor.SelectedValue
            EmpBasicProfile.DateOfBirth = txtDateOfBirthAsPerSSC.Text
            EmpBasicProfile.Nationality = txtNationality.Text
            EmpBasicProfile.NIDNo = txtNationalID.Text
            EmpBasicProfile.BloodGroupID = ddlBloodGrp.SelectedValue
            EmpBasicProfile.Religion = ddlReligion.SelectedValue
            EmpBasicProfile.FatherName = txtFatherName.Text
            EmpBasicProfile.FathersOccupation = ddlFathersOccupation.SelectedValue
            EmpBasicProfile.MotherName = txtMotherName.Text
            EmpBasicProfile.MothersOccupation = ddlMotherOccupation.SelectedValue
            EmpBasicProfile.SpouseName = txtSpouseName.Text
            EmpBasicProfile.SpouseOccupation = ddlSpouseOccupation.SelectedValue
            EmpBasicProfile.RelationshipStatus = ddlRelStatus.Text
            EmpBasicProfile.MobileNumber = txtMobileNo.Text
            EmpBasicProfile.OfficePhone = txtOfficePhone.Text
            EmpBasicProfile.OfficeExtension = txtOfficeExtension.Text
            EmpBasicProfile.EmmergencyConPerName = txtEmrgContactPersonName.Text
            EmpBasicProfile.EmmerConPerPhone = txtEmrgContactPersonPhnNo.Text
            EmpBasicProfile.RelWithImmerConPer = txtRelWithEmrgContactPerson.Text
            EmpBasicProfile.ActualBirthDate = drpActualBirthDay.SelectedValue
            EmpBasicProfile.ActualBirthMonth = drpActualBirthMonth.SelectedValue
            EmpBasicProfile.Gender = rdbtnGender.SelectedValue
            EmpBasicProfile.PresentAddress = txtPreAdd.Text
            EmpBasicProfile.PreDistrict = ddlPreDistrict.SelectedValue
            EmpBasicProfile.PreThana = ddlPreThana.Text
            EmpBasicProfile.PermanentAddress = txtPerAddress.Text
            EmpBasicProfile.PerDistrict = ddlperDistrict.SelectedValue
            EmpBasicProfile.PerThana = ddlPerThana.SelectedValue
            EmpBasicProfile.EmployeeTypeName = ddlEmpType.SelectedValue
            EmpBasicProfile.ULCBranchName = ddlULCBranch.SelectedValue
            EmpBasicProfile.DepartmentName = ddlDepartment.SelectedValue
            EmpBasicProfile.EMail = txtEmail.Text
            EmpBasicProfile.AltEMail = txtAlterEmail.Text
            EmpBasicProfile.BankID = ddlBankName.SelectedValue
            EmpBasicProfile.BranchID = ddlBranchName.SelectedValue
            EmpBasicProfile.BankAccountNo = txtAccountNo.Text
            EmpBasicProfile.InsuranceNo = txtInsuranceNo.Text
            EmpBasicProfile.TinNo = txtTINNo.Text
            EmpBasicProfile.PassportNo = txtPassportNo.Text
            EmpBasicProfile.DrivingLicenseNo = txtDrivingLicenseNo.Text
            EmpBasicProfile.ApproverID = ddlLeaveApprover.SelectedValue
            EmpBasicProfile.RecommenderID = ddlleaveRecommender.SelectedValue
            EmpBasicProfile.PrimaryEvaluator = drpPrimaryEvaluator.SelectedValue
            EmpBasicProfile.SecondaryEvaluator = drpSecondaryEvaluator.SelectedValue

            If ddlReligion.SelectedValue = "-Select-" Then
                MessageBox("Please Select Religion")
                Exit Sub
            Else
                EmpBasicProfile.Religion = ddlReligion.SelectedValue
            End If

            If ddlBankName.SelectedItem.Text = "" Then
                MessageBox("Please select Bank Name")
                Exit Sub
            End If

            If ddlBranchName.SelectedValue = "" Then
                MessageBox("Please select Branch Name")
                Exit Sub
            End If


            If EmpBasicProfile.EmployeeTypeName = "-Select-" Then
                MessageBox("Please select employee type")
                Exit Sub
            End If

            If ddlRelStatus.SelectedItem.Text = "Married" Then
                If txtSpouseName.Text = "" Then
                    MessageBox("Please Give Your Spouse Name")
                    Exit Sub
                End If
                If ddlSpouseOccupation.SelectedItem.Text = "" Then
                    MessageBox("Please Select Spouse Occupation")
                    Exit Sub
                End If
            End If

            If ddlPreDistrict.SelectedItem.Text = "" Then
                MessageBox("Please Select Present District")
                Exit Sub
            End If

            If ddlPreThana.SelectedItem.Text = "" Then
                MessageBox("Please Select Present Thana\Upazilla")
                Exit Sub
            End If

            If ddlperDistrict.SelectedItem.Text = "" Then
                MessageBox("Please Select Present District")
                Exit Sub
            End If

            If ddlPerThana.SelectedItem.Text = "" Then
                MessageBox("Please Select Present Thana\Upazilla")
                Exit Sub
            End If

            Dim folder As String
            Dim DocFileName As String = ""
            Dim DocFileNameSign As String = ""
            Dim DocExt As String
            Dim AttachmentFileName As String
            Dim Signature As String
            Dim DocPrefix As String
            Dim FileSize As Integer


            folder = Server.MapPath("~/Attachments/")

            If FileUpImage.HasFile Then

                FileSize = FileUpImage.PostedFile.ContentLength()

                If FileSize > 10485760 Then
                    MessageBox("File size should be within 10MB")
                    Exit Sub
                End If

                DocPrefix = Title.Replace(" ", "")

                DocExt = System.IO.Path.GetExtension(FileUpImage.FileName)

                If DocExt <> ".jpg" And DocExt <> ".JPG" And DocExt <> ".gif" And DocExt <> ".GIF" And DocExt <> ".PNG" And DocExt <> ".png" Then
                    MessageBox("Select Image File Only")
                    Exit Sub
                End If

                DocFileName = "Photo_Emp" & "_" & Replace(Replace(txtEmployeeName.Text, ".", "_"), " ", "_") & "_" & DateTime.Now.ToString("ddMMyyHHmmss") & DocExt
                AttachmentFileName = folder & DocFileName
                'FileUpImage.SaveAs(AttachmentFileName)

                Dim fs As System.IO.Stream = FileUpImage.PostedFile.InputStream
                Dim br As New System.IO.BinaryReader(fs)
                Dim bytes As Byte() = br.ReadBytes(CType(fs.Length, Integer))
                UploadFile(folder, DocFileName, bytes)

                EmpBasicProfile.Attachment = DocFileName

            Else

                Dim pnlEmpSummary As Panel
                Master.FindControl("pnlEmpSummary")
                pnlEmpSummary = Master.FindControl("pnlEmpSummary")

                Dim imgEmployee As Image
                imgEmployee = pnlEmpSummary.FindControl("imgEmployee")

                If imgEmployee.ImageUrl = "" And EmpBasicProfile.Attachment = "" Then
                    MessageBox("Select A Profile Picture First.")
                    Exit Sub
                End If

                'MessageBox("photo Required")
                'Exit Sub
                EmpBasicProfile.Attachment = ""
            End If


            If FileUpSign.HasFile Then
                FileSize = FileUpSign.PostedFile.ContentLength()

                If FileSize > 5242880 Then
                    MessageBox("File size should be within 5MB")
                    Exit Sub
                End If

                DocPrefix = Title.Replace(" ", "")

                DocExt = System.IO.Path.GetExtension(FileUpSign.FileName)

                If DocExt <> ".jpg" And DocExt <> ".JPG" And DocExt = ".gif" And DocExt = ".GIF" And DocExt = ".png" And DocExt = ".PNG" Then
                    MessageBox("Select Image File Only")
                    Exit Sub
                End If

                DocFileNameSign = "Sig_Emp" & "_" & Replace(Replace(txtEmployeeName.Text, ".", "_"), " ", "_") & "_" & DateTime.Now.ToString("ddMMyyHHmmss") & DocExt
                Signature = folder & DocFileNameSign
                'FileUpSign.SaveAs(Signature)

                Dim fs As System.IO.Stream = FileUpSign.PostedFile.InputStream
                Dim br As New System.IO.BinaryReader(fs)
                Dim bytes As Byte() = br.ReadBytes(CType(fs.Length, Integer))
                UploadFile(folder, DocFileName, bytes)

                EmpBasicProfile.Signature = DocFileNameSign
            Else
                EmpBasicProfile.Signature = ""
            End If

            EmpBasicProfile.HealthPlanID = ddlHealthPlan.SelectedValue
            EmpBasicProfile.EntryBy = Session("LoginUserID")
            Dim Check As String = EmployeeData.fnUpdateBasicInfo(EmpBasicProfile)

            If Check = 1 Then
                MessageBox("Updated Successfully")
                ClearBasicData()
                GetEmployeeInfo()
                getBasicProfileInfo(lblHolder.Text)
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub UploadFile(ByVal DestinationPathWithName As String, ByVal FileName As String, ByVal filebyte As Byte())
        Try
            Dim webClient As WebClient = New WebClient()
            Dim FileSavePath As String = Server.MapPath("~\Attachments\") & FileName
            File.WriteAllBytes(FileSavePath, filebyte)
            webClient.UploadFile("http://192.168.1.132/HRMAttachments/Upload.aspx", FileSavePath)
            webClient.Dispose()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub getBasicProfileInfo(ByVal EmployeeId As String)
        Try
            Dim EmpBasicProfile As New EmpBasicInfo()
            EmpBasicProfile = EmployeeData.fnGetBasicProfile(EmployeeId)

            Dim pnlEmpSummary As Panel
            Master.FindControl("pnlEmpSummary")
            pnlEmpSummary = Master.FindControl("pnlEmpSummary")

            Dim lblEmployeeName, lblEmployeeID, lblOfficialDesignation, lblFunctionalDesignation, lblDepartment, lblSupervisorName, lblEmployeeType, lblServiceLength, lblLocation As Label
            Dim imgEmployee As Image
            Dim hpLnkCanProfile As New HyperLink

            lblEmployeeName = pnlEmpSummary.FindControl("lblEmployeeName")
            lblEmployeeID = pnlEmpSummary.FindControl("lblEmployeeID")
            lblOfficialDesignation = pnlEmpSummary.FindControl("lblOfficialDesignation")
            lblFunctionalDesignation = pnlEmpSummary.FindControl("lblFunctionalDesignation")
            lblDepartment = pnlEmpSummary.FindControl("lblDepartment")
            lblSupervisorName = pnlEmpSummary.FindControl("lblSupervisorName")
            lblEmployeeType = pnlEmpSummary.FindControl("lblEmployeeType")
            lblServiceLength = pnlEmpSummary.FindControl("lblServiceLength")
            lblLocation = pnlEmpSummary.FindControl("lblLocation")
            imgEmployee = pnlEmpSummary.FindControl("imgEmployee")
            hpLnkCanProfile = pnlEmpSummary.FindControl("hpLnkCanProfile")

            lblEmployeeName.Text = EmpBasicProfile.Name
            lblEmployeeID.Text = EmpBasicProfile.EmpCode
            lblOfficialDesignation.Text = EmpBasicProfile.OfficialDesignation
            lblFunctionalDesignation.Text = EmpBasicProfile.FunctionalDesignation
            lblDepartment.Text = EmpBasicProfile.DepartmentName
            lblSupervisorName.Text = EmpBasicProfile.CurrentSupervisor
            lblEmployeeType.Text = EmpBasicProfile.EmployeeTypeName
            lblServiceLength.Text = EmpBasicProfile.ServiceLength
            lblLocation.Text = EmpBasicProfile.ULCBranchName

            hpLnkCanProfile.NavigateUrl = "http://192.168.1.242:8020/TrainingnTesting/RecuitmentCVView.aspx?CandidateID=" + EmpBasicProfile.CandidateID

            If EmpBasicProfile.Attachment = "" Then
                imgEmployee.ImageUrl = ""
            Else
                ShowImage(ConfigurationManager.AppSettings("AttachmentsShow") & EmpBasicProfile.Attachment, "imgEmployee")
            End If


            lblImg.Text = imgEmployee.ImageUrl
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ShowImage(ByVal UrlStr As String, ByVal ControlName As String)
        Try
            Dim tClient As WebClient = New WebClient
            Dim memStrmPic As MemoryStream = New MemoryStream(tClient.DownloadData(UrlStr))
            Dim bytesPic As Byte() = memStrmPic.ToArray()
            Dim base64StringPic As String = Convert.ToBase64String(bytesPic, 0, bytesPic.Length)

            Dim imgCtrl As System.Web.UI.WebControls.Image = Master.FindControl(ControlName)
            imgCtrl.ImageUrl = "data:image/png;base64," & base64StringPic
            memStrmPic.Dispose()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearBasicData()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Try
                Dim LoginUserId As String = Session("UniqueUserID")

                Dim ToWhomProShow As String = "" 'Request.QueryString("EmployeeID")

                If Request.QueryString("EmployeeID") = Nothing Then
                    ToWhomProShow = ""
                Else
                    ToWhomProShow = Request.QueryString("EmployeeID")
                End If

                Dim Type As String = ""
                If Request.QueryString("Type") Is Nothing Then
                    Type = ""
                Else
                    Type = Request.QueryString("Type")
                End If

                If ToWhomProShow <> "Self" And ToWhomProShow <> "" And Type <> "Admin" Then
                    ToWhomProShow = Cypher.Decrypt(ToWhomProShow)
                End If

                If ToWhomProShow = "" Then
                    ToWhomProShow = Session("ToWhomProShow")
                ElseIf ToWhomProShow = "Self" Then
                    ToWhomProShow = LoginUserId
                End If

                lblHolder.Text = ToWhomProShow

                Session("ToWhomProShow") = ToWhomProShow

                getBasicProfileInfo(ToWhomProShow)

                If lblImg.Text = "" Then
                    pnlImages.Visible = True
                    pnlPermission.Visible = False
                Else
                    pnlImages.Visible = False
                    pnlPermission.Visible = True
                End If

                rdbtnIsChange.SelectedIndex = 1

                Dim CountForImage As Integer = EmployeeData.EmpCountForImage(ToWhomProShow)

                If CountForImage = 0 Then
                    pnlImages.Visible = True
                    rdbtnIsChange.SelectedIndex = 0
                Else
                    pnlImages.Visible = False
                    rdbtnIsChange.SelectedIndex = 1
                End If


                If LoginUserId = ToWhomProShow Then
                    Dim Check As Boolean = EducationInformation.CheckPermissionForOwnInfo(LoginUserId)
                    If Check = True Then
                        btnArea.Visible = True
                    Else
                        btnArea.Visible = False
                    End If
                Else
                    Dim Check As Boolean = EducationInformation.CheckPermissionForOthers(LoginUserId)
                    If Check = True Then
                        btnArea.Visible = True
                    Else
                        btnArea.Visible = False
                    End If
                End If

                Dim Employeename As String = ""
                Dim EmployeeCode As String = ""

                EmployeeData.fnGetEmpNameCode(ToWhomProShow, Employeename, EmployeeCode)
                txtEmployeeName.Text = Employeename
                lblEmployeeID.Text = EmployeeCode

                getRelationshipStatus()
                getBloodGroup()
                getOccupationList()
                ShowDesignationOfficial(lblHolder.Text)
                ShowDesignationFunc()
                geDistrictName()
                ShowSupervisorList()
                ShowDepertment()
                ShowULCBranch()
                ShowEmployeeType()
                ShowBankName()
                GetHealthPlanType()

                Dim Count As Integer = EmployeeData.EmployeeCount(ToWhomProShow)
                If Count = 0 Then
                    Exit Sub
                End If

                GetEmployeeInfo()

                If ddlRelStatus.SelectedItem.Text = "Single" Then
                    txtSpouseName.Text = ""
                    ddlSpouseOccupation.SelectedIndex = -1
                    txtSpouseName.Enabled = False
                    ddlSpouseOccupation.Enabled = False

                Else
                    txtSpouseName.Enabled = True
                    ddlSpouseOccupation.Enabled = True
                End If

            Catch ex As Exception
                MessageBox(ex.Message)
            End Try
        End If
    End Sub

    Protected Sub GetEmployeeInfo()
        Dim EmpBasicProfile As New EmpBasicInfo()

        EmpBasicProfile = EmployeeData.fnGetEmployeeBasicProfileInfo(lblHolder.Text)

        If EmpBasicProfile.JoiningDate = "1/1/1900" Then
            txtJoiningDate.Text = ""
        Else
            txtJoiningDate.Text = EmpBasicProfile.JoiningDate
        End If

        If EmpBasicProfile.ConfirmationDate = "1/1/1900" Then
            txtConfirmationDate.Text = ""
        Else
            txtConfirmationDate.Text = EmpBasicProfile.ConfirmationDate
        End If

        txtEmployeeName.Text = EmpBasicProfile.Name
        ddlOfficialDesignation.SelectedValue = EmpBasicProfile.OfficialDesignation
        ddlFunctionalDesignation.SelectedValue = EmpBasicProfile.FunctionalDesignation
        ddlCurrentSupervisor.SelectedValue = EmpBasicProfile.CurrentSupervisor
        txtNationality.Text = EmpBasicProfile.Nationality
        txtNationalID.Text = EmpBasicProfile.NIDNo
        ddlBloodGrp.SelectedValue = EmpBasicProfile.BloodGroupID
        ddlReligion.SelectedValue = EmpBasicProfile.Religion
        txtFatherName.Text = EmpBasicProfile.FatherName
        ddlFathersOccupation.SelectedValue = EmpBasicProfile.FathersOccupation
        txtMotherName.Text = EmpBasicProfile.MotherName
        ddlMotherOccupation.SelectedValue = EmpBasicProfile.MothersOccupation
        txtSpouseName.Text = EmpBasicProfile.SpouseName
        ddlSpouseOccupation.SelectedValue = EmpBasicProfile.SpouseOccupation
        ddlRelStatus.Text = EmpBasicProfile.RelationshipStatus
        txtMobileNo.Text = EmpBasicProfile.MobileNumber
        txtOfficePhone.Text = EmpBasicProfile.OfficePhone
        txtOfficeExtension.Text = EmpBasicProfile.OfficeExtension
        txtEmrgContactPersonName.Text = EmpBasicProfile.EmmergencyConPerName
        txtEmrgContactPersonPhnNo.Text = EmpBasicProfile.EmmerConPerPhone
        txtRelWithEmrgContactPerson.Text = EmpBasicProfile.RelWithImmerConPer
        drpActualBirthDay.SelectedValue = EmpBasicProfile.ActualBirthDate
        drpActualBirthMonth.SelectedValue = EmpBasicProfile.ActualBirthMonth
        txtPreAdd.Text = EmpBasicProfile.PresentAddress
        txtPerAddress.Text = EmpBasicProfile.PermanentAddress
        ddlULCBranch.SelectedValue = EmpBasicProfile.ULCBranchName
        ddlDepartment.SelectedValue = EmpBasicProfile.DepartmentName
        ddlEmpType.SelectedValue = EmpBasicProfile.EmployeeTypeName
        rdbtnGender.SelectedValue = EmpBasicProfile.Gender
        txtEmail.Text = EmpBasicProfile.EMail
        txtAlterEmail.Text = EmpBasicProfile.AltEMail
        ddlBankName.SelectedValue = EmpBasicProfile.BankID
        ddlBranchName.DataTextField = "BranchName"
        ddlBranchName.DataValueField = "BranchID"
        ddlBranchName.DataSource = EmployeeInfoData.fnGetBranchName(ddlBankName.SelectedValue)
        ddlBranchName.DataBind()
        ddlBranchName.SelectedValue = EmpBasicProfile.BranchID
        txtAccountNo.Text = EmpBasicProfile.BankAccountNo
        ddlHealthPlan.SelectedValue = EmpBasicProfile.HealthPlanID
        txtInsuranceNo.Text = EmpBasicProfile.InsuranceNo
        ddlLeaveApprover.SelectedValue = EmpBasicProfile.ApproverID
        drpPrimaryEvaluator.SelectedValue = EmpBasicProfile.PrimaryEvaluator
        drpSecondaryEvaluator.SelectedValue = EmpBasicProfile.SecondaryEvaluator

        If EmpBasicProfile.RecommenderID = "" Then
            ddlleaveRecommender.SelectedIndex = 0
        Else
            ddlleaveRecommender.SelectedValue = EmpBasicProfile.RecommenderID
        End If

        ddlPreDistrict.SelectedValue = EmpBasicProfile.PreDistrict
        ddlPreThana.DataTextField = "UpazilaName"
        ddlPreThana.DataValueField = "UpazilaID"
        ddlPreThana.DataSource = EmployeeData.getUpazillaName(ddlPreDistrict.SelectedValue)
        ddlPreThana.DataBind()
        ddlPreThana.SelectedValue = EmpBasicProfile.PreThana

        ddlperDistrict.SelectedValue = EmpBasicProfile.PerDistrict
        ddlPerThana.DataTextField = "UpazilaName"
        ddlPerThana.DataValueField = "UpazilaID"
        ddlPerThana.DataSource = EmployeeData.getUpazillaName(ddlperDistrict.SelectedValue)
        ddlPerThana.DataBind()

        ddlPerThana.SelectedValue = EmpBasicProfile.PerThana
        txtDateOfBirthAsPerSSC.Text = EmpBasicProfile.DateOfBirth
        txtTINNo.Text = EmpBasicProfile.TinNo
        txtPassportNo.Text = EmpBasicProfile.PassportNo
        txtDrivingLicenseNo.Text = EmpBasicProfile.DrivingLicenseNo

        Dim HealthPlanID As String = EmployeeSettingsData.fnGetHealthPlanByDesignation(ddlOfficialDesignation.SelectedValue)
        ddlHealthPlan.SelectedValue = HealthPlanID
    End Sub

    Protected Sub getRelationshipStatus()
        ddlRelStatus.DataTextField = "RelName"
        ddlRelStatus.DataValueField = "RelationshipID"
        ddlRelStatus.DataSource = EmployeeData.fnGetRelationShipStatus()
        ddlRelStatus.DataBind()

        ddlRelStatus.Items.Insert(0, "-Select-")
    End Sub

    Protected Sub getBloodGroup()
        ddlBloodGrp.DataTextField = "BloodGroupName"
        ddlBloodGrp.DataValueField = "BloodGroupID"
        ddlBloodGrp.DataSource = EmployeeData.fnGetBloodGroup()
        ddlBloodGrp.DataBind()
    End Sub

    Protected Sub getOccupationList()
        ddlFathersOccupation.DataTextField = "OccupationName"
        ddlFathersOccupation.DataValueField = "OccupationID"
        ddlFathersOccupation.DataSource = EmployeeData.fnGetOccupationList()
        ddlFathersOccupation.DataBind()

        ddlMotherOccupation.DataTextField = "OccupationName"
        ddlMotherOccupation.DataValueField = "OccupationID"
        ddlMotherOccupation.DataSource = EmployeeData.fnGetOccupationList()
        ddlMotherOccupation.DataBind()

        ddlSpouseOccupation.DataTextField = "OccupationName"
        ddlSpouseOccupation.DataValueField = "OccupationID"
        ddlSpouseOccupation.DataSource = EmployeeData.fnGetOccupationList()
        ddlSpouseOccupation.DataBind()
    End Sub

    Protected Sub geDistrictName()
        ddlPreDistrict.DataTextField = "DistrictName"
        ddlPreDistrict.DataValueField = "DistrictID"
        ddlPreDistrict.DataSource = EmployeeData.getDistrictName()
        ddlPreDistrict.DataBind()

        If ddlPreDistrict.Items.Count > 0 Then
            ddlPreDistrict.SelectedIndex = 0
            ddlPreThana.DataTextField = "UpazilaName"
            ddlPreThana.DataValueField = "UpazilaID"
            ddlPreThana.DataSource = EmployeeData.getUpazillaName(ddlPreDistrict.SelectedValue)
            ddlPreThana.DataBind()
        End If

        ddlperDistrict.DataTextField = "DistrictName"
        ddlperDistrict.DataValueField = "DistrictID"
        ddlperDistrict.DataSource = EmployeeData.getDistrictName()
        ddlperDistrict.DataBind()

        If ddlperDistrict.Items.Count > 0 Then
            ddlperDistrict.SelectedIndex = 0
            ddlPerThana.DataTextField = "UpazilaName"
            ddlPerThana.DataValueField = "UpazilaID"
            ddlPerThana.DataSource = EmployeeData.getUpazillaName(ddlperDistrict.SelectedValue)
            ddlPerThana.DataBind()
        End If
    End Sub

    Protected Sub ShowDesignationOfficial(ByVal EmployeeID As String)
        ddlOfficialDesignation.DataTextField = "DesignationName"
        ddlOfficialDesignation.DataValueField = "DesignationID"
        ddlOfficialDesignation.DataSource = EmployeeData.fnGetOfficialDesignation()
        ddlOfficialDesignation.DataBind()
    End Sub

    Protected Sub ShowDesignationFunc()
        ddlFunctionalDesignation.DataTextField = "DesignationName"
        ddlFunctionalDesignation.DataValueField = "DesignationID"
        ddlFunctionalDesignation.DataSource = EmployeeInfoData.fnGetFunctionalDesignation()
        ddlFunctionalDesignation.DataBind()
        Dim A As New ListItem
        A.Text = "N\A"
        A.Value = "N\A"
        ddlFunctionalDesignation.Items.Insert(0, A)
    End Sub

    Protected Sub ShowSupervisorList()

        Dim ds As DataSet = EmployeeInfoData.fnGetEmployeeList()
        Dim A As New ListItem
        A.Text = "N\A"
        A.Value = "N\A"

        ddlCurrentSupervisor.DataTextField = "EmployeeName"
        ddlCurrentSupervisor.DataValueField = "EmployeeID"
        ddlCurrentSupervisor.DataSource = ds
        ddlCurrentSupervisor.DataBind()
        ddlCurrentSupervisor.Items.Insert(0, A)

        ddlLeaveApprover.DataTextField = "EmployeeName"
        ddlLeaveApprover.DataValueField = "EmployeeID"
        ddlLeaveApprover.DataSource = ds
        ddlLeaveApprover.DataBind()

        ddlleaveRecommender.DataTextField = "EmployeeName"
        ddlleaveRecommender.DataValueField = "EmployeeID"
        ddlleaveRecommender.DataSource = ds
        ddlleaveRecommender.DataBind()
        ddlleaveRecommender.Items.Insert(0, "N\A")

        drpPrimaryEvaluator.DataTextField = "EmployeeName"
        drpPrimaryEvaluator.DataValueField = "EmployeeID"
        drpPrimaryEvaluator.DataSource = ds
        drpPrimaryEvaluator.DataBind()
        drpPrimaryEvaluator.Items.Insert(0, "N\A")

        drpSecondaryEvaluator.DataTextField = "EmployeeName"
        drpSecondaryEvaluator.DataValueField = "EmployeeID"
        drpSecondaryEvaluator.DataSource = ds
        drpSecondaryEvaluator.DataBind()
        drpSecondaryEvaluator.Items.Insert(0, "N\A")

    End Sub

    Protected Sub ddlPreDistrict_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlPreDistrict.SelectedIndexChanged
        ddlPreThana.DataTextField = "UpazilaName"
        ddlPreThana.DataValueField = "UpazilaID"
        ddlPreThana.DataSource = EmployeeData.getUpazillaName(ddlPreDistrict.SelectedValue)
        ddlPreThana.DataBind()

        chkSamePreAdd.Checked = False
    End Sub

    Protected Sub ddlperDistrict_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlperDistrict.SelectedIndexChanged
        ddlPerThana.DataTextField = "UpazilaName"
        ddlPerThana.DataValueField = "UpazilaID"
        ddlPerThana.DataSource = EmployeeData.getUpazillaName(ddlperDistrict.SelectedValue)
        ddlPerThana.DataBind()

        chkSamePreAdd.Checked = False
    End Sub

    Protected Sub ClearBasicData()
        txtEmployeeName.Text = ""
        txtFatherName.Text = ""
        txtMotherName.Text = ""
        txtSpouseName.Text = ""
        rdbtnGender.SelectedIndex = -1
        txtNationalID.Text = ""
        txtNationality.Text = ""
        ddlReligion.SelectedIndex = -1
        txtPreAdd.Text = ""
        txtPerAddress.Text = ""
        txtMobileNo.Text = ""
        ddlBloodGrp.SelectedIndex = -1
        ddlRelStatus.SelectedIndex = -1
        ddlFathersOccupation.SelectedIndex = 0
        ddlSpouseOccupation.SelectedIndex = 0
        ddlMotherOccupation.SelectedIndex = 0
        txtEmrgContactPersonName.Text = ""
        txtEmrgContactPersonPhnNo.Text = ""
        txtRelWithEmrgContactPerson.Text = ""
        ddlperDistrict.SelectedIndex = 0
        ddlPreDistrict.SelectedIndex = 0
        'ddlPerThana.SelectedIndex = 0
        'ddlPreThana.SelectedIndex = 0
        drpActualBirthDay.SelectedIndex = 0
        drpActualBirthMonth.SelectedIndex = 0
        txtJoiningDate.Text = ""
        txtConfirmationDate.Text = ""
        txtDateOfBirthAsPerSSC.Text = ""
        ddlOfficialDesignation.SelectedIndex = 0
        ddlFunctionalDesignation.SelectedIndex = 0
        ddlCurrentSupervisor.SelectedIndex = 0
        txtEmail.Text = ""
        txtAlterEmail.Text = ""
        ddlHealthPlan.SelectedIndex = 0
        txtInsuranceNo.Text = ""

        ddlPreThana.DataSource = EmployeeData.getUpazillaName(ddlPreDistrict.SelectedValue)
        ddlPreThana.DataBind()

        ddlPerThana.DataSource = EmployeeData.getUpazillaName(ddlperDistrict.SelectedValue)
        ddlPerThana.DataBind()
    End Sub

    Protected Sub ShowDepertment()
        ddlDepartment.DataTextField = "DeptName"
        ddlDepartment.DataValueField = "DepartmentID"
        ddlDepartment.DataSource = DeptData.fnGetDeptList()
        ddlDepartment.DataBind()
    End Sub

    Protected Sub ShowULCBranch()
        ddlULCBranch.DataTextField = "ULCBranchName"
        ddlULCBranch.DataValueField = "ULCBranchID"
        ddlULCBranch.DataSource = EmployeeInfoData.fnGetULCBranch()
        ddlULCBranch.DataBind()
    End Sub

    Protected Sub ShowEmployeeType()
        ddlEmpType.DataTextField = "EmployeeTypeName"
        ddlEmpType.DataValueField = "EmployeeTypeID"
        ddlEmpType.DataSource = EmployeeInfoData.fnGetEmployeeType()
        ddlEmpType.DataBind()
        ddlEmpType.Items.Insert(0, "-Select-")
    End Sub

    Protected Sub ShowBankName()
        ddlBankName.DataTextField = "BankName"
        ddlBankName.DataValueField = "BankID"
        ddlBankName.DataSource = EmployeeInfoData.fnGetBankName()
        ddlBankName.DataBind()

        Dim BankID As String

        BankID = ddlBankName.SelectedValue
        ShowBranchName(BankID)
    End Sub

    Protected Sub ShowBranchName(ByVal BankID As String)
        ddlBranchName.DataTextField = "BranchName"
        ddlBranchName.DataValueField = "BranchID"
        ddlBranchName.DataSource = EmployeeInfoData.fnGetBranchName(BankID)
        ddlBranchName.DataBind()
    End Sub

    Protected Sub GetHealthPlanType()
        ddlHealthPlan.DataTextField = "HealthPlanName"
        ddlHealthPlan.DataValueField = "HealthPlanID"
        ddlHealthPlan.DataSource = EmployeeSettingsData.fnGetHealthPlanList()
        ddlHealthPlan.DataBind()
    End Sub

    Protected Sub ddlBankName_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlBankName.SelectedIndexChanged
        Dim BankID As String
        BankID = ddlBankName.SelectedValue
        ShowBranchName(BankID)
    End Sub

    Protected Sub rdbtnIsChange_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdbtnIsChange.SelectedIndexChanged
        If rdbtnIsChange.SelectedValue = "YES" Then
            pnlImages.Visible = True
            'pnlPermission.Visible = False
        Else
            pnlImages.Visible = False
            ' pnlPermission.Visible = True
        End If
    End Sub

    Protected Sub chkSamePreAdd_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkSamePreAdd.CheckedChanged
        If chkSamePreAdd.Checked = True Then
            txtPerAddress.Text = txtPreAdd.Text
            ddlperDistrict.SelectedValue = ddlPreDistrict.SelectedValue
            ddlPerThana.DataTextField = "UpazilaName"
            ddlPerThana.DataValueField = "UpazilaID"
            ddlPerThana.DataSource = EmployeeData.getUpazillaName(ddlPreDistrict.SelectedValue)
            ddlPerThana.DataBind()

            ddlPerThana.SelectedValue = ddlPreThana.SelectedValue
        Else
            txtPerAddress.Text = ""
            ddlperDistrict.SelectedIndex = 0
            ddlPerThana.SelectedIndex = 0
        End If
    End Sub

    Protected Sub txtPreAdd_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtPreAdd.TextChanged
        chkSamePreAdd.Checked = False
    End Sub

    Protected Sub ddlPreThana_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlPreThana.SelectedIndexChanged
        chkSamePreAdd.Checked = False
    End Sub

    Protected Sub txtPerAddress_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtPerAddress.TextChanged
        chkSamePreAdd.Checked = False
    End Sub

    Protected Sub ddlPerThana_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlPerThana.SelectedIndexChanged
        chkSamePreAdd.Checked = False
    End Sub

    Protected Sub ddlRelStatus_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlRelStatus.SelectedIndexChanged
        If ddlRelStatus.SelectedItem.Text = "Single" Then
            txtSpouseName.Text = ""
            ddlSpouseOccupation.SelectedIndex = -1
            txtSpouseName.Enabled = False
            ddlSpouseOccupation.Enabled = False

        Else
            txtSpouseName.Enabled = True
            ddlSpouseOccupation.Enabled = True
        End If

    End Sub

    Protected Sub ddlOfficialDesignation_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlOfficialDesignation.SelectedIndexChanged
        Try
            Dim HealthPlanID As String = EmployeeSettingsData.fnGetHealthPlanByDesignation(ddlOfficialDesignation.SelectedValue)
            ddlHealthPlan.SelectedValue = HealthPlanID
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnProcessReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcessReport.Click

        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String

        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]

        Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionStringRpt").ConnectionString
        Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

        Try
            f = "~/Payroll/Report/"
            folder = Server.MapPath(f)
            repName = folder & "rptIDCardForm.rpt"
            myReport.Load(repName)

            retArr = conStr.Split(";")
            serverArr = retArr(0).Split("=")
            dbArr = retArr(1).Split("=")
            usrArr = retArr(2).Split("=")
            pwdArr = retArr(3).Split("=")

            serverName = serverArr(1)
            uid = usrArr(1)
            pwd = pwdArr(1)
            dbName = dbArr(1)

            myReport.SetDatabaseLogon(uid, pwd, serverName, dbName)

            Dim parameters As CrystalDecisions.Web.Parameter = New CrystalDecisions.Web.Parameter()
            myReport.SetParameterValue("@EmployeeID", Session("UniqueUserID"))
            myReport.ExportToHttpResponse(ExportFormatType.RichText, Response, True, "ID-Card-Form")
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub
End Class