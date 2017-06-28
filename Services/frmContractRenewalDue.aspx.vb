
Partial Class Services_frmContractRenewalDue
    Inherits System.Web.UI.Page

    Dim EmpInfoData As New clsEmployeeInfoDataAccess()
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetConfirmationDue()
        End If
    End Sub

    Protected Sub GetConfirmationDue()
        grdContractRenewalDueList.DataSource = EmpInfoData.fnGetContractRenewalDue()
        grdContractRenewalDueList.DataBind()
    End Sub

End Class
