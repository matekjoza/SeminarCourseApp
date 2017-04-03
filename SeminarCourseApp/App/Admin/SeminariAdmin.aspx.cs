using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_SeminariAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            PuniKontrole();
        }
    }

    private void PuniKontrole()
    {
        Repository repo = new Repository();
        gvSeminari.DataSource = repo.DohvatSvihSeminara();
        gvSeminari.DataBind();
    }

    protected void btnTrazi_Click(object sender, EventArgs e)
    {
        Repository repo = new Repository();
        gvSeminari.DataSource = repo.SeminarSearch(txtKeyWord.Text);
        gvSeminari.DataBind();
    }

    protected void ddlVrstaSeminara_SelectedIndexChanged(object sender, EventArgs e)
    {
        Repository repo = new Repository();

        int izbor = ddlVrstaSeminara.SelectedIndex;

        if (izbor == 1)
        {
            gvSeminari.DataSource = repo.SeminariPoZatvorenosti(false);
        }
        else if (izbor == 2)
        {
            gvSeminari.DataSource = repo.SeminariPoZatvorenosti(true);
        }
        else if(izbor == 0)
        {
            gvSeminari.DataSource = repo.DohvatSvihSeminara();
        }
        gvSeminari.DataBind();
    }

    protected void btnNoviSeminar_Click(object sender, EventArgs e)
    {
        gvSeminari.Visible = false;
        pnNoviSeminar.Visible = true;
        txtNaziv.Focus();
    }

    protected void btnOdustani_Click(object sender, EventArgs e)
    {
        Response.Redirect("SeminariAdmin.aspx");
    }

    protected void btnSpremi_Click(object sender, EventArgs e)
    {
        Repository repo = new Repository();

        Seminar novi = new Seminar();
        novi.BrojSati = int.Parse(txtBrojSati.Text);
        novi.Cijena = decimal.Parse(txtCijena.Text);
        novi.DatumPocetka = calPocetak.SelectedDate;
        novi.Naziv = txtNaziv.Text;
        novi.Opis = txtOpis.Text;
        novi.Predavac = txtPredavac.Text;
        novi.BrojPredbiljezbi = 0;
        repo.SpremiSeminar(novi);

        Response.Redirect("SeminariAdmin.aspx");
    }

    protected void gvSeminari_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnUpdateSeminar.Visible = true;
        pnUpdateSeminar.Focus();
        Seminar semi = null;
        Repository repo = new Repository();
        string idSeminara = gvSeminari.SelectedDataKey.Value.ToString();
        semi = repo.OdabraniSeminar(idSeminara);

        txtBrojPredbiljezbi_E.Text = semi.BrojPredbiljezbi.ToString();
        txtBrojSati_E.Text = semi.BrojSati.ToString();
        txtCijena_E.Text = semi.Cijena.ToString();
        txtNaziv_E.Text = semi.Naziv;
        txtOpis_E.Text = semi.Opis;
        txtPredavac_E.Text = semi.Predavac;
       
        calPocetak_E.SelectedDate = semi.DatumPocetka;
        chkZatvoren.Checked = semi.Zatvoren;
    }



    protected void btnIzbrisi_E_Click(object sender, EventArgs e)
    {
        Repository repo = new Repository();
        string idSeminara = gvSeminari.SelectedDataKey.Value.ToString();
        repo.BrisanjeSeminara(idSeminara);
        pnUpdateSeminar.Visible = false;
        PuniKontrole();
    }

    protected void btnOdustani_E_Click(object sender, EventArgs e)
    {
        Response.Redirect("SeminariAdmin.aspx");
    }

    protected void btnSpremi_E_Click(object sender, EventArgs e)
    {
        Repository repo = new Repository();
        string idSeminara = gvSeminari.SelectedDataKey.Value.ToString();
        Seminar novi = new Seminar();
        novi.BrojPredbiljezbi = int.Parse(txtBrojPredbiljezbi_E.Text);
        novi.BrojSati = int.Parse(txtBrojSati_E.Text);
        novi.Cijena = decimal.Parse(txtCijena_E.Text);
        novi.Id = int.Parse(idSeminara);
        novi.Naziv = txtNaziv_E.Text;
        novi.Opis = txtOpis_E.Text;
        novi.Predavac = txtPredavac_E.Text;
        novi.Zatvoren = chkZatvoren.Checked;
        novi.DatumPocetka = calPocetak_E.SelectedDate;

        repo.UpdateSeminaraAdmin(novi, idSeminara);
        pnUpdateSeminar.Visible = false;
        PuniKontrole();
    }
}