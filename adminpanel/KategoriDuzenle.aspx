<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/master_admin.master" AutoEventWireup="true" CodeFile="KategoriDuzenle.aspx.cs" Inherits="adminpanel_KategoriDuzenle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="Kul_bilgi">
        <div id="profil_resim">
            <asp:Image Height="150" width="150" ID="imgResim" runat="server" />

        </div>
        <div class="profil_satir">
            <div class="profil_satir1">Resim:</div>
            <div class="profil_satir2">

                <asp:FileUpload ID="fuResim" runat="server" />
            </div>
        </div>
        <div class="temizle"></div>

        <div class="profil_satir">
            <div class="profil_satir1">Kategori Adı:</div>
            <div class="profil_satir2">
                <asp:TextBox ID="txtKategoriAd" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="temizle"></div>
        <asp:Button ID="btnDuzenle" CssClass="btn btn-primary" runat="server" Text="Güncelle" OnClick="btnDuzenle_Click" />
    </div>

</asp:Content>

