<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="final.Location" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section id="One" class="wrapper style3">
    <div class="inner">
        <header class="align-center">
            <p>How to</p>
            <h2>Reach Us</h2>
        </header>
    </div>
</section>
<section id="two" class="wrapper style2">
    <div class="inner" style="width: 47%;">
        <div class="box" align="center" >
            <div class="content">
                <header class="align-center">
                    <p>Our</p>
                    <h2>Address</h2>
                    <section id="two" class="wrapper style2">
                            <div class="inner" style="width: 99%;">
                                <div  >
                                    <p class="icon fa-home"> Address :</p>
                                    <h4>Uka Tarsadia University Maliba Campus,</h4>
                                    <h4>Gopal Vidyanagar, Bardoli-Mahuva Road,</h4>
                                    <h4>Tarsadi - 394 350. Tal: Mahuva Dist: Surat.</h4>
                                    <p></p>
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d931.5492622293548!2d73.00688962918788!3d20.94460049912776!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xe95c432bedcf42d0!2sThe+Frozen+Fire+Photography!5e0!3m2!1sen!2sin!4v1539866911217" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
                                </div>
                            </div>
                    </section>
<!--                    <br />       
                    <div class="inner" style="width: 99%;">
                        <div id="map" style="width:613px; height:613px;background:yellow"></div>
                        <script>
                            function myMap() {
                                var mapOptions =
		                        {
		                            center: new google.maps.LatLng(20.944595, 73.007446),
		                            zoom: 10,
		                            mapTypeId: google.maps.MapTypeId.HYBRID
		                        }
                                var map = new google.maps.Map(document.getElementById("map"), mapOptions);
                            }
                        </script>
                        <script src="https://maps.googleapis.com/maps/api/js?callback=myMap"></script>
                    </div>
-->
                </header>
            </div>
        </div>
    </div>
</section>
<section id="two" class="wrapper style2">
    <div class="inner" style="width: 47%;">
        <div class="box" align="center" >
            <div class="content">
                <header class="align-center">
                    <p>Our</p>
                    <h2>Contact</h2>
                    <section id="two" class="wrapper style2">
                            <div class="inner" style="width: 99%;">
                                <div  >
                                    <p class="icon fa-mobile-phone">Conatct :</p>
                                    <h4>7069236002</h4>
                                        <p class="icon fa-envelope-o">Email :</p>
                                    <h4>16mscit006@gmail.com</h4>                                    
                                </div>
                            </div>
                    </section>
                </header>
            </div>
        </div>
    </div>
</section>
</asp:Content>
