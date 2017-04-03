using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_PredbiljezbeAdmin : System.Web.UI.Page
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
        gvPredbiljezbe.DataSource = repo.PredbiljezenePredbiljeze();
        gvPredbiljezbe.DataBind();
    }

    protected void btnTrazi_Click(object sender, EventArgs e)
    {
        Repository repo = new Repository();
        gvPredbiljezbe.DataSource = repo.PretragaPredbiljezbu(txtKljucnaRijec.Text);
        gvPredbiljezbe.DataBind();

    }

    protected void gvPredbiljezbe_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnPrijava.Visible = true;
        pnPrijava.Focus();
        string idPredbiljezbe = gvPredbiljezbe.SelectedDataKey.Value.ToString();
        Repository repo = new Repository();
        PredbiljezbeSeminariView predbiljezba = repo.PredbiljezbaSeminarPoIdu(idPredbiljezbe);
        txtAdresa.Text = predbiljezba.Adresa;
        txtEmail.Text = predbiljezba.Email;
        txtIme.Text = predbiljezba.Ime;
        txtKontakt.Text = predbiljezba.Kontakt;
        txtNazivSeminara.Text = predbiljezba.NazivSeminara;
        txtPrezime.Text = predbiljezba.Prezime;


    }

    protected void btnOdustani_Click(object sender, EventArgs e)
    {
        Response.Redirect("PredbiljezbeAdmin.aspx");
    }

    protected void btnSpremi_Click(object sender, EventArgs e)
    {
        Repository repo = new Repository();
        string id = gvPredbiljezbe.SelectedDataKey.Value.ToString();
        string status = ddlStatus.SelectedItem.ToString();
        Predbiljezba pred = repo.PredbiljezbaPoIdu(id);
        repo.UpdatePredbiljezbe(id, status);
        pnPrijava.Visible = false;
        Response.Redirect(Request.RawUrl);
    }

    protected void btnObriši_Click(object sender, EventArgs e)
    {
        Repository repo = new Repository();
        string id = gvPredbiljezbe.SelectedDataKey.Value.ToString();

        //Ažuriranje broja predbilježbi po seminaru
        Predbiljezba predbiljezba = repo.PredbiljezbaPoIdu(id);
        string idSeminara = predbiljezba.IdSeminar.ToString();

        Seminar semiZaUpdate = repo.OdabraniSeminar(idSeminara);
        int brojPredbiljezbi = (int)semiZaUpdate.BrojPredbiljezbi;
        brojPredbiljezbi = brojPredbiljezbi - 1;
        repo.UpdateSeminar(idSeminara, brojPredbiljezbi);

        repo.DeletePredbiljezbe(id);

        pnPrijava.Visible = false;
        Response.Redirect(Request.RawUrl);
    }

    protected void ddlVrstaPredbiljezbi_SelectedIndexChanged(object sender, EventArgs e)
    {
        Repository repo = new Repository();
        int idOdabira = ddlVrstaPredbiljezbi.SelectedIndex;
        if (idOdabira == 1)
        {
            gvPredbiljezbe.DataSource = repo.PredbiljezbaSeminarPoStatusu(null);
        }
        else if(idOdabira == 2)
        {
            gvPredbiljezbe.DataSource = repo.PredbiljezbaSeminarPoStatusu("Prihvaćena");
        }
        else if(idOdabira == 3)
        {
            gvPredbiljezbe.DataSource = repo.PredbiljezbaSeminarPoStatusu("Odbijena");
        }
        else if(idOdabira == 0)
        {
            gvPredbiljezbe.DataSource = repo.PredbiljezenePredbiljeze();
        }

        gvPredbiljezbe.DataBind();
    }
}