<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Book.aspx.cs" Inherits="final.Book" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<section id="two" class="wrapper style2">
    <div class="inner" style="width: 40%;">
        <div class="box" align="center" >
            <div class="content">
                <header class="align-center">
                    <p>Book</p>
                    <h2>Room</h2>
                </header>
                <asp:Panel ID="Booking" runat="server">
                    Number of Bed : 
                    <asp:DropDownList ID="dlNoOfBed" runat="server"  AutoPostBack="true" 
                    onselectedindexchanged="dlNoOfBed_SelectedIndexChanged">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                    </asp:DropDownList>
                    Room Type : <asp:DropDownList ID="dlRoomType" runat="server" AutoPostBack="true" onselectedindexchanged="dlRoomType_SelectedIndexChanged" ></asp:DropDownList>
                    Room Name : <asp:DropDownList ID="dlRoomName" runat="server" ></asp:DropDownList>
                    <asp:Button ID="btnBook" runat="server" Text="Book" 
                    CssClass="button0 button2" onclick="btnBook_Click"></asp:Button><br/>
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </asp:Panel>
                <asp:Panel ID="success" runat="server">
                    <h2>You Have booked room  successfully</h2>
                    Name : <asp:Label ID="lblName" runat="server" Text=""/><br />
                    Room Number : <asp:Label ID="lblRoomNo" runat="server" Text=""/><br />
                    Room Type : <asp:Label ID="lblType" runat="server" Text=""/><br />
                    Room Type (No Of Beds) : <asp:Label ID="lblNoOfBed" runat="server" Text=""/><br />
                    Availabe Beds : <asp:Label ID="lblAvailBed" runat="server" Text=""/><br /><br/>
                    <header class="align-center">
                        <p>Room</p>
                        <h2>Members</h2>
                    </header>
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                </asp:Panel>
                
            </div>
        </div>
    </div>
</section>
</asp:Content>
