<%@ Page Title="" Language="C#" MasterPageFile="~/Kullanici.master" AutoEventWireup="true" CodeFile="iletisim.aspx.cs" Inherits="iletisim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .contact {
            padding: 25px 0 450px 0;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }

            .contact i {
                padding: 0 20px;
                font-size: 0.8em;
            }

            .contact h2 {
                font-family: 'Open Sans', sans-serif;
                font-size: 2.5em;
                border: 1px solid #555;
                background-color: rgba(0,0,0,0.6);
                padding-top: 20px;
                height: 75px;
                color: #fff;
                font-weight: 500;
                line-height: 40px;
                padding-left: 50px;
                text-align: center;
            }

        #comments {
            margin-top: 0;
        }

        #contactform {
            height: 215px;
        }

            #contactform .right {
                float: right;
            }

            #contactform input,
            #contactform textarea {
                margin-bottom: 14px;
                width: 100%;
                outline: none;
                border: none;
                text-transform: uppercase;
                letter-spacing: 2px;
                font-size: 11px;
            }

            #contactform input {
                padding-left: 15px;
                height: 44px;
                border-radius: 0;
            }

            #contactform textarea {
                padding: 15px;
                height: 218px;
                border-radius: 0;
            }

            #contactform .btn {
                width: 100%;
                height: 50px;
                border-radius: 0;
                border: 1px solid #333;
                background: rgba(0,0,0,0.8);
                color: #fff;
            }

                #contactform .btn:hover {
                    background: rgba(9,8,77,0.7);
                }

        #map-canvas {
            width: 100%;
            height: 350px;
            margin-bottom: 15px;
            border: 2px solid #fff;
        }
    </style>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="contact" id="contact">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>Pak Profil ile iletişime Geçmek için Aşağıdaki Formu doldurun<i class="fa fa-paper-plane-o"></i></h2>
                </div>
            </div>
            <div id="map-canvas"></div>
            <div class="row">
                <form method="post" runat="server" id="contactform">
                    <div class="col-md-6">
                        <fieldset>

                            <asp:TextBox ID="txtAdSoyad" placeholder="Adınız Soyadınız" runat="server"></asp:TextBox>
                            <br>
                            <asp:TextBox ID="txtEmail" placeholder="Email Adresiniz" runat="server"></asp:TextBox>
                            <br>
                             <asp:TextBox ID="txtTel" placeholder="Telefon Numaranız" runat="server"></asp:TextBox>
                            <br>
                             <asp:TextBox ID="txtGuvenlik" placeholder="Robot olmadığınızı Kanıtlayın... 2+2=?" runat="server"></asp:TextBox>
                            
                            <br>
                        </fieldset>
                    </div>
                    <div class="col-md-6">
                        <fieldset>
                           
                            <asp:TextBox ID="txtMesaj" cols="40" Rows="20" placeholder="Mesajınız" runat="server"></asp:TextBox>
                        </fieldset>
                    </div>
                    <div class="col-md-12">
                        <fieldset>
                            <asp:Button ID="btnGonder" CssClass="btn btn-lg" runat="server" Text="Mesaj Gönder" />
                            
                        </fieldset>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!--Google Maps API-->
    <script src="http://maps.google.com/maps/api/js?key=AIzaSyDlJiulyr0Z1DnUm_KbLnlvr1wunUQTv7w&callback=initMap"></script>

    <script type="text/javascript">
        jQuery(function ($) {
            function init_map1() {
                var myLocation = new google.maps.LatLng(39.989551, 32.732853);
                var mapOptions = {
                    center: myLocation,
                    zoom: 16
                };
                var marker = new google.maps.Marker({
                    position: myLocation,
                    title: "Property Location"
                });
                var map = new google.maps.Map(document.getElementById("map-canvas"),
                    mapOptions);
                marker.setMap(map);
            }
            init_map1();
        });


</script>



</asp:Content>

