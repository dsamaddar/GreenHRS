Imports System.Net
Imports System.IO
Imports System.Web.UI
Imports System.Data

Partial Class EmployeeProfile_frmEmpCareerProgression
    Inherits System.Web.UI.Page

    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()
    Dim ConfEvalDataAccess As New clsConfirmationEvaluationDataAccess()
    Dim EducationInformation As New clsEmployeeAllInfoDataAccess()
    Dim DeptData As New clsDepartmentDataAccess()
    Dim ContractRenewalDataAccess As New clsContractRenewalDataAccess()
    Dim PromotionHistoryData As New clsPromotionHistoryDataAccess()
    Dim DeptTransferData As New clsDeptTransferDataAccess()
    Dim BranchTransferData As New clsBranchTransferDataAccess()
    Dim SupervisorChngData As New clsSupervisorChangeDataAccess()
    Dim EmployeeData As New clsEmpBasicProfileDataAccess()
    Dim FunctionalDesigData As New clsFunctionalDesigHistDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim OfficialDesignationID As String = ""
            Dim FunctionalDesignation As String = ""
            Dim CurrentSupervisor As String = ""
            Dim DepartmentID As String = ""
            Dim ULCBranchID As String = ""

            ShowDesignationOfficial()
            getDepartmentName()
            getSupervisorList()
            ShowULCBranch()
            ShowDesignationFunc()

            Dim LoginUserId As String = Session("UniqueUserID")

            Dim ToWhomProShow As String = Session("ToWhomProShow")
            lblHolder.Text = ToWhomProShow

            getPromotedDesignation(lblHolder.Text)

            getBasicProfileInfo(lblHolder.Text)

            PromotionHistoryData.fnGetEmpRelatedForCarPro(lblHolder.Text, OfficialDesignationID, FunctionalDesignation, CurrentSupervisor, DepartmentID, ULCBranchID)

            ddlEarlierDesignation.SelectedValue = OfficialDesignationID
            drpTrnsOfDeptCurrentDept.SelectedValue = DepartmentID
            drpTrnsOfDeptCurrentSupervisor.SelectedValue = CurrentSupervisor
            drpTrnsLocationCurrentBranch.SelectedValue = ULCBranchID
            ddlEarFuncDesig.SelectedValue = FunctionalDesignation
            drpTrnsOfLocCurrentSupervisor.SelectedValue = CurrentSupervisor
            drpSupervisorChngCurrentSupervisor.SelectedValue = CurrentSupervisor

            If LoginUserId = ToWhomProShow Then
                Dim Check As Boolean = EducationInformation.CheckPermissionForOwnInfo(LoginUserId)
                If Check = True Then
                    pnlContractRen.Visible = True
                    pnlPromotionHistory.Visible = True
                    pnlTransferOfDepartment.Visible = True
                    pnlTransferOfLocation.Visible = True
                    pnlFuncDesig.Visible = True
                Else
                    pnlContractRen.Visible = False
                    pnlPromotionHistory.Visible = False
                    pnlTransferOfDepartment.Visible = False
                    pnlTransferOfLocation.Visible = False
                    pnlFuncDesig.Visible = False
                End If
            Else
                Dim Check As Boolean = EducationInformation.CheckPermissionForOthers(LoginUserId)
                If Check = True Then
                    pnlContractRen.Visible = True
                    pnlPromotionHistory.Visible = True
                    pnlTransferOfDepartment.Visible = True
                    pnlTransferOfLocation.Visible = True
                    pnlFuncDesig.Visible = True
                Else
                    pnlContractRen.Visible = False
                    pnlPromotionHistory.Visible = False
                    pnlTransferOfDepartment.Visible = False
                    pnlTransferOfLocation.Visible = False
                    pnlFuncDesig.Visible = False
                End If
            End If

            getConfirmationDoc(lblHolder.Text)

            If grdConfirmation.Rows.Count <> 0 Then
                pnlConfirmationEvaluation.Visible = False
            Else
                pnlConfirmationEvaluation.Visible = True
            End If

            Dim CheckAvailability As Integer = ConfEvalDataAccess.EmpCheckForConfirmation(ToWhomProShow)

            If CheckAvailability <> 0 Then
                pnlConfirmationEvaluation.Visible = False
            End If

            getContractRenewalData(lblHolder.Text)

            getPromotionHistoryData(lblHolder.Text)

            getDepartmentTransferData(lblHolder.Text)

            getLocationTransferData(lblHolder.Text)

            getFuncDesigData(lblHolder.Text)
            getSupervisorChngData(lblHolder.Text)

        End If
    End Sub

