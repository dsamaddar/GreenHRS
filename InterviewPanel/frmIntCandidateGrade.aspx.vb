
Partial Class InterviewPanel_frmIntCandidateGrade
    Inherits System.Web.UI.Page

    Dim IntGradeData As New clsIntGradeDataAccess()

    Protected Sub btnInsertIntGrade_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertIntGrade.Click

        Dim IntGrade As New clsIntGrade()

        IntGrade.GradeName = txtInterviewGrade.Text
        IntGrade.GradePoint = Convert.ToDouble(txtGradePoint.Text)
        IntGrade.EntryBy = Session("LoginUserID")

        If chkIntGradeIsActive.Checked = True Then
            IntGrade.IsActive = True
        Else
            IntGrade.IsActive = False
        End If

        Dim Check As Integer = IntGradeData.fnInsertIntGrade(IntGrade)

        If Check = 1 Then
            MessageBox("Inserted.")
            ShowIntGradeInfo()
            ClearIntGradeForm()
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub ClearIntGradeForm()
        txtGradePoint.Text = ""
        txtInterviewGrade.Text = ""
        chkIntGradeIsActive.Checked = False

        If grdIntGrade.Rows.Count >= 0 Then
            grdIntGrade.SelectedIndex = -1
        End If

    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearIntGradeForm()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            ShowIntGradeInfo()
        End If
    End Sub

    Protected Sub ShowIntGradeInfo()
        grdIntGrade.DataSource = IntGradeData.fnShowIntGradeInfo()
        grdIntGrade.DataBind()
    End Sub

    Protected Sub grdIntGrade_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdIntGrade.SelectedIndexChanged

        Dim lblIntGradeID As New System.Web.UI.WebControls.Label()
        lblIntGradeID = grdIntGrade.SelectedRow.FindControl("lblIntGradeID")

        Dim IntGradeInfo As New clsIntGrade()
        IntGradeInfo.IntGradeID = lblIntGradeID.Text

        IntGradeInfo = IntGradeData.fnGetGradeInfoByID(IntGradeInfo)

        If IntGradeInfo Is Nothing Then
            MessageBox("Error In Selection.")
            grdIntGrade.SelectedIndex = -1
            Exit Sub
        Else
            txtInterviewGrade.Text = IntGradeInfo.GradeName
            txtGradePoint.Text = String.Format("{0:N2}", IntGradeInfo.GradePoint)

            If IntGradeInfo.IsActive = True Then
                chkIntGradeIsActive.Checked = True
            Else
                chkIntGradeIsActive.Checked = False
            End If

        End If

    End Sub
End Class
