Imports System.Net
Imports System.IO

Partial Class EmployeeProfile_frmAssessMyEvaluation
    Inherits System.Web.UI.Page

    Dim AssessMyEvalData As New clsAssessMyEval()
    Dim EmployeeData As New clsEmpBasicProfileDataAccess()

    Protected Sub chkAgreeWithEval_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkAgreeWithEval.CheckedChanged
        If chkAgreeWithEval.Checked = True Then
            chkDisagreeWithEval.Checked = False
            grdEvalDisagreement.Enabled = False
            ClearDisagreementGrid()
        End If
    End Sub

    Protected Sub chkDisagreeWithEval_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkDisagreeWithEval.CheckedChanged
        If chkDisagreeWithEval.Checked = True Then
            chkAgreeWithEval.Checked = False
            grdEvalDisagreement.Enabled = True
            ClearDisagreementGrid()
        End If
    End Sub

    Protected Sub ClearDisagreementGrid()
        Dim chkDisagree As New CheckBox
        For Each row As GridViewRow In grdEvalDisagreement.Rows
            chkDisagree = row.FindControl("chkDisagree")

            If chkDisagree.Checked = True Then
                chkDisagree.Checked = False
            End If
        Next
    End Sub

    Protected Sub grdPendingEvaluations_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdPendingEvaluations.SelectedIndexChanged
        Try
            Dim lblEmpEvaluationSummaryID As New Label
            lblEmpEvaluationSummaryID = grdPendingEvaluations.SelectedRow.FindControl("lblEmpEvaluationSummaryID")
            grdEvalDisagreement.DataSource = AssessMyEvalData.fnGetEvalFactorGradeForSelfAssessment(lblEmpEvaluationSummaryID.Text)
            grdEvalDisagreement.DataBind()
            btnSubmit.Enabled = True
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
            grdPendingEvaluations.DataSource = AssessMyEvalData.fnGetSelfEvalPendingByEmp(Session("UniqueUserID"))
            grdPendingEvaluations.DataBind()
            getBasicProfileInfo(Session("UniqueUserID"))
            grdEvalDisagreement.Enabled = False
            btnSubmit.Enabled = False
        End If
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Dim DisagreementIDList As String = ""
        Dim Disagreement As Boolean = False
        Dim chkDisagree As New CheckBox
        Dim lblEmpEvaluationID, lblEmpEvaluationSummaryID As New Label

        Try
            If chkAgreeWithEval.Checked = False And chkDisagreeWithEval.Checked = False Then
                MessageBox("You must agree or disagree.")
                Exit Sub
            End If

            If chkAgreeWithEval.Checked = True Then
                Disagreement = False
            End If

            If chkDisagreeWithEval.Checked = True Then
                Disagreement = True
            End If

            If grdPendingEvaluations.SelectedIndex = -1 Then
                MessageBox("Select a pending evaluation first.")
                Exit Sub
            End If

            lblEmpEvaluationSummaryID = grdPendingEvaluations.SelectedRow.FindControl("lblEmpEvaluationSummaryID")

            For Each row As GridViewRow In grdEvalDisagreement.Rows
                chkDisagree = row.FindControl("chkDisagree")

                If chkDisagree.Checked = True Then
                    lblEmpEvaluationID = row.FindControl("lblEmpEvaluationID")
                    DisagreementIDList += lblEmpEvaluationID.Text + ","
                End If
            Next

            If Disagreement = True Then
                If DisagreementIDList <> "" Then
                    DisagreementIDList = DisagreementIDList.Remove(Len(DisagreementIDList) - 1, 1)
                Else
                    MessageBox("Select At Least One Disagreement Criteria.")
                    Exit Sub
                End If
            End If

            Dim Check As Integer = AssessMyEvalData.fnSubmitSelfEvaluation(lblEmpEvaluationSummaryID.Text, Disagreement, DisagreementIDList)

            If Check = 1 Then
                MessageBox("Submitted successfully.")
                ClearForm()
            End If

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ClearForm()

        grdEvalDisagreement.DataSource = ""
        grdEvalDisagreement.DataBind()

        chkAgreeWithEval.Checked = False
        chkDisagreeWithEval.Checked = False

        grdPendingEvaluations.DataSource = AssessMyEvalData.fnGetSelfEvalPendingByEmp(Session("UniqueUserID"))
        grdPendingEvaluations.DataBind()
        grdPendingEvaluations.SelectedIndex = -1

        grdEvalDisagreement.Enabled = False
        btnSubmit.Enabled = False

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
