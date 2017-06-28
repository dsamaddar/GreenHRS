
Partial Class frmProfessionalRecords
    Inherits System.Web.UI.Page

    Dim ProfRecType As New clsProfRecordTypeDataAccess()
    Dim ProfRec As New clsProfRecordDataAccess()
    Dim EmpInfoData As New clsEmployeeInfoDataAccess()
  
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetAvailableProfRecType()
            GetActiveProfRecType()
            btnUpdateProfRecType.Enabled = False
            btnSubmit.Enabled = False
        End If
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        If drpSelectRecordType.SelectedValue = "N\A" Then
            MessageBox("Select A Professional Recort Type.")
            Exit Sub
        End If

        If grdSearchEmp.Rows.Count = 0 Then
            MessageBox("Select An Employee First.")
        End If

        Try
            Dim lblEmployeeID As New Label
            lblEmployeeID = grdSearchEmp.SelectedRow.FindControl("lblEmployeeID")
            ProfRec.EmployeeID = lblEmployeeID.Text
            ProfRec.ProfRecordTypeID = drpSelectRecordType.SelectedValue
            ProfRec.EffectiveDate = Convert.ToDateTime(txtEffectiveDate.Text)
            ProfRec.RecordDetails = txtRemarks.Text
            ProfRec.EntryBy = Session("LoginUserID")

            Dim Check As Integer = ProfRec.fnInsertProfRecord(ProfRec)
            If Check = 1 Then
                ShowProfRecordByEmp(lblEmployeeID.Text)
                ClearProfRec()
                MessageBox("Professional Record Inserted.")
            End If

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
       
    End Sub

    Protected Sub ClearProfRec()
        txtEffectiveDate.Text = ""
        txtRemarks.Text = ""
        drpSelectRecordType.SelectedIndex = -1
    End Sub

    Protected Sub btnInsertRecType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertRecType.Click
        Try
            If rdbtnFavor.SelectedIndex = -1 Then
                MessageBox("Select Record Category.")
                Exit Sub
            End If
            If Trim(txtRecordType.Text) = "" Then
                MessageBox("Input Record Type")
                Exit Sub
            End If

            ProfRecType.Category = rdbtnFavor.SelectedValue
            ProfRecType.ProfRecordType = txtRecordType.Text

            If chkIsActive.Checked = True Then
                ProfRecType.IsActive = True
            Else
                ProfRecType.IsActive = True
            End If

            ProfRecType.EntryBy = Session("LoginUserID")

            Dim Check As Integer = ProfRecType.fnInsertProfRecordType(ProfRecType)

            If Check = 1 Then
                MessageBox("Professional Record Type Inserted.")
                ClearProfRecType()
                GetAvailableProfRecType()
            Else
                MessageBox("Error Found")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnUpdateProfRecType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateProfRecType.Click
        Try
            If hdFldProfRecTypeID.Value = "" Then
                MessageBox("Select A Professional Record First.")
                Exit Sub
            End If

            ProfRecType.ProfRecordTypeID = hdFldProfRecTypeID.Value
            ProfRecType.Category = rdbtnFavor.SelectedValue
            ProfRecType.ProfRecordType = txtRecordType.Text
            If chkIsActive.Checked = True Then
                ProfRecType.IsActive = True
            Else
                ProfRecType.IsActive = False
            End If

            ProfRecType.EntryBy = Session("LoginUserID")

            Dim Check As Integer = ProfRecType.fnUpdateProfRecordType(ProfRecType)

            If Check = 1 Then
                MessageBox("Professional Record Type Updated.")
                ClearProfRecType()
                GetAvailableProfRecType()
            Else
                MessageBox("Error Found")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ClearProfRecType()
        rdbtnFavor.SelectedIndex = -1
        chkIsActive.Checked = False
        txtRecordType.Text = ""
        hdFldProfRecTypeID.Value = ""
        btnInsertRecType.Enabled = True
        btnUpdateProfRecType.Enabled = False
    End Sub

    Protected Sub GetAvailableProfRecType()
        drpAvailableRecType.DataTextField = "ProfRecordType"
        drpAvailableRecType.DataValueField = "ProfRecordTypeID"
        drpAvailableRecType.DataSource = ProfRecType.fnGetProfRecordTypesAll()
        drpAvailableRecType.DataBind()

        Dim A As New ListItem
        A.Text = "-- Available Record Types --"
        A.Value = "N\A"

        drpAvailableRecType.Items.Insert(0, A)
    End Sub

    Protected Sub GetActiveProfRecType()
        drpSelectRecordType.DataTextField = "ProfRecordType"
        drpSelectRecordType.DataValueField = "ProfRecordTypeID"
        drpSelectRecordType.DataSource = ProfRecType.fnGetProfRecordTypesActive()
        drpSelectRecordType.DataBind()

        Dim A As New ListItem
        A.Text = "-- Professional Record Types --"
        A.Value = "N\A"

        drpSelectRecordType.Items.Insert(0, A)
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnSearchEmp_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearchEmp.Click
        grdSearchEmp.DataSource = EmpInfoData.fnSearchEmpByNameorID(txtEmpNameorID.Text)
        grdSearchEmp.DataBind()
    End Sub

    Protected Sub drpAvailableRecType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpAvailableRecType.SelectedIndexChanged
        Try

            If drpAvailableRecType.SelectedValue = "N\A" Then
                MessageBox("Select An Item To Update.")
                ClearProfRecType()
                Exit Sub
            Else
                ClearProfRecType()
                btnUpdateProfRecType.Enabled = True
                btnInsertRecType.Enabled = False
            End If

            ProfRecType = ProfRecType.fnGetDetailsProfRecordTypeByID(drpAvailableRecType.SelectedValue)
            hdFldProfRecTypeID.Value = ProfRecType.ProfRecordTypeID
            rdbtnFavor.SelectedValue = ProfRecType.Category
            txtRecordType.Text = ProfRecType.ProfRecordType
            If ProfRecType.IsActive = True Then
                chkIsActive.Checked = True
            Else
                chkIsActive.Checked = False
            End If

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub grdSearchEmp_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdSearchEmp.SelectedIndexChanged

        Dim lblEmployeeID As New Label
        lblEmployeeID = grdSearchEmp.SelectedRow.FindControl("lblEmployeeID")
        ShowProfRecordByEmp(lblEmployeeID.Text)

        btnSubmit.Enabled = True
    End Sub

    Protected Sub ShowProfRecordByEmp(ByVal EmployeeID As String)
        grdProfRecord.DataSource = ProfRec.fnGetProfRecByEmployee(EmployeeID)
        grdProfRecord.DataBind()
    End Sub

End Class
