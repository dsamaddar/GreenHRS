
Partial Class frmSubjectDefinition
    Inherits System.Web.UI.Page

    Dim SubjectData As New clsSubjectsDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then
            ShowAvailableSubjects()
        End If
    End Sub

    Protected Sub ShowAvailableSubjects()
        drpAvailableSubjects.DataTextField = "SubjectName"
        drpAvailableSubjects.DataValueField = "SubjectID"
        drpAvailableSubjects.DataSource = SubjectData.fnShowSubjects()
        drpAvailableSubjects.DataBind()
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub


    Protected Sub btnInsertSubjects_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertSubjects.Click
        Dim Subjects As New clsSubjects()

        Subjects.SubjectName = txtSubjectName.Text
        Subjects.SubjectCode = txtSubjectCode.Text
        Subjects.EntryBy = Session("LoginUserID")

        Dim Check As Integer = SubjectData.fnInsertSubjects(Subjects)

        If Check = 1 Then
            ClearSubjects()
            ShowAvailableSubjects()
            MessageBox("Inserted Successfully.")
        Else
            MessageBox("Error Found.")
        End If
    End Sub

    Protected Sub ClearSubjects()
        txtSubjectCode.Text = ""
        txtSubjectName.Text = ""
    End Sub

End Class
