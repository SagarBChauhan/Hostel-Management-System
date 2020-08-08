<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="RegisterStudent.aspx.cs" Inherits="final.RegisterStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="two" class="wrapper style2">
        <div class="inner">
            <div class="box">
                <div class="content">
                    <header class="align-center">
                        <p>Student</p>
                        <h2>Registration</h2>
                    </header>
                    <asp:Label ID="lblId" runat="server" Text=""></asp:Label>
                    <asp:Label ID="lblPass" runat="server" Text="Label"></asp:Label>
    <asp:Wizard ID="StudentWizard" runat="server" 
        onnextbuttonclick="StudentWizard_NextButtonClick" ActiveStepIndex="0" 
                        onfinishbuttonclick="StudentWizard_FinishButtonClick">
        <FinishNavigationTemplate>
            <asp:Button ID="FinishPreviousButton" runat="server" BackColor="#4CAF50" 
                CausesValidation="False" CommandName="MovePrevious" CssClass="button0 button2" 
                Text="Previous" />
            <asp:Button ID="FinishButton" runat="server" BackColor="#4CAF50" 
                CommandName="MoveComplete" CssClass="button0 button2" Text="Finish" />
        </FinishNavigationTemplate>
        <NavigationButtonStyle BackColor="#4CAF50" CssClass="button0 button2" />
        <SideBarButtonStyle CssClass="button0 button2" ForeColor="White" 
            Width="250px" />
        <SideBarStyle BackColor="White" Wrap="True" />
        <SideBarTemplate>
            <asp:DataList ID="SideBarList" runat="server">
                <ItemTemplate>
                    <asp:LinkButton ID="SideBarButton" runat="server" CssClass="button0 button2" 
                        ForeColor="White" Width="250px"></asp:LinkButton>
                </ItemTemplate>
                <SelectedItemStyle Font-Bold="True" />
            </asp:DataList>
        </SideBarTemplate>
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
            <asp:WizardStep ID="Step1" 
             runat="server" 
             Title="Personal Details">
                
                <table>
                    <tr style="background-color: #FFFFFF">
                        <td colspan="2">
                            <h2>Personal Details</h2>
                        </td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td>First Name:</td>
                        <td>
                            <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
ControlToValidate="txtFName" ErrorMessage="Please Enter Your First Name" ForeColor="Red"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" 
ControlToValidate="txtFName" ErrorMessage="Only String Allow" ForeColor="Red" 
 ValidationExpression="[A-za-z]*$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td>Middel Name:</td>
                        <td>
                            <asp:TextBox ID="txtMName" runat="server"></asp:TextBox>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
ControlToValidate="txtMName" ErrorMessage="Please Enter Your Middel Name" ForeColor="Red"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
ControlToValidate="txtMName" ErrorMessage="Only String Allow" ForeColor="Red" 
 ValidationExpression="[A-za-z]*$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td>Last Name:</td>
                        <td>
                            <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
