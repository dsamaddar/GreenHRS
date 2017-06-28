
Partial Class JD_frmJobDescriptionView
    Inherits System.Web.UI.Page
    Dim JDData As New clsJobDescriptionDataAccess()
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim JobDescriptionID As String

            JobDescriptionID = Request.QueryString("JobDescriptionID")

            Dim JobDescription As New clsJobDescription()

            JobDescription = JDData.fnGetJobDescriptionByID(JobDescriptionID)

            lblJDNo.Text = JobDescription.JobDescriptionNo
            lblJobTitle.Text = JobDescription.JobTitle
            lblModifiedDate.Text = JobDescription.LastModifiedDate
            lblJDGoal.Text = JobDescription.JDGoal


        End If
    End Sub
End Class
