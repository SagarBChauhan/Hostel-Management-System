<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="final.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Panel ID="Menu" runat="server">
<section id="two" class="wrapper style2">
    <div class="inner" style="width: 70%;">
        <div class="box" align="center" >
            <div class="content">
                <header class="align-center">
                    <p>Report</p>
                    <h2>Menu</h2>
                </header>
                <asp:Button ID="btnFeeReport" CssClass="button0 button2" runat="server" 
                    Text="Fee Report" onclick="btnFeeReport_Click"/>
                <asp:Button ID="btnAllocationReport" CssClass="button0 button2" runat="server" 
                    Text="Allocation Report" onclick="btnAllocationReport_Click"/>
                <asp:Button ID="btnLeaveReport" CssClass="button0 button2" runat="server" 
                    Text="Leave Report" onclick="btnLeaveReport_Click"/>
                <asp:Button ID="btnComplainReport" CssClass="button0 button2" runat="server" 
                    Text="Complain Report" onclick="btnComplainReport_Click"/>
            </div>
        </div>
    </div>
</section>
</asp:Panel>
<asp:Panel ID="Report" runat="server">
<section id="two" class="wrapper style2">
    <div class="inner" style="width: 90%;">
        <div class="box" align="center" >
            <div class="content">
                <asp:Button ID="btnPrint" runat="server" CssClass="button0 button2" 
                    Text="Print" onclick="btnPrint_Click"></asp:Button>
                <asp:Panel ID="Panel2" runat="server">
                <br />
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
                                <asp:Label ID="lblReportTitle" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="align-left">
                                Report Generation Date:<asp:Label ID="lblDate" runat="server" Text=""></asp:Label> <br/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                 <asp:Label ID="lblDataTitle" runat="server" Text=""></asp:Label>
                                 <asp:GridView ID="gvReport" runat="server"></asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td class="align-left">
                                Total<asp:Label ID="lblTotal" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                ---
                            </td>
                        </tr>
                        <tr>
                            <td>
                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>This is a computer genrated reciept and does not required signature and stamp.<br/>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>
        </div>
    </div>
</section>
</asp:Panel>
</asp:Content>
