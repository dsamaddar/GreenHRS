<%@ Page Language="VB" MasterPageFile="~/CVMan/HRMCVMaster.master" AutoEventWireup="false"
    CodeFile="CandidateCvView.aspx.vb" Inherits="CandidateCvView" Theme="CommonSkin"
    Title=".:HRM:Submit CV:." %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Panel ID="pnlCanBasicInfo" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%">
                        <tr>
                            <td colspan="8" align="left">
                                <div class="widgettitle">
                                    Basic Information</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label" style="width: 150px">
                                <b>Name</b>
                            </td>
                            <td align="left" style="width: 200px">
                                <asp:TextBox ID="lblName" runat="server" CssClass="InputTxtBox" ReadOnly="True" Width="200px"></asp:TextBox>
                            </td>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label" style="width: 150px">
                                Date of Birth
                            </td>
                            <td align="left" style="width: 200px">
                                <asp:TextBox ID="lblDOB" runat="server" CssClass="InputTxtBox" ReadOnly="True" Width="200px"></asp:TextBox>
                            </td>
                            <td align="left" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="right" rowspan="7" style="width: 150px" valign="top">
                                <table width="100%">
                                    <tr align="center" style="height: 20px">
                                        <td align="left">
                                            <div class="widgettitle">
                                                Photo</div>
                                        </td>
                                    </tr>
                                    <tr align="center">
                                        <td>
                                            <asp:Image ID="imgValidation" runat="server" BorderStyle="Ridge" BorderWidth="2px"
                                                Height="148px" Width="148px" />
                                        </td>
                                    </tr>
                                    <tr align="center" style="height: 20px">
                                        <td align="left">
                                            <div class="widgettitle">
                                                Signature
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Image ID="imgSignature" runat="server" Height="50px" Width="148px" />
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
                                <asp:TextBox ID="lblFatherName" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
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
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                <b class="label">Mother&#39;s Name</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="lblMotherName" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
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
                            <td align="left">
                                &nbsp;
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
                                <asp:TextBox ID="lblSpouseName" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
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
                            <td align="left">
                                &nbsp;
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
                                <asp:TextBox ID="lblGender" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
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
                            <td align="left">
                                &nbsp;
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
                            <td align="left">
                                &nbsp;
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
                                <asp:TextBox ID="lblReligion" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                Passport No
                            </td>
                            <td align="left">
                                <asp:TextBox ID="lblPassportNo" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
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
                                <asp:TextBox ID="lblNoofChildrenAge" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px" Height="50px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                <b class="label">No of Sibblings Name And Occupation</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="lblSibblingsInfo" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px" Height="50px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                <b class="label">Blood Group</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtBloodGroup" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
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
                            <td align="left">
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                <b class="label">Email</b> &nbsp;
                            </td>
                            <td align="left">
                                <asp:TextBox ID="lblEmail" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
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
                                &nbsp;
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
                                <asp:Panel ID="idpreAdd" runat="server" SkinID="pnlInner" Width="395px">
                                    <table style="width: 100%">
                                        <tr>
                                            <td align="left" colspan="3">
                                                <div class="widgettitle">
                                                    Present Address</div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="label" style="width: 20px">
                                            </td>
                                            <td align="left" class="label" style="width: 150px">
                                                <b>Address</b>
                                            </td>
                                            <td align="left" style="width: 200px">
                                                <asp:TextBox ID="lblPreAddress" runat="server" CssClass="InputTxtBox" Height="50px"
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
                                <asp:Panel ID="pnlCanPermanentAddress" runat="server" SkinID="pnlInner" Width="550px">
                                    <table style="width: 100%">
                                        <tr>
                                            <td align="left" colspan="4">
                                                <div class="widgettitle">
                                                    Permanent Address</div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="width: 20px">
                                                &nbsp;
                                            </td>
                                            <td align="left" style="width: 140px">
                                                <b class="label">Address</b>
                                            </td>
                                            <td align="left" style="width: 200px">
                                                <asp:TextBox ID="lblPerAddress" runat="server" CssClass="InputTxtBox" Height="50px"
                                                    ReadOnly="True" TextMode="MultiLine" Width="200px"></asp:TextBox>
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
                                                <b>District</b>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="lblPerDistrict" runat="server" CssClass="InputTxtBox" ReadOnly="True"
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
                                                <b>Thana/ Upazila</b>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="lblPerThana" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                                    Width="200px"></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                &nbsp;
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
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="width: 20px">
                            </td>
                            <td align="left" class="label" style="width: 150px">
                                <b>Alternate Email</b>
                            </td>
                            <td align="left" style="width: 200px">
                                <asp:TextBox ID="lblAltEmail" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" style="width: 150px">
                                <b class="label">Home Phone No.</b>
                            </td>
                            <td align="left" style="width: 200px">
                                <asp:TextBox ID="lblHomePhone" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Office Phone</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="lblOfficePhone" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Year of Experience</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="lblYrExp" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="50px"></asp:TextBox>Years&nbsp;&nbsp;
                                <asp:TextBox ID="lblMonth" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="50px"></asp:TextBox>Month
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Last Drawn Salary</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="lblPreSalary" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="100px"></asp:TextBox>
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Last Drawn Date</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="lblDrawnDate" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="95px"></asp:TextBox>
                            </td>
                            <td>
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
                                <asp:TextBox ID="lblLookingFor" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Available For</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="lblAvailableFor" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td>
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
                                <asp:TextBox ID="lblAboutYrself" runat="server" CssClass="InputTxtBox" Height="50px"
                                    ReadOnly="True" TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                            <td align="left" class="label">
                            </td>
                            <td align="left" colspan="2" valign="top">
                                <div style="max-height: 200px; max-width: 250px; overflow: auto">
                                    <asp:GridView ID="grdSpecilized" runat="server" AutoGenerateColumns="False" CssClass="mGrid"
                                        DataSourceID="dsSpecilized" EmptyDataText="No Information Available" Font-Names="Arial"
                                        Font-Size="12px" SkinID="grdNoFooter" Width="200px">
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
                                            <asp:SessionParameter Name="CandidateID" SessionField="CandidateID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </td>
                            <td>
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
                                <asp:TextBox ID="lblCareerSum" runat="server" CssClass="InputTxtBox" Height="50px"
                                    ReadOnly="True" TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td>
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
                                <asp:TextBox ID="lblLanPro" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Computer Literacy</b>&nbsp;
                            </td>
                            <td align="left">
                                <asp:TextBox ID="lblComLiter" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr visible="false" runat="server">
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Employeer</b>&nbsp;
                            </td>
                            <td align="left">
                                <asp:TextBox ID="lblEmployeer" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Expected Salary</b>&nbsp;
                            </td>
                            <td align="left">
                                <asp:TextBox ID="lblExpSalary" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr visible="false" runat="server">
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                &nbsp;Specilized In
                            </td>
                            <td align="left">
                                <asp:TextBox ID="lblSpecilizedIn" runat="server" CssClass="InputTxtBox" Height="50px"
                                    ReadOnly="True" TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Preferred Job Location</b>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="lblPreferredJobLocation" runat="server" CssClass="InputTxtBox" ReadOnly="True"
                                    Width="200px"></asp:TextBox>
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
        <tr>
            <td>
                <asp:Panel ID="pnlExperienceInfo" Width="100%" SkinID="pnlInner" runat="server">
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
                                    <asp:GridView ID="grdExpInfo" Font-Names="Arial" Font-Size="12px" runat="server"
                                        AutoGenerateColumns="False" EmptyDataText="No Information Available" DataSourceID="dsExp"
                                        SkinID="grdNoFooter" CssClass="mGrid">
                                        <Columns>
                                            <asp:BoundField DataField="CompanyName" HeaderText="Company Name" SortExpression="CompanyName" />
                                            <asp:BoundField DataField="OfficialDesig" HeaderText="Official Designation" SortExpression="OfficialDesig" />
                                            <asp:BoundField DataField="FuncDesig" HeaderText="Functional Designation" SortExpression="FuncDesig" />
                                            <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                                            <asp:BoundField DataField="Responsibilities" HeaderText="Responsibilities" SortExpression="Responsibilities" />
                                            <asp:BoundField DataField="CompanyAddress" HeaderText="Company Address" SortExpression="CompanyAddress" />
                                            <asp:BoundField DataField="CompanyConNo" HeaderText="Contact No" SortExpression="CompanyConNo" />
                                            <asp:BoundField DataField="DateFrom" HeaderText="Date From" SortExpression="DateFrom"
                                                ReadOnly="True" />
                                            <asp:BoundField DataField="DateTo" HeaderText="Date To" SortExpression="DateTo" ReadOnly="True" />
                                            <asp:BoundField DataField="TillDate" HeaderText="Status" SortExpression="TillDate"
                                                ReadOnly="True" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:SqlDataSource ID="dsExp" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="SELECT [CompanyName],OfficialDesig,FuncDesig, Department [Department],[Responsibilities],CompanyAddress,CompanyConNo,
                                        convert(nvarchar(20),[DateFrom],106) DateFrom
                                        ,(case when [DateTo]='01-01-1911' then '' else convert(varchar,[DateTo],106) end)as [DateTo]
                                        ,case when TillDate =1 then 'Till Now' else '' end as TillDate FROM [dbo].[tblCandidateExperienceInfo] 
                                        where CandidateID = @CandidateID

