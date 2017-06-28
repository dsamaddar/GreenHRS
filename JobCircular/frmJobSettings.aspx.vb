
Partial Class JobCircular_frmJobSettings
    Inherits System.Web.UI.Page

    Dim JobTypeData As New clsJobTypeDataAccess()
    Dim ServiceTypeData As New clsServiceTypeDataAccess()

    Protected Sub btnInsertJobType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertJobType.Click

        Dim JobTypeInfo As New clsJobType()

        Dim UserID As String
        UserID = Session("LoginUserID")

        JobTypeInfo.JobType = txtJobType.Text
        JobTypeInfo.EntryBy = UserID

        If chkJobTypeIsActive.Checked = True Then
            JobTypeInfo.IsActive = True
        Else
            JobTypeInfo.IsActive = False
        End If

        Dim Check As Integer = JobTypeData.fnInsertJobType(JobTypeInfo)

        If Check = 1 Then
            MessageBox("Inserted.")
            txtJobType.Text = ""
            chkJobTypeIsActive.Checked = False
            ShowAvailableJobType()
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnInsertServiceType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertServiceType.Click
        Dim ServiceType As New clsServiceType()
        Dim UserID As String
        UserID = Session("LoginUserID")

        ServiceType.ServiceType = txtServiceType.Text
        ServiceType.EntryBy = UserID

        If chkServiceTypeIsActive.Checked = True Then
            ServiceType.IsActive = True
        Else
            ServiceType.IsActive = False
        End If

        Dim Check As Integer = ServiceTypeData.fnInsertServiceType(ServiceType)

        If Check = 1 Then
            MessageBox("Inserted.")
            txtServiceType.Text = ""
            chkServiceTypeIsActive.Checked = False
            ShowAvailableServiceType()
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub ShowAvailableJobType()
        drpAvailableJobType.DataTextField = "JobType"
        drpAvailableJobType.DataValueField = "JobTypeID"
        drpAvailableJobType.DataSource = JobTypeData.fnShowJobType()
        drpAvailableJobType.DataBind()
    End Sub

    Protected Sub ShowAvailableServiceType()
        drpAvailableServiceType.DataTextField = "ServiceType"
        drpAvailableServiceType.DataValueField = "ServiceTypeID"
        drpAvailableServiceType.DataSource = ServiceTypeData.fnShowServiceType()
        drpAvailableServiceType.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            ShowAvailableServiceType()
            ShowAvailableJobType()
        End If
    End Sub
End Class
