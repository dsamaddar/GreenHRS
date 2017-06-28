
Partial Class frmResReqByRecType
    Inherits System.Web.UI.Page

    Dim ResReqData As New clsResourceReqDataAccess()

    Protected Sub form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Load
        If Not IsPostBack Then
            Dim RecruitmentTypeID As String = Request.QueryString("RecruitmentTypeID")

            GetResReqByType(RecruitmentTypeID)
        End If
    End Sub

    Protected Sub GetResReqByType(ByVal RecruitmentTypeID As String)
        grdPendingResourceReq.DataSource = ResReqData.fnGetRecTypeWiseReq(RecruitmentTypeID)
        grdPendingResourceReq.DataBind()
    End Sub
End Class
