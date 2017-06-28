
Partial Class Administration_frmPutExternalTestScore
    Inherits System.Web.UI.Page

    Dim TestTypeData As New clsExternalTestTypeDataAccess()
    Dim ExtTestScoreData As New clsExternalTestScoreDataAccess()

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click

        If Trim(txtIDorName.Text) = "" Then
            MessageBox("Can't Be Empty.")
            Exit Sub
        End If

        grdSearchResult.DataSource = ExtTestScoreData.fnSearchExamTaker(txtIDorName.Text)
        grdSearchResult.DataBind()

    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ShowTestTypeList()
            btnUpdate.Enabled = False
        End If
    End Sub

    Protected Sub ShowTestTypeList()
        drpTestType.DataTextField = "ExternalTest"
        drpTestType.DataValueField = "ExternalTestTypeID"
        drpTestType.DataSource = TestTypeData.fnGetExternalTestTypeList()
        drpTestType.DataBind()
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        Dim TestScore As New clsExternalTestScore()
        Dim lblUniqueUserID, lblUserType As New Label()

        Dim folder As String = ""
        Dim Title As String = ""
        Dim DocExt As String = ""
        Dim DocFullName As String = ""
        Dim DocPrefix As String = ""
        Dim FileSize As Integer = 0
        Dim DocFileName As String = ""

        lblUniqueUserID = grdSearchResult.SelectedRow.FindControl("lblUniqueUserID")
        lblUserType = grdSearchResult.SelectedRow.FindControl("lblUserType")

        Try
            If Convert.ToDouble(txtObtainedMarks.Text) > Convert.ToDouble(txtMarksOutOf.Text) Then
                MessageBox("Obtained Marks Can't Be Greater.")
                Exit Sub
            End If

            TestScore.ExternalTestTypeID = drpTestType.SelectedValue
            TestScore.ExamTakerID = lblUniqueUserID.Text
            TestScore.ExamTakerType = lblUserType.Text
            TestScore.ExamTakenOn = Convert.ToDateTime(txtExamTakenOn.Text)
            TestScore.MarksObtained = Convert.ToDouble(txtObtainedMarks.Text)
            TestScore.MarksOutOf = Convert.ToDouble(txtMarksOutOf.Text)
            TestScore.Grading = drpGrading.SelectedValue
            TestScore.Remarks = txtRemarks.Text

            If flupAttachment.HasFile Then

                folder = Server.MapPath("~/Attachments/")

                FileSize = flupAttachment.PostedFile.ContentLength()
                If FileSize > 4194304 Then
                    MessageBox("File size should be within 4MB")
                    Exit Sub
                End If

                DocPrefix = Title.Replace(" ", "")

                DocExt = System.IO.Path.GetExtension(flupAttachment.FileName)
                DocFileName = "Ext_Test_" & DateTime.Now.ToString("ddMMyyHHmmss") & DocExt
                DocFullName = folder & DocFileName
                flupAttachment.SaveAs(DocFullName)
                TestScore.Attachment = DocFileName
            Else
                TestScore.Attachment = ""
            End If

            TestScore.EntryBy = Session("LoginUserID")

            Dim check As Integer = ExtTestScoreData.fnInsertExternalTestScore(TestScore)

            If check = 1 Then
                MessageBox("Inserted Successfully.")
                ClearForm()
                GetTestScores(lblUniqueUserID.Text)
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Protected Sub GetTestScores(ByVal ExamTakerID As String)
        grdTestScoreOfUsers.DataSource = ExtTestScoreData.fnGetExtTestScoreByExamTaker(ExamTakerID)
        grdTestScoreOfUsers.DataBind()
    End Sub

    Protected Sub ClearForm()
        txtExamTakenOn.Text = ""
        txtIDorName.Text = ""
        txtMarksOutOf.Text = ""
        txtObtainedMarks.Text = ""
        txtRemarks.Text = ""

        drpGrading.SelectedIndex = -1
        drpTestType.SelectedIndex = -1

    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        ClearForm()
    End Sub

    Protected Sub grdSearchResult_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdSearchResult.SelectedIndexChanged

        Dim lblUniqueUserID As New Label()
        lblUniqueUserID = grdSearchResult.SelectedRow.FindControl("lblUniqueUserID")

        GetTestScores(lblUniqueUserID.Text)

    End Sub
End Class