#Region "Confiramation Evaluation"

    Protected Sub btnInsertConfirmation_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertConfirmation.Click
        Dim folder As String = ""
        Dim DocExt As String = ""
        Dim DocFullName As String = ""
        Dim FileSize As Integer = 0
        Dim DocFileNameConf As String = ""
        Dim DocFullNameEva As String = ""
        Dim DocFileNameEva As String = ""

        Dim ConfirmationEvaluation As New clsConfirmationEvaluation()

        ConfirmationEvaluation.EmployeeID = lblHolder.Text
        ConfirmationEvaluation.EvaluationSummary = txtConfirmationEvaluationSummary.Text
        ConfirmationEvaluation.JoiningDesignation = ddlJoiningDesignation.SelectedValue
        ConfirmationEvaluation.DecisionOfConfirmation = drpDecisionOfConfirmation.SelectedValue
        ConfirmationEvaluation.ConfirmationDesignation = ddlConfirmationDesignation.SelectedValue

        If txtConfirmationEvaluationDate.Text = "" Then
            ConfirmationEvaluation.EffectiveDate = "1/1/1900"
        Else
            ConfirmationEvaluation.EffectiveDate = txtConfirmationEvaluationDate.Text
        End If

        If flUpConfirmationApp.HasFile Then
            folder = Server.MapPath("~/Attachments/")

            FileSize = flUpConfirmationApp.PostedFile.ContentLength()
            If FileSize > 512000 Then
                MessageBox("File size should be within 500KB")
                Exit Sub
            End If

            DocExt = System.IO.Path.GetExtension(flUpConfirmationApp.FileName)
            DocFileNameConf = "Conf_App_Doc_" & DateTime.Now.ToString("ddMMyyHHmmss") & DocExt
            DocFullName = folder & DocFileNameConf

            '' Uploading A file stream
            Dim DestinationPath As String = ConfigurationManager.AppSettings("AttachmentsShow")
            Dim fs As System.IO.Stream = flUpConfirmationApp.PostedFile.InputStream
            Dim br As New System.IO.BinaryReader(fs)
            Dim bytes As Byte() = br.ReadBytes(CType(fs.Length, Integer))
            UploadFile(DocFileNameConf, bytes)
            'flUpConfirmationApp.SaveAs(DocFullName)
        Else
            DocFileNameConf = ""
        End If

        If flUpConfirmationEva.HasFile Then
            folder = Server.MapPath("~/Attachments/")

            FileSize = flUpConfirmationEva.PostedFile.ContentLength()
            If FileSize > 512000 Then
                MessageBox("File size should be within 500KB")
                Exit Sub
            End If

            DocExt = System.IO.Path.GetExtension(flUpConfirmationEva.FileName)
            DocFileNameEva = "Conf_Eva_Doc_" & DateTime.Now.ToString("ddMMyyHHmmss") & DocExt
            DocFullNameEva = folder & DocFileNameEva

            '' Uploading A file stream
            Dim DestinationPath As String = ConfigurationManager.AppSettings("AttachmentsShow")
            Dim fs As System.IO.Stream = flUpConfirmationEva.PostedFile.InputStream
            Dim br As New System.IO.BinaryReader(fs)
            Dim bytes As Byte() = br.ReadBytes(CType(fs.Length, Integer))
            UploadFile(DocFileNameEva, bytes)
            'flUpConfirmationEva.SaveAs(DocFullNameEva)
        Else
            DocFileNameEva = ""
        End If

        ConfirmationEvaluation.ApprovalAttachment = DocFileNameConf
        ConfirmationEvaluation.EvaluationAttachment = DocFileNameEva
        ConfirmationEvaluation.IssuedBy = Session("LoginUserID")

        Dim check As Integer = ConfEvalDataAccess.fnInsertConfEvaluation(ConfirmationEvaluation)
        If check = 1 Then
            MessageBox("Inserted Successfully")
            ClearConfirmationData()
            getConfirmationDoc(lblHolder.Text)
            Response.Redirect("~/EmployeeProfile/frmEmpCareerProgression.aspx")
        Else
            MessageBox("Error Found.")
        End If
    End Sub

    Protected Sub getConfirmationDoc(ByVal ToWhomProShow As String)
        Dim dt As DataTable = ConfEvalDataAccess.fnGetUserDocuments(ToWhomProShow).Tables(0)

        grdConfirmation.DataSource = dt
        grdConfirmation.DataBind()
    End Sub

    Protected Sub ClearConfirmationData()
        txtConfirmationEvaluationSummary.Text = ""
        ddlJoiningDesignation.SelectedIndex = 0
        drpDecisionOfConfirmation.SelectedIndex = 0
        ddlConfirmationDesignation.SelectedIndex = 0
        txtConfirmationEvaluationDate.Text = ""
    End Sub

