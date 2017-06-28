<%@ Page Language="VB" Theme="CommonSkin"  MasterPageFile="~/HRMMaster.master" AutoEventWireup="false" CodeFile="frmGradingSystem.aspx.vb" Inherits="frmGradingSystem" title=".:HRM:Def.Grading System:." %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        /*AutoComplete flyout */
        .autocomplete_completionListElement
        {
            margin : 0px!important ;
            background-color : inherit ;
            color : windowtext ;
            border : buttonshadow ;
            border-width : 1px ;
            border-style : solid ;
            cursor : 'default' ;
            overflow : auto ;
            height : 200px ;
            font-family : Tahoma ;
            font-size : small ;
            text-align : left ;
            list-style-type : none ;
            }
        /* AutoComplete highlighted item */
        .autocomplete_highlightedListItem
           {
            background-color : #ffff99 ;
            color : black ;
            padding : 1px ;
            }

            /* AutoComplete item */
        .autocomplete_listItem
            {
            background-color : window ;
            color : windowtext ;
            padding : 1px ;
           }
    </style>
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
        <tr align="center">
            <td>
                &nbsp;</td>
            <td>
                <asp:Panel ID="pnlGradingSystemType" runat="server" Width="800px" SkinID="pnlInner" >
                    <table style="width:100%;">
                        <tr>
                            <td colspan="4" align="left">
                                <div class="widgettitle">Define Grading System</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:20px">
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                </td>
                            <td align="left" class="label">
                                <b>Grading System Type</b></td>
                            <td align="left">
                                <asp:TextBox ID="txtGradingSystemType" runat="server" CssClass="InputTxtBox" 
                                    Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldGradSysType" runat="server" 
                                    ControlToValidate="txtGradingSystemType" ErrorMessage="Required" 
                                    ValidationGroup="GradSysType" Display="None"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldGradSysType_ValidatorCalloutExtender" 
                                    runat="server" Enabled="True" TargetControlID="reqFldGradSysType" CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                </td>
                        </tr>
                        <tr>
                            <td align="left" class="label">
                                </td>
                            <td align="left" class="label">
                                </td>
                            <td align="left">
                                </td>
                            <td>
                                </td>
                        </tr>
                        <tr>
                            <td>
                                </td>
                            <td>
                                </td>
                            <td align="left">
                                <asp:Button ID="btnInsertGradingSystemType" runat="server" 
                                    CssClass="styled-button-1" Text="Insert" ValidationGroup="GradSysType" />
                            </td>
                            <td>
                                </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;</td>
            <td>
                    <asp:Panel ID="pnlCustomizedGrading" runat="server" SkinID="pnlInner" Width="800px" >
                        <table style="width:100%;"  >
                            <tr>
                                <td align="left" class="label" style="width:20px" >
                                    &nbsp;</td>
                                <td align="left" class="label">
                                    &nbsp;</td>
                                <td align="left" >
                                    &nbsp;</td>
                                <td  align="left" class="label" >
                                    &nbsp;</td>
                                <td align="left">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="left" class="label" style="width:20px" >
                                    &nbsp;</td>
                                <td align="left" class="label">
                                    <b>Grading System Type</b></td>
                                <td align="left" >
                                    <asp:DropDownList ID="drpGradSysType" runat="server" AutoPostBack="True" 
                                        CssClass="InputTxtBox" Width="200px">
                                    </asp:DropDownList>
                                </td>
                                <td  align="left" class="label" >
                                    <b>Letter Grade</b></td>
                                <td align="left">
                                    <asp:TextBox ID="txtLetterGrade" runat="server" autocomplete="off" 
                                        CssClass="InputTxtBox" Font-Names="Tahoma" Height="20px" Width="80px" />
                                    <asp:RequiredFieldValidator ID="reqFldLetterGrade" 
                                        ControlToValidate="txtLetterGrade" runat="server" ErrorMessage="*" 
                                        ValidationGroup="AddGrading"></asp:RequiredFieldValidator>
                                    <cc1:AutoCompleteExtender ID="atoComLetterGrade" runat="server" 
                                        BehaviorID="AutoCompleteEx" CompletionInterval="0" 
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem" 
                                        CompletionListItemCssClass="autocomplete_listItem" CompletionSetCount="20" 
                                        DelimiterCharacters=";, :" EnableCaching="true" MinimumPrefixLength="1" 
                                        ServiceMethod="GetCompletionList" ServicePath="AutoComplete.asmx" 
                                        ShowOnlyCurrentWordInCompletionListItem="true" TargetControlID="txtLetterGrade">
                                        <Animations>
                                            <OnShow>
                                                <Sequence>
                                                    <%-- Make the completion list transparent and then show it --%>
                                                    <OpacityAction Opacity="0" />
                                                    <HideAction Visible="true" />
                                                    
                                                    <%--Cache the original size of the completion list the first time
                                                        the animation is played and then set it to zero --%>
                                                    <ScriptAction Script="
                                                        // Cache the size and setup the initial size
                                                        var behavior = $find('AutoCompleteEx');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />
                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </cc1:AutoCompleteExtender>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="label">
                                    &nbsp;</td>
                                <td align="left" class="label">
                                    <b>Percentage From</b></td>
                                <td align="left">
                                    <asp:TextBox ID="txtPercentageFrom" runat="server" CssClass="InputTxtBox" 
                                        Width="80px"></asp:TextBox>
                                    &nbsp;
                                    <asp:RequiredFieldValidator ID="reqFldPercentageFrom" runat="server" 
                                        ControlToValidate="txtPercentageFrom" ErrorMessage="*" 
                                        ValidationGroup="AddGrading"></asp:RequiredFieldValidator>
                                    &nbsp;
                                    <cc1:MaskedEditExtender ID="MskEdtPercentageFrom" runat="server" 
                                        AcceptNegative="Left" ErrorTooltipEnabled="True" InputDirection="RightToLeft" 
                                        Mask="999" MaskType="Number" MessageValidatorTip="true" 
                                        TargetControlID="txtPercentageFrom" />
                                    <cc1:MaskedEditValidator ID="MskEdtValPercentageFrom" runat="server" 
                                        ControlExtender="MskEdtPercentageFrom" ControlToValidate="txtPercentageFrom" 
                                        EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers" 
                                        IsValidEmpty="false" MaximumValue="100" MaximumValueMessage=" &lt; 101" 
                                        MinimumValue="0" MinimumValueMessage=" &gt; -1" 
                                        ToolTip="Enter values from 0 to 10" ValidationGroup="AddGrading">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </cc1:MaskedEditValidator>
                                </td>
                                <td align="left" class="label">
                                    <b>Grade Point</b></td>
                                <td align="left">
                                    <asp:DropDownList ID="drpGradePoint" runat="server" CssClass="InputTxtBox" 
                                        Width="80px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="reqFldGradePoint" runat="server" 
                                        ControlToValidate="drpGradePoint" ErrorMessage="*" 
                                        ValidationGroup="AddGrading"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="label">
                                    &nbsp;</td>
                                <td align="left" class="label">
                                    <b>Percentage To</b></td>
                                <td align="left" >
                                    <asp:TextBox ID="txtPercentageTo" runat="server" CssClass="InputTxtBox" 
                                        Width="80px"></asp:TextBox>
                                    <cc1:MaskedEditExtender ID="MskEdtPercentageTo" runat="server" 
                                        AcceptNegative="Left" ErrorTooltipEnabled="True" InputDirection="RightToLeft" 
                                        Mask="999" MaskType="Number" MessageValidatorTip="true" 
                                        TargetControlID="txtPercentageTo" />
                                    <cc1:MaskedEditValidator ID="MskEdtValPercentageTo" runat="server" 
                                        ControlExtender="MskEdtPercentageTo" ControlToValidate="txtPercentageTo" 
                                        EmptyValueBlurredText="*" EmptyValueMessage="Enter Some Numbers" 
                                        IsValidEmpty="false" MaximumValue="100" MaximumValueMessage=" &lt; 101" 
                                        MinimumValue="0" MinimumValueMessage=" &gt; -1" 
                                        ToolTip="Enter values from 0 to 10" ValidationGroup="AddGrading">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </cc1:MaskedEditValidator>
                                    &nbsp;</td>
                                <td align="left" class="label" >
                                    <b>Explanation</b></td>
                                <td align="left" >
                                    <asp:TextBox ID="txtGradeExplanation" runat="server" CssClass="InputTxtBox" 
                                        Height="50px" TextMode="MultiLine" Width="300px">N\A</asp:TextBox>
                                    &nbsp;<asp:RequiredFieldValidator ID="reqFldGradingExplanation" runat="server" 
                                        ControlToValidate="txtGradeExplanation" ErrorMessage="*" 
                                        ValidationGroup="AddGrading"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td align="left" >
                                    &nbsp;</td>
                                <td align="left" class="label">
                                    <asp:Button ID="btnAddGrade" runat="server" CssClass="styled-button-1" 
                                        Text="ADD" ValidationGroup="AddGrading" />
                                </td>
                                <td align="left">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td align="left" colspan="3">
                                    <asp:GridView ID="grdExamWiseGradingSystem" runat="server" 
                                        AutoGenerateColumns="False" DataKeyNames="LetterGrade" 
                                        EmptyDataText="No Data Available" CssClass="mGrid">
                                        <Columns>
                                            <asp:TemplateField HeaderText="SL">
                                                <ItemTemplate>
                                                    <font style="font-size:12px">
                                                    <b><%#CType(Container, GridViewRow).RowIndex + 1%></b>
                                                    </font>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="FromPercentage">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("FromPercentage") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFromPercentage" runat="server" 
                                                        Text='<%# Bind("FromPercentage") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ToPercentage">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ToPercentage") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblToPercentage" runat="server" 
                                                        Text='<%# Bind("ToPercentage") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="LetterGrade">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("LetterGrade") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLetterGrade" runat="server" Text='<%# Bind("LetterGrade") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="GradePoint">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("GradePoint") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGradePoint" runat="server" Text='<%# Bind("GradePoint") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="GradingExplanation">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" 
                                                        Text='<%# Bind("GradingExplanation") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("GradingExplanation") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton CssClass="linkbtn" ID="lnkBtnDelete" runat="server" CausesValidation="False" 
                                                        CommandName="Delete" 
                                                        OnClientClick="if (!confirm('Are you Sure to Delete ?')) return false" 
                                                        Text="Delete"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td align="left" colspan="3">
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;</td>
            <td>
                <asp:Panel ID="pnlButton" runat="server" Width="800px" SkinID="pnlInner" >
                    <table style="width:100%;" >
                        <tr align="center" >
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="center">
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="btnSubmit" runat="server" CssClass="styled-button-1" 
                                    OnClientClick="if (!confirm('Are you Sure to Submit ?')) return false" 
                                    Text="Submit"/>
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" 
                                    Text="Cancel" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="center">
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center">
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

