<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="AddComplain.aspx.cs" Inherits="final.AddComplain" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<section id="two" class="wrapper style2">
    <div class="inner" style="width: 40%;">
        <div class="box" align="center" >
            <div class="content">
                <header class="align-center">
                    <p>Add</p>
                    <h2>Complain</h2>
                </header>
                <asp:Panel ID="Add" runat="server">
                    Complain:
                    <asp:TextBox ID="txtComplain" runat="server" TextMode="MultiLine"></asp:TextBox>
                    <asp:Button ID="btnAddComplain" runat="server" Text="Add Complain" 
                        CssClass="button0 button2" onclick="btnAddComplain_Click"></asp:Button>
                </asp:Panel>
                <asp:Panel ID="Success" runat="server">
                    Complain Registered Successfully 
                    Please Wait for response
                </asp:Panel>
            </div>
        </div>
    </div>
</section>
</asp:Content>
