Imports System
Imports System.Data
Imports System.Net
Imports System.IO

Partial Class frmPerformanceReview
    Inherits System.Web.UI.Page

    Dim EmployeeInfoData As New clsEmployeeInfoDataAccess()
    Dim EmployeeData As New clsEmpBasicProfileDataAccess()
    Dim PerformanceData As New clsReviewPerformanceDataAccess()
    Dim DeptData As New clsDepartmentDataAccess()
    Dim ProfRec As New clsProfRecordDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Try
                Dim DepartmentID As String = Request.QueryString("DepartmentID")
                Dim EmployeeID As String = Request.QueryString("EmployeeID")
                imgEmployee.ImageUrl = ConfigurationManager.AppSettings("AttachmentsShow") & "avator.png"

                ShowDeptList()
                If DepartmentID <> "" Then
                    drpDepartment.SelectedValue = DepartmentID
                    GetEmpListByDept(drpDepartment.SelectedValue)
                    If EmployeeID <> "" Then
                        drpEmpList.SelectedValue = EmployeeID
                        GetEmpSelectionChange()
                    End If
                End If

                MaintainConfidentiality()
            Catch ex As Exception
                MessageBox(ex.Message)
            End Try
        End If
    End Sub

    Protected Sub ShowDeptList()
        drpDepartment.DataTextField = "DeptName"
        drpDepartment.DataValueField = "DepartmentID"
        drpDepartment.DataSource = DeptData.fnGetDeptList()
        drpDepartment.DataBind()

        Dim A As New ListItem()
        A.Text = "-- Select Department --"
        A.Value = "N\A"
        drpDepartment.Items.Insert(0, A)

        If drpDepartment.Items.Count > 0 Then
            drpDepartment.SelectedIndex = 0
            GetEmpListByDept(drpDepartment.SelectedValue)
        End If

    End Sub

    Protected Sub GetEmpListByDept(ByVal DepartmentID As String)
        drpEmpList.DataTextField = "EmployeeName"
        drpEmpList.DataValueField = "EmployeeID"
        drpEmpList.DataSource = EmpInfoData.fnGetEmpListByDept(DepartmentID)
        drpEmpList.DataBind()

        Dim A As New ListItem()
        A.Text = "-- Select Employee --"
        A.Value = "N\A"
        drpEmpList.Items.Insert(0, A)
    End Sub

    Protected Sub GetEduInfo(ByVal EmployeeID As String)
        grdEducation.DataSource = PerformanceData.fnGetEmpEdu(EmployeeID)
        grdEducation.DataBind()
    End Sub

    Protected Sub GetCareerProgression(ByVal EmployeeID As String)
        grdCareerProgression.DataSource = PerformanceData.fnGetEmpCareerProgression(EmployeeID)
        grdCareerProgression.DataBind()
    End Sub

    Protected Sub GetFunctionalTransition(ByVal EmployeeID As String)
        grdFunctionalTransition.DataSource = PerformanceData.fnGetFunctionalTransition(EmployeeID)
        grdFunctionalTransition.DataBind()
    End Sub

    Protected Sub GetProfessionalCertification(ByVal EmployeeID As String)
        grdProfCertification.DataSource = PerformanceData.fnGetEmpProfCertification(EmployeeID)
        grdProfCertification.DataBind()
    End Sub

    Protected Sub GetTrainingInfo(ByVal EmployeeID As String)
        grdTraining.DataSource = PerformanceData.fnGetEmpTrngInfo(EmployeeID)
        grdTraining.DataBind()
    End Sub

    Protected Sub GetSkillSet(ByVal EmployeeID As String)
        Try
            grdSkillTest.DataSource = PerformanceData.fnGetEmpSkillSet(EmployeeID)
            grdSkillTest.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub grdEducation_SelectedIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewSelectEventArgs) Handles grdEducation.SelectedIndexChanging
        grdEducation.PageIndex = grdEducation.PageIndex + 1
        grdEducation.DataBind()
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub lnkBtnCOC_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkBtnCOC.Click
        Try
            Dim lbl As New Label()

            lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                       & "openWindow('EmployeeProfile/frmCostOfTheCompany.aspx?EmployeeID=" & drpEmpList.SelectedValue & "','Popup',1000,900);</script>"
            Page.Controls.Add(lbl)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Dim EmpInfoData As New clsEmployeeInfoDataAccess()

    Protected Sub MaintainConfidentiality()
        Dim ConfidentialAccess As Boolean = False
        ConfidentialAccess = EmpInfoData.fnHasConfidentialAccess(Session("UniqueUserID"))

        If ConfidentialAccess = True Then
            lnkBtnCOC.Enabled = True
        Else
            lnkBtnCOC.Enabled = False
        End If
    End Sub

    Protected Sub drpDepartment_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpDepartment.SelectedIndexChanged
        GetEmpListByDept(drpDepartment.SelectedValue)
    End Sub

    Protected Sub GetEmpSelectionChange()
        If drpEmpList.SelectedValue <> "N\A" Then
            GetEduInfo(drpEmpList.SelectedValue)
            GetCareerProgression(drpEmpList.SelectedValue)
            GetProfessionalCertification(drpEmpList.SelectedValue)
            GetFunctionalTransition(drpEmpList.SelectedValue)
            GetSkillSet(drpEmpList.SelectedValue)
            GetTrainingInfo(drpEmpList.SelectedValue)
            GetEmpBasicProfileInfo(drpEmpList.SelectedValue)
            GetProfRecFavorable(drpEmpList.SelectedValue, "Favorable")
            GetProfRecUnFavorable(drpEmpList.SelectedValue, "Unfavorable")
            GetParityEmployees(drpEmpList.SelectedValue)
            RowVisibility()
        Else
            MessageBox("")
        End If
    End Sub

    Protected Sub drpEmpList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpEmpList.SelectedIndexChanged
        GetEmpSelectionChange()
    End Sub

    Protected Sub GetParityEmployees(ByVal EmployeeID As String)
        grdParity.DataSource = PerformanceData.fnGetParityEmployees(EmployeeID)
        grdParity.DataBind()
    End Sub

    Protected Sub GetProfRecFavorable(ByVal EmployeeID As String, ByVal Category As String)
        grdProfRecFavorable.DataSource = ProfRec.fnGetProfRecByEmpByCat(EmployeeID, Category)
        grdProfRecFavorable.DataBind()
    End Sub

    Protected Sub GetProfRecUnFavorable(ByVal EmployeeID As String, ByVal Category As String)
        grdProfRecUnfavorable.DataSource = ProfRec.fnGetProfRecByEmpByCat(EmployeeID, Category)
        grdProfRecUnfavorable.DataBind()
    End Sub

    Protected Sub GetEmpBasicProfileInfo(ByVal EmployeeID As String)
        Try
            Dim EmpBasicProfile As New EmpBasicInfo()
            EmpBasicProfile = EmployeeData.fnGetBasicProfile(EmployeeID)

            lblEmpName.Text = EmpBasicProfile.Name & " (" & EmpBasicProfile.EmpCode & ")"
            lblEmpOfficialDesignation.Text = EmpBasicProfile.OfficialDesignation
            lblEmpFunctionalDesignation.Text = EmpBasicProfile.FunctionalDesignation
            lblEmpServiceLength.Text = EmpBasicProfile.ServiceLength
            lblEmpBranch.Text = EmpBasicProfile.ULCBranchName
            lblEmpDepartment.Text = EmpBasicProfile.DepartmentName

            ShowImage(ConfigurationManager.AppSettings("AttachmentsShow") & EmpBasicProfile.Attachment, "imgEmployee")
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ShowImage(ByVal UrlStr As String, ByVal ControlName As String)
        Try
            Dim tClient As WebClient = New WebClient
            Dim memStrmPic As MemoryStream = New MemoryStream(tClient.DownloadData(UrlStr))
            Dim bytesPic As Byte() = memStrmPic.ToArray()
            Dim base64StringPic As String = Convert.ToBase64String(bytesPic, 0, bytesPic.Length)

            imgEmployee.ImageUrl = "data:image/png;base64," & base64StringPic
            memStrmPic.Dispose()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub RowVisibility()
        Dim i As Integer = 0
        For Each rw As GridViewRow In grdEducation.Rows
            i += 1
            If i > 3 Then
                rw.Visible = False
            End If
        Next

        i = 0
        For Each rw As GridViewRow In grdCareerProgression.Rows
            i += 1
            If i > 3 Then
                rw.Visible = False
            End If
        Next

        i = 0
        For Each rw As GridViewRow In grdFunctionalTransition.Rows
            i += 1
            If i > 3 Then
                rw.Visible = False
            End If
        Next

        i = 0
        For Each rw As GridViewRow In grdPerformanceTrail.Rows
            i += 1
            If i > 3 Then
                rw.Visible = False
            End If
        Next

        i = 0
        For Each rw As GridViewRow In grdProfCertification.Rows
            i += 1
            If i > 3 Then
                rw.Visible = False
            End If
        Next

        i = 0
        For Each rw As GridViewRow In grdProfRecFavorable.Rows
            i += 1
            If i > 3 Then
                rw.Visible = False
            End If
        Next

        i = 0
        For Each rw As GridViewRow In grdProfRecUnfavorable.Rows
            i += 1
            If i > 3 Then
                rw.Visible = False
            End If
        Next


        i = 0
        For Each rw As GridViewRow In grdSkillTest.Rows
            i += 1
            If i > 3 Then
                rw.Visible = False
            End If
        Next

        i = 0
        For Each rw As GridViewRow In grdTraining.Rows
            i += 1
            If i > 3 Then
                rw.Visible = False
            End If
        Next


    End Sub

End Class
