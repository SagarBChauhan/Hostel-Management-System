<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="TempWebPage.aspx.cs" Inherits="final.TempSubMasterStyle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- Heading with Image background -->
<section id="One" class="wrapper style3">
    <div class="inner">
        <header class="align-center">
            <p>small Heading</p>
            <h2>Big Heading</h2>
        </header>
    </div>
</section>
<!--white Box Style Area for Main contain -->
<section id="two" class="wrapper style2">
    <div class="inner" style="width: 40%;">
        <div class="box" align="center" >
            <div class="content">
                <header class="align-center">
                    <p>small Heading</p>
                    <h2>Big Heading</h2>
                </header>
            </div>
        </div>
    </div>
</section>
</asp:Content>
