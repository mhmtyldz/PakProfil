using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminpanel_MusteriEkle : System.Web.UI.Page
{
    Methodlar klas = new Methodlar();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Page.IsPostBack==false)
        {
            il();
            ddlil.Items.Insert(0, new ListItem("Seçiniz", "0"));
            AlacakVerecekSec();
            CekSenetSec();
        }

    }

    void il()
    {
        DataTable dtiller = klas.GetDataTable("Select * From iller " + "order by [ilAdi]");
        ddlil.DataTextField = "ilAdi";
        ddlil.DataValueField = "ilId";
        ddlil.DataSource = dtiller;
        ddlil.DataBind();
    }

    void ilce()
    {


        DataTable dtilceler = klas.GetDataTable("Select * From ilceler Where ilId=" + ddlil.SelectedValue + " order by [ilceAdi]");
        ddlilce.DataTextField = "ilceAdi";
        ddlilce.DataValueField = "ilceId";
        ddlilce.DataSource = dtilceler;
        ddlilce.DataBind();
    }

    void semt()
    {


        DataTable dtilceler = klas.GetDataTable("Select * From semt  Where ilceId=" + ddlilce.SelectedValue + " order by [SemtAdi]");
        ddlSemt.DataTextField = "SemtAdi";
        ddlSemt.DataValueField = "SemtId";
        ddlSemt.DataSource = dtilceler;
        ddlSemt.DataBind();
    }

    void mahalle()
    {
        DataTable dtMahalle = klas.GetDataTable("Select * From mahalle  Where SemtId=" + ddlSemt.SelectedValue + " order by [MahalleAdi]");
        ddlMahalle.DataTextField = "MahalleAdi";
        ddlMahalle.DataValueField = "MahalleId";
        ddlMahalle.DataSource = dtMahalle;
        ddlMahalle.DataBind();
    }

    void AlacakVerecekSec()
    {
        DataTable dtAlacakVerecek = klas.GetDataTable("Select * From AlacakVerecekMi ");
        ddlAlacakVerecek.DataTextField = "AlacaklimiVerecekmi";
        ddlAlacakVerecek.DataValueField = "AlacakVerecekId";
        ddlAlacakVerecek.DataSource = dtAlacakVerecek;
        ddlAlacakVerecek.DataBind();
    }


    void CekSenetSec()
    {
        DataTable dtCekSenetSec = klas.GetDataTable("Select * From AlacakVerecekCekSenet");
        ddlCekSenet.DataTextField = "CekSenetBono";
        ddlCekSenet.DataValueField = "AlacakVerecekCekSenetId";
        ddlCekSenet.DataSource = dtCekSenetSec;
        ddlCekSenet.DataBind();
    }



    protected void ddlil_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlilce.Enabled = true;
        ilce();
        ddlilce.Items.Insert(0, new ListItem("Seçiniz", "0"));
    }

    protected void ddlilce_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlSemt.Enabled = true;
        semt();
        ddlSemt.Items.Insert(0, new ListItem("Seçiniz", "0"));
    }

    protected void ddlSemt_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlMahalle.Enabled = true;
        mahalle();
    }

    protected void btnMusteriKaydet_Click(object sender, EventArgs e)
    {
        if(ddlil.SelectedValue != "0")
        {
            if(ddlilce.SelectedValue != "0")
            {
                if(ddlSemt.SelectedValue!="0")
                {
                    SqlConnection baglanti = klas.baglan();
                    SqlCommand cmd = new SqlCommand("Insert into Musteri(ilId,ilceId,SemtId,MahalleId,FirmaAdi,Email,Adres,Tel,Gsm,Gsm2,Fax,Fiyat,AlacakVerecekId,AlacakVerecekCekSenetId,BorcAlmaTarihi,BorcOdemeTarihi) Values(@ilId,@ilceId,@SemtId,@MahalleId,@FirmaAdi,@Email,@Adres,@Tel,@Gsm,@Gsm2,@Fax,@Fiyat,@AlacakVerecekId,@AlacakVerecekCekSenetId,@BorcAlmaTarihi,@BorcOdemeTarihi)", baglanti);
                    cmd.Parameters.Add("ilId", ddlil.SelectedValue);
                    cmd.Parameters.Add("ilceId", ddlil.SelectedValue);
                    cmd.Parameters.Add("SemtId", ddlSemt.SelectedValue);
                    cmd.Parameters.Add("MahalleId", ddlMahalle.SelectedValue);
                    cmd.Parameters.Add("FirmaAdi", txtMusteriAd.Text);
                    cmd.Parameters.Add("Email", txtEmail.Text);
                    cmd.Parameters.Add("Adres", txtAdres.Text);
                    cmd.Parameters.Add("Tel", txtTel.Text);
                    cmd.Parameters.Add("Gsm", txtGsm.Text);
                    cmd.Parameters.Add("Gsm2", txtGsm2.Text);
                    cmd.Parameters.Add("Fax", txtFax.Text);
                    cmd.Parameters.Add("Fiyat", txtFiyat.Text);
                    cmd.Parameters.Add("AlacakVerecekId", ddlAlacakVerecek.SelectedValue);
                    cmd.Parameters.Add("AlacakVerecekCekSenetId", ddlCekSenet.SelectedValue);
                    cmd.Parameters.Add("BorcAlmaTarihi", txtBorcAlinanTarih.Text);
                    cmd.Parameters.Add("BorcOdemeTarihi", txtBorcVerilenTarih.Text);
                    cmd.ExecuteNonQuery();

                }
                else
                {
                    lblBilgi.Text = "Lütfen Semt Seçiniz ! ";
                }
            }
            else
            {
                lblBilgi.Text = "Lütfen ilce Seçiniz ! ";
            }
        }
        else
        {
            lblBilgi.Text = "Lütfen İl Seçiniz!";
        }
    }
}