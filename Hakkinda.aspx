<%@ Page Title="" Language="C#" MasterPageFile="~/Kullanici.master" AutoEventWireup="true" CodeFile="Hakkinda.aspx.cs" Inherits="Hakkinda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="format-detection" content="telephone=no" />
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/grid.css">
    <link rel="stylesheet" href="css/style.css">

    <script src="js/jquery.js"></script>
    <script src="js/jquery-migrate-1.2.1.js"></script>
    <script src="js/jquery.stellar.js"></script>
    <script src="js/script.js"></script>
    <script src="js/wow.js"></script>
    <script>
        $(document).ready(function () {
            if ($('html').hasClass('desktop')) {
                new WOW().init();
            }
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--=======content================================-->

    <section id="content">
        <div class="full-width-container block-1">
            <div class="container">
                <div class="row">
                    <div class="grid_12">
                        <header>
                            <h2><span>Hakkımızda</span></h2>
                        </header>
                    </div>
                    <div class="grid_4">
                        <div class="img_container">
                            <img src="images/about_resim.jpg" alt="img">
                        </div>
                    </div>
                    <div class="grid_7 preffix_1">
                        <p>
                            Pak Profil ve Hırdavat 2004 yılında kurulan yaklaşık 10 senelik geçmişi ile Mantolama, Parke ve Seramik sarf malzemelerinde toptan satış için çıkılan yol Ankara Etlik semtinde küçük bir depoda ve küçük bir kamyonetle başlamıştır. Bu serüven Ankara inşaat malzemeleri sitesi olan Ostim Atisan’da devam etmiş, ayın 15 günü Ankara içi kalan 15 günü ise belirlenen rutlar da pazarlamaya çıkan 
                            <br>
                            <br>
                            Cavit Pak ve Uğur Pak yöneticiliğindeki küçük pazarlama firması olarak devam etmiştir. Pak Profil ve Hırdavat şuan da ivoksan’da bulunan 4 katlı büyük bir depo ve fileli köşe imalatı ile Türkiye’nin her yerine ürün gönderen kendi markasını üreten bir firma haline gelmiştir. Ankara’nın ve Karadeniz’in en büyükleri ile ticaret yapan güvenilir bir firma olarak ticareti sürdürmektedir.
                        </p>
                        <a href="#" class="btn">Devam</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="full-width-container block-2 parallax-block" data-stellar-background-ratio="0.5">
            <div class="container">
                <div class="row">
                    <div class="grid_12">
                        <header>
                            <h2><span>Yönetici Kadromuz</span></h2>
                        </header>
                    </div>
                    <div class="grid_3">
                        <article>
                            <div class="img_container">
                                <img src="images/yonetici_cavit_pak.jpg" alt="our team">
                            </div>
                            <h4>Cavit PAK</h4>
                            <p>Şirketimizin Kurucularından ve Pak Profil Yönetim Kurulu Başkanı</p>
                        </article>
                    </div>
                    <div class="grid_3">
                        <article>
                            <div class="img_container">
                                <img src="images/index-1_img-3.jpg" alt="our team">
                            </div>
                            <h4>Serdar PAK</h4>
                            <p>Şirketimizin Kurucularından ve Pak Profil Yönetim Kurulu Başkan Yardımcısı</p>
                        </article>
                    </div>
                    <div class="grid_3">
                        <article>
                            <div class="img_container">
                                <img src="images/yonetici_hasan_kacar.jpg" alt="our team">
                            </div>
                            <h4>Hasan KAÇAR</h4>
                            <p>Yönetim Kurulu Üyesi Şirket Pazarlama Müdürü</p>
                        </article>
                    </div>
                    <div class="grid_3">
                        <article>
                            <div class="img_container">
                                <img src="images/yonetici_enes_pak.jpg" alt="our team">
                            </div>
                            <h4>Enes PAK</h4>
                            <p>Yönetim Kurulu Üyesi Şirket Maliye Müdürü</p>
                        </article>
                    </div>
                </div>
            </div>
        </div>

    </section>
</asp:Content>

