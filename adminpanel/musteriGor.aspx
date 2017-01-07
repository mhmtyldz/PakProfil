<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/master_admin.master" AutoEventWireup="true" CodeFile="musteriGor.aspx.cs" Inherits="adminpanel_musteriGor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="auto-style1">
        <tr>
            <td>
                <table class="auto-style1">
                    <tr>
                        <td style="width: 20%; font-family: 'Trebuchet MS'; font-size: 14px; font-weight: bold; color: #FFFFFF; background-color: #0066CC; text-align: center;">Müşteri Ara </td>
                        <td>
                            <asp:textbox class="form-control" id="txtAra" runat="server"></asp:textbox>
                        </td>
                        <td style="width: 10%">
                            <asp:button class="btn btn-danger" id="btnAra" runat="server" text="Bul" OnClick="btnAra_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblArananBilgi" runat="server" Font-Bold="True" Font-Size="14px" ForeColor="#CC0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:datalist id="dlMusteriler" runat="server" cellpadding="4" forecolor="#333333" Width="725px">
                    <AlternatingItemStyle BackColor="White" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderTemplate>
                        <table class="auto-style1">
                            <tr>
                                <td style="width:30%">Firma Adı</td>
                                <td style="width: 20%">Telefon</td>
                                <td style="width: 16%">Alacak Verecek</td>
                                <td style="width: 20%">Borç</td>
                                <td style="width: 7%">Güncelle&nbsp;&nbsp;</td>
                                <td style="width:7%">Sil</td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemStyle BackColor="#EFF3FB" />
                    <ItemTemplate>
                        <table class="auto-style1">
                            <tr>
                                <td style="width:30%"><%#Eval("FirmaAdi")%></td>
                                <td style="width: 20%"><%#Eval("Tel")%></td>
                                <td style="width: 16%"><%#Eval("AlacaklimiVerecekmi")%></td>
                                <td style="width: 20%"><%#Eval("Fiyat")%></td>
                                <td style="width: 7%">
                                  <a href="musteriDuzenle.aspx?MusteriId=<%#Eval("MusteriId") %>">  <img src="images/iconlar/kul_duzenle.png" border="0" /></a>
                                </td>
                                <td style="width:7%">
                                   <a href="musteriGor.aspx?MusteriId=<%#Eval("MusteriId") %>&islem=sil">   <img src="images/iconlar/kul_sil.png" border="0" /></a>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:datalist>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

