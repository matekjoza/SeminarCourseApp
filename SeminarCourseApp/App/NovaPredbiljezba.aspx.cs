using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NovaPredbiljezba : System.Web.UI.Page
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
        gvSeminari.DataSource = repo.OtvoreniSeminari();
        gvSeminari.DataBind();
    }

    protected void btnTrazi_Click(object sender, EventArgs e)
    {
        Repository repo = new Repository();
        gvSeminari.DataSource = repo.SeminarSearch(txtNazivSeminara.Text);
        gvSeminari.DataBind();
    }

    protected void gvSeminari_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnPrijava.Visible = true;
        pnPrijava.Focus();


    }

    protected void btnPrijavi_Click(object sender, EventArgs e)
    {
        //Pražnjenje kontrola prilikom odabira seminara
        string idSeminara = gvSeminari.SelectedDataKey.Value.ToString();
        Repository repo = new Repository();
        Seminar semi = repo.OdabraniSeminar(idSeminara);
        Predbiljezba nova = new Predbiljezba();

        //Dodavanje unesenih parametara novokreiranoj predbiljećbi
        nova.Adresa = txtAdresa.Text;
        nova.Datum = DateTime.Now;
        nova.Email = txtEmail.Text;
        nova.IdSeminar = int.Parse(idSeminara);
        nova.Ime = txtIme.Text;
        nova.Prezime = txtPrezime.Text;
        nova.Kontakt = txtKontakt.Text;

        //Postavljanje broja predbiljezbi na odgovarajuću vrijednost
        int brojacPrijava = (int)semi.BrojPredbiljezbi;
        brojacPrijava = brojacPrijava + 1;

        //Ažuriranje seminara i spremanje predbilježbe
        repo.UpdateSeminar(idSeminara, brojacPrijava);
        repo.SpremiPredbiljezbu(nova);
        PrazniKontrole();
        pnPrijava.Visible = false;

        //Ispis statusa

        glavninaStranice.Visible = false;
        prijava.Visible = true;


    }

    private void PrazniKontrole()
    {
        txtAdresa.Text = "";
        txtEmail.Text = "";
        txtIme.Text = "";
        txtKontakt.Text = "";
        txtPrezime.Text = "";
    }

    protected void btnOdustani_Click(object sender, EventArgs e)
    {
        Response.Redirect("NovaPredbiljezba.aspx");
    }

    protected void btnOk_Click(object sender, EventArgs e)
    {
        Response.Redirect("NovaPredbiljezba.aspx");
    }
}