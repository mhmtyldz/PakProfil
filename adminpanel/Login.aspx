<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="adminpanel_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Giriş Sayfası</title>

    <link href="css/style.css" rel="stylesheet" />
    <script src="js/prefixfree.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="body"></div>
        <div class="grad"></div>
        <div class="header">
            <div>PAK <span>PROFİL</span></div>
        </div>
        <br>
        <div class="login">
            <asp:TextBox ID="txtKullaniciAdi" placeholder="Kullanıcı Adı" runat="server" />
            <br>
            <asp:TextBox ID="txtSifre" placeholder="Şifre" runat="server" TextMode="Password" />
            <br>
            <asp:Button ID="btnGiris" CssClass="button" Text="Giriş" runat="server" OnClick="btnGiris_Click" />

            
            







        </div>

        <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>
    </form>
</body>
</html>
