<%@ Page Language="VB" MasterPageFile="~/HRMMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmEmployeeTurnover.aspx.vb" Inherits="Resource_frmEmployeeTurnover"
    Title=".::HRS:Employee Turnover Report::." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr align="center">
            <td colspan="2">
                <asp:Panel ID="pnlEmpTurnOverParam" runat="server" Width="60%" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="left">
                            <td colspan="5">
                                <div class="widget-title">
                                    Employee Turnover Report<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                Start Date
                            </td>
                            <td>
                                <asp:TextBox ID="txtStartDate" runat="server" CssClass="InputTxtBox" Width="80px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtStartDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtStartDate">
                                </cc1:CalendarExtender>
                            </td>
                            <td class="label">
                                3D Mode
                            </td>
                            <td>
                                <asp:DropDownList ID="drp3DEnabled" runat="server" CssClass="InputTxtBox" Width="70px">
                                    <asp:ListItem Value="True">YES</asp:ListItem>
                                    <asp:ListItem Value="False">NO</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                            </td>
                            <td class="label">
                                End Date
                            </td>
                            <td>
                                <asp:TextBox ID="txtEndDate" runat="server" Width="80px" CssClass="InputTxtBox"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtEndDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtEndDate">
                                </cc1:CalendarExtender>
                            </td>
                            <td class="label">
                                Chart Type
                            </td>
                            <td>
                                <asp:DropDownList ID="drpChartType" runat="server" CssClass="InputTxtBox" Width="120px">
                                    <asp:ListItem Value="13">Area</asp:ListItem>
                                    <asp:ListItem Value="7">Bar</asp:ListItem>
                                    <asp:ListItem Value="28">BoxPlot</asp:ListItem>
                                    <asp:ListItem Value="2">Bubble</asp:ListItem>
                                    <asp:ListItem Value="20">Candlestick</asp:ListItem>
                                    <asp:ListItem Value="10">Column</asp:ListItem>
                                    <asp:ListItem Value="18">Doughnut</asp:ListItem>
                                    <asp:ListItem Value="27">ErrorBar</asp:ListItem>
                                    <asp:ListItem Value="6">FastLine</asp:ListItem>
                                    <asp:ListItem Value="1">FastPoint</asp:ListItem>
                                    <asp:ListItem Value="33">Funnel</asp:ListItem>
                                    <asp:ListItem Value="31">Kagi</asp:ListItem>
                                    <asp:ListItem Value="3">Line</asp:ListItem>
                                    <asp:ListItem Value="17">Pie</asp:ListItem>
                                    <asp:ListItem Value="0">Point</asp:ListItem>
                                    <asp:ListItem Value="32">PointAndFigure</asp:ListItem>
                                    <asp:ListItem Value="26">Polar</asp:ListItem>
                                    <asp:ListItem Value="34">Pyramid</asp:ListItem>
                                    <asp:ListItem Value="25">Radar</asp:ListItem>
                                    <asp:ListItem Value="21">Range</asp:ListItem>
                                    <asp:ListItem Value="23">RangeBar</asp:ListItem>
                                    <asp:ListItem Value="24">RangeColumn</asp:ListItem>
                                    <asp:ListItem Value="29">Renko</asp:ListItem>
                                    <asp:ListItem Value="4">Spline</asp:ListItem>
                                    <asp:ListItem Value="14">SplineArea</asp:ListItem>
                                    <asp:ListItem Value="22">SplineRange</asp:ListItem>
                                    <asp:ListItem Value="15">StackedArea</asp:ListItem>
                                    <asp:ListItem Value="11">StackedColumn</asp:ListItem>
                                    <asp:ListItem Value="5">StepLine</asp:ListItem>
                                    <asp:ListItem Value="19">Stock</asp:ListItem>
                                    <asp:ListItem Value="30">ThreeLineBreak</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button ID="btnShowReport" runat="server" CssClass="styled-button-1" Text="Show" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr align="center">
            <td style="width: 50%">
                <asp:Panel ID="pnlDesignationWiseROR" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="center">
                            <td>
                                <div class="widget-title">
                                    Employee Turnover</div>
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                                <asp:Chart ID="crtOffDesignationWiseTurnOver" runat="server" Height="450px" 
                                    Width="450px">
                                    <Series>
                                        <asp:Series Name="Series1">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="crtAreaOffDesignationROR">
                                            <AxisY>
                                                <MajorGrid LineWidth="0" />
                                            </AxisY>
                                            <AxisX>
                                                <MajorGrid LineWidth="0" />
                                            </AxisX>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                                <asp:Chart ID="crtFuncDesignationWiseTurnOver" runat="server" Height="450px" Width="450px">
                                    <Series>
                                        <asp:Series Name="Series1">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="crtAreaFuncDesignationROR">
                                            <AxisY>
                                                <MajorGrid LineWidth="0" />
                                            </AxisY>
                                            <AxisX>
                                                <MajorGrid LineWidth="0" />
                                            </AxisX>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                                <asp:Chart ID="crtDeptWiseROR" runat="server" Height="450px" Width="450px">
                                    <Series>
                                        <asp:Series Name="Series1">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="crtAreaDeptROR">
                                            <AxisY>
                                                <MajorGrid LineWidth="0" />
                                            </AxisY>
                                            <AxisX>
                                                <MajorGrid LineWidth="0" />
                                            </AxisX>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td style="width: 50%">
                <asp:Panel ID="pnlResource" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr align="center">
                            <td>
                                <div class="widget-title">
                                    Available Resource</div>
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                                <asp:Chart ID="crtOffDesigWiseResource" runat="server" Height="450px" 
                                    Width="450px">
                                    <Series>
                                        <asp:Series Name="Series1">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="crtAreaOffDesigWiseResource">
                                            <AxisY>
                                                <MajorGrid LineWidth="0" />
                                            </AxisY>
                                            <AxisX>
                                                <MajorGrid LineWidth="0" />
                                            </AxisX>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                                <asp:Chart ID="crtFuncDesigWiseResource" runat="server" Height="450px" 
                                    Width="450px">
                                    <Series>
                                        <asp:Series Name="Series1">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="crtAreaFuncDesigWiseResource">
                                            <AxisY>
                                                <MajorGrid LineWidth="0" />
                                            </AxisY>
                                            <AxisX>
                                                <MajorGrid LineWidth="0" />
                                            </AxisX>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                                <asp:Chart ID="crtDeptWiseResource" runat="server" Height="450px" Width="450px">
                                    <Series>
                                        <asp:Series Name="Series1">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="crtAreaDeptResource">
                                            <AxisY>
                                                <MajorGrid LineWidth="0" />
                                            </AxisY>
                                            <AxisX>
                                                <MajorGrid LineWidth="0" />
                                            </AxisX>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
