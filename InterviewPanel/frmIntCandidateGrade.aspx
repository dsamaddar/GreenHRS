<%@ Page Language="VB" Theme="CommonSkin"  MasterPageFile="~/HRMMaster.master" AutoEventWireup="false" CodeFile="frmIntCandidateGrade.aspx.vb" Inherits="InterviewPanel_frmIntCandidateGrade" title=".:HRM:Int. Grade:." %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr align="center" >
            <td>
                &nbsp;</td>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center" >
            <td>
                &nbsp;</td>
            <td>
                <asp:Panel ID="pnlIntGradeInfo" runat="server" Width="600px" SkinID="pnlInner" >
                    <table style="width:100%;">
                        <tr>
                            <td align="left" class="label" colspan="3">
                                <div class="widgettitle">Define Interview Candidate Grade</div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width:20px">
                            </td>
                            <td align="left" class="label">
                            </td>
                            <td align="left">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width:20px">
                                </td>
                            <td align="left" class="label" >
                                Interview Grade</td>
                            <td align="left">
                                <asp:TextBox ID="txtInterviewGrade" runat="server" CssClass="InputTxtBox" 
                                    Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldIntGrade" runat="server" 
                                    ControlToValidate="txtInterviewGrade" Display="None" ErrorMessage="Required:Interview Grade" 
                                    ValidationGroup="IntGrade"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldIntGrade_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldIntGrade" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                </td>
                            <td align="left" class="label" >
                                Grade Point</td>
                            <td align="left">
                                <asp:TextBox ID="txtGradePoint" runat="server" CssClass="InputTxtBox" 
                                    Width="80px"></asp:TextBox>
                                &nbsp;
                                <cc1:MaskedEditExtender ID="MskEdtGradePoint" runat="server" 
                                    AcceptNegative="Left" ErrorTooltipEnabled="True" InputDirection="RightToLeft" 
                                    Mask="9.99" MaskType="Number" MessageValidatorTip="true" 
                                    TargetControlID="txtGradePoint" />
                                <cc1:MaskedEditValidator ID="MskEdtValGradePoint" runat="server" 
                                    ControlExtender="MskEdtGradePoint" ControlToValidate="txtGradePoint" 
                                    EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers" 
                                    IsValidEmpty="false" MaximumValue="10" MaximumValueMessage=" &lt; 10" 
                                    MinimumValue="0" MinimumValueMessage=" &gt; -1" 
                                    ToolTip="Enter values from 0 to 10" ValidationGroup="IntGrade">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</cc1:MaskedEditValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                </td>
                            <td align="left" class="label" >
                                Is Active</td>
                            <td align="left">
                                <asp:CheckBox ID="chkIntGradeIsActive" runat="server" CssClass="chkText" 
                                    Text="  Is Active" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                </td>
                            <td align="left" class="label">
                                </td>
                            <td align="left">
                                </td>
                        </tr>
                        <tr>
                            <td>
                                </td>
                            <td>
                            </td>
                            <td align="left">
                                <asp:Button ID="btnInsertIntGrade" runat="server" CssClass="styled-button-1" 
                                    Text="Insert" ValidationGroup="IntGrade" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" 
                                    Text="Cancel" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                </td>
                            <td>
                                </td>
                            <td align="left">
                                </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center" >
            <td>
                &nbsp;</td>
            <td>
                <asp:Panel ID="pnlAvailableIntGrade" runat="server" Width="600px" SkinID="pnlInner" >
                    <asp:GridView ID="grdIntGrade" runat="server" AutoGenerateColumns="False" 
                        EmptyDataText="No Information Available" CssClass="mGrid">
                        <Columns>
                            <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CssClass="linkbtn" CommandName="Select" Text="Select"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="IntGradeID" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("IntGradeID") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblIntGradeID" runat="server" Text='<%# Bind("IntGradeID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Grade">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("GradeName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("GradeName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Grade Point">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("GradePoint") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("GradePoint") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Active">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("IsActive") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("IsActive") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="EntryBy" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("EntryBy") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("EntryBy") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="EntryDate" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("EntryDate") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("EntryDate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

