
Partial Class Payroll_frmDisparityCalculation
    Inherits System.Web.UI.Page

    Dim EmployeeData As New clsEmpBasicProfileDataAccess()
    Dim DeptData As New clsDepartmentDataAccess()
    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()

    Protected Sub btnShowReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnShowReport.Click
        Try
            Dim EmpInfo As New clsEmployeeInfo()
            EmpInfo.OfficialDesignationID = drpSelectDesignation.SelectedValue
            EmpInfo.DepartmentID = drpSelectDepartment.SelectedValue
            EmpInfo.ULCBranchID = drpULCBranch.SelectedValue

            grdDisparity.DataSource = EmployeeInfoData.fnDisparityCalculation(EmpInfo)
            grdDisparity.DataBind()
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowDepertment()
            ShowULCBranch()
            ShowDesignationOfficial()
        End If
    End Sub

    Protected Sub ShowDepertment()
        drpSelectDepartment.DataTextField = "DeptName"
        drpSelectDepartment.DataValueField = "DepartmentID"
        drpSelectDepartment.DataSource = DeptData.fnGetDeptList()
        drpSelectDepartment.DataBind()

        Dim A As New ListItem
        A.Text = "N\A"
        A.Value = "N\A"
        drpSelectDepartment.Items.Insert(0, A)
    End Sub

    Protected Sub ShowULCBranch()
        drpULCBranch.DataTextField = "ULCBranchName"
        drpULCBranch.DataValueField = "ULCBranchID"
        drpULCBranch.DataSource = EmployeeInfoData.fnGetULCBranch()
        drpULCBranch.DataBind()

        Dim A As New ListItem
        A.Text = "N\A"
        A.Value = "N\A"
        drpULCBranch.Items.Insert(0, A)
    End Sub

    Protected Sub ShowDesignationOfficial()
        drpSelectDesignation.DataTextField = "DesignationName"
        drpSelectDesignation.DataValueField = "DesignationID"
        drpSelectDesignation.DataSource = EmployeeInfoData.fnGetOfficialDesignation()
        drpSelectDesignation.DataBind()

        Dim A As New ListItem
        A.Text = "N\A"
        A.Value = "N\A"
        drpSelectDesignation.Items.Insert(0, A)
    End Sub

    Protected Sub grdDisparity_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdDisparity.RowDataBound
        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(1).Text = "Total"
            e.Row.Cells(2).Text = grdDisparity.Rows.Count.ToString()
        End If
    End Sub

End Class
