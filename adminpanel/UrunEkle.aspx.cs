using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.IO;

public partial class adminpanel_UrunEkle : System.Web.UI.Page
{
    Methodlar klas = new Methodlar(); string baslik = ""; string islem = ""; string kelime = ""; string UrunId = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        baslik = fuUrunResim.FileName;
        islem = Request.QueryString["islem"];
        kelime = Request.QueryString["kelime"];
        UrunId = Request.QueryString["UrunId"];


        if(islem=="ara")
        {
            if(kelime!=null)
            {
                DataTable dtUrunAra = klas.GetDataTable("SELECT  dbo.Urun.*, dbo.FiyatTur.FiyatTur FROM  dbo.Urun INNER JOIN" +
                        " dbo.FiyatTur ON dbo.Urun.FiyatTurId = dbo.FiyatTur.FiyatTurId Where dbo.Urun.UrunBaslik like '%"+kelime+"%'");
                if(dtUrunAra.Rows.Count>0)
                {
                    pnlUrunleriGoster.Visible = true;
                    dlUrunler.Visible = true;
                    dlUrunler.DataSource = dtUrunAra;
                    dlUrunler.DataBind();
                }
                else
                {
                    dlUrunler.Visible = false;
                }


            }
        }

        if(islem=="sil")
        {
            try
            {
                DataRow dtResim = klas.GetDataRow("Select * From Urun Where UrunId="+UrunId);
                if(dtResim["UrunResim"].ToString()!="ResimYok.png")
                {
                    FileInfo FiResim1a = new FileInfo(Server.MapPath("../adminpanel/UrunResimleri/200/" + dtResim["UrunResim"].ToString()));
                    FiResim1a.Delete();
                    FileInfo FiResim1b = new FileInfo(Server.MapPath("../adminpanel/UrunResimleri/700/" + dtResim["UrunResim"].ToString()));
                    FiResim1b.Delete();
                }
            }
            catch (Exception)
            {}


            klas.cmd("Delete From Urun Where UrunId=" + UrunId);
            Response.Redirect("UrunEkle.aspx");


        }

        
        if (Page.IsPostBack==false)
        {
            pnlUrunEkle.Visible = false;
            KategoriGetir();
            ddlKategori.Items.Insert(0, new ListItem("Seçiniz", "0"));

            FiyatTurGetir();
            ddlFiyatTur.Items.Insert(0, new ListItem("Seçiniz", "0"));
        }


       

    }

    void KategoriGetir()
    {
        DataTable dtKategori = klas.GetDataTable("Select *  From Kategori");
        ddlKategori.DataTextField = "KategoriAd";
        ddlKategori.DataValueField = "KategoriId";
        ddlKategori.DataSource = dtKategori;
        ddlKategori.DataBind();
    }

    void FiyatTurGetir()
    {
        DataTable dtFiyatTur = klas.GetDataTable("Select * From FiyatTur");
        ddlFiyatTur.DataTextField = "FiyatTur";
        ddlFiyatTur.DataValueField = "FiyatTurId";
        ddlFiyatTur.DataSource = dtFiyatTur;
        ddlFiyatTur.DataBind();
    }


    protected void btnUrunEkle_Click(object sender, EventArgs e)
    {
        if(ddlKategori.SelectedValue!="0")
        {
            if(ddlFiyatTur.SelectedValue!="0")
            {
                string uzanti = ""; string resimadi = "";
              
                if (txtUrunBaslik.Text == "")
                {
                    lblBilgi.Text = "Lütfen Ürün Adı Yazınız";
                    
                }
                else
                {
                    if (fuUrunResim.HasFile)
                    {
                        uzanti = Path.GetExtension(fuUrunResim.PostedFile.FileName);

                        resimadi = Seo.Temizle(baslik) + "_Urun_" +Seo.Temizle(txtUrunBaslik.Text)  + uzanti;
                        fuUrunResim.SaveAs(Server.MapPath("UrunResimleri/Silinecek" + uzanti));

                        int deger = 200;
                        Bitmap resim = new Bitmap(Server.MapPath("UrunResimleri/Silinecek" + uzanti));// Silinecek resmimizin boyutunu bitmap yapıyoruz 
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
                                SonResim.Save(Server.MapPath("UrunResimleri/200/" + resimadi));
                                SonResim.Dispose();
                                yeniResim.Dispose();
                                resim.Dispose();

                            }
                            else
                            {
                                fuUrunResim.SaveAs(Server.MapPath("UrunResimleri/200/" + uzanti));
                            }



                        }

                        deger = 700; // Resmin ufaltılacağı boyut 
                        Bitmap resim2 = new Bitmap(Server.MapPath("UrunResimleri/Silinecek" + uzanti));// Silinecek resmimizin boyutunu bitmap yapıyoruz 

                        using (Bitmap yeniResim = resim2)
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
                                SonResim.Save(Server.MapPath("../adminpanel/UrunResimleri/700/" + resimadi));
                                SonResim.Dispose();
                                yeniResim.Dispose();
                                resim2.Dispose();

                            }
                            else
                            {
                                fuUrunResim.SaveAs(Server.MapPath("../adminpanel/UrunResimleri/700/" + uzanti));
                            }
                        }

                        FileInfo fisilinecek = new FileInfo(Server.MapPath("UrunResimleri/Silinecek" + uzanti));
                        fisilinecek.Delete();

                        SqlConnection baglanti = klas.baglan();
                        SqlCommand cmd = new SqlCommand("insert into Urun (KategoriId,UrunBaslik,UrunResim,UrunFiyat,FiyatTurId,UrunAdet,UrunOzellik) values(@KategoriId,@UrunBaslik,@UrunResim,@UrunFiyat,@FiyatTurId,@UrunAdet,@UrunOzellik)", baglanti);
                        cmd.Parameters.Add("KategoriId", ddlKategori.SelectedValue);
                        cmd.Parameters.Add("UrunBaslik", txtUrunBaslik.Text);
                        cmd.Parameters.Add("UrunResim", resimadi);
                        cmd.Parameters.Add("UrunFiyat", txtUrunFiyat.Text);
                        cmd.Parameters.Add("FiyatTurId", ddlFiyatTur.SelectedValue);
                        cmd.Parameters.Add("UrunAdet", txtUrunAdet.Text);
                        cmd.Parameters.Add("UrunOzellik", txtUrunOzellik.Text);
                        cmd.ExecuteNonQuery();
                        Response.Redirect("UrunEkle.aspx");

                    }
                    else
                    {
                        SqlConnection baglanti = klas.baglan();
                        SqlCommand cmd = new SqlCommand("insert into Urun (KategoriId,UrunBaslik,UrunResim,UrunFiyat,FiyatTurId,UrunOzellik) values(@KategoriId,@UrunBaslik,@UrunResim,@UrunFiyat,@FiyatTurId,@UrunOzellik)", baglanti);
                        cmd.Parameters.Add("KategoriId", ddlKategori.SelectedValue);
                        cmd.Parameters.Add("UrunBaslik", txtUrunBaslik.Text);
                        cmd.Parameters.Add("UrunResim", "ResimYok.png");
                        cmd.Parameters.Add("UrunFiyat", txtUrunFiyat.Text);
                        cmd.Parameters.Add("FiyatTurId", ddlFiyatTur.SelectedValue);
                        cmd.Parameters.Add("UrunOzellik", txtUrunOzellik.Text);
                        cmd.ExecuteNonQuery();
                        Response.Redirect("UrunEkle.aspx");
                    }
                }
            }
            else
            {
                lblBilgi.Text = "Lütfen Bir Fiyat Tür Seçiniz";
            }

        }
        else
        {
            lblBilgi.Text = "Lütfen bir Kategori Seçiniz!";
            
        }
    }

    protected void UrunEkleGoster_Click(object sender, EventArgs e)
    {
        pnlUrunEkle.Visible = true;
    }

    protected void UrunEkleGizle_Click(object sender, EventArgs e)
    {
        pnlUrunEkle.Visible = false;
    }

    protected void btnAra_Click(object sender, EventArgs e)
    {
        Response.Redirect("UrunEkle.aspx?islem=ara&kelime=" + txtAra.Text);
    }

    protected void KategoriGoster_Click(object sender, EventArgs e)
    {
        pnlUrunleriGoster.Visible = true;
    }

    protected void KategoriGizle_Click(object sender, EventArgs e)
    {
        pnlUrunleriGoster.Visible = false;
    }
}