<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="RoomAllocation.aspx.cs" Inherits="final.RoomAllocation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<section id="two" class="wrapper style2">
    <div class="inner" style="width: 80%;">
        <div class="box" align="center" >
            <div class="content">
                <header class="align-center">
                    <p>Room</p>
                    <h2>Allocation</h2>
    <asp:Panel ID="Panel2" runat="server" >
        <br/>
        <br/>
        <br/>        
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
    </asp:Panel>
    </div>
    </div>
    </div>
    </section>
</asp:Content>
