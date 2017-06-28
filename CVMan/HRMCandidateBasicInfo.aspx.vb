Imports System.IO
Imports System.Web.UI
Imports System.Drawing
Imports System.Data
Imports System.Net

Partial Class HRMCandidateBasicInfo
    Inherits System.Web.UI.Page

    Dim BasicData As New clsCanBasicDataAccess()
    Dim Photo As String
    Dim GImageID As String

    Dim DocumentData As clsDocumentTypeDataAccess = New clsDocumentTypeDataAccess()
    Dim DocumentListData As clsDocumentListDataAccess = New clsDocumentListDataAccess()
    Public Shared PictureLocation As String = ""
    Public Shared SignatureLocation As String = ""

    Dim DocumentList As clsDocumentList = New clsDocumentList()

    Protected Sub btnNext_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNext.Click
        Dim UserID As String
        UserID = Session("LoginUserID")
        Dim RegistrationID As String
        'RegistrationID = Session("RegistrationID")
        RegistrationID = Session("UniqueUserID")

        Dim BasicInfo As New CanBasicInfo()
        Dim CandidateID As String
        CandidateID = ""

        Dim CandidateName As String

        CandidateName = txtName.Text
        CandidateName = Replace(CandidateName, " ", "_")
        BasicInfo.RelationshipStatus = ddlRelStatus.SelectedValue
        BasicInfo.FatherName = txtFatherName.Text
        BasicInfo.FathersOccupation = ddlFathersOccupation.SelectedValue
        BasicInfo.MotherName = txtMotherName.Text
        BasicInfo.MothersOccupation = ddlMotherOccupation.SelectedValue
        BasicInfo.SpouseName = txtSpouseName.Text
        BasicInfo.SpouseOccupation = ddlSpouseOccupation.SelectedValue
        BasicInfo.NoOfChildrenAge = Common.CheckAsciiValue(txtNoChildren.Text)
        BasicInfo.SibblingsNameOccupation = Common.CheckAsciiValue(txtSibblingsInfo.Text)
        BasicInfo.Gender = rdbtnGender.SelectedValue
        BasicInfo.Nationality = ddlNationality.SelectedValue
        BasicInfo.NIDNo = txtNID.Text
        BasicInfo.PassportNo = txtPassportNo.Text
        BasicInfo.BloodGroupID = ddlBloodGrp.SelectedValue

        If ddlRelStatus.SelectedIndex = 0 Then
            MessageBox("Please Select Relationship Status")
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
            If txtNoChildren.Text = "" Then
                MessageBox("Please Give Your Childrens Information")
                Exit Sub
            End If
        End If

        If ddlReligion.SelectedValue = "-Select-" Then
            MessageBox("Please Select Religion")
            Exit Sub
        Else
            BasicInfo.Religion = ddlReligion.SelectedValue
        End If

        'BasicInfo.Religion = ddlReligion.SelectedValue
        BasicInfo.PermanentAddress = Common.CheckAsciiValue(txtPerAddress.Text)
        BasicInfo.PreDistrict = ddlPreDistrict.SelectedValue
        If ddlPreDistrict.SelectedItem.Text = "" Then
            MessageBox("Please Select Present District")
            Exit Sub
        End If
        BasicInfo.PreThana = ddlPreThana.SelectedValue
        If ddlPreThana.SelectedItem.Text = "" Then
            MessageBox("Please Select Present Thana\Upazilla")
            Exit Sub
        End If
        BasicInfo.PresentAddress = Common.CheckAsciiValue(txtPreAdd.Text)
        BasicInfo.PerDistrict = ddlperDistrict.SelectedValue
        If ddlperDistrict.SelectedItem.Text = "" Then
            MessageBox("Please Select Present District")
            Exit Sub
        End If
        BasicInfo.PerThana = ddlPerThana.SelectedValue
        If ddlPerThana.SelectedItem.Text = "" Then
            MessageBox("Please Select Present Thana\Upazilla")
            Exit Sub
        End If
        BasicInfo.HomePhoneNo = txtHomePhoneNo.Text
        BasicInfo.MobileNumber = txtMobileNumber.Text
        BasicInfo.OfficePhoneNo = txtOfficePhoneNo.Text
        'BasicInfo.EMail = txtEMail.Text
        BasicInfo.AltEMail = txtAlEmail.Text
        BasicInfo.CareerObjective = txtCareerObjective.Text
        BasicInfo.AboutYourself = Common.CheckAsciiValue(txtAboutYrself.Text)
        BasicInfo.SpecilizedIn = txtSpecilizedIn.Text

        If ddlRelStatus.SelectedItem.ToString = "Single" Then

        End If

        If txtyrOfExp.Text = "" Then
            BasicInfo.YearOfExperience = 0
        Else
            BasicInfo.YearOfExperience = txtyrOfExp.Text
        End If

        If txtMonth.Text = "" Then
            BasicInfo.ExpInMonth = 0
        Else
            BasicInfo.ExpInMonth = txtMonth.Text
        End If

        If txtPresentSalary.Text = "" Then
            BasicInfo.PresentSalary = 0
        Else
            BasicInfo.PresentSalary = txtPresentSalary.Text
        End If

        If dtDrawnDate.Text = "" Then
            BasicInfo.LastDrawnDate = "1911-01-01"
        Else
            BasicInfo.LastDrawnDate = dtDrawnDate.Text
        End If

        If BasicInfo.PresentSalary <> 0 Then
            If (BasicInfo.LastDrawnDate = "1911-01-01") Then
                MessageBox("Please give last drawn date of your salary")
                Exit Sub
            End If
        End If

        BasicInfo.ExpectedSalary = 0
        BasicInfo.LookingFor = ddlLookingFor.SelectedValue
        BasicInfo.AvailableFor = ddlAvailableFor.SelectedValue
        BasicInfo.PreferredJobLocation = ddlPreferredJobLocation.SelectedValue
        BasicInfo.EnglishProficiency = rblEnLagPro.SelectedValue
        BasicInfo.ComputerLiteracy = rblComputerLiteracy.SelectedValue
        BasicInfo.Employeer = txtEmployeer.Text

        Dim DocumentInformation As String = ""
        Dim dtLoanAccDocuments As DataTable = New DataTable()
        dtLoanAccDocuments = Session("UserDocuments")

        If hdFldChangeMadeToDocumentUploads.Value = "True" Then
            '' Document Information
            BasicInfo.IsChangeMadeToDocumentUploads = True
            Dim DocumentInfo As clsDocumentList = New clsDocumentList()
            For Each rw As DataRow In dtLoanAccDocuments.Rows
                DocumentInfo.DocumentName = rw.Item("DocumentName")
                DocumentInfo.FileName = rw.Item("FileName")
                DocumentInfo.DocTypeID = rw.Item("DocTypeID")
                DocumentInformation = DocumentInformation & DocumentInfo.DocumentName & "~" & DocumentInfo.FileName & "~" & DocumentInfo.DocTypeID & "~|"
            Next
            BasicInfo.Documents = DocumentInformation
        Else
            BasicInfo.Documents = ""
        End If

        If ddlLookingFor.SelectedIndex = 0 Then
            MessageBox("Please Select Looking For")
            Exit Sub
        End If

        If ddlAvailableFor.SelectedIndex = 0 Then
            MessageBox("Please Select Available For")
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

        If hpAttachment.NavigateUrl <> "" Then
            DocFileName = Replace(hpAttachment.NavigateUrl, ConfigurationManager.AppSettings("Attachments"), "")
        End If

        folder = ConfigurationManager.AppSettings("AttachmentsShow")  'Server.MapPath("~/Attachments/")
        UserID = Session("LoginUserID")

        If flAttachment.HasFile Then

            FileSize = flAttachment.PostedFile.ContentLength()

            If FileSize > 10485760 Then
                MessageBox("File size should be within 10MB")
                Exit Sub
            End If

            DocPrefix = Title.Replace(" ", "")

            DocExt = System.IO.Path.GetExtension(flAttachment.FileName)
            'DocFileName = "Candidate" & DocExt

            If DocExt <> ".jpg" And DocExt <> ".JPG" And DocExt <> ".gif" And DocExt <> ".GIF" And DocExt <> ".PNG" And DocExt <> ".png" Then
                MessageBox("Select Image File Only For Photo")
                Exit Sub
            End If

            DocFileName = "Photo" & "_" & Replace(CandidateName, " ", "_") & "_" & DateTime.Now.ToString("ddMMyyHHmmss") & DocExt
            AttachmentFileName = folder & DocFileName

            Dim fs As System.IO.Stream = flAttachment.PostedFile.InputStream
            Dim br As New System.IO.BinaryReader(fs)
            Dim bytes As Byte() = br.ReadBytes(CType(fs.Length, Integer))
            UploadFile(folder, DocFileName, bytes)

            'flAttachment.SaveAs(AttachmentFileName)
        Else
            MessageBox("Photo Required.")
            Exit Sub
        End If

        If hpSignature.NavigateUrl <> "" Then
            DocFileNameSign = Replace(hpSignature.NavigateUrl, ConfigurationManager.AppSettings("Attachments"), "")
        End If

        folder = ConfigurationManager.AppSettings("AttachmentsShow")
        UserID = Session("LoginUserID")

        If flSignature.HasFile Then

            FileSize = flSignature.PostedFile.ContentLength()

            If FileSize > 5242880 Then
                MessageBox("File size should be within 5MB")
                Exit Sub
            End If

            DocPrefix = Title.Replace(" ", "")

            DocExt = System.IO.Path.GetExtension(flSignature.FileName)

            If DocExt <> ".jpg" And DocExt <> ".JPG" And DocExt <> ".gif" And DocExt <> ".GIF" And DocExt <> ".png" And DocExt <> ".PNG" Then
                MessageBox("Select Image File Only For Signature")
                Exit Sub
            End If

            DocFileNameSign = "Signature" & "_" & Replace(CandidateName, " ", "_") & "_" & DateTime.Now.ToString("ddMMyyHHmmss") & DocExt
            Signature = folder & DocFileNameSign

            Dim fs As System.IO.Stream = flSignature.PostedFile.InputStream
            Dim br As New System.IO.BinaryReader(fs)
            Dim bytes As Byte() = br.ReadBytes(CType(fs.Length, Integer))
            UploadFile(folder, DocFileNameSign, bytes)
            'flSignature.SaveAs(Signature)
        End If


        If DocFileName = "" And imgValidation.ImageUrl = ConfigurationManager.AppSettings("Attachments") + "female_avatar.png" Then
            MessageBox("Photo Required")
            Exit Sub
        End If

        Dim chk As System.Web.UI.WebControls.CheckBox
        Dim Spec As System.Web.UI.WebControls.Label
        Dim SpecilizedID As String
        Dim SpecilizedInformation As String = ""

        For Each rw As GridViewRow In grdSpecilized.Rows
            chk = rw.FindControl("chkSelect")
            If chk.Checked = True Then
                'SpecilizedID = rw.Cells(0).Text
                Spec = rw.FindControl("lblSpecilizedID")
                SpecilizedID = Spec.Text
                SpecilizedInformation = SpecilizedInformation & SpecilizedID & "~|"

            End If
        Next

        CandidateID = BasicData.fnInsertBasicInfo(RegistrationID, UserID, BasicInfo, DocFileName, DocFileNameSign, BasicInfo.Documents, SpecilizedInformation)

        If CandidateID <> "" Then
            MessageBox("Inserted Successfully")
            hdFldChangeMadeToDocumentUploads.Value = "False"
            BasicInfo.IsChangeMadeToDocumentUploads = False
            Session("CandidateID") = CandidateID


            imgValidation.ImageUrl = ConfigurationManager.AppSettings("Attachments") + DocFileName

            If DocFileNameSign = "" Then
                imgSignature.ImageUrl = ConfigurationManager.AppSettings("Attachments") + "signature.jpg"
            Else
                imgSignature.ImageUrl = ConfigurationManager.AppSettings("Attachments") + DocFileNameSign
            End If

            Response.Redirect("~/CVMan/CandidateExperienceInfo.aspx")
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Function FormatAccountDocumentTable() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("DocTypeID", System.Type.GetType("System.String"))
        dt.Columns.Add("DocTypeName", System.Type.GetType("System.String"))
        dt.Columns.Add("DocumentName", System.Type.GetType("System.String"))
        dt.Columns.Add("FileName", System.Type.GetType("System.String"))

        Return dt
    End Function

    Protected Sub GetUserDocuments()

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            Dim Message As String
            ClearExistingFiles()
            'Message = Request.QueryString("Message")
            Dim Secmsg As String = Request.QueryString("msg")

            If Secmsg <> 1 Then
                Session("Message") = ""
            End If

            Message = Session("Message")

            If Message <> "" Then
                lblRedirectMsg.Text = Message
            End If

            ddlPreDistrict.DataSourceID = "dsPreDistrictName"
            ddlPreDistrict.DataBind()

            If ddlPreDistrict.Items.Count > 0 Then
                ddlPreDistrict.SelectedIndex = 0
                ddlPreThana.DataSourceID = "dsPreUpazillaName"
                ddlPreThana.DataBind()
            End If

            ddlperDistrict.DataSourceID = "dsPerDistrictName"
            ddlperDistrict.DataBind()

            If ddlperDistrict.Items.Count > 0 Then
                ddlperDistrict.SelectedIndex = 0
                ddlPerThana.DataSourceID = "dsPerUpazilaName"
                ddlPerThana.DataBind()
            End If

            Dim UserID As String
            Dim UserName As String
            Dim RegistrationID As String

            lblNewDocumentType.Visible = False
            btnCancelInsertNewDocumentType.Visible = False

            ShowDocumentType()
            ShowOccupationList()

            hdFldChangeMadeToDocumentUploads.Value = ""
            Dim dtUserDocuments As DataTable = New DataTable()
            dtUserDocuments = FormatAccountDocumentTable()
            Session("UserDocuments") = dtUserDocuments

            Dim MobileNo As String = ""

            Dim NID As String = ""

            UserID = Session("LoginUserID")
            UserName = Session("UserName")
            RegistrationID = Session("RegistrationID")
            'RegistrationID = Session("UniqueUserID")

            ShowPrevUploadedDocumentInfo(Session("UniqueUserID"))

            ddlRelStatus.DataTextField = "RelName"
            ddlRelStatus.DataValueField = "RelationshipID"
            ddlRelStatus.DataSourceID = "dsRelationStatus"
            ddlRelStatus.DataBind()

            If ddlRelStatus.Items.Count > 0 Then

                If ddlRelStatus.SelectedItem.Text = "Single" Then
                    txtSpouseName.Enabled = False
                    ddlSpouseOccupation.Enabled = False
                    txtSpouseName.Text = ""
                    ddlSpouseOccupation.SelectedIndex = 0
                Else
                    txtSpouseName.Enabled = True
                    ddlSpouseOccupation.Enabled = True
                End If

            End If

            txtName.Text = UserName

            Dim NewBasic As New CanBasicInfo()

            NewBasic = BasicData.fnGetEmailDOBofReg(RegistrationID)
            txtEmail.Text = NewBasic.EMail
            txtDOB.Text = NewBasic.DOB
            txtyrOfExp.Text = "0"
            txtMonth.Text = "0"

            ddlRelStatus.DataBind()
            dsRelationStatus.DataBind()
            ddlRelStatus.Items.Insert(0, "--Select--")

            ddlAvailableFor.DataBind()
            dsServiceType.DataBind()
            ddlAvailableFor.Items.Insert(0, "--Select--")

            ddlLookingFor.DataBind()
            dsJobType.DataBind()
            ddlLookingFor.Items.Insert(0, "--Select--")

            grdSpecilized.DataSource = BasicData.fnGetSpecilizedIn()
            grdSpecilized.DataBind()

            Dim CandidateID As String

            Dim count As Integer = Common.CandidateCount(RegistrationID)

            If count = 0 Then
                clsCanBasicDataAccess.GetRegisteredInfo(RegistrationID, MobileNo, NID)
                txtEmail.Text = NewBasic.EMail
                txtMobileNumber.Text = MobileNo
                txtNID.Text = NID
                imgValidation.ImageUrl = "~/Sources/images/" & "female_avatar.png"
                imgSignature.ImageUrl = "~/Sources/images/" & "signature.jpg"
                btnUpdate.Enabled = False
                btnNext.Enabled = True
                pnlUploadDocuments.Visible = False
                Exit Sub
            Else
                pnlUploadDocuments.Visible = True
            End If
            Dim CandidateRegistrationID As String = ""

            CandidateID = Common.GetCandidateID(RegistrationID)
            Session("CandidateID") = CandidateID

            If CandidateID = "" Then
                btnUpdate.Enabled = False
                btnNext.Enabled = True
            Else
                btnNext.Enabled = False
                btnUpdate.Enabled = True
            End If

            Dim Status As Boolean = clsCanBasicDataAccess.PresentStatus(CandidateID)

            If Status = True Then
                btnNext.Enabled = False
            End If

            Dim BasicInfo As New CanBasicInfo()

            BasicInfo = BasicData.fnGetCandidateBasicInformation(RegistrationID)

            'txtName.Text = BasicInfo.Name
            txtFatherName.Text = BasicInfo.FatherName
            ddlFathersOccupation.SelectedValue = BasicInfo.FathersOccupation
            txtMotherName.Text = BasicInfo.MotherName
            ddlMotherOccupation.SelectedValue = BasicInfo.MothersOccupation
            txtSpouseName.Text = BasicInfo.SpouseName
            ddlSpouseOccupation.SelectedValue = BasicInfo.SpouseOccupation
            txtNoChildren.Text = BasicInfo.NoOfChildrenAge
            txtSibblingsInfo.Text = BasicInfo.SibblingsNameOccupation
            rdbtnGender.SelectedValue = BasicInfo.Gender
            txtNID.Text = BasicInfo.NIDNo
            txtPassportNo.Text = BasicInfo.PassportNo
            ddlNationality.SelectedValue = BasicInfo.Nationality
            ddlReligion.SelectedValue = BasicInfo.Religion
            txtPreAdd.Text = BasicInfo.PresentAddress
            ddlPreDistrict.SelectedValue = BasicInfo.PreDistrict
            ddlPreThana.SelectedValue = BasicInfo.PreThana
            txtPerAddress.Text = BasicInfo.PermanentAddress
            ddlperDistrict.SelectedValue = BasicInfo.PerDistrict
            ddlPerThana.SelectedValue = BasicInfo.PerThana
            txtHomePhoneNo.Text = BasicInfo.HomePhoneNo
            txtMobileNumber.Text = BasicInfo.MobileNumber
            txtOfficePhoneNo.Text = BasicInfo.OfficePhoneNo
            txtAlEmail.Text = BasicInfo.AltEMail
            txtCareerObjective.Text = BasicInfo.CareerObjective
            txtyrOfExp.Text = Convert.ToString(BasicInfo.YearOfExperience)
            txtMonth.Text = Convert.ToString(BasicInfo.ExpInMonth)
            txtPresentSalary.Text = String.Format("{0:N2}", BasicInfo.PresentSalary)

            If BasicInfo.LastDrawnDate = "01 Jan 1911" Then
                dtDrawnDate.Text = ""
            Else
                dtDrawnDate.Text = BasicInfo.LastDrawnDate
            End If

            txtEmployeer.Text = BasicInfo.Employeer
            txtExpectedSalary.Text = String.Format("{0:N2}", BasicInfo.ExpectedSalary)
            ddlLookingFor.SelectedValue = BasicInfo.LookingFor
            ddlAvailableFor.SelectedValue = BasicInfo.AvailableFor
            ddlPreferredJobLocation.SelectedValue = BasicInfo.PreferredJobLocation
            rblEnLagPro.SelectedValue = BasicInfo.EnglishProficiency
            rblComputerLiteracy.SelectedValue = BasicInfo.ComputerLiteracy
            ddlRelStatus.SelectedValue = BasicInfo.RelationshipStatus
            ddlBloodGrp.SelectedValue = BasicInfo.BloodGroupID
            txtAboutYrself.Text = BasicInfo.AboutYourself
            txtSpecilizedIn.Text = BasicInfo.SpecilizedIn


            'imgValidation.ImageUrl = ConfigurationManager.AppSettings("Attachments") + BasicInfo.Attachment
            'imgSignature.ImageUrl = ConfigurationManager.AppSettings("Attachments") + BasicInfo.Signature

         

           

            hpAttachment.NavigateUrl = ConfigurationManager.AppSettings("Attachments") & BasicInfo.Attachment
            hpSignature.NavigateUrl = ConfigurationManager.AppSettings("Attachments") & BasicInfo.Signature

            If BasicInfo.Attachment = "" Then
                imgValidation.ImageUrl = "~/Sources/images/" & "female_avatar.png"
            Else
                'Setting Profile Picture
                Dim absoluteFilePathPic As String = ConfigurationManager.AppSettings("AttachmentsShow") & BasicInfo.Attachment

                Dim tClientPic As WebClient = New WebClient
                Dim memStrmPic As MemoryStream = New MemoryStream(tClientPic.DownloadData(absoluteFilePathPic))
                Dim bytesPic As Byte() = memStrmPic.ToArray()
                Dim base64StringPic As String = Convert.ToBase64String(bytesPic, 0, bytesPic.Length)
                imgValidation.ImageUrl = "data:image/png;base64," & base64StringPic
                memStrmPic.Dispose()
                'Setting Profile Picture Ends
            End If


            If BasicInfo.Signature = "" Then
                imgSignature.ImageUrl = "~/Sources/images/" & "signature.jpg"
            Else
                'Setting Signature
                Dim absoluteFilePathSig As String = ConfigurationManager.AppSettings("AttachmentsShow") & BasicInfo.Signature
                Dim tClientSig As WebClient = New WebClient
                Dim memStrmSig As MemoryStream = New MemoryStream(tClientSig.DownloadData(absoluteFilePathSig))
                Dim bytesSig As Byte() = memStrmSig.ToArray()
                Dim base64StringSig As String = Convert.ToBase64String(bytesSig, 0, bytesSig.Length)
                imgSignature.ImageUrl = "data:image/png;base64," & base64StringSig
                memStrmSig.Dispose()
                'Setting Signature Ends
            End If

            Dim dtSpecilized As DataTable
            dtSpecilized = BasicData.fnGetCanSpecilizedInformation(CandidateID).Tables(0)

            For Each TableRow As DataRow In dtSpecilized.Rows
                Dim SpecilizedID As String = ""
                SpecilizedID = TableRow.Item("SpecilizedID")

                For Each rw As GridViewRow In grdSpecilized.Rows
                    Dim GridID As System.Web.UI.WebControls.Label
                    Dim chk As System.Web.UI.WebControls.CheckBox

                    GridID = rw.FindControl("lblSpecilizedID")

                    If GridID.Text = SpecilizedID Then
                        chk = rw.FindControl("chkSelect")
                        chk.Checked = True
                    End If
                Next
            Next
        End If
    End Sub

    Protected Sub ClearExistingFiles()
        Try
            For Each f As String In Directory.GetFiles(Server.MapPath("~/Attachments/"))
                File.Delete(f)
            Next
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

    Protected Sub ClearBasicInfo()
        txtFatherName.Text = ""
        txtMotherName.Text = ""
        txtSpouseName.Text = ""
        rdbtnGender.SelectedIndex = -1
        txtNID.Text = ""
        txtPassportNo.Text = ""
        ddlNationality.SelectedIndex = -1
        ddlReligion.SelectedIndex = -1
        txtPreAdd.Text = ""
        txtPerAddress.Text = ""
        txtHomePhoneNo.Text = ""
        txtMobileNumber.Text = ""
        txtOfficePhoneNo.Text = ""
        txtAlEmail.Text = ""
        txtCareerObjective.Text = ""
        txtyrOfExp.Text = "0"
        txtMonth.Text = "0"
        txtPresentSalary.Text = ""
        txtExpectedSalary.Text = ""
        ddlLookingFor.SelectedIndex = -1
        ddlAvailableFor.SelectedIndex = -1
        rblEnLagPro.SelectedIndex = -1
        rblComputerLiteracy.SelectedIndex = -1
        ddlBloodGrp.SelectedIndex = -1
        ddlRelStatus.SelectedIndex = -1
        txtAboutYrself.Text = ""
        txtSpecilizedIn.Text = ""
    End Sub

    Protected Sub ddlRelStatus_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlRelStatus.SelectedIndexChanged
        If ddlRelStatus.Items.Count > 0 Then

            If ddlRelStatus.SelectedItem.Text = "Single" Then
                txtSpouseName.Enabled = False
                ddlSpouseOccupation.Enabled = False
                txtSpouseName.Text = ""
                ddlSpouseOccupation.SelectedIndex = 0
                txtNoChildren.Text = ""
                txtNoChildren.Enabled = False
            Else
                txtSpouseName.Enabled = True
                ddlSpouseOccupation.Enabled = True
                txtNoChildren.Enabled = True
            End If

        End If
    End Sub

    Protected Sub btnNewDocumentType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNewDocumentType.Click

        Dim DocumentType As clsDocumentType = New clsDocumentType()

        If btnNewDocumentType.Text = "..." Then
            btnNewDocumentType.Text = "Insert"
            lblNewDocumentType.Visible = True
            btnNewDocumentType.ValidationGroup = "DocType"
            btnCancelInsertNewDocumentType.Visible = True
        Else
            If txtNewDocumentType.Text = "" Then
                MessageBox("InPut Document Type")
            Else

                If chkDocumentTypeIsMandatory.Checked = True Then
                    DocumentType.IsMandatory = True
                Else
                    DocumentType.IsMandatory = False
                End If

                DocumentType.DocumentType = txtNewDocumentType.Text
                DocumentType.IsActive = True
                DocumentType.EntryBy = Session("LoginUserID")

                Dim check As Integer = DocumentData.fnInsertDocumentType(DocumentType)

                If check = 1 Then
                    MessageBox("Inserted Successfully.")
                    ShowDocumentType()
                    txtNewDocumentType.Text = ""
                    lblNewDocumentType.Visible = False
                    btnNewDocumentType.Text = "..."
                    btnNewDocumentType.ValidationGroup = ""
                Else
                    MessageBox("Error Found.")
                End If

            End If

        End If
    End Sub

    Protected Sub btnCancelInsertNewDocumentType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelInsertNewDocumentType.Click
        btnNewDocumentType.Text = "..."
        lblNewDocumentType.Visible = False
        btnCancelInsertNewDocumentType.Visible = False
    End Sub

    Protected Sub btnUploadDocument_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUploadDocument.Click
        Try
            If flupDocuments.HasFile = False Then
                MessageBox("Select A File To Upload.")
                Exit Sub
            End If

            hdFldChangeMadeToDocumentUploads.Value = "True"

            Dim dt As DataTable = GetUserDocumentData()
            Session("UserDocuments") = dt

            grdDocumentList.Caption = "::Uploaded Documents::"
            grdDocumentList.DataSource = dt
            grdDocumentList.DataBind()

            GetRemainingMandatoryDocuments()
            ClearDocumentsInformation()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Function GetUserDocumentData() As DataTable

        Dim folder As String = ""
        Dim Title As String = ""
        Dim DocExt As String = ""
        Dim DocFullName As String = ""
        Dim DocPrefix As String = ""
        Dim FileSize As Integer = 0
        Dim DocFileName As String = ""
        If flupDocuments.HasFile Then

            folder = ConfigurationManager.AppSettings("AttachmentsShow") 'Server.MapPath("~/Attachments/")

            txtDocumentName.Text = "N\A"

            Title = txtDocumentName.Text

            Title = Replace(Title, ".", "")

            FileSize = flupDocuments.PostedFile.ContentLength()
            If FileSize > 512000 Then
                MessageBox("File size should be within 500KB")
                Return Nothing
            End If

            DocPrefix = Title.Replace(" ", "")

            DocExt = System.IO.Path.GetExtension(flupDocuments.FileName)
            ' DocFileName = "Doc_" & DateTime.Now.ToString("ddMMyyHHmmss") & "_" & DocPrefix & DocExt
            DocFileName = "Doc_" & DateTime.Now.ToString("ddMMyyHHmmss") & DocExt
            DocFullName = folder & DocFileName

            Dim fs As System.IO.Stream = flupDocuments.PostedFile.InputStream
            Dim br As New System.IO.BinaryReader(fs)
            Dim bytes As Byte() = br.ReadBytes(CType(fs.Length, Integer))
            UploadFile(folder, DocFileName, bytes)
            'flupDocuments.SaveAs(DocFullName)

            Dim dtUserDocuments As DataTable = New DataTable()
            dtUserDocuments = Session("UserDocuments")

            Dim dr As DataRow
            dr = dtUserDocuments.NewRow()
            dr("DocTypeID") = drpDocumentType.SelectedValue
            dr("DocTypeName") = drpDocumentType.SelectedItem
            'dr("DocumentName") = txtDocumentName.Text
            dr("DocumentName") = "N\A"
            dr("FileName") = DocFileName 'flupDocuments.PostedFile.FileName

            dtUserDocuments.Rows.Add(dr)
            dtUserDocuments.AcceptChanges()

            Return dtUserDocuments

        Else
            MessageBox("Select A Document To Upload.")
            Return Nothing
        End If

    End Function

    Protected Sub btnUploadDocumentRefresh_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUploadDocumentRefresh.Click
        txtDocumentName.Text = ""
        drpDocumentType.SelectedIndex = -1
        lblNewDocumentType.Visible = False
        btnNewDocumentType.Text = "..."
        chkDocumentTypeIsMandatory.Checked = False
    End Sub

    Protected Sub GetRemainingMandatoryDocuments()
        Try
            grdRemainingDocuments.DataSource = ""
            grdRemainingDocuments.DataBind()

            Dim lblDocs As System.Web.UI.WebControls.Label = New Label
            Dim DocTypeIDStr As String = ""
            For Each row As GridViewRow In grdDocumentList.Rows
                lblDocs = row.FindControl("lblDocTypeID")
                DocTypeIDStr = DocTypeIDStr + "|" + lblDocs.Text + "|"
            Next

            grdRemainingDocuments.Caption = "::Remaining Mandatory Documents::"
            grdRemainingDocuments.DataSource = DocumentListData.fnGetRemainingMandatoryDocuments(DocTypeIDStr)
            grdRemainingDocuments.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ShowDocumentType()
        drpDocumentType.DataTextField = "DocumentType"
        drpDocumentType.DataValueField = "DocTypeID"
        drpDocumentType.DataSource = DocumentData.fnShowDocumentType("Candidate")
        drpDocumentType.DataBind()
    End Sub

    Protected Sub ClearDocumentsInformation()
        txtDocumentName.Text = ""
        drpDocumentType.SelectedIndex = -1
    End Sub

    Protected Sub ShowPrevUploadedDocumentInfo(ByVal UniqueUserID As String)

        If UniqueUserID = "" Then
            Exit Sub
        End If
        Dim dt As DataTable = DocumentListData.fnGetUserDocuments(UniqueUserID).Tables(0)
        Session("UserDocuments") = dt

        grdDocumentList.Caption = "::Uploaded Documents::"
        grdDocumentList.DataSource = dt
        grdDocumentList.DataBind()

        GetRemainingMandatoryDocuments()
        ClearDocumentsInformation()
    End Sub

    Protected Sub grdDocumentList_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grdDocumentList.RowDeleting
        hdFldChangeMadeToDocumentUploads.Value = "True"

        Dim i As Integer
        Dim dtUserDocuments As DataTable = New DataTable()

        dtUserDocuments = Session("UserDocuments")

        i = e.RowIndex

        dtUserDocuments.Rows(i).Delete()
        dtUserDocuments.AcceptChanges()
        grdDocumentList.DataSource = dtUserDocuments
        grdDocumentList.DataBind()

        Session("UserDocuments") = dtUserDocuments
        GetRemainingMandatoryDocuments()
    End Sub

    Protected Sub chkSamePreAdd_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkSamePreAdd.CheckedChanged
        If chkSamePreAdd.Checked = True Then
            txtPerAddress.Text = txtPreAdd.Text
            ddlperDistrict.SelectedValue = ddlPreDistrict.SelectedValue
            ddlPerThana.DataSourceID = "dsPerUpazilaName"
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

    Protected Sub ddlPreDistrict_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlPreDistrict.SelectedIndexChanged
        chkSamePreAdd.Checked = False
    End Sub

    Protected Sub ddlPreThana_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlPreThana.SelectedIndexChanged
        chkSamePreAdd.Checked = False
    End Sub

    Protected Sub ShowOccupationList()
        ddlFathersOccupation.DataTextField = "OccupationName"
        ddlFathersOccupation.DataValueField = "OccupationID"
        ddlFathersOccupation.DataSource = BasicData.fnGetOccupationList()
        ddlFathersOccupation.DataBind()

        ddlMotherOccupation.DataTextField = "OccupationName"
        ddlMotherOccupation.DataValueField = "OccupationID"
        ddlMotherOccupation.DataSource = BasicData.fnGetOccupationList()
        ddlMotherOccupation.DataBind()

        ddlSpouseOccupation.DataTextField = "OccupationName"
        ddlSpouseOccupation.DataValueField = "OccupationID"
        ddlSpouseOccupation.DataSource = BasicData.fnGetOccupationList()
        ddlSpouseOccupation.DataBind()
    End Sub

    Protected Sub grdSpecilized_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdSpecilized.RowDataBound
        Try
            e.Row.Cells(0).Visible = False
        Catch ex As Exception
        End Try
    End Sub

    Protected Sub chkHead_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim chk As System.Web.UI.WebControls.CheckBox
        Dim chkIn As System.Web.UI.WebControls.CheckBox

        chk = grdSpecilized.HeaderRow.FindControl("chkHead")

        For Each rw As GridViewRow In grdSpecilized.Rows
            chkIn = rw.FindControl("chkSelect")
            chkIn.Checked = chk.Checked
        Next
    End Sub

    Protected Sub chkSelect_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim chk As System.Web.UI.WebControls.CheckBox
        Dim chkIn As System.Web.UI.WebControls.CheckBox
        Dim flag As Boolean

        chk = grdSpecilized.HeaderRow.FindControl("chkHead")
        flag = True
        For Each rw As GridViewRow In grdSpecilized.Rows
            chkIn = rw.FindControl("chkSelect")
            If chkIn.Checked = False Then
                flag = False
                Exit For
            End If
        Next

        chk.Checked = flag
    End Sub

    Protected Sub txtPerAddress_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtPerAddress.TextChanged
        chkSamePreAdd.Checked = False
    End Sub

    Protected Sub ddlperDistrict_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlperDistrict.SelectedIndexChanged
        chkSamePreAdd.Checked = False
    End Sub

    Protected Sub ddlPerThana_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlPerThana.SelectedIndexChanged
        chkSamePreAdd.Checked = False
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Dim UserID As String
        UserID = Session("LoginUserID")

        Dim BasicInfo As New CanBasicInfo()
        Dim CandidateID As String

        CandidateID = Session("CandidateID")

        Dim CandidateName As String

        CandidateName = txtName.Text
        BasicInfo.RelationshipStatus = ddlRelStatus.SelectedValue
        BasicInfo.FatherName = txtFatherName.Text
        BasicInfo.FathersOccupation = ddlFathersOccupation.SelectedValue
        BasicInfo.MotherName = txtMotherName.Text
        BasicInfo.MothersOccupation = ddlMotherOccupation.SelectedValue
        BasicInfo.SpouseName = txtSpouseName.Text
        BasicInfo.SpouseOccupation = ddlSpouseOccupation.SelectedValue
        BasicInfo.NoOfChildrenAge = Common.CheckAsciiValue(txtNoChildren.Text)
        BasicInfo.SibblingsNameOccupation = Common.CheckAsciiValue(txtSibblingsInfo.Text)
        BasicInfo.Gender = rdbtnGender.SelectedValue
        BasicInfo.Nationality = ddlNationality.SelectedValue
        BasicInfo.NIDNo = txtNID.Text
        BasicInfo.PassportNo = txtPassportNo.Text

        BasicInfo.BloodGroupID = ddlBloodGrp.SelectedValue

        If ddlRelStatus.SelectedIndex = 0 Then
            MessageBox("Please Select Relationship Status")
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
            If txtNoChildren.Text = "" Then
                MessageBox("Please Give Your Childrens Information")
                Exit Sub
            End If
        End If

        If ddlReligion.SelectedValue = "-Select-" Then
            MessageBox("Please Select Religion")
            Exit Sub
        Else
            BasicInfo.Religion = ddlReligion.SelectedValue
        End If

        BasicInfo.PermanentAddress = Common.CheckAsciiValue(txtPerAddress.Text)
        BasicInfo.PreDistrict = ddlPreDistrict.SelectedValue
        If ddlPreDistrict.SelectedItem.Text = "" Then
            MessageBox("Please Select Present District")
            Exit Sub
        End If
        BasicInfo.PreThana = ddlPreThana.SelectedValue
        If ddlPreThana.SelectedItem.Text = "" Then
            MessageBox("Please Select Present Thana\Upazilla")
            Exit Sub
        End If
        BasicInfo.PresentAddress = Common.CheckAsciiValue(txtPreAdd.Text)
        BasicInfo.PerDistrict = ddlperDistrict.SelectedValue
        If ddlperDistrict.SelectedItem.Text = "" Then
            MessageBox("Please Select Present District")
            Exit Sub
        End If
        BasicInfo.PerThana = ddlPerThana.SelectedValue
        If ddlPerThana.SelectedItem.Text = "" Then
            MessageBox("Please Select Present Thana\Upazilla")
            Exit Sub
        End If
        BasicInfo.HomePhoneNo = txtHomePhoneNo.Text
        BasicInfo.MobileNumber = txtMobileNumber.Text
        BasicInfo.OfficePhoneNo = txtOfficePhoneNo.Text
        BasicInfo.AltEMail = txtAlEmail.Text
        BasicInfo.CareerObjective = txtCareerObjective.Text
        BasicInfo.AboutYourself = Common.CheckAsciiValue(txtAboutYrself.Text)
        BasicInfo.SpecilizedIn = txtSpecilizedIn.Text


        If ddlRelStatus.SelectedItem.ToString = "Single" Then

        End If

        If txtyrOfExp.Text = "" Then
            BasicInfo.YearOfExperience = 0
        Else
            BasicInfo.YearOfExperience = txtyrOfExp.Text
        End If

        If txtMonth.Text = "" Then
            BasicInfo.ExpInMonth = 0
        Else
            BasicInfo.ExpInMonth = txtMonth.Text
        End If

        If txtPresentSalary.Text = "" Then
            BasicInfo.PresentSalary = 0
        Else
            BasicInfo.PresentSalary = txtPresentSalary.Text
        End If

        If dtDrawnDate.Text = "" Then
            BasicInfo.LastDrawnDate = "1911-01-01"
        Else
            BasicInfo.LastDrawnDate = dtDrawnDate.Text
        End If

        If BasicInfo.PresentSalary <> 0 Then
            If (BasicInfo.LastDrawnDate = "1911-01-01") Then
                MessageBox("Please give last drawn date of your salary")
                Exit Sub
            End If
        End If

        BasicInfo.ExpectedSalary = 0
        BasicInfo.LookingFor = ddlLookingFor.SelectedValue
        BasicInfo.AvailableFor = ddlAvailableFor.SelectedValue
        BasicInfo.PreferredJobLocation = ddlPreferredJobLocation.SelectedValue
        BasicInfo.EnglishProficiency = rblEnLagPro.SelectedValue
        BasicInfo.ComputerLiteracy = rblComputerLiteracy.SelectedValue
        BasicInfo.Employeer = txtEmployeer.Text

        Dim DocumentInformation As String = ""
        Dim dtLoanAccDocuments As DataTable = New DataTable()
        dtLoanAccDocuments = Session("UserDocuments")

        If hdFldChangeMadeToDocumentUploads.Value = "True" Then
            '' Document Information
            BasicInfo.IsChangeMadeToDocumentUploads = True
            Dim DocumentInfo As clsDocumentList = New clsDocumentList()
            For Each rw As DataRow In dtLoanAccDocuments.Rows
                DocumentInfo.DocumentName = rw.Item("DocumentName")
                DocumentInfo.FileName = rw.Item("FileName")
                DocumentInfo.DocTypeID = rw.Item("DocTypeID")
                DocumentInformation = DocumentInformation & DocumentInfo.DocumentName & "~" & DocumentInfo.FileName & "~" & DocumentInfo.DocTypeID & "~|"
            Next
            BasicInfo.Documents = DocumentInformation
        Else
            BasicInfo.Documents = ""
        End If

        If ddlLookingFor.SelectedIndex = 0 Then
            MessageBox("Please Select Looking For")
            Exit Sub
        End If

        If ddlAvailableFor.SelectedIndex = 0 Then
            MessageBox("Please Select Available For")
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

        If hpAttachment.NavigateUrl <> "" Then
            DocFileName = Replace(hpAttachment.NavigateUrl, ConfigurationManager.AppSettings("Attachments"), "")
        End If

        folder = ConfigurationManager.AppSettings("Attachments") 'Server.MapPath("~/Attachments/")
        UserID = Session("LoginUserID")

        If flAttachment.HasFile Then

            FileSize = flAttachment.PostedFile.ContentLength()

            If FileSize > 10485760 Then
                MessageBox("File size should be within 10MB")
                Exit Sub
            End If

            DocPrefix = Title.Replace(" ", "")
            DocExt = System.IO.Path.GetExtension(flAttachment.FileName)

            If DocExt <> ".jpg" And DocExt = ".gif" And DocExt = ".png" Then
                MessageBox("Select Image File Only")
                Exit Sub
            End If

            DocFileName = "Photo" & "_" & CandidateName & "_" & DateTime.Now.ToString("ddMMyyHHmmss") & DocExt
            AttachmentFileName = folder & DocFileName
            'flAttachment.SaveAs(AttachmentFileName)
            MessageBox("Changing Of NID & Photo Is Not Allowed.")
        End If


        If hpSignature.NavigateUrl <> "" Then
            DocFileNameSign = Replace(hpSignature.NavigateUrl, ConfigurationManager.AppSettings("Attachments"), "")

        End If

        folder = ConfigurationManager.AppSettings("Attachments") 'Server.MapPath("~/Attachments/")
        UserID = Session("LoginUserID")

        If flSignature.HasFile Then

            FileSize = flSignature.PostedFile.ContentLength()

            If FileSize > 5242880 Then
                MessageBox("File size should be within 5MB")
                Exit Sub
            End If

            DocPrefix = Title.Replace(" ", "")

            DocExt = System.IO.Path.GetExtension(flSignature.FileName)

            If DocExt <> ".jpg" And DocExt = ".gif" And DocExt = ".png" Then
                MessageBox("Select Image File Only")
                Exit Sub
            End If

            DocFileNameSign = "Signature" & "_" & Replace(Replace(CandidateName, " ", "_"), ".", "_") & "_" & DateTime.Now.ToString("ddMMyyHHmmss") & DocExt
            Signature = folder & DocFileNameSign

            '' Uploading A file stream
            Dim DestinationPath As String = ConfigurationManager.AppSettings("AttachmentsShow")
            Dim fs As System.IO.Stream = flSignature.PostedFile.InputStream
            Dim br As New System.IO.BinaryReader(fs)
            Dim bytes As Byte() = br.ReadBytes(CType(fs.Length, Integer))
            UploadFile(DestinationPath, DocFileNameSign, bytes)
            'flSignature.SaveAs(Signature)
        End If

        If DocFileName = "" And imgValidation.ImageUrl = ConfigurationManager.AppSettings("Attachments") + "female_avatar.png" Then
            MessageBox("Photo Required")
            Exit Sub
        End If

        Dim chk As System.Web.UI.WebControls.CheckBox
        Dim Spec As System.Web.UI.WebControls.Label
        Dim SpecilizedID As String
        Dim SpecilizedInformation As String = ""

        For Each rw As GridViewRow In grdSpecilized.Rows
            chk = rw.FindControl("chkSelect")
            If chk.Checked = True Then
                'SpecilizedID = rw.Cells(0).Text
                Spec = rw.FindControl("lblSpecilizedID")
                SpecilizedID = Spec.Text
                SpecilizedInformation = SpecilizedInformation & SpecilizedID & "~|"

            End If
        Next

        Dim check As Integer = BasicData.fnUpdateBasicInfo(CandidateID, CandidateName, UserID, BasicInfo, DocFileName, DocFileNameSign, BasicInfo.Documents, SpecilizedInformation)

        If check = 1 Then
            MessageBox("Updated Successfully")
            hdFldChangeMadeToDocumentUploads.Value = "False"
            BasicInfo.IsChangeMadeToDocumentUploads = False
            If DocFileNameSign = "" Then
                imgSignature.ImageUrl = ConfigurationManager.AppSettings("Attachments") + "signature.jpg"
            Else

                'Setting Signature
                Dim absoluteFilePath As String = ConfigurationManager.AppSettings("AttachmentsShow") & DocFileNameSign
                Dim tClient As WebClient = New WebClient
                Dim memStrmSig As MemoryStream = New MemoryStream(tClient.DownloadData(absoluteFilePath))
                Dim bytesSig As Byte() = memStrmSig.ToArray()
                Dim base64StringSig As String = Convert.ToBase64String(bytesSig, 0, bytesSig.Length)
                imgSignature.ImageUrl = "data:image/png;base64," & base64StringSig
                memStrmSig.Dispose()
                'Setting Signature Ends
                'imgSignature.ImageUrl = ConfigurationManager.AppSettings("Attachments") + DocFileNameSign
            End If
        Else
            MessageBox("Error Found.")
        End If

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
