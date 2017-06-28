<%@ Page Language="VB" Theme="CommonSkin"  MasterPageFile="~/HRMMaster.master" AutoEventWireup="false" CodeFile="frmScreeningInterview.aspx.vb" Inherits="ScreeningInterview_frmScreeningInterview" title=".:HRM:Screening Interview:." %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="JavaScript" type="text/javascript" >
    function openWindow(windowURL,windowName,windowWidth,windowHeight) {

    var left = (screen.width/2)-(windowWidth/2);
    var top = (screen.height/2)-(windowHeight/2);

    window.name = 'parentWnd';
    newWindow = window.open(windowURL,windowName,'top='+ top +',left='+ left +',width='+windowWidth+',height='+windowHeight+',toolbar=0,location=no,directories=0, status=0,menuBar=0,scrollBars=1,resizable=1');
    newWindow.focus();
}

</script>  

    <link href="../Sources/css/UltraCssClass.css" rel="stylesheet" type="text/css" />
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
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center" >
            <td>
                &nbsp;</td>
            <td>
                <asp:Panel ID="pnlCircularSelection" runat="server" Width="700px" SkinID="pnlInner">
                    <table style="width:100%;">
                        <tr>
                            <td align="left" class="label" style="width:20px">
                                &nbsp;</td>
                            <td align="left" class="label" >
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width:20px">
                                &nbsp;</td>
                            <td align="left" class="label" >
                                Select A Circular</td>
                            <td align="left">
                                <asp:DropDownList ID="drpAvailableCircular" runat="server" AutoPostBack="True" 
                                    CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td >
                                </td>
                            <td>
                                </td>
                        </tr>
                        <tr>
                            <td align="left" class="label" style="width:20px">
                                &nbsp;</td>
                            <td align="left" class="label">
                                &nbsp;</td>
                            <td align="left">
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
        <tr align="center" >
            <td>
                &nbsp;</td>
            <td>
                <asp:Panel ID="pnlCandidates" runat="server" SkinID="pnlInner" Width="1000px">
                    <table style="width:100%;">
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:GridView ID="grdNewCV" runat="server" AutoGenerateColumns="False" 
                                    EmptyDataText="No Data Available" SkinID="grdNoFooter" Width="950px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Select" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" CssClass="linkbtn"  runat="server" CausesValidation="False" 
                                                    CommandName="Select" Text="Select"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="AppliedJobID" Visible="False">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtAppliedJobID" runat="server" 
                                                    Text='<%# Bind("AppliedJobID") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblAppliedJobID" runat="server" 
                                                    Text='<%# Bind("AppliedJobID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText=" Candidate ID ">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CandidateID") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblCandidateID" runat="server" Text='<%# Bind("CandidateID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText=" Entry Date ">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EntryDate") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("EntryDate") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="CircularID" Visible="False">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("CircularID") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblCircularID" runat="server" Text='<%# Bind("CircularID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText=" Candidate ">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("CandidateName") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblCandidateName" runat="server" 
                                                    Text='<%# Bind("CandidateName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText=" Present District ">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("PreDistrictName") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblPreDistrict" runat="server" 
                                                    Text='<%# Bind("PreDistrictName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText=" Permanent District ">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("PerDistrictName") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblPerDistrict" runat="server" 
                                                    Text='<%# Bind("PerDistrictName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText=" Highest Degree ">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("HighestDegree") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblHighestDegree" runat="server" 
                                                    Text='<%# Bind("HighestDegree") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText=" Major ">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Major") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblMajor" runat="server" Text='<%# Bind("Major") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText=" Institution ">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("InstitutionName") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblInstitutionName" runat="server" 
                                                    Text='<%# Bind("InstitutionName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText=" CV Details " ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkChooseCVDetailsBtn" runat="server" 
                                                    CausesValidation="False" CssClass="linkbtn" Font-Size="14px" 
                                                    OnClientClick='<%# Eval("CandidateID","openWindow(""../RecuitmentCVView.aspx?CandidateID={0}"",""Popup"",1000,1100);") %>' 
                                                    Text=" View "></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText=" Job Title " Visible="False">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("JobTitle") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblJobTitle" runat="server" Text='<%# Bind("JobTitle") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                            <td>
                                &nbsp;</td>
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
                <asp:Panel ID="pnlScreeningInterview" runat="server" Width="1000px" 
                    SkinID="pnlInner">
                    <table style="width:100%;">
                        <tr align="left" >
                            <td style="height:20px;width:20px;">
                                &nbsp;</td>
                            <td style="width:450px">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td><asp:Label ID="lblQ01" runat="server" Text="" ForeColor="Red" ></asp:Label>
                                Interview Method</td>
                            <td>
                                <asp:RadioButtonList ID="rdbtnInterviewMethod" runat="server" 
                                    CssClass="RadioButton" RepeatDirection="Horizontal" AutoPostBack="True" >
                                    <asp:ListItem>Phone</asp:ListItem>
                                    <asp:ListItem>Face-To-Face</asp:ListItem>
                                    <asp:ListItem>Webcam</asp:ListItem>
                                    <asp:ListItem>Chat</asp:ListItem>
                                    <asp:ListItem>Social Networking Site</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldInterviewMethod" runat="server" 
                                    ControlToValidate="rdbtnInterviewMethod" Display="None" 
                                    ValidationGroup="CVScreening" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldInterviewMethod_ValidatorCalloutExtender" 
                                    runat="server" Enabled="True" TargetControlID="reqFldInterviewMethod" CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png" >
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td style="width:450px">
                                 <asp:Label ID="lblQ02" runat="server" Text="" ForeColor="Red" ></asp:Label>
                                 <span style="color:Green">( Q.01 )</span> Ask questions about family especially 
                                 parents, spouse and siblings. Try to find out critical family issues i.e. 
                                 whether there is any political involvement or other influence from the family 
                                 references (avoid Police, Lawyer, Journalist, Politician if there is a direct 
                                 relation).
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rdbtnFamilyIssue" runat="server" 
                                    CssClass="RadioButton" Width="300px">
                                    <asp:ListItem>Fair</asp:ListItem>
                                    <asp:ListItem>Some liability but acceptable</asp:ListItem>
                                    <asp:ListItem>Not acceptable due to critical family issues</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldFamilyIssue" runat="server" 
                                    ControlToValidate="rdbtnFamilyIssue" ErrorMessage="Required" 
                                    ValidationGroup="CVScreening" Display="None"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldFamilyIssue_ValidatorCalloutExtender" 
                                    runat="server" Enabled="True" TargetControlID="reqFldFamilyIssue" CssClass="customCalloutStyle" CloseImageUrl="~/Sources/images/valClose.png" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td style="width:450px">
                                 <span style="color:Green">( Q.02 )</span> Check References from the CV and ask 
                                 about applicant’s relation with the references (avoid Police, Lawyer, 
                                 Journalist, Politician if there is a direct relation).</td>
                            <td>
                                <asp:RadioButtonList ID="rdbtnChqReference" runat="server" CssClass="RadioButton" 
                                    RepeatDirection="Horizontal" Width="300px">
                                    <asp:ListItem>Acceptable</asp:ListItem>
                                    <asp:ListItem>Not Acceptable</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldChqReference" runat="server" 
                                    ControlToValidate="rdbtnChqReference" Display="None" ErrorMessage="Required" 
                                    ValidationGroup="CVScreening"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldChqReference_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldChqReference" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td style="width:450px">
                                 <span style="color:Green">( Q.03 )</span> Do you know anyone in this institution 
                                 ? Whom?
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rdbtnAnyOneKnownInThisInstitution" runat="server" CssClass="RadioButton" 
                                    RepeatDirection="Horizontal" Width="300px" AutoPostBack="True">
                                    <asp:ListItem>NO</asp:ListItem>
                                    <asp:ListItem>YES</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:Panel ID="pnlAnyOneKnownToCandidate" Width="400px" SkinID="pnlInner"  runat="server">
                                <table>
                                    <tr>
                                        <td> Employee Designation:</td>
                                        <td> <asp:DropDownList ID="drpDesignation" runat="server" CssClass="InputTxtBox" Width="200px"></asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td>Name Of Employee:</td>
                                        <td><asp:TextBox ID="txtEmployeeName" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox></td>
                                    </tr>
                                </table>
                                </asp:Panel>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldAnyOneKnownInThisInstitution" 
                                    runat="server" ControlToValidate="rdbtnAnyOneKnownInThisInstitution" 
                                    Display="None" ErrorMessage="Required" ValidationGroup="CVScreening"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldAnyOneKnownInThisInstitution_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldAnyOneKnownInThisInstitution" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td style="width:450px">
                                 <span style="color:Green">( Q.04 )</span> How do you know the above person ?</td>
                            <td>
                                <asp:RadioButtonList ID="rdbtnHowDoKnowThePerson" runat="server" CssClass="RadioButton" 
                                    RepeatDirection="Horizontal">
                                    <asp:ListItem>N\A</asp:ListItem>
                                    <asp:ListItem>Relative</asp:ListItem>
                                    <asp:ListItem>Relative of a Friend</asp:ListItem>
                                    <asp:ListItem>Pervious Supervisor</asp:ListItem>
                                    <asp:ListItem>Distant Relation</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldHowDoKnowThePerson" runat="server" 
                                    ControlToValidate="rdbtnHowDoKnowThePerson" Display="None" 
                                    ErrorMessage="Required" ValidationGroup="CVScreening"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldHowDoKnowThePerson_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldHowDoKnowThePerson" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td style="width:450px">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td style="width:450px">
                                 <span style="color:Green">( Q.05 )</span> Check University Degree. If from a 
                                 completely different background, ask questions about reason for applying ?</td>
                            <td>
                                <asp:RadioButtonList ID="rdbtnChqDiffBackGround" runat="server" CssClass="RadioButton" 
                                    RepeatDirection="Horizontal" Width="300px">
                                    <asp:ListItem>Acceptable</asp:ListItem>
                                    <asp:ListItem>Not Clear</asp:ListItem>
                                    <asp:ListItem>Not Acceptable</asp:ListItem>
                                </asp:RadioButtonList>
                                </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldChqDiffBackGround" runat="server" 
                                    ControlToValidate="rdbtnChqDiffBackGround" Display="None" 
                                    ErrorMessage="Required" ValidationGroup="CVScreening"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldChqDiffBackGround_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldChqDiffBackGround" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td style="width:450px">
                                 <span style="color:Green">( Q.06 )</span> What type of Job you are looking for? 
                                 Why is that ?
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rdbtnJobLookingFor" runat="server" CssClass="RadioButton" 
                                    RepeatDirection="Horizontal" Width="300px">
                                    <asp:ListItem>Desk Job</asp:ListItem>
                                    <asp:ListItem>Marketing</asp:ListItem>
                                    <asp:ListItem>Mixture</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldJobLookingFor" runat="server" 
                                    ControlToValidate="rdbtnJobLookingFor" Display="None" ErrorMessage="Required" 
                                    ValidationGroup="CVScreening"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldJobLookingFor_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldJobLookingFor" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td style="width:450px">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td style="width:450px">
                                 <span style="color:Green">( Q.07 )</span> Are you interested to relocate 
                                 anywhere in Bangladesh ? </td>
                            <td>
                                <asp:RadioButtonList ID="rdbtnChqJobLocation" runat="server" CssClass="RadioButton" 
                                    RepeatDirection="Horizontal" Width="300px">
                                    <asp:ListItem>YES</asp:ListItem>
                                    <asp:ListItem>NO</asp:ListItem>
                                </asp:RadioButtonList>
                                &nbsp;</td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldChqJobLocation" runat="server" 
                                    ControlToValidate="rdbtnChqJobLocation" Display="None" ErrorMessage="Required" 
                                    ValidationGroup="CVScreening"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldChqJobLocation_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldChqJobLocation" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td style="width:450px">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td style="width:450px">
                                 <span style="color:Green">( Q.08 )</span> What do you know about financial 
                                 sector and ULC ? How do you know about ULC ?</td>
                            <td>
                                <asp:RadioButtonList ID="rdbtnAboutFinancialSector" runat="server" 
                                    CssClass="RadioButton" Width="300px">
                                    <asp:ListItem>Described satisfactorily</asp:ListItem>
                                    <asp:ListItem>Average knowledge</asp:ListItem>
                                    <asp:ListItem>Very Poor knowledge</asp:ListItem>
                                    <asp:ListItem>No knowledge at all</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldAboutFinancialSector" runat="server" 
                                    ControlToValidate="rdbtnAboutFinancialSector" Display="None" 
                                    ErrorMessage="Required" ValidationGroup="CVScreening"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldAboutFinancialSector_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldAboutFinancialSector" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td style="width:450px">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td style="width:450px">
                                 <span style="color:Green">( Q.09 )</span> What are your current job 
                                 responsibilities ?</td>
                            <td>
                                <div style="max-height:100px;max-width:320px;overflow:auto">
                                <asp:CheckBoxList ID="chkListResponsibilityMatch" runat="server" Width="300px" 
                                        CssClass="chkText">
                                </asp:CheckBoxList>
                                </div>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td style="width:450px">
                                <span style="color:Green">( Q.10 )</span> Why you would like to switch from your 
                                current employer?</td>
                            <td>
                                <asp:RadioButtonList ID="rdbtnWhyToSwitchCurrentEmployer" runat="server" 
                                    CssClass="RadioButton" Width="300px">
                                    <asp:ListItem>Change Industry</asp:ListItem>
                                    <asp:ListItem>Better Salary</asp:ListItem>
                                    <asp:ListItem>Better Working Opportunity</asp:ListItem>
                                    <asp:ListItem>Better Position</asp:ListItem>
                                    <asp:ListItem>Don’t Know</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldWhyToSwitchCurrentEmployer" 
                                    runat="server" ControlToValidate="rdbtnWhyToSwitchCurrentEmployer" 
                                    Display="None" ErrorMessage="Required" ValidationGroup="CVScreening"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldWhyToSwitchCurrentEmployer_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldWhyToSwitchCurrentEmployer" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td style="width:450px">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td style="width:450px">
                                <span style="color:Green">( Q.11 )</span> Why you are interested about financial 
                                institutions (if new)?</td>
                            <td>
                                <asp:RadioButtonList ID="rdbtnWhyFinancialSector" runat="server" 
                                    CssClass="RadioButton" Width="300px">
                                    <asp:ListItem>Match with my education</asp:ListItem>
                                    <asp:ListItem>Structured industry</asp:ListItem>
                                    <asp:ListItem>Don’t Know</asp:ListItem>
                                    <asp:ListItem>Not Required</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldWhyFinancialSector" runat="server" 
                                    ControlToValidate="rdbtnWhyFinancialSector" Display="None" 
                                    ErrorMessage="Required" ValidationGroup="CVScreening"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldWhyFinancialSector_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldWhyFinancialSector" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td style="width:450px">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td style="width:450px">
                                <span style="color:Green">( Q.12 )</span> Personality of the applicant</td>
                            <td>
                                <asp:RadioButtonList ID="rdbtnPersonality" runat="server" 
                                    CssClass="RadioButton" RepeatDirection="Horizontal" Width="300px">
                                    <asp:ListItem>Pleasant</asp:ListItem>
                                    <asp:ListItem>Average</asp:ListItem>
                                    <asp:ListItem>Low</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldPersonality" runat="server" 
                                    ControlToValidate="rdbtnPersonality" Display="None" ErrorMessage="Required" 
                                    ValidationGroup="CVScreening"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldPersonality_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldPersonality" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left" style="height:2px;">
                            <td>
                                &nbsp;</td>
                            <td style="width:450px">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td style="width:450px">
                                <span style="color:Green">( Q.13 )</span> Attitude and Behavior</td>
                            <td>
                                <asp:RadioButtonList ID="rdbtnAttitude" runat="server" 
                                    CssClass="RadioButton" RepeatDirection="Horizontal" Width="300px">
                                    <asp:ListItem>Positive</asp:ListItem>
                                    <asp:ListItem>Average</asp:ListItem>
                                    <asp:ListItem>Negative</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldAttitude" runat="server" 
                                    ControlToValidate="rdbtnAttitude" Display="None" ErrorMessage="Required" 
                                    ValidationGroup="CVScreening"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldAttitude_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldAttitude" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left" style="height:2px">
                            <td>
                                &nbsp;</td>
                            <td style="width:450px">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td style="width:450px">
                                <span style="color:Green">( Q.14 )</span> Maturity Level</td>
                            <td>
                                <asp:RadioButtonList ID="rdbtnMaturityLevel" runat="server" 
                                    CssClass="RadioButton" RepeatDirection="Horizontal" Width="300px">
                                    <asp:ListItem>High</asp:ListItem>
                                    <asp:ListItem>Average</asp:ListItem>
                                    <asp:ListItem>Low</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldMaturityLevel" runat="server" 
                                    ControlToValidate="rdbtnMaturityLevel" Display="None" ErrorMessage="Required" 
                                    ValidationGroup="CVScreening"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldMaturityLevel_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldMaturityLevel" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left" style="height:2px">
                            <td>
                                &nbsp;</td>
                            <td style="width:450px">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td style="width:450px">
                                <span style="color:Green">( Q.15 )</span> Potential for ULC
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rdbtnIsPotentialForULC" runat="server" 
                                    CssClass="RadioButton" RepeatDirection="Horizontal" Width="300px">
                                    <asp:ListItem>Yes</asp:ListItem>
                                    <asp:ListItem>No possibility</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldrdbtnIsPotentialForULC" runat="server" 
                                    ControlToValidate="rdbtnIsPotentialForULC" Display="None" 
                                    ErrorMessage="Required" ValidationGroup="CVScreening"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldrdbtnIsPotentialForULC_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldrdbtnIsPotentialForULC" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td style="width:450px">
                                <span style="color:Green">( Q.16 )</span> Questions to reveal what kind of 
                                person you are</td>
                            <td>
                                <asp:CheckBoxList ID="chkWhatKindOfPerson" runat="server" 
                                    RepeatDirection="Horizontal" CssClass="chkText">
                                    <asp:ListItem>Reliable</asp:ListItem>
                                    <asp:ListItem>Trustworth</asp:ListItem>
                                    <asp:ListItem>Team-Oriented</asp:ListItem>
                                </asp:CheckBoxList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td>
                                <span style="color:Green">( Q.17 ) </span>Suitable For Which Department ?</td>
                            <td>
                                <div style="max-height:100px;max-width:320px;overflow:auto">
                                <asp:CheckBoxList ID="chkListSuitableDepartments" runat="server" Width="300px" 
                                        CssClass="chkText">
                                </asp:CheckBoxList>
                                </div> 
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td>
                                <span style="color:Green">( Q.18 ) </span>Score Card</td>
                            <td>
                                <asp:DropDownList ID="drpScoreCard" runat="server" CssClass="InputTxtBox" 
                                    Width="200px">
                                    <asp:ListItem>Worst</asp:ListItem>
                                    <asp:ListItem>Average</asp:ListItem>
                                    <asp:ListItem>Good</asp:ListItem>
                                    <asp:ListItem>Better</asp:ListItem>
                                    <asp:ListItem>Best</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldScoreCard" runat="server" 
                                    ControlToValidate="drpScoreCard" Display="None" ErrorMessage="Required" 
                                    ValidationGroup="CVScreening"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldScoreCard_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldScoreCard" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                &nbsp;</td>
                            <td>
                                Take verbatim notes:&nbsp;</td>
                            <td>
                                <asp:TextBox ID="txtTakeVerbatimNotes" runat="server" CssClass="InputTxtBox" 
                                    Height="50px" TextMode="MultiLine" Width="280px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldTakeVerbatimNotes" runat="server" 
                                    ControlToValidate="txtTakeVerbatimNotes" Display="None" ErrorMessage="Required" 
                                    ValidationGroup="CVScreening"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldTakeVerbatimNotes_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldTakeVerbatimNotes" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
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
                <asp:Panel ID="pnlNextAction" runat="server" Width="1000px" SkinID="pnlInner" >
                    <table style="width:100%;">
                        <tr align="left" >
                            <td style="width:20px">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr  align="left" >
                            <td>
                                &nbsp;</td>
                            <td style="width:450px">
                                Next Course Of Action</td>
                            <td>
                                <asp:DropDownList ID="drpNextCourseOfAction" runat="server" Width="200px" 
                                    CssClass="InputTxtBox">
                                </asp:DropDownList>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldNextCourseOfAction" runat="server" 
                                    ControlToValidate="drpNextCourseOfAction" Display="None" 
                                    ErrorMessage="Required" ValidationGroup="CVScreening"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldNextCourseOfAction_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldNextCourseOfAction" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="left" >
                            <td>
                                &nbsp;</td>
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
        <tr align="center" >
            <td>
                &nbsp;</td>
            <td>
                <asp:Panel ID="pnlButtons" runat="server" SkinID="pnlInner" Width="1000px">
                    <table style="width:100%;">
                        <tr align="center" >
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="center" >
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="btnChooseCV" runat="server" Text="Choose CV" 
                                    CssClass="styled-button-1" ValidationGroup="CVScreening" />
                                &nbsp;<asp:Button ID="btnRejectCV" runat="server" Text="Reject CV" 
                                    CssClass="styled-button-1" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr align="center" >
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
        <tr align="center" >
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

