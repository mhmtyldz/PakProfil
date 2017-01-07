using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminpanel_Duyurular : System.Web.UI.Page
{
    Methodlar klas = new Methodlar(); string islem = ""; string DuyuruId = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        islem = Request.QueryString["islem"];
        DataTable dtDuyurular = klas.GetDataTable("Select * From Duyuru");
        dlDuyuruGoster.DataSource = dtDuyurular;
        dlDuyuruGoster.DataBind();


        if(islem=="sil")
        {
            klas.cmd("Delete From Duyuru Where DuyuruId=" + DuyuruId);
            Response.Redirect("DuyuruEkle.aspx");
        }

    }

    protected void btnDuyuruEkle_Click(object sender, EventArgs e)
    {
        if(txtDuyuruBaslik.Text!="")
        {
            SqlConnection baglanti = klas.baglan();
            SqlCommand cmd = new SqlCommand("insert into Duyuru (DuyuruBaslik,DuyuruIcerik) values(@DuyuruBaslik,@DuyuruIcerik)", baglanti);
            cmd.Parameters.Add("DuyuruBaslik", txtDuyuruBaslik.Text);
            cmd.Parameters.Add("DuyuruIcerik", txtDuyuruIcerik.Text);
            cmd.ExecuteNonQuery();
            Response.Redirect("DuyuruEkle.aspx");
        }

        else
        {
            lblBilgi.Text = "Lütfen Duyuru Baslığını Giriniz";
        }
    }

    protected void DuyuruGoster_Click(object sender, EventArgs e)
    {
        pnlDuyuruEkle.Visible = true;
        
    }

    protected void DuyuruEkleGizle_Click(object sender, EventArgs e)
    {
        pnlDuyuruEkle.Visible = false;
    }

    protected void btnDuyuruGoster_Click(object sender, EventArgs e)
    {
        pnlDuyuruGoster.Visible = true;
    }

    protected void btnDuyuruGizle_Click(object sender, EventArgs e)
    {
        pnlDuyuruGoster.Visible = false;
    }
}