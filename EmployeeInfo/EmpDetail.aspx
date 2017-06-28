<%@ Page Language="VB" AutoEventWireup="false" CodeFile="EmpDetail.aspx.vb" Inherits="EmployeeInfo_EmpDetail"
    Theme="CommonSkin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Detail</title>
    <link href="../Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 100%;">
            <tr align="center">
                <td>
                    &nbsp;
                </td>
                <td>
                    <b><u>Basic Information</u></b>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr align="center">
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:Panel ID="pnl" runat="server" Width="950px" SkinID="pnlInner">
                        <table style="width: 100%">
                            <tr>
                                <td align="left" class="label" style="width: 20px">
                                    &nbsp;
                                </td>
                                <td align="left" class="label">
                                    <b>Name</b>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="lblName" runat="server" ReadOnly="True" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                </td>
                                <td align="left" class="label" style="width: 20px">
                                    &nbsp;
                                </td>
                                <td align="left" class="label">
                                    <b>Email</b>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="lblEmail" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                        Width="200px"></asp:TextBox>
                                </td>
                                <td valign="top" align="right" rowspan="7">
                                    <table>
                                        <tr>
                                            <td align="right">
                                                <asp:Image ID="imgValidation" runat="server" BorderStyle="Ridge" BorderWidth="2px"
                                                    Height="200px" Width="180px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Image ID="imgSignature" runat="server" Height="50px" Width="180px" />
                                            </td>
                                        </tr>
                                    </table>
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
                                    <asp:TextBox ID="lblFatherName" runat="server" Width="200px" CssClass="InputTxtBox"
                                        ReadOnly="True"></asp:TextBox>
                                </td>
                                <td align="left">
                                    &nbsp;
                                </td>
                                <td align="left">
                                    <b class="label">Father&#39;s Occupation</b>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="lblFatherOccupation" runat="server" CssClass="InputTxtBox" ReadOnly="true"
                                        Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr class="label">
                                <td align="left">
                                    &nbsp;
                                </td>
                                <td align="left">
                                    <b>Mother&#39;s Name</b>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="lblMotherName" runat="server" Width="200px" CssClass="InputTxtBox"
                                        ReadOnly="True"></asp:TextBox>
                                </td>
                                <td align="left">
                                    &nbsp;
                                </td>
                                <td align="left">
                                    <b class="label">Mother&#39;s Occupation</b>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="lblMotherOccupation" runat="server" CssClass="InputTxtBox" ReadOnly="True"
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
                                    <asp:TextBox ID="lblSpouseName" runat="server" Width="200px" CssClass="InputTxtBox"
                                        ReadOnly="True"></asp:TextBox>
                                </td>
                                <td align="left">
                                    &nbsp;
                                </td>
                                <td align="left">
                                    <b class="label">Spouse Occupation</b>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="lblSpouseOccupation" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                        Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="label">
                                    &nbsp;
                                </td>
                                <td align="left" class="label">
                                    <b>Gender</b>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="lblGender" runat="server" Width="200px" CssClass="InputTxtBox" ReadOnly="True"></asp:TextBox>
                                </td>
                                <td align="left" class="label">
                                    &nbsp;
                                </td>
                                <td align="left" class="label">
                                    <b>Marital Status</b>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="lblRelStatus" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                        Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="label">
                                    &nbsp;
                                </td>
                                <td align="left" class="label">
                                    <b>Nationality</b>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="lblNationality" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                        Width="200px"></asp:TextBox>
                                </td>
                                <td align="left" class="label">
                                    &nbsp;
                                </td>
                                <td align="left" class="label">
                                    <b>NID</b>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="lblNID" runat="server" CssClass="InputTxtBox" ReadOnly="True" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="label">
                                    &nbsp;
                                </td>
                                <td align="left" class="label">
                                    <b>Religion</b>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="lblReligion" runat="server" Width="200px" ReadOnly="True" CssClass="InputTxtBox"></asp:TextBox>
                                </td>
                                <td align="left">
                                    &nbsp;
                                </td>
                                <td align="left">
                                    <b class="label">Mobile No</b>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="lblMobileNo" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                        Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    &nbsp;
                                </td>
                                <td align="left">
                                    <b class="label">No of Children and Age</b>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="lblNoofChildrenAge" runat="server" Height="50px" TextMode="MultiLine"
                                        Width="200px" CssClass="InputTxtBox" ReadOnly="True"></asp:TextBox>
                                </td>
                                <td align="left">
                                    &nbsp;
                                </td>
                                <td align="left">
                                    <b class="label">No of Sibblings Name And Occupation</b>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="lblSibblingsInfo" runat="server" CssClass="InputTxtBox" Height="50px"
                                        ReadOnly="True" TextMode="MultiLine" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="label">
                                    &nbsp;
                                </td>
                                <td align="left" class="label">
                                    <b>Blood Group</b>&nbsp;
                                </td>
                                <td align="left" class="label">
                                    <asp:TextBox ID="txtBloodGrp" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                </td>
                                <td align="left">
                                    &nbsp;
                                </td>
                                <td align="left" class="label">
                                    <b>Alternate E-Mail</b>&nbsp;
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtAlEmail" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr align="center">
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:Panel ID="pnlAddressInfo" runat="server" Width="950px" SkinID="pnlInner">
                        <table style="width: 100%">
                            <tr>
                                <td align="left">
                                    <asp:Panel runat="server" ID="idpreAdd" Width="470px" SkinID="pnlInner">
                                        <table style="width: 100%">
                                            <tr>
                                                <td align="left" class="label" style="width: 20px">
                                                    &nbsp;
                                                </td>
                                                <td align="left" class="label">
                                                    &nbsp;
                                                </td>
                                                <td align="left">
                                                    <b><u>Present Address</u></b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" class="label" style="width: 20px">
                                                    &nbsp;
                                                </td>
                                                <td align="left" class="label">
                                                    <b>Address</b>
                                                </td>
                                                <td align="left">
                                                    <asp:TextBox ID="lblPreAddress" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                                        Width="200px" Height="50px" TextMode="MultiLine"></asp:TextBox>
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
                                                    <asp:TextBox ID="lblPreDistrict" runat="server" CssClass="InputTxtBox" ReadOnly="True"
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
                                                    <asp:TextBox ID="lblPreThana" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                                        Width="200px"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                                <td>
                                    <asp:Panel runat="server" ID="pnlPermanentAddress" Width="465px" SkinID="pnlInner">
                                        <table style="width: 100%">
                                            <tr>
                                                <td align="left" class="label">
                                                    &nbsp;
                                                </td>
                                                <td align="left" class="label">
                                                    &nbsp;
                                                </td>
                                                <td align="left">
                                                    <b><u>Permanent Address</u></b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" class="label">
                                                    &nbsp;
                                                </td>
                                                <td align="left" class="label">
                                                    <b>Address</b>
                                                </td>
                                                <td align="left">
                                                    <asp:TextBox ID="lblPerAddress" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                                        Width="200px" Height="50px" TextMode="MultiLine"></asp:TextBox>
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
                                                    <asp:TextBox ID="lblPerDistrict" runat="server" CssClass="InputTxtBox" ReadOnly="True"
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
                                                    <asp:TextBox ID="lblPerThana" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                                        Width="200px"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
        <table width="100%">
            <tr align="center">
                <td>
                    &nbsp;
                </td>
                <td>
                    <b><u>Employment History</u></b>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td align="center">
                    <asp:Panel ID="pnlEmploymentHistory" Width="950px" SkinID="pnlInner" runat="server">
                        <table width="100%">
                            <tr>
                                <td align="center">
                                    <div style="max-height: 200px; max-width: 100%; overflow: auto">
                                        <asp:GridView ID="grdExpInfo" Font-Names="Arial" Font-Size="12px" runat="server"
                                            AutoGenerateColumns="False" EmptyDataText="No Information Available" DataSourceID="dsExp"
                                            SkinID="grdNoFooter">
                                            <Columns>
                                                <asp:BoundField DataField="CompanyName" HeaderText="Company Name" SortExpression="CompanyName" />
                                                <asp:BoundField DataField="PositionHeld" HeaderText="Position Held" SortExpression="PositionHeld" />
                                                <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                                                <asp:BoundField DataField="Responsibilities" HeaderText="Responsibilities" SortExpression="Responsibilities" />
                                                <asp:BoundField DataField="DateFrom" HeaderText="Date From" SortExpression="DateFrom"
                                                    ReadOnly="True" />
                                                <asp:BoundField DataField="DateTo" HeaderText="Date To" SortExpression="DateTo" ReadOnly="True" />
                                                <asp:BoundField DataField="TillDate" HeaderText="Till Date" SortExpression="TillDate"
                                                    ReadOnly="True" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:SqlDataSource ID="dsExp" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                        SelectCommand="SELECT [CompanyName],[PositionHeld], dbo.tblDepartment.DeptName  [Department],[Responsibilities],
                                        convert(nvarchar(20),[DateFrom],106) DateFrom
                                        ,(case when [DateTo]='01-01-1911' then '' else convert(varchar,[DateTo],106) end)as [DateTo]
                                        ,case when TillDate =1 then 'Till Date' else '' end as TillDate  
                                        FROM [dbo].[tblEmployeeExperienceInfo] 
                                        left join dbo.tblDepartment on dbo.tblDepartment.DepartmentID=[tblEmployeeExperienceInfo].Department
                                        where EmployeeID=@EmployeeID" ProviderName="<%$ ConnectionStrings:HRMConnectionString.ProviderName %>">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="EmployeeID" QueryStringField="EmployeeID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
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
                    &nbsp;
                </td>
                <td>
                    <b><u>Education Information</u></b>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td align="center">
                    <asp:Panel ID="pnlEducationalInformation" Width="950px" SkinID="pnlInner" runat="server">
                        <table width="100%">
                            <tr>
                                <td align="center">
                                    <div style="max-height: 200px; max-width: 100%; overflow: auto">
                                        <asp:GridView ID="GridView1" Font-Names="Arial" Font-Size="12px" runat="server"
                                            AutoGenerateColumns="False" EmptyDataText="No Information Available" DataSourceID="dsEducation"
                                            SkinID="grdNoFooter">
                                            <Columns>
                                                <asp:BoundField DataField="ExamName" HeaderText="Degree Name" SortExpression="ExamName" />
                                                <asp:BoundField DataField="MajorType" HeaderText="Major" SortExpression="MajorType" />
                                                <asp:BoundField DataField="InstitutionName" HeaderText="Institution Name" SortExpression="InstitutionName" />
                                                <asp:BoundField DataField="PassingYear" HeaderText="Passing Year" SortExpression="PassingYear" />
                                                <asp:BoundField DataField="ResultType" HeaderText="Result Type" SortExpression="ResultType" />
                                                <asp:BoundField DataField="Result" HeaderText="Result" SortExpression="Result" />
                                                <asp:BoundField DataField="OutOf" HeaderText="Out Of" SortExpression="OutOf" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:SqlDataSource ID="dsEducation" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                        SelectCommand="SELECT tblExamName.[ExamName] ExamName,tblMajorType.[MajorType] MajorType,tblInstitutionName.InstitutionName InstitutionName ,
                                        [PassingYear],[ResultType],[Result],
                                        case when OutOf =0 then 'N\A'  else CONVERT (nvarchar,OutOf) end as OutOf
                                        FROM [dbo].[tblEmployeeEducationInfo] 
                                        left join dbo.tblInstitutionName on dbo.tblInstitutionName.InstitutionID= [tblEmployeeEducationInfo].InstitutionID 
                                        inner join dbo.tblMajorType on dbo.tblMajorType.MajorTypeID =[tblEmployeeEducationInfo].Major 
                                        inner join dbo.tblExamName on dbo.tblExamName.ExamID=[tblEmployeeEducationInfo].ExamID
                                        where EmployeeID=@EmployeeID" ProviderName="<%$ ConnectionStrings:HRMConnectionString.ProviderName %>">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="EmployeeID" QueryStringField="EmployeeID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
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
                    &nbsp;
                </td>
                <td>
                    <b><u>Professional Certification</u></b>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td align="center">
                    <asp:Panel ID="pnlProfessionalCertification" Width="950px" SkinID="pnlInner" runat="server">
                        <table width="100%">
                            <tr>
                                <td align="center">
                                    <div style="max-height: 200px; max-width: 100%; overflow: auto">
                                        <asp:GridView ID="GridView3" Font-Names="Arial" Font-Size="12px" runat="server"
                                            AutoGenerateColumns="False" EmptyDataText="No Information Available" DataSourceID="dsProCer"
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
                            <tr>
                                <td>
                                    <asp:SqlDataSource ID="dsProCer" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                        SelectCommand="SELECT [CertificationName],[InstituteName],[Location]
                                        ,convert(nvarchar(20),IssuingDate,106) DateFrom,
                                        case when [ExpireDate]='01-01-1911' then '' else convert(nvarchar(20),[ExpireDate],106) end as DateTo
                                        ,case when NeverExpire=1 then 'Never Expire' else '' end as NeverExpire
                                        FROM [dbo].[tblEmployeeProfessionalCertificationInfo] where EmployeeID=@EmployeeID"
                                        ProviderName="<%$ ConnectionStrings:HRMConnectionString.ProviderName %>">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="EmployeeID" QueryStringField="EmployeeID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
