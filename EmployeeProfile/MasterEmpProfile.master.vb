
Partial Class EmployeeProfile_MasterEmpProfile
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UniqueUserID") = "" And Session("UserName") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            lblEmpLoggedInUser.Text = "Welcome " + Session("UserName") + " ! "
            MaintainConfidentiality()
        End If

    End Sub

    Protected Sub lnkBtnEmpTransitionHistory_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkBtnEmpTransitionHistory.Click
        Try
            Dim lbl As New System.Web.UI.WebControls.Label()
            lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                       & "openWindow('frmEmpTransitionHistory.aspx?EmployeeID=" & Session("ToWhomProShow") & "','Popup',1000,900);</script>"
            Page.Controls.Add(lbl)
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

    Protected Sub lnkBtnEmpSkillSet_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkBtnEmpSkillSet.Click
        Try
            Dim lbl As New System.Web.UI.WebControls.Label()
            lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                       & "openWindow('frmEmpSkillSet.aspx?EmployeeID=" & Session("ToWhomProShow") & "','Popup',1000,900);</script>"
            Page.Controls.Add(lbl)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub lnkBtnCOC_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkBtnCOC.Click
        Try
            Dim lbl As New System.Web.UI.WebControls.Label()
            lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                       & "openWindow('frmCostOfTheCompany.aspx?EmployeeID=" & Session("ToWhomProShow") & "','Popup',1000,900);</script>"
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

End Class