order by CONVERT(datetime,DateFrom) desc" ProviderName="<%$ ConnectionStrings:HRMConnectionString.ProviderName %>">
                                    <SelectParameters>
                                        <asp:SessionParameter SessionField="CandidateID" Name="CandidateID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
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
                                    <asp:GridView ID="GridView3" Font-Names="Arial" Font-Size="12px" runat="server" AutoGenerateColumns="False"
                                        EmptyDataText="No Information Available" DataSourceID="dsProCer" SkinID="grdNoFooter"
                                        CssClass="mGrid">
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
                                        ,convert(nvarchar(20),IssuingDate ,106) DateFrom,
                                        case when [ExpireDate]='01-01-1911' then '' else convert(nvarchar(20),[ExpireDate],106) end as DateTo
                                        ,case when NeverExpire=1 then 'Never Expire' else '' end as NeverExpire
                                        FROM [dbo].[tblCandidateProfessionalCertificationInfo] where CandidateID=@CandidateID
order by Convert(datetime,IssuingDate) desc" ProviderName="<%$ ConnectionStrings:HRMConnectionString.ProviderName %>">
                                    <SelectParameters>
                                        <asp:SessionParameter SessionField="CandidateID" Name="CandidateID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlEducationalInformation" Width="100%" SkinID="pnlInner" runat="server">
                    <table width="100%">
                        <tr>
                            <td>
                                <div class="widgettitle">
                                    Educational Information</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <div style="max-height: 200px; max-width: 100%; overflow: auto">
                                    <asp:GridView ID="GridView1" Font-Names="Arial" Font-Size="12px" runat="server" AutoGenerateColumns="False"
                                        EmptyDataText="No Information Available" DataSourceID="dsEducation" SkinID="grdNoFooter"
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
                        <tr>
                            <td>
                                <asp:SqlDataSource ID="dsEducation" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="SELECT DegreeType,tblExamName.[ExamName] ExamName,tblMajorType.[MajorType] MajorType,OtherInstitutionName,
                                    case when OtherInstitutionName='N\A' then tblInstitutionName.InstitutionName else
                                    'Others'+'('+OtherInstitutionName+')' end as InstitutionName,
                                    [PassingYear],[ResultType],[Result],
                                    case when OutOf =0 then 'N\A'  else CONVERT (nvarchar,OutOf) end as OutOf
                                    FROM [dbo].[tblCandidateEducationInfo] 
                                    left join dbo.tblInstitutionName on dbo.tblInstitutionName.InstitutionID= [tblCandidateEducationInfo].InstitutionID 
                                    inner join dbo.tblMajorType on dbo.tblMajorType.MajorTypeID =[tblCandidateEducationInfo].Major 
                                    inner join dbo.tblExamName on dbo.tblExamName.ExamID=[tblCandidateEducationInfo].ExamID
                                        where CandidateID=@CandidateID