#End Region

#Region "Contract Renewal"

    Protected Sub ClearContractRenewal()
        txtContractRenewalSummary.Text = ""
        drpRenewalPeriod.SelectedIndex = 0
        txtConRenewalEffectiveDate.Text = ""
    End Sub

    Protected Sub btnConRenewalInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnConRenewalInsert.Click
        Dim folder As String = ""
        Dim DocExt As String = ""
        Dim DocFullNameApp As String = ""
        Dim FileSize As Integer = 0
        Dim DocFileNameApp As String = ""
        Dim DocFullNameEva As String = ""
        Dim DocFileNameEva As String = ""

        Dim ContractRenewal As New clsContractRenewal()

        ContractRenewal.EmployeeID = lblHolder.Text
        ContractRenewal.RenewalSummary = txtContractRenewalSummary.Text
        ContractRenewal.RenewalPeriod = drpRenewalPeriod.SelectedValue

        If txtConRenewalEffectiveDate.Text = "" Then
            ContractRenewal.EffectiveDate = "1/1/1900"
        Else
            ContractRenewal.EffectiveDate = txtConRenewalEffectiveDate.Text
        End If

        If flUpAppConRen.HasFile Then
            folder = Server.MapPath("~/Attachments/")

            FileSize = flUpAppConRen.PostedFile.ContentLength()
            If FileSize > 512000 Then
                MessageBox("File size should be within 500KB")
                Exit Sub
            End If

            DocExt = System.IO.Path.GetExtension(flUpAppConRen.FileName)
            DocFileNameApp = "Con_Ren_App_Doc_" & DateTime.Now.ToString("ddMMyyHHmmss") & DocExt
            DocFullNameApp = folder & DocFileNameApp

            '' Uploading A file stream
            Dim fs As System.IO.Stream = flUpAppConRen.PostedFile.InputStream
            Dim br As New System.IO.BinaryReader(fs)
            Dim bytes As Byte() = br.ReadBytes(CType(fs.Length, Integer))
            UploadFile(DocFileNameApp, bytes)
            'flUpAppConRen.SaveAs(DocFullNameApp)
        Else
            DocFileNameApp = ""
        End If

        If flUpEvaConRen.HasFile Then
            folder = Server.MapPath("~/Attachments/")

            FileSize = flUpEvaConRen.PostedFile.ContentLength()
            If FileSize > 512000 Then
                MessageBox("File size should be within 500KB")
                Exit Sub
            End If

            DocExt = System.IO.Path.GetExtension(flUpEvaConRen.FileName)
            DocFileNameEva = "Conf_Ran_Eva_Doc_" & DateTime.Now.ToString("ddMMyyHHmmss") & DocExt
            DocFullNameEva = folder & DocFileNameEva

            '' Uploading A file stream
            Dim fs As System.IO.Stream = flUpEvaConRen.PostedFile.InputStream
            Dim br As New System.IO.BinaryReader(fs)
            Dim bytes As Byte() = br.ReadBytes(CType(fs.Length, Integer))
            UploadFile(DocFileNameEva, bytes)
            'flUpEvaConRen.SaveAs(DocFullNameEva)
        Else
            DocFileNameEva = ""
        End If

        ContractRenewal.ApprovalAttachment = DocFileNameApp
        ContractRenewal.EvaluationAttachment = DocFileNameEva
        ContractRenewal.IssuedBy = Session("LoginUserID")

        Dim check As Integer = ContractRenewalDataAccess.fnInsertContractRenewal(ContractRenewal)
        If check = 1 Then
            MessageBox("Inserted Successfully")
            ClearContractRenewal()
            getContractRenewalData(lblHolder.Text)
            Response.Redirect("~/EmployeeProfile/frmEmpCareerProgression.aspx")
        Else
            MessageBox("Error Found.")
        End If
    End Sub

    Protected Sub getContractRenewalData(ByVal ToWhomProShow As String)
        Dim dt As DataTable = ContractRenewalDataAccess.fnGetContractRenewalData(ToWhomProShow).Tables(0)

        grdContractRenewal.DataSource = dt
        grdContractRenewal.DataBind()
    End Sub

