<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="FeeStucture.aspx.cs" Inherits="final.FeeStucture" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 214px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--
<section id="One" class="wrapper style3">
    <div class="inner">
        <header class="align-center">
            <p>Fees</p>
            <h2>Stucture</h2>
        </header>
    </div>
</section>
-->
<section id="two" class="wrapper style2">
    <div class="inner" ">
        <div class="box" align="center" >
            <div class="content">
                <header class="align-center">
                    <p>Per Semester</p>
                    <h2>Fee Stucture</h2>

                <asp:Wizard ID="FeesWizard" runat="server" ActiveStepIndex="1">
                    <FinishNavigationTemplate>
                        <asp:Button ID="FinishPreviousButton" runat="server" BackColor="#4CAF50" 
                            CausesValidation="False" CommandName="MovePrevious" CssClass="button0 button2" 
                            Text="Previous" />
                        <asp:Button ID="FinishButton" runat="server" BackColor="#4CAF50" 
                            CommandName="MoveComplete" CssClass="button0 button2" Text="Finish" />
                    </FinishNavigationTemplate>
                    <NavigationButtonStyle BackColor="#4CAF50" CssClass="button0 button2" />
                    <NavigationStyle Wrap="True" />
                    <SideBarButtonStyle CssClass="button0 button2" ForeColor="White" />
                    <SideBarStyle BackColor="White" />
                    <StartNavigationTemplate>
                        <asp:Button ID="StartNextButton" runat="server" BackColor="#4CAF50" 
                            CommandName="MoveNext" CssClass="button0 button2" Text="Next" />
                    </StartNavigationTemplate>
                    <StepNavigationTemplate>
                        <asp:Button ID="StepPreviousButton" runat="server" BackColor="#4CAF50" 
                            CausesValidation="False" CommandName="MovePrevious" CssClass="button0 button2" 
                            Text="Previous" />
                        <asp:Button ID="StepNextButton" runat="server" BackColor="#4CAF50" 
                            CommandName="MoveNext" CssClass="button0 button2" Text="Next" />
                    </StepNavigationTemplate>
                    <WizardSteps>
                        <asp:WizardStep ID="WizardStep1" runat="server" title="Room For 1">
                            <h2>Room For 1</h2>
                            <table>
                                    <tr style="background-color: #70AD47;">
                                        <td style="text-align: left" class="style1">
                                            <h4 style="color: #FFFFFF;">Type:</h4>
                                        </td>
                                        <td>
                                            <h4 style="color: #FFFFFF;">A/C</h4>
                                        </td>
                                        <td>
                                            <h4 style="color: #FFFFFF;">Non A/C</h4>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color:#70AD47 ; text-align: left;" class="style1">
                                            <h4 style="color: #FFFFFF;">Deposite:</h4>
                                        </td>
                                        <td style="background-color: #C5E0B3">
                                            <h4>5000 Rs</h4>
                                        </td>
                                        <td style="background-color: #C5E0B3">
                                            <h4>5000 Rs</h4>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color:#70AD47 ; text-align: left;" class="style1">
                                            <h4 style="color: #FFFFFF;">Facility Charge:</h4>
                                        </td>
                                        <td style="background-color: #E2EFD9">
                                            <h4>10000 Rs</h4>
                                        </td>
                                        <td style="background-color: #E2EFD9">
                                            <h4>-</h4>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color:#70AD47 ; text-align: left;" class="style1">
                                            <h4 style="color: #FFFFFF;">Room rent:</h4>
                                        </td>
                                        <td style="background-color: #C5E0B3">
                                            <h4>56000 Rs</h4>
                                        </td>
                                        <td style="background-color: #C5E0B3">
                                            <h4>56000 Rs</h4>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color:#70AD47 ; text-align: left;" class="style1">
                                            <h4 style="color: #FFFFFF;">Total:</h4>
                                        </td>
                                        <td style="background-color: #E2EFD9">
                                            <h4 style="font-weight: bold">66000 Rs</h4>
                                        </td>
                                        <td style="background-color: #E2EFD9">
                                            <h4 style="font-weight: bold">56000 Rs</h4>
                                        </td>
                                    </tr>
                                    <tr style="background-color: #FFFFFF">
                                        <td colspan="3"> <asp:Button runat="server" ID="txtBook1" Text="Book Now" CssClass="button0 button2"/></td>
                                    </tr>
                            </table> 
                        </asp:WizardStep>
                        <asp:WizardStep ID="WizardStep2" runat="server" title="Room For 2">
                            <h2>Room For 2</h2>
                            <table>
                                    <tr style="background-color: #70AD47;">
                                        <td style="text-align: left" class="style1">
                                            <h4 style="color: #FFFFFF;">Type:</h4>
                                        </td>
                                        <td>
                                            <h4 style="color: #FFFFFF;">A/C</h4>
                                        </td>
                                        <td>
                                            <h4 style="color: #FFFFFF;">Non A/C</h4>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color:#70AD47 ; text-align: left;" class="style1">
                                            <h4 style="color: #FFFFFF;">Deposite:</h4>
                                        </td>
                                        <td style="background-color: #C5E0B3">
                                            <h4>5000 Rs</h4>
                                        </td>
                                        <td style="background-color: #C5E0B3">
                                            <h4>5000 Rs</h4>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color:#70AD47 ; text-align: left;" class="style1">
                                            <h4 style="color: #FFFFFF;">Facility Charge:</h4>
                                        </td>
                                        <td style="background-color: #E2EFD9">
                                            <h4>10000 Rs</h4>
                                        </td>
                                        <td style="background-color: #E2EFD9">
                                            <h4>-</h4>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color:#70AD47 ; text-align: left;" class="style1">
                                            <h4 style="color: #FFFFFF;">Room rent:</h4>
                                        </td>
                                        <td style="background-color: #C5E0B3">
                                            <h4>50000 Rs</h4>
                                        </td>
                                        <td style="background-color: #C5E0B3">
                                            <h4>50000 Rs</h4>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color:#70AD47 ; text-align: left;" class="style1">
                                            <h4 style="color: #FFFFFF;">Total:</h4>
                                        </td>
                                        <td style="background-color: #E2EFD9">
                                            <h4 style="font-weight: bold">60000 Rs</h4>
                                        </td>
                                        <td style="background-color: #E2EFD9">
                                            <h4 style="font-weight: bold">50000 Rs</h4>
                                        </td>
                                    </tr>
                                    <tr style="background-color: #FFFFFF">
                                        <td colspan="3"> <asp:Button runat="server" ID="txtBook2" Text="Book Now" CssClass="button0 button2"/></td>
                                    </tr>
                            </table> 
                        </asp:WizardStep>
                        <asp:WizardStep ID="WizardStep3" runat="server" title="Room For 3">
                            <h2>Room For 3</h2>
                            <table>
                                    <tr style="background-color: #70AD47;">
                                        <td style="text-align: left" class="style1">
                                            <h4 style="color: #FFFFFF;">Type:</h4>
                                        </td>
                                        <td>
                                            <h4 style="color: #FFFFFF;">A/C</h4>
                                        </td>
                                        <td>
                                            <h4 style="color: #FFFFFF;">Non A/C</h4>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color:#70AD47 ; text-align: left;" class="style1">
                                            <h4 style="color: #FFFFFF;">Deposite:</h4>
                                        </td>
                                        <td style="background-color: #C5E0B3">
                                            <h4>5000 Rs</h4>
                                        </td>
                                        <td style="background-color: #C5E0B3">
                                            <h4>5000 Rs</h4>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color:#70AD47 ; text-align: left;" class="style1">
                                            <h4 style="color: #FFFFFF;">Facility Charge:</h4>
                                        </td>
                                        <td style="background-color: #E2EFD9">
                                            <h4>10000 Rs</h4>
                                        </td>
                                        <td style="background-color: #E2EFD9">
                                            <h4>-</h4>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color:#70AD47 ; text-align: left;" class="style1">
                                            <h4 style="color: #FFFFFF;">Room rent:</h4>
                                        </td>
                                        <td style="background-color: #C5E0B3">
                                            <h4>40000 Rs</h4>
                                        </td>
                                        <td style="background-color: #C5E0B3">
                                            <h4>40000 Rs</h4>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color:#70AD47 ; text-align: left;" class="style1">
                                            <h4 style="color: #FFFFFF;">Total:</h4>
                                        </td>
                                        <td style="background-color: #E2EFD9">
                                            <h4 style="font-weight: bold">50000 Rs</h4>
                                        </td>
                                        <td style="background-color: #E2EFD9">
                                            <h4 style="font-weight: bold">40000 Rs</h4>
                                        </td>
                                    </tr>
                                    <tr style="background-color: #FFFFFF">
                                        <td colspan="3"> <asp:Button runat="server" ID="txtBook3" Text="Book Now" CssClass="button0 button2"/></td>
                                    </tr>
                            </table> 
                        </asp:WizardStep>
                        <asp:WizardStep ID="WizardStep4" runat="server" title="Room For 4">
                            <h2>Room For 4</h2>
                            <table>
                                    <tr style="background-color: #70AD47;">
                                        <td style="text-align: left" class="style1">
                                            <h4 style="color: #FFFFFF;">Type:</h4>
                                        </td>
                                        <td>
                                            <h4 style="color: #FFFFFF;">A/C</h4>
                                        </td>
                                        <td>
                                            <h4 style="color: #FFFFFF;">Non A/C</h4>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color:#70AD47 ; text-align: left;" class="style1">
                                            <h4 style="color: #FFFFFF;">Deposite:</h4>
                                        </td>
                                        <td style="background-color: #C5E0B3">
                                            <h4>5000 Rs</h4>
                                        </td>
                                        <td style="background-color: #C5E0B3">
                                            <h4>5000 Rs</h4>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color:#70AD47 ; text-align: left;" class="style1">
                                            <h4 style="color: #FFFFFF;">Facility Charge:</h4>
                                        </td>
                                        <td style="background-color: #E2EFD9">
                                            <h4>10000 Rs</h4>
                                        </td>
                                        <td style="background-color: #E2EFD9">
                                            <h4>-</h4>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color:#70AD47 ; text-align: left;" class="style1">
                                            <h4 style="color: #FFFFFF;">Room rent:</h4>
                                        </td>
                                        <td style="background-color: #C5E0B3">
                                            <h4>35000 Rs</h4>
                                        </td>
                                        <td style="background-color: #C5E0B3">
                                            <h4>35000 Rs</h4>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-color:#70AD47 ; text-align: left;" class="style1">
                                            <h4 style="color: #FFFFFF;">Total:</h4>
                                        </td>
                                        <td style="background-color: #E2EFD9">
                                            <h4 style="font-weight: bold">45000 Rs</h4>
                                        </td>
                                        <td style="background-color: #E2EFD9">
                                            <h4 style="font-weight: bold">35000 Rs</h4>
                                        </td>
                                    </tr>
                                    <tr style="background-color: #FFFFFF">
                                        <td colspan="3"> <asp:Button runat="server" ID="txtBook4" Text="Book Now" CssClass="button0 button2"/></td>
                                    </tr>
                            </table> 
                        </asp:WizardStep>
                    </WizardSteps>
                </asp:Wizard>

                </header>
            </div>
        </div>
    </div>
</section>

</asp:Content>