order by PassingYear desc" ProviderName="<%$ ConnectionStrings:HRMConnectionString.ProviderName %>">
                                    <SelectParameters>
                                        <asp:SessionParameter SessionField="CandidateID" Name="CandidateID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
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
                                    <asp:GridView ID="GridView2" Font-Names="Arial" Font-Size="12px" runat="server" AutoGenerateColumns="False"
                                        EmptyDataText="No Information Available" DataSourceID="dsTraining" SkinID="grdNoFooter"
                                        CssClass="mGrid">
                                        <Columns>
                                            <asp:BoundField DataField="TrainingName" HeaderText="Training Topic" SortExpression="TrainingName" />
                                            <asp:BoundField DataField="InstituteName" HeaderText="Institution" SortExpression="InstituteName" />
                                            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                                            <asp:BoundField DataField="TrainingYear" HeaderText="Training Year" SortExpression="TrainingYear" />
                                            <asp:BoundField DataField="TotalTrainingDay" HeaderText="Total Training Day" SortExpression="TotalTrainingDay" />
                                            <asp:BoundField DataField="DateFrom" HeaderText="Date From" SortExpression="DateFrom"
                                                ReadOnly="True" />
                                            <asp:BoundField DataField="DateTo" HeaderText="Date To" SortExpression="DateTo" ReadOnly="True" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:SqlDataSource ID="dsTraining" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="SELECT [TrainingName],[InstituteName] ,tblCountryName.[CountryName] Country ,[TrainingYear],TotalTrainingDay,
                            convert(nvarchar(20),[DateFrom],106) DateFrom,convert(nvarchar(20),[DateTo],106) DateTo
                            FROM [dbo].[tblCandidateTrainingInfo] 
                            join dbo.tblCountryName on dbo.tblCountryName.CountryID=[tblCandidateTrainingInfo].Country where CandidateID=@CandidateID
