
Partial Class InterviewPanel_frmInterviewReschedule
    Inherits System.Web.UI.Page

    Dim IntCanData As New clsInterviewCandidateDataAccess()
    Dim IntTeamData As New clsInterviewTeamDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            ShowAllIntCanList()
            GetInterviewTeamList()
            pnlRejectOptions.Visible = False
            pnlRescheduleOption.Visible = False

        End If
    End Sub

    Private Sub ShowAllIntCanList()
        grdAllIntCanList.DataSource = IntCanData.fnGetAllIntCandidateList()
        grdAllIntCanList.DataBind()
    End Sub

    Protected Sub rdbtnHRActionList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdbtnHRActionList.SelectedIndexChanged
        If rdbtnHRActionList.SelectedValue = "Reschedule" Then
            pnlRescheduleOption.Visible = True
            pnlRejectOptions.Visible = False
        Else
            pnlRescheduleOption.Visible = False
            pnlRejectOptions.Visible = True
        End If
    End Sub

    Protected Sub grdAllIntCanList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdAllIntCanList.SelectedIndexChanged

        hdFldIntCandidateID.Value = ""

        Dim lblIntCandidateID, lblDated, lblIntTeamID As New Label()

        lblIntCandidateID = grdAllIntCanList.SelectedRow.FindControl("lblIntCandidateID")
        hdFldIntCandidateID.Value = lblIntCandidateID.Text

        lblDated = grdAllIntCanList.SelectedRow.FindControl("lblDated")
        lblPrevScheduleDate.Text = lblDated.Text

        lblIntTeamID = grdAllIntCanList.SelectedRow.FindControl("lblIntTeamID")
        drpAvailableIntTeamList.SelectedValue = lblIntTeamID.Text

        btnReject.Enabled = True
        btnRescheduleInterview.Enabled = True

    End Sub

    Protected Sub GetInterviewTeamList()
        drpAvailableIntTeamList.DataTextField = "IntTeamName"
        drpAvailableIntTeamList.DataValueField = "IntTeamID"
        drpAvailableIntTeamList.DataSource = IntTeamData.fnGetInterviewTeamList()
        drpAvailableIntTeamList.DataBind()

        Dim A As New ListItem
        A.Text = "----- Choose Team -----"
        A.Value = "N\A"
        drpAvailableIntTeamList.Items.Insert(0, A)

    End Sub

    Protected Sub btnReject_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReject.Click
        Try

            If Trim(txtRejectionRemarks.Text) = "" Then
                MessageBox("Rejection Remarks Can't Be Empty.")
                Exit Sub
            End If

            Dim IntCan As New clsInterviewCandidate()
            IntCan.IntCandidateID = hdFldIntCandidateID.Value
            IntCan.RejectedBy = Session("LoginUserID")
            IntCan.RejectionRemarks = txtRejectionRemarks.Text

            Dim Check As Integer = IntCanData.fnRejectInterview(IntCan)

            If Check = 1 Then
                MessageBox("Interviwe Rejected.")
                ShowAllIntCanList()
                ClearForm()
            Else
                MessageBox("Error Found While Rejection.")
            End If

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnRescheduleInterview_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRescheduleInterview.Click

        Try
            If drpAvailableIntTeamList.SelectedIndex = 0 Then
                MessageBox("Select Proper Interview Team.")
                Exit Sub
            End If

            Dim IntCan As New clsInterviewCandidate()
            IntCan.IntCandidateID = hdFldIntCandidateID.Value
            IntCan.IntTeamID = drpAvailableIntTeamList.SelectedValue
            IntCan.InterviewDate = txtNewInterviewDate.Text & " " & drpSHour.SelectedValue & ":" & drpSMin.SelectedValue & ":00" & " " & drpSAMPM.SelectedValue

            Dim Check As Integer = IntCanData.fnRescheduleInterview(IntCan)

            If Check = 1 Then
                MessageBox("Rescheduled Successfully.")
                ShowAllIntCanList()
                ClearForm()
            Else
                MessageBox("Error Found.")
            End If

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub ClearForm()
        If grdAllIntCanList.Rows.Count > 0 Then
            grdAllIntCanList.SelectedIndex = -1
        End If

        hdFldIntCandidateID.Value = ""
        pnlRejectOptions.Visible = False
        pnlRescheduleOption.Visible = False

        drpAvailableIntTeamList.SelectedIndex = -1
        txtNewInterviewDate.Text = ""
        lblPrevScheduleDate.Text = ""

        rdbtnHRActionList.SelectedIndex = -1

        btnReject.Enabled = False
        btnRescheduleInterview.Enabled = False
    End Sub

    Protected Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

End Class
