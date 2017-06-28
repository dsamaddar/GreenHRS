
Partial Class CVMan_Default
    Inherits System.Web.UI.Page

    Dim CanInfo As New clsCanEduDataAccess()
    Dim CanBas As New clsCanBasicDataAccess()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim UserID As String
            Dim UserName As String

            UserID = Session("LoginUserID")
            UserName = Session("UserName")

            Dim CandidateID As String

            CandidateID = Session("CandidateID")

            Dim RegistrationID As String
            RegistrationID = Session("RegistrationID")

            Dim count As Integer = Common.CandidateCount(RegistrationID)

            Dim TotalColor = Convert.ToDouble("500")


            If count = 0 Then
                lblNotDone.Width = TotalColor
                lblPercentage.Text = "Profile In Progress 0%"
                lblPresentStatus.Width = "500"
                lblPresentStatus.Text = "Please Remember Your Profile Is Not Submitted yet"

            Else
                lblCorrectPercentage.Width = Convert.ToDouble("200")
                lblNotDone.Width = Convert.ToDouble(TotalColor - lblCorrectPercentage.Width.Value)

                Dim intPer As Integer = 40

                lblPercentage.Text = "Profile In Progress 40%"

                Dim c5 As Integer = CanInfo.CandidateFindOutForEducation(CandidateID)

                If c5 <> 0 Then
                    lblCorrectPercentage.Width = Convert.ToDouble(lblCorrectPercentage.Width.Value + 60)
                    lblNotDone.Width = Convert.ToDouble(TotalColor - lblCorrectPercentage.Width.Value)

                    intPer = intPer + 20
                    lblPercentage.Text = "Profile In Progress " + Convert.ToString(intPer) + "%"
                End If


                Dim c1 As Integer = CanInfo.CandidateFindOut(CandidateID, "tblCandidateExperienceInfo")

                If c1 <> 0 Then
                    lblCorrectPercentage.Width = Convert.ToDouble(lblCorrectPercentage.Width.Value + 60)
                    lblNotDone.Width = Convert.ToDouble(TotalColor - lblCorrectPercentage.Width.Value)

                    intPer = intPer + 10
                    lblPercentage.Text = "Profile In Progress " + Convert.ToString(intPer) + "%"
                End If

                Dim c2 As Integer = CanInfo.CandidateFindOut(CandidateID, "tblCandidateTrainingInfo")

                If c2 <> 0 Then
                    lblCorrectPercentage.Width = Convert.ToDouble(lblCorrectPercentage.Width.Value + 60)
                    lblNotDone.Width = Convert.ToDouble(TotalColor - lblCorrectPercentage.Width.Value)

                    intPer = intPer + 10
                    lblPercentage.Text = "Profile In Progress " + Convert.ToString(intPer) + "%"
                End If

                Dim c3 As Integer = CanInfo.CandidateFindOut(CandidateID, "tblCandidateProfessionalCertificationInfo")

                If c3 <> 0 Then
                    lblCorrectPercentage.Width = Convert.ToDouble(lblCorrectPercentage.Width.Value + 60)
                    lblNotDone.Width = Convert.ToDouble(TotalColor - lblCorrectPercentage.Width.Value)

                    intPer = intPer + 10
                    lblPercentage.Text = "Profile In Progress " + Convert.ToString(intPer) + "%"
                End If

                Dim c4 As Integer = CanInfo.CandidateFindOut(CandidateID, "tblCandidateReferenceInfo")

                If c4 <> 0 Then
                    lblCorrectPercentage.Width = Convert.ToDouble(lblCorrectPercentage.Width.Value + 60)
                    lblNotDone.Width = Convert.ToDouble(TotalColor - lblCorrectPercentage.Width.Value)

                    intPer = intPer + 10
                    lblPercentage.Text = "Profile In Progress " + Convert.ToString(intPer) + "%"
                End If


                Dim PresentStatus As Boolean = clsCanBasicDataAccess.PresentStatus(CandidateID)

                If PresentStatus = False Then
                    lblPresentStatus.Width = "500"
                    lblPresentStatus.Text = "Please Remember Your Profile Is Not Submitted yet"
                Else
                    lblPresentStatus.Text = ""
                End If

            End If


        End If
    End Sub
End Class
