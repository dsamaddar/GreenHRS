Imports System.Data
Partial Class EmployeeInfo_EmployeeBasicInfo
    Inherits System.Web.UI.Page

    Dim BasicData As New clsEmployeeBasicInfoDataAccess()

    Dim DocumentData As clsDocumentTypeDataAccess = New clsDocumentTypeDataAccess()
    Dim DocumentListData As clsDocumentListDataAccess = New clsDocumentListDataAccess()

    Dim BasicDataAccess As New clsCanBasicDataAccess()

    Dim DocumentList As clsDocumentList = New clsDocumentList()


    Protected Sub btnNext_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNext.Click
        Dim EmployeeID As String
        Dim EmployeeName As String
        Dim UserID As String

        EmployeeName = Session("UserName")

        EmployeeID = Session("EmployeeID")

        UserID = Session("LoginUserID")

        Dim EmpBasicInfo As String = ""

        Dim BasicInfo As New EmpBasicInfo()

        BasicInfo.Name = EmployeeName
        BasicInfo.FatherName = txtFatherName.Text
        BasicInfo.FathersOccupation = ddlFathersOccupation.SelectedValue
        BasicInfo.MotherName = txtMotherName.Text
        BasicInfo.MothersOccupation = ddlMotherOccupation.SelectedValue
        BasicInfo.SpouseName = txtSpouseName.Text
        BasicInfo.SpouseOccupation = ddlSpouseOccupation.SelectedValue
        BasicInfo.NoOfChildrenAge = txtNoChildren.Text
        BasicInfo.SibblingsNameOccupation = txtSibblingsInfo.Text
        BasicInfo.Gender = rdbtnGender.SelectedValue
        BasicInfo.Nationality = ddlNationality.SelectedValue
        BasicInfo.NIDNo = txtNID.Text
        BasicInfo.RelationshipStatus = ddlRelStatus.SelectedValue
        BasicInfo.BloodGroupID = ddlBloodGrp.SelectedValue

        'BasicInfo.Religion = ddlReligion.SelectedValue

        If ddlRelStatus.SelectedIndex = 0 Then
            MessageBox("Please Select Relationship Status")
            Exit Sub
        End If

        'If ddlBloodGrp.SelectedIndex = 0 Then
        '    MessageBox("Please Select Blood Group")
        '    Exit Sub
        'End If

        If ddlReligion.SelectedValue = "-Select-" Then
            MessageBox("Please Select Religion")
            Exit Sub
        Else
            BasicInfo.Religion = ddlReligion.SelectedValue
        End If


        BasicInfo.PermanentAddress = txtPerAddress.Text
        BasicInfo.PreDistrict = ddlPreDistrict.SelectedValue
        BasicInfo.PreThana = ddlPreThana.SelectedValue
        BasicInfo.PresentAddress = txtPreAdd.Text
        BasicInfo.PerDistrict = ddlperDistrict.SelectedValue
        BasicInfo.PerThana = ddlPerThana.SelectedValue
        BasicInfo.MobileNumber = txtMobileNumber.Text
        BasicInfo.EMail = txtEmail.Text
        BasicInfo.AltEMail = txtAlEmail.Text

        If ddlRelStatus.SelectedItem.ToString = "Single" Then

        End If

        Dim DocumentInformation As String = ""
        Dim dtLoanAccDocuments As DataTable = New DataTable()
        dtLoanAccDocuments = Session("UserDocuments")

        If hdFldChangeMadeToDocumentUploads.Value = "True" Then
            '' Document Information
            BasicInfo.IsChangeMadeToDocumentUploads = True
            Dim DocumentInfo As clsDocumentList = New clsDocumentList()
            For Each rw As DataRow In dtLoanAccDocuments.Rows
                DocumentInfo.DocumentName = rw.Item("DocumentName")
                DocumentInfo.FileName = rw.Item("FileName")
                DocumentInfo.DocTypeID = rw.Item("DocTypeID")
                DocumentInformation = DocumentInformation & DocumentInfo.DocumentName & "~" & DocumentInfo.FileName & "~" & DocumentInfo.DocTypeID & "~|"
            Next
            BasicInfo.Documents = DocumentInformation
        Else
            BasicInfo.Documents = ""
        End If


        Dim folder As String
        Dim DocFileName As String = ""
        Dim DocFileNameSign As String = ""
        Dim DocExt As String
        Dim AttachmentFileName As String
        Dim Signature As String
        Dim DocPrefix As String
        Dim FileSize As Integer

        If hpAttachment.NavigateUrl <> "" Then
            DocFileName = Replace(hpAttachment.NavigateUrl, "~/attachments/", "")
        End If

        folder = Server.MapPath("~/Attachments/")

        If flAttachment.HasFile Then

            FileSize = flAttachment.PostedFile.ContentLength()

            If FileSize > 10485760 Then
                MessageBox("File size should be within 10MB")
                Exit Sub
            End If

            DocPrefix = Title.Replace(" ", "")

            DocExt = System.IO.Path.GetExtension(flAttachment.FileName)
            'DocFileName = "Candidate" & DocExt

            If DocExt <> ".jpg" And DocExt = ".gif" And DocExt = ".png" Then
                MessageBox("Select Image File Only")
                Exit Sub
            End If

            DocFileName = "Photo" & "_" & BasicInfo.Name & "_" & DateTime.Now.ToString("ddMMyyHHmmss") & DocExt
            AttachmentFileName = folder & DocFileName
            flAttachment.SaveAs(AttachmentFileName)
        End If


        If hpSignature.NavigateUrl <> "" Then
            DocFileNameSign = Replace(hpSignature.NavigateUrl, "~/attachments/", "")

        End If

        folder = Server.MapPath("~/Attachments/")

        If flSignature.HasFile Then

            FileSize = flSignature.PostedFile.ContentLength()

            If FileSize > 5242880 Then
                MessageBox("File size should be within 5MB")
                Exit Sub
            End If

            DocPrefix = Title.Replace(" ", "")

            DocExt = System.IO.Path.GetExtension(flSignature.FileName)

            If DocExt <> ".jpg" And DocExt = ".gif" And DocExt = ".png" Then
                MessageBox("Select Image File Only")
                Exit Sub
            End If

            DocFileNameSign = "Signature" & "_" & BasicInfo.Name & "_" & DateTime.Now.ToString("ddMMyyHHmmss") & DocExt
            Signature = folder & DocFileNameSign
            flSignature.SaveAs(Signature)
        End If

        EmpBasicInfo = BasicData.fnInsertBasicInfo(EmployeeID, BasicInfo, DocFileName, DocFileNameSign, BasicInfo.Documents, UserID)

        If EmpBasicInfo <> "" Then
            MessageBox("Inserted Successfully")
            hdFldChangeMadeToDocumentUploads.Value = "False"
            BasicInfo.IsChangeMadeToDocumentUploads = False
            ' Session("CandidateID") = EmpBasicInfo
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

    Protected Function FormatAccountDocumentTable() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("DocTypeID", System.Type.GetType("System.String"))
        dt.Columns.Add("DocTypeName", System.Type.GetType("System.String"))
        dt.Columns.Add("DocumentName", System.Type.GetType("System.String"))
        dt.Columns.Add("FileName", System.Type.GetType("System.String"))

        Return dt
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If

        If Not IsPostBack Then

            Dim Message As String
            Message = Request.QueryString("Message")
            If Message <> "" Then
                lblRedirectMsg.Text = Message
            End If

            Dim EmployeeName As String

            EmployeeName = Session("UserName")

            txtName.Text = EmployeeName

            Dim EmployeeID As String = ""
            EmployeeID = Session("EmployeeID")

            lblNewDocumentType.Visible = False
            btnCancelInsertNewDocumentType.Visible = False

            ShowDocumentType()
            ShowOccupationList()

            hdFldChangeMadeToDocumentUploads.Value = ""
            Dim dtUserDocuments As DataTable = New DataTable()
            dtUserDocuments = FormatAccountDocumentTable()
            Session("UserDocuments") = dtUserDocuments

            ShowPrevUploadedDocumentInfo(Session("UniqueUserID"))

            ddlRelStatus.DataTextField = "RelName"
            ddlRelStatus.DataValueField = "RelationshipID"
            ddlRelStatus.DataSourceID = "dsRelationStatus"
            ddlRelStatus.DataBind()

            ddlRelStatus.DataBind()
            dsRelationStatus.DataBind()
            ddlRelStatus.Items.Insert(0, "--Select--")

            ddlBloodGrp.DataBind()
            ddlBloodGrp.DataBind()
            ddlBloodGrp.Items.Insert(0, "--Select--")

            If ddlRelStatus.Items.Count > 0 Then

                If ddlRelStatus.SelectedItem.Text = "Single" Then
                    txtSpouseName.Enabled = False
                    ddlSpouseOccupation.Enabled = False
                    txtSpouseName.Text = ""
                    ddlSpouseOccupation.SelectedIndex = 0
                Else
                    txtSpouseName.Enabled = True
                    ddlSpouseOccupation.Enabled = True
                End If

            End If

            If EmployeeID = "" Then
                Exit Sub
            End If


            Dim BasicInfo As New CanBasicInfo()

            BasicInfo = BasicData.fnGetEmployeeBasicInformation(EmployeeID)

            'txtName.Text = BasicInfo.Name
            txtFatherName.Text = BasicInfo.FatherName
            ddlFathersOccupation.SelectedValue = BasicInfo.FathersOccupation
            txtMotherName.Text = BasicInfo.MotherName
            ddlMotherOccupation.SelectedValue = BasicInfo.MothersOccupation
            txtSpouseName.Text = BasicInfo.SpouseName
            ddlSpouseOccupation.SelectedValue = BasicInfo.SpouseOccupation
            txtNoChildren.Text = BasicInfo.NoOfChildrenAge
            txtSibblingsInfo.Text = BasicInfo.SibblingsNameOccupation
            rdbtnGender.SelectedValue = BasicInfo.Gender
            txtNID.Text = BasicInfo.NIDNo
            ddlNationality.SelectedValue = BasicInfo.Nationality
            ddlReligion.SelectedValue = BasicInfo.Religion
            txtPreAdd.Text = BasicInfo.PresentAddress
            ddlPreDistrict.SelectedValue = BasicInfo.PreDistrict
            ddlPreThana.SelectedValue = BasicInfo.PreThana
            txtPerAddress.Text = BasicInfo.PermanentAddress
            ddlperDistrict.SelectedValue = BasicInfo.PerDistrict
            ddlPerThana.SelectedValue = BasicInfo.PerThana
            txtMobileNumber.Text = BasicInfo.MobileNumber
            txtAlEmail.Text = BasicInfo.AltEMail

            ddlRelStatus.SelectedValue = BasicInfo.RelationshipStatus

            ddlBloodGrp.SelectedValue = BasicInfo.BloodGroupID


            imgValidation.ImageUrl = "~/Attachments/" + BasicInfo.Attachment

            imgSignature.ImageUrl = "~/Attachments/" + BasicInfo.Signature

            hpAttachment.NavigateUrl = "~/attachments/" & BasicInfo.Attachment

            hpSignature.NavigateUrl = "~/attachments/" & BasicInfo.Signature


            If BasicInfo.Attachment = "" Then
                imgValidation.ImageUrl = "~/Attachments/female_avatar.png"
            End If
            If BasicInfo.Signature = "" Then
                imgSignature.ImageUrl = "~/Attachments/signature.jpg"
            End If


        End If

    End Sub

    Protected Sub ShowOccupationList()
        ddlFathersOccupation.DataTextField = "OccupationName"
        ddlFathersOccupation.DataValueField = "OccupationID"
        ddlFathersOccupation.DataSource = BasicDataAccess.fnGetOccupationList()
        ddlFathersOccupation.DataBind()

        ddlMotherOccupation.DataTextField = "OccupationName"
        ddlMotherOccupation.DataValueField = "OccupationID"
        ddlMotherOccupation.DataSource = BasicDataAccess.fnGetOccupationList()
        ddlMotherOccupation.DataBind()

        ddlSpouseOccupation.DataTextField = "OccupationName"
        ddlSpouseOccupation.DataValueField = "OccupationID"
        ddlSpouseOccupation.DataSource = BasicDataAccess.fnGetOccupationList()
        ddlSpouseOccupation.DataBind()
    End Sub

    Protected Sub ClearBasicInfo()
        txtFatherName.Text = ""
        txtMotherName.Text = ""
        txtSpouseName.Text = ""
        rdbtnGender.SelectedIndex = -1
        txtNID.Text = ""
        ddlNationality.SelectedIndex = -1
        ddlReligion.SelectedIndex = -1
        txtPreAdd.Text = ""
        txtPerAddress.Text = ""
        txtMobileNumber.Text = ""
        txtAlEmail.Text = ""
        txtEmail.Text = ""
        ddlBloodGrp.SelectedIndex = -1
        ddlRelStatus.SelectedIndex = -1
        ddlFathersOccupation.SelectedIndex = 0
        ddlSpouseOccupation.SelectedIndex = 0
        ddlMotherOccupation.SelectedIndex = 0
    End Sub

    Protected Sub ddlRelStatus_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlRelStatus.SelectedIndexChanged
        If ddlRelStatus.Items.Count > 0 Then

            If ddlRelStatus.SelectedItem.Text = "Single" Then
                txtSpouseName.Enabled = False
                ddlSpouseOccupation.Enabled = False
                txtSpouseName.Text = ""
                ddlSpouseOccupation.SelectedIndex = 0
            Else
                txtSpouseName.Enabled = True
                ddlSpouseOccupation.Enabled = True
            End If

        End If
    End Sub

    Protected Sub ShowPrevUploadedDocumentInfo(ByVal UniqueUserID As String)

        Dim dt As DataTable = DocumentListData.fnGetUserDocuments(UniqueUserID).Tables(0)
        Session("UserDocuments") = dt

        grdDocumentList.Caption = "::Uploaded Documents::"
        grdDocumentList.DataSource = dt
        grdDocumentList.DataBind()

        GetRemainingMandatoryDocuments()
        ClearDocumentsInformation()
    End Sub

    Protected Sub btnNewDocumentType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNewDocumentType.Click

        Dim DocumentType As clsDocumentType = New clsDocumentType()

        If btnNewDocumentType.Text = "..." Then
            btnNewDocumentType.Text = "Insert"
            lblNewDocumentType.Visible = True
            btnNewDocumentType.ValidationGroup = "DocType"
            btnCancelInsertNewDocumentType.Visible = True
        Else
            If txtNewDocumentType.Text = "" Then
                MessageBox("InPut Document Type")
            Else

                If chkDocumentTypeIsMandatory.Checked = True Then
                    DocumentType.IsMandatory = True
                Else
                    DocumentType.IsMandatory = False
                End If

                DocumentType.DocumentType = txtNewDocumentType.Text
                DocumentType.IsActive = True
                DocumentType.EntryBy = Session("LoginUserID")

                Dim check As Integer = DocumentData.fnInsertDocumentType(DocumentType)

                If check = 1 Then
                    MessageBox("Inserted Successfully.")
                    ShowDocumentType()
                    txtNewDocumentType.Text = ""
                    lblNewDocumentType.Visible = False
                    btnNewDocumentType.Text = "..."
                    btnNewDocumentType.ValidationGroup = ""
                Else
                    MessageBox("Error Found.")
                End If

            End If

        End If
    End Sub

    Protected Sub btnCancelInsertNewDocumentType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelInsertNewDocumentType.Click
        btnNewDocumentType.Text = "..."
        lblNewDocumentType.Visible = False
        btnCancelInsertNewDocumentType.Visible = False
    End Sub

    Protected Sub btnUploadDocument_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUploadDocument.Click
        Try
            hdFldChangeMadeToDocumentUploads.Value = "True"

            Dim dt As DataTable = GetUserDocumentData()
            Session("UserDocuments") = dt

            grdDocumentList.Caption = "::Uploaded Documents::"
            grdDocumentList.DataSource = dt
            grdDocumentList.DataBind()

            GetRemainingMandatoryDocuments()
            ClearDocumentsInformation()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Function GetUserDocumentData() As DataTable

        Dim folder As String = ""
        Dim Title As String = ""
        Dim DocExt As String = ""
        Dim DocFullName As String = ""
        Dim DocPrefix As String = ""
        Dim FileSize As Integer = 0
        Dim DocFileName As String = ""
        If flupDocuments.HasFile Then

            folder = Server.MapPath("~/Attachments/")

            Title = txtDocumentName.Text

            Title = Replace(Title, ".", "")

            FileSize = flupDocuments.PostedFile.ContentLength()
            If FileSize > 512000 Then
                MessageBox("File size should be within 500KB")
                Return Nothing
            End If

            DocPrefix = Title.Replace(" ", "")

            DocExt = System.IO.Path.GetExtension(flupDocuments.FileName)
            DocFileName = "Doc_" & DateTime.Now.ToString("ddMMyyHHmmss") & "_" & DocPrefix & DocExt
            DocFullName = folder & DocFileName
            flupDocuments.SaveAs(DocFullName)

            Dim dtUserDocuments As DataTable = New DataTable()
            dtUserDocuments = Session("UserDocuments")

            Dim dr As DataRow
            dr = dtUserDocuments.NewRow()
            dr("DocTypeID") = drpDocumentType.SelectedValue
            dr("DocTypeName") = drpDocumentType.SelectedItem
            dr("DocumentName") = txtDocumentName.Text
            dr("FileName") = DocFileName 'flupDocuments.PostedFile.FileName

            dtUserDocuments.Rows.Add(dr)
            dtUserDocuments.AcceptChanges()

            Return dtUserDocuments

        Else
            MessageBox("Select A Document To Upload.")
            Return Nothing
        End If

    End Function

    Protected Sub btnUploadDocumentRefresh_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUploadDocumentRefresh.Click
        txtDocumentName.Text = ""
        drpDocumentType.SelectedIndex = -1
        lblNewDocumentType.Visible = False
        btnNewDocumentType.Text = "..."
        chkDocumentTypeIsMandatory.Checked = False
    End Sub

    Protected Sub GetRemainingMandatoryDocuments()
        Try
            grdRemainingDocuments.DataSource = ""
            grdRemainingDocuments.DataBind()

            Dim lblDocs As System.Web.UI.WebControls.Label = New Label
            Dim DocTypeIDStr As String = ""
            For Each row As GridViewRow In grdDocumentList.Rows
                lblDocs = row.FindControl("lblDocTypeID")
                DocTypeIDStr = DocTypeIDStr + "|" + lblDocs.Text + "|"
            Next

            grdRemainingDocuments.Caption = "::Remaining Mandatory Documents::"
            grdRemainingDocuments.DataSource = DocumentListData.fnGetRemainingMandatoryDocuments(DocTypeIDStr)
            grdRemainingDocuments.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ClearDocumentsInformation()
        txtDocumentName.Text = ""
        drpDocumentType.SelectedIndex = -1
    End Sub

    Protected Sub ShowDocumentType()
        drpDocumentType.DataTextField = "DocumentType"
        drpDocumentType.DataValueField = "DocTypeID"
        drpDocumentType.DataSource = DocumentData.fnShowDocumentType("Employee")
        drpDocumentType.DataBind()
    End Sub

    Protected Sub grdDocumentList_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grdDocumentList.RowDeleting
        hdFldChangeMadeToDocumentUploads.Value = "True"

        Dim i As Integer
        Dim dtUserDocuments As DataTable = New DataTable()

        dtUserDocuments = Session("UserDocuments")

        i = e.RowIndex

        dtUserDocuments.Rows(i).Delete()
        dtUserDocuments.AcceptChanges()
        grdDocumentList.DataSource = dtUserDocuments
        grdDocumentList.DataBind()

        Session("UserDocuments") = dtUserDocuments
        GetRemainingMandatoryDocuments()
    End Sub

    Protected Sub chkSamePreAdd_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkSamePreAdd.CheckedChanged
        If chkSamePreAdd.Checked = True Then
            txtPerAddress.Text = txtPreAdd.Text
            ddlperDistrict.SelectedValue = ddlPreDistrict.SelectedValue
            ddlPerThana.DataSourceID = "dsPerUpazilaName"
            ddlPerThana.DataBind()
            ddlPerThana.SelectedValue = ddlPreThana.SelectedValue
        Else
            txtPerAddress.Text = ""
            ddlperDistrict.SelectedIndex = 0
            ddlPerThana.SelectedIndex = 0
        End If
    End Sub

    Protected Sub txtPreAdd_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtPreAdd.TextChanged
        chkSamePreAdd.Checked = False
    End Sub

    Protected Sub ddlPreDistrict_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlPreDistrict.SelectedIndexChanged
        chkSamePreAdd.Checked = False
    End Sub

    Protected Sub ddlPreThana_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlPreThana.SelectedIndexChanged
        chkSamePreAdd.Checked = False
    End Sub
End Class
