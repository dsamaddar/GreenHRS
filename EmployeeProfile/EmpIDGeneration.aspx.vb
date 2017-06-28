Imports System.Net
Imports System.IO
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Partial Class EmployeeProfile_EmpIDGeneration
    Inherits System.Web.UI.Page

    Dim IDGeneData As New EmplIDGenerationDataAccess()
    Dim EmpInfoData As New clsEmployeeInfoDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GetEmpList()
        End If
    End Sub

    Protected Sub GetEmpList()
        drpEmployeeList.DataTextField = "EmployeeName"
        drpEmployeeList.DataValueField = "EmployeeID"
        drpEmployeeList.DataSource = EmpInfoData.fnGetEmployeeList()
        drpEmployeeList.DataBind()
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Dim AppJobData As New clsAppliedJobDataAccess()

    Protected Sub pnlProcessInformation_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles pnlProcessInformation.Click
        Dim folder As String
        Dim DocFileName As String = ""
        Dim DocFileNameSign As String = ""
        Dim DocExt As String
        Dim AttachmentFileName As String

        Try
            If flUpXML.HasFile Then

                folder = ConfigurationManager.AppSettings("AttachmentsShow")
                DocExt = System.IO.Path.GetExtension(flUpXML.FileName)

                If DocExt <> ".xml" And DocExt <> ".XML" And DocExt <> ".XmL" Then
                    MessageBox("Upload Only XML file")
                    Exit Sub
                End If

                DocFileName = "CANXML-" & DateTime.Now.ToString("ddMMyyHHmmss") & ".xml"

                Dim fs As System.IO.Stream = flUpXML.PostedFile.InputStream
                Dim br As New System.IO.BinaryReader(fs)
                Dim bytes As Byte() = br.ReadBytes(CType(fs.Length, Integer))
                UploadFile(folder, DocFileName, bytes)

                AttachmentFileName = folder & DocFileName

                Dim xmldoc As New System.Xml.XmlDocument
                xmldoc.Load(AttachmentFileName)
                Dim CanXML As String = xmldoc.OuterXml

                Dim result As clsResult = AppJobData.fnUploadEmpFromXML(CanXML)
                MessageBox(result.Message)

            Else
                MessageBox("No XML File Found.")
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
       
    End Sub

    Protected Sub UploadFile(ByVal DestinationPathWithName As String, ByVal FileName As String, ByVal filebyte As Byte())
        Try
            Dim webClient As WebClient = New WebClient()
            Dim FileSavePath As String = Server.MapPath("~\Attachments\") & FileName
            File.WriteAllBytes(FileSavePath, filebyte)
            webClient.UploadFile("http://192.168.1.132/HRMAttachments/Upload.aspx", FileSavePath)
            webClient.Dispose()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnJoiningLetter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnJoiningLetter.Click
        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String

        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]

        Dim conStr = ConfigurationManager.ConnectionStrings("HRMConnectionStringRpt").ConnectionString
        Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

        Try
            f = "~/Payroll/Report/"
            folder = Server.MapPath(f)
            repName = folder & "rptJoiningLetter.rpt"
            myReport.Load(repName)

            retArr = conStr.Split(";")
            serverArr = retArr(0).Split("=")
            dbArr = retArr(1).Split("=")
            usrArr = retArr(2).Split("=")
            pwdArr = retArr(3).Split("=")

            serverName = serverArr(1)
            uid = usrArr(1)
            pwd = pwdArr(1)
            dbName = dbArr(1)

            myReport.SetDatabaseLogon(uid, pwd, serverName, dbName)

            Dim parameters As CrystalDecisions.Web.Parameter = New CrystalDecisions.Web.Parameter()
            myReport.SetParameterValue("@RefNo", "")
            myReport.SetParameterValue("@AppointmentRefNo", "")
            myReport.SetParameterValue("@EmployeeID", drpEmployeeList.SelectedValue)
            myReport.ExportToHttpResponse(ExportFormatType.WordForWindows, Response, True, "Joining-Letter")
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub
End Class
