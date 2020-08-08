    <%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="final.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--
    <section id="One" class="wrapper style3">
        <div class="inner">
            <header class="align-center">
                <p>Please</p>
                <h2>Login</h2>
            </header>
        </div>
    </section>
-->
    <section id="two" class="wrapper style2">
        <div class="inner" style="width: 40%;">
            <div class="box" align="center" >
                <div class="content">
                    <header class="align-center">
                        <p>Please</p>
                        <h2>Login</h2>
                    </header>
                    <form>
                    <table  class="align-center" align="center" frame="border" style="width: 95%;">
                        
                        <tr style="border-color: #FFFFFF; background-color: #FFFFFF">
                            <td style="width: 30%; text-align: left;"><asp:Label ID="Label1" runat="server" Text="User Name:"></asp:Label></td>
                            <td style="width:60%;"><asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="User name can't be Empty" 
                             ControlToValidate="txtUserName" CssClass="ValidationError" 
                             ToolTip="UserName is a REQUIRED field" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr style="border-color: #FFFFFF; background-color: #FFFFFF">
                            <td style="width: 30%; text-align: left;"><asp:Label ID="Label2" runat="server" Text="Password"></asp:Label></td>
                            <td style="width:60%;"><asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password can't be Empty" 
                             ControlToValidate="txtPassword" CssClass="ValidationError" 
                             ToolTip="Password is a REQUIRED field" ForeColor="Red"></asp:RequiredFieldValidator >                           
                            </td>
                        </tr>
                        <tr style="border-color: #FFFFFF; background-color: #FFFFFF">
                            <td colspan="2" style="border-color: #FFFFFF; background-color: #FFFFFF" >
                                <asp:Button ID="BtnLogin" runat="server" Text="Login" 
                                    CssClass="button0 button2" onclick="BtnLogin_Click"></asp:Button>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <a href="RegisterStudent.aspx"  class="button alt">Register if you are new</a>
                    </form>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
