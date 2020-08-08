<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="LeaveApply.aspx.cs" Inherits="final.LeaveApply" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="two" class="wrapper style2">
        <div class="inner">
            <div class="box">
                <div class="content">
                    <header class="align-center">
                        <p>Apply</p>
                        <h2>Leave</h2>
                    </header>
   <form>
       <table>
            <tr>
                <td><asp:Label ID="Label1" runat="server" Text="Student Id:"></asp:Label></td>
                <td><asp:TextBox ID="txtSid" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label2" runat="server" Text="From:"></asp:Label></td>
                <td><asp:Calendar ID="calFrom" runat="server" BackColor="White" BorderColor="Black" 
                        DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" 
                        ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" 
                        Width="400px">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" 
                        ForeColor="#333333" Height="10pt" />
                    <DayStyle Width="14%" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" 
                        Font-Size="8pt" ForeColor="#333333" Width="1%" />
                    <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" 
                        ForeColor="White" Height="14pt" />
                    <TodayDayStyle BackColor="#CCCC99" />
                    </asp:Calendar></td>
                    <td><asp:TextBox ID="fromTime" runat="server" TextMode="Time"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label3" runat="server" Text="To:"></asp:Label></td>
                <td><asp:Calendar ID="calTo" runat="server" BackColor="White" BorderColor="Black" 
                        DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" 
                        ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" 
                        Width="400px">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" 
                        ForeColor="#333333" Height="10pt" />
                    <DayStyle Width="14%" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" 
                        Font-Size="8pt" ForeColor="#333333" Width="1%" />
                    <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" 
                        ForeColor="White" Height="14pt" />
                    <TodayDayStyle BackColor="#CCCC99" />
                    </asp:Calendar></td>
                    <td><asp:TextBox ID="toTime" runat="server" TextMode="Time"></asp:TextBox></td>
 
            </tr>
            <tr>
                <td><asp:Label ID="Label4" runat="server" Text="Reason:"></asp:Label></td>
                <td><asp:TextBox ID="txtReason" runat="server" TextMode="MultiLine" Height="100px" Width="400px"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Button ID="Button1" runat="server" Text="Apply" onclick="Button1_Click" /></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lblMsg" runat="server" Text=""></asp:Label></td>
            </tr>
        </table>
    </form>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