#End Region

#Region "Promotion History"
    Protected Sub ClearPromotionHistory()
        txtPromotionEvaluationSummary.Text = ""
        ddlPromotedDesignation.SelectedIndex = 0
        txtPromotionEffectiveDate.Text = ""
    End Sub

    Protected Sub btnPromoitonInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPromoitonInsert.Click
        Dim folder As String = ""
        Dim DocExt As String = ""
        Dim DocFullNameApp As String = ""
        Dim FileSize As Integer = 0
        Dim DocFileNameApp As String = ""

        Dim PromotionHistory As New clsPromotionHistory()

        PromotionHistory.EmployeeID = lblHolder.Text
        PromotionHistory.EvaluationSummary = txtPromotionEvaluationSummary.Text
        PromotionHistory.OldDesignation = ddlEarlierDesignation.SelectedValue
        PromotionHistory.NewDesignation = ddlPromotedDesignation.SelectedValue

        If ddlPromotedDesignation.SelectedItem.Text = "" Then
            MessageBox("Please Select Promoted Designation")
            Exit Sub
        End If

        If txtPromotionEffectiveDate.Text = "" Then
            PromotionHistory.EffectiveDate = "1/1/1900"
        Else
            PromotionHistory.EffectiveDate = txtPromotionEffectiveDate.Text
        End If

        If flUpPromotion.HasFile Then
            folder = Server.MapPath("~/Attachments/")

            FileSize = flUpPromotion.PostedFile.ContentLength()
            If FileSize > 512000 Then
                MessageBox("File size should be within 500KB")
                Exit Sub
            End If

            DocExt = System.IO.Path.GetExtension(flUpPromotion.FileName)
            DocFileNameApp = "Con_Ren_App_Doc_" & DateTime.Now.ToString("ddMMyyHHmmss") & DocExt
            DocFullNameApp = folder & DocFileNameApp

            '' Uploading A file stream
            Dim fs As System.IO.Stream = flUpPromotion.PostedFile.InputStream
            Dim br As New System.IO.BinaryReader(fs)
            Dim bytes As Byte() = br.ReadBytes(CType(fs.Length, Integer))
            UploadFile(DocFileNameApp, bytes)

            'flUpPromotion.SaveAs(DocFullNameApp)
        Else
            DocFileNameApp = ""
        End If


        PromotionHistory.ApprovalAttachment = DocFileNameApp
        PromotionHistory.IssuedBy = Session("LoginUserID")

        Dim check As Integer = PromotionHistoryData.fnInsertPromotionHistory(PromotionHistory)
        If check = 1 Then
            MessageBox("Inserted Successfully")
            ClearPromotionHistory()
            getPromotionHistoryData(lblHolder.Text)
            Response.Redirect("~/EmployeeProfile/frmEmpCareerProgression.aspx")
        Else
            MessageBox("Error Found.")
        End If
    End Sub

    Protected Sub getPromotionHistoryData(ByVal ToWhomProShow As String)
        Dim dt As DataTable = PromotionHistoryData.fnGetPromotionHistory(ToWhomProShow).Tables(0)

        grdPromotionHis.DataSource = dt
        grdPromotionHis.DataBind()
    End Sub
