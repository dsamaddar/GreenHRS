Imports System.Net
Imports System.IO

Partial Class EmployeeProfile_frmEmployeeRelative
    Inherits System.Web.UI.Page

    Dim RelativeData As New clsEmpRelativesDataAccess()
    Dim RelationTypeData As New clsRelativeTypeDataAccess()
    Dim EmployeeData As New clsEmpBasicProfileDataAccess()
    Dim EducationInformation As New clsEmployeeAllInfoDataAccess()


    Protected Sub btnInsertRelative_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertRelative.Click

        Dim RelativeInfo As New clsRelatives()
        Dim Check As Integer = 0

        Dim EmployeeID As String = lblHolder.Text
        RelativeInfo.RelativeID = hdfldRelativeID.Value
        RelativeInfo.EmployeeID = EmployeeID
        RelativeInfo.RelationTypeID = drpSelectRelativeType.SelectedValue
        RelativeInfo.NameOfRelative = txtNameOfRelative.Text
        RelativeInfo.DateOfBirth = Convert.ToDateTime(txtDateOfBirth.Text)
        RelativeInfo.Gender = rdbtnGender.SelectedValue
        RelativeInfo.RelAddress = txtAddress.Text
        RelativeInfo.FamilyInsuranceNo = txtFamilyInsuNo.Text
        RelativeInfo.ContactNumber = If(txtContactNumber.Text = "", "", txtContactNumber.Text)
        RelativeInfo.Details = ""
        RelativeInfo.EntryBy = Session("LoginUserID")

        If btnInsertRelative.Text = "Insert" Then
            Check = RelativeData.fnInsertEmpRelatives(RelativeInfo)

            If Check = 1 Then
                MessageBox("Inserted Successfully.")
                ClearForm()
                ShowRelativeInfo(EmployeeID)
            Else
                MessageBox("Error Found.")
            End If

        Else
            Check = RelativeData.fnUpdateEmpRelatives(RelativeInfo)

            If Check = 1 Then
                MessageBox("Updated Successfully.")
                ClearForm()
                btnInsertRelative.Text = "Insert"
                grdRelativesInfo.SelectedIndex = -1
                ShowRelativeInfo(EmployeeID)
            Else
                MessageBox("Error Found.")
            End If
        End If
    End Sub

    Protected Sub ClearForm()
        drpSelectRelativeType.SelectedIndex = -1
        txtNameOfRelative.Text = ""
        txtDateOfBirth.Text = ""
        txtAddress.Text = ""
        txtDetails.Text = ""
        rdbtnGender.SelectedIndex = -1
        txtContactNumber.Text = ""

        Dim BaseInsuNo As String = ""
        RelativeData.fnGetEmpInsuranceNo(lblHolder.Text, BaseInsuNo)
        txtFamilyInsuNo.Text = BaseInsuNo + "-"

    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Try

                Dim ToWhomProShow As String = Session("ToWhomProShow")
                lblHolder.Text = ToWhomProShow

                getBasicProfileInfo(ToWhomProShow)

                Dim EmployeeID As String = Session("UniqueUserID")

                If EmployeeID = ToWhomProShow Then
                    Dim Check As Boolean = EducationInformation.CheckPermissionForOwnInfo(EmployeeID)
                    If Check = True Then
                        pnlRelativeInput.Visible = True
                    Else
                        pnlRelativeInput.Visible = False
                    End If
                Else
                    Dim Check As Boolean = EducationInformation.CheckPermissionForOthers(EmployeeID)
                    If Check = True Then
                        pnlRelativeInput.Visible = True
                    Else
                        pnlRelativeInput.Visible = False
                    End If
                End If

                Dim BaseInsuNo As String = ""

                RelativeData.fnGetEmpInsuranceNo(ToWhomProShow, BaseInsuNo)

                txtBaseInsuNo.Text = BaseInsuNo

                txtFamilyInsuNo.Text = BaseInsuNo + "-"


                ShowRelativeInfo(ToWhomProShow)
                ShowRelationType()
                lblNewRelationType.Visible = False
                btnCancelInsertNewRelationType.Visible = False
            Catch ex As Exception
                MessageBox(ex.Message)
            End Try


        End If
    End Sub

    Protected Sub ShowRelationType()
        drpSelectRelativeType.DataValueField = "RelationTypeID"
        drpSelectRelativeType.DataTextField = "RelationType"
        drpSelectRelativeType.DataSource = RelationTypeData.fnShowRelationType()
        drpSelectRelativeType.DataBind()
    End Sub

    Protected Sub ShowRelativeInfo(ByVal EmployeeID As String)
        grdRelativesInfo.DataSource = RelativeData.fnShowEmpRelatives(EmployeeID)
        grdRelativesInfo.DataBind()
    End Sub

    Protected Sub btnNewRelationType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNewRelationType.Click

        Dim RelationType As New clsRelationType()

        If btnNewRelationType.Text = "..." Then
            btnNewRelationType.Text = "Insert"
            lblNewRelationType.Visible = True
            btnNewRelationType.ValidationGroup = "RelationType"
            btnCancelInsertNewRelationType.Visible = True
        Else
            If txtRelationType.Text = "" Then
                MessageBox("InPut Relation Type")
            Else

                If chkRelationTypeIsActive.Checked = True Then
                    RelationType.IsActive = True
                Else
                    RelationType.IsActive = False
                End If

                RelationType.RelationType = txtRelationType.Text
                RelationType.IsActive = True
                RelationType.EntryBy = Session("LoginUserID")

                Dim check As Integer = RelationTypeData.fnInsertRelationType(RelationType)

                If check = 1 Then
                    MessageBox("Inserted Successfully.")
                    ShowRelationType()
                    txtRelationType.Text = ""
                    lblNewRelationType.Visible = False
                    btnCancelInsertNewRelationType.Visible = False
                    btnNewRelationType.Text = "..."
                    btnNewRelationType.ValidationGroup = ""
                    chkRelationTypeIsActive.Checked = False
                Else
                    MessageBox("Error Found.")
                End If

            End If

        End If
    End Sub

    Protected Sub btnCancelInsertNewRelationType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelInsertNewRelationType.Click
        btnNewRelationType.Text = "..."
        lblNewRelationType.Visible = False
        btnCancelInsertNewRelationType.Visible = False
    End Sub

    Protected Sub grdRelativesInfo_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdRelativesInfo.SelectedIndexChanged

        Dim lblRelativeID As New System.Web.UI.WebControls.Label()
        Dim lblRelationTypeID As New System.Web.UI.WebControls.Label()
        Dim lblNameOfRelative As New System.Web.UI.WebControls.Label()
        Dim lblDateOfBirth As New System.Web.UI.WebControls.Label()
        Dim lblRelAddress As New System.Web.UI.WebControls.Label()
        Dim lblDetails As New System.Web.UI.WebControls.Label()
        Dim lblGender As New System.Web.UI.WebControls.Label()

        lblRelativeID = grdRelativesInfo.SelectedRow.FindControl("lblRelativeID")
        lblRelationTypeID = grdRelativesInfo.SelectedRow.FindControl("lblRelationTypeID")
        lblNameOfRelative = grdRelativesInfo.SelectedRow.FindControl("lblNameOfRelative")
        lblDateOfBirth = grdRelativesInfo.SelectedRow.FindControl("lblDateOfBirth")
        lblRelAddress = grdRelativesInfo.SelectedRow.FindControl("lblRelAddress")
        lblDetails = grdRelativesInfo.SelectedRow.FindControl("lblDetails")
        lblGender = grdRelativesInfo.SelectedRow.FindControl("lblGender")


        hdfldRelativeID.Value = lblRelativeID.Text
        drpSelectRelativeType.SelectedValue = lblRelationTypeID.Text
        txtDateOfBirth.Text = Convert.ToDateTime(lblDateOfBirth.Text)
        txtNameOfRelative.Text = lblNameOfRelative.Text
        txtAddress.Text = lblRelAddress.Text
        txtDetails.Text = lblDetails.Text
        rdbtnGender.SelectedValue = lblGender.Text

        btnInsertRelative.Text = "Update"

    End Sub

    Protected Sub btnCancelSelection_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelSelection.Click

        If grdRelativesInfo.Rows.Count > 0 Then
            grdRelativesInfo.SelectedIndex = -1
        End If

        txtAddress.Text = ""
        txtDateOfBirth.Text = ""
        txtDetails.Text = ""
        txtNameOfRelative.Text = ""
        drpSelectRelativeType.SelectedIndex = -1

        btnInsertRelative.Text = "Insert"

    End Sub

    Protected Sub getBasicProfileInfo(ByVal EmployeeId As String)
        Dim EmpBasicProfile As New EmpBasicInfo()
        EmpBasicProfile = EmployeeData.fnGetBasicProfile(EmployeeId)

        Dim pnlEmpSummary As Panel
        Master.FindControl("pnlEmpSummary")
        pnlEmpSummary = Master.FindControl("pnlEmpSummary")

        Dim lblEmployeeName, lblEmployeeID, lblOfficialDesignation, lblFunctionalDesignation, lblDepartment, lblSupervisorName, lblEmployeeType, lblServiceLength, lblLocation As Label
        Dim imgEmployee As Image
        Dim hpLnkCanProfile As New HyperLink

        lblEmployeeName = pnlEmpSummary.FindControl("lblEmployeeName")
        lblEmployeeID = pnlEmpSummary.FindControl("lblEmployeeID")
        lblOfficialDesignation = pnlEmpSummary.FindControl("lblOfficialDesignation")
        lblFunctionalDesignation = pnlEmpSummary.FindControl("lblFunctionalDesignation")
        lblDepartment = pnlEmpSummary.FindControl("lblDepartment")
        lblSupervisorName = pnlEmpSummary.FindControl("lblSupervisorName")
        lblEmployeeType = pnlEmpSummary.FindControl("lblEmployeeType")
        lblServiceLength = pnlEmpSummary.FindControl("lblServiceLength")
        lblLocation = pnlEmpSummary.FindControl("lblLocation")
        imgEmployee = pnlEmpSummary.FindControl("imgEmployee")
        hpLnkCanProfile = pnlEmpSummary.FindControl("hpLnkCanProfile")

        lblEmployeeName.Text = EmpBasicProfile.Name
        lblEmployeeID.Text = EmpBasicProfile.EmpCode
        lblOfficialDesignation.Text = EmpBasicProfile.OfficialDesignation
        lblFunctionalDesignation.Text = EmpBasicProfile.FunctionalDesignation
        lblDepartment.Text = EmpBasicProfile.DepartmentName
        lblSupervisorName.Text = EmpBasicProfile.CurrentSupervisor
        lblEmployeeType.Text = EmpBasicProfile.EmployeeTypeName
        lblServiceLength.Text = EmpBasicProfile.ServiceLength
        lblLocation.Text = EmpBasicProfile.ULCBranchName
        hpLnkCanProfile.NavigateUrl = "../RecuitmentCVView.aspx?CandidateID=" + EmpBasicProfile.CandidateID

        If EmpBasicProfile.Attachment = "" Then
            imgEmployee.ImageUrl = ""
        Else
            ShowImage(ConfigurationManager.AppSettings("AttachmentsShow") & EmpBasicProfile.Attachment, "imgEmployee")
        End If
    End Sub

    Protected Sub ShowImage(ByVal UrlStr As String, ByVal ControlName As String)
        Dim tClient As WebClient = New WebClient
        Dim memStrmPic As MemoryStream = New MemoryStream(tClient.DownloadData(UrlStr))
        Dim bytesPic As Byte() = memStrmPic.ToArray()
        Dim base64StringPic As String = Convert.ToBase64String(bytesPic, 0, bytesPic.Length)

        Dim imgCtrl As System.Web.UI.WebControls.Image = Master.FindControl(ControlName)
        imgCtrl.ImageUrl = "data:image/png;base64," & base64StringPic
        memStrmPic.Dispose()
    End Sub

End Class
