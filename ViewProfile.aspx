<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="ViewProfile.aspx.cs" Inherits="final.ViewProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="two" class="wrapper style2">
        <div class="inner" style="width: 40%;" align="center">
            <div class="box">
                <div class="content">
                    <header class="align-center">
                        <p>student</p>
                        <h2>Profile</h2>
                    </header>
                    Name: <asp:Label ID="lblName" runat="server" Text="Label" Font-Bold="True"></asp:Label><br>  
                    Address: <asp:Label ID="lblAddress" runat="server" Text="Label" Font-Bold="True"></asp:Label><br>
                    DOB: <asp:Label ID="lblDob" runat="server" Text="Label" Font-Bold="False"></asp:Label><br>
                    Gender: <asp:Label ID="lblGender" runat="server" Text="Label" Font-Bold="True"></asp:Label><br>
                    ContactNo:<asp:Label ID="lblContact" runat="server" Text="Label" Font-Bold="True"></asp:Label><br>
                    Parents ContactNo:<asp:Label ID="lblParantsContact" runat="server" Text="Label" Font-Bold="True"></asp:Label><br>
                    Department:<asp:Label ID="lblDepartment" runat="server" Text="Label" Font-Bold="True"></asp:Label><br>
                    EmailId:<asp:Label ID="lblEmail" runat="server" Text="Label" Font-Bold="True"></asp:Label><br>
                    Mother Name:<asp:Label ID="lblMother" runat="server" Text="Label" Font-Bold="True"></asp:Label><br>
                    Father Name:<asp:Label ID="lblFather" runat="server" Text="Label" Font-Bold="True"></asp:Label><br>
                    User Name:<asp:Label ID="lblUserName" runat="server" Text="Label" Font-Bold="True"></asp:Label><br>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
