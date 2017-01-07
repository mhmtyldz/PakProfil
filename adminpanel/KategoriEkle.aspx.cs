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

public partial class adminpanel_KategoriEkle : System.Web.UI.Page
{
    Methodlar klas = new Methodlar();
    string islem = ""; string KategoriId = ""; string baslik = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        baslik = fuKategoriResim.FileName;
        
        islem = Request.QueryString["islem"];
        KategoriId = Request.QueryString["KategoriId"];
        if(Page.IsPostBack==false)
        {
            pnlKategori.Visible = false;
            pnlKategoriGoster.Visible = false;
        }

        DataTable dtKategori = klas.GetDataTable("Select * From Kategori");
        dlKategoriGoster.DataSource = dtKategori;
        dlKategoriGoster.DataBind();

        if (islem=="sil")
        {
            try
            {
                DataRow drResim = klas.GetDataRow("Select * From Kategori Where KategoriId="+KategoriId);
                if(drResim["KategoriResim"].ToString()!="ResimYok.png")
                {
                    FileInfo fikategoriResim200 = new FileInfo(Server.MapPath("../adminpanel/KategoriResimleri/200/" + drResim["KategoriResim"].ToString()));
                    fikategoriResim200.Delete();
                    FileInfo fikategoriResim700 = new FileInfo(Server.MapPath("../adminpanel/KategoriResimleri/700/" + drResim["KategoriResim"].ToString()));
                    fikategoriResim700.Delete();
                }



            }
            catch (Exception)
            {}

            klas.cmd("Delete From Kategori Where KategoriId="+KategoriId);
            Response.Redirect("KategoriEkle.aspx");

        }
         

    }

    protected void btnKategoriEkle_Click(object sender, EventArgs e)
    {
        string uzanti = ""; string resimadi = "";
        if (txtKategoriAd.Text == "")
        {
            lblBilgi.Text = "Lütfen Kategori Adı Yazınız";
        }
        else
        {
            if (fuKategoriResim.HasFile)
            {
                uzanti = Path.GetExtension(fuKategoriResim.PostedFile.FileName);

                resimadi = Seo.Temizle(baslik) + "_Kategori_"+txtKategoriAd.Text + uzanti;
                fuKategoriResim.SaveAs(Server.MapPath("KategoriResimleri/Silinecek" + uzanti));

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
                        fuKategoriResim.SaveAs(Server.MapPath("KategoriResimleri/200/" + uzanti));
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
                        fuKategoriResim.SaveAs(Server.MapPath("KategoriResimleri/700/" + uzanti));
                    }
                }

                FileInfo fisilinecek = new FileInfo(Server.MapPath("KategoriResimleri/Silinecek" + uzanti));
                fisilinecek.Delete();

                
                    SqlConnection baglanti = klas.baglan();
                    SqlCommand cmd = new SqlCommand("insert into Kategori (KategoriAd,KategoriResim) values(@KategoriAd,@KategoriResim)", baglanti);
                    cmd.Parameters.Add("KategoriAd", txtKategoriAd.Text);
                    cmd.Parameters.Add("KategoriResim", resimadi);
                    cmd.ExecuteNonQuery();
               

                    
                
              
                
            }
            else
            {
                SqlConnection baglanti = klas.baglan();
                SqlCommand cmd = new SqlCommand("insert into Kategori (KategoriAd,KategoriResim) values(@KategoriAd,@KategoriResim)", baglanti);
                cmd.Parameters.Add("KategoriAd", txtKategoriAd.Text);
                cmd.Parameters.Add("KategoriResim", "ResimYok.png");
                cmd.ExecuteNonQuery();
            }
        }

    }

    protected void KategoriGoster_Click(object sender, EventArgs e)
    {
        pnlKategori.Visible = true;
        pnlKategoriGoster.Visible = false;
    }

    protected void KategoriGizle_Click(object sender, EventArgs e)
    {
        pnlKategori.Visible = false;
    }



    protected void btnKategoriGoster_Click(object sender, EventArgs e)
    {
        pnlKategoriGoster.Visible = true;
        pnlKategori.Visible = false;
    }

    protected void btnKategoriGizle_Click(object sender, EventArgs e)
    {
        pnlKategoriGoster.Visible = false;


    }
}