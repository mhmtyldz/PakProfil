<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel/master_admin.master" AutoEventWireup="true" CodeFile="MusteriEkle.aspx.cs" Inherits="adminpanel_MusteriEkle" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>






<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 30%;
            height: 20px;
        }

        .auto-style3 {
            width: 40%;
            height: 20px;
        }

        .auto-style4 {
            width: 30%;
            height: 20px;
            text-align: right;
        }

        .auto-style5 {
            font-family: "Trebuchet MS";
            font-weight: bold;
            font-size: 16px;
            color: #FFFFFF;
        }

        .auto-style6 {
            height: 25px;
        }

        .auto-style7 {
            height: 20px;
            text-align: center;
        }

        </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <table class="auto-style1" style="padding-top: 10px; padding-left: 10px">
        <tr>
            <td class="auto-style7" style="font-family: 'Trebuchet MS'; font-size: 16px; font-weight: bold; color: #FFFFFF; background-color: #0099CC; padding-top: 10px;" colspan="3">
                <asp:Label ID="lblBilgi" runat="server"></asp:Label>
            </td>
        </tr>

       


        <tr>
            <td class="auto-style4" style="font-family: 'Trebuchet MS'; font-size: 16px; font-weight: bold; color: #FFFFFF; text-align: right; background-color: #0099CC; padding-top: 10px;">Firma Adı:</td>
            <td class="auto-style3" style="padding-top: 10px">
                <asp:TextBox class="form-control" ID="txtMusteriAd" runat="server" Height="34px"></asp:TextBox>
            </td>
            <td class="auto-style2" style="padding-top: 10px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMusteriAd" CssClass="hata_mesaj">Firma Adı Boş Geçilemez</asp:RequiredFieldValidator>
                </td>
        </tr>

       


                <tr>




                    <td style="text-align: right; background-color: #0099CC; padding-top: 10px; font-family: 'Trebuchet MS'; font-size: 16px; font-weight: bold; color: #FFFFFF;" class="auto-style5">İl Seçiniz:</td>
                    <td style="padding-top: 10px">
                        <asp:DropDownList ID="ddlil" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlil_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td style="padding-top: 10px">&nbsp;</td>
                </tr>
                <tr>
                    <td style="font-family: 'Trebuchet MS'; font-size: 16px; font-weight: bold; color: #FFFFFF; text-align: right; background-color: #0099CC; padding-top: 10px;">İlçe Seçiniz:</td>
                    <td style="padding-top: 10px">
                        <asp:DropDownList ID="ddlilce" runat="server" AutoPostBack="True" Enabled="False" OnSelectedIndexChanged="ddlilce_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td style="padding-top: 10px">&nbsp;</td>
                </tr>

                <tr>
                    <td style="font-family: 'Trebuchet MS'; font-size: 16px; font-weight: bold; color: #FFFFFF; text-align: right; background-color: #0099CC; padding-top: 10px;">Semt Seçiniz:</td>
                    <td style="padding-top: 10px">
                        <asp:DropDownList ID="ddlSemt" runat="server" AutoPostBack="True" Enabled="False" OnSelectedIndexChanged="ddlSemt_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td style="padding-top: 10px">&nbsp;</td>
                </tr>
                <tr>
                    <td style="font-family: 'Trebuchet MS'; font-size: 16px; font-weight: bold; color: #FFFFFF; text-align: right; background-color: #0099CC; padding-top: 10px;" class="auto-style6">Mahalle Seçiniz:</td>
                    <td class="auto-style6" style="padding-top: 10px">
                        <asp:DropDownList ID="ddlMahalle" runat="server" Enabled="False" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style6" style="padding-top: 10px"></td>


                </tr>


          
        <tr>
            <td style="font-family: 'Trebuchet MS'; font-size: 16px; font-weight: bold; color: #FFFFFF; text-align: right; background-color: #0099CC; padding-top: 10px;">Email:</td>
            <td style="padding-top: 10px">
                <asp:TextBox class="form-control" ID="txtEmail" runat="server"></asp:TextBox>
            </td>
            <td style="padding-top: 10px">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" CssClass="hata_mesaj" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">E-mail Formatında Giriniz</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="font-family: 'Trebuchet MS'; font-size: 16px; font-weight: bold; color: #FFFFFF; text-align: right; background-color: #0099CC; padding-top: 10px;">Tel Numarası:</td>
            <td style="padding-top: 10px">
                <asp:TextBox class="form-control" ID="txtTel" runat="server"></asp:TextBox>
            </td>
            <td style="padding-top: 10px">&nbsp;</td>
        </tr>
        <tr>
            <td style="font-family: 'Trebuchet MS'; font-size: 16px; font-weight: bold; color: #FFFFFF; text-align: right; background-color: #0099CC; padding-top: 10px;">Gsm:</td>
            <td style="padding-top: 10px">
                <asp:TextBox class="form-control" ID="txtGsm" runat="server"></asp:TextBox>
            </td>
            <td style="padding-top: 10px">&nbsp;</td>
        </tr>
        <tr>
            <td style="font-family: 'Trebuchet MS'; font-size: 16px; font-weight: bold; color: #FFFFFF; text-align: right; background-color: #0099CC; padding-top: 10px;">Gsm2:</td>
            <td style="padding-top: 10px">
                <asp:TextBox class="form-control" ID="txtGsm2" runat="server"></asp:TextBox>
            </td>
            <td style="padding-top: 10px">&nbsp;</td>
        </tr>
        <tr>
            <td style="font-family: 'Trebuchet MS'; font-size: 16px; font-weight: bold; color: #FFFFFF; text-align: right; background-color: #0099CC; padding-top: 10px;">Fax:</td>
            <td style="padding-top: 10px">
                <asp:TextBox class="form-control" ID="txtFax" runat="server"></asp:TextBox>
            </td>
            <td style="padding-top: 10px">&nbsp;</td>
        </tr>
        <tr>
            <td style="font-family: 'Trebuchet MS'; font-size: 16px; font-weight: bold; color: #FFFFFF; text-align: right; background-color: #0099CC; padding-top: 10px;">Tahsilat Ücreti:</td>
            <td style="padding-top: 10px">
                <asp:TextBox class="form-control" ID="txtFiyat" runat="server"></asp:TextBox>
                
                <asp:FilteredTextBoxExtender TargetControlID="txtFiyat" FilterType="Numbers" ID="FilteredTextBoxExtender1" runat="server"></asp:FilteredTextBoxExtender>
            </td>
            <td style="padding-top: 10px">&nbsp;</td>
        </tr>
        <tr>
            <td style="font-family: 'Trebuchet MS'; font-size: 16px; font-weight: bold; color: #FFFFFF; text-align: right; background-color: #0099CC; padding-top: 10px;">Alacak Verecek Seç:</td>
            <td style="padding-top: 10px">
                <asp:DropDownList ID="ddlAlacakVerecek" runat="server">
                </asp:DropDownList>
            </td>
            <td style="padding-top: 10px">&nbsp;</td>
        </tr>
        <tr>
            <td style="font-family: 'Trebuchet MS'; font-size: 16px; font-weight: bold; color: #FFFFFF; text-align: right; background-color: #0099CC; padding-top: 10px;">Çek Senet Nakit Seç:</td>
            <td style="padding-top: 10px">
                <asp:DropDownList ID="ddlCekSenet" runat="server">
                </asp:DropDownList>
            </td>
            <td style="padding-top: 10px">&nbsp;</td>
        </tr>
        <tr>
            <td style="font-family: 'Trebuchet MS'; font-size: 16px; font-weight: bold; color: #FFFFFF; text-align: right; background-color: #0099CC; padding-top: 10px;">Borç Alınan Tarih:</td>
            <td style="padding-top: 10px">
                <asp:TextBox class="form-control" ID="txtBorcAlinanTarih" runat="server"></asp:TextBox>
                <asp:CalendarExtender     ID="CalendarExtender1" runat="server" TargetControlID="txtBorcAlinanTarih" PopupPosition="Right"></asp:CalendarExtender>
            </td>
            <td style="padding-top: 10px">&nbsp;</td>
        </tr>
        <tr>
            <td style="font-family: 'Trebuchet MS'; font-size: 16px; font-weight: bold; color: #FFFFFF; text-align: right; background-color: #0099CC; padding-top: 10px;">Borç Ödenen Tarihi:</td>
            <td style="padding-top: 10px">
                <asp:TextBox class="form-control" ID="txtBorcVerilenTarih" runat="server"></asp:TextBox>
                 <asp:CalendarExtender     ID="CalendarExtender2" runat="server" TargetControlID="txtBorcVerilenTarih" PopupPosition="Right"></asp:CalendarExtender>
            </td>
            <td style="padding-top: 10px">&nbsp;</td>
        </tr>
        <tr>
            <td style="font-family: 'Trebuchet MS'; font-size: 16px; font-weight: bold; color: #FFFFFF; text-align: right; background-color: #0099CC; padding-top: 10px;">Adres:</td>
            <td style="padding-top: 10px">
                <asp:TextBox class="form-control" ID="txtAdres" runat="server" Height="80px" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td style="padding-top: 10px">&nbsp;</td>
        </tr>
        <tr>
            <td style="font-family: 'Trebuchet MS'; font-size: 16px; font-weight: bold; color: #FFFFFF; text-align: right; background-color: #0099CC; padding-top: 10px;">&nbsp;</td>
            <td style="padding-top: 10px">
                <asp:Button class="btn btn-primary" ID="btnMusteriKaydet" runat="server" Text="Kaydet" Width="120px" OnClick="btnMusteriKaydet_Click" />
            </td>
            <td style="padding-top: 10px">&nbsp;</td>
        </tr>
        <tr>
            <td style="font-family: 'Trebuchet MS'; font-size: 16px; font-weight: bold; color: #FFFFFF; text-align: right; background-color: #0099CC; padding-top: 10px;">&nbsp;</td>
            <td style="padding-top: 10px">&nbsp;</td>
            <td style="padding-top: 10px">&nbsp;</td>
        </tr>
    </table>



</asp:Content>

