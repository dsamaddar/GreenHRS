
Partial Class frmHRAcceptResignationRequest
    Inherits System.Web.UI.Page

    Dim ResignationData As New clsResignationDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowHRPendingResignationRequest()
        End If
    End Sub

    Protected Sub ShowHRPendingResignationRequest()
        grdPendingHRResignationAcceptance.DataSource = ResignationData.fnGetHRPendingResignationRequest()
        grdPendingHRResignationAcceptance.DataBind()
    End Sub

End Class