#End Region

#Region "Department Transfer"
    Protected Sub ClearDepartment()
        drpTrnsOfDeptNewDept.SelectedIndex = 0
        drpTrnsOfDeptNewSupervisor.SelectedIndex = 0
        txtDeptTransEffectiveDate.Text = ""
    End Sub

    Protected Sub btnDepartmentInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDepartmentInsert.Click
        Dim DeptTransfer As New clsDeptTransfer()

        DeptTransfer.EmployeeID = lblHolder.Text
        DeptTransfer.OldDepartment = drpTrnsOfDeptCurrentDept.SelectedValue
        DeptTransfer.PrevSupervisor = drpTrnsOfDeptCurrentSupervisor.SelectedValue
        DeptTransfer.NewDepartment = drpTrnsOfDeptNewDept.SelectedValue
        DeptTransfer.NewSupervisor = drpTrnsOfDeptNewSupervisor.SelectedValue

        If drpTrnsOfDeptNewDept.SelectedItem.Text = "" Then
            MessageBox("Please Select New Department")
            Exit Sub
        End If

        If drpTrnsOfDeptNewSupervisor.SelectedItem.Text = "" Then
            MessageBox("Please Select New Supervisor")
            Exit Sub
        End If

        If txtDeptTransEffectiveDate.Text = "" Then
            DeptTransfer.EffectiveDate = "1/1/1900"
        Else
            DeptTransfer.EffectiveDate = txtDeptTransEffectiveDate.Text
        End If

        DeptTransfer.IssuedBy = Session("LoginUserID")

        Dim check As Integer = DeptTransferData.fnInsertDeptTransfer(DeptTransfer)
        If check = 1 Then
            MessageBox("Inserted Successfully")
            ClearDepartment()
            getDepartmentTransferData(lblHolder.Text)
            Response.Redirect("~/EmployeeProfile/frmEmpCareerProgression.aspx")
        Else
            MessageBox("Error Found.")
        End If
    End Sub

    Protected Sub getDepartmentTransferData(ByVal ToWhomProShow As String)
        Dim dt As DataTable = DeptTransferData.fnGetDepartmentTransferData(ToWhomProShow).Tables(0)

        grdDeptTransfer.DataSource = dt
        grdDeptTransfer.DataBind()
    End Sub
#End Region

