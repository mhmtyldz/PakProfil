using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;

public partial class adminpanel_KategoriDuzenle : System.Web.UI.Page
{
    Methodlar klas = new Methodlar(); string KategoriId = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        KategoriId = Request.QueryString["KategoriId"];
        if (Page.IsPostBack == false)
        {
            DataRow drKategori = klas.GetDataRow("Select * From Kategori Where KategoriId=" + KategoriId);
            txtKategoriAd.Text = drKategori["KategoriAd"].ToString();
            imgResim.ImageUrl = "../adminpanel/KategoriResimleri/200/" + drKategori["KategoriResim"].ToString();
        }

    }

    protected void btnDuzenle_Click(object sender, EventArgs e)
    {
        string resimadi = ""; string uzanti = ""; string baslik = "";
        if (fuResim.HasFile)
        {
            string resimadi2 = "";
            resimadi2 = klas.GetDataCell("Select KategoriResim From Kategori Where  KategoriId=" + KategoriId);

            if (resimadi2 != "ResimYok.png")
            {
                FileInfo fiResim = new FileInfo(Server.MapPath("../adminpanel/KategoriResimleri/200/" + resimadi2));
                fiResim.Delete();
                FileInfo fiResim2 = new FileInfo(Server.MapPath("../adminpanel/KategoriResimleri/700/" + resimadi2));
                fiResim2.Delete();
            }


            baslik = fuResim.FileName;
            uzanti = Path.GetExtension(fuResim.PostedFile.FileName);
            resimadi = Seo.Temizle(baslik) + "_Kategori_" + txtKategoriAd.Text + uzanti;
            fuResim.SaveAs(Server.MapPath("KategoriResimleri/Silinecek" + uzanti));

            int deger = 200;
            Bitmap resim = new Bitmap(Server.MapPath("KategoriResimleri/Silinecek" + uzanti));// Silinecek resmimizin boyutunu bitmap yapıyoruz 
            using (Bitmap yeniResim = resim)
            {
                double Yukseklik = yeniResim.Height;
                double Genislik = yeniResim.Width;
                double Oran = 0;

                if (Genislik >= deger)
                {
                    Oran = Genislik / Yukseklik;
                    Genislik = deger;
                    Yukseklik = deger / Oran;

                    Size yenidegerler = new Size(Convert.ToInt32(Genislik), Convert.ToInt32(Yukseklik));
                    Bitmap SonResim = new Bitmap(yeniResim, yenidegerler);
                    SonResim.Save(Server.MapPath("KategoriResimleri/200/" + resimadi));
                    SonResim.Dispose();
                    yeniResim.Dispose();
                    resim.Dispose();

                }
                else
                {
                    fuResim.SaveAs(Server.MapPath("KategoriResimleri/200/" + uzanti));
                }



            }

            deger = 700; // Resmin ufaltılacağı boyut 
            resim = new Bitmap(Server.MapPath("KategoriResimleri/Silinecek" + uzanti));// Silinecek resmimizin boyutunu bitmap yapıyoruz 

            using (Bitmap yeniResim = resim)
            {
                double Yukseklik = yeniResim.Height;
                double Genislik = yeniResim.Width;
                double Oran = 0;
                if (Genislik >= deger)
                {
                    Oran = Genislik / Yukseklik;
                    Genislik = deger;
                    Yukseklik = deger / Oran;

                    Size yenidegerler = new Size(Convert.ToInt32(Genislik), Convert.ToInt32(Yukseklik));
                    Bitmap SonResim = new Bitmap(yeniResim, yenidegerler);
                    SonResim.Save(Server.MapPath("KategoriResimleri/700/" + resimadi));
                    SonResim.Dispose();
                    yeniResim.Dispose();
                    resim.Dispose();

                }
                else
                {
                    fuResim.SaveAs(Server.MapPath("KategoriResimleri/700/" + uzanti));
                }
                FileInfo fisilinecek = new FileInfo(Server.MapPath("KategoriResimleri/Silinecek" + uzanti));
                fisilinecek.Delete();
            }

        }
        else
        {
            DataRow drResimadi = klas.GetDataRow("Select KategoriResim from Kategori Where KategoriId=" + KategoriId);
            resimadi = drResimadi["KategoriResim"].ToString();
        }

        SqlConnection baglanti = klas.baglan();
        SqlCommand cmd = new SqlCommand("Update Kategori Set KategoriResim=@KategoriResim, KategoriAd=@KategoriAd Where KategoriId=" + KategoriId, baglanti);
        cmd.Parameters.Add("KategoriResim", resimadi);

        cmd.Parameters.Add("KategoriAd", txtKategoriAd.Text);
        cmd.ExecuteNonQuery();
        Response.Redirect("KategoriEkle.aspx");
    }
}


