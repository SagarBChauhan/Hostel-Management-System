<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Exp.aspx.cs" Inherits="final.Exp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<br />
<br />
<br />
<br />
<br />
   <div>

       Password Length: &nbsp;&nbsp; <asp:TextBox ID="txtPassLength" runat="server"></asp:TextBox>

        <br />

        Random Password: <asp:TextBox ID="txtpassword" runat="server"></asp:TextBox>

        <br />

        <br />

        <asp:Button ID="Button1" runat="server" onclick="Button1_Click"

            Text="Generate Password" />

        <br />

    </div>


</asp:Content>