ControlToValidate="txtLName" ErrorMessage="Please Enter Your Last Name" ForeColor="Red"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
ControlToValidate="txtLName" ErrorMessage="Only String Allow" ForeColor="Red" 
 ValidationExpression="[A-za-z]*$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td>Gender:</td>
                        <td>
                            <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Text="Male" Value="Male" Selected="True" ></asp:ListItem>
                                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td>Date Of Birth:</td>
                        <td>
                        <asp:TextBox ID="txtDOB" runat="server" TextMode="Date"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtDOB" ErrorMessage="Please Select Your Date Of Birth" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>                
                    </table>
            </asp:WizardStep>
            <asp:WizardStep ID="Step2" runat="server" Title="Parent's Details">
                <table >
                    <tr style="background-color: #FFFFFF" >
                        <td colspan="2">
                            Parent's Details
                        </td>
                    </tr>
                    <tr style="background-color: #FFFFFF" >
                        <td>Mother Name:</td>
                        <td><asp:TextBox ID="txtMotherName" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txtMotherName" ErrorMessage="Please Enter Your Mother Name" ForeColor="Red"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" 
                ControlToValidate="txtMotherName" ErrorMessage="Only String Allow" ForeColor="Red" 
                ValidationExpression="[A-za-z]*$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr style="background-color: #FFFFFF" >
                        <td>Father Name:</td>
                        <td><asp:TextBox ID="txtFatherName" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="txtFatherName" ErrorMessage="Please Enter Your Father Name" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                ControlToValidate="txtFatherName" ErrorMessage="Only String Allow" ForeColor="Red" 
                ValidationExpression="[A-za-z]*$"></asp:RegularExpressionValidator>                      
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:WizardStep ID="Step3" runat="server" Title="Address Details">
                <table >
                    <tr style="background-color: #FFFFFF" >
                        <td colspan="2">
                            Address Details
                        </td>
                    </tr>
                    <tr style="background-color: #FFFFFF" >
                        <td>Address:</td>
                        <td><asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ControlToValidate="txtAddress" ErrorMessage="Please Enter Your Address" ForeColor="Red"></asp:RequiredFieldValidator>                        
                        </td>
                    </tr>
                    <tr style="background-color: #FFFFFF" >
                        <td>City:</td>
                        <td><asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ControlToValidate="txtCity" ErrorMessage="Please Enter Your City" ForeColor="Red"></asp:RequiredFieldValidator>    
                        </td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td>PIN Code:</td>
                        <td><asp:TextBox ID="txtPINCode" runat="server" TextMode="Number"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                ControlToValidate="txtPINCode" ErrorMessage="Please Enter PIN Code" ForeColor="Red"></asp:RequiredFieldValidator>
 
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:WizardStep ID="Step4" runat="server" Title="Contact Details">
                <table >
                    <tr style="background-color: #FFFFFF">
                        <td colspan="2">
                            Contact Details
                        </td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td>EmailID:</td>
                        <td><asp:TextBox ID="txtEmailID" runat="server" TextMode="Email"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                ControlToValidate="txtEmailID" ErrorMessage="Please Enter EmailId" ForeColor="Red"></asp:RequiredFieldValidator>                        
                        </td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td>Student Contact No:</td>
                        <td><asp:TextBox ID="txtContactNo" runat="server" ></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                ControlToValidate="txtContactNo" ErrorMessage="Please Enter Student Contact No" ForeColor="Red"></asp:RequiredFieldValidator>                        
                        </td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td>Parents Contact No:</td>
                        <td><asp:TextBox ID="txtParentsContactNo" runat="server" ></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                ControlToValidate="txtParentsContactNo" ErrorMessage="Please Enter Parents Contact No" ForeColor="Red"></asp:RequiredFieldValidator>                        
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:WizardStep ID="Step5" runat="server" Title="Education Details">
                <table >
                    <tr style="background-color: #FFFFFF">
                        <td colspan="2">
                            Education Details
                        </td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td>Department:</td>
                        <td><asp:TextBox ID="txtDepartment" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                ControlToValidate="txtDepartment" ErrorMessage="Please Enter Department" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:WizardStep ID="Step6" runat="server" Title="Summary">
                <table >
                    <tr style="background-color: #FFFFFF">
                        <td colspan="2" align="center">
                            <h2>Summary</h2>
                        </td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td colspan="2">
                            <h3>Personal Details</h3>
                        </td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td>Name :</td>
                        <td><asp:Label ID="lblName" runat="server" Font-Bold="True" ForeColor="Black" ></asp:Label></td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td>Gender :</td>
                        <td><asp:Label ID="lblGender" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label></td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td>DOB :</td>
                        <td><asp:Label ID="lblDOB" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label></td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td colspan="2">
                            <h3>Perents Details</h3>
                        </td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td>Mother Name :</td>
                        <td><asp:Label ID="lblMotherName" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label></td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td>Fater Name :</td>
                        <td><asp:Label ID="lblFatherName" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label></td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td colspan="2">
                            <h3>Location Details</h3>
                        </td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td>Address :</td>
                        <td><asp:Label ID="lblAddress" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label></td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td>City :</td>
                        <td><asp:Label ID="lblCity" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label></td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td>Pincode :</td>
                        <td><asp:Label ID="lblPin" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label></td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td colspan="2">
                            <h3>Contact Details</h3>
                        </td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td>EmailID :</td>
                        <td><asp:Label ID="lblEmailID" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label></td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td>Student Contact No :</td>
                        <td><asp:Label ID="lblContactNo" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label></td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td>Perent Contact No :</td>
                        <td><asp:Label ID="lblPerentContactNo" runat="server" Font-Bold="True" 
                                ForeColor="Black"></asp:Label></td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td colspan="2">
                            <h3>Education Details</h3>
                        </td>
                    </tr>
                    <tr style="background-color: #FFFFFF">
                        <td>Department :</td>
                        <td><asp:Label ID="lblDepartment" runat="server" Font-Bold="True" ForeColor="Black"></asp:Label></td>
                    </tr>
                </table>
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
    <asp:Label ID="lblErrorMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
