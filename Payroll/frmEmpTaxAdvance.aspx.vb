
Partial Class Payroll_frmEmpTaxAdvance
    Inherits System.Web.UI.Page

    Dim DeptData As New clsDepartmentDataAccess()
    Dim TaxAdvData As New clsTaxAdvanceDataAccess()
    Dim EmployeeData As New clsEmpBasicProfileDataAccess()
    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()
    Dim TotalEmpCount As Integer = 0

    Protected Sub btnSubmitAdvTax_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmitAdvTax.Click
        Dim TaxAdvance As New clsTaxAdvance()

        If hdFldEmployeeID.Value = "" Then
            MessageBox("Select An Employee First.")
            Exit Sub
        End If

        Try
            TaxAdvance.EmployeeID = hdFldEmployeeID.Value
            TaxAdvance.TaxAdvance = Convert.ToDouble(txtAdvTaxAmount.Text)
            TaxAdvance.IssueDate = Convert.ToDateTime(txtIssueDate.Text)
            TaxAdvance.Remarks = txtAdvTaxRemarks.Text
            TaxAdvance.EntryBy = Session("LoginUserID")

            Dim Check As Integer = TaxAdvData.fnInsertTaxAdvance(TaxAdvance)

            If Check = 1 Then
                MessageBox("Submitted Successfully.")
                ClearTaxAdvanceData()
                GetEmpWiseTaxAdvace(hdFldEmployeeID.Value)
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
       
    End Sub

    Protected Sub ClearTaxAdvanceData()
        txtAdvTaxAmount.Text = ""
        txtIssueDate.Text = ""
        txtAdvTaxRemarks.Text = ""
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowULCBranch()
            ShowDesignationOfficial()
            getBloodGroup()
            geDistrictName()
            ShowDepertment()
        End If
    End Sub

    Protected Sub ShowULCBranch()
        drpULCBranch.DataTextField = "ULCBranchName"
        drpULCBranch.DataValueField = "ULCBranchID"
        drpULCBranch.DataSource = EmployeeInfoData.fnGetULCBranch()
        drpULCBranch.DataBind()
    End Sub

    Protected Sub ShowDesignationOfficial()
        drpSelectDesignation.DataTextField = "DesignationName"
        drpSelectDesignation.DataValueField = "DesignationID"
        drpSelectDesignation.DataSource = EmployeeInfoData.fnGetOfficialDesignation()
        drpSelectDesignation.DataBind()
    End Sub

    Protected Sub getBloodGroup()
        ddlBloodGrp.DataTextField = "BloodGroupName"
        ddlBloodGrp.DataValueField = "BloodGroupID"
        ddlBloodGrp.DataSource = EmployeeData.fnGetBloodGroup()
        ddlBloodGrp.DataBind()

        Dim A As New ListItem()
        A.Text = "N\A"
        A.Value = "N\A"
        ddlBloodGrp.Items.Insert(0, A)

    End Sub

    Protected Sub geDistrictName()
        ddlPerDistrict.DataTextField = "DistrictName"
        ddlPerDistrict.DataValueField = "DistrictID"
        ddlPerDistrict.DataSource = EmployeeData.getDistrictName()
        ddlPerDistrict.DataBind()

        Dim A As New ListItem()
        A.Text = "N\A"
        A.Value = "0"
        ddlPerDistrict.Items.Insert(0, A)

    End Sub

    Protected Sub ShowDepertment()
        drpSelectDepartment.DataTextField = "DeptName"
        drpSelectDepartment.DataValueField = "DepartmentID"
        drpSelectDepartment.DataSource = DeptData.fnGetDeptList()
        drpSelectDepartment.DataBind()
    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        Dim OrgSrchStr As New clsSearchOrgStructure()

        Try
            OrgSrchStr.EmpIDOrName = txtEmpIDOrName.Text
            OrgSrchStr.EmployeeTypeID = drpEmployeeType.SelectedValue

            If drpSelectDesignation.SelectedIndex = 0 Then
                OrgSrchStr.DesignationID = "N\A"
            Else
                OrgSrchStr.DesignationID = drpSelectDesignation.SelectedValue
            End If

            If drpSelectDepartment.SelectedIndex = 0 Then
                OrgSrchStr.DepartmentID = "N\A"
            Else
                OrgSrchStr.DepartmentID = drpSelectDepartment.SelectedValue
            End If

            If drpULCBranch.SelectedIndex = 0 Then
                OrgSrchStr.ULCBranchID = "N\A"
            Else
                OrgSrchStr.ULCBranchID = drpULCBranch.SelectedValue
            End If

            OrgSrchStr.IsActive = drpEmployeeStatus.SelectedValue
            If rdbtnGender.SelectedIndex = -1 Then
                OrgSrchStr.Gender = "N\A"
            Else
                OrgSrchStr.Gender = rdbtnGender.SelectedValue
            End If

            OrgSrchStr.BloodGroupID = ddlBloodGrp.SelectedValue
            OrgSrchStr.PerDistrict = Convert.ToInt32(ddlPerDistrict.SelectedValue)

            grdEmployeeList.DataSource = EmployeeInfoData.fnSearchEmployeeForEdit(OrgSrchStr)
            grdEmployeeList.DataBind()

            grdEmployeeList.SelectedIndex = -1

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

    End Sub

    Protected Sub grdEmployeeList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdEmployeeList.SelectedIndexChanged
        Dim lblEmployeeID As New Label
        Dim EmpInfoData As New clsEmployeeInfoDataAccess()
        Dim EmpInfo As New clsEmployeeInfo()

        lblEmployeeID = grdEmployeeList.SelectedRow.FindControl("lblEmployeeID")
        hdFldEmployeeID.Value = lblEmployeeID.Text

        GetEmpWiseTaxAdvace(hdFldEmployeeID.Value)

    End Sub

    Protected Sub GetEmpWiseTaxAdvace(ByVal EmployeeID As String)
        grdAdvanceTax.DataSource = TaxAdvData.fnGetTaxAdvByEmpID(EmployeeID)
        grdAdvanceTax.DataBind()
    End Sub

    Protected Sub grdEmployeeList_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdEmployeeList.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            TotalEmpCount += 1
        End If

        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(0).Text = "Total:"
            e.Row.Cells(2).Text = TotalEmpCount.ToString()
        End If
    End Sub

    Protected Sub btnCancelTaxAdvance_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelTaxAdvance.Click
        ClearTaxAdvanceData()
    End Sub

End Class
