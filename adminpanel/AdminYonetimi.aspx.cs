using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminpanel_AdminYonetimi : System.Web.UI.Page
{

    Methodlar klas = new Methodlar();
    string islem = ""; string AdminKullaniciId = "";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        islem = Request.QueryString["islem"];
        AdminKullaniciId = Request.QueryString["AdminKullaniciId"];
        if(islem=="sil")
        {
            klas.cmd("Delete From AdminKullanici Where AdminKullaniciId=" + AdminKullaniciId);
        }



    }




    protected void btnAdminKaydet_Click(object sender, EventArgs e)
    {
        if(txtAdminAd.Text!="" || txtAdminSifre.Text!="")
        {
            SqlConnection baglanti = klas.baglan();
            SqlCommand cmd = new SqlCommand("insert into AdminKullanici(AdminKullaniciAd,AdminKullaniciSifre) Values(@AdminKullaniciAd,@AdminKullaniciSifre)", baglanti);
            cmd.Parameters.Add("AdminKullaniciAd", txtAdminAd.Text);
            cmd.Parameters.Add("AdminKullaniciSifre", txtAdminSifre.Text);
            cmd.ExecuteNonQuery();
            lblBilgi.Text = txtAdminAd.Text + " Kullanıcı Adı  Başarıyla kaydedilmiştir.";
            txtAdminAd.Text = "";
            txtAdminSifre.Text = "";
        }
        else
        {
            lblBilgi.Text = "Boş Kişi Kayıtı Yapamazsınız ! Lütfen Bilgileri Doldurunuz! ";
        }
        
       

    }

    protected void btnAdminGor_Click(object sender, EventArgs e)
    {
        pnlAdmin.Visible = true;
        DataTable dtAdminler = klas.GetDataTable("Select * From AdminKullanici");
        dlAdminGor.DataSource = dtAdminler;
        dlAdminGor.DataBind();

        
        
    }
}