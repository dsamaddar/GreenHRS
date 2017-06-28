
Partial Class frmResourceReqPool
    Inherits System.Web.UI.Page

    Dim ResReqData As New clsResourceReqDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetResReqPool()
        End If
    End Sub

    Protected Sub GetResReqPool()
        grdResourcePool.DataSource = ResReqData.fnGetResPoolReport()
        grdResourcePool.DataBind()
    End Sub

End Class
