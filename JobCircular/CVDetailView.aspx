<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CVDetailView.aspx.vb" Theme="CommonSkin"
    Inherits="JobCircular_CVDetailView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 77%;
        }
    </style>
</head>
<body>
    <link href="../Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
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
                    <asp:Panel ID="pnl" runat="server" Width="900px" SkinID="pnlInner">
                        <table style="width: 100%;" class="backColor">
                            <tr style="width: 100%;">
                                <td class="style1">
                                    <table width="600">
                                        <tr>
                                            <td align="left" style="width: 14%;" class="label">
                                                <b>Name</b>
                                            </td>
                                            <td style="width: 1%;">
                                                <b>:</b>
                                            </td>
                                            <td align="left" style="width: 35%;">
                                                <asp:TextBox ID="lblName" runat="server" ReadOnly="true" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="width: 14%;">
                                                <b class="label">Father's Name</b>
                                            </td>
                                            <td style="width: 1%;">
                                                <b>:</b>
                                            </td>
                                            <td align="left" style="width: 35%;">
                                                <asp:TextBox ID="lblFatherName" runat="server" Width="200px" CssClass="InputTxtBox"
                                                    ReadOnly="true"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="width: 14%;">
                                                <b class="label">Father's Occupation</b>
                                            </td>
                                            <td style="width: 1%;">
                                                <b>:</b>
                                            </td>
                                            <td align="left" style="width: 35%;">
                                                <asp:TextBox ID="lblFatherOccupation" ReadOnly="true" runat="server" Width="200px"
                                                    CssClass="InputTxtBox"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="label">
                                            <td align="left" style="width: 14%;">
                                                <b>Mother's Name</b>
                                            </td>
                                            <td style="width: 1%;">
                                                <b>:</b>
                                            </td>
                                            <td align="left" style="width: 35%;">
                                                <asp:TextBox ID="lblMotherName" runat="server" Width="200px" CssClass="InputTxtBox"
                                                    ReadOnly="true"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="width: 14%;">
                                                <b class="label">Mother's Occupation</b>
                                            </td>
                                            <td style="width: 1%;">
                                                <b>:</b>
                                            </td>
                                            <td align="left" style="width: 35%;">
                                                <asp:TextBox ID="lblMotherOccupation" runat="server" Width="200px" CssClass="InputTxtBox"
                                                    ReadOnly="true"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="width: 14%;">
                                                <b class="label">Spouse Name</b>
                                            </td>
                                            <td style="width: 1%;">
                                                <b>:</b>
                                            </td>
                                            <td align="left" style="width: 35%;">
                                                <asp:TextBox ID="lblSpouseName" runat="server" Width="200px" CssClass="InputTxtBox"
                                                    ReadOnly="true"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="width: 14%;">
                                                <b class="label">Spouse Occupation</b>
                                            </td>
                                            <td style="width: 1%;">
                                                <b>:</b>
                                            </td>
                                            <td align="left" style="width: 35%;">
                                                <asp:TextBox ID="lblSpouseOccupation" ReadOnly="true" runat="server" Width="200px"
                                                    CssClass="InputTxtBox"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="width: 14%;" class="label ">
                                                <b>Gender</b>
                                            </td>
                                            <td style="width: 1%;">
                                                <b>:</b>
                                            </td>
                                            <td align="left" style="width: 35%;">
                                                <asp:TextBox ID="lblGender" runat="server" Width="200px" CssClass="InputTxtBox" ReadOnly="true"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="width: 14%;" class="label">
                                                <b>Relationship Status</b>
                                            </td>
                                            <td style="width: 1%;">
                                                <b>:</b>
                                            </td>
                                            <td align="left" style="width: 35%;">
                                                <asp:TextBox ID="lblRelStatus" ReadOnly="true" runat="server" Width="200px" CssClass="InputTxtBox"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="width: 14%;" class="label">
                                                <b>Blood Group</b>
                                            </td>
                                            <td style="width: 1%;">
                                                <b>:</b>
                                            </td>
                                            <td align="left" style="width: 35%;">
                                                <asp:TextBox ID="txtBloodGroup" ReadOnly="true" runat="server" Width="200px" CssClass="InputTxtBox"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="width: 14%;" class="label">
                                                <b>NID</b>
                                            </td>
                                            <td style="width: 1%;">
                                                <b>:</b>
                                            </td>
                                            <td align="left" style="width: 35%;">
                                                <asp:TextBox ID="lblNID" runat="server" Width="200px" CssClass="InputTxtBox" ReadOnly="true"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="label">
                                            <td align="left" style="width: 14%;" class="label">
                                                <b>Nationality</b>
                                            </td>
                                            <td style="width: 1%;">
                                                <b>:</b>
                                            </td>
                                            <td align="left" style="width: 35%;">
                                                <asp:TextBox ID="lblNationality" runat="server" Width="200px" CssClass="InputTxtBox"
                                                    ReadOnly="true"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="width: 14%;" class="label">
                                                <b>Religion</b>
                                            </td>
                                            <td style="width: 1%;">
                                                <b>:</b>
                                            </td>
                                            <td align="left" style="width: 35%;">
                                                <asp:TextBox ID="lblReligion" runat="server" Width="200px" ReadOnly="true" CssClass="InputTxtBox"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="width: 14%;">
                                                <b class="label">No of Children and Age</b>
                                            </td>
                                            <td style="width: 1%;">
                                                <b>:</b>
                                            </td>
                                            <td align="left" style="width: 35%;">
                                                <asp:TextBox ID="lblNoofChildrenAge" runat="server" Height="50px" TextMode="MultiLine"
                                                    Width="200px" CssClass="InputTxtBox" ReadOnly="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="width: 14%;">
                                                <b class="label">No of Sibblings Name And Occupation</b>
                                            </td>
                                            <td style="width: 1%;">
                                                <b>:</b>
                                            </td>
                                            <td align="left" style="width: 35%;">
                                                <asp:TextBox ID="lblSibblingsInfo" runat="server" Width="200px" Height="50px" CssClass="InputTxtBox"
                                                    TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="width: 30%;">
                                    <table>
                                        <tr>
                                            <td align="left">
                                                <asp:Image ID="imgValidation" runat="server" Width="180px" Height="200px" BorderStyle="Ridge"
                                                    BorderWidth="2px" />
                                                &nbsp;&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="width: 30%;">
                                    &nbsp;
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
                <td style="width: 50%;">
                    <table width="100%">
                        <tr align="center">
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <b><u>Present Address</u></b>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                                &nbsp;
                            </td>
                            <td align="right">
                                <asp:Panel runat="server" ID="idpreAdd" Width="400px" SkinID="pnlInner" Style="margin-left: 0px">
                                    <table class="backColor">
                                        <tr>
                                            <td align="left" style="width: 14%;" class="label">
                                                <b>Address</b>
                                            </td>
                                            <td align="left" style="width: 1%;">
                                                <b>:</b>
                                            </td>
                                            <td align="left" style="width: 35%;">
                                                <asp:TextBox ID="lblPreAddress" runat="server" Width="200px" CssClass="InputTxtBox"
                                                    Height="50px" TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="width: 14%;" class="label">
                                                <b>District</b>
                                            </td>
                                            <td align="left" style="width: 1%;">
                                                <b>:</b>
                                            </td>
                                            <td align="left" style="width: 14%;">
                                                <asp:TextBox ID="lblPreDistrict" runat="server" Width="200px" CssClass="InputTxtBox"
                                                    ReadOnly="true"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="width: 14%;" class="label">
                                                <b>Thana/ Upazila</b>
                                            </td>
                                            <td align="left" style="width: 1%;">
                                                <b>:</b>
                                            </td>
                                            <td align="left" style="width: 35%;">
                                                <asp:TextBox ID="lblPreThana" runat="server" Width="200px" CssClass="InputTxtBox"
                                                    ReadOnly="true"></asp:TextBox>
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
                </td>
                <td style="width: 50%;">
                    <table width="100%">
                        <tr align="center">
                            <td>
                                <b><u>Permanent Address</u></b>
                            </td>
                            <td align="center">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="center">
                            <td align="left">
                                <asp:Panel runat="server" ID="Panel1" Width="400px" SkinID="pnlInner">
                                    <table class="backColor">
                                        <tr>
                                            <td align="left" style="width: 14%;">
                                                <b>Address</b>
                                            </td>
                                            <td align="left" style="width: 1%;">
                                                <b>:</b>
                                            </td>
                                            <td align="left" style="width: 35%;">
                                                <asp:TextBox ID="lblPerAddress" runat="server" Width="200px" CssClass="InputTxtBox"
                                                    Height="50px" TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="width: 14%;" class="label">
                                                <b>District</b>
                                            </td>
                                            <td align="left" style="width: 1%;">
                                                <b>:</b>
                                            </td>
                                            <td align="left" style="width: 35%;">
                                                <asp:TextBox ID="lblPerDistrict" runat="server" Width="200px" CssClass="InputTxtBox"
                                                    ReadOnly="true"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="width: 14%;" class="label">
                                                <b>Thana/ Upazila</b>
                                            </td>
                                            <td align="left" style="width: 1%;">
                                                <b>:</b>
                                            </td>
                                            <td align="left" style="width: 35%;">
                                                <asp:TextBox ID="lblPerThana" runat="server" Width="200px" CssClass="InputTxtBox"
                                                    ReadOnly="true"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table width="100%">
            <tr align="center">
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
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
                    <asp:Panel ID="Panel2" runat="server" Width="900px" SkinID="pnlInner">
                        <table style="width: 100%;" class="backColor">
                            <tr>
                                <td align="left" style="width: 14%;" class="label">
                                    <b class="label">Mobile No</b>
                                </td>
                                <td style="width: 1%;">
                                    <b>:</b>
                                </td>
                                <td align="left" style="width: 35%;">
                                    <asp:TextBox ID="lblMobileNo" runat="server" Width="200px" CssClass="InputTxtBox"
                                        ReadOnly="true"></asp:TextBox>
                                </td>
                                <%--<caption>--%>
                                <td align="left" class="label" style="width: 14%;">
                                    <b class="label">Home Phone No.</b>
                                </td>
                                <td style="width: 1%;">
                                    <b>:</b>
                                </td>
                                <td align="left" style="width: 35%;">
                                    <asp:TextBox ID="lblHomePhone" runat="server" CssClass="InputTxtBox" ReadOnly="true"
                                        Width="200px"></asp:TextBox>
                                </td>
                                <%--</caption>--%>
                            </tr>
                            <tr>
                                <td align="left" style="width: 14%;" class="label">
                                    <b>Office Phone</b>
                                </td>
                                <td style="width: 1%;">
                                    <b>:</b>
                                </td>
                                <td align="left" style="width: 35%;">
                                    <asp:TextBox ID="lblOfficePhone" runat="server" Width="200px" CssClass="InputTxtBox"
                                        ReadOnly="true"></asp:TextBox>
                                </td>
                                <%--<caption>--%>
                                <td align="left" class="label" style="width: 14%;">
                                    <b>Year of Experience</b>
                                </td>
                                <td style="width: 1%;">
                                    <b>:</b>
                                </td>
                                <td align="left" style="width: 35%;">
                                    <asp:TextBox ID="lblYrExp" runat="server" CssClass="InputTxtBox" ReadOnly="true"
                                        Width="200px"></asp:TextBox>
                                </td>
                                <%--</caption>--%>
                            </tr>
                            <tr>
                                <td align="left" style="width: 14%;" class="label">
                                    <b>Email</b>
                                </td>
                                <td style="width: 1%;">
                                    <b>:</b>
                                </td>
                                <td align="left" style="width: 35%;">
                                    <asp:TextBox ID="lblEmail" runat="server" Width="200px" CssClass="InputTxtBox" ReadOnly="true"></asp:TextBox>
                                </td>
                                <%-- <caption>--%>
                                <td align="left" class="label" style="width: 14%;">
                                    <b>Alternate Email</b>
                                </td>
                                <td style="width: 1%;">
                                    <b>:</b>
                                </td>
                                <td align="left" style="width: 35%;">
                                    <asp:TextBox ID="lblAltEmail" runat="server" CssClass="InputTxtBox" ReadOnly="true"
                                        Width="200px"></asp:TextBox>
                                </td>
                                <%--</caption>--%>
                            </tr>
                            <tr>
                                <td align="left" style="width: 14%;" class="label">
                                    <b>Last Drawn Salary</b>
                                </td>
                                <td style="width: 1%;">
                                    <b>:</b>
                                </td>
                                <td align="left" style="width: 35%;">
                                    <asp:TextBox ID="lblPreSalary" runat="server" Width="100px" CssClass="InputTxtBox"
                                        ReadOnly="true"></asp:TextBox>
                                </td>
                                <%--<caption>--%>
                                <td align="left" class="label" style="width: 14%;">
                                    <b>Last Drawn Date</b>
                                </td>
                                <td style="width: 1%;">
                                    <b>:</b>
                                </td>
                                <td align="left" style="width: 35%;">
                                    <asp:TextBox ID="lblDrawnDate" runat="server" CssClass="InputTxtBox" ReadOnly="true"
                                        Width="95px"></asp:TextBox>
                                </td>
                                <%-- </caption>--%>
                            </tr>
                            <tr>
                                <td align="left" style="width: 14%;" class="label">
                                    <b>Looging For</b>
                                </td>
                                <td style="width: 1%;">
                                    <b>:</b>
                                </td>
                                <td align="left" style="width: 35%;">
                                    <asp:TextBox ID="lblLookingFor" runat="server" Width="200px" CssClass="InputTxtBox"
                                        ReadOnly="true"></asp:TextBox>
                                </td>
                                <%--  <caption>--%>
                                <td align="left" class="label" style="width: 14%;">
                                    <b>Available For</b>
                                </td>
                                <td style="width: 1%;">
                                    <b>:</b>
                                </td>
                                <td align="left" style="width: 35%;">
                                    <asp:TextBox ID="lblAvailableFor" runat="server" CssClass="InputTxtBox" ReadOnly="true"
                                        Width="200px"></asp:TextBox>
                                </td>
                                <%--</caption>--%>
                            </tr>
                            <tr>
                                <td align="left" class="label" style="width: 14%;">
                                    <b>Signature</b>
                                </td>
                                <td style="width: 1%;">
                                    <b>:</b>
                                </td>
                                <td align="left" style="width: 35%;">
                                    <asp:Image ID="imgSignature" runat="server" Height="50px" Width="180px" />
                                    &nbsp;&nbsp;
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr visible="false" runat="server">
                                <td align="left" style="width: 14%;" class="label">
                                    <b>English Language Proficiency </b>
                                </td>
                                <td style="width: 1%;">
                                    <b>:</b>
                                </td>
                                <td align="left" style="width: 35%;">
                                    <asp:TextBox ID="lblLanPro" runat="server" CssClass="InputTxtBox" ReadOnly="true"
                                        Width="200px"></asp:TextBox>
                                </td>
                                <td align="left" class="label" style="width: 14%;">
                                    <b>Computer Literacy </b>
                                </td>
                                <td style="width: 1%;">
                                    <b>:</b>
                                </td>
                                <td align="left" style="width: 35%;">
                                    <asp:TextBox ID="lblComLiter" runat="server" CssClass="InputTxtBox" ReadOnly="true"
                                        Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr visible="false" runat="server">
                                <td align="left" class="label" style="width: 14%;">
                                    <b>Career Objective </b>
                                </td>
                                <td style="width: 1%;">
                                    <b>:</b>
                                </td>
                                <td align="left" style="width: 35%;">
                                    <asp:TextBox ID="lblCareerSum" runat="server" CssClass="InputTxtBox" Height="50px"
                                        ReadOnly="True" TextMode="MultiLine" Width="200px"></asp:TextBox>
                                </td>
                                <%--<caption>--%>
                                <%--&nbsp;--%>
                                <td align="left" class="label" style="width: 14%;">
                                    <b>Preferred Job Location </b>
                                </td>
                                <td style="width: 1%;">
                                    <b>:</b>
                                </td>
                                <td align="left" style="width: 35%;">
                                    <asp:TextBox ID="lblPreferredJobLocation" runat="server" CssClass="InputTxtBox" ReadOnly="true"
                                        Width="200px"></asp:TextBox>
                                </td>
                                <%--</caption>--%>
                            </tr>
                            <tr visible="false" runat="server">
                                <td align="left" class="label" style="width: 14%;">
                                    &nbsp;
                                </td>
                                <td style="width: 1%;">
                                    &nbsp;
                                </td>
                                <td align="left" style="width: 35%;">
                                    &nbsp;
                                </td>
                                <td align="left" class="label" style="width: 14%;">
                                    &nbsp;
                                </td>
                                <td style="width: 1%;">
                                    &nbsp;
                                </td>
                                <td align="left" style="width: 35%;">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr visible="false" runat="server">
                                <td align="left" class="label" style="width: 14%;">
                                    <b>Employeer</b>&nbsp;
                                </td>
                                <td style="width: 1%;">
                                    <b>:</b>
                                </td>
                                <td align="left" style="width: 35%;">
                                    <asp:TextBox ID="lblEmployeer" runat="server" CssClass="InputTxtBox" ReadOnly="true"
                                        Width="200px"></asp:TextBox>
                                </td>
                                <td align="left" class="label" style="width: 14%;">
                                    <b>Expected Salary</b>
                                </td>
                                <td style="width: 1%;">
                                    <b>:</b>&nbsp;
                                </td>
                                <td align="left" style="width: 35%;">
                                    <asp:TextBox ID="lblExpSalary" runat="server" CssClass="InputTxtBox" ReadOnly="true"
                                        Width="200px"></asp:TextBox>
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
                    <asp:Panel ID="Panel3" Width="900px" SkinID="pnlInner" runat="server">
                        <table width="100%">
                            <tr>
                                <td align="center">
                                    <asp:GridView ID="grdExpInfo" Width="700px" Font-Names="Arial" Font-Size="12px" CellPadding="4"
                                        ForeColor="#333333" GridLines="None" runat="server" AutoGenerateColumns="False"
                                        EmptyDataText="No Information Available" DataSourceID="dsExp">
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <Columns>
                                            <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
                                            <asp:BoundField DataField="PositionHeld" HeaderText="PositionHeld" SortExpression="PositionHeld" />
                                            <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                                            <asp:BoundField DataField="Responsibilities" HeaderText="Responsibilities" SortExpression="Responsibilities" />
                                            <asp:BoundField DataField="DateFrom" HeaderText="DateFrom" SortExpression="DateFrom"
                                                ReadOnly="True" />
                                            <asp:BoundField DataField="DateTo" HeaderText="DateTo" SortExpression="DateTo" ReadOnly="True" />
                                            <asp:BoundField DataField="TillDate" HeaderText="TillDate" SortExpression="TillDate"
                                                ReadOnly="True" />
                                        </Columns>
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#999999" />
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:SqlDataSource ID="dsExp" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                        SelectCommand="SELECT [CompanyName],[PositionHeld], Department [Department],[Responsibilities],
                                        convert(nvarchar(20),[DateFrom],106) DateFrom
                                        ,(case when [DateTo]='01-01-1911' then '' else convert(varchar,[DateTo],106) end)as [DateTo]
                                        ,case when TillDate =1 then 'Till Date' else '' end as TillDate FROM [dbo].[tblCandidateExperienceInfo] 
                                inner join dbo.tblAppliedJob on dbo.tblAppliedJob.CandidateID=[tblCandidateExperienceInfo].CandidateID
                                where dbo.tblAppliedJob.CircularID =@CircularID and [tblCandidateExperienceInfo].CandidateID=@CandidateID"
                                        ProviderName="<%$ ConnectionStrings:HRMConnectionString.ProviderName %>">
                                        <SelectParameters>
                                            <asp:QueryStringParameter QueryStringField="CircularID" Name="CircularID" />
                                            <asp:QueryStringParameter QueryStringField="CandidateID" Name="CandidateID" />
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
                    <asp:Panel ID="Panel4" Width="900px" SkinID="pnlInner" runat="server">
                        <table width="100%">
                            <tr>
                                <td align="center">
                                    <asp:GridView ID="grdEducationInformation" Width="700px" Font-Names="Arial" Font-Size="12px"
                                        CellPadding="4" ForeColor="#333333" GridLines="None" runat="server" AutoGenerateColumns="False"
                                        EmptyDataText="No Information Available" DataSourceID="dsEducation">
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <Columns>
                                            <asp:BoundField DataField="ExamID" HeaderText="ExamName" SortExpression="ExamID" />
                                            <asp:BoundField DataField="Major" HeaderText="Major" SortExpression="Major" />
                                            <asp:BoundField DataField="InstitutionName" HeaderText="InstitutionName" SortExpression="InstitutionName" />
                                            <asp:BoundField DataField="PassingYear" HeaderText="PassingYear" SortExpression="PassingYear" />
                                            <asp:BoundField DataField="ResultType" HeaderText="ResultType" SortExpression="ResultType" />
                                            <asp:BoundField DataField="Result" HeaderText="Result" SortExpression="Result" />
                                            <asp:BoundField DataField="OutOf" HeaderText="OutOf" SortExpression="OutOf" />
                                        </Columns>
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#999999" />
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:SqlDataSource ID="dsEducation" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                        SelectCommand="SELECT tblExamName.[ExamName] ExamName,tblMajorType.[MajorType] MajorType,tblInstitutionName.InstitutionName InstitutionName ,
                                        [PassingYear],[ResultType],[Result],
                                        case when OutOf =0 then 'N\A'  else CONVERT (nvarchar,OutOf) end as OutOf
                                        FROM [dbo].[tblCandidateEducationInfo] 
                                        left join dbo.tblInstitutionName on dbo.tblInstitutionName.InstitutionID= [tblCandidateEducationInfo].InstitutionID 
                                        inner join dbo.tblMajorType on dbo.tblMajorType.MajorTypeID =[tblCandidateEducationInfo].Major 
                                        inner join dbo.tblExamName on dbo.tblExamName.ExamID=[tblCandidateEducationInfo].ExamID
                            inner join dbo.tblAppliedJob on dbo.tblAppliedJob.CandidateID=[tblCandidateEducationInfo].CandidateID
                            where dbo.tblAppliedJob.CircularID =@CircularID and [tblCandidateEducationInfo].CandidateID=@CandidateID"
                                        ProviderName="<%$ ConnectionStrings:HRMConnectionString.ProviderName %>">
                                        <SelectParameters>
                                            <asp:QueryStringParameter QueryStringField="CircularID" Name="CircularID" />
                                            <asp:QueryStringParameter QueryStringField="CandidateID" Name="CandidateID" />
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
                    <b><u>Training Information</u></b>
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
                    <asp:Panel ID="Panel5" Width="900px" SkinID="pnlInner" runat="server">
                        <table width="100%">
                            <tr>
                                <td align="center">
                                    <asp:GridView ID="grdTraining" Width="700px" Font-Names="Arial" Font-Size="12px"
                                        CellPadding="4" ForeColor="#333333" GridLines="None" runat="server" AutoGenerateColumns="False"
                                        EmptyDataText="No Information Available" DataSourceID="dsTraining">
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <Columns>
                                            <asp:BoundField DataField="TrainingName" HeaderText="TrainingTopic" SortExpression="TrainingName" />
                                            <asp:BoundField DataField="InstituteName" HeaderText="InstituteName" SortExpression="InstituteName" />
                                            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                                            <asp:BoundField DataField="TrainingYear" HeaderText="TrainingYear" SortExpression="TrainingYear" />
                                            <asp:BoundField DataField="TotalTrainingDay" HeaderText="Total Training Day" SortExpression="TotalTrainingDay" />
                                            <asp:BoundField DataField="DateFrom" HeaderText="DateFrom" SortExpression="DateFrom"
                                                ReadOnly="True" />
                                            <asp:BoundField DataField="DateTo" HeaderText="DateTo" SortExpression="DateTo" ReadOnly="True" />
                                        </Columns>
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#999999" />
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:SqlDataSource ID="dsTraining" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                        SelectCommand="SELECT [TrainingName],[InstituteName] ,[Country],[TrainingYear],TotalTrainingDay,
                            convert(nvarchar(20),[DateFrom],106) DateFrom,convert(nvarchar(20),[DateTo],106) DateTo
                            FROM [HRM].[dbo].[tblCandidateTrainingInfo]
                            inner join dbo.tblAppliedJob on dbo.tblAppliedJob.CandidateID=[tblCandidateTrainingInfo].CandidateID
                            where dbo.tblAppliedJob.CircularID =@CircularID and [tblCandidateTrainingInfo].CandidateID=@CandidateID"
                                        ProviderName="<%$ ConnectionStrings:HRMConnectionString.ProviderName %>">
                                        <SelectParameters>
                                            <asp:QueryStringParameter QueryStringField="CircularID" Name="CircularID" />
                                            <asp:QueryStringParameter QueryStringField="CandidateID" Name="CandidateID" />
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
                    <asp:Panel ID="Panel6" Width="900px" SkinID="pnlInner" runat="server">
                        <table width="100%">
                            <tr>
                                <td align="center">
                                    <asp:GridView ID="grdProCer" Width="700px" Font-Names="Arial" Font-Size="12px" CellPadding="4"
                                        ForeColor="#333333" GridLines="None" runat="server" AutoGenerateColumns="False"
                                        EmptyDataText="No Information Available" DataSourceID="dsProCer">
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <Columns>
                                            <asp:BoundField DataField="CertificationName" HeaderText="CertificationName" SortExpression="CertificationName" />
                                            <asp:BoundField DataField="InstituteName" HeaderText="InstituteName" SortExpression="InstituteName" />
                                            <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                                            <asp:BoundField DataField="DateFrom" HeaderText="IssuingDate" SortExpression="DateFrom" />
                                            <asp:BoundField DataField="DateTo" HeaderText="ExpireDate" SortExpression="DateTo" />
                                            <asp:BoundField DataField="NeverExpire" HeaderText="Status" SortExpression="NeverExpire" />
                                        </Columns>
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#999999" />
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:SqlDataSource ID="dsProCer" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                        SelectCommand="SELECT [CertificationName],[InstituteName],[Location]
                                        ,convert(nvarchar(20),IssuingDate ,106) DateFrom,
                                        case when [ExpireDate]='01-01-1911' then '' else convert(nvarchar(20),[ExpireDate],106) end as DateTo
                                        ,case when NeverExpire=1 then 'Never Expire' else '' end as NeverExpire
                                        FROM [dbo].[tblCandidateProfessionalCertificationInfo]
                            inner join dbo.tblAppliedJob on dbo.tblAppliedJob.CandidateID=[tblCandidateProfessionalCertificationInfo].CandidateID
                            where dbo.tblAppliedJob.CircularID =@CircularID and [tblCandidateProfessionalCertificationInfo].CandidateID=@CandidateID"
                                        ProviderName="<%$ ConnectionStrings:HRMConnectionString.ProviderName %>">
                                        <SelectParameters>
                                            <asp:QueryStringParameter QueryStringField="CircularID" Name="CircularID" />
                                            <asp:QueryStringParameter QueryStringField="CandidateID" Name="CandidateID" />
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
                    <b><u>References</u></b>
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
                    <asp:Panel ID="Panel7" Width="900px" SkinID="pnlInner" runat="server">
                        <table width="100%">
                            <tr>
                                <td align="center">
                                    <asp:GridView ID="grdReferences" Width="700px" Font-Names="Arial" Font-Size="12px"
                                        CellPadding="4" ForeColor="#333333" GridLines="None" runat="server" AutoGenerateColumns="False"
                                        EmptyDataText="No Information Available" DataSourceID="dsReferences">
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <Columns>
                                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                            <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" />
                                            <asp:BoundField DataField="OrganizationName" HeaderText="OrganizationName" SortExpression="OrganizationName" />
                                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                                            <asp:BoundField DataField="MobileNo" HeaderText="MobileNo" SortExpression="MobileNo" />
                                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                        </Columns>
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#999999" />
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:SqlDataSource ID="dsReferences" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                        SelectCommand="SELECT [Name]   ,[Designation]  ,[OrganizationName]  ,[Address]  ,[MobileNo] ,[Email] 
                             FROM [HRM].[dbo].[tblCandidateReferenceInfo] 
                             inner join dbo.tblAppliedJob on dbo.tblAppliedJob.CandidateID=[tblCandidateReferenceInfo].CandidateID
                            where dbo.tblAppliedJob.CircularID =@CircularID and [tblCandidateReferenceInfo].CandidateID=@CandidateID"
                                        ProviderName="<%$ ConnectionStrings:HRMConnectionString.ProviderName %>">
                                        <SelectParameters>
                                            <asp:QueryStringParameter QueryStringField="CircularID" Name="CircularID" />
                                            <asp:QueryStringParameter QueryStringField="CandidateID" Name="CandidateID" />
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
            <tr>
                <td align="left">
                    &nbsp;
                </td>
                <td align="center">
                    <asp:Button ID="btnReviewed" CssClass="styled-button-1" runat="server" Text="Reviewed"
                        OnClientClick="return confirm('Are you sure you want to Review selected items?');" />&nbsp;
                    <asp:Button ID="btnReject" CssClass="styled-button-1" runat="server" Text="Reject"
                        OnClientClick="return confirm('Are you sure you want to Reject selected items?');" />
                </td>
                <td align="left">
                    &nbsp;
                </td>
                <%--td align="left">
                            &nbsp;
                        </td>
                        <td align="left">
                            &nbsp;
                        </td>
                        <td align="left">
                            &nbsp;
                        </td>--%>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
