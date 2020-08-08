<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="final.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section id="One" class="wrapper style3">
        <div class="inner">
            <header class="align-center">
                <p>Hello</p>
                <h2><asp:Label ID="lblUser" runat="server" Text="UnKnownUser"></asp:Label></h2>
            </header>
        </div>
    </section>
    <section id="two" class="wrapper style2">
        <div class="inner" style="width: 40%;">
            <div class="box" align="center" >
                <div class="content">
                    <header class="align-center">
                        <p>Change</p>
                        <h2>Password</h2>
                    </header>
                    <form>
                    <table  class="align-center" align="center" frame="border" style="width: 95%;">
                        <tr style="border-color: #FFFFFF; background-color: #FFFFFF">
                            <td style="width: 30%; text-align: left;"><asp:Label ID="Label1" runat="server" 
                                    Text="Old Password:"></asp:Label></td>
                            <td style="width:60%;"><asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Old Password Can't be Empty" 
                             ControlToValidate="txtNewPassword" CssClass="ValidationError" 
                                    ToolTip="Password is a REQUIRED field" ForeColor="Red"></asp:RequiredFieldValidator>                           
                            </td>
                        </tr>
                        <tr style="border-color: #FFFFFF; background-color: #FFFFFF">
                            <td style="width: 30%; text-align: left;"><asp:Label ID="Label2" runat="server" Text="Password:"></asp:Label>
                            </td>
                            <td style="width:60%;"><asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="New Password Can't be Empty" 
                             ControlToValidate="txtNewPassword" CssClass="ValidationError" 
                                    ToolTip="Password is a REQUIRED field" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr style="border-color: #FFFFFF; background-color: #FFFFFF">
                            <td style="width: 30%; text-align: left;"><asp:Label ID="Label3" runat="server" 
                                    Text="Confirm Password:"></asp:Label></td>

                            <td style="width:60%;"><asp:TextBox ID="txtConfPass" runat="server" TextMode="Password"></asp:TextBox>
                             <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                    ControlToValidate="txtConfPass" CssClass="ValidationError"
                             ControlToCompare="txtNewPassword" ErrorMessage="Password Not Matched" 
                                    ToolTip="Password must be the same" ForeColor="Red" />
                            </td>
                        </tr>
                        <tr style="border-color: #FFFFFF; background-color: #FFFFFF">
                            <td colspan="2" style="border-color: #FFFFFF; background-color: #FFFFFF" >
                                <asp:Button ID="btnChange" runat="server" Text="Change" 
                                    CssClass="button0 button2" onclick="btnChange_Click1" ></asp:Button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblMsg" runat="server" Text="" />
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
