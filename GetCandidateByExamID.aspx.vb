
Partial Class GetCandidateByExamID
    Inherits System.Web.UI.Page
    Dim ExamData As New clsExamDataAccess()

    Protected Sub GetAvailableExams()
        drpAvailableExams.DataTextField = "ExamName"
        drpAvailableExams.DataValueField = "ExamID"
        drpAvailableExams.DataSource = ExamData.fnGetAvailableExams()
        drpAvailableExams.DataBind()

        Dim A As New ListItem
        A.Text = "----- Choose Exam -----"
        A.Value = "N\A"
        drpAvailableExams.Items.Insert(0, A)

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If
        If Not IsPostBack Then
            GetAvailableExams()
        End If
    End Sub

    Protected Sub drpAvailableExams_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpAvailableExams.SelectedIndexChanged
        Dim ExamID As String=""

        ExamID = drpAvailableExams.SelectedValue

        grdDetails.DataSource = ExamData.fnGetCandidateDetailsByExamID(ExamID)
        grdDetails.DataBind()



    End Sub
End Class
