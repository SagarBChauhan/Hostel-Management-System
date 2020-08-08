<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="payFees.aspx.cs" Inherits="final.payFees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:Panel ID="Payment" runat="server">
<section id="two" class="wrapper style2">
    <div class="inner" style="width: 40%;">
        <div class="box" align="center" >
            <div class="content">
                <header class="align-center">    
                    <p>Fees</p>
                    <h2>Payment</h2>
                </header>
                <table>
                    <tr>
                        <td>Total Amount:</td>
                        <td><asp:Label ID="lblAmt" runat="server" Text=""></asp:Label></td>
                    </tr>        
                    <tr>
                        <td>Bank Name:</td>
                        <td>                    
                            <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>Alahabad Bank</asp:ListItem>
                            <asp:ListItem Value="Bank Of Baroda">Bank Of Baroda</asp:ListItem>
                            <asp:ListItem>Bank Of India</asp:ListItem>
                            <asp:ListItem>Canera Bank</asp:ListItem>
                            <asp:ListItem>Centrel Bank Of India</asp:ListItem>
                            <asp:ListItem>ICICI Bank</asp:ListItem>
                            <asp:ListItem>Satate Bank Of India</asp:ListItem>
                            <asp:ListItem>Uco Bank</asp:ListItem>
                            <asp:ListItem>Union Bank</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>Bank Ac Number:</td>
                        <td><asp:TextBox ID="txtACNumber" runat="server" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                ControlToValidate="txtACNumber" ErrorMessage="Enter AC No" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtACNumber" ErrorMessage="Please Enter Only Numbers" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">Payed to Bank: <asp:Label ID="lblAdBankName" runat="server" Text="Label"></asp:Label> </td>
                    </tr>
                    <tr>
                        <td colspan="2">Bank AC No: <asp:Label ID="lblAdBankNo" runat="server" Text="Label"/></td>
                    </tr>
                </table>
                <asp:Button ID="btnPay" CssClass="button0 button2" runat="server" Text="Pay" 
                    onclick="btnPay_Click" />               
            </div>
        </div>
    </div>
</section>
</asp:Panel>
<asp:Panel ID="Success" runat="server">
<section id="two" class="wrapper style2">
    <div class="inner" style="width: 40%;">
        <div class="box" align="center" >
            <div class="content">
                <header class="align-center">
                    <p>Payment</p>
                    <h2>Success</h2>
                </header>
                <h3 style="color: #00FF00">Paymet Successfull</h3>
                <asp:Button ID="btnRecipt" CssClass="button0 button2" runat="server" 
                    Text="Recipt" onclick="btnRecipt_Click"></asp:Button>
            </div>
        </div>
    </div>
</section>
</asp:Panel>
<asp:Panel ID="PrintRecipt" runat="server">
<section id="two" class="wrapper style2">
    <div class="inner" style="width: 90%;">
        <div class="box" align="center" >
            <div class="content">
                <header class="align-center">
                    <p>Print</p>
                    <h2>Recipt</h2>
                    Fee Status: Paid
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
</asp:Panel>
</asp:Content>
