Imports System.Net
Imports System.IO

Partial Class EmployeeProfile_frmPFContribution
    Inherits System.Web.UI.Page

    Dim PFData As New clsProvidentFundDataAccess()
    Dim EmployeeData As New clsEmpBasicProfileDataAccess()
    Dim SumOfEmpContribution, SumOfEmpCreditedInt, SumOfCmpContribution, SumOfCmpCreditedInt As Double

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim LoginUserId As String = Session("UniqueUserID")
            Dim ToWhomProShow As String = Session("ToWhomProShow")
            getBasicProfileInfo(ToWhomProShow)

            ShowPFInfo(LoginUserId)
        End If
    End Sub

    Protected Sub ShowPFInfo(ByVal EmployeeID As String)
        grdPFDetails.DataSource = PFData.fnGetPFInfoByEmpID(EmployeeID)
        grdPFDetails.DataBind()
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

    Protected Sub grdPFDetails_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdPFDetails.RowDataBound
        Dim lblEmpContribution, lblCreditedIntEmp, lblComContribution, lblCreditedIntCom As New Label

        If e.Row.RowType = DataControlRowType.DataRow Then
            lblEmpContribution = e.Row.FindControl("lblEmpContribution")
            lblCreditedIntEmp = e.Row.FindControl("lblCreditedIntEmp")
            lblComContribution = e.Row.FindControl("lblComContribution")
            lblCreditedIntCom = e.Row.FindControl("lblCreditedIntCom")

            SumOfEmpContribution += Convert.ToDouble(lblEmpContribution.Text)
            SumOfEmpCreditedInt += Convert.ToDouble(lblCreditedIntEmp.Text)
            SumOfCmpContribution += Convert.ToDouble(lblComContribution.Text)
            SumOfCmpCreditedInt += Convert.ToDouble(lblCreditedIntCom.Text)

        End If

        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(3).Text = SumOfEmpContribution.ToString("#,##0.##")
            e.Row.Cells(4).Text = SumOfEmpCreditedInt.ToString("#,##0.##")
            e.Row.Cells(5).Text = SumOfCmpContribution.ToString("#,##0.##")
            e.Row.Cells(6).Text = SumOfCmpCreditedInt.ToString("#,##0.##")
        End If

    End Sub

End Class
