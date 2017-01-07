<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/master_admin.master" AutoEventWireup="true" CodeFile="AdminYonetimi.aspx.cs" Inherits="adminpanel_AdminYonetimi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .auto-style1 {
            width: 70%;
        }
        .auto-style2 {
            height: 30px;
        }
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            color: white;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">








    




    <table class="auto-style1">
        <tr>
            <td style="font-family: 'Trebuchet MS'; font-size: 14px; font-weight: bold; color: #FFFFFF; background-color: #0099CC; text-align: left; " class="auto-style2" colspan="2"> <asp:label id="lblBilgi" runat="server"></asp:label></td>
        </tr>
        <tr>
            <td style="font-family: 'Trebuchet MS'; font-size: 14px; font-weight: bold; color: #FFFFFF; background-color: #0099CC; width: 30%; text-align: left; height: 30px;">Admin Kullanıcı Adı:</td>
            <td style="width: 60%; height: 30px"> <asp:textbox class="form-control" id="txtAdminAd" runat="server" height="34px" Width="379px"></asp:textbox> </td>
        </tr>
        <tr>
            <td style="font-family: 'Trebuchet MS'; font-size: 14px; font-weight: bold; color: #FFFFFF; background-color: #0099CC; width: 30%; text-align: left; height: 30px;">Admin Kullanıcı Şifre:</td>
            <td style="width: 60%; height: 30px"> <asp:textbox class="form-control" id="txtAdminSifre" runat="server" height="34px" Width="378px"></asp:textbox></td>
        </tr>
        <tr>
            <td style=" height: 5px; "> &nbsp;</td>
            <td style="height: 5px">&nbsp;</td>
        </tr>
        <tr>
            <td style=" width: 30%; text-align: right; height: 30px; text-align:center;"> <asp:button runat="server" class="btn btn-danger" text="Adminleri Gör" id="btnAdminGor" onclick="btnAdminGor_Click" /></td>
            <td style="width: 60%; height: 40px"><asp:button runat="server" class="btn btn-info" text="Ekle" id="btnAdminKaydet" onclick="btnAdminKaydet_Click" /></td>
        </tr>
        <tr>
            <td class="auto-style2" colspan="2">
                <asp:panel ID="pnlAdmin"  runat="server" Visible="False">
                    <asp:DataList ID="dlAdminGor" runat="server" CellPadding="4" ForeColor="#333333" Width="564px">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderTemplate>
                            <table class="auto-style3">
                                <tr>
                                    <td style="width: 40%">Kullanıcı Adı</td>
                                    <td class="auto-style4" style="width: 40%">Kullanıcı Şifre</td>
                                    <td class="auto-style4">&nbsp;&nbsp; Sil</td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemStyle BackColor="#EFF3FB" />
                        <ItemTemplate>
                            <table class="auto-style3">
                                <tr>
                                    <td style="width: 40%"><%#Eval("AdminKullaniciAd") %></td>
                                    <td class="auto-style4" style="width: 40%; color:black;"><%#Eval("AdminKullaniciSifre") %></td>
                                    <td class="auto-style4">
                                      <a href="AdminYonetimi.aspx?AdminKullaniciId=<%#Eval("AdminKullaniciId") %>&islem=sil">  <img src="images/iconlar/kul_sil.png" /></a>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    </asp:DataList>

                </asp:panel>
            </td>
        </tr>
        </table>

</asp:Content>

