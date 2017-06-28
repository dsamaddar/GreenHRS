Imports System.Net
Imports System.IO

Partial Class EmployeeProfile_frmCancelLeaveRequest
    Inherits System.Web.UI.Page

    Dim LeaveData As New clsLeaveRequestDataAccess()
    Dim EmployeeData As New clsEmpBasicProfileDataAccess()
   
    Protected Sub btnLeaveReqReject_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLeaveReqReject.Click
        Dim chk As System.Web.UI.WebControls.CheckBox
        Dim lblLeaveReqID As System.Web.UI.WebControls.Label

        Dim LeaveRequestID As String
        Dim EmployeeID As String
        EmployeeID = Session("UniqueUserID")
        Dim Check As Integer = 0

        For Each rw As GridViewRow In grdRecommendedLeave.Rows
            chk = rw.FindControl("chkSelectRecommend")
            If chk.Checked = True Then
                lblLeaveReqID = rw.FindControl("lblLeaveRequestIDRecom")
                LeaveRequestID = lblLeaveReqID.Text

                Check = LeaveData.ChangeApplicationStatus(LeaveRequestID, "Rejected", EmployeeID, txtCancellationRemarks.Text)
                If Check = 1 Then
                    MessageBox("Rejected")
                End If
            End If
        Next

        ShowUserLeaveReq(EmployeeID)
        ClearForm()
       
    End Sub

    Protected Sub ClearForm()
        txtCancellationRemarks.Text = "N\A"

        If grdRecommendedLeave.Rows.Count = 0 Then
            btnLeaveReqReject.Enabled = False
        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            getBasicProfileInfo(Session("ToWhomProShow"))
            ShowUserLeaveReq(Session("UniqueUserID"))
            ClearForm()
        End If
    End Sub

    Protected Sub ShowUserLeaveReq(ByVal EmployeeID As String)
        grdRecommendedLeave.DataSource = LeaveData.fnGetReqLeaveReqByUser(EmployeeID)
        grdRecommendedLeave.DataBind()
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
