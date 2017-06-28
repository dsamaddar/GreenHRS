
Partial Class EmployeeInfo_EmployeeJD
    Inherits System.Web.UI.Page

    Dim CurrentJD As New clsJobDescriptionDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim EmployeeID As String = ""
            EmployeeID = Session("EmployeeID")

            grdCurJD.DataSource = CurrentJD.fnGetCurrentJD(EmployeeID)
            grdCurJD.DataBind()

        End If
    End Sub
End Class
