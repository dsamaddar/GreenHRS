<%@ Page Language="VB" MasterPageFile="~/CVMan/HRMCVMaster.master" AutoEventWireup="false"
    CodeFile="CandidateEducationInfo.aspx.vb" Inherits="CandidateEducationInfo" Theme="CommonSkin"
    Title=".:HRM:Can. Educatioon Info:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
    <link href="../Sources/css/ValidatorStyle.css" rel="stylesheet" type="text/css" />
    <link href="../Sources/css/Title.css" rel="stylesheet" type="text/css" />
    <script src="../Sources/js/jquery.min.js" type="text/javascript"></script>
    <script src="../Sources/js/MaxLength.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
             //Specifying the Character Count control explicitly
            $("[id*=txtInstitutionName]").MaxLength(
            {
                MaxLength: 80,
                CharacterCountControl: $('#counter')
            });
            
            //Specifying the Character Count control explicitly
            $("[id*=txtLocation]").MaxLength(
            {
                MaxLength: 400,
                CharacterCountControl: $('#counter2')
            });            
        });
    </script>

    <table style="width: 100%;">
        <tr align="center">
            <td>
                <asp:Label ID="lblRedirectMsg" runat="server" Width="100%" Height="25px" BackColor="#195227"
                    ForeColor="Red" CssClass="blinkytext"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel ID="pnlProfessionalCertification" runat="server" SkinID="pnlInner" Width="100%">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="4">
                                <div class="widget-title">
                                    Professional Certification And Education [Please Remember To Save Before Leaving
                                    This Page]
                                    <asp:ScriptManager ID="ScriptManager2" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" style="font-size: 11pt; font-weight: bold; font-family: Verdana;
                                width: 400px">
                            </td>
                            <td align="left">
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" style="font-size: 11pt; font-weight: bold; font-family: Verdana;
                                width: 400px">
                                Do you have any professional certification ?
                            </td>
                            <td align="left">
                                <asp:RadioButtonList ID="rdbtnIsProfessionalCertificationExists" runat="server" AutoPostBack="true"
                                    RepeatDirection="Horizontal">
                                    <asp:ListItem>YES</asp:ListItem>
                                    <asp:ListItem>NO</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlCanProfCertificationInfo" runat="server" Width="100%" 
                    SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td style="width: 100px">
                            </td>
                            <td style="width: 300px">
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="width: 20px">
                            </td>
                            <td class="label" style="width: 100px">
                                Certification<span class="RequiredLabel">*</span>
                            </td>
                            <td align="left" style="width: 300px">
                                <asp:TextBox ID="txtCertificationName" runat="server" Width="250px" CssClass="InputTxtBox"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ReqFldValidatorCertificationName" runat="server"
                                    ControlToValidate="txtCertificationName" ErrorMessage="Certification Required"
                                    ValidationGroup="SubmitCan" Display="None"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="ReqFldValidatorCertificationName_ValidatorCalloutExtender"
                                    runat="server" Enabled="True" TargetControlID="ReqFldValidatorCertificationName"
                                    CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Issuing Authority<span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <div id="counter" style="color: Red; font-family: Verdana">
                                </div>
                                <asp:TextBox ID="txtInstitutionName" runat="server" Width="250px" CssClass="InputTxtBox"
                                    Height="40px" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ReqFldValidatorInstitutionName" runat="server" ControlToValidate="txtInstitutionName"
                                    ErrorMessage="Issuing Authority Required" ValidationGroup="SubmitCan" Display="None"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="ReqFldValidatorInstitutionName_ValidatorCalloutExtender"
                                    runat="server" Enabled="True" TargetControlID="ReqFldValidatorInstitutionName"
                                    CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Location</b>
                            </td>
                            <td align="left">
                                <div id="counter2" style="color: Red; font-family: Verdana">
                                </div>
                                <asp:TextBox ID="txtLocation" runat="server" Width="250px" CssClass="InputTxtBox"
                                    Height="40px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Issuing Date</b><span class="RequiredLabel">*</span>
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
                                    Font-Size="13px" Font-Overline="False">
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
                                <%--<asp:TextBox ID="dtDateFrom" runat="server" Width="80px" CssClass="InputTxtBox">
                                </asp:TextBox>
                                <cc1:CalendarExtender ID="dtDateFrom_CalendarExtender" Format="dd-MMM-yy" runat="server"
                                    Enabled="True" TargetControlID="dtDateFrom">
                                </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="dtDateFrom"
                                    ErrorMessage="*" ValidationGroup="SubmitCan"></asp:RequiredFieldValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Expire Date</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <%--<asp:TextBox ID="dtDateTo" runat="server" Width="80px" CssClass="InputTxtBox">
                                </asp:TextBox>
                                <cc1:CalendarExtender ID="dtDateTo_CalendarExtender" Format="dd-MMM-yy" runat="server"
                                    Enabled="True" TargetControlID="dtDateTo">
                                </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="dtDateTo"
                                    ErrorMessage="*" ValidationGroup="SubmitCan"></asp:RequiredFieldValidator>--%><asp:DropDownList
                                        ID="drpMonthTo" runat="server" CssClass="InputTxtBox" Width="82px" Font-Size="13px">
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
                                &nbsp;
                                <asp:CheckBox ID="chkNeverExpire" runat="server" AutoPostBack="true" />Never Expire
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                            </td>
                            <td align="left" class="label">
                            </td>
                            <td align="left">
                                <asp:Button ID="btnAddCerti" runat="server" CssClass="styled-button-1" Text="ADD"
                                    ValidationGroup="SubmitCan" Width="100px" />
                                &nbsp;<asp:Button ID="btnSubmit" runat="server" CssClass="styled-button-1" 
                                    Text="Save" ValidationGroup="SubmitCanDef" Width="100px" />
                            </td>
                            <%--<td align="left">
                                &nbsp;
                            </td>--%>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlCertification" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <div style="max-height: 200px; max-width: 100%; overflow: auto">
                                    <asp:GridView ID="grdCertification" runat="server" AutoGenerateColumns="False" SkinID="grdNoFooter"
                                        CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Sl">
                                                <ItemTemplate>
                                                    <font style="font-size: 12px"><b>
                                                        <%#CType(Container, GridViewRow).RowIndex + 1%></b> </font>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Certification">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCertificationName" runat="server" Text='<%# Bind("CertificationName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Issuing Authority">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInstituteName" runat="server" Text='<%# Bind("InstituteName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Location">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Issuing Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDateFrom" runat="server" Text='<%#Eval("IssuingDate", "{0:D}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Expire Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDateTo" runat="server" Text='<%#Eval("ExpireDate", "{0:D}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNeverExpire" runat="server" Text='<%#Eval("NeverExpire") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Delete">
                                                <ItemTemplate>
                                                    <asp:ImageButton Width="40" ID="imgDelete" CommandName="Delete" runat="server" OnClientClick="return confirm('Are You Sure You Want to Delete?')"
                                                        ImageUrl="~/img/delete.jpg" CausesValidation="False" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <table style="width: 100%;">
        <%#CType(Container, GridViewRow).RowIndex + 1%>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlCanEduInfo" runat="server" Width="100%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" colspan="3">
                                <div class="widget-title">
                                    Educational Information</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="width: 20px">
                            </td>
                            <td align="left" class="label" style="color: Green;" colspan="2">
                                Please list all degrees earned, starting from the most <b><u>recent</u></b>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label" style="width: 100px">
                                <asp:SqlDataSource ID="dsInstitutionName" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" 
                                    SelectCommand="SELECT DISTINCT [InstitutionName], [InstitutionID] FROM [tblInstitutionName] where IsActive=1 ORDER BY [InstitutionName]">
                                </asp:SqlDataSource>
                            </td>
                            <td align="left" style="width: 300px">
                                <asp:SqlDataSource ID="dsExamName" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" 
                                    SelectCommand="SELECT [ExamName], [ExamID] FROM [tblExamName] where bitActive=1 ORDER BY [ExamOrder] asc">
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label" style="width: 100px">
                                <b>Degree Type</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left" style="width: 300px">
                                <asp:RadioButtonList ID="rdoDegreeType" runat="server" AutoPostBack="true" CssClass="rbdText"
                                    RepeatDirection="Horizontal">
                                    <asp:ListItem Value="Local"> Local
                                    </asp:ListItem>
                                    <asp:ListItem Value="Foreign"> Foreign
                                    </asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="reqFldGender" runat="server" ControlToValidate="rdoDegreeType"
                                    Display="None" ErrorMessage="Degree Type Required" ValidationGroup="btnEdu">
                                </asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldGender_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldGender" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Degree Name</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlExamName" runat="server" CssClass="InputTxtBox" Width="250px"
                                    DataSourceID="dsExamName" DataTextField="ExamName" DataValueField="ExamID">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Major</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlMajor" runat="server" Width="250px" CssClass="InputTxtBox"
                                    DataSourceID="dsMajor" DataTextField="MajorType" DataValueField="MajorTypeID">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Passing Year</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlPassingYear" runat="server" CssClass="InputTxtBox" Width="250px">
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
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Board/University/College</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlBoard" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                    Width="250px">
                                </asp:DropDownList>
                                &nbsp;<asp:Button ID="btnAddInstitution" runat="server" CssClass="styled-button-1"
                                    Text="ADD" ValidationGroup="Submit" />
                                &nbsp;<asp:Label ID="lblInstitutionAdd" runat="server">
                                    <asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" Text="Cancel" />
                                    &nbsp;
                                    <asp:TextBox ID="txtBoard" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqFldBoardName" runat="server" ControlToValidate="txtBoard"
                                        Display="None" ErrorMessage="Other Institution Name Required " ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                    <cc1:ValidatorCalloutExtender ID="reqFldBoardName_ValidatorCalloutExtender" runat="server"
                                        CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                        TargetControlID="reqFldBoardName" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                    </cc1:ValidatorCalloutExtender>
                                </asp:Label>
                            </td>
                        </tr>
                        <tr id="idForOthers" runat="server">
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Others Institution Name</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtOtherInsName" runat="server" CssClass="InputTxtBox" ValidationGroup="btnEdu"
                                    Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ReqFldValidatorOtherInsName" runat="server" ControlToValidate="txtOtherInsName"
                                    Display="None" ErrorMessage="Others Institution Name Required" ValidationGroup="btnEdu"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="ReqFldValidatorOtherInsName_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="ReqFldValidatorOtherInsName" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Result Type</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlResultType" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                    Width="250px">
                                    <asp:ListItem>-Select-</asp:ListItem>
                                    <asp:ListItem>GPA</asp:ListItem>
                                    <asp:ListItem Value="Division">Class/Division</asp:ListItem>
                                    <asp:ListItem>Appeared</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr id="ForGPA" runat="server">
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Result</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtResult" runat="server" CssClass="InputTxtBox" Width="80px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="ReqFldValidatorResult" runat="server" ControlToValidate="txtResult"
                                    Display="None" ErrorMessage="Result Required" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="ReqFldValidatorResult_ValidatorCalloutExtender"
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle"
                                    Enabled="True" TargetControlID="ReqFldValidatorResult" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                                <cc1:MaskedEditExtender ID="MaskedEditResult" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="9.99" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtResult" />
                                <cc1:MaskedEditValidator ID="MaskedEditValResult" runat="server" ControlExtender="MaskedEditResult"
                                    ControlToValidate="txtResult" EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers"
                                    IsValidEmpty="false" MaximumValue="5" MaximumValueMessage="Number must be less than 5 or equal"
                                    MinimumValue="1" MinimumValueMessage="Number must be greater than -1 and posive"
                                    ToolTip="Enter values from 0 to 5" ValidationGroup="InsertJobCircular">
                                &nbsp;&nbsp;
                                </cc1:MaskedEditValidator>
                                Out of&nbsp;
                                <asp:TextBox ID="txtOutOf" runat="server" CssClass="InputTxtBox" Width="80px"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="reqfldOutOf" runat="server" ControlToValidate="txtOutOf"
                                    Display="None" ErrorMessage="Out of Required" ValidationGroup="Submit">
                                </asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqfldOutOf_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqfldOutOf" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                                <cc1:MaskedEditExtender ID="MskEdtPresentSalary" runat="server" AcceptNegative="Left"
                                    ErrorTooltipEnabled="True" InputDirection="RightToLeft" Mask="9.99" MaskType="Number"
                                    MessageValidatorTip="true" TargetControlID="txtOutOf" />
                                <cc1:MaskedEditValidator ID="MskEdtValPresentSalary" runat="server" ControlExtender="MskEdtPresentSalary"
                                    ControlToValidate="txtOutOf" EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers"
                                    IsValidEmpty="false" MaximumValue="5" MaximumValueMessage="Number must be less than 5 or equal"
                                    MinimumValue="1" MinimumValueMessage="Number must be greater than -1 and posive"
                                    ToolTip="Enter values from 0 to 5" ValidationGroup="InsertJobCircular">
                                &nbsp;&nbsp;
                                </cc1:MaskedEditValidator>
                            </td>
                        </tr>
                        <tr id="ForDivision" runat="server">
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Result</b><span class="RequiredLabel">*</span>&nbsp;
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlDivision" runat="server" CssClass="InputTxtBox" Width="250px">
                                    <%--<asp:ListItem>Select</asp:ListItem>--%>
                                    <asp:ListItem>1st Division</asp:ListItem>
                                    <asp:ListItem>2nd Division</asp:ListItem>
                                    <asp:ListItem>3rd Division</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr id="Tr1" runat="server">
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left">
                                <asp:Label ID="lblErrorMessageOnEDU" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <asp:SqlDataSource ID="dsMajor" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>" 
                                    SelectCommand="SELECT DISTINCT [MajorType], [MajorTypeID] FROM [tblMajorType] where IsActive=1 ORDER BY [MajorType]">
                                </asp:SqlDataSource>
                            </td>
                            <td align="left">
                                <asp:Button ID="btnAddEdu" runat="server" CssClass="styled-button-1" Text="ADD" ValidationGroup="btnEdu"
                                    Width="100px" />
                                &nbsp;<asp:Button ID="btnNext" runat="server" CssClass="styled-button-1" Text="Save" 
                                    ValidationGroup="SubmitCanDef" Width="100px" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Panel ID="pnlEducation" runat="server" Width="100%" SkinID="pnlInner">
                    <div style="max-height: 200px; max-width: 100%; overflow: auto">
                        <asp:GridView ID="grdEducation" runat="server" AutoGenerateColumns="False" SkinID="grdNoFooter"
                            CssClass="mGrid">
                            <Columns>
                                <asp:TemplateField HeaderText="Sl">
                                    <ItemTemplate>
                                        <font style="font-size: 12px"><b>
                                            <%#CType(Container, GridViewRow).RowIndex + 1%></b> </font>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Degree Type">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDegreeType" runat="server" Text='<%# Bind("DegreeType") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ExamID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblExamID" runat="server" Text='<%# Bind("ExamID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Degree Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblExamName" runat="server" Text='<%# Bind("ExamName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Major ID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMajorID" runat="server" Text='<%# Bind("MajorID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Major">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMajor" runat="server" Text='<%# Bind("Major") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="InstitutionID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblInstitutionID" runat="server" Text='<%# Bind("InstitutionID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Institutaion">
                                    <ItemTemplate>
                                        <asp:Label ID="lblInstitutaionName" runat="server" Text='<%# Bind("InstitutionName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Passing Year">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPassingYear" runat="server" Text='<%# Bind("PassingYear") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Result Type">
                                    <ItemTemplate>
                                        <asp:Label ID="lblResultType" runat="server" Text='<%# Bind("ResultType") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Result">
                                    <ItemTemplate>
                                        <asp:Label ID="lblResult" runat="server" Text='<%# Bind("Result") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Out Of">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOutOf" runat="server" Text='<%# Bind("OutOf") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete">
                                    <ItemTemplate>
                                        <asp:ImageButton Width="40" ID="imgDelete" CommandName="Delete" runat="server" OnClientClick="return confirm('Are You Sure You Want to Delete?')"
                                            ImageUrl="~/img/delete.jpg" CausesValidation="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </td>
        </tr>
        <%--<asp:ListItem>Select</asp:ListItem>--%>
    </table>
</asp:Content>
