<%@ Page Title="" Language="C#" MasterPageFile="~/Kullanici.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <section id="content">
        <div class="full-width-container block-1">
            <div class="camera_container">
                <div id="camera_wrap">
                    <div class="item" data-src="images/index_img_slider-1.jpg">
                        <div class="camera_caption fadeIn">
                            <h3>We'll Give Your Business Fresh Ideas</h3>
                            <p>Bizimle iletişime Geçin</p>
                            <a href="#" class="btn bd-ra"><span class="fa fa-envelope-o"></span></a>
                            <a href="#" class="btn bd-ra"><span class="fa fa-phone"></span></a>
                            <a href="#" class="btn bd-ra"><span class="fa fa-map-marker"></span></a>
                        </div>
                    </div>
                    <div class="item" data-src="images/index_img_slider-2.jpg">
                        <div class="camera_caption fadeIn">
                            <h3>We'll Make You Noticeable</h3>
                            <p>Bizimle iletişime Geçin</p>
                            <a href="#" class="btn bd-ra"><span class="fa fa-envelope-o"></span></a>
                            <a href="#" class="btn bd-ra"><span class="fa fa-phone"></span></a>
                            <a href="#" class="btn bd-ra"><span class="fa fa-map-marker"></span></a>
                        </div>


                    </div>

                    <div class="item" data-src="images/index_img_slider-2.jpg">
                        <div class="camera_caption fadeIn">
                            <h3>We'll Make You Noticeable</h3>
                            <p>Bizimle iletişime Geçin</p>
                            <a href="#" class="btn bd-ra"><span class="fa fa-envelope-o"></span></a>
                            <a href="#" class="btn bd-ra"><span class="fa fa-phone"></span></a>
                            <a href="#" class="btn bd-ra"><span class="fa fa-map-marker"></span></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="full-width-container block-2">
                <div class="container">
                    <div class="row">
                        <div class="grid_12">
                            <header>
                                <h2><span>Welcome to Our Agency</span></h2>
                            </header>
                            <h4><a href="#">Nullam Concester Tur Nerto</a></h4>
                            <p>
                                Gamus at magna non nunc tristique rhoncuseri tym. Aliquam nibh ante, egestas id dictum aterert commodo re luctus libero. Praesent faucibus malesuada cibuste. Donec laoreet metus id laoreet malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam consectetur orci sed rabitur vel lorem sit amet nulla ullamcorper fermentum.
                                <br>
                                <br>
                                In vitae varius augue, eu consectetur ligula. Etiam dui eros, laoreet sit amet est vel, commodo venenatis eros. Donec laoreet metus id laoreet malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                            </p>
                            <a href="#" class="btn">more</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="full-width-container block-3 parallax-block" data-stellar-background-ratio="0.5">
                <div class="container">
                    <div class="row">
                        <div class="grid_12">
                            <header>
                                <h2><span>Kategoriler</span></h2>
                            </header>
                        </div>
                        <asp:repeater id="rpKategori" runat="server">
                            <ItemTemplate>
                                <div class="grid_4">
                                    <div class="element">
                                        <h3><a href="#"><%#Eval("KategoriAd") %></a></h3>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:repeater>

                    </div>
                </div>
            </div>
            <div class="full-width-container block-4">
                <div class="container">
                    <div class="row">
                        <div class="grid_12">
                            <header>
                                <h2><span>En Çok Satılan Ürünler</span></h2>
                            </header>
                        </div>
                    </div>
                    <div class="row">
                        <div id="owl-carousel" class="owl-carousel">
                            <asp:repeater id="rpEnCokUrunler" runat="server">
                                <ItemTemplate>
                                    <div class="grid_4">
                                        <div class="">
                                            <div class="img_container">
                                                <img height="300" width="300" src="../adminpanel/UrunResimleri/200/<%#Eval("UrunResim") %>" alt="img">
                                            </div>
                                            <div class="owl-text"><%#Eval("UrunBaslik") %></div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:repeater>


                        </div>


                    </div>
                </div>
                <div style="width: auto; height: 150px;">
                </div>

                <div class="container">
                    <div class="row">
                        <div class="grid_12">
                            <header>
                                <h2><span>En Son Eklenen  Ürünler</span></h2>
                            </header>
                        </div>
                    </div>
                    <div class="row">
                        <div id="owl-carousel" class="owl-carousel">
                            <asp:repeater id="rpSonEklenenUrunler" runat="server">
                                <ItemTemplate>
                                    <div class="grid_4">
                                        <div class="">
                                            <div class="img_container">
                                                <img height="300" width="300" src="../adminpanel/UrunResimleri/200/<%#Eval("UrunResim") %>" alt="img">
                                            </div>
                                            <div class="owl-text"><%#Eval("UrunBaslik") %></div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:repeater>


                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="full-width-container block-5">
            <div class="container">
                <div class="row">
                    <div class="grid_12">
                        <header>
                            <h2><span>Duyurular</span></h2>
                        </header>
                    </div>

                    <asp:repeater id="rpDuyurular" runat="server">
                        <ItemTemplate>
                   
                        <div class="grid_4">
                            <article>
                                <h3 style="color:#d94d3a;"><a href="#"><%#Eval("DuyuruBaslik") %></a></h3>
                                <p><%#Eval("DuyuruIcerik") %></p>
                                <div style="font-size:12px; text-align:center; color:#d94d3a;"><%#Eval("DuyuruTarih", "{0:d}") %></div>
                                

                            </article>
                            
                        </div>
                           </ItemTemplate>
                       </asp:repeater>


                </div>
            </div>
        </div>
    </section>
</asp:Content>

