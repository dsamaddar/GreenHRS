Imports System.Net
Imports System.IO

Partial Class EmployeeProfile_frmSalaryComponentSummary
    Inherits System.Web.UI.Page

    Dim EmployeeData As New clsEmpBasicProfileDataAccess()
    Dim SalaryCompSumData As New clsSalCompSummaryDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Try
                GetSalComponents(Session("UniqueUserID"))
                getBasicProfileInfo(Session("ToWhomProShow"))
            Catch ex As Exception
                MessageBox(ex.Message)
            End Try

        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub GetSalComponents(ByVal EmployeeID As String)
        drpSalaryComponents.DataTextField = "ComponentName"
        drpSalaryComponents.DataValueField = "EmpComponentID"
        drpSalaryComponents.DataSource = SalaryCompSumData.fnListEmpWiseComponent(EmployeeID)
        drpSalaryComponents.DataBind()
    End Sub

    Protected Sub btnProcessReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcessReport.Click
        grdSalSumRpt.DataSource = SalaryCompSumData.fnGetSalarySummaryReporting(Session("UniqueUserID"), drpSalaryComponents.SelectedValue, drpTaxYear.SelectedValue)
        grdSalSumRpt.DataBind()
    End Sub

    Dim SalaryAmount As Double = 0
    Protected Sub grdSalSumRpt_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdSalSumRpt.RowDataBound
        Try
            Dim lblAmount As New Label
            If e.Row.RowType = DataControlRowType.DataRow Then
                lblAmount = e.Row.FindControl("lblAmount")
                SalaryAmount += Convert.ToDouble(lblAmount.Text)
            End If

            If e.Row.RowType = DataControlRowType.Footer Then
                e.Row.Cells(1).Text = "Total : "
                e.Row.Cells(2).Text = Math.Round(SalaryAmount, 2).ToString("#,##0.00")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
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

End Class
