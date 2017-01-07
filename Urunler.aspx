<%@ Page Title="" Language="C#" MasterPageFile="~/Kullanici.master" AutoEventWireup="true" CodeFile="Urunler.aspx.cs" Inherits="Urunler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   
        <!--=======content================================-->
        <div class="index-3">
            <section id="content">
                <div class="full-width-container block-1">
                    <div class="container">
                        <div class="row">
                            <div class="grid_12">
                                <header>
                                    <h2><span>Ürünlerimiz</span></h2>
                                </header>
                            </div>
                        </div>
                        <div class="row">

                            <div class="grid_8">

                                <asp:repeater id="rpUrunler" runat="server">
                                <ItemTemplate>
                                    <article class="clearfix">
                                        <div class="grid_4 alpha">
                                            <div class="img_container">
                                               <a href="UrunAyrinti.aspx?UrunId=<%#Eval("UrunId") %>"> <img  src="../adminpanel/UrunResimleri/200/<%#Eval("UrunResim") %>" alt="img"></a>
                                            </div>
                                        </div>
                                        <div class="grid_4">
                                            
                                            <h5 style="font-weight:bold; color:#ff6a00"><a href="#"><%#Eval("UrunBaslik") %></a></h5>
                                            
                                             <div style="font-weight:bold; font-size:18px; color:#808080;">Fiyat:<label style="color:#4db8ff; font-weight:bold; "> <%#Eval("UrunFiyat") %> &nbsp; <%#Eval("FiyatTur") %></label></div>
                                            
                                             
                                            <div style="font-weight:bold; font-size:18px; color:#808080;">Adet:<label style="color:#4db8ff; font-weight:bold; "> <%#Eval("UrunAdet") %></label></div>
                                          
                                           <div style="font-weight:bold; font-size:10px; text-align:left; color:#808080;">Tarih:<label style="color:#808080; font-weight:bold; "> <%#Eval("UrunTarih","{0:d}" ) %></label></div>

                                            
                                               
                                        </div>
                                        
                                    </article>
                                   

                                </ItemTemplate>
                            </asp:repeater>
                                <asp:panel id="pnlUrunler" runat="server">

                                </asp:panel>
                            </div>

                        </div>
                    </div>
                </div>


            </section>
        </div>
    
</asp:Content>

