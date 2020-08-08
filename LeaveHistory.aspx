    <%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="LeaveHistory.aspx.cs" Inherits="final.LeaveList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="two" class="wrapper style2">
    <div class="inner" style="width: 80%;">
        <div class="box" align="center" >
            <div class="content">
                <header class="align-center">
                    <p>Leave</p>
                    <h2>History</h2>

                </header>
                                    <asp:GridView ID="gvLeaveHistory" runat="server" 
                    AutoGenerateSelectButton="True" onrowdeleting="gvLeaveHistory_RowDeleting" 
                    onrowupdating="gvLeaveHistory_RowUpdating" >
                        <Columns>

                            <asp:ButtonField ButtonType="Button" CommandName="Update" HeaderText="Update" 
                                ShowHeader="True" Text="Update" ControlStyle-CssClass="button0 button2" />
                            <asp:ButtonField ButtonType="Button" CommandName="Delete" HeaderText="Delete" 
                                ShowHeader="True" Text="Delete" ControlStyle-CssClass="button0 button2" />
                        </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</section>
</asp:Content>
