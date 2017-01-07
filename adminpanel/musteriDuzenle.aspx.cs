using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminpanel_musteriDuzenle : System.Web.UI.Page
{
    Methodlar klas = new Methodlar();
    string MusteriId = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        MusteriId = Request.QueryString["MusteriId"];
        if(Page.IsPostBack==false)
        {
            DataRow drMusteri = klas.GetDataRow("SELECT  dbo.Musteri.*, dbo.iller.ilAdi, dbo.ilceler.ilceAdi, dbo.semt.SemtAdi, dbo.mahalle.MahalleAdi, dbo.AlacakVerecekMi.AlacaklimiVerecekmi, dbo.AlacakVerecekCekSenet.CekSenetBono FROM dbo.Musteri INNER JOIN  dbo.iller ON dbo.Musteri.ilId = dbo.iller.ilId INNER JOIN  dbo.ilceler ON dbo.Musteri.ilceId = dbo.ilceler.ilceId INNER JOIN dbo.semt ON dbo.Musteri.SemtId = dbo.semt.SemtId INNER JOIN dbo.mahalle ON dbo.Musteri.MahalleId = dbo.mahalle.MahalleId INNER JOIN  dbo.AlacakVerecekMi ON dbo.Musteri.AlacakVerecekId = dbo.AlacakVerecekMi.AlacakVerecekId INNER JOIN  dbo.AlacakVerecekCekSenet ON dbo.Musteri.AlacakVerecekCekSenetId = dbo.AlacakVerecekCekSenet.AlacakVerecekCekSenetId Where dbo.Musteri.MusteriId="+MusteriId);
            txtMusteriAd.Text = drMusteri["FirmaAdi"].ToString();
            txtEmail.Text = drMusteri["Email"].ToString();
            txtAdres.Text = drMusteri["Adres"].ToString();
            txtTel.Text = drMusteri["Tel"].ToString();
            txtGsm.Text = drMusteri["Gsm"].ToString();
            txtGsm2.Text = drMusteri["Gsm2"].ToString();
            txtFax.Text = drMusteri["Fax"].ToString();
            txtFiyat.Text = drMusteri["Fiyat"].ToString();
            txtBorcAlinanTarih.Text = drMusteri["BorcAlmaTarihi"].ToString();
            txtBorcVerilenTarih.Text = drMusteri["BorcOdemeTarihi"].ToString();

            il();
            ddlil.SelectedValue = drMusteri["ilId"].ToString();

            ilce();
            ddlilce.SelectedValue = drMusteri["ilceId"].ToString();

            semt();
            ddlSemt.SelectedValue = drMusteri["SemtId"].ToString();

            mahalle();
            ddlMahalle.SelectedValue = drMusteri["MahalleId"].ToString();


        }

    }

    void il()
    {
        DataTable dtiller = klas.GetDataTable("Select * From iller " );
        ddlil.DataTextField = "ilAdi";
        ddlil.DataValueField = "ilId";
        ddlil.DataSource = dtiller;
        ddlil.DataBind();
    }

    void ilce()
    {
        DataRow drMusteri = klas.GetDataRow("SELECT  dbo.Musteri.*, dbo.iller.ilAdi, dbo.ilceler.ilceAdi, dbo.semt.SemtAdi, dbo.mahalle.MahalleAdi, dbo.AlacakVerecekMi.AlacaklimiVerecekmi, dbo.AlacakVerecekCekSenet.CekSenetBono FROM dbo.Musteri INNER JOIN  dbo.iller ON dbo.Musteri.ilId = dbo.iller.ilId INNER JOIN  dbo.ilceler ON dbo.Musteri.ilceId = dbo.ilceler.ilceId INNER JOIN dbo.semt ON dbo.Musteri.SemtId = dbo.semt.SemtId INNER JOIN dbo.mahalle ON dbo.Musteri.MahalleId = dbo.mahalle.MahalleId INNER JOIN  dbo.AlacakVerecekMi ON dbo.Musteri.AlacakVerecekId = dbo.AlacakVerecekMi.AlacakVerecekId INNER JOIN  dbo.AlacakVerecekCekSenet ON dbo.Musteri.AlacakVerecekCekSenetId = dbo.AlacakVerecekCekSenet.AlacakVerecekCekSenetId Where dbo.Musteri.MusteriId=" + MusteriId);

        DataTable dtilceler = klas.GetDataTable("Select * From ilceler where ilId="+drMusteri["ilId"] );
        ddlilce.DataTextField = "ilceAdi";
        ddlilce.DataValueField = "ilceId";
        ddlilce.DataSource = dtilceler;
        ddlilce.DataBind();
    }
    void semt()
    {
        DataRow drMusteri = klas.GetDataRow("SELECT  dbo.Musteri.*, dbo.iller.ilAdi, dbo.ilceler.ilceAdi, dbo.semt.SemtAdi, dbo.mahalle.MahalleAdi, dbo.AlacakVerecekMi.AlacaklimiVerecekmi, dbo.AlacakVerecekCekSenet.CekSenetBono FROM dbo.Musteri INNER JOIN  dbo.iller ON dbo.Musteri.ilId = dbo.iller.ilId INNER JOIN  dbo.ilceler ON dbo.Musteri.ilceId = dbo.ilceler.ilceId INNER JOIN dbo.semt ON dbo.Musteri.SemtId = dbo.semt.SemtId INNER JOIN dbo.mahalle ON dbo.Musteri.MahalleId = dbo.mahalle.MahalleId INNER JOIN  dbo.AlacakVerecekMi ON dbo.Musteri.AlacakVerecekId = dbo.AlacakVerecekMi.AlacakVerecekId INNER JOIN  dbo.AlacakVerecekCekSenet ON dbo.Musteri.AlacakVerecekCekSenetId = dbo.AlacakVerecekCekSenet.AlacakVerecekCekSenetId Where dbo.Musteri.MusteriId=" + MusteriId);

        DataTable dtSemtler = klas.GetDataTable("Select * From semt where ilceId=" + drMusteri["ilceId"]);
        ddlSemt.DataTextField = "SemtAdi";
        ddlSemt.DataValueField = "SemtId";
        ddlSemt.DataSource = dtSemtler;
        ddlSemt.DataBind();
    }
    void mahalle()
    {
        DataRow drMusteri = klas.GetDataRow("SELECT  dbo.Musteri.*, dbo.iller.ilAdi, dbo.ilceler.ilceAdi, dbo.semt.SemtAdi, dbo.mahalle.MahalleAdi, dbo.AlacakVerecekMi.AlacaklimiVerecekmi, dbo.AlacakVerecekCekSenet.CekSenetBono FROM dbo.Musteri INNER JOIN  dbo.iller ON dbo.Musteri.ilId = dbo.iller.ilId INNER JOIN  dbo.ilceler ON dbo.Musteri.ilceId = dbo.ilceler.ilceId INNER JOIN dbo.semt ON dbo.Musteri.SemtId = dbo.semt.SemtId INNER JOIN dbo.mahalle ON dbo.Musteri.MahalleId = dbo.mahalle.MahalleId INNER JOIN  dbo.AlacakVerecekMi ON dbo.Musteri.AlacakVerecekId = dbo.AlacakVerecekMi.AlacakVerecekId INNER JOIN  dbo.AlacakVerecekCekSenet ON dbo.Musteri.AlacakVerecekCekSenetId = dbo.AlacakVerecekCekSenet.AlacakVerecekCekSenetId Where dbo.Musteri.MusteriId=" + MusteriId);


        DataTable dtMahalleler = klas.GetDataTable("Select * From mahalle where SemtId=" + drMusteri["SemtId"]);
        ddlMahalle.DataTextField = "MahalleAdi";
        ddlMahalle.DataValueField = "MahalleId";
        ddlMahalle.DataSource = dtMahalleler;
        ddlMahalle.DataBind();
    }
}