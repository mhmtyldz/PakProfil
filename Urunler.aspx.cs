using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Drawing;
using System.IO;
using System.Web.UI.WebControls;

public partial class Urunler : System.Web.UI.Page
{
    
    Methodlar klas = new Methodlar();
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dtUrunler = klas.GetDataTable("SELECT  dbo.Urun.*, dbo.FiyatTur.FiyatTur FROM  dbo.Urun INNER JOIN" +
                        " dbo.FiyatTur ON dbo.Urun.FiyatTurId = dbo.FiyatTur.FiyatTurId");
        PagedDataSource pds =new PagedDataSource();
        pds.DataSource = dtUrunler.DefaultView;
        pds.AllowPaging = true;
        pds.PageSize =8;
        int sayfa;
        if(Request.QueryString["sayfa"]!=null)
        {
            sayfa = Convert.ToInt32(Request.QueryString["sayfa"]);
        }
        else
        {
            sayfa = 1;
        }
        pds.CurrentPageIndex = sayfa - 1;
        for (int i =1; i <= pds.PageCount; i++)
        {
            HyperLink hyper = new HyperLink();
            hyper.Text = i.ToString();
            hyper.NavigateUrl=("Urunler.aspx?sayfa=" + i.ToString());
            hyper.Attributes["style"] = "width:70px; height:70px; margin-left:20px; font-size:50px; font-weight:bold; text-align:center;  background-color:#d94d3a; color:#fff";
            pnlUrunler.Controls.Add(hyper);
        }


        rpUrunler.DataSource = pds;
        rpUrunler.DataBind();
    }


   
}