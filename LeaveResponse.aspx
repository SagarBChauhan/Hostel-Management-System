<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="LeaveResponse.aspx.cs" Inherits="final.LeaveResponse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<section id="two" class="wrapper style2">
    <div class="inner" style="width: 80%;">
        <div class="box" align="center" >
            <div class="content">
                <header class="align-center">
                    <p>Leave</p>
                    <h2>Requests</h2>
                </header>
                <asp:Panel ID="Panel2" runat="server" >      
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                </asp:Panel>
                <asp:Panel ID="update" runat="server">
                <form>
                <table>
                <tr>
                    <td><asp:Label ID="id" runat="server" Text="Label"></asp:Label>Name :</td>
                    <td><asp:Label ID="lblName" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Reason:</td>
                    <td><asp:Label ID="lblReason" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>From:</td>
                    <td><asp:Label ID="lblFrom" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>To:</td>
                    <td><asp:Label ID="lblTo" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Status:</td>
                    <td><asp:DropDownList ID="ddlSatatus" runat="server">
                        <asp:ListItem>panding</asp:ListItem>
                        <asp:ListItem>Accepted</asp:ListItem>
                        <asp:ListItem>Rejected</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Feedback:</td>
                    <td><asp:TextBox ID="txtFeedback" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Button ID="btnUpdate" runat="server" Text="Update" 
                            onclick="btnUpdate_Click"></asp:Button></td>
                </tr>
                </table>
                </form>
                </asp:Panel>
            </div>
        </div>
    </div>
</section>
</asp:Content>
