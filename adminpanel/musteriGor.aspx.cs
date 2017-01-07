using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminpanel_musteriGor : System.Web.UI.Page
{

    Methodlar klas = new Methodlar();
    string aranacak = ""; string islem = ""; string MusteriId = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        
        try
        {
            aranacak = Request.QueryString["aranacak"];
            islem = Request.QueryString["islem"];
            MusteriId = Request.QueryString["MusteriId"];

        }
        catch (Exception)
        { }
        if(islem=="sil")
        {

            klas.cmd("Delete From Musteri Where MusteriId=" + MusteriId);
            Response.Redirect("musteriGor.aspx");
        }

        DataTable dtKullanici = klas.GetDataTable("SELECT dbo.Musteri.MusteriId,dbo.AlacakVerecekMi.AlacaklimiVerecekmi, dbo.Musteri.FirmaAdi, dbo.Musteri.Tel, dbo.Musteri.Fiyat FROM  dbo.AlacakVerecekMi INNER JOIN dbo.Musteri ON dbo.AlacakVerecekMi.AlacakVerecekId = dbo.Musteri.AlacakVerecekId");
        dlMusteriler.DataSource= dtKullanici;
        dlMusteriler.DataBind();

        if(aranacak!=null)
        {
            DataTable dtKullaniciARa = klas.GetDataTable("SELECT dbo.Musteri.MusteriId,  dbo.AlacakVerecekMi.AlacaklimiVerecekmi, dbo.Musteri.FirmaAdi, dbo.Musteri.Tel, dbo.Musteri.Fiyat FROM  dbo.AlacakVerecekMi INNER JOIN dbo.Musteri ON dbo.AlacakVerecekMi.AlacakVerecekId = dbo.Musteri.AlacakVerecekId where  dbo.Musteri.FirmaAdi like '%" + aranacak + "%' or dbo.Musteri.Tel like '%" + aranacak + "%'");
            dlMusteriler.DataSource = dtKullaniciARa;
            dlMusteriler.DataBind();
            if (dtKullaniciARa.Rows.Count > 0)
            {
                lblArananBilgi.Text = dtKullaniciARa.Rows.Count.ToString() + "Adet Müşteri Bulunmuştur";
                dlMusteriler.Visible = true;

            }

            else
            {
                lblArananBilgi.Text = "Aradığınız isimde bir Müşteri bulunamadı";
                dlMusteriler.Visible = false;
            }
        }



    }

    protected void btnAra_Click(object sender, EventArgs e)
    {
        Response.Redirect("musteriGor.aspx?aranacak=" + Seo.Temizle(txtAra.Text));
    }
}