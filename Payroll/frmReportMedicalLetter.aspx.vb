Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Partial Class Payroll_frmReportMedicalLetter
    Inherits System.Web.UI.Page

    Dim DeptData As New clsDepartmentDataAccess()
    Dim EmployeeData As New clsEmpBasicProfileDataAccess()
    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()
    Dim MedicalOffData As New clsMedOfficerDataAccess()
    Dim TotalEmpCount As Integer = 0

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


    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowULCBranch()
            ShowDesignationOfficial()
            getBloodGroup()
            geDistrictName()
            ShowDepertment()
            ShowMedicalOffList()
        End If
    End Sub

    Protected Sub ShowMedicalOffList()
        drpMedOffList.DataTextField = "MedOfficerName"
        drpMedOffList.DataValueField = "MedOffID"
        drpMedOffList.DataSource = MedicalOffData.fnShowActiveMedicalOffList()
        drpMedOffList.DataBind()
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

    Protected Sub grdEmployeeList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdEmployeeList.SelectedIndexChanged
        Dim lblEmployeeID As New Label
        Dim EmpInfoData As New clsEmployeeInfoDataAccess()
        Dim EmpInfo As New clsEmployeeInfo()

        lblEmployeeID = grdEmployeeList.SelectedRow.FindControl("lblEmployeeID")
        hdFldEmployeeID.Value = lblEmployeeID.Text
    End Sub

    Protected Sub btnProcessMedToEmp_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcessMedToEmp.Click
        If hdFldEmployeeID.Value = "" Then
            MessageBox("Select An Employee First.")
            Exit Sub
        End If

        If Trim(txtReferenceNo.Text) = "" Then
            MessageBox("Reference No. Requied.")
            Exit Sub
        End If

        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String

        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]

        Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionString").ConnectionString
        Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

        Try
            f = "~/Payroll/Report/"
            folder = Server.MapPath(f)
            repName = folder & "rptMedExamLetterToEmp.rpt"
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
            myReport.SetParameterValue("@EmployeeID", hdFldEmployeeID.Value)
            myReport.SetParameterValue("@RefNo", txtReferenceNo.Text)
            myReport.SetParameterValue("@AppointmentRefNo", txtAppointmentRefNo.Text)
            myReport.SetParameterValue("@MedOffID", drpMedOffList.SelectedValue)
            myReport.SetParameterValue("@AppointmentDate", txtAppointmentDate.Text)
            myReport.ExportToHttpResponse(ExportFormatType.WordForWindows, Response, True, "ExportedReport")
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub btnProcessMedToDoc_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcessMedToDoc.Click
        If hdFldEmployeeID.Value = "" Then
            MessageBox("Select An Employee First.")
            Exit Sub
        End If

        If Trim(txtReferenceNo.Text) = "" Then
            MessageBox("Reference No. Requied.")
            Exit Sub
        End If

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
            repName = folder & "rptMedExamLetterToDoc.rpt"
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
            myReport.SetParameterValue("@EmployeeID", hdFldEmployeeID.Value)
            myReport.SetParameterValue("@RefNo", txtReferenceNo.Text)
            myReport.SetParameterValue("@AppointmentRefNo", txtAppointmentRefNo.Text)
            myReport.SetParameterValue("@MedOffID", drpMedOffList.SelectedValue)
            myReport.SetParameterValue("@AppointmentDate", txtAppointmentDate.Text)
            myReport.ExportToHttpResponse(ExportFormatType.WordForWindows, Response, True, "ExportedReport")
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub
End Class
