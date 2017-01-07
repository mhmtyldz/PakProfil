<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/master_admin.master" AutoEventWireup="true" CodeFile="UrunEkle.aspx.cs" Inherits="adminpanel_UrunEkle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


    <style type="text/css">
        .auto-style1 {
            width: 100%;
            font-size: 14px;
            font-weight: bold;
            font-family: "Trebuchet MS", "Lucida Sans Unicode", "Lucida Grande", "Lucida Sans", Arial, sans-serif";
        }

        .auto-style2 {
            font-family: "Trebuchet MS";
            font-weight: bold;
            color: #FFFFFF;
        }

        .auto-style3 {
            height: 35px;
        }

        .auto-style4 {
            display: block;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            border: 1px solid #ccc;
            padding: 6px 12px;
            background-color: #fff;
            background-image: none;
        }

        .auto-style5 {
            color: white;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="font-size: 16px; font-family: 'Trebuchet MS'; font-weight: bold; width: 500px; height: 30px; background-color: #0099cc; margin-bottom: 10px; color: #fff;">Ürün Ekleme Paneli</div>
    <asp:Button ID="UrunEkleGoster" class="btn btn-primary" Style="font-size: 25px; margin-bottom: 10px;" runat="server" Text="+" Width="75px" OnClick="UrunEkleGoster_Click" />

    <asp:Button ID="UrunEkleGizle" class="btn btn-danger" Style="margin-left: 15px; margin-bottom: 10px; font-size: 25px;" runat="server" Text="-" Width="75px" OnClick="UrunEkleGizle_Click" />
    <asp:Panel ID="pnlUrunEkle" Visible="false" runat="server">
        <table class="auto-style1">

            <tr>
                <td class="auto-style3" colspan="3" style="background-color: #0099CC; font-size: 14px; font-family: 'Trebuchet MS'; font-weight: bold; color: #fff; text-align: right;">
                    <asp:Label ID="lblBilgi" runat="server"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            </tr>
            <tr>
                <td style="width: 20%; background-color: #0099CC; font-size: 14px; font-family: 'Trebuchet MS'; font-weight: bold; color: #fff; height: 35px; text-align: right;">Kategori:</td>
                <td style="width: 35%">
                    <asp:DropDownList ID="ddlKategori" CssClass="btn btn-default dropdown-toggle" runat="server" Width="133px">
                    </asp:DropDownList>
                </td>
                <td style="width: 30%">
                    <asp:Label ID="lblBilgiK" runat="server" Font-Bold="True" Font-Size="12pt" ForeColor="Maroon"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 20%; background-color: #0099CC; font-size: 14px; font-family: 'Trebuchet MS'; font-weight: bold; color: #fff; height: 35px; text-align: right;">Ürün Başlık:</td>
                <td style="width: 35%">
                    <asp:TextBox ID="txtUrunBaslik" CssClass="form-control" placeholder="Ürün Başlığı Giriniz" runat="server"></asp:TextBox>
                </td>
                <td style="width: 30%">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 20%; background-color: #0099CC; font-size: 14px; font-family: 'Trebuchet MS'; font-weight: bold; color: #fff; height: 35px; text-align: right;">Ürün Resim:</td>
                <td style="width: 35%">
                    <asp:FileUpload ID="fuUrunResim" runat="server" Height="22px" Width="348px" />
                </td>
                <td style="width: 30%">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 20%; background-color: #0099CC; font-size: 14px; font-family: 'Trebuchet MS'; font-weight: bold; color: #fff; height: 35px; text-align: right;">Ürün Fiyat:</td>
                <td style="width: 35%">
                    <asp:TextBox ID="txtUrunFiyat" CssClass="form-control" placeholder="Fiyat Giriniz" runat="server"></asp:TextBox>
                </td>
                <td style="width: 30%">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 20%; background-color: #0099CC; font-size: 14px; font-family: 'Trebuchet MS'; font-weight: bold; color: #fff; height: 35px; text-align: right;">Ürün Fiyat Tür:</td>
                <td style="width: 35%">
                    <asp:DropDownList ID="ddlFiyatTur" CssClass="btn btn-default dropdown-toggle" runat="server" Width="133px">
                    </asp:DropDownList>
                </td>
                <td style="width: 30%">
                    <asp:Label ID="lblBilgiF" runat="server" Font-Bold="True" Font-Size="12pt" ForeColor="Maroon"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 20%; background-color: #0099CC; font-size: 14px; font-family: 'Trebuchet MS'; font-weight: bold; color: #fff; height: 35px; text-align: right;">Adet:</td>
                <td style="width: 35%">
                    <asp:TextBox ID="txtUrunAdet" CssClass="form-control" placeholder="Adet Giriniz" runat="server"></asp:TextBox>
                </td>
                <td style="width: 30%">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" style="width: 20%; background-color: #0099CC; font-size: 14px; font-family: 'Trebuchet MS'; font-weight: bold; color: #fff; height: 35px; text-align: right;">Ürün Özellik:</td>
                <td style="width: 35%">
                    <asp:TextBox ID="txtUrunOzellik" CssClass="auto-style4" placeholder="Özellik Giriniz" runat="server" Height="140px" TextMode="MultiLine" Width="353px"></asp:TextBox>
                </td>
                <td style="width: 30%">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 20%; background-color: #0099CC; font-size: 14px; font-family: 'Trebuchet MS'; font-weight: bold; color: #fff; height: 35px; text-align: right;">&nbsp;</td>
                <td style="width: 35%">
                    <asp:Button ID="btnUrunEkle" CssClass="btn btn-primary" runat="server" Text="Kaydet" OnClick="btnUrunEkle_Click" />
                </td>
                <td style="width: 30%">&nbsp;</td>
            </tr>
        </table>
    </asp:Panel>

    <div style="font-size: 16px; font-family: 'Trebuchet MS'; font-weight: bold; width: 500px; height: 30px; background-color: #0099cc; margin-bottom: 10px; color: #fff;">Ürün Gösterme Paneli</div>
    <asp:Button ID="KategoriGoster" class="btn btn-primary" Style="font-size: 25px; margin-bottom: 10px;" runat="server" Text="+" Width="75px" OnClick="KategoriGoster_Click" />

    <asp:Button ID="KategoriGizle" class="btn btn-danger" Style="margin-left: 15px; margin-bottom: 10px; font-size: 25px;" runat="server" Text="-" Width="75px" OnClick="KategoriGizle_Click" />

    <asp:Panel ID="pnlUrunleriGoster" Visible="false" runat="server">
        <table class="auto-style1">
            <tr>
                <td style="width: 20%; font-family: 'Trebuchet MS'; font-size: 14px; font-weight: bold; color: #FFFFFF; background-color: #0066CC; text-align: center;">Ürün Ara </td>
                <td>
                    <asp:TextBox class="form-control" ID="txtAra" PlaceHolder=" Lütfen Ürün Adı Yazınız!" runat="server"></asp:TextBox>
                </td>
                <td style="width: 10%">
                    <asp:Button class="btn btn-danger" ID="btnAra" runat="server" Text="Bul" OnClick="btnAra_Click" />
                </td>
            </tr>
        </table>
        <div style="margin-top: 20px;"></div>
        <asp:DataList ID="dlUrunler" runat="server" CellPadding="4" ForeColor="#333333" Width="746px">

            <AlternatingItemStyle BackColor="White" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderTemplate>
                <table class="auto-style1">
                    <tr>
                        <td style="width: 150px;">Ürün Resim</td>
                        <td style="width: 34%">Ürün Başlık</td>
                        <td style="width: 20%">Ürün Fiyat</td>
                        <td style="width: 10%">Adet</td>
                        <td class="auto-style5" style="width: 10%">Güncelle</td>
                        <td class="auto-style5" style="width: 10%">Sil</td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemStyle BackColor="#E3EAEB" />
            <ItemTemplate>
                <table class="auto-style1">
                    <tr>
                        <td style="width: 150px;"><img width="80" height="80" src="UrunResimleri/200/<%#Eval("UrunResim") %>" /> </td>
                        <td style="width: 34%"><%#Eval("UrunBaslik") %></td>
                        <td style="width: 20%"><%#Eval("UrunFiyat") %> &nbsp; <%#Eval("FiyatTur") %></td>
                        <td style="width: 10%"><%#Eval("UrunAdet") %></td>
                        <td class="auto-style5" style="width: 10%">
                           <a href="UrunGuncelle.aspx?UrunId=<%#Eval("UrunId") %>"> <img src="images/iconlar/kul_duzenle.png" /></a></td>
                        <td class="auto-style5" style="width: 10%">
                           <a href="UrunEkle.aspx?UrunId=<%# Eval("UrunId")%>&islem=sil"> <img src="images/iconlar/kul_sil.png" /></a></td>
                    </tr>
                </table>
            </ItemTemplate>
            <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />

        </asp:DataList>

    </asp:Panel>
</asp:Content>