#Region "Location Transfer"
    Protected Sub ClearLocationTransfer()
        drpTrnsLocationNewBranch.SelectedIndex = 0
        txtTrnsLocationEffectiveDate.Text = ""
        drpTrnsOfLocNewSupervisor.SelectedIndex = 0
    End Sub

    Protected Sub btnLocationTransfer_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLocationTransfer.Click
        Dim BranchTransfer As New clsBranchTransfer()

        BranchTransfer.EmployeeID = lblHolder.Text
        BranchTransfer.OldBranchID = drpTrnsLocationCurrentBranch.SelectedValue
        BranchTransfer.NewBranchID = drpTrnsLocationNewBranch.SelectedValue
        BranchTransfer.PrevSupervisor = drpTrnsOfLocCurrentSupervisor.SelectedValue
        BranchTransfer.NewSupervisor = drpTrnsOfLocNewSupervisor.SelectedValue

        If drpTrnsLocationNewBranch.SelectedItem.Text = "" Then
            MessageBox("Please Select New Branch")
            Exit Sub
        End If

        If drpTrnsOfLocNewSupervisor.SelectedItem.Text = "" Then
            MessageBox("Please Select New Supervisor")
            Exit Sub
        End If

        If txtTrnsLocationEffectiveDate.Text = "" Then
            BranchTransfer.EffectiveDate = "1/1/1900"
        Else
            BranchTransfer.EffectiveDate = txtTrnsLocationEffectiveDate.Text
        End If

        BranchTransfer.IssuedBy = Session("LoginUserID")

        Dim check As Integer = BranchTransferData.fnInsertBranchTransfer(BranchTransfer)
        If check = 1 Then
            MessageBox("Inserted Successfully")
            ClearLocationTransfer()
            getLocationTransferData(lblHolder.Text)
            Response.Redirect("~/EmployeeProfile/frmEmpCareerProgression.aspx")
        Else
            MessageBox("Error Found.")
        End If
    End Sub

    Protected Sub getLocationTransferData(ByVal ToWhomProShow As String)
        Dim dt As DataTable = BranchTransferData.fnGetLocationTransferData(ToWhomProShow).Tables(0)

        grdLocationTransfer.DataSource = dt
        grdLocationTransfer.DataBind()
    End Sub
#End Region

#Region "Functional Desig"
    Protected Sub btnSubmitfuncDesig_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmitfuncDesig.Click
        Dim folder As String = ""
        Dim DocExt As String = ""
        Dim DocFullNameApp As String = ""
        Dim FileSize As Integer = 0
        Dim DocFileNameApp As String = ""

        Dim FunctionalDesig As New clsFunctionalDesigHist()

        FunctionalDesig.EmployeeID = lblHolder.Text
        FunctionalDesig.Remarks = txtFunctionalEvaSum.Text
        FunctionalDesig.OldFuncDesigID = ddlEarFuncDesig.SelectedValue
        FunctionalDesig.NewFuncDesigID = ddlNewFuncDesig.SelectedValue


        If txtFuncDesigEffectiveDate.Text = "" Then
            FunctionalDesig.EffectiveDate = "1/1/1900"
        Else
            FunctionalDesig.EffectiveDate = txtFuncDesigEffectiveDate.Text
        End If

        If flUpFuncDesig.HasFile Then
            folder = Server.MapPath("~/Attachments/")

            FileSize = flUpFuncDesig.PostedFile.ContentLength()
            If FileSize > 512000 Then
                MessageBox("File size should be within 500KB")
                Exit Sub
            End If

            DocExt = System.IO.Path.GetExtension(flUpFuncDesig.FileName)
            DocFileNameApp = "Func_Desig_Hist_Doc_" & DateTime.Now.ToString("ddMMyyHHmmss") & DocExt
            DocFullNameApp = folder & DocFileNameApp
            flUpFuncDesig.SaveAs(DocFullNameApp)
        Else
            DocFileNameApp = ""
        End If


        FunctionalDesig.ApprovalAttachment = DocFileNameApp
        FunctionalDesig.IssuedBy = Session("LoginUserID")

        Dim check As Integer = FunctionalDesigData.fnInsertFunctionalDesigHistory(FunctionalDesig)
        If check = 1 Then
            MessageBox("Inserted Successfully")
            ClearfuncDesig()
            getFuncDesigData(lblHolder.Text)
            Response.Redirect("~/EmployeeProfile/frmEmpCareerProgression.aspx")
        Else
            MessageBox("Error Found.")
        End If
    End Sub

    Protected Sub ClearfuncDesig()
        ddlEarFuncDesig.SelectedIndex = 0
        ddlNewFuncDesig.SelectedIndex = 0
        txtFuncDesigEffectiveDate.Text = ""
        txtFunctionalEvaSum.Text = ""
    End Sub

    Protected Sub getFuncDesigData(ByVal ToWhomProShow As String)
        Dim dt As DataTable = FunctionalDesigData.fnGettFunctionalDesigData(ToWhomProShow).Tables(0)

        grdFuncDesig.DataSource = dt
        grdFuncDesig.DataBind()
    End Sub
