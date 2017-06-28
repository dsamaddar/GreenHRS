
Partial Class ScreeningInterview_frmCanResponseDetails
    Inherits System.Web.UI.Page

    Dim CanResData As New clsCandidateResponseDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Try
                Dim CandidateID As String = Request.QueryString("CandidateID")
                ShowCanResponseDetails(CandidateID)
            Catch ex As Exception
                MessageBox(ex.Message)
            End Try
           
        End If
    End Sub

    Protected Sub ShowCanResponseDetails(ByVal CandidateID As String)
        grdCanResDetails.DataSource = CanResData.fnGetCanResponseDetails(CandidateID)
        grdCanResDetails.DataBind()
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

End Class
