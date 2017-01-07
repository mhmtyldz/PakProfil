<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/master_admin.master" AutoEventWireup="true" CodeFile="DuyuruEkle.aspx.cs" Inherits="adminpanel_Duyurular" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
       <style type="text/css">
        .auto-style1 {
            width: 80%;
        }
        .auto-style2 {
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="font-size: 16px; font-family: 'Trebuchet MS'; font-weight: bold; width: 500px; height: 30px; background-color: #0099cc; margin-bottom: 10px; color: #fff;">Duyuru Ekleme Paneli</div>
    <asp:Button ID="DuyuruEkleGoster" class="btn btn-primary" Style="font-size: 25px; margin-bottom: 10px;" runat="server" Text="+" Width="75px" OnClick="DuyuruGoster_Click" />

    <asp:Button ID="DuyuruEkleGizle" class="btn btn-danger" Style="margin-left: 15px; margin-bottom: 10px; font-size: 25px;" runat="server" Text="-" Width="75px" OnClick="DuyuruEkleGizle_Click" />

    <asp:Panel ID="pnlDuyuruEkle" Visible="false" runat="server">
        <table class="auto-style1">
            <tr>
                <td style="font-family: 'Trebuchet MS'; font-size: 14px; font-weight: bold; color: #FFFFFF; background-color: #0099CC; text-align: left;" class="auto-style2" colspan="2">
                    <asp:Label ID="lblBilgi" runat="server" ForeColor="#990000"></asp:Label></td>
            </tr>
            <tr>
                <td style="font-family: 'Trebuchet MS'; font-size: 14px; font-weight: bold; color: #FFFFFF; background-color: #0099CC; width: 20%; text-align: left; height: 30px;">Duyuru Başlık:</td>
                <td style="width: 60%; height: 30px">
                    <asp:TextBox class="form-control" ID="txtDuyuruBaslik" runat="server" Height="34px" Width="379px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="font-family: 'Trebuchet MS'; font-size: 14px; font-weight: bold; color: #FFFFFF; background-color: #0099CC; width: 20%; text-align: left; height: 30px;">Duyuru İçerik:</td>
                <td style="width: 60%; height: 30px">
                    <asp:TextBox class="form-control" ID="txtDuyuruIcerik" runat="server" Height="130px" Width="378px" TextMode="MultiLine"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="height: 5px;">&nbsp;</td>
                <td style="height: 5px">
                    <asp:Button runat="server" class="btn btn-info" Text="Ekle" ID="btnDuyuruEkle" OnClick="btnDuyuruEkle_Click" /></td>
            </tr>
            <tr>
                <td style="width: 60%; height: 40px">&nbsp;</td>
            </tr>

        </table>
    </asp:Panel>





    <div style="font-size: 16px; font-family: 'Trebuchet MS'; font-weight: bold; width: 500px; height: 30px; background-color: #0099cc; margin-bottom: 10px; color: #fff;">Duyuruları Göster Paneli</div>
    <asp:Button ID="btnDuyuruGoster" class="btn btn-primary" Style="font-size: 25px; margin-bottom: 10px;" runat="server" Text="+" Width="75px" OnClick="btnDuyuruGoster_Click"  />

    <asp:Button ID="btnDuyuruGizle" class="btn btn-danger" Style="margin-left: 15px; margin-bottom: 10px; font-size: 25px;" runat="server" Text="-" Width="75px" OnClick="btnDuyuruGizle_Click" />
    <asp:Panel ID="pnlDuyuruGoster" Visible="false" runat="server">
        <asp:DataList ID="dlDuyuruGoster" runat="server" CellPadding="4" ForeColor="#333333" Width="740px">

            <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderTemplate>
                <table class="auto-style1">
                    <tr>
                        
                        <td style="width: 40%">Duyuru Başlık</td>
                        <td style="width: 30%">Duyuru Tarih</td>
                        <td class="auto-style2" style="width: 10%">Sil</td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <ItemTemplate>
                <table class="auto-style1">
                    <tr>
                       
                        <td style="width: 40%"><%#Eval("DuyuruBaslik") %></td>
                        <td style="width: 30%"><%#Eval("DuyuruTarih") %></td>
                        
                            
                        <td class="auto-style2" style="width: 12%">
                            <a href="DuyuruEkle.aspx?DuyuruId=<%#Eval("DuyuruId")%>&islem=sil">
                                <img src="images/iconlar/kul_sil.png" /></a>

                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />

        </asp:DataList>

    </asp:Panel>



</asp:Content>

