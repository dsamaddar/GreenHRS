<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RecuitmentCVView.aspx.vb"
    Inherits="RecuitmentCVView" Theme="CommonSkin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>::HRM:Recruitment CV View::</title>
    <link href="Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
    <link href="Sources/css/Title.css" rel="stylesheet" type="text/css" />
    <link href="Sources/css/GridStyle.css" rel="stylesheet" type="text/css" />

    <script language="JavaScript" type="text/javascript">
        function openWindow(windowURL, windowName, windowWidth, windowHeight) {
            var left = (screen.width / 2) - (windowWidth / 2);
            var top = (screen.height / 2) - (windowHeight / 2);
            window.name = 'parentWnd';
            newWindow = window.open(windowURL, windowName, 'top=' + top + ',left=' + left + ',width=' + windowWidth + ',height=' + windowHeight + ',toolbar=0,location=no,directories=0, status=0,menuBar=0,scrollBars=1,resizable=1');
            newWindow.focus();
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlGraphicInfo" runat="server" SkinID="pnlInner" Width="100%">
                    <table width="100%">
                        <tr>
                            <td colspan="2" align="left">
                                <div class="widgettitle">
                                    Photo And Signature</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%">
                                <table width="100%">
                                    <tr valign="top">
                                        <td valign="top">
                                            <asp:Image ID="imgValidation" runat="server" Width="152px" CssClass="img" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 50%">
                                <table width="100%">
                                    <tr valign="top">
                                        <td valign="top">
                                            <asp:Image ID="imgSignature" runat="server" Height="50px" />
                                        </td>
                                        <td>
                                            <%-- <script language="Javascript">

                                                function printit(){  
                                                if (window.print) {
                                                    window.print() ;  
                                                } else {
                                                    var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
                                                document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
                                                    WebBrowser1.ExecWB(6, 2);//Use a 1 vs. a 2 for a prompting dialog box    WebBrowser1.outerHTML = "";  
                                                }
                                                }
                                           </script>
                                           <script language="Javascript">  
                                                var NS = (navigator.appName == "Netscape");
                                                var VERSION = parseInt(navigator.appVersion);
                                                if (VERSION > 3) {
                                                    document.write('<form><input class="styled-button-1" type=button value="Print CV" name="Print" onClick="printit()"></form>');        
                                                }
                                            </script>--%>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlCanBasicInfo" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%">
                        <tr>
                            <td align="left" colspan="6">
                                <div class="widgettitle">
                                    Basic Information</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td align="left" class="label">
                                <b>Name</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtName" runat="server" CssClass="InputTxtBox" ReadOnly="True" Width="200px"></asp:TextBox>
                            </td>
                            <td align="left" class="label" style="width: 20px">
                            </td>
                            <td align="left" class="label">
                                Date of Birth
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtDateOfBirth" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                            </td>
                            <td align="left" class="label">
                                <b>Gender</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtgender" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                            </td>
                            <td align="left" class="label">
                                <b>Marital Status</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtRelationshipStatus" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                            </td>
                            <td align="left" class="label">
                                <b>Email</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="lblEmail" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Religion</b>&nbsp;
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtReligion" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b class="label">Blood Group</b>&nbsp;
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtBloodGroup" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b><b class="label">Mobile No</b> </b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                <b class="label">Father&#39;s Name</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtFatherName" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                <b class="label">Father&#39;s Occupation</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtFarherOccupation" runat="server" CssClass="InputTxtBox" ReadOnly="true"
                                    Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Mother&#39;s Name</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtMotherName" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                <b class="label">Mother&#39;s Occupation</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtMotherOccupation" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                <b class="label">Spouse Name</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtSpouseName" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                <b class="label">Spouse Occupation</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtSpouseOccupation" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                            </td>
                            <td align="left">
                                <b class="label">No of Children and Age</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtNoofChildrenAndAge" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px" Height="50px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td align="left">
                            </td>
                            <td align="left">
                                <b class="label">No of Sibblings Name And Occupation</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtSibblingsInfo" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px" Height="50px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label">
                            </td>
                            <td class="label">
                                <b>Nationality</b>
                            </td>
                            <td>
                                <asp:TextBox ID="txtNationality" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td class="label">
                            </td>
                            <td class="label">
                                <b>NID</b>
                            </td>
                            <td>
                                <asp:TextBox ID="txtNID" runat="server" CssClass="InputTxtBox" ReadOnly="True" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Passport No
                            </td>
                            <td>
                                <asp:TextBox ID="txtPassportNo" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <table width="100%">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlCanAddressInfo" runat="server" SkinID="pnlInner" Width="100%">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <asp:Panel ID="idpreAdd" runat="server" SkinID="pnlInner" Width="410px">
                                    <table style="width: 100%">
                                        <tr>
                                            <td align="left" colspan="3">
                                                <div class="widgettitle">
                                                    Present Address</div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="width: 20px">
                                            </td>
                                            <td align="left" class="label" style="width: 140px">
                                                <b>Address</b>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtPresentAddress" runat="server" CssClass="InputTxtBox" Height="50px"
                                                    ReadOnly="True" TextMode="MultiLine" Width="200px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="label">
                                                &nbsp;
                                            </td>
                                            <td align="left" class="label">
                                                <b>District</b>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtPresentDistrict" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                                    Width="200px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="label">
                                                &nbsp;
                                            </td>
                                            <td align="left" class="label">
                                                <b>Thana/ Upazila</b>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtPresentThana" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                                    Width="200px"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td>
                                <asp:Panel ID="pnlCanPermanentAddress" runat="server" SkinID="pnlInner" Width="580px">
                                    <table style="width: 100%">
                                        <tr>
                                            <td colspan="4" align="left">
                                                <div class="widgettitle">
                                                    Permanent Address</div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="width: 20px">
                                            </td>
                                            <td align="left" class="label" style="width: 150px">
                                                <b>Address</b>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtPermanentAddress" runat="server" CssClass="InputTxtBox" Height="50px"
                                                    ReadOnly="True" TextMode="MultiLine" Width="200px"></asp:TextBox>
                                            </td>
                                            <td align="left">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="label">
                                                &nbsp;
                                            </td>
                                            <td align="left" class="label">
                                                <b>District</b>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtPermanentDistrict" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                                    Width="200px"></asp:TextBox>
                                            </td>
                                            <td align="left">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="label">
                                            </td>
                                            <td align="left" class="label">
                                                <b>Thana/ Upazila</b>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtPermanentThana" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                                    Width="200px"></asp:TextBox>
                                            </td>
                                            <td align="left">
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlOthersInfo" runat="server" SkinID="pnlInner" Width="100%">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                            </td>
                            <td align="left" class="label" style="width: 150px">
                            </td>
                            <td align="left" style="width: 230px">
                            </td>
                            <td align="left" style="width: 20px">
                            </td>
                            <td align="left" style="width: 150px">
                            </td>
                            <td align="left" style="width: 230px">
                            </td>
                            <td align="left" style="width: 150px">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Alternate Email</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtAlternateEMail" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                <b class="label">Home Phone No.</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtHomePhone" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" width="1">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Office Phone</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtOfficePhone" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Year of Experience</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtYearofExperience" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Looking For</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtLookingFor" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Available For</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtAvailableFor" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>About Yourself / Achivement if any</b>&nbsp;
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtAboutYrself" runat="server" CssClass="InputTxtBox" Height="50px"
                                    ReadOnly="True" TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" colspan="3" valign="top">
                                <div style="max-height: 200px; max-width: 250px; overflow: auto">
                                    <asp:GridView ID="grdSpecilized" runat="server" AutoGenerateColumns="False" CssClass="mGrid"
                                        DataSourceID="dsSpecilized" EmptyDataText="No Information Available" Font-Names="Arial"
                                        Font-Size="12px" SkinID="grdNoFooter">
                                        <Columns>
                                            <asp:BoundField DataField="SpecilizedName" HeaderStyle-HorizontalAlign="Center" HeaderText="Specilized In"
                                                SortExpression="SpecilizedName">
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="dsSpecilized" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                        ProviderName="<%$ ConnectionStrings:HRMConnectionString.ProviderName %>" SelectCommand="SELECT tblSpecilizedSector.SpecilizedName from dbo.tblCandidateSpecilization
                                    inner join tblSpecilizedSector on tblSpecilizedSector.SpecilizedID =tblCandidateSpecilization.SpecilizedID 
                                    where tblCandidateSpecilization.CandidateID =@CandidateID">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="CandidateID" QueryStringField="CandidateID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </td>
                        </tr>
                        <tr visible="false" runat="server">
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Career Objective</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtCareerObjective" runat="server" CssClass="InputTxtBox" Height="50px"
                                    ReadOnly="True" TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Specilized In
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtSpecilizedIn" runat="server" CssClass="InputTxtBox" Height="50px"
                                    ReadOnly="True" TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr visible="false" runat="server">
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>English Language Proficiency</b>&nbsp;
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtEnglishLanguageProficiency" runat="server" CssClass="InputTxtBox"
                                    ReadOnly="True" Width="200px"></asp:TextBox>
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Computer Literacy</b>&nbsp;
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtComputerLiteracy" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr visible="false" runat="server">
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel ID="pnlEmploymentHistory" Width="100%" SkinID="pnlInner" runat="server">
                    <table width="100%">
                        <tr>
                            <td align="left">
                                <div class="widgettitle">
                                    Employment History</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <div style="max-height: 200px; max-width: 100%; overflow: auto">
                                    <asp:GridView ID="grdExpInfo" runat="server" AutoGenerateColumns="False" EmptyDataText="No Information Available"
                                        Font-Names="Arial" Font-Size="12px" SkinID="grdNoFooter" CssClass="mGrid">
                                        <Columns>
                                            <asp:BoundField DataField="CompanyName" HeaderText="Company Name" SortExpression="CompanyName" />
                                            <asp:BoundField DataField="OfficialDesig" HeaderText="Official Designation" SortExpression="OfficialDesig" />
                                            <asp:BoundField DataField="FuncDesig" HeaderText="Functional Designation" SortExpression="FuncDesig" />
                                            <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                                            <asp:BoundField DataField="Responsibilities" HeaderText="Responsibilities" SortExpression="Responsibilities" />
                                            <asp:BoundField DataField="CompanyAddress" HeaderText="Company Address" SortExpression="CompanyAddress" />
                                            <asp:BoundField DataField="CompanyConNo" HeaderText="Contact No" SortExpression="CompanyConNo" />
                                            <asp:BoundField DataField="DateFrom" HeaderText="Date From" ReadOnly="True" SortExpression="DateFrom" />
                                            <asp:BoundField DataField="DateTo" HeaderText="Date To" ReadOnly="True" SortExpression="DateTo" />
                                            <asp:BoundField DataField="TillDate" HeaderText="Status" ReadOnly="True" SortExpression="TillDate" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel ID="pnlProfessionalCertification" Width="100%" SkinID="pnlInner" runat="server">
                    <table width="100%">
                        <tr>
                            <td align="left">
                                <div class="widgettitle">
                                    Professional Certification</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <div style="max-height: 200px; max-width: 100%; overflow: auto">
                                    <asp:GridView ID="grdProCerti" runat="server" AutoGenerateColumns="False" CssClass="mGrid"
                                        EmptyDataText="No Information Available" Font-Names="Arial" Font-Size="12px"
                                        SkinID="grdNoFooter">
                                        <Columns>
                                            <asp:BoundField DataField="CertificationName" HeaderText="Certification Name" SortExpression="CertificationName" />
                                            <asp:BoundField DataField="InstituteName" HeaderText="Issuing Authority" SortExpression="InstituteName" />
                                            <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                                            <asp:BoundField DataField="DateFrom" HeaderText="Issuing Date" SortExpression="DateFrom" />
                                            <asp:BoundField DataField="DateTo" HeaderText="Expire Date" SortExpression="DateTo" />
                                            <asp:BoundField DataField="NeverExpire" HeaderText="Status" SortExpression="NeverExpire" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <table width="100%">
    </table>
    <table width="100%">
        <tr>
            <td align="center">
                <asp:Panel ID="Panel7" Width="100%" SkinID="pnlInner" runat="server">
                    <table width="100%">
                        <tr align="left">
                            <td>
                                <div class="widgettitle">
                                    Education Information</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <div style="max-height: 200px; max-width: 100%; overflow: auto">
                                    <asp:GridView ID="grdEducation" Font-Names="Arial" Font-Size="12px" runat="server"
                                        AutoGenerateColumns="False" EmptyDataText="No Information Available" SkinID="grdNoFooter"
                                        CssClass="mGrid">
                                        <Columns>
                                            <asp:BoundField DataField="DegreeType" HeaderText="Degree Type" SortExpression="DegreeType" />
                                            <asp:BoundField DataField="ExamName" HeaderText="Degree Name" SortExpression="ExamName" />
                                            <asp:BoundField DataField="MajorType" HeaderText="Major" SortExpression="MajorType" />
                                            <asp:BoundField DataField="InstitutionName" HeaderText="Institution" SortExpression="InstitutionName" />
                                            <asp:BoundField DataField="PassingYear" HeaderText="Passing Year" SortExpression="PassingYear" />
                                            <asp:BoundField DataField="ResultType" HeaderText="Result Type" SortExpression="ResultType" />
                                            <asp:BoundField DataField="Result" HeaderText="Result" SortExpression="Result" />
                                            <asp:BoundField DataField="OutOf" HeaderText="Out Of" SortExpression="OutOf" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel ID="pnlTrainingInformation" Width="100%" SkinID="pnlInner" runat="server">
                    <table width="100%">
                        <tr>
                            <td align="left">
                                <div class="widgettitle">
                                    Training Information</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <div style="max-height: 200px; max-width: 100%; overflow: auto">
                                    <asp:GridView ID="grdTraining" runat="server" AutoGenerateColumns="False" EmptyDataText="No Information Available"
                                        Font-Names="Arial" Font-Size="12px" SkinID="grdNoFooter" CssClass="mGrid">
                                        <Columns>
                                            <asp:BoundField DataField="TrainingName" HeaderText="Training Topic" SortExpression="TrainingName" />
                                            <asp:BoundField DataField="InstituteName" HeaderText="Institution" SortExpression="InstituteName" />
                                            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                                            <asp:BoundField DataField="TrainingYear" HeaderText="Training Year" SortExpression="TrainingYear" />
                                            <asp:BoundField DataField="TotalTrainingDay" HeaderText="Total Training Day" SortExpression="TotalTrainingDay" />
                                            <asp:BoundField DataField="DateFrom" HeaderText="Date From" ReadOnly="True" SortExpression="DateFrom" />
                                            <asp:BoundField DataField="DateTo" HeaderText="Date To" ReadOnly="True" SortExpression="DateTo" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel ID="pnlReferences" Width="100%" SkinID="pnlInner" runat="server">
                    <table width="100%">
                        <tr>
                            <td align="left">
                                <div class="widgettitle">
                                    References</div>
                            </td>
                            <tr>
                                <td align="center">
                                    <div style="max-height: 200px; max-width: 100%; overflow: auto">
                                        <asp:GridView ID="grdRefrence" runat="server" AutoGenerateColumns="False" CssClass="mGrid"
                                            EmptyDataText="No Information Available" Font-Names="Arial" Font-Size="12px"
                                            SkinID="grdNoFooter">
                                            <Columns>
                                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                                <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" />
                                                <asp:BoundField DataField="OrganizationName" HeaderText="Organization" SortExpression="OrganizationName" />
                                                <asp:BoundField DataField="RefRelationWith" HeaderText="Relationship" SortExpression="RefRelationWith" />
                                                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                                                <asp:BoundField DataField="MobileNo" HeaderText="Mobile" SortExpression="MobileNo" />
                                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </td>
                            </tr>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel ID="pnlUploadedDocuments" Width="100%" SkinID="pnlInner" runat="server">
                    <table width="100%">
                        <tr>
                            <td align="left">
                                <div class="widgettitle">
                                    Uploaded Documents</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <div style="max-height: 200px; max-width: 100%; overflow: auto">
                                    <asp:GridView ID="grdDocumentList" Font-Names="Arial" Font-Size="12px" runat="server"
                                        AutoGenerateColumns="False" EmptyDataText="No Document Found." SkinID="grdNoFooter"
                                        CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="DocTypeID" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDocTypeID" runat="server" CssClass="label" Text='<%#Eval("DocTypeID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="DocTypeName" HeaderText="Document Type" SortExpression="DocTypeName" />
                                            <asp:BoundField DataField="FileName" HeaderText="File Name" SortExpression="FileName" />
                                            <asp:TemplateField HeaderText="View" ShowHeader="true">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="hpDocument" CssClass="linkbtn" runat="server" NavigateUrl='<%# ConfigurationManager.AppSettings("AttachmentsShow") + Eval("FileName") %>'
                                                        Target="_blank">View</asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel runat="server" ID="pnlOuter" Width="100%" SkinID="pnlInner">
                    <table width="100%">
                        <tr>
                            <td align="left" colspan="6">
                                <div class="widgettitle">
                                    Expectation</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td class="label" style="width: 150px">
                                Preferred Job Location
                            </td>
                            <td align="left" style="width: 300px">
                                <asp:TextBox ID="txtPreferredJobLocation" runat="server" CssClass="InputTxtBox" Enabled="false"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td align="left" class="label" style="width: 150px">
                                Expected Salary
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtExpectedSalary" runat="server" CssClass="InputTxtBox" Enabled="false"
                                    Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="label">
                            </td>
                            <td class="label">
                                Last Drawn Salary And Date
                            </td>
                            <td>
                                <asp:TextBox ID="txtPresentSalary" runat="server" Width="100px" CssClass="InputTxtBox"
                                    Enabled="false"></asp:TextBox>
                                &nbsp;<asp:TextBox ID="txtPreSalDrawndate" runat="server" Width="95px" CssClass="InputTxtBox"
                                    Enabled="false"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Employeer
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmployeer" runat="server" CssClass="InputTxtBox" Enabled="false"
                                    Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel ID="pnlExamScore" Width="100%" SkinID="pnlInner" runat="server">
                    <table width="100%">
                        <tr>
                            <td align="left">
                                <div class="widgettitle">
                                    Exam Score</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <div style="max-height: 200px; max-width: 100%; overflow: auto">
                                    <asp:GridView ID="grdCandidateExamResultSummary" runat="server" SkinID="grdNoFooter"
                                        AutoGenerateColumns="False" Width="100%" CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="ExamID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ExamID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Exam">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ExamName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Roll No" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblExamRollNo" runat="server" Text='<%# Bind("ExamRollNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Code">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ExamCode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Questions">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("TotalQuestion") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total Marks">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("TotalMarks") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="+ Marking">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("PositiveMarking") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="- Marking">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("NegativeMarking") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Obtained Marks">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("ObtainedMarks") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText=" Exam Details " ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkCandidateExamDetailsBtn" CssClass="linkbtn" Font-Size="14px"
                                                        runat="server" CausesValidation="False" OnClientClick='<%# Eval("ExamRollNo","openWindow(""CVMan/frmShowCandidateResult.aspx?ExamRollNo={0}"",""Popup"",1000,1100);") %>'
                                                        Text=" View "></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="" ProviderName="<%$ ConnectionStrings:HRMConnectionString.ProviderName %>">
                                    <SelectParameters>
                                        <asp:QueryStringParameter QueryStringField="CandidateID" Name="CandidateID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel ID="pnlExternalTestScore" runat="server" SkinID="pnlInner" Width="100%">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td class="widget-title">
                                External Test Score
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="grdExternalTestScore" runat="server" AutoGenerateColumns="False"
                                    CssClass="mGrid">
                                    <Columns>
                                        <asp:BoundField DataField="ExternalTestScoreID" HeaderText="ExternalTestScoreID"
                                            Visible="False" />
                                        <asp:BoundField DataField="Topic" HeaderText="Topic" />
                                        <asp:BoundField DataField="ExamTakenOn" HeaderText="TakenOn" />
                                        <asp:BoundField DataField="Marks" HeaderText="Marks" />
                                        <asp:BoundField DataField="Grading" HeaderText="Grading" />
                                        <asp:BoundField DataField="Remarks" HeaderText="Remarks" />
                                        <asp:TemplateField HeaderText="Attachment" ShowHeader="true">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="hpDocument" runat="server" CssClass="linkbtn" NavigateUrl='<%#"~/Attachments/"+ Eval("Attachment") %>'
                                                    Target="_blank">View</asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="EntryBy" HeaderText="EntryBy" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center">
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
