Imports System.Data
Partial Class JD_frmInputJD
    Inherits System.Web.UI.Page
    Dim JDData As New clsJobDescriptionDataAccess()
    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        Dim UserID As String = ""
        UserID = Session("EmployeeID")

        Dim JD As New clsJobDescription()

        JD.JobDescriptionNo = txtJDNo.Text
        JD.JobTitle = txtJobTitle.Text

        JD.LastModifiedDate = dtModifiedDate.Text
        JD.JDGoal = txtJDGoal.Text

        If grdKeyRes.Rows.Count <= 0 Then
            MessageBox("Please select at least one Key Responsibility")
            Exit Sub
        End If

        Dim KeyResponsibility As String = ""
        Dim KeyResponsibilityParts As String = ""

        Dim dtKeyResponsibilities As DataTable = New DataTable()
        dtKeyResponsibilities = Session("KeyResponsibilities")

        Dim KeyRes As New clsKeyResponsibility()
        For Each rw As DataRow In dtKeyResponsibilities.Rows
            KeyRes.KeyResTypeID = rw.Item("KeyResTypeID")
            KeyRes.JobDetail = rw.Item("JobDetail")

            KeyResponsibilityParts = KeyResponsibilityParts & KeyRes.KeyResTypeID & "~" & KeyRes.JobDetail & "~|"
        Next


        Dim Exception As String = ""
        Dim ExceptionParts As String = ""

        Dim dtException As DataTable = New DataTable()
        dtException = Session("Exception")

        Dim VarException As String = ""

        For Each rw As DataRow In dtException.Rows
            VarException = rw.Item("ExceptionDetail")

            ExceptionParts = ExceptionParts & VarException & "~|"
        Next


        Dim KPI As String = ""
        Dim KPIParts As String = ""

        Dim dtKPI As DataTable = New DataTable()
        dtKPI = Session("KeyPerformanceIndicator")

        Dim VarKPI As String = ""

        For Each rw As DataRow In dtKPI.Rows
            VarKPI = rw.Item("KPIDetail")

            KPIParts = KPIParts & VarKPI & "~|"
        Next




        Dim JDID As String = JDData.fnInsertJobDescription(JD, Session("LoginUserID"), KeyResponsibilityParts, ExceptionParts, KPIParts)


        If JDID <> "" Then
            MessageBox("Inserted Successfully")
            grdJobDescription.DataSource = JDData.fnGetJobDescriptionInfo()
            grdJobDescription.DataBind()
            ClearJobDescriptionData()

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


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            lblKeyResAdd.Visible = False

            Dim dtKeyResponsibilities As DataTable = New DataTable()
            dtKeyResponsibilities = FormatKeyResponsibilities()
            Session("KeyResponsibilities") = dtKeyResponsibilities


            Dim dtException As DataTable = New DataTable()
            dtException = FormatException()
            Session("Exception") = dtException

            Dim dtKPI As DataTable = New DataTable()
            dtKPI = FormatKPI()
            Session("KeyPerformanceIndicator") = dtKPI

            grdJobDescription.DataSource = JDData.fnGetJobDescriptionInfo()
            grdJobDescription.DataBind()

            ShowKeyResList()


        End If
    End Sub

    Protected Function FormatKeyResponsibilities() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("KeyResTypeID", System.Type.GetType("System.String"))
        dt.Columns.Add("KeyResponsibilityTypeName", System.Type.GetType("System.String"))
        dt.Columns.Add("JobDetail", System.Type.GetType("System.String"))
        Return dt
    End Function

    Protected Function FormatException() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("ExceptionDetail", System.Type.GetType("System.String"))
        Return dt
    End Function

    Protected Function FormatKPI() As DataTable
        Dim dt As DataTable = New DataTable()
        dt.Columns.Add("KPIDetail", System.Type.GetType("System.String"))
        Return dt
    End Function

    Protected Sub btnAddKeyRespons_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddKeyRespons.Click
        Try

            Dim KeyResponsibility As New clsKeyResponsibility()

            If ddlKeyRes.SelectedValue = "" Then
                Exit Sub
            End If

            KeyResponsibility.KeyResTypeID = ddlKeyRes.SelectedValue
            KeyResponsibility.KeyResponsibilityTypeName = ddlKeyRes.SelectedItem.ToString()
            KeyResponsibility.JobDetail = txtDetail.Text

            Dim dt As DataTable = GetKeyResponsData(KeyResponsibility)
            Session("KeyResponsibilities") = dt

            grdKeyRes.DataSource = dt
            grdKeyRes.DataBind()
            ClearKeyResponsibilities()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub
    Protected Function GetKeyResponsData(ByVal KeyResponsibility As clsKeyResponsibility) As DataTable

        Dim dtKeyResponsibilities = Session("KeyResponsibilities")

        Dim dr As DataRow
        dr = dtKeyResponsibilities.NewRow()
        dr("KeyResTypeID") = KeyResponsibility.KeyResTypeID
        dr("KeyResponsibilityTypeName") = KeyResponsibility.KeyResponsibilityTypeName
        dr("JobDetail") = KeyResponsibility.JobDetail

        dtKeyResponsibilities.Rows.Add(dr)
        dtKeyResponsibilities.AcceptChanges()

        Return dtKeyResponsibilities

    End Function

    Protected Sub ClearKeyResponsibilities()
        ddlKeyRes.SelectedIndex = -1
        txtDetail.Text = ""
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        lblKeyResAdd.Visible = False
        btnKeyRes.Text = "ADD"
    End Sub

    Protected Sub grdKeyRes_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grdKeyRes.RowDeleting
        Dim i As Integer
        Dim dtKeyResponsibilities As DataTable = New DataTable()

        dtKeyResponsibilities = Session("KeyResponsibilities")

        i = e.RowIndex

        dtKeyResponsibilities.Rows(i).Delete()
        dtKeyResponsibilities.AcceptChanges()
        grdKeyRes.DataSource = dtKeyResponsibilities
        grdKeyRes.DataBind()

    End Sub

    Protected Sub btnKeyRes_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnKeyRes.Click
        Dim UserID As String
        UserID = Session("LoginUserID")

        If btnKeyRes.Text = "ADD" Then
            lblKeyResAdd.Visible = True
            btnKeyRes.Text = "Insert"
        Else
            Dim KeyResName As String
            Dim EntryBy As String
            Dim IsActive As Integer

            'idAddIns.Visible = False

            KeyResName = txtKeyRes.Text
            EntryBy = UserID

            If KeyResName = "" Then
                Exit Sub
            End If


            Dim check As Integer = JDData.AddkyRes(KeyResName, 1, EntryBy)

            If check = 1 Then
                MessageBox("Inserted")
                txtKeyRes.Text = ""
                ShowKeyResList()
                lblKeyResAdd.Visible = False
                btnKeyRes.Text = "ADD"
            Else
                MessageBox("Error Found")
            End If
        End If
    End Sub

    Protected Sub ShowKeyResList()
        ddlKeyRes.DataTextField = "KeyResponsibilityTypeName"
        ddlKeyRes.DataValueField = "KeyResTypeID"
        ddlKeyRes.DataSource = JDData.fnGetKeyResList()
        ddlKeyRes.DataBind()
    End Sub

    Protected Sub btnAddException_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddException.Click
        Try

            Dim ExceptionDetail As String

            ExceptionDetail = txtException.Text

            Dim dt As DataTable = GetExceptionData(ExceptionDetail)
            Session("Exception") = dt

            grdException.DataSource = dt
            grdException.DataBind()
            ClearExceptionData()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Function GetExceptionData(ByVal ExceptionDetail As String) As DataTable

        Dim dtException = Session("Exception")

        Dim dr As DataRow
        dr = dtException.NewRow()
        dr("ExceptionDetail") = ExceptionDetail

        dtException.Rows.Add(dr)
        dtException.AcceptChanges()

        Return dtException

    End Function

    Protected Sub ClearExceptionData()
        txtException.Text = ""
    End Sub

    Protected Sub grdException_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grdException.RowDeleting
        Dim i As Integer
        Dim dtException As DataTable = New DataTable()

        dtException = Session("Exception")

        i = e.RowIndex

        dtException.Rows(i).Delete()
        dtException.AcceptChanges()
        grdException.DataSource = dtException
        grdException.DataBind()

    End Sub

    Protected Sub btnKPI_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnKPI.Click
        Try

            Dim KPIDetail As String

            KPIDetail = txtKPIDetail.Text

            Dim dt As DataTable = GetKPIData(KPIDetail)
            Session("KeyPerformanceIndicator") = dt

            grdKPI.DataSource = dt
            grdKPI.DataBind()
            ClearKPIData()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Function GetKPIData(ByVal KPIDetail As String) As DataTable

        Dim dtKPI = Session("KeyPerformanceIndicator")

        Dim dr As DataRow
        dr = dtKPI.NewRow()
        dr("KPIDetail") = KPIDetail

        dtKPI.Rows.Add(dr)
        dtKPI.AcceptChanges()

        Return dtKPI

    End Function

    Protected Sub ClearKPIData()
        txtKPIDetail.Text = ""
    End Sub

    Protected Sub grdKPI_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grdKPI.RowDeleting
        Dim i As Integer
        Dim dtKPI As DataTable = New DataTable()

        dtKPI = Session("KeyPerformanceIndicator")

        i = e.RowIndex

        dtKPI.Rows(i).Delete()
        dtKPI.AcceptChanges()
        grdKPI.DataSource = dtKPI
        grdKPI.DataBind()
    End Sub

    Protected Sub grdJobDescription_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdJobDescription.SelectedIndexChanged
        Dim lblJobDescriptionID As New System.Web.UI.WebControls.Label()
        Dim JDID As String
        lblJobDescriptionID = grdJobDescription.SelectedRow.FindControl("lblJobDescriptionID")

        JDID = Convert.ToString(lblJobDescriptionID.Text)
        Dim JobDescription As New clsJobDescription()

        JobDescription = JDData.fnGetJobDescriptionByID(JDID)

        txtJDNo.Text = JobDescription.JobDescriptionNo
        txtJobTitle.Text = JobDescription.JobTitle
        txtJDGoal.Text = JobDescription.JDGoal

        If JobDescription.LastModifiedDate = "1/1/1911" Then
            dtModifiedDate.Text = ""
        Else
            dtModifiedDate.Text = JobDescription.LastModifiedDate
        End If



        Dim dtKeyResponsibilities As DataTable = New DataTable()

        dtKeyResponsibilities = JDData.fnGetKeyResponsibility(JDID).Tables(0)
        grdKeyRes.DataSource = dtKeyResponsibilities
        grdKeyRes.DataBind()
        Session("KeyResponsibilities") = dtKeyResponsibilities


        Dim dtException As DataTable = New DataTable()

        dtException = JDData.fnGetException(JDID).Tables(0)
        grdException.DataSource = dtException
        grdException.DataBind()
        Session("Exception") = dtException


        Dim dtKPI As DataTable = New DataTable()

        dtKPI = JDData.fnGetKPI(JDID).Tables(0)
        grdKPI.DataSource = dtKPI
        grdKPI.DataBind()
        Session("KeyPerformanceIndicator") = dtKPI



        btnSave.Visible = False
        btnUpdate.Visible = True

    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Dim lblJobDescriptionID As New System.Web.UI.WebControls.Label()
        Dim JDIDForSelection As String
        lblJobDescriptionID = grdJobDescription.SelectedRow.FindControl("lblJobDescriptionID")

        JDIDForSelection = Convert.ToString(lblJobDescriptionID.Text)


        Dim UserID As String = ""
        UserID = Session("EmployeeID")

        Dim JD As New clsJobDescription()

        JD.JobDescriptionNo = txtJDNo.Text
        JD.JobTitle = txtJobTitle.Text
        JD.LastModifiedDate = dtModifiedDate.Text
        JD.JDGoal = txtJDGoal.Text

        If grdKeyRes.Rows.Count <= 0 Then
            MessageBox("Please select at least one Key Responsibility")
            Exit Sub
        End If

        Dim KeyResponsibility As String = ""
        Dim KeyResponsibilityParts As String = ""

        Dim dtKeyResponsibilities As DataTable = New DataTable()
        dtKeyResponsibilities = Session("KeyResponsibilities")

        Dim KeyRes As New clsKeyResponsibility()
        For Each rw As DataRow In dtKeyResponsibilities.Rows
            KeyRes.KeyResTypeID = rw.Item("KeyResTypeID")
            KeyRes.JobDetail = rw.Item("JobDetail")

            KeyResponsibilityParts = KeyResponsibilityParts & KeyRes.KeyResTypeID & "~" & KeyRes.JobDetail & "~|"
        Next


        Dim Exception As String = ""
        Dim ExceptionParts As String = ""

        Dim dtException As DataTable = New DataTable()
        dtException = Session("Exception")

        Dim VarException As String = ""

        For Each rw As DataRow In dtException.Rows
            VarException = rw.Item("ExceptionDetail")

            ExceptionParts = ExceptionParts & VarException & "~|"
        Next


        Dim KPI As String = ""
        Dim KPIParts As String = ""

        Dim dtKPI As DataTable = New DataTable()
        dtKPI = Session("KeyPerformanceIndicator")

        Dim VarKPI As String = ""

        For Each rw As DataRow In dtKPI.Rows
            VarKPI = rw.Item("KPIDetail")

            KPIParts = KPIParts & VarKPI & "~|"
        Next

        Dim ID As String = JDData.fnUpdateJobDescription(JDIDForSelection, JD, KeyResponsibilityParts, ExceptionParts, KPIParts)

        If ID <> "" Then
            MessageBox("Updated Successfully")
            grdJobDescription.DataSource = JDData.fnGetJobDescriptionInfo()
            grdJobDescription.DataBind()
            ClearJobDescriptionData()

        Else
            MessageBox("Error Found.")
        End If
    End Sub

    Protected Sub btnCancelSelection_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelSelection.Click
        ClearJobDescriptionData()
    End Sub

    Protected Sub ClearJobDescriptionData()
        txtJDNo.Text = ""
        txtJDGoal.Text = ""
        txtJobTitle.Text = ""
        dtModifiedDate.Text = ""

        ClearKeyResponsibilities()
        ClearExceptionData()
        ClearKPIData()

        Dim dtKeyResponsibilities As DataTable = New DataTable()
        dtKeyResponsibilities = FormatKeyResponsibilities()
        grdKeyRes.DataSource = dtKeyResponsibilities
        grdKeyRes.DataBind()

        Dim dtException As DataTable = New DataTable()
        dtException = FormatException()
        grdException.DataSource = dtException
        grdException.DataBind()

        Dim dtKPI As DataTable = New DataTable()
        dtKPI = FormatKPI()
        grdKPI.DataSource = dtKPI
        grdKPI.DataBind()

        btnSave.Visible = True
        btnUpdate.Visible = False
    End Sub



End Class
