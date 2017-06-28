
Partial Class Recruitment_frmCVArchive
    Inherits System.Web.UI.Page

    Dim CVSelectionData As New clsCVSelectionDataAccess()
    Dim RecTypeData As New clsRecruitmentTypeDataAccess()

#Region " Rejected CV "

    Protected Sub btnRejectedChangeStatus_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRejectedChangeStatus.Click
        '' Chq. If Any Attendees Selected.
        Dim Attendees As Boolean = False
        Dim chkSelectRejected As New System.Web.UI.WebControls.CheckBox()
        Dim lblRejectedCandidateID As New System.Web.UI.WebControls.Label()
        Try
            For Each rw As GridViewRow In grdRejectedCV.Rows
                chkSelectRejected = rw.FindControl("chkSelectRejected")
                If chkSelectRejected.Checked = True Then
                    Attendees = True
                    Exit For
                End If
            Next

            If Attendees = False Then
                MessageBox("Select At Least One Attendees")
                Exit Sub
            End If

            Dim ChosenApplicant As String = ""

            For Each rw As GridViewRow In grdRejectedCV.Rows
                chkSelectRejected = rw.FindControl("chkSelectRejected")
                If chkSelectRejected.Checked = True Then
                    lblRejectedCandidateID = rw.FindControl("lblRejectedCandidateID")
                    ChosenApplicant += lblRejectedCandidateID.Text + ","
                End If
            Next

            ChosenApplicant = ChosenApplicant.Remove(ChosenApplicant.Length - 1)

            Dim check As Integer = CVSelectionData.fnReviewApplicant(ChosenApplicant, drpApplicantStatusRejected.SelectedValue, Session("LoginUserID"))

            If check = 1 Then
                MessageBox(drpApplicantStatusRejected.SelectedValue)
                '' Get Rejected Candidates
                GetRejectedCV(drpRecTypeList.SelectedValue)
            Else
                MessageBox("Error Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub GetRejectedCV(ByVal RecruitmentTypeID As String)
        grdRejectedCV.DataSource = CVSelectionData.fnGetRejectedCVByRecTypeID(RecruitmentTypeID)
        grdRejectedCV.DataBind()
    End Sub

#End Region

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetRecTypeList()

            If drpRecTypeList.Items.Count > 0 Then
                drpRecTypeList.SelectedIndex = 0
                GetRejectedCV(drpRecTypeList.SelectedValue)
            End If
            drpRecTypeList.Visible = False

        End If
    End Sub

    Protected Sub GetRecTypeList()
        drpRecTypeList.DataTextField = "RecruitmentType"
        drpRecTypeList.DataValueField = "RecruitmentTypeID"
        drpRecTypeList.DataSource = RecTypeData.fnGetRecTypeList()
        drpRecTypeList.DataBind()

        Dim A As New ListItem()
        A.Text = "N\A"
        A.Value = "N\A"
        drpRecTypeList.Items.Insert(0, A)
    End Sub

    Protected Sub grdRejectedCV_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grdRejectedCV.RowDataBound

        If e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(2).Text = "Total: "
            e.Row.Cells(3).Text = grdRejectedCV.Rows.Count.ToString()
        End If

    End Sub
End Class
