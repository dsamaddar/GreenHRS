
Partial Class EmployeeInfo_frmJDAcceptance
    Inherits System.Web.UI.Page
    Dim JDData As New clsJobDescriptionDataAccess()
    Dim EmpData As New clsEmployeeInfoDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            Dim JobDescriptionID As String

            JobDescriptionID = Request.QueryString("JobDescriptionID")

            Dim EmployeeID As String = ""
            EmployeeID = Session("EmployeeID")

            Dim JobDescription As New clsJobDescription()

            JobDescription = JDData.fnGetJobDescriptionByID(JobDescriptionID)

            lblJDNo.Text = JobDescription.JobDescriptionNo
            lblJobTitle.Text = JobDescription.JobTitle
            lblModifiedDate.Text = JobDescription.LastModifiedDate
            lblJDGoal.Text = JobDescription.JDGoal

            Dim CountJD As Integer = clsEmployeeInfoDataAccess.EmpJDCount(EmployeeID)

            If CountJD <> 0 Then
                btnJDAcc.Enabled = False
                idLabel.Visible = True
                idLabel.Text = "Already Accepted"
            Else
                btnJDAcc.Enabled = True
                idLabel.Text = ""
                idLabel.Visible = False
            End If
        End If
    End Sub

    Protected Sub btnJDAcc_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnJDAcc.Click
        Dim JobDescriptionID As String

        JobDescriptionID = Request.QueryString("JobDescriptionID")

        Dim EmployeeID As String = ""
        EmployeeID = Session("EmployeeID")

        Dim Check As Integer = EmpData.fnInsertJDAcceptance("", JobDescriptionID, EmployeeID)

        If Check = 1 Then
            MessageBox("Accepted.")
            btnJDAcc.Enabled = False
            idLabel.Visible = True
            idLabel.Text = "Already Accepted"
        Else
            MessageBox("Error Found.")
            btnJDAcc.Enabled = True
            idLabel.Text = ""
            idLabel.Visible = False
        End If

    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub
End Class
