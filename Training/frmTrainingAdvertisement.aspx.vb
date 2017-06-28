
Partial Class Training_frmTrainingAdvertisement
    Inherits System.Web.UI.Page

    Dim TrainingInfoData As New clsTrainingInfoDataAccess()

    Protected Sub grdAvailableTraining_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdAvailableTraining.SelectedIndexChanged

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowAvailableTrainingInfo()
        End If
    End Sub

    Protected Sub ShowAvailableTrainingInfo()
        grdAvailableTraining.DataSource = TrainingInfoData.fnShowAvailableTraining()
        grdAvailableTraining.DataBind()
    End Sub

End Class
