Imports System
Imports System.Data
Imports System.Net.Mail
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared
Imports System.Net
Imports System.IO

Partial Class EmployeeProfile_frmLoanApplication
    Inherits System.Web.UI.Page

    Dim BenefitTypeData As New clsBenefitTypeDataAccess()
    Dim LoanAppData As New clsLoanApplicationDataAccess()
    Dim EmployeeData As New clsEmpBasicProfileDataAccess()
    Dim MobileBenefitData As New clsMobileBenefitDataAccess()
    Dim VehicleBenefitData As New clsVehicleBenefitDataAccess()
    Dim GenLoanData As New clsGeneralLoanDataAccess()

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub GetBenefitType()
        drpFacilityType.DataTextField = "BenefitType"
        drpFacilityType.DataValueField = "BenefitTypeID"
        drpFacilityType.DataSource = BenefitTypeData.fnGetBenefitList()
        drpFacilityType.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetBenefitType()

            Dim LoginUserId As String = Session("UniqueUserID")
            getBasicProfileInfo(Session("ToWhomProShow"))

            tabPnlAddMobile.Enabled = False
            tabPnlAddVehicle.Enabled = False
            tabPnlAddPFLoan.Enabled = False
            tabBenefitComponents.ActiveTabIndex = -1
            txtMobileSetReimDate.Text = Now.Date
       
        End If
    End Sub

    Protected Sub getBasicProfileInfo(ByVal EmployeeId As String)
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
        hpLnkCanProfile.NavigateUrl = "../RecuitmentCVView.aspx?CandidateID=" + EmpBasicProfile.CandidateID

        If EmpBasicProfile.Attachment = "" Then
            imgEmployee.ImageUrl = ""
        Else
            ShowImage(ConfigurationManager.AppSettings("AttachmentsShow") & EmpBasicProfile.Attachment, "imgEmployee")
        End If

    End Sub

    Protected Sub ShowImage(ByVal UrlStr As String, ByVal ControlName As String)
        Dim tClient As WebClient = New WebClient
        Dim memStrmPic As MemoryStream = New MemoryStream(tClient.DownloadData(UrlStr))
        Dim bytesPic As Byte() = memStrmPic.ToArray()
        Dim base64StringPic As String = Convert.ToBase64String(bytesPic, 0, bytesPic.Length)

        Dim imgCtrl As System.Web.UI.WebControls.Image = Master.FindControl(ControlName)
        imgCtrl.ImageUrl = "data:image/png;base64," & base64StringPic
        memStrmPic.Dispose()
    End Sub

    Protected Sub btnInsertAddMobile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertAddMobile.Click
        Dim folder As String
        Dim DocFileName As String = ""
        Dim DocFileNameSign As String = ""
        Dim DocExt As String = ""
        Dim AttachmentFileName As String = ""
        Dim DocPrefix As String
        Dim FileSize As Integer
        Dim ToWhomProShow As String = Session("ToWhomProShow")

        Dim MobileBenefit As New clsMobileBenefit()
        Dim MailProp As New clsMailProperty()

        Try
            MobileBenefit.MobileBenefitID = hdFldBenefitID.Value
            MobileBenefit.EmployeeID = ToWhomProShow
            MobileBenefit.BenefitTypeID = drpFacilityType.SelectedValue
            MobileBenefit.IMEINo = txtIMEINo.Text
            MobileBenefit.Brand = drpMobileBrand.SelectedValue
            MobileBenefit.ModelNo = txtModelNo.Text
            MobileBenefit.MobileCost = txtMobileCost.Text
            MobileBenefit.SIMNo = txtSIMNo.Text
            MobileBenefit.Entitlement = rdbtnEntitlement.SelectedValue

            If Trim(txtDateOfPurchase.Text) = "" Then
                MobileBenefit.DateOfPurchse = "1/1/1900"
            Else
                MobileBenefit.DateOfPurchse = Convert.ToDateTime(txtDateOfPurchase.Text)
            End If

            MobileBenefit.RemarksOnMobile = txtRemarksForMobile.Text

            If txtMobileSetReimDate.Text = "" Then
                MobileBenefit.DateOfReimbursement = Now.Date
            Else
                MobileBenefit.DateOfReimbursement = Now.Date
            End If

            folder = Server.MapPath("~/Attachments/")

            If flUpMobileAttachment.HasFile Then

                FileSize = flUpMobileAttachment.PostedFile.ContentLength()

                If FileSize > 10485760 Then
                    MessageBox("File size should be within 10MB")
                    Exit Sub
                End If

                DocPrefix = Title.Replace(" ", "")
                DocExt = System.IO.Path.GetExtension(flUpMobileAttachment.FileName)
                DocFileName = "Mobile" & "_" & DateTime.Now.ToString("ddMMyyHHmmss") & DocExt
                AttachmentFileName = folder & DocFileName
                'flUpMobileAttachment.SaveAs(AttachmentFileName)

                '' Uploading A file stream
                Dim fs As System.IO.Stream = flUpMobileAttachment.PostedFile.InputStream
                Dim br As New System.IO.BinaryReader(fs)
                Dim bytes As Byte() = br.ReadBytes(CType(fs.Length, Integer))
                UploadFile(DocFileName, bytes)

                MobileBenefit.MobileAttachment = DocFileName

            Else
                MessageBox("Attachment Is Required.")
                Exit Sub
                MobileBenefit.MobileAttachment = ""
            End If

            If chkMobileInsuranceRequired.Checked = True Then
                MobileBenefit.IsInsuranceRequired = True
            Else
                MobileBenefit.IsInsuranceRequired = False
            End If

            MobileBenefit.EntryBy = Session("LoginUserID")

            MobileBenefit.MobileBenefitID = MobileBenefitData.fnInsertMobileBenefit(MobileBenefit)
            MobileBenefit.PerformedByID = Session("ToWhomProShow")
            MobileBenefit.Remarks = txtRemarksForMobile.Text
            MobileBenefit.EventName = "Requested"

            MailProp = MobileBenefitData.fnGetMobileBenefitMail(MobileBenefit)

            If MobileBenefit.MobileBenefitID <> "" Then
                MessageBox("Submitted Successfully.")
                SendBenefitReqMail(MailProp)
                ClearAddMobile()
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub UploadFile(ByVal FileName As String, ByVal filebyte As Byte())
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

    Protected Sub SendBenefitReqMail(ByVal MailProp As clsMailProperty)
        Dim mail As New Net.Mail.MailMessage()
        Dim TestArray() As String
        Try
            mail.From = New MailAddress(MailProp.MailFrom)
            TestArray = Split(MailProp.MailTo, ";")
            For i As Integer = 0 To TestArray.Length - 1
                If TestArray(i) <> "" Then
                    mail.To.Add(TestArray(i))
                End If
            Next
            TestArray = Nothing

            TestArray = Split(MailProp.MailCC, ";")
            For i As Integer = 0 To TestArray.Length - 1
                If TestArray(i) <> "" Then
                    mail.CC.Add(TestArray(i))
                End If
            Next
            TestArray = Nothing

            TestArray = Split(MailProp.MailBCC, ";")
            For i As Integer = 0 To TestArray.Length - 1
                If TestArray(i) <> "" Then
                    mail.Bcc.Add(TestArray(i))
                End If
            Next
            TestArray = Nothing
            mail.Subject = MailProp.MailSubject
            mail.Body = MailProp.MailBody
            mail.IsBodyHtml = True
            Dim smtp As New SmtpClient("192.168.1.242", 25)
            smtp.Send(mail)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnAddVehicle_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddVehicle.Click
        Dim folder As String
        Dim DocFileName As String = ""
        Dim DocFileNameSign As String = ""
        Dim DocExt As String = ""
        Dim AttachmentFileName As String = ""
        Dim DocPrefix As String
        Dim FileSize As Integer

        Try
            Dim ToWhomProShow As String = Session("ToWhomProShow")
            Dim VehicleBenefit As New clsVehicleBenefit()
            Dim MailProp As New clsMailProperty()

            VehicleBenefit.EmployeeID = ToWhomProShow
            VehicleBenefit.BenefitTypeID = drpFacilityType.SelectedValue
            VehicleBenefit.VehicleType = drpVehicleType.SelectedValue
            VehicleBenefit.Brand = drpBrand.SelectedValue
            VehicleBenefit.YearModel = txtYearModel.Text
            VehicleBenefit.EngineNo = txtEngineNo.Text
            VehicleBenefit.ChasisNo = txtChasisNo.Text
            VehicleBenefit.CurrentOwner = txtCurrentOwner.Text
            VehicleBenefit.PreviousOwner = txtPreviousOwner.Text

            If Trim(txtOwnershipTransferDate.Text) = "" Then
                VehicleBenefit.OwnershipTransferDate = "1/1/1900"
            Else
                VehicleBenefit.OwnershipTransferDate = Convert.ToDateTime(txtOwnershipTransferDate.Text)
            End If

            VehicleBenefit.VehicleCost = Convert.ToDouble(txtVehicleCost.Text)
            VehicleBenefit.LoanAmount = Convert.ToDouble(txtVehLoanAmount.Text)
            VehicleBenefit.InstallmentAmnt = Convert.ToDouble(txtInstallmentAmnt.Text)
            VehicleBenefit.RegistrationNo = txtRegistrationNo.Text
            VehicleBenefit.RegistrationDate = Convert.ToDateTime(txtRegistrationDate.Text)
            VehicleBenefit.RemarksOnVehicle = txtRemarksOnVehicle.Text

            If txtVehicleReimbursementDate.Text = "" Then
                VehicleBenefit.ReimbursementDate = "1/1/1900"
            Else
                VehicleBenefit.ReimbursementDate = Convert.ToDateTime(txtVehicleReimbursementDate.Text)
            End If

            folder = Server.MapPath("~/Attachments/")

            If flupVehicleAttachment.HasFile Then

                FileSize = flupVehicleAttachment.PostedFile.ContentLength()

                If FileSize > 10485760 Then
                    MessageBox("File size should be within 10MB")
                    Exit Sub
                End If

                DocPrefix = Title.Replace(" ", "")
                DocExt = System.IO.Path.GetExtension(flupVehicleAttachment.FileName)
                DocFileName = "Vehicle" & "_" & DateTime.Now.ToString("ddMMyyHHmmss") & DocExt
                AttachmentFileName = folder & DocFileName
                'flupVehicleAttachment.SaveAs(AttachmentFileName)

                '' Uploading A file stream
                Dim fs As System.IO.Stream = flupVehicleAttachment.PostedFile.InputStream
                Dim br As New System.IO.BinaryReader(fs)
                Dim bytes As Byte() = br.ReadBytes(CType(fs.Length, Integer))
                UploadFile(DocFileName, bytes)

                VehicleBenefit.VehicleAttachment = DocFileName

            Else
                MessageBox("Attachment Required")
                Exit Sub
            End If

            If chkVehicleIsInsuranceRequired.Checked = True Then
                VehicleBenefit.IsInsuranceRequired = True
            Else
                VehicleBenefit.IsInsuranceRequired = False
            End If

            VehicleBenefit.VehicleCondition = drpVehicleCondition.SelectedValue
            VehicleBenefit.EntryBy = Session("LoginUserID")

            VehicleBenefit.VehicleBenefitID = VehicleBenefitData.fnInsertVehicleBenefit(VehicleBenefit)
            VehicleBenefit.PerformedByID = Session("ToWhomProShow")
            VehicleBenefit.Remarks = txtRemarksOnVehicle.Text
            VehicleBenefit.EventName = "Requested"

            MailProp = VehicleBenefitData.fnGetVehicleBenefitMail(VehicleBenefit)

            If VehicleBenefit.VehicleBenefitID <> "" Then
                MessageBox("Application Submitted.")
                SendBenefitReqMail(MailProp)
                ClearVehicleForm()
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
        
    End Sub

    Protected Sub btnAddGeneralLoan_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddGeneralLoan.Click
        Dim folder As String = ""
        Dim DocFileName As String = ""
        Dim DocFileNameSign As String = ""
        Dim DocExt As String = ""
        Dim AttachmentFileName As String = ""
        Dim DocPrefix As String = ""
        Dim FileSize As Integer = 0

        Dim GenLoan As New clsGeneralLoan()
        Dim MailProp As New clsMailProperty()

        Try
            GenLoan.EmployeeID = Session("ToWhomProShow")
            GenLoan.BenefitTypeID = drpFacilityType.SelectedValue
            GenLoan.LoanAmount = Convert.ToDouble(txtGeneralLoanAmount.Text)

            If chkGeneralLoanIsInsuranceRequired.Checked = True Then
                GenLoan.IsInsuranceRequired = True
            Else
                GenLoan.IsInsuranceRequired = False
            End If

            If txtReimbursementDate.Text = "" Then
                GenLoan.ReimbursementDate = Now.Date
            Else
                GenLoan.ReimbursementDate = Convert.ToDateTime(txtReimbursementDate.Text)
            End If

            GenLoan.GenLoanType = "N\A"
            GenLoan.Remarks = txtRemarksOnGeneralLoan.Text

            folder = Server.MapPath("~/Attachments/")

            If flupGeneralLoanAttachment.HasFile Then

                FileSize = flupGeneralLoanAttachment.PostedFile.ContentLength()

                If FileSize > 10485760 Then
                    MessageBox("File size should be within 10MB")
                    Exit Sub
                End If

                DocPrefix = Title.Replace(" ", "")
                DocExt = System.IO.Path.GetExtension(flupGeneralLoanAttachment.FileName)
                DocFileName = "General_Loan" & "_" & DateTime.Now.ToString("ddMMyyHHmmss") & DocExt
                AttachmentFileName = folder & DocFileName
                'flupGeneralLoanAttachment.SaveAs(AttachmentFileName)

                '' Uploading A file stream
                Dim fs As System.IO.Stream = flupGeneralLoanAttachment.PostedFile.InputStream
                Dim br As New System.IO.BinaryReader(fs)
                Dim bytes As Byte() = br.ReadBytes(CType(fs.Length, Integer))
                UploadFile(DocFileName, bytes)

                GenLoan.Attachment = DocFileName

            Else
                GenLoan.Attachment = ""
            End If

            GenLoan.EntryBy = Session("LoginUserID")

            GenLoan.GenLoanID = GenLoanData.fnInsertGeneralLoan(GenLoan)
            GenLoan.PerformedByID = Session("ToWhomProShow")
            GenLoan.Remarks = txtRemarksOnGeneralLoan.Text
            GenLoan.EventName = "Requested"

            MailProp = GenLoanData.fnGetGenBenefitMail(GenLoan)

            If GenLoan.GenLoanID <> "" Then
                MessageBox("General Loan Request Sent.")
                SendBenefitReqMail(MailProp)
                ClearFormGenLoanInfo()
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
        
    End Sub

    Protected Sub ClearAddMobile()
        txtIMEINo.Text = ""
        txtModelNo.Text = ""
        txtSIMNo.Text = ""
        txtMobileSetReimDate.Text = ""
        drpMobileBrand.SelectedIndex = 0
        txtMobileCost.Text = ""
        txtDateOfPurchase.Text = ""
        txtRemarksForMobile.Text = ""
        chkMobileInsuranceRequired.Checked = False
    End Sub

    Protected Sub drpFacilityType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpFacilityType.SelectedIndexChanged
        If drpFacilityType.SelectedItem.Text = "Mobile Benefit" Then
            tabBenefitComponents.ActiveTabIndex = 0
            tabPnlAddMobile.Enabled = True
            tabPnlAddVehicle.Enabled = False
            tabPnlAddPFLoan.Enabled = False
        ElseIf drpFacilityType.SelectedItem.Text = "Vehicle Loan" Then
            tabBenefitComponents.ActiveTabIndex = 1
            tabPnlAddMobile.Enabled = False
            tabPnlAddVehicle.Enabled = True
            tabPnlAddPFLoan.Enabled = False
        Else
            tabBenefitComponents.ActiveTabIndex = 2
            tabPnlAddMobile.Enabled = False
            tabPnlAddVehicle.Enabled = False
            tabPnlAddPFLoan.Enabled = True
        End If
    End Sub

    Protected Sub ClearVehicleForm()
        drpVehicleType.SelectedIndex = -1
        drpBrand.SelectedIndex = -1
        txtYearModel.Text = ""
        txtEngineNo.Text = ""
        txtChasisNo.Text = ""
        txtCurrentOwner.Text = ""
        txtPreviousOwner.Text = ""
        txtOwnershipTransferDate.Text = ""
        txtVehicleCost.Text = ""
        txtRegistrationNo.Text = ""
        txtRegistrationDate.Text = ""
        txtRemarksOnVehicle.Text = ""
        txtVehicleReimbursementDate.Text = ""
        chkVehicleIsInsuranceRequired.Checked = False
    End Sub

    Protected Sub ClearFormGenLoanInfo()
        txtGeneralLoanAmount.Text = ""
        txtRemarksOnGeneralLoan.Text = ""
        chkGeneralLoanIsInsuranceRequired.Checked = False
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearAddMobile()
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
            repName = folder & "rptLoanAppWelfareFund.rpt"
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
            myReport.ExportToHttpResponse(ExportFormatType.RichText, Response, True, "Welfare-Fund-Loan-App")
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub
End Class