#End Region

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub ShowDesignationOfficial()
        ddlJoiningDesignation.DataTextField = "DesignationName"
        ddlJoiningDesignation.DataValueField = "DesignationID"
        ddlJoiningDesignation.DataSource = EmployeeInfoData.fnGetOfficialDesignation()
        ddlJoiningDesignation.DataBind()

        ddlConfirmationDesignation.DataTextField = "DesignationName"
        ddlConfirmationDesignation.DataValueField = "DesignationID"
        ddlConfirmationDesignation.DataSource = EmployeeInfoData.fnGetOfficialDesignation()
        ddlConfirmationDesignation.DataBind()

        ddlEarlierDesignation.DataTextField = "DesignationName"
        ddlEarlierDesignation.DataValueField = "DesignationID"
        ddlEarlierDesignation.DataSource = EmployeeInfoData.fnGetOfficialDesignation()
        ddlEarlierDesignation.DataBind()
    End Sub

    Protected Sub getPromotedDesignation(ByVal EmployeeID As String)
        ddlPromotedDesignation.DataTextField = "DesignationName"
        ddlPromotedDesignation.DataValueField = "DesignationID"
        ddlPromotedDesignation.DataSource = EmployeeData.fnGetDesigForPromotion(EmployeeID)
        ddlPromotedDesignation.DataBind()
    End Sub

    Protected Sub getDepartmentName()
        drpTrnsOfDeptCurrentDept.DataTextField = "DeptName"
        drpTrnsOfDeptCurrentDept.DataValueField = "DepartmentID"
        drpTrnsOfDeptCurrentDept.DataSource = DeptData.fnGetDeptList()
        drpTrnsOfDeptCurrentDept.DataBind()

        drpTrnsOfDeptNewDept.DataTextField = "DeptName"
        drpTrnsOfDeptNewDept.DataValueField = "DepartmentID"
        drpTrnsOfDeptNewDept.DataSource = DeptData.fnGetDeptList()
        drpTrnsOfDeptNewDept.DataBind()
    End Sub

    Protected Sub getSupervisorList()
        drpTrnsOfDeptCurrentSupervisor.DataTextField = "EmployeeName"
        drpTrnsOfDeptCurrentSupervisor.DataValueField = "EmployeeID"
        drpTrnsOfDeptCurrentSupervisor.DataSource = EmployeeInfoData.fnGetEmployeeList()
        drpTrnsOfDeptCurrentSupervisor.DataBind()

        drpTrnsOfDeptNewSupervisor.DataTextField = "EmployeeName"
        drpTrnsOfDeptNewSupervisor.DataValueField = "EmployeeID"
        drpTrnsOfDeptNewSupervisor.DataSource = EmployeeInfoData.fnGetEmployeeList()
        drpTrnsOfDeptNewSupervisor.DataBind()

        drpTrnsOfLocCurrentSupervisor.DataTextField = "EmployeeName"
        drpTrnsOfLocCurrentSupervisor.DataValueField = "EmployeeID"
        drpTrnsOfLocCurrentSupervisor.DataSource = EmployeeInfoData.fnGetEmployeeList()
        drpTrnsOfLocCurrentSupervisor.DataBind()

        drpTrnsOfLocNewSupervisor.DataTextField = "EmployeeName"
        drpTrnsOfLocNewSupervisor.DataValueField = "EmployeeID"
        drpTrnsOfLocNewSupervisor.DataSource = EmployeeInfoData.fnGetEmployeeList()
        drpTrnsOfLocNewSupervisor.DataBind()


        drpSupervisorChngCurrentSupervisor.DataTextField = "EmployeeName"
        drpSupervisorChngCurrentSupervisor.DataValueField = "EmployeeID"
        drpSupervisorChngCurrentSupervisor.DataSource = EmployeeInfoData.fnGetEmployeeList()
        drpSupervisorChngCurrentSupervisor.DataBind()

        drpSupervisorchngNewSupervisor.DataTextField = "EmployeeName"
        drpSupervisorchngNewSupervisor.DataValueField = "EmployeeID"
        drpSupervisorchngNewSupervisor.DataSource = EmployeeInfoData.fnGetEmployeeList()
        drpSupervisorchngNewSupervisor.DataBind()

    End Sub

    Protected Sub ShowULCBranch()
        drpTrnsLocationCurrentBranch.DataTextField = "ULCBranchName"
        drpTrnsLocationCurrentBranch.DataValueField = "ULCBranchID"
        drpTrnsLocationCurrentBranch.DataSource = EmployeeInfoData.fnGetULCBranch()
        drpTrnsLocationCurrentBranch.DataBind()

        drpTrnsLocationNewBranch.DataTextField = "ULCBranchName"
        drpTrnsLocationNewBranch.DataValueField = "ULCBranchID"
        drpTrnsLocationNewBranch.DataSource = EmployeeInfoData.fnGetULCBranch()
        drpTrnsLocationNewBranch.DataBind()
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

    Protected Sub ShowDesignationFunc()
        ddlEarFuncDesig.DataTextField = "DesignationName"
        ddlEarFuncDesig.DataValueField = "DesignationID"
        ddlEarFuncDesig.DataSource = EmployeeInfoData.fnGetFunctionalDesignation()
        ddlEarFuncDesig.DataBind()

        ddlNewFuncDesig.DataTextField = "DesignationName"
        ddlNewFuncDesig.DataValueField = "DesignationID"
        ddlNewFuncDesig.DataSource = EmployeeInfoData.fnGetFunctionalDesignation()
        ddlNewFuncDesig.DataBind()
    End Sub

    Protected Sub btnChangeSupervisor_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnChangeSupervisor.Click
        Dim SupervisorChange As New clsSupervisorChange()

        SupervisorChange.EmployeeID = lblHolder.Text
        SupervisorChange.PrevSupervisor = drpSupervisorChngCurrentSupervisor.SelectedValue
        SupervisorChange.NewSupervisor = drpSupervisorchngNewSupervisor.SelectedValue

        If drpSupervisorchngNewSupervisor.SelectedItem.Text = "" Then
            MessageBox("Please Select New Supervisor")
            Exit Sub
        End If

        If txtSuperVisorChngEffectiveDate.Text = "" Then
            SupervisorChange.EffectiveDate = "1/1/1900"
        Else
            SupervisorChange.EffectiveDate = txtSuperVisorChngEffectiveDate.Text
        End If

        SupervisorChange.IssuedBy = Session("LoginUserID")

        Dim check As Integer = SupervisorChngData.fnInsertSupervisorChangeHistory(SupervisorChange)
        If check = 1 Then
            MessageBox("Supervisor Changed Successfully")
            ClearSupervisorChange()
            getSupervisorChngData(lblHolder.Text)
            Response.Redirect("~/EmployeeProfile/frmEmpCareerProgression.aspx")
        Else
            MessageBox("Error Found In Supervisor Change.")
        End If
    End Sub

    Protected Sub ClearSupervisorChange()
        txtSuperVisorChngEffectiveDate.Text = ""
        drpSupervisorchngNewSupervisor.SelectedIndex = 0
    End Sub

    Protected Sub getSupervisorChngData(ByVal ToWhomProShow As String)
        grdSupervisorChngHistory.DataSource = SupervisorChngData.fnShowSupervisorChngHistory(ToWhomProShow)
        grdSupervisorChngHistory.DataBind()
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

End Class
