<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="ViewComplain.aspx.cs" Inherits="final.ViewComplain" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<section id="two" class="wrapper style2">
    <div class="inner" style="width: 40%;">
        <div class="box" align="center" >
            <div class="content">
                <header class="align-center">
                    <p>complain</p>
                    <h2>History</h2>
                </header>
                <asp:GridView ID="gvComplain" runat="server"></asp:GridView>
            </div>
        </div>
    </div>
</section>
</asp:Content>
