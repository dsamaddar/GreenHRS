<%@ Page Language="VB" MasterPageFile="~/EmployeeInfo/EmployeeMasterPage.master"
    AutoEventWireup="false" CodeFile="EmployeeTrainingInfo.aspx.vb" Inherits="EmployeeInfo_EmployeeTrainingInfo"
    Title=".:HRM:Emp. Training Info:." Theme="CommonSkin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
    <table style="width: 100%;">
        <tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Label ID="lblMsg" runat="server" Width="800px" Height="25px" BackColor="Green"
                    ForeColor="Yellow" Text="Please save your information before exiting this page" CssClass="NotificationBar"></asp:Label>
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
                <asp:Label ID="lblRedirectMsg" runat="server" Width="800px" Height="25px" BackColor="Green"
                    ForeColor="Red" Text="" CssClass="blinkytext"></asp:Label>
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
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
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
                <asp:Panel ID="pnlEmpTrainingInfo" runat="server" Width="800px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label" style="width: 150px">
                                &nbsp;
                            </td>
                            <td align="left" style="width: 230px" class="label">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width: 20px">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Training Topic</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtTrainingName" runat="server" CssClass="InputTxtBox" Width="230px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFldCompanyName" runat="server" ControlToValidate="txtTrainingName"
                                    ErrorMessage="*" ValidationGroup="SubmitCan"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Institution Name</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtInstitutionName" runat="server" CssClass="InputTxtBox" Width="230px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtInstitutionName"
                                    ErrorMessage="*" ValidationGroup="SubmitCan"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Country</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlCountry" runat="server" CssClass="InputTxtBox" Width="230px"
                                    DataSourceID="dsCountry" DataTextField="CountryName" DataValueField="CountryID">
                                </asp:DropDownList>
                                <br />
                                <asp:SqlDataSource ID="dsCountry" runat="server" ConnectionString="<%$ ConnectionStrings:HRMConnectionString %>"
                                    SelectCommand="SELECT [CountryID], [CountryName] FROM [tblCountryName] where IsActive=1 ORDER BY [CountryName]">
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                &nbsp;
                            </td>
                            <td align="left" class="label">
                                <b>Training Year</b><span class="RequiredLabel">*</span>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlTrainingYear" runat="server" CssClass="InputTxtBox" Width="230px">
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
                                </asp:DropDownList>
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
                                <asp:TextBox ID="dtDateFrom" runat="server" CssClass="InputTxtBox" Width="80px">
                                </asp:TextBox>
                                <cc1:CalendarExtender ID="dtDateFrom_CalendarExtender" Format="dd-MMM-yy" runat="server"
                                    Enabled="True" TargetControlID="dtDateFrom">
                                </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="dtDateFrom"
                                    ErrorMessage="*" ValidationGroup="SubmitCan"></asp:RequiredFieldValidator>
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
                                <asp:TextBox ID="dtDateTo" runat="server" CssClass="InputTxtBox" Width="80px">
                                </asp:TextBox>
                                <cc1:CalendarExtender ID="dtDateTo_CalendarExtender" runat="server" Enabled="True"
                                    Format="dd-MMM-yy" TargetControlID="dtDateTo">
                                </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="dtDateTo"
                                    ErrorMessage="*" ValidationGroup="SubmitCan"></asp:RequiredFieldValidator>
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
                                <asp:Button ID="btnTrainingAdd" runat="server" CssClass="styled-button-1" Text="ADD"
                                    ValidationGroup="SubmitCan" />
                                &nbsp;<asp:Button ID="btnSave" runat="server" CssClass="styled-button-1" Text="Save"
                                    ValidationGroup="SubmitCanDef" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                            <td>
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
                <asp:Panel ID="pnlTrainingGrid" runat="server" Width="800px" SkinID="pnlInner">
                    <div style="max-height: 400px; max-width: 100%; overflow: auto">
                        <asp:GridView ID="grdTraining" runat="server" AutoGenerateColumns="False" SkinID="grdNoFooter">
                            <Columns>
                                <asp:TemplateField HeaderText="Sl">
                                    <ItemTemplate>
                                        <b>
                                            <%#CType(Container, GridViewRow).RowIndex + 1%></b>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Training Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTrainingName" runat="server" Text='<%# Bind("TrainingName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TrainingName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Institute Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblInstituteName" runat="server" Text='<%# Bind("InstituteName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("InstituteName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CountryID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountryID" runat="server" Text='<%# Bind("CountryID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CountryID") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Country">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountry" runat="server" Text='<%# Bind("Country") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Country") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Training Year">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTrainingYear" runat="server" Text='<%# Bind("TrainingYear") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("TrainingYear") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date From">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDateFrom" runat="server" Text='<%#Eval("DateFrom", "{0:D}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%#Eval("DateFrom", "{0:D}") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date To">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDateTo" runat="server" Text='<%#Eval("DateTo", "{0:D}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%#Eval("DateTo", "{0:D}") %>'></asp:TextBox>
                                    </EditItemTemplate>
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
            <td>
                &nbsp;
            </td>
        </tr>
        <%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
--%>
        <%--<tr align="center">
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Panel ID="pnlbuttons" runat="server" Width="700px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td align="center">
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>--%>
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
    </table>
</asp:Content>
