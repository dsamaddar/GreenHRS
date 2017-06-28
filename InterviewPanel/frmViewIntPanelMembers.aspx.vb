
Partial Class InterviewPanel_frmViewIntPanelMembers
    Inherits System.Web.UI.Page

    Dim IntPanelData As New clsInterviewPanelDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            Try
                Dim IntTeamID As String = Request.QueryString("IntTeamID")
                ShowTeamWiseMemberInfo(IntTeamID)
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

    Protected Sub ShowTeamWiseMemberInfo(ByVal IntTeamID As String)
        Dim IntPanelInfo As New clsInterviewPanel()
        IntPanelInfo.IntTeamID = IntTeamID
        grdExistingTeamMember.DataSource = IntPanelData.fnGetIntPanelwiseMemberInfo(IntPanelInfo)
        grdExistingTeamMember.DataBind()
    End Sub

End Class
