using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    Methodlar klas = new Methodlar();
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dtUrunler = klas.GetDataTable("Select Top 7 * From Urun Order By[UrunId] desc");
        rpEnCokUrunler.DataSource = dtUrunler;
        rpEnCokUrunler.DataBind();

        DataTable dtKategoriler = klas.GetDataTable("Select KategoriAd From Kategori ");
        rpKategori.DataSource = dtKategoriler;
        rpKategori.DataBind();

        DataTable dtUrunler2 = klas.GetDataTable("Select Top 5 * From Urun Order By[UrunAdet] desc");
        rpSonEklenenUrunler.DataSource = dtUrunler2;
        rpSonEklenenUrunler.DataBind();

        DataTable dtDuyurular = klas.GetDataTable("Select Top 3 * From Duyuru Order By[DuyuruTarih] desc");
        rpDuyurular.DataSource = dtDuyurular;
        rpDuyurular.DataBind();

    }
}