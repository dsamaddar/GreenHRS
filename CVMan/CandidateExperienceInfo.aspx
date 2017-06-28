<%@ Page Language="VB" MasterPageFile="~/CVMan/HRMCVMaster.master" AutoEventWireup="false"
    CodeFile="CandidateExperienceInfo.aspx.vb" Inherits="CandidateExperienceInfo"
    Title=".:HRM:Can. Experience Info:." Theme="CommonSkin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../Sources/css/ValidatorStyle.css" rel="stylesheet" type="text/css" />

    <script src="../Sources/js/jquery.min.js" type="text/javascript"></script>

    <script src="../Sources/js/MaxLength.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            //Specifying the Character Count control explicitly
            $("[id*=txtResponsibilities]").MaxLength(
            {
                MaxLength: 400,
                CharacterCountControl: $('#counter')
            });
            
            //Specifying the Character Count control explicitly
            $("[id*=txtAddress]").MaxLength(
            {
                MaxLength: 400,
                CharacterCountControl: $('#counter2')
            });
        });
    </script>

    <table style="width: 100%;">
        <tr align="center" id="forMessage" runat="server">
            <td>
                <asp:Label ID="lblMessageForExp" runat="server" Width="100%" Height="25px" BackColor="#195227"
                    ForeColor="Red" CssClass="blinkytext"></asp:Label>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Label ID="lblRedirectMsg" runat="server" Width="100%" Height="25px" BackColor="#195227"
                    ForeColor="Red" CssClass="blinkytext"></asp:Label>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlCanExperienceInfo" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%; color: #008000; font-weight: bold; font-style: normal;">
                        <tr>
                            <td align="left" colspan="4">
                                <div class="widget-title">
                                    Experience Info [Please Save Before Leaving This Page]<asp:ScriptManager ID="ScriptManager1"
                                        runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                            </td>
                            <td align="left" align="center" class="label" colspan="2" style="color: Green;">
                                Give Details of all full-time employment, starting from the most <b><u>recent</u></b>
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Company Name<span class="RequiredLabel">*</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCompanyName" runat="server" CssClass="InputTxtBox" Width="250px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFldCompanyName" runat="server" ControlToValidate="txtCompanyName"
                                    ErrorMessage="Company Name Required" ValidationGroup="SubmitCan" Display="None"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldCompanyName_ValidatorCalloutExtender" runat="server"
                                    Enabled="True" TargetControlID="reqFldCompanyName" CssClass="customCalloutStyle"
                                    CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td align="left" class="label">
                                Official Designation<span class="RequiredLabel">*</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtOfficialDesig" runat="server" CssClass="InputTxtBox" Width="250px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFldOfficialDesig" runat="server" ControlToValidate="txtOfficialDesig"
                                    ErrorMessage="Official Designation Required" ValidationGroup="SubmitCan" Display="None"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldOfficialDesig_ValidatorCalloutExtender" runat="server"
                                    Enabled="True" TargetControlID="reqFldOfficialDesig" CssClass="customCalloutStyle"
                                    CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Functional Designation
                            </td>
                            <td>
                                <asp:TextBox ID="txtFunctionalDesig" runat="server" CssClass="InputTxtBox" Width="250px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Department<span class="RequiredLabel">*</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDepartment" runat="server" CssClass="InputTxtBox" Width="250px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ReqFldDepartment" runat="server" ControlToValidate="txtDepartment"
                                    ErrorMessage="Department Required" ValidationGroup="SubmitCan" Display="None"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="ReqFldDepartment_ValidatorCalloutExtender" runat="server"
                                    Enabled="True" TargetControlID="ReqFldDepartment" CssClass="customCalloutStyle"
                                    CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Major Responsibilities</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left" style="float: left">
                                <asp:TextBox ID="txtResponsibilities" runat="server" TextMode="MultiLine" CssClass="InputTxtBox"
                                    Width="250px" Height="42px" MaxLength="500"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ReqFldValidatorResponsibilities" runat="server" ControlToValidate="txtResponsibilities"
                                    ErrorMessage="Major Responsibilities Required" ValidationGroup="SubmitCan" Display="None"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="ReqFldValidatorResponsibilities_ValidatorCalloutExtender"
                                    runat="server" Enabled="True" TargetControlID="ReqFldValidatorResponsibilities"
                                    CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                                <div id="counter" style="color: Red; font-family: Verdana">
                                </div>
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
                                <b>Company Address/ Website</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left" style="float: left">
                                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" CssClass="InputTxtBox"
                                    Width="250px" Height="42px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ReqFldValidatorAddress" runat="server" ControlToValidate="txtAddress"
                                    ErrorMessage="Company Address/ Website Required" ValidationGroup="SubmitCan"
                                    Display="None"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="ReqFldValidatorAddress_ValidatorCalloutExtender"
                                    runat="server" Enabled="True" TargetControlID="ReqFldValidatorAddress" CssClass="customCalloutStyle"
                                    CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                                <div id="counter2" style="color: Red; font-family: Verdana">
                                </div>
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
                                <b>Company Contact No.</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtContactNo" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ReqFldValidatorContactNo" runat="server" ControlToValidate="txtContactNo"
                                    ErrorMessage="Company Contact No. Required" ValidationGroup="SubmitCan" Display="None"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="ReqFldValidatorContactNo_ValidatorCalloutExtender"
                                    runat="server" Enabled="True" TargetControlID="ReqFldValidatorContactNo" CssClass="customCalloutStyle"
                                    CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
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
                                <b>Date From</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="drpMonth" runat="server" CssClass="InputTxtBox" Width="82px"
                                    Font-Size="13px">
                                    <asp:ListItem>MM</asp:ListItem>
                                    <asp:ListItem Value="1">January</asp:ListItem>
                                    <asp:ListItem Value="2">February</asp:ListItem>
                                    <asp:ListItem Value="3">March</asp:ListItem>
                                    <asp:ListItem Value="4">April</asp:ListItem>
                                    <asp:ListItem Value="5">May</asp:ListItem>
                                    <asp:ListItem Value="6">June</asp:ListItem>
                                    <asp:ListItem Value="7">July</asp:ListItem>
                                    <asp:ListItem Value="8">August</asp:ListItem>
                                    <asp:ListItem Value="9">September</asp:ListItem>
                                    <asp:ListItem Value="10">October</asp:ListItem>
                                    <asp:ListItem Value="11">November</asp:ListItem>
                                    <asp:ListItem Value="12">December</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;<asp:DropDownList ID="drpDay" runat="server" CssClass="InputTxtBox" Width="80px"
                                    Font-Size="13px">
                                    <asp:ListItem>DD</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>11</asp:ListItem>
                                    <asp:ListItem>12</asp:ListItem>
                                    <asp:ListItem>13</asp:ListItem>
                                    <asp:ListItem>14</asp:ListItem>
                                    <asp:ListItem>15</asp:ListItem>
                                    <asp:ListItem>16</asp:ListItem>
                                    <asp:ListItem>17</asp:ListItem>
                                    <asp:ListItem>18</asp:ListItem>
                                    <asp:ListItem>19</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>21</asp:ListItem>
                                    <asp:ListItem>22</asp:ListItem>
                                    <asp:ListItem>23</asp:ListItem>
                                    <asp:ListItem>24</asp:ListItem>
                                    <asp:ListItem>25</asp:ListItem>
                                    <asp:ListItem>26</asp:ListItem>
                                    <asp:ListItem>27</asp:ListItem>
                                    <asp:ListItem>28</asp:ListItem>
                                    <asp:ListItem>29</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>31</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;<asp:DropDownList ID="drpYear" runat="server" CssClass="InputTxtBox" Width="78px"
                                    Font-Size="13px">
                                    <asp:ListItem>YYYY</asp:ListItem>
                                    <asp:ListItem>1973</asp:ListItem>
                                    <asp:ListItem>1974</asp:ListItem>
                                    <asp:ListItem>1975</asp:ListItem>
                                    <asp:ListItem>1976</asp:ListItem>
                                    <asp:ListItem>1977</asp:ListItem>
                                    <asp:ListItem>1978</asp:ListItem>
                                    <asp:ListItem Value="1979">1979</asp:ListItem>
                                    <asp:ListItem>1980</asp:ListItem>
                                    <asp:ListItem>1981</asp:ListItem>
                                    <asp:ListItem>1982</asp:ListItem>
                                    <asp:ListItem>1983</asp:ListItem>
                                    <asp:ListItem>1984</asp:ListItem>
                                    <asp:ListItem>1985</asp:ListItem>
                                    <asp:ListItem>1986</asp:ListItem>
                                    <asp:ListItem>1987</asp:ListItem>
                                    <asp:ListItem>1988</asp:ListItem>
                                    <asp:ListItem>1989</asp:ListItem>
                                    <asp:ListItem>1990</asp:ListItem>
                                    <asp:ListItem>1991</asp:ListItem>
                                    <asp:ListItem>1992</asp:ListItem>
                                    <asp:ListItem>1993</asp:ListItem>
                                    <asp:ListItem>1994</asp:ListItem>
                                    <asp:ListItem>1995</asp:ListItem>
                                    <asp:ListItem>1996</asp:ListItem>
                                    <asp:ListItem>1997</asp:ListItem>
                                    <asp:ListItem>1998</asp:ListItem>
                                    <asp:ListItem>1999</asp:ListItem>
                                    <asp:ListItem>2000</asp:ListItem>
                                    <asp:ListItem>2001</asp:ListItem>
                                    <asp:ListItem>2002</asp:ListItem>
                                    <asp:ListItem>2003</asp:ListItem>
                                    <asp:ListItem>2004</asp:ListItem>
                                    <asp:ListItem>2005</asp:ListItem>
                                    <asp:ListItem>2006</asp:ListItem>
                                    <asp:ListItem>2007</asp:ListItem>
                                    <asp:ListItem>2008</asp:ListItem>
                                    <asp:ListItem>2009</asp:ListItem>
                                    <asp:ListItem>2010</asp:ListItem>
                                    <asp:ListItem>2011</asp:ListItem>
                                    <asp:ListItem>2012</asp:ListItem>
                                    <asp:ListItem>2013</asp:ListItem>
                                    <asp:ListItem>2014</asp:ListItem>
                                    <asp:ListItem>2015</asp:ListItem>
                                    <asp:ListItem>2016</asp:ListItem>
                                    <asp:ListItem>2017</asp:ListItem>
                                    <asp:ListItem>2018</asp:ListItem>
                                    <asp:ListItem>2019</asp:ListItem>
                                    <asp:ListItem>2020</asp:ListItem>
                                </asp:DropDownList>
                                <%--<asp:TextBox ID="dtDateFm" runat="server" CssClass="InputTxtBox" Width="80px"></asp:TextBox>
                                <cc1:CalendarExtender ID="dtDateFm_CalendarExtender" runat="server" Enabled="True"
                                    Format="dd-MMM-yy" TargetControlID="dtDateFm">
                                </cc1:CalendarExtender>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="dtDateFm"
                                    ErrorMessage="*" ValidationGroup="SubmitCan"></asp:RequiredFieldValidator>--%>
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
                                <b>Date To</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <%--<asp:TextBox ID="dtDatTo" runat="server" CssClass="InputTxtBox" Width="80px"></asp:TextBox>
                                <cc1:CalendarExtender ID="dtDatTo_CalendarExtender" runat="server" Enabled="True"
                                    Format="dd-MMM-yy" TargetControlID="dtDatTo">
                                </cc1:CalendarExtender>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="dtDatTo_ReqFieldValidator" runat="server" ControlToValidate="dtDatTo"
                                    ErrorMessage="*" ValidationGroup="SubmitCan"></asp:RequiredFieldValidator>--%><asp:DropDownList
                                        ID="drpMonthTo" runat="server" CssClass="InputTxtBox" Font-Size="13px" Width="82px">
                                        <asp:ListItem>MM</asp:ListItem>
                                        <asp:ListItem Value="1">January</asp:ListItem>
                                        <asp:ListItem Value="2">February</asp:ListItem>
                                        <asp:ListItem Value="3">March</asp:ListItem>
                                        <asp:ListItem Value="4">April</asp:ListItem>
                                        <asp:ListItem Value="5">May</asp:ListItem>
                                        <asp:ListItem Value="6">June</asp:ListItem>
                                        <asp:ListItem Value="7">July</asp:ListItem>
                                        <asp:ListItem Value="8">August</asp:ListItem>
                                        <asp:ListItem Value="9">September</asp:ListItem>
                                        <asp:ListItem Value="10">October</asp:ListItem>
                                        <asp:ListItem Value="11">November</asp:ListItem>
                                        <asp:ListItem Value="12">December</asp:ListItem>
                                    </asp:DropDownList>
                                &nbsp;<asp:DropDownList ID="drpDayTo" runat="server" CssClass="InputTxtBox" Width="80px"
                                    Font-Size="13px">
                                    <asp:ListItem>DD</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>11</asp:ListItem>
                                    <asp:ListItem>12</asp:ListItem>
                                    <asp:ListItem>13</asp:ListItem>
                                    <asp:ListItem>14</asp:ListItem>
                                    <asp:ListItem>15</asp:ListItem>
                                    <asp:ListItem>16</asp:ListItem>
                                    <asp:ListItem>17</asp:ListItem>
                                    <asp:ListItem>18</asp:ListItem>
                                    <asp:ListItem>19</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>21</asp:ListItem>
                                    <asp:ListItem>22</asp:ListItem>
                                    <asp:ListItem>23</asp:ListItem>
                                    <asp:ListItem>24</asp:ListItem>
                                    <asp:ListItem>25</asp:ListItem>
                                    <asp:ListItem>26</asp:ListItem>
                                    <asp:ListItem>27</asp:ListItem>
                                    <asp:ListItem>28</asp:ListItem>
                                    <asp:ListItem>29</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>31</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;<asp:DropDownList ID="drpYearTo" runat="server" CssClass="InputTxtBox" Width="78px"
                                    Font-Size="13px">
                                    <asp:ListItem>YYYY</asp:ListItem>
                                    <asp:ListItem>1973</asp:ListItem>
                                    <asp:ListItem>1974</asp:ListItem>
                                    <asp:ListItem>1975</asp:ListItem>
                                    <asp:ListItem>1976</asp:ListItem>
                                    <asp:ListItem>1977</asp:ListItem>
                                    <asp:ListItem>1978</asp:ListItem>
                                    <asp:ListItem Value="1979">1979</asp:ListItem>
                                    <asp:ListItem>1980</asp:ListItem>
                                    <asp:ListItem>1981</asp:ListItem>
                                    <asp:ListItem>1982</asp:ListItem>
                                    <asp:ListItem>1983</asp:ListItem>
                                    <asp:ListItem>1984</asp:ListItem>
                                    <asp:ListItem>1985</asp:ListItem>
                                    <asp:ListItem>1986</asp:ListItem>
                                    <asp:ListItem>1987</asp:ListItem>
                                    <asp:ListItem>1988</asp:ListItem>
                                    <asp:ListItem>1989</asp:ListItem>
                                    <asp:ListItem>1990</asp:ListItem>
                                    <asp:ListItem>1991</asp:ListItem>
                                    <asp:ListItem>1992</asp:ListItem>
                                    <asp:ListItem>1993</asp:ListItem>
                                    <asp:ListItem>1994</asp:ListItem>
                                    <asp:ListItem>1995</asp:ListItem>
                                    <asp:ListItem>1996</asp:ListItem>
                                    <asp:ListItem>1997</asp:ListItem>
                                    <asp:ListItem>1998</asp:ListItem>
                                    <asp:ListItem>1999</asp:ListItem>
                                    <asp:ListItem>2000</asp:ListItem>
                                    <asp:ListItem>2001</asp:ListItem>
                                    <asp:ListItem>2002</asp:ListItem>
                                    <asp:ListItem>2003</asp:ListItem>
                                    <asp:ListItem>2004</asp:ListItem>
                                    <asp:ListItem>2005</asp:ListItem>
                                    <asp:ListItem>2006</asp:ListItem>
                                    <asp:ListItem>2007</asp:ListItem>
                                    <asp:ListItem>2008</asp:ListItem>
                                    <asp:ListItem>2009</asp:ListItem>
                                    <asp:ListItem>2010</asp:ListItem>
                                    <asp:ListItem>2011</asp:ListItem>
                                    <asp:ListItem>2012</asp:ListItem>
                                    <asp:ListItem>2013</asp:ListItem>
                                    <asp:ListItem>2014</asp:ListItem>
                                    <asp:ListItem>2015</asp:ListItem>
                                    <asp:ListItem>2016</asp:ListItem>
                                    <asp:ListItem>2017</asp:ListItem>
                                    <asp:ListItem>2018</asp:ListItem>
                                    <asp:ListItem>2019</asp:ListItem>
                                    <asp:ListItem>2020</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;<asp:CheckBox ID="chkTillDate" runat="server" AutoPostBack="true" />
                                Till Now&nbsp;
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
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
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
                            </td>
                            <td align="left">
                                <asp:Button ID="btnExperience" runat="server" CssClass="styled-button-1" Text="ADD"
                                    ValidationGroup="SubmitCan" />
                                &nbsp;
                                <asp:Button ID="btnSave" runat="server" CssClass="styled-button-1" Text="Save" ValidationGroup="SubmitCanDef" />
                            </td>
                            <td align="left">
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlExpInfoList" runat="server" Width="100%" SkinID="pnlInner">
                    <div style="max-height: 200px; max-width: 100%; overflow: auto">
                        <asp:GridView ID="grdExperience" runat="server" AutoGenerateColumns="False" SkinID="grdNoFooter"
                            CssClass="mGrid">
                            <Columns>
                                <asp:TemplateField HeaderText="Sl">
                                    <ItemTemplate>
                                        <font style="font-size: 12px"><b>
                                            <%#CType(Container, GridViewRow).RowIndex + 1%></b> </font>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Company Name" HeaderStyle-Font-Size="Small">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCompanyName" runat="server" Text='<%# Bind("CompanyName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CompanyName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle Font-Size="Small" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Official Designation" HeaderStyle-Font-Size="Small">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPositionHeld" runat="server" Text='<%# Bind("OfficialDesig") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("OfficialDesig") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle Font-Size="Small" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Functional Designation" HeaderStyle-Font-Size="Small">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFuncDesig" runat="server" Text='<%# Bind("FuncDesig") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("FuncDesig") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle Font-Size="Small" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Department" HeaderStyle-Font-Size="Small">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDepartment" runat="server" Text='<%# Bind("Department") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Department") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle Font-Size="Small" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Responsibilities" HeaderStyle-Font-Size="Small">
                                    <ItemTemplate>
                                        <asp:Label ID="lblResponsibilities" runat="server" Text='<%# Bind("Responsibilities") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Responsibilities") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle Font-Size="Small" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Company Address" HeaderStyle-Font-Size="Small">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCompanyAddress" runat="server" Text='<%# Bind("CompanyAddress") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("CompanyAddress") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle Font-Size="Small" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Contact No" HeaderStyle-Font-Size="Small">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCompanyConNo" runat="server" Text='<%# Bind("CompanyConNo") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("CompanyConNo") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle Font-Size="Small" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date From" HeaderStyle-Font-Size="Small">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDateFrom" runat="server" Text='<%#Eval("DateFrom","{0:D}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%#Eval("DateFrom", "{0:D}") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle Font-Size="Small" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date To" HeaderStyle-Font-Size="Small">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDateTo" runat="server" Text='<%#Eval("DateTo", "{0:D}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%#Eval("DateTo", "{0:D}") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle Font-Size="Small" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status" HeaderStyle-Font-Size="Small">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTillDate" runat="server" Text='<%#Eval("TillDate") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%#Eval("TillDate") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle Font-Size="Small" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete" HeaderStyle-Font-Size="Small">
                                    <ItemTemplate>
                                        <asp:ImageButton Width="40" ID="imgDelete" CommandName="Delete" runat="server" OnClientClick="return confirm('Are You Sure You Want to Delete?')"
                                            ImageUrl="~/img/delete.jpg" CausesValidation="False" />
                                    </ItemTemplate>
                                    <HeaderStyle Font-Size="Small" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </td>
    </table>
</asp:Content>
