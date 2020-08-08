<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="FeeOrder.aspx.cs" Inherits="final.FeeOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Panel ID="Menu" runat="server">
<section id="two" class="wrapper style2">
    <div class="inner" style="width: 40%;">
        <div class="box" align="center" >
            <div class="content">
                <header class="align-center">
                    <p>Fees</p>
                    <h2>Management</h2>
                </header>
                <asp:Button ID="btnFeeOrder" CssClass="button0 button2" runat="server" 
                    Text="Fee Order" onclick="btnFeeOrder_Click" />
                <asp:Button ID="btnPaymentStatus" CssClass="button0 button2" runat="server" 
                    Text="Payment Status" onclick="btnPaymentStatus_Click" />
                <asp:Button ID="btnReport" CssClass="button0 button2" runat="server" 
                    Text="Report" onclick="btnReport_Click" />               
            </div>
        </div>
    </div>
</section>
</asp:Panel>
<asp:Panel ID="Order" runat="server">
<section id="two" class="wrapper style2">
    <div class="inner" style="width: 40%;">
        <div class="box" align="center" >
            <div class="content">
                <header class="align-center">
                    <p>Fees</p>
                    <h2>Order</h2>
                </header>
                <h3>Rent Amount</h3>
                1 Person: <asp:TextBox ID="txtP1Amt" runat="server"></asp:TextBox>
                2 Person: <asp:TextBox ID="txtP2Amt" runat="server"></asp:TextBox>
                3 Person: <asp:TextBox ID="txtP3Amt" runat="server"></asp:TextBox>
                4 Person: <asp:TextBox ID="txtP4Amt" runat="server"></asp:TextBox>
                <h3>Facility Amount</h3>
                Ac Room: <asp:TextBox ID="txtAcAmt" runat="server"></asp:TextBox>
                <h3>Last Date</h3>
                Date: <asp:TextBox ID="txtLastDate" runat="server" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtLastDate" ErrorMessage="Please Select Last Date" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtDuration" runat="server"></asp:TextBox>
                <asp:Button ID="btnOrder" CssClass="button0 button2" runat="server" 
                    Text="Order" onclick="btnOrder_Click" />               
            </div>
        </div>
    </div>
</section>
</asp:Panel>
<asp:Panel ID="Status" runat="server">
<section id="two" class="wrapper style2">
    <div class="inner" style="width: 40%;">
        <div class="box" align="center" >
            <div class="content">
                <header class="align-center">
                    <p>Fees</p>
                    <h2>Status</h2>
                </header>
                <asp:Button ID="Button4" CssClass="button0 button2" runat="server" Text="Fee Order" />
                <asp:Button ID="Button5" CssClass="button0 button2" runat="server" Text="Payment Status" />
                <asp:Button ID="Button6" CssClass="button0 button2" runat="server" Text="Report" />               
            </div>
        </div>
    </div>
</section>
</asp:Panel>
<asp:Panel ID="Report" runat="server">
<section id="two" class="wrapper style2">
    <div class="inner" style="width: 40%;">
        <div class="box" align="center" >
            <div class="content">
                <header class="align-center">
                    <p>Fees</p>
                    <h2>Report</h2>
                </header>
                <asp:Button ID="Button7" CssClass="button0 button2" runat="server" Text="Fee Order" />
                <asp:Button ID="Button8" CssClass="button0 button2" runat="server" Text="Payment Status" />
                <asp:Button ID="Button9" CssClass="button0 button2" runat="server" Text="Report" />               
            </div>
        </div>
    </div>
</section>
</asp:Panel>
</asp:Content>
