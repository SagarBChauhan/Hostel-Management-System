<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="StudentHome.aspx.cs" Inherits="final.StudentHome" %>
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
        <div class="inner" align="center">
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
                    <asp:Panel ID="RoomBook" runat="server" HorizontalAlign="Center">
                        <h2 style="color: #FF0000">You Haven't Selected Your Room Yet, Book it Now!</h2><br>
                        <asp:Button ID="btnBook" runat="server" Text="Book Now" 
                            CssClass="button0 button2" onclick="btnBook_Click"></asp:Button>
                    </asp:Panel><br><br>
                    <asp:Panel ID="FeesAlert" runat="server">
                        <header class="align-center">
                        <p>Fees payment Alert!</p>
                        <h2 style="color: #FF0000">You haven't paid your fees yet Pay it ASAP</h2><br>
                        </header>
                        Total Amount:<asp:Label ID="lblTotalAmt" runat="server" Text="Label"></asp:Label> <br>
                        Last Date:<asp:Label ID="lblLastDate" runat="server" Text="Label"></asp:Label><br>
                        <asp:Button ID="btnPay" CssClass="button0 button2" runat="server" 
                            Text="Pay Now" onclick="btnPay_Click"></asp:Button>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
