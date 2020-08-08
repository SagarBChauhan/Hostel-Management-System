<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="RegisterSuccess.aspx.cs" Inherits="final.RegisterSuccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<section id="One" class="wrapper style3">
    <div class="inner">
        <header class="align-center">
            <p>small Heading</p>
            <h2>Big Heading</h2>
        </header>
    </div>
</section>

<section id="two" class="wrapper style2">
    <div class="inner" style="width: 40%;">
        <div class="box" align="center" >
            <div class="content">
                <header class="align-center">
                <h2>Registration Successful</h2>
                <h3>Check Your Email for User Name & Password, Login using Attached Credintial &</h3>
                <h3>Pay Deposite 5000Rs to Active Your Account</h3>
                <p>Pay Diposite</p>
                <asp:Button ID="btnPay" runat="server" Text="Pay" CssClass="button0 button2" 
                    onclick="btnPay_Click"></asp:Button>
                </header>
            </div>
        </div>
    </div>
</section>
</asp:Content>
