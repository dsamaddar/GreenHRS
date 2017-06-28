<%@ Page Language="VB" Theme="CommonSkin" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    CodeFile="frmBenefitTypeDefinition.aspx.vb" Inherits="Loan_frmBenefitTypeDefinition"
    Title=".:HRS:Benefit Type Definition:." %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 20px;
        }
        .style2
        {
            width: 150px;
        }
        .style3
        {
            width: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlBenefitTypeDefinition" runat="server" Width="1000px" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="6">
                                <div class="widget-title">
                                    Benefit Type Definition</div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td class="style1">
                            </td>
                            <td class="style2">
                            </td>
                            <td class="style3">
                                <asp:HiddenField ID="hdFldBenefitTypeID" runat="server" />
                            </td>
                            <td class="style1">
                            </td>
                            <td class="style2">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Benefit Type
                            </td>
                            <td>
                                <asp:TextBox ID="txtBenefitType" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                            </td>
                            <td class="label">
                                &nbsp;
                            </td>
                            <td class="label">
                                Benefit Code
                            </td>
                            <td>
                                <asp:TextBox ID="txtBenefitCode" runat="server" CssClass="InputTxtBox" Width="120px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                                Account Code
                            </td>
                            <td>
                                <asp:DropDownList ID="drpAccountCodeList" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td class="label">
                            </td>
                            <td class="label">
                                Interest Rate
                            </td>
                            <td>
                                <asp:TextBox ID="txtInterestRate" runat="server" CssClass="InputTxtBox" Width="120px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;
                            </td>
                            <td class="label">
                                Depreciation In Months</td>
                            <td>
                                <asp:TextBox ID="txtDepreciationYear" runat="server" CssClass="InputTxtBox" Width="80px"></asp:TextBox>
                            </td>
                            <td class="label">
                            </td>
                            <td class="label">
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Adjustable From Salary
                            </td>
                            <td>
                                <asp:CheckBox ID="chkIsAdjustableFromSalary" runat="server" AutoPostBack="True" Text="YES"
                                    CssClass="chkText" />
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Abatement Applicable
                            </td>
                            <td>
                                <asp:CheckBox ID="chkIsAbatementApplicable" runat="server" AutoPostBack="True" Text="Yes"
                                    CssClass="chkText" />
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Depreciated Applicable
                            </td>
                            <td>
                                <asp:CheckBox ID="chkIsDepreciatePmntAutomatically" runat="server" AutoPostBack="True"
                                    Text="YES" CssClass="chkText" />
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Active
                            </td>
                            <td>
                                <asp:CheckBox ID="chkIsActive" runat="server" AutoPostBack="True" CssClass="chkText"
                                    Text="Yes" />
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Primary Approver
                            </td>
                            <td>
                                <asp:DropDownList ID="drpPrimaryApprover" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Loan Approver
                            </td>
                            <td>
                                <asp:DropDownList ID="drpEmployeeList" runat="server" CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnSubmit" runat="server" CssClass="styled-button-1" Text="Submit" />
                                &nbsp;<asp:Button ID="btnUpdate" runat="server" CssClass="styled-button-1" Text="Update" />
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
            </td>
        </tr>
        <tr align="center">
            <td>
            </td>
            <td>
                <asp:Panel ID="pnlBenefitTypeList" runat="server" Width="1000px" SkinID="pnlInner">
                    <div>
                        <asp:GridView ID="grdBenefitTypeDetails" runat="server" CssClass="mGrid" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                            Text="Select"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="BenefitTypeID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBenefitTypeID" runat="server" Text='<%# Bind("BenefitTypeID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Benefit">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBenefitType" runat="server" Text='<%# Bind("BenefitType") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Benefit Code">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBenefitCode" runat="server" Text='<%# Bind("BenefitCode") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Account Code">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAccountCode" runat="server" Text='<%# Bind("AccountCode") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Interest Rate">
                                    <ItemTemplate>
                                        <asp:Label ID="lblInterestRate" runat="server" Text='<%# Bind("InterestRate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DepreciationYear">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDepreciationYear" runat="server" Text='<%# Bind("DepreciationYear") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Adjustable From Salary">
                                    <ItemTemplate>
                                        <asp:Label ID="lblIsAdjustableFromSalary" runat="server" Text='<%# Bind("IsAdjustableFromSalary") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Abatement Applicable">
                                    <ItemTemplate>
                                        <asp:Label ID="lblIsAbatementApplicable" runat="server" Text='<%# Bind("IsAbatementApplicable") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Depreciated Automatically">
                                    <ItemTemplate>
                                        <asp:Label ID="lblIsDepreciatedAutomatically" runat="server" Text='<%# Bind("IsDepreciatedAutomatically") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PrimaryApproverID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPrimaryApproverID" runat="server" Text='<%# Bind("PrimaryApproverID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Primary Approver">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("PrimaryApprover") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ApproverID" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblApproverID" runat="server" Text='<%# Bind("ApproverID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Approver">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Approver") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Active">
                                    <ItemTemplate>
                                        <asp:Label ID="lblIsActive" runat="server" Text='<%# Bind("IsActive") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Entry By">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEntryBy" runat="server" Text='<%# Bind("EntryBy") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Entry Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEntryDate" runat="server" Text='<%# Bind("EntryDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </td>
            <td>
            </td>
        </tr>
        <tr align="center">
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
