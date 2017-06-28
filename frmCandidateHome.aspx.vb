
Partial Class frmCandidateHome
    Inherits System.Web.UI.Page

    Dim UserMSGData As New clsUserMessageDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim flag As String = "0"

            flag = Request.QueryString("flag")

            If flag = "1" Then
                MessageBox("You Have to submit your Profile.")
            End If

            Dim UniqueUserID = Session("UniqueUserID")
            Dim UserID = Session("LoginUserID")

            If UniqueUserID <> "" Then
                grdMessageForCandidate.DataSource = UserMSGData.fnShowMessageByUser(UniqueUserID)
                grdMessageForCandidate.DataBind()

                grdQueryFeed.DataSource = UserMSGData.fnShowMegFeedback(UserID)
                grdQueryFeed.DataBind()
            End If

        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

End Class
