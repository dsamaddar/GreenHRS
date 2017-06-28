Imports System.Net
Imports System.IO

Partial Class EmployeeProfile_frmInsuranceInfo
    Inherits System.Web.UI.Page

    Dim EmpLoanAccData As New clsEmpLoanAccountDataAccess()
    Dim InsuranceInfoData As New clsInsuranceInfoDataAccess()
    Dim EmployeeData As New clsEmpBasicProfileDataAccess()

    Protected Sub GetAllApprovedLoanAccount(ByVal EmployeeID As String)
        grdEmpLoanAcc.DataSource = EmpLoanAccData.fnGetAllApprovedLoanAccByEmpID(EmployeeID)
        grdEmpLoanAcc.DataBind()
    End Sub

    Protected Sub ClearInsuranceInfo()
        drpInsuranceType.SelectedIndex = 0
        txtInsuranceWith.Text = ""
        txtInsuranceValue.Text = ""
        txtInsuranceNo.Text = ""
        txtInsuranceStartDate.Text = ""
        txtInsuranceRenewalDate.Text = ""
    End Sub

    Protected Sub btnAddInsurance_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddInsurance.Click

        Dim folder As String
        Dim DocFileName As String = ""
        Dim DocFileNameSign As String = ""
        Dim DocExt As String = ""
        Dim AttachmentFileName As String = ""
        Dim DocPrefix As String
        Dim FileSize As Integer
        Dim ToWhomProShow As String = Session("ToWhomProShow")
        Dim InsuranceInfo As New clsInsuranceInfo()

        Dim lblEmpLoanAccountID, lblBenefitID As New Label()

        If grdEmpLoanAcc.SelectedIndex = -1 Then
            MessageBox("Select A Benefit First.")
            Exit Sub
        End If

        lblEmpLoanAccountID = grdEmpLoanAcc.SelectedRow.FindControl("lblEmpLoanAccountID")
        lblBenefitID = grdEmpLoanAcc.SelectedRow.FindControl("lblBenefitID")

        InsuranceInfo.EmployeeID = ToWhomProShow
        InsuranceInfo.EmpLoanAccountID = lblEmpLoanAccountID.Text
        InsuranceInfo.BenefitID = lblBenefitID.Text
        InsuranceInfo.InsuranceType = drpInsuranceType.SelectedValue
        InsuranceInfo.InsuranceWith = txtInsuranceWith.Text
        InsuranceInfo.InsuredValue = txtInsuranceValue.Text
        InsuranceInfo.InsuranceNo = txtInsuranceNo.Text

        If Trim(txtInsuranceStartDate.Text) = "" Then
            InsuranceInfo.InsuranceStartDate = "1/1/1900"
        Else
            InsuranceInfo.InsuranceStartDate = Convert.ToDateTime(txtInsuranceStartDate.Text)
        End If

        If txtInsuranceRenewalDate.Text = "" Then
            InsuranceInfo.InsuranceRenewalDate = "1/1/1900"
        Else
            InsuranceInfo.InsuranceRenewalDate = Convert.ToDateTime(txtInsuranceRenewalDate.Text)
        End If

        folder = Server.MapPath("~/Attachments/")

        If flUpInsurance.HasFile Then

            FileSize = flUpInsurance.PostedFile.ContentLength()

            If FileSize > 10485760 Then
                MessageBox("File size should be within 10MB")
                Exit Sub
            End If

            DocPrefix = Title.Replace(" ", "")
            DocExt = System.IO.Path.GetExtension(flUpInsurance.FileName)
            DocFileName = "Mobile_Insur" & "_" & DateTime.Now.ToString("ddMMyyHHmmss") & DocExt
            AttachmentFileName = folder & DocFileName
            flUpInsurance.SaveAs(AttachmentFileName)
            InsuranceInfo.InsuranceAttachment = DocFileName

        Else
            InsuranceInfo.InsuranceAttachment = ""
        End If


        InsuranceInfo.EntryBy = Session("LoginUserID")

        Dim Check As Integer = InsuranceInfoData.fnInsertInsuranceInfo(InsuranceInfo)

        If Check = 1 Then
            MessageBox("Inserted Successfully.")
            ClearInsuranceInfo()
            ShowExistingInsurance(lblEmpLoanAccountID.Text)
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub ShowExistingInsurance(ByVal EmpLoanAccountID As String)
        grdInsuranceInfo.DataSource = InsuranceInfoData.fnShowInsuranceInfoByLoanAccID(EmpLoanAccountID)
        grdInsuranceInfo.DataBind()
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetAllApprovedLoanAccount(Session("UniqueUserID"))
            getBasicProfileInfo(Session("UniqueUserID"))
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

    Protected Sub grdEmpLoanAcc_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdEmpLoanAcc.SelectedIndexChanged
        Dim lblEmpLoanAccountID As New Label()

        lblEmpLoanAccountID = grdEmpLoanAcc.SelectedRow.FindControl("lblEmpLoanAccountID")

        ShowExistingInsurance(lblEmpLoanAccountID.Text)

    End Sub

End Class
