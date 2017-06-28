Imports System
Imports System.Data
Imports System.Net.Mail
Imports System.Net
Imports System.IO

Partial Class EmployeeProfile_frmApproveLoanApp
    Inherits System.Web.UI.Page

    Dim LoanAppData As New clsLoanApplicationDataAccess()
    Dim EmployeeData As New clsEmpBasicProfileDataAccess()
    Dim MobileBenefitData As New clsMobileBenefitDataAccess()
    Dim VehicleBenefitData As New clsVehicleBenefitDataAccess()
    Dim GenLoanData As New clsGeneralLoanDataAccess()

    Protected Sub btnApprove_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnApprove.Click

        Dim LoanApp As New clsLoanApplication()
        Dim lblBenefitID, lblBenefitType As New Label()
        Dim MobileBenefit As New clsMobileBenefit()
        Dim VehicleBenefit As New clsVehicleBenefit()
        Dim GenLoan As New clsGeneralLoan()
        Dim MailProp As New clsMailProperty()

        If grdAppliedLoanApplication.SelectedIndex = -1 Then
            MessageBox("Select An Applicatoin First.")
            Exit Sub
        End If

        Try
            lblBenefitID = grdAppliedLoanApplication.SelectedRow.FindControl("lblBenefitID")
            lblBenefitType = grdAppliedLoanApplication.SelectedRow.FindControl("lblBenefitType")

            LoanApp.BenefitID = lblBenefitID.Text
            LoanApp.RecommendationRemarks = txtRemarks.Text
            LoanApp.LoanAppEvent = "Approved"
            LoanApp.EntryBy = Session("LoginUserID")
            LoanApp.AppStatus = "Secondary"

            Dim Result As clsResult = LoanAppData.fnRecommendBenefit(LoanApp)

            If Result.Success = True Then

                If lblBenefitType.Text.Contains("Mobile") Then
                    MobileBenefit.MobileBenefitID = lblBenefitID.Text
                    MobileBenefit.PerformedByID = Session("UniqueUserID")
                    MobileBenefit.Remarks = txtRemarks.Text
                    MobileBenefit.EventName = "Recommended"

                    MailProp = MobileBenefitData.fnGetMobileBenefitMail(MobileBenefit)
                    SendBenefitReqMail(MailProp)
                ElseIf lblBenefitType.Text.Contains("Vehicle") Then
                    VehicleBenefit.VehicleBenefitID = lblBenefitID.Text
                    VehicleBenefit.PerformedByID = Session("UniqueUserID")
                    VehicleBenefit.Remarks = txtRemarks.Text
                    VehicleBenefit.EventName = "Recommended"

                    MailProp = VehicleBenefitData.fnGetVehicleBenefitMail(VehicleBenefit)
                    SendBenefitReqMail(MailProp)
                Else
                    GenLoan.GenLoanID = lblBenefitID.Text
                    GenLoan.PerformedByID = Session("UniqueUserID")
                    GenLoan.Remarks = txtRemarks.Text
                    GenLoan.EventName = "Recommended"

                    MailProp = GenLoanData.fnGetGenBenefitMail(GenLoan)
                    SendBenefitReqMail(MailProp)
                End If

                Result.Message = "Recommendation " + Result.Message
                ClearForm()
            End If

            MessageBox(Result.Message)
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

    Protected Sub btnReject_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReject.Click
        Dim LoanApp As New clsLoanApplication()
        Dim lblBenefitID, lblBenefitType As New Label()

        Dim MobileBenefit As New clsMobileBenefit()
        Dim VehicleBenefit As New clsVehicleBenefit()
        Dim GenLoan As New clsGeneralLoan()
        Dim MailProp As New clsMailProperty()

        If grdAppliedLoanApplication.SelectedIndex = -1 Then
            MessageBox("Select An Applicatoin First.")
            Exit Sub
        End If

        Try
            lblBenefitID = grdAppliedLoanApplication.SelectedRow.FindControl("lblBenefitID")
            lblBenefitType = grdAppliedLoanApplication.SelectedRow.FindControl("lblBenefitType")

            LoanApp.BenefitID = lblBenefitID.Text
            LoanApp.RecommendationRemarks = txtRemarks.Text
            LoanApp.LoanAppEvent = "Rejected"
            LoanApp.EntryBy = Session("LoginUserID")
            LoanApp.AppStatus = "Rejected"

            Dim Result As clsResult = LoanAppData.fnRecommendBenefit(LoanApp)

            If Result.Success = True Then

                If lblBenefitType.Text.Contains("Mobile") Then
                    MobileBenefit.MobileBenefitID = lblBenefitID.Text
                    MobileBenefit.PerformedByID = Session("UniqueUserID")
                    MobileBenefit.Remarks = txtRemarks.Text
                    MobileBenefit.EventName = "Rejected"

                    MailProp = MobileBenefitData.fnGetMobileBenefitMail(MobileBenefit)
                    SendBenefitReqMail(MailProp)
                ElseIf lblBenefitType.Text.Contains("Vehicle") Then
                    VehicleBenefit.VehicleBenefitID = lblBenefitID.Text
                    VehicleBenefit.PerformedByID = Session("UniqueUserID")
                    VehicleBenefit.Remarks = txtRemarks.Text
                    VehicleBenefit.EventName = "Rejected"

                    MailProp = VehicleBenefitData.fnGetVehicleBenefitMail(VehicleBenefit)
                    SendBenefitReqMail(MailProp)
                Else
                    GenLoan.GenLoanID = lblBenefitID.Text
                    GenLoan.PerformedByID = Session("UniqueUserID")
                    GenLoan.Remarks = txtRemarks.Text
                    GenLoan.EventName = "Rejected"

                    MailProp = GenLoanData.fnGetGenBenefitMail(GenLoan)
                    SendBenefitReqMail(MailProp)
                End If

                Result.Message = "Rejected " + Result.Message
                ClearForm()
            End If

            MessageBox(Result.Message)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub ClearFormPrimary()
        txtPrimaryAppRemarks.Text = ""

        If grdAppliedLoanFrPrimaryRec.Rows.Count > 0 Then
            grdAppliedLoanFrPrimaryRec.SelectedIndex = -1

        End If
       
        GetLoanAppForPrimaryApproval(Session("ToWhomProShow"))
        btnPrimaryApprove.Enabled = False
        btnPrimaryReject.Enabled = False
    End Sub

    Protected Sub ClearForm()
        txtRemarks.Text = ""
        grdAppliedLoanApplication.SelectedIndex = -1

        GetLoanAppForRecommendation((Session("ToWhomProShow")))
        btnApprove.Enabled = False
        btnReject.Enabled = False
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearForm()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim LoginUserId As String = Session("UniqueUserID")
            getBasicProfileInfo(Session("ToWhomProShow"))
            GetLoanAppForRecommendation(Session("ToWhomProShow"))
            GetLoanAppForPrimaryApproval(Session("ToWhomProShow"))
            btnApprove.Enabled = False
            btnReject.Enabled = False

            btnPrimaryApprove.Enabled = False
            btnPrimaryReject.Enabled = False

        End If
    End Sub

    Protected Sub GetLoanAppForRecommendation(ByVal EmployeeID As String)
        grdAppliedLoanApplication.DataSource = LoanAppData.fnGetLoanAppForRecomm(EmployeeID)
        grdAppliedLoanApplication.DataBind()
    End Sub

    Protected Sub GetLoanAppForPrimaryApproval(ByVal EmployeeID As String)
        grdAppliedLoanFrPrimaryRec.DataSource = LoanAppData.fnGetLoanAppForPrimaryRecomm(EmployeeID)
        grdAppliedLoanFrPrimaryRec.DataBind()
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
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

    Protected Sub grdAppliedLoanApplication_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdAppliedLoanApplication.SelectedIndexChanged

        btnApprove.Enabled = True
        btnReject.Enabled = True

    End Sub

    Protected Sub btnPrimaryReject_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrimaryReject.Click
        Dim LoanApp As New clsLoanApplication()
        Dim lblPrimaryBenefitID, lblPrimaryBenefitType As New Label()

        Dim MobileBenefit As New clsMobileBenefit()
        Dim VehicleBenefit As New clsVehicleBenefit()
        Dim GenLoan As New clsGeneralLoan()
        Dim MailProp As New clsMailProperty()

        If grdAppliedLoanFrPrimaryRec.SelectedIndex = -1 Then
            MessageBox("Select An Applicatoin First.")
            Exit Sub
        End If

        Try
            lblPrimaryBenefitID = grdAppliedLoanFrPrimaryRec.SelectedRow.FindControl("lblPrimaryBenefitID")
            lblPrimaryBenefitType = grdAppliedLoanFrPrimaryRec.SelectedRow.FindControl("lblPrimaryBenefitType")

            LoanApp.BenefitID = lblPrimaryBenefitID.Text
            LoanApp.RecommendationRemarks = txtPrimaryAppRemarks.Text
            LoanApp.LoanAppEvent = "Rejected"
            LoanApp.EntryBy = Session("LoginUserID")
            LoanApp.AppStatus = "Rejected"

            Dim Result As clsResult = LoanAppData.fnRecommendBenefit(LoanApp)

            If Result.Success = True Then

                If lblPrimaryBenefitType.Text.Contains("Mobile") Then
                    MobileBenefit.MobileBenefitID = lblPrimaryBenefitID.Text
                    MobileBenefit.PerformedByID = Session("UniqueUserID")
                    MobileBenefit.Remarks = txtRemarks.Text
                    MobileBenefit.EventName = "Rejected"

                    MailProp = MobileBenefitData.fnGetMobileBenefitMail(MobileBenefit)
                    SendBenefitReqMail(MailProp)
                ElseIf lblPrimaryBenefitType.Text.Contains("Vehicle") Then
                    VehicleBenefit.VehicleBenefitID = lblPrimaryBenefitID.Text
                    VehicleBenefit.PerformedByID = Session("UniqueUserID")
                    VehicleBenefit.Remarks = txtRemarks.Text
                    VehicleBenefit.EventName = "Rejected"

                    MailProp = VehicleBenefitData.fnGetVehicleBenefitMail(VehicleBenefit)
                    SendBenefitReqMail(MailProp)
                Else
                    GenLoan.GenLoanID = lblPrimaryBenefitID.Text
                    GenLoan.PerformedByID = Session("UniqueUserID")
                    GenLoan.Remarks = txtRemarks.Text
                    GenLoan.EventName = "Rejected"

                    MailProp = GenLoanData.fnGetGenBenefitMail(GenLoan)
                    SendBenefitReqMail(MailProp)
                End If

                Result.Message = "Rejected " + Result.Message
                ClearFormPrimary()
            End If

            MessageBox(Result.Message)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnPrimaryApprove_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrimaryApprove.Click
        Dim LoanApp As New clsLoanApplication()
        Dim lblPrimaryBenefitID, lblPrimaryBenefitType As New Label()
        Dim MobileBenefit As New clsMobileBenefit()
        Dim VehicleBenefit As New clsVehicleBenefit()
        Dim GenLoan As New clsGeneralLoan()
        Dim MailProp As New clsMailProperty()

        If grdAppliedLoanFrPrimaryRec.SelectedIndex = -1 Then
            MessageBox("Select An Applicatoin First.")
            Exit Sub
        End If

        Try
            lblPrimaryBenefitID = grdAppliedLoanFrPrimaryRec.SelectedRow.FindControl("lblPrimaryBenefitID")
            lblPrimaryBenefitType = grdAppliedLoanFrPrimaryRec.SelectedRow.FindControl("lblPrimaryBenefitType")

            LoanApp.BenefitID = lblPrimaryBenefitID.Text
            LoanApp.RecommendationRemarks = txtPrimaryAppRemarks.Text
            LoanApp.LoanAppEvent = "Approved"
            LoanApp.EntryBy = Session("LoginUserID")
            LoanApp.AppStatus = "Primary"

            Dim Result As clsResult = LoanAppData.fnRecommendBenefit(LoanApp)

            If Result.Success = True Then

                If lblPrimaryBenefitType.Text.Contains("Mobile") Then
                    'MobileBenefit.MobileBenefitID = lblPrimaryBenefitID.Text
                    'MobileBenefit.PerformedByID = Session("UniqueUserID")
                    'MobileBenefit.Remarks = txtRemarks.Text
                    'MobileBenefit.EventName = "Primary"

                    'MailProp = MobileBenefitData.fnGetMobileBenefitMail(MobileBenefit)
                    'SendBenefitReqMail(MailProp)

                    MobileBenefit.MobileBenefitID = lblPrimaryBenefitID.Text
                    MobileBenefit.PerformedByID = Session("UniqueUserID")
                    MobileBenefit.Remarks = txtRemarks.Text
                    MobileBenefit.EventName = "Recommended"

                    MailProp = MobileBenefitData.fnGetMobileBenefitMail(MobileBenefit)
                    SendBenefitReqMail(MailProp)

                ElseIf lblPrimaryBenefitType.Text.Contains("Vehicle") Then
                    VehicleBenefit.VehicleBenefitID = lblPrimaryBenefitID.Text
                    VehicleBenefit.PerformedByID = Session("UniqueUserID")
                    VehicleBenefit.Remarks = txtRemarks.Text
                    VehicleBenefit.EventName = "Primary"

                    MailProp = VehicleBenefitData.fnGetVehicleBenefitMail(VehicleBenefit)
                    SendBenefitReqMail(MailProp)
                Else
                    GenLoan.GenLoanID = lblPrimaryBenefitID.Text
                    GenLoan.PerformedByID = Session("UniqueUserID")
                    GenLoan.Remarks = txtRemarks.Text
                    GenLoan.EventName = "Primary"

                    MailProp = GenLoanData.fnGetGenBenefitMail(GenLoan)
                    SendBenefitReqMail(MailProp)
                End If

                Result.Message = "Primary Approval " + Result.Message
                ClearFormPrimary()
            End If

            MessageBox(Result.Message)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub btnPrimaryCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrimaryCancel.Click

        If grdAppliedLoanFrPrimaryRec.Rows.Count > 0 Then
            grdAppliedLoanFrPrimaryRec.SelectedIndex = -1
        End If

        txtPrimaryAppRemarks.Text = ""


    End Sub

    Protected Sub grdAppliedLoanFrPrimaryRec_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdAppliedLoanFrPrimaryRec.SelectedIndexChanged
        btnPrimaryApprove.Enabled = True
        btnPrimaryReject.Enabled = True
    End Sub

End Class
