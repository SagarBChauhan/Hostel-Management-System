<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master"  EnableEventValidation = "false" AutoEventWireup="true" CodeBehind="PayDiposite.aspx.cs" Inherits="final.PayDiposite" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Panel ID="Panel1" runat="server" HorizontalAlign="Right">
<section id="two" class="wrapper style2">
    <div class="inner" style="width: 40%;">
        <div class="box" align="center" >
            <div class="content">
                
                    <asp:Label ID="lblUser" runat="server" Text=""></asp:Label>              
                
                <header class="align-center">                   
                    <p>Payment of</p>
                    <h2>Diposite</h2>
                </header>
                    Bank Name:<asp:DropDownList ID="DropDownList1" runat="server">
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
                    Bank Account No:
                    <asp:TextBox ID="txtBankNo" runat="server" ></asp:TextBox>
                    Payment Amount:
                    <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
                    <asp:Button ID="btnPay" runat="server" Text="Pay" 
                    CssClass="button0 button2" onclick="btnPay_Click" ></asp:Button>
                    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                    <asp:HyperLink ID="hlLogin" NavigateUrl="~/Login.aspx" runat="server">Login As Active Student</asp:HyperLink>
                
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
                <asp:Panel ID="Panel2" runat="server">
                
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
