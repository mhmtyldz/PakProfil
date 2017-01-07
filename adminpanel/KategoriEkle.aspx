<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/master_admin.master" AutoEventWireup="true" CodeFile="KategoriEkle.aspx.cs" Inherits="adminpanel_KategoriEkle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="font-size: 16px; font-family: 'Trebuchet MS'; font-weight: bold; width: 500px; height: 30px; background-color: #0099cc; margin-bottom: 10px; color: #fff;">Kategori Ekleme Paneli</div>
    <asp:Button ID="KategoriGoster" class="btn btn-primary" Style="font-size: 25px; margin-bottom: 10px;" runat="server" Text="+" Width="75px" OnClick="KategoriGoster_Click" />

    <asp:Button ID="KategoriGizle" class="btn btn-danger" Style="margin-left: 15px; margin-bottom: 10px; font-size: 25px;" runat="server" Text="-" Width="75px" OnClick="KategoriGizle_Click" />

    <asp:Panel ID="pnlKategori" Visible="false" runat="server">
        <table class="auto-style1">
            <tr>
                <td style="font-family: 'Trebuchet MS'; font-size: 14px; font-weight: bold; color: #FFFFFF; background-color: #0099CC; text-align: left;" class="auto-style2" colspan="2">
                    <asp:Label ID="lblBilgi" runat="server" ForeColor="#990000"></asp:Label></td>
            </tr>
            <tr>
                <td style="font-family: 'Trebuchet MS'; font-size: 14px; font-weight: bold; color: #FFFFFF; background-color: #0099CC; width: 20%; text-align: left; height: 30px;">Kategori Adı:</td>
                <td style="width: 60%; height: 30px">
                    <asp:TextBox class="form-control" ID="txtKategoriAd" runat="server" Height="34px" Width="379px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="font-family: 'Trebuchet MS'; font-size: 14px; font-weight: bold; color: #FFFFFF; background-color: #0099CC; width: 20%; text-align: left; height: 30px;">Kategori Resim:</td>
                <td style="width: 60%; height: 30px">
                    <asp:FileUpload ID="fuKategoriResim" runat="server" />
            </tr>
            <tr>
                <td style="height: 5px;">&nbsp;</td>
                <td style="height: 5px">
                    <asp:Button runat="server" class="btn btn-info" Text="Ekle" ID="btnKategoriEkle" OnClick="btnKategoriEkle_Click" /></td>
            </tr>
            <tr>
                <td style="width: 60%; height: 40px">&nbsp;</td>
            </tr>

        </table>
    </asp:Panel>


    <div style="font-size: 16px; font-family: 'Trebuchet MS'; font-weight: bold; width: 500px; height: 30px; background-color: #0099cc; margin-bottom: 10px; color: #fff;">Kategorileri Göster Paneli</div>
    <asp:Button ID="btnKategoriGoster" class="btn btn-primary" Style="font-size: 25px; margin-bottom: 10px;" runat="server" Text="+" Width="75px" OnClick="btnKategoriGoster_Click" />

    <asp:Button ID="btnKategoriGizle" class="btn btn-danger" Style="margin-left: 15px; margin-bottom: 10px; font-size: 25px;" runat="server" Text="-" Width="75px" OnClick="btnKategoriGizle_Click" />
    <asp:Panel ID="pnlKategoriGoster" Visible="false" runat="server">
        <asp:DataList ID="dlKategoriGoster" runat="server" CellPadding="4" ForeColor="#333333" Width="740px">
            
            <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderTemplate>
                <table class="auto-style1">
                    <tr>
                        <td style="width: 25%; height: 50px">Kategori Resmi</td>
                        <td style="width: 50%">Kategori Adı</td>
                        <td style="width: 12.5%">Düzenle</td>
                        <td class="auto-style2" style="width: 12.5%">Sil</td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <ItemTemplate>
                <table class="auto-style1">
                    <tr>
                        <td style="width: 25%; height: 75px">
                            <img width="80" height="80" src="../adminpanel/KategoriResimleri/200/<%#Eval("KategoriResim")%>" />
                        </td>
                        <td style="width: 50%"><%#Eval("KategoriAd") %></td>
                        <td style="width: 12.5%">
                          <a href="KategoriDuzenle.aspx?KategoriId=<%#Eval("KategoriId")%>"><img src="images/iconlar/kul_duzenle.png" /></a></td>
                        <td class="auto-style2" style="width: 12.5%">
                           <a href="KategoriEkle.aspx?KategoriId=<%#Eval("KategoriId")%>&islem=sil">
                               <img src="images/iconlar/kul_sil.png" /></a></td>
                    </tr>
                </table>
            </ItemTemplate>
            <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            
        </asp:DataList>

    </asp:Panel>

</asp:Content>

