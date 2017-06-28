Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.OleDb
Imports System.Data.Common
Imports System.IO
Imports System.Math
Imports System.Configuration
Imports System.Web.UI
Partial Class CandidateReferenceInfo
    Inherits System.Web.UI.Page
    Dim EducationInformation As New clsCanEduDataAccess()


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UserName") = "" Or Session("UniqueUserID") = "" Then
            Response.Redirect("~/frmHRMLogin.aspx")
        End If
        If Not IsPostBack Then

            Dim Secmsg As String = Request.QueryString("msg")

            If Secmsg <> 1 Then
                Session("Message") = ""
            End If

            Dim lblMessage As String

            lblMessage = Session("Message")


            If lblMessage <> "" Then
                lblRedirectMsg.Text = lblMessage
            End If

            ddlRelationShipWith.DataBind()
            dsRelationShipWith.DataBind()
            ddlRelationShipWith.Items.Insert(0, "-Select-")

            Dim UserID As String
            Dim Message As String = ""
            Dim msg As String = ""
            Dim UserName As String
            UserID = Session("LoginUserID")
            UserName = Session("UserName")

            Dim RegistrationID As String
            RegistrationID = Session("RegistrationID")

            Dim CandidateID As String
            CandidateID = Session("CandidateID")

            Dim Status As Boolean = clsCanBasicDataAccess.PresentStatus(CandidateID)

            If Status = True Then
                'btnAddRef.Enabled = False
            End If


            Dim CanCount As Integer = Common.CandidateCount(RegistrationID)

            If CanCount = 0 Then
                'msg = "Please Insert Basic Information First"
                'Response.Redirect("HRMCandidateBasicInfo.aspx?Message=" + msg)
                Session("Message") = "Please Insert Basic Information First"
                Response.Redirect("HRMCandidateBasicInfo.aspx?msg=1")
            End If


            Dim YearOfExp As Double

            Dim YrExp As Double = EducationInformation.CandidateExperirnce(CandidateID, YearOfExp)

            If YrExp <> 0 Then
                Dim CanExpCount As Integer = Common.CandidateExperienceCount(CandidateID)

                If CanExpCount = 0 Then
                    Session("Message") = "Please Insert Experience Information as You Have Experience"
                    Response.Redirect("CandidateExperienceInfo.aspx?msg=1")
                End If
            End If


            Dim CanEduCount As Integer = Common.CandidateEducationCount(CandidateID)

            If CanEduCount = 0 Then
                Session("Message") = "Please Insert Education Information"
                Response.Redirect("CandidateEducationInfo.aspx?msg=1")
            End If


            btnSave.Enabled = False


            Dim dtReferenceInfo As DataTable = New DataTable()
            dtReferenceInfo = FormatReferenceInfo()
            Session("CandidateReferenceInfo") = dtReferenceInfo




            Dim count As Integer = Common.CandidateCount(RegistrationID)

            If count = 0 Then
                Exit Sub
            Else
                dtReferenceInfo = EducationInformation.fnGetReferenceInformation(CandidateID).Tables(0)
                grdReference.DataSource = dtReferenceInfo
                grdReference.DataBind()
                Session("CandidateReferenceInfo") = dtReferenceInfo

            End If


        End If
    End Sub
    Protected Function FormatReferenceInfo() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("Name", System.Type.GetType("System.String"))
        dt.Columns.Add("Designation", System.Type.GetType("System.String"))
        dt.Columns.Add("OrganizationName", System.Type.GetType("System.String"))
        dt.Columns.Add("RefRelationID", System.Type.GetType("System.String"))
        dt.Columns.Add("RefRelationName", System.Type.GetType("System.String"))
        dt.Columns.Add("Address", System.Type.GetType("System.String"))
        dt.Columns.Add("MobileNo", System.Type.GetType("System.String"))
        dt.Columns.Add("Email", System.Type.GetType("System.String"))
        Return dt
    End Function

    Protected Sub btnAddRef_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddRef.Click
        Try
            Dim CandidateReference As New clsCanRef()

            CandidateReference.Name = Common.CheckAsciiValue(txtName1.Text)
            CandidateReference.Designation = Common.CheckAsciiValue(txtDesignation.Text)
            CandidateReference.OrganizationName = Common.CheckAsciiValue(txtOrganizationName1.Text)
            If ddlRelationShipWith.SelectedValue = "-Select-" Then
                MessageBox("Please Select Relationship Type")
                Exit Sub
            Else
                CandidateReference.RefRelationID = ddlRelationShipWith.SelectedValue
            End If
            CandidateReference.RefRelationName = ddlRelationShipWith.SelectedItem.ToString()
            CandidateReference.Address = Common.CheckAsciiValue(txtAddress1.Text)
            CandidateReference.MobileNo = txtMobile1.Text
            CandidateReference.Email = txtEmail1.Text


            Dim dt As DataTable = GetReferenceData(CandidateReference)
            Session("CandidateReferenceInfo") = dt

            grdReference.DataSource = dt
            grdReference.DataBind()
            ClearReferenceData()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Function GetReferenceData(ByVal CandidateReference As clsCanRef) As DataTable

        Dim dtReferenceInfo = Session("CandidateReferenceInfo")

        Dim dr As DataRow
        dr = dtReferenceInfo.NewRow()
        dr("Name") = CandidateReference.Name
        dr("Designation") = CandidateReference.Designation
        dr("OrganizationName") = CandidateReference.OrganizationName
        dr("RefRelationID") = CandidateReference.RefRelationID
        dr("RefRelationName") = CandidateReference.RefRelationName
        dr("Address") = CandidateReference.Address
        dr("MobileNo") = CandidateReference.MobileNo
        dr("Email") = CandidateReference.Email

        dtReferenceInfo.Rows.Add(dr)
        dtReferenceInfo.AcceptChanges()
        btnSave.Enabled = True
        Return dtReferenceInfo

    End Function

    Protected Sub ClearReferenceData()
        txtName1.Text = ""
        txtDesignation.Text = ""
        txtOrganizationName1.Text = ""
        ddlRelationShipWith.SelectedIndex = -1
        txtAddress1.Text = ""
        txtMobile1.Text = ""
        txtEmail1.Text = ""
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        Dim UserID As String
        UserID = Session("LoginUserID")

        Dim RegistrationID As String
        RegistrationID = Session("RegistrationID")

        Dim CandidateID = Session("CandidateID")


        Dim CandidateReferenceInfo As String = ""
        Dim isReferenceParts As String = ""

        Dim dtReferenceInfo As DataTable = New DataTable()
        dtReferenceInfo = Session("CandidateReferenceInfo")

        Dim RefInfo As New clsCanRef()
        For Each rw As DataRow In dtReferenceInfo.Rows
            RefInfo.Name = rw.Item("Name")
            RefInfo.Designation = rw.Item("Designation")
            RefInfo.OrganizationName = rw.Item("OrganizationName")
            RefInfo.RefRelationID = rw.Item("RefRelationID")
            RefInfo.Address = rw.Item("Address")
            RefInfo.MobileNo = rw.Item("MobileNo")
            RefInfo.Email = rw.Item("Email")

            isReferenceParts = isReferenceParts & RefInfo.Name & "~" & RefInfo.Designation & "~" & RefInfo.OrganizationName & "~" & RefInfo.RefRelationID & "~" & RefInfo.Address & "~" & RefInfo.MobileNo & "~" & RefInfo.Email & "~|"
        Next


        Dim count As Integer = clsCanEduDataAccess.CandidateCount(RegistrationID)
        If count = 0 Then
            MessageBox("Insert Basic Information first")
            grdReference.DataSource = ""
            grdReference.DataBind()
            Exit Sub
        End If

        Dim Check As Integer = clsCanEduDataAccess.SubmitRefInformation(CandidateID, isReferenceParts)
        If Check = 1 Then
            MessageBox("Inserted Successfully")
            btnSave.Enabled = False
        Else
            MessageBox("Error Found.")
        End If

    End Sub

    Protected Sub grdReference_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grdReference.RowDeleting
        btnSave.Enabled = True
        Dim i As Integer
        Dim dtReferenceInfo As DataTable = New DataTable()

        dtReferenceInfo = Session("CandidateReferenceInfo")

        i = e.RowIndex

        dtReferenceInfo.Rows(i).Delete()
        dtReferenceInfo.AcceptChanges()
        grdReference.DataSource = dtReferenceInfo
        grdReference.DataBind()

        Dim CandidateID As String
        CandidateID = Session("CandidateID")

        Dim Status As Boolean = clsCanBasicDataAccess.PresentStatus(CandidateID)

        If Status = True Then
            btnSave.Enabled = False
        End If



        If dtReferenceInfo.Rows.Count = 0 Then
            btnSave.Enabled = False
        End If
    End Sub

    
    'Protected Sub btnNextPage_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnNextPage.Click
    '    Dim CandidateID As String = ""
    '    Dim Message As String = ""
    '    Dim msg As String = ""
    '    CandidateID = Session("CandidateID")

    '    Dim CanRefCount As Integer = Common.CandidateReferenceCount(CandidateID)

    '    If CanRefCount = 0 Or CanRefCount = 1 Then
    '        msg = "Please Insert at least two Reference"
    '        Response.Redirect("CandidateReferenceInfo.aspx?Message=" + msg)
    '    End If
    'End Sub
End Class
