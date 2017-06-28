Imports System
Imports System.Data
Imports System.Net.Mail
Imports System.Net
Imports System.IO

Partial Class EmployeeProfile_frmApplyForApprovedLeaveRejection
    Inherits System.Web.UI.Page

    Dim LeaveData As New clsLeaveRequestDataAccess()
    Dim EmployeeData As New clsEmpBasicProfileDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim EmployeeToView As String
            EmployeeToView = Session("ToWhomProShow")
            GetApprovedLeave()
            getBasicProfileInfo(EmployeeToView)

            btnLeaveRejectionRequest.Enabled = False
        End If
    End Sub

    Protected Sub GetApprovedLeave()
        Dim LoginUserID As String
        LoginUserID = Session("UniqueUserID")

        grdApprovedLeave.DataSource = LeaveData.fnGetApprovedLeaveListForRejection(LoginUserID)
        grdApprovedLeave.DataBind()
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

    Protected Sub grdApprovedLeave_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdApprovedLeave.SelectedIndexChanged
        btnLeaveRejectionRequest.Enabled = True
    End Sub

    Protected Sub btnLeaveRejectionRequest_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLeaveRejectionRequest.Click

        Dim lblLeaveRequestID As New Label
        lblLeaveRequestID = grdApprovedLeave.SelectedRow.FindControl("lblLeaveRequestID")

        Dim LeaveReq As New clsLeaveRequest()

        LeaveReq.LeaveRequestID = lblLeaveRequestID.Text
        LeaveReq.Remarks = txtRemarks.Text

        Dim Check As Integer = LeaveData.fnInsertApprovedleaveRejection(LeaveReq)

        If Check = 1 Then
            MessageBox("Rejection request Sent.")
            ClearForm()
        Else
            MessageBox("Rejection request not sent.")
        End If

    End Sub

    Protected Sub ClearForm()
        btnLeaveRejectionRequest.Enabled = False
        txtRemarks.Text = ""
        grdApprovedLeave.SelectedIndex = -1
        GetApprovedLeave()
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

End Class