order by TrainingYear desc" ProviderName="<%$ ConnectionStrings:HRMConnectionString.ProviderName %>">
                                    <SelectParameters>
                                        <asp:SessionParameter SessionField="CandidateID" Name="CandidateID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlReferences" Width="100%" SkinID="pnlInner" runat="server">
                    <table width="100%">
                        <tr>
                            <td align="left">
                                <div class="widgettitle">
                                    References</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <div style="max-height: 200px; max-width: 100%; overflow: auto">
                                    <asp:GridView ID="GridView4" Font-Names="Arial" Font-Size="12px" runat="server" AutoGenerateColumns="False"
                                        EmptyDataText="No Information Available" DataSourceID="dsReferences" SkinID="grdNoFooter"
                                        CssClass="mGrid">
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
                        <tr>
                            <td>
                                <asp:SqlDataSource ID="dsReferences" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="SELECT [Name]   ,[Designation]  ,[OrganizationName]  ,[Address]  ,[MobileNo] ,[Email] ,
                                    (select RefRelationName from dbo.tblReferenceRelationType where RefRelationID=RefRelationWith) RefRelationWith
                                    FROM [dbo].[tblCandidateReferenceInfo] where CandidateID=@CandidateID" ProviderName="<%$ ConnectionStrings:HRMConnectionString.ProviderName %>">
                                    <SelectParameters>
                                        <%--<asp:ControlParameter ControlID="ddlCandidateName" Name="CandidateID" Type="String"
                                    PropertyName="SelectedValue" />--%>
                                        <asp:SessionParameter SessionField="CandidateID" Name="CandidateID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
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
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtDocTypeID" runat="server"></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="DocTypeName" HeaderText="Document Type Name" SortExpression="DocTypeName" />
                                            <asp:TemplateField HeaderText="Download">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkBtnDownloadFile" runat="server" CommandArgument='<%# Eval("FileName") %>'
                                                        CssClass="label" CommandName="Download" OnClick="grdDocumentList_SelectedIndexChanged"
                                                        Text='<%# Eval("FileName") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlDeclaration" runat="server" SkinID="pnlInner" Width="100%">
                    <table width="100%">
                        <tr>
                            <td valign="top" colspan="3" align="left">
                                <div class="widgettitle">
                                    Declaration:</div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:CheckBox ID="chkAccept" Width="950px" CssClass="label" Text="  I declare that the information provided in this application is true & correct. I accept that ULC reserves the right to restrict my application or cancel my application process at any time if any item of information given by me on this application is found to be false or incorrect"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 20px">
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 20px;">
                                &nbsp;
                            </td>
                            <td align="center">
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="styled-button-1 "
                                    OnClientClick="if (!confirm('Are you Sure to Submit as you will not change or modify your profile after submitting ?')) return false" />
                                &nbsp;
                                <asp:Label ID="lblMsg" runat="server" Height="20px"></asp:Label>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
