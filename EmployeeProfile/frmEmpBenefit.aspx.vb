
Partial Class EmployeeProfile_frmEmpBenefit
    Inherits System.Web.UI.Page

    Dim VehicleBenefitData As New clsVehicleBenefitDataAccess()

    Protected Sub btnAddVehicle_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddVehicle.Click

        Dim folder As String
        Dim DocFileName As String = ""
        Dim DocFileNameSign As String = ""
        Dim DocExt As String = ""
        Dim AttachmentFileName As String = ""
        Dim DocPrefix As String
        Dim FileSize As Integer

        Dim VehicleBenefit As New clsVehicleBenefit()

        VehicleBenefit.VehicleType = drpVehicleType.SelectedValue
        VehicleBenefit.Brand = drpBrand.SelectedValue
        VehicleBenefit.RegistrationDate = Convert.ToDateTime(txtRegistrationDate.Text)
        VehicleBenefit.RegistrationNo = txtRegistrationNo.Text
        VehicleBenefit.YearModel = txtYearModel.Text
        VehicleBenefit.EngineNo = txtEngineNo.Text
        VehicleBenefit.ChasisNo = txtChasisNo.Text
        VehicleBenefit.CurrentOwner = txtCurrentOwner.Text
        VehicleBenefit.PreviousOwner = txtPreviousOwner.Text

        If Trim(txtOwnershipTransferDate.Text) = "" Then
            VehicleBenefit.OwnershipTransferDate = "1/1/1900"
        Else
            VehicleBenefit.OwnershipTransferDate = Convert.ToDateTime(txtOwnershipTransferDate.Text)
        End If

        VehicleBenefit.VehicleCost = txtVehicleLoanAmount.Text
        VehicleBenefit.RemarksOnVehicle = txtRemarksOnVehicle.Text

        folder = Server.MapPath("~/Attachments/")

        If flupVehicleAttachment.HasFile Then

            FileSize = flupVehicleAttachment.PostedFile.ContentLength()

            If FileSize > 10485760 Then
                MessageBox("File size should be within 10MB")
                Exit Sub
            End If

            DocPrefix = Title.Replace(" ", "")

            DocExt = System.IO.Path.GetExtension(flupVehicleAttachment.FileName)

            'If DocExt <> ".jpg" And DocExt <> ".JPG" And DocExt <> ".gif" And DocExt <> ".GIF" And DocExt <> ".PNG" And DocExt <> ".png" Then
            '    MessageBox("Select Image File Only")
            '    Exit Sub
            'End If

            DocFileName = "Vehicle" & "_" & DateTime.Now.ToString("ddMMyyHHmmss") & DocExt
            AttachmentFileName = folder & DocFileName
            flupVehicleAttachment.SaveAs(AttachmentFileName)

            VehicleBenefit.VehicleAttachment = DocFileName

        Else
            'MessageBox("photo Required")
            'Exit Sub
            VehicleBenefit.VehicleAttachment = ""
        End If

        Dim Check As Integer = VehicleBenefitData.fnInsertVehicleBenefit(VehicleBenefit)

        If Check = 1 Then
            MessageBox("Inserted Successfully.")
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

    Protected Sub btnCancelToAddVehichle_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelToAddVehichle.Click

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

        End If
    End Sub

End Class
