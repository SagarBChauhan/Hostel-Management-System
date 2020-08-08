<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="PdfGenerator.aspx.cs" Inherits="final.PdfGenerator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<section id="two" class="wrapper style2">
    <div class="inner" style="width: 50%;">
        <div class="box" align="center" >
            <div class="content">
                <header class="align-center">
                    <p>small Heading</p>
                    <h2>Big Heading</h2>
                </header>
                <asp:Label ID="Label1" runat="server" Text="Perfect Hostel" Font-Bold="True" Font-Size="XX-Large"></asp:Label>               
                <br />
                Payment Number:<asp:Label ID="lblPaymentId" runat="server" Text=""></asp:Label> 
                <asp:Button ID="btnPrint" runat="server" CssClass="button0 button2" 
                    Text="Print" onclick="btnPrint_Click"></asp:Button>
                <asp:Panel ID="Panel1" runat="server">
                
                    <table class="style1" border="1">
                        <tr align="center">
                            <td>
                                <asp:Label ID="Label2" runat="server" Font-Bold="True" 
                                    Text="Perfect Hostel" Font-Size="20pt"></asp:Label>
                                <br />
                                PerfectHostel.in@gmail.com 
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                                Student Copy
                            </td>
                        </tr>
                        <tr>
                            <td class="align-left">
                                Payment Number:<asp:Label ID="lblPymentid2" runat="server" Text=""></asp:Label> 
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                Payment Date:<asp:Label ID="lblDate" runat="server" Text=""></asp:Label> <br/>
                                Student Name:<asp:Label ID="lblName" runat="server" Text=""></asp:Label><br/>
                                Department:<asp:Label ID="lblDepartment" runat="server" Text=""></asp:Label><br />
                                Duration:<asp:Label ID="lblDuration" runat="server" Text=""></asp:Label><br/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server"></asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td class="align-left">
                                Total:<asp:Label ID="lblTotal" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Payment Deatils(Cheques are Subject to Realisation)
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table class="style1" border="1">
                                    <tr>
                                        <th>
                                            Mode
                                        </th>
                                        <th>
                                            CH./DD No.
                                        </th>
                                        <th>
                                            Bank Name/Ref. No
                                        </th>
                                        <th>
                                            Bank AC No
                                        </th>
                                    </tr>
                                    <tr>
                                        <td>
                                            Online
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblBankName" runat="server" Text=""></asp:Label><br/>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblBankNO" runat="server" Text=""></asp:Label><br/>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Any disputes Subject to Navsari, Dist. Navsari Jurisdiction<br/>
                                Any refund of fees subject to Perfect Hostel rules and regulations.<br/>
                                At the time of deposit refund, submit original deposit receipt.<br/>
                                <b>This is a computer genrated reciept and does not required signature and stamp.<br/>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>
        </div>
    </div>
</section>

</asp:Content>
