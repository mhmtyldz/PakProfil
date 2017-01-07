using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UrunAyrinti : System.Web.UI.Page
{
    Methodlar klas = new Methodlar(); string UrunId = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        UrunId = Request.QueryString["UrunId"];
        DataTable dtUrun = klas.GetDataTable("SELECT dbo.Urun.*, dbo.Kategori.KategoriAd, dbo.FiyatTur.FiyatTur FROM  dbo.Urun INNER JOIN"+
                         " dbo.Kategori ON dbo.Urun.KategoriId = dbo.Kategori.KategoriId INNER JOIN"+
                         " dbo.FiyatTur ON dbo.Urun.FiyatTurId = dbo.FiyatTur.FiyatTurId Where dbo.Urun.UrunId="+UrunId);
        rpUrunAyrinti.DataSource = dtUrun;
        rpUrunAyrinti.DataBind();

     
            

    }

 
   
}