
Partial Class EmployeeInfo_frmEmployeeInfo
    Inherits System.Web.UI.Page

    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()
    Dim DeptData As New clsDepartmentDataAccess()

    Protected Sub btnInsertEmpInfo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertEmpInfo.Click
        Dim EmployeeInfo As New clsEmployeeInfo()

        Dim EntryBy As String

        EntryBy = Session("LoginUserID")
        EmployeeInfo.EmployeeName = txtEmpName.Text
        EmployeeInfo.EmpCode = txtEmpCode.Text
        EmployeeInfo.UserID = txtUserID.Text
        EmployeeInfo.Password = txtPassword.Text
        EmployeeInfo.EmpTypeID = ddlEmpType.SelectedValue

        If EmployeeInfo.EmpTypeID = "-Select-" Then
            MessageBox("Please select employee type")
            Exit Sub
        End If

        If txtDateofBirth.Text = "" Then
            ' EmployeeInfo.DateOfBirth = "1911-01-01"
            MessageBox("Please Give Date of Birth")
            Exit Sub
        Else
            EmployeeInfo.DateOfBirth = txtDateofBirth.Text
        End If

        If txtJoiningDate.Text = "" Then
            'EmployeeInfo.JoiningDate = "1911-01-01"
            MessageBox("Please Give Joining Date")
            Exit Sub
        Else
            EmployeeInfo.JoiningDate = txtJoiningDate.Text
        End If

        If txtConfirmationDate.Text = "" Then
            EmployeeInfo.ConfirmationDate = "1911-01-01"
        Else
            EmployeeInfo.ConfirmationDate = txtConfirmationDate.Text
        End If

        If txtPromotionDate.Text = "" Then
            EmployeeInfo.PromotionDate = "1911-01-01"
        Else
            EmployeeInfo.PromotionDate = txtPromotionDate.Text
        End If

        If txtContractExDate.Text = "" Then
            EmployeeInfo.ContractExpiryDate = "1911-01-01"
        Else
            EmployeeInfo.ContractExpiryDate = txtContractExDate.Text
        End If

        EmployeeInfo.TerminationTypeID = ddlTerminationType.SelectedValue

        If txtContractRenewalDate.Text = "" Then
            EmployeeInfo.ContractRenewalDate = "1911-01-01"
        Else
            EmployeeInfo.ContractRenewalDate = txtContractRenewalDate.Text
        End If

        If txtTerminationDate.Text = "" Then
            EmployeeInfo.TerminationDate = "1911-01-01"
        Else
            EmployeeInfo.TerminationDate = txtTerminationDate.Text
        End If

        EmployeeInfo.JoiningDesignationID = ddlJoiningDesignation.SelectedValue
        If ddlJoiningDesignation.SelectedItem.Text = "" Then
            MessageBox("Please select Joining Designation")
            Exit Sub
        End If
        EmployeeInfo.RemarksOnTermination = txtRemarkTermination.Text
        EmployeeInfo.OfficialDesignationID = ddlOfficialDesignation.SelectedValue

        If ddlOfficialDesignation.SelectedItem.Text = "" Then
            MessageBox("Please select Official Designation")
            Exit Sub
        End If
        EmployeeInfo.DepartmentID = ddlDepartment.SelectedValue
        If ddlDepartment.SelectedItem.Text = "" Then
            MessageBox("Please select Department Name")
            Exit Sub
        End If
        EmployeeInfo.FunctionalDesignationID = ddlFunctionalDesignation.SelectedValue
        EmployeeInfo.ULCBranchID = ddlULCBranch.SelectedValue
        If ddlULCBranch.SelectedItem.Text = "" Then
            MessageBox("Please select Current Branch")
            Exit Sub
        End If
        EmployeeInfo.CurrentSupervisor = ddlCurrentSupervisor.SelectedValue
        EmployeeInfo.JDno = ddlJDNo.SelectedValue
        EmployeeInfo.Status = txtStatus.Text
        EmployeeInfo.BankID = ddlBankName.SelectedValue

        If txtEntryExamScore.Text = "" Then
            EmployeeInfo.EntryExamScore = 0
        Else
            EmployeeInfo.EntryExamScore = txtEntryExamScore.Text
        End If

        EmployeeInfo.BranchID = ddlBranchName.SelectedValue

        If txtPromotionalExamScore.Text = "" Then
            EmployeeInfo.PromotionalExamScore = 0
        Else
            EmployeeInfo.PromotionalExamScore = txtPromotionalExamScore.Text
        End If

        If EmployeeInfo.JDno = "-Select-" Then
            MessageBox("Please select JD No")
            Exit Sub
        End If

        EmployeeInfo.BankAccountNo = txtBankAccNo.Text
        EmployeeInfo.Email = txtEmail.Text
        EmployeeInfo.isActive = chkActive.Checked
        EmployeeInfo.UserType = ddlUserType.SelectedValue

        EmployeeInfo.LeaveApprover = ddlLeaveApprover.SelectedValue
        EmployeeInfo.LeaveRecommender = ddlleaveRecommender.SelectedValue

        If EmployeeInfo.UserType = "-Select-" Then
            MessageBox("Please select User Type")
            Exit Sub
        End If


        Dim check As Integer = EmployeeInfoData.fnInsertTotalGradingSystem(EmployeeInfo, EntryBy)
        If check = 1 Then
            MessageBox("Inserted Successfully")
            ShowEmployeeDetails()
            ShowEmployeeList()
            ClearEmployeeInfo()
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


    Protected Sub btnCancelSelection_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelSelection.Click
        ClearEmployeeInfo()
    End Sub

    Protected Sub ClearEmployeeInfo()
        txtEmpName.Text = ""
        txtEmpCode.Text = ""
        txtUserID.Text = ""
        txtPassword.Text = ""
        ddlEmpType.SelectedIndex = 0
        txtDateofBirth.Text = ""
        txtJoiningDate.Text = ""
        txtConfirmationDate.Text = ""
        txtPromotionDate.Text = ""
        txtContractExDate.Text = ""
        ddlTerminationType.SelectedIndex = 0
        txtContractRenewalDate.Text = ""
        txtTerminationDate.Text = ""
        ddlJoiningDesignation.SelectedIndex = 0
        txtRemarkTermination.Text = ""
        ddlOfficialDesignation.SelectedIndex = 0
        ddlDepartment.SelectedIndex = 0
        ddlFunctionalDesignation.SelectedIndex = 0
        ddlULCBranch.SelectedIndex = 0
        ddlCurrentSupervisor.SelectedIndex = 0
        ddlJDNo.SelectedIndex = -1
        txtStatus.Text = ""
        ddlBankName.SelectedIndex = 0
        txtEntryExamScore.Text = ""
        ddlBranchName.SelectedIndex = 0
        txtPromotionalExamScore.Text = ""
        txtBankAccNo.Text = ""
        chkActive.Checked = False
        ddlUserType.SelectedIndex = 0
        ddlLeaveApprover.SelectedIndex = 0
        ddlleaveRecommender.SelectedIndex = 0
        txtEmail.Text = ""
        btnInsertEmpInfo.Visible = True
        btnUpdateEmpInfo.Visible = False
    End Sub

    Protected Sub ShowEmployeeType()
        ddlEmpType.DataTextField = "EmployeeTypeName"
        ddlEmpType.DataValueField = "EmployeeTypeID"
        ddlEmpType.DataSource = EmployeeInfoData.fnGetEmployeeType()
        ddlEmpType.DataBind()
        ddlEmpType.Items.Insert(0, "-Select-")
    End Sub

    Protected Sub ShowTerminationType()
        ddlTerminationType.DataTextField = "TerminationTypeName"
        ddlTerminationType.DataValueField = "TerminationTypeID"
        ddlTerminationType.DataSource = EmployeeInfoData.fnGetTerminationType()
        ddlTerminationType.DataBind()
        'ddlTerminationType.Items.Insert(0, "N\A")
    End Sub

    Protected Sub ShowDesignationOfficial()
        ddlOfficialDesignation.DataTextField = "DesignationName"
        ddlOfficialDesignation.DataValueField = "DesignationID"
        ddlOfficialDesignation.DataSource = EmployeeInfoData.fnGetOfficialDesignation()
        ddlOfficialDesignation.DataBind()
        'ddlOfficialDesignation.Items.Insert(0, "-Select-")

        ddlJoiningDesignation.DataTextField = "DesignationName"
        ddlJoiningDesignation.DataValueField = "DesignationID"
        ddlJoiningDesignation.DataSource = EmployeeInfoData.fnGetOfficialDesignation()
        ddlJoiningDesignation.DataBind()
        'ddlJoiningDesignation.Items.Insert(0, "-Select-")
    End Sub

    Protected Sub ShowDesignationFunc()
        ddlFunctionalDesignation.DataTextField = "DesignationName"
        ddlFunctionalDesignation.DataValueField = "DesignationID"
        ddlFunctionalDesignation.DataSource = EmployeeInfoData.fnGetFunctionalDesignation()
        ddlFunctionalDesignation.DataBind()
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

    Protected Sub ShowEmployeeList()
        ddlCurrentSupervisor.DataTextField = "EmployeeName"
        ddlCurrentSupervisor.DataValueField = "EmployeeID"
        ddlCurrentSupervisor.DataSource = EmployeeInfoData.fnGetEmployeeList()
        ddlCurrentSupervisor.DataBind()

        ddlLeaveApprover.DataTextField = "EmployeeName"
        ddlLeaveApprover.DataValueField = "EmployeeID"
        ddlLeaveApprover.DataSource = EmployeeInfoData.fnGetEmployeeList()
        ddlLeaveApprover.DataBind()

        ddlleaveRecommender.DataTextField = "EmployeeName"
        ddlleaveRecommender.DataValueField = "EmployeeID"
        ddlleaveRecommender.DataSource = EmployeeInfoData.fnGetEmployeeList()
        ddlleaveRecommender.DataBind()
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then

            btnInsertEmpInfo.Visible = True
            btnUpdateEmpInfo.Visible = False

            ShowEmployeeType()
            ShowTerminationType()
            ShowDesignationOfficial()
            ShowDesignationFunc()
            ShowDepertment()
            ShowULCBranch()
            ShowEmployeeList()
            ShowBankName()
            ShowJDNo()

            ShowEmployeeDetails()

        End If
    End Sub

    Protected Sub ShowEmployeeDetails()
        grdEmployeeName.DataSource = EmployeeInfoData.fnGetEmployeeDetailInfo()
        grdEmployeeName.DataBind()
    End Sub

    Protected Sub ddlBankName_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlBankName.SelectedIndexChanged
        Dim BankID As String
        BankID = ddlBankName.SelectedValue
        ShowBranchName(BankID)
    End Sub

    Protected Sub grdEmployeeName_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdEmployeeName.SelectedIndexChanged

        Dim lblEmployeeID As New System.Web.UI.WebControls.Label()
        Dim EmployeeID As String
        lblEmployeeID = grdEmployeeName.SelectedRow.FindControl("lblEmployeeID")

        EmployeeID = Convert.ToString(lblEmployeeID.Text)
        Dim EmployeeInfo As New clsEmployeeInfo()

        EmployeeInfo = EmployeeInfoData.fnGetEmpInformationByID(EmployeeID)

        txtEmpName.Text = EmployeeInfo.EmployeeName
        txtEmpCode.Text = EmployeeInfo.EmpCode
        txtUserID.Text = EmployeeInfo.UserID
        txtPassword.Text = EmployeeInfo.Password
        ddlEmpType.SelectedValue = EmployeeInfo.EmpTypeID
        txtDateofBirth.Text = EmployeeInfo.DateOfBirth

        If EmployeeInfo.JoiningDate = "1/1/1911" Then
            txtJoiningDate.Text = ""
        Else
            txtJoiningDate.Text = EmployeeInfo.JoiningDate
        End If


        If EmployeeInfo.ConfirmationDate = "1/1/1911" Then
            txtConfirmationDate.Text = ""
        Else
            txtConfirmationDate.Text = EmployeeInfo.ConfirmationDate
        End If

        If EmployeeInfo.PromotionDate = "1/1/1911" Then
            txtPromotionDate.Text = ""
        Else
            txtPromotionDate.Text = EmployeeInfo.PromotionDate
        End If
        If EmployeeInfo.ContractExpiryDate = "1/1/1911" Then
            txtContractExDate.Text = ""
        Else
            txtContractExDate.Text = EmployeeInfo.ContractExpiryDate
        End If

        ddlTerminationType.SelectedValue = EmployeeInfo.TerminationTypeID
        If EmployeeInfo.ContractRenewalDate = "1/1/1911" Then
            txtContractRenewalDate.Text = ""
        Else
            txtContractRenewalDate.Text = EmployeeInfo.ContractRenewalDate
        End If

        If EmployeeInfo.TerminationDate = "1/1/1911" Then
            txtTerminationDate.Text = ""
        Else
            txtTerminationDate.Text = EmployeeInfo.TerminationDate
        End If

        ddlJoiningDesignation.SelectedValue = EmployeeInfo.JoiningDesignationID
        txtRemarkTermination.Text = EmployeeInfo.RemarksOnTermination
        ddlOfficialDesignation.SelectedValue = EmployeeInfo.OfficialDesignationID
        ddlDepartment.SelectedValue = EmployeeInfo.DepartmentID
        ddlFunctionalDesignation.SelectedValue = EmployeeInfo.FunctionalDesignationID
        ddlULCBranch.SelectedValue = EmployeeInfo.ULCBranchID
        ddlCurrentSupervisor.SelectedValue = EmployeeInfo.CurrentSupervisor
        ddlJDNo.SelectedValue = EmployeeInfo.JDno
        txtStatus.Text = EmployeeInfo.Status
        ddlBankName.SelectedValue = EmployeeInfo.BankID
        txtEntryExamScore.Text = EmployeeInfo.EntryExamScore
        ddlBranchName.SelectedValue = EmployeeInfo.BranchID
        txtPromotionalExamScore.Text = EmployeeInfo.PromotionalExamScore
        txtBankAccNo.Text = EmployeeInfo.BankAccountNo
        chkActive.Checked = EmployeeInfo.isActive
        ddlUserType.SelectedValue = EmployeeInfo.UserType
        ddlLeaveApprover.SelectedValue = EmployeeInfo.LeaveApprover
        ddlleaveRecommender.SelectedValue = EmployeeInfo.LeaveRecommender
        txtEmail.Text = EmployeeInfo.Email

        btnInsertEmpInfo.Visible = False
        btnUpdateEmpInfo.Visible = True


    End Sub

    Protected Sub btnUpdateEmpInfo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateEmpInfo.Click
        Dim EmployeeInfo As New clsEmployeeInfo()

        Dim EntryBy As String = ""
        Dim EmployeeID As String

        Dim lblEmployeeID As New System.Web.UI.WebControls.Label()

        lblEmployeeID = grdEmployeeName.SelectedRow.FindControl("lblEmployeeID")
        EmployeeID = lblEmployeeID.Text

        EmployeeInfo.EmployeeName = txtEmpName.Text
        EmployeeInfo.EmpCode = txtEmpCode.Text
        EmployeeInfo.UserID = txtUserID.Text
        EmployeeInfo.Password = txtPassword.Text
        EmployeeInfo.EmpTypeID = ddlEmpType.SelectedValue

        If EmployeeInfo.EmpTypeID = "-Select-" Then
            MessageBox("Please select employee type")
            Exit Sub
        End If

        If txtDateofBirth.Text = "" Then
            EmployeeInfo.DateOfBirth = "1911-01-01"
        Else
            EmployeeInfo.DateOfBirth = txtDateofBirth.Text
        End If

        If txtJoiningDate.Text = "" Then
            EmployeeInfo.JoiningDate = "1911-01-01"
        Else
            EmployeeInfo.JoiningDate = txtJoiningDate.Text
        End If

        If txtConfirmationDate.Text = "" Then
            EmployeeInfo.ConfirmationDate = "1911-01-01"
        Else
            EmployeeInfo.ConfirmationDate = txtConfirmationDate.Text
        End If

        If txtPromotionDate.Text = "" Then
            EmployeeInfo.PromotionDate = "1911-01-01"
        Else
            EmployeeInfo.PromotionDate = txtPromotionDate.Text
        End If

        If txtContractExDate.Text = "" Then
            EmployeeInfo.ContractExpiryDate = "1911-01-01"
        Else
            EmployeeInfo.ContractExpiryDate = txtContractExDate.Text
        End If

        EmployeeInfo.TerminationTypeID = ddlTerminationType.SelectedValue

        If txtContractRenewalDate.Text = "" Then
            EmployeeInfo.ContractRenewalDate = "1911-01-01"
        Else
            EmployeeInfo.ContractRenewalDate = txtContractRenewalDate.Text
        End If

        If txtTerminationDate.Text = "" Then
            EmployeeInfo.TerminationDate = "1911-01-01"
        Else
            EmployeeInfo.TerminationDate = txtTerminationDate.Text
        End If

        EmployeeInfo.JoiningDesignationID = ddlJoiningDesignation.SelectedValue
        If EmployeeInfo.JoiningDesignationID = "-Select-" Then
            MessageBox("Please select Joining Designation")
            Exit Sub
        End If
        EmployeeInfo.RemarksOnTermination = txtRemarkTermination.Text
        EmployeeInfo.OfficialDesignationID = ddlOfficialDesignation.SelectedValue

        If EmployeeInfo.OfficialDesignationID = "-Select-" Then
            MessageBox("Please select Official Designation")
            Exit Sub
        End If
        EmployeeInfo.DepartmentID = ddlDepartment.SelectedValue
        EmployeeInfo.FunctionalDesignationID = ddlFunctionalDesignation.SelectedValue
        EmployeeInfo.ULCBranchID = ddlULCBranch.SelectedValue
        
        EmployeeInfo.CurrentSupervisor = ddlCurrentSupervisor.SelectedValue
        EmployeeInfo.JDno = ddlJDNo.SelectedValue
        EmployeeInfo.Status = txtStatus.Text
        EmployeeInfo.BankID = ddlBankName.SelectedValue

        If txtEntryExamScore.Text = "" Then
            EmployeeInfo.EntryExamScore = 0
        Else
            EmployeeInfo.EntryExamScore = txtEntryExamScore.Text
        End If

        EmployeeInfo.BranchID = ddlBranchName.SelectedValue

        If txtPromotionalExamScore.Text = "" Then
            EmployeeInfo.PromotionalExamScore = 0
        Else
            EmployeeInfo.PromotionalExamScore = txtPromotionalExamScore.Text
        End If

        If EmployeeInfo.JDno = "-Select-" Then
            MessageBox("Please select JD No")
            Exit Sub
        End If

        EmployeeInfo.BankAccountNo = txtBankAccNo.Text
        EmployeeInfo.Email = txtEmail.Text
        EmployeeInfo.isActive = chkActive.Checked
        EmployeeInfo.UserType = ddlUserType.SelectedValue
        EmployeeInfo.LeaveApprover = ddlLeaveApprover.SelectedValue
        EmployeeInfo.LeaveRecommender = ddlleaveRecommender.SelectedValue

        If EmployeeInfo.UserType = "-Select-" Then
            MessageBox("Please select User Type")
            Exit Sub
        End If

        Dim check As Integer = EmployeeInfoData.fnUpdateTotalGradingSystem(EmployeeInfo, EmployeeID)
        If check = 1 Then
            MessageBox("Updated Successfully")
            ShowEmployeeList()
            ClearEmployeeInfo()
            btnInsertEmpInfo.Visible = True
            btnUpdateEmpInfo.Visible = False
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub ShowJDNo()
        ddlJDNo.DataTextField = "JDName"
        ddlJDNo.DataValueField = "JobDescriptionID"
        ddlJDNo.DataSource = EmployeeInfoData.fnGetJDList()
        ddlJDNo.DataBind()
        ddlJDNo.Items.Insert(0, "-Select-")
    End Sub

End Class
