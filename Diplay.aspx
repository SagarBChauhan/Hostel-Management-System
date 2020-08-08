<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Diplay.aspx.cs" Inherits="final.Diplay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- Heading with Image background -->
<section id="One" class="wrapper style3">
    <div class="inner">
        <header class="align-center">
            <p>members</p>
            <h2>Display</h2>
        </header>
    </div>
</section>
<!--white Box Style Area for Main contain -->
<section id="two" class="wrapper style2">
    <div class="inner" style="width: 40%;">
        <div class="box" align="center" >
            <div class="content">
                <header class="align-center">
                <asp:Button ID="btnStudent" runat="server" Text="Students" 
                    CssClass="button0 button2" onclick="btnStudent_Click"></asp:Button>
                <asp:Button ID="btnRector" runat="server" Text="Rector" 
                    CssClass="button0 button2" onclick="btnRector_Click"></asp:Button>
                </header>
            </div>
        </div>
    </div>
</section>
</asp:Content>
