<%@ Page Language="VB" Theme="CommonSkin" AutoEventWireup="false" CodeFile="frmShowJobCircularDetails.aspx.vb" Inherits="JobCircular_frmShowJobCircularDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>.:HRM: Job Circular Details:.</title>
    <link href="../Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
    <style type="text/css" >
        .DescriptiveLabel
        {
            color:#4169E1;
            font-family:Cambria,Palatino,"Palatino Linotype","Palatino LT STD",Georgia,serif;
            font-size: 13px;
	        font-weight:bold;
            }
        .ImportantField
        {
            color:#078E19;
            font-family:Cambria,Palatino,"Palatino Linotype","Palatino LT STD",Georgia,serif;
            font-size: 13px;
	        font-weight:bold;
        }
        .HeaderlblStyle
        {
            color:#4169E1;
            font-family:Cambria,Palatino,"Palatino Linotype","Palatino LT STD",Georgia,serif;
            font-size: 13pt;
	        font-weight:bold;
            
        }
    </style>
  </head>
<body>
    <form id="form1" runat="server">
    <table style="width: 100%;">
        <tr>
            <td>
                &nbsp;
            </td>
            <td align="center" >
                <asp:Label runat ="server" ID ="idLabel" BackColor ="#FF9D9D" Height ="25px" 
                    Font-Bold="True" Font-Names="Verdana" ForeColor="Black" Width="900px" ></asp:Label>
            </td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td align="center">
                <asp:Image ID="imgHeader" runat="server" Width="900px" Height="50px" />
                &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td align="center">
                <h2> <asp:Label ID="lblHeaderNote" CssClass="HeaderlblStyle" runat="server" Text=""></asp:Label> </h2> 
            </td>
        </tr>
        <tr id="idMiddleImage" runat="server">
            <td>
                &nbsp;
            </td>
            <td align="center">
                <asp:Image ID="imgMiddle" runat="server" Width="900px" Height="1100px" />
            </td>
        </tr>
        <tr align="center" id="idPanel" runat="server">
            <td>
                &nbsp;
            </td>
            <td id="Showable" runat="server">
                <asp:Panel ID="pnlJobCircularInfo" runat="server" Width="900px" 
                    SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" class="label" style="width:20px">
                                &nbsp;</td>
                            <td align="left" class="label" style="width:130px">
                                &nbsp;</td>
                            <td align="left" style="width:250px">
                                &nbsp;</td>
                            <td align="left" style="width:20px">
                                &nbsp;</td>
                            <td align="left" class="label" style="width:150px">
                                &nbsp;</td>
                            <td align="left" style="width:250px">
                                &nbsp;</td>
                            <td align="left" style="width:20px">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                <b>Job Title</b></td>
                            <td align="left">
                                <asp:Label ID="lblJobTitle" runat="server" Width="250px" 
                                    CssClass="DescriptiveLabel"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Duty Schedule</b></td>
                            <td align="left">
                                <asp:Label ID="lblDutySchedule" runat="server" Width="250px" 
                                    CssClass="DescriptiveLabel"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                <b>Job Location</b></td>
                            <td align="left">
                                <asp:Label ID="lblJobLocation" runat="server" Width="250px" 
                                    CssClass="DescriptiveLabel"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Salary &amp; Benefits</b></td>
                            <td align="left">
                                <asp:Label ID="lblSalaryAndBenefits" runat="server" Width="250px" 
                                    CssClass="ImportantField"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                <b>Organization</b></td>
                            <td align="left">
                                <asp:Label ID="lblOrganizations" runat="server" Width="250px" 
                                    CssClass="DescriptiveLabel"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Vacancies</b></td>
                            <td align="left">
                                <asp:Label ID="lblVacancies" runat="server" Width="250px" 
                                    CssClass="ImportantField"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                <b>Department</b></td>
                            <td align="left">
                                <asp:Label ID="lblDepartment" runat="server" Width="250px" 
                                    CssClass="DescriptiveLabel"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Competencies</b></td>
                            <td align="left">
                                <asp:Label ID="lblCompetencies" runat="server" Width="250px" 
                                    CssClass="DescriptiveLabel"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                <b>Job Description</b></td>
                            <td align="left">
                                <asp:Label ID="lblJobDescription" runat="server" Width="250px" 
                                    CssClass="DescriptiveLabel"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Communication Skill</b></td>
                            <td align="left">
                                <asp:Label ID="lblCommunicationSkill" runat="server" Width="250px" 
                                    CssClass="DescriptiveLabel"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                <b>Job Responsibility</b></td>
                            <td align="left">
                                <div style="max-height:100px;overflow:auto">
                                <asp:Label ID="lblJobResponsibility" runat="server" Width="250px" CssClass="DescriptiveLabel"></asp:Label>
                                </div>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Age Limits</b></td>
                            <td align="left" class="ImportantField">
                                <asp:Label ID="lblAgeLimit" runat="server"></asp:Label>
                            </td>
                            <td align="left" class="ImportantField">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                <b>Special Skills Required</b></td>
                            <td align="left">
                                <div style="max-height:100px;overflow:auto">
                                <asp:Label ID="lblSpecialSkillsRequired" runat="server" Width="250px" CssClass="DescriptiveLabel"></asp:Label>
                                </div>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Additional Job Requirement</b></td>
                            <td align="left">
                                <div style="max-height:100px;overflow:auto">
                                <asp:Label ID="lblAdditionalJobRequiremnt" runat="server" CssClass="DescriptiveLabel" Width="250px"></asp:Label>
                                </div>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Reportable To</b></td>
                            <td align="left">
                                <asp:Label ID="lblReportableTo" runat="server" Width="250px" 
                                    CssClass="DescriptiveLabel"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                <b>Educationals Requirement</b></td>
                            <td align="left">
                                <asp:Label ID="lblEducationalRequirement" runat="server" Width="250px" 
                                    CssClass="DescriptiveLabel"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>How To Apply</b></td>
                            <td align="left">
                                <asp:Label ID="lblHowToApply" runat="server" Width="250px" 
                                    CssClass="DescriptiveLabel"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                <b>Experience Required (In Years)</b></td>
                            <td align="left">
                                <asp:Label ID="lblExperienceRequired" runat="server" Width="250px" 
                                    CssClass="ImportantField"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Company Address</b></td>
                            <td align="left">
                                <asp:Label ID="lblCompanyAddress" runat="server" Width="250px" 
                                    CssClass="DescriptiveLabel"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                <b>Closing Date</b></td>
                            <td align="left">
                                <asp:Label ID="lblClosingDate" runat="server" Width="250px" 
                                    CssClass="ImportantField"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Terms Of References</b></td>
                            <td align="left">
                                <asp:Label ID="lblTermsOfReferences" runat="server" Width="250px" 
                                    CssClass="DescriptiveLabel"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                <b>Maximum Applicant</b></td>
                            <td align="left">
                                <asp:Label ID="lblMaximumApplicant" runat="server" Width="250px" 
                                    CssClass="ImportantField"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                <b>Attachment</b></td>
                            <td align="left">
                                <asp:HyperLink ID="lblAttachment" Target="_blank" runat="server" Width="250px"> 
                                [lblAttachment]</asp:HyperLink>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td align="center">
                <asp:Label ID="lblFooterNote" runat="server" CssClass="DescriptiveLabel"></asp:Label>
            </td>
        </tr>
        <tr id="Tr1" runat="server">
            <td>
                &nbsp;
            </td>
            <td align="center">
                <asp:Image ID="imgFooter" runat="server" Width="900px" Height="50px" />
                &nbsp;&nbsp;
            </td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Panel ID="pnlApplyBtn" runat="server" SkinID="pnlInner" Width="900px">
                    <asp:Button ID="btnApply" runat="server" CssClass="styled-button-1" 
                        Text="Apply" ValidationGroup="InsertJobCircular"
                    OnClientClick="if (!confirm('Are Your Sure To Apply?')) return false" 
                        />
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="left" class="label">
            </td>
            <td align="center">
                &nbsp;</td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
       
    </table>
    </form> 
    </body>
    </html> 
