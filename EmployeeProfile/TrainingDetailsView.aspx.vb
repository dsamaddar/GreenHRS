
Partial Class EmployeeProfile_TrainingDetailsView
    Inherits System.Web.UI.Page

    Dim EmpTrngDataAccess As New clsEmpTrngDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim EmpTrngInfoID As String = Request.QueryString("EmpTrngInfoID")

            Dim EmpTrngInfo As New clsEmpTrngInfo()
            Try
                EmpTrngInfo = EmpTrngDataAccess.fnGetDetailTrainingInformation(EmpTrngInfoID)

                lblTrainingType.Text = EmpTrngInfo.TrngTypeID
                lblTrainingName.Text = EmpTrngInfo.TrainingName
                lblTrainingOn.Text = EmpTrngInfo.TrngSubjectID
                lblOrganizedBy.Text = EmpTrngInfo.OrganizedBy
                lblCountry.Text = EmpTrngInfo.Country
                lblLocation.Text = EmpTrngInfo.Location
                lblCourseOutline.Text = EmpTrngInfo.CourseOutline
                lblResourcePDetail.Text = EmpTrngInfo.ResourcePerson
                lblYourExperience.Text = EmpTrngInfo.YourExperience
                lblFrom.Text = EmpTrngInfo.StartsOn.ToString("dddd, dd MMMM yyyy")
                lblTo.Text = EmpTrngInfo.EndsOn.ToString("dddd, dd MMMM yyyy")
                lblTrainingStatus.Text = EmpTrngInfo.Status
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

End Class
