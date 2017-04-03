using System.Collections.Generic;
using System.Linq;


/// <summary>
/// Summary description for Repository
/// </summary>
public class Repository
{
    private cnnSeminar _db;

    public Repository()
    {
        _db = new cnnSeminar();
    }

    //Dohvat svih otvorenih seminara
    public List<Seminar> OtvoreniSeminari()
    {
        List<Seminar> otvoreniSeminari = null;

        otvoreniSeminari = (from sem in _db.Seminar
                            where sem.Zatvoren == false
                            select sem).ToList();

        return otvoreniSeminari;
    }

    //Pretraživanje seminara
    public List<Seminar> SeminarSearch(string unos)
    {
        unos = unos.ToLower();
        var pretraga = (from sem in _db.Seminar
                        where (sem.Naziv.ToLower().Contains(unos)
                        || sem.Opis.ToLower().Contains(unos)
                        || sem.Predavac.ToLower().Contains(unos)) && sem.Zatvoren == false
                        select sem).ToList();

        return pretraga;
    }

    //Dohvat seminara po ID-u
    public Seminar OdabraniSeminar(string id)
    {
        Seminar semo = (from sem in _db.Seminar
                        where sem.Id.ToString() == id
                        select sem).SingleOrDefault();

        return semo;
    }

    //Update seminara - broj predbiljezbi
    public void UpdateSeminar(string id, int brojPredbiljezbi)
    {
        Seminar semi = OdabraniSeminar(id);
        semi.BrojPredbiljezbi = brojPredbiljezbi;
        _db.SaveChanges();

    }

    public void SpremiPredbiljezbu(Predbiljezba novaPredbiljezba)
    {
        _db.Predbiljezba.Add(novaPredbiljezba);
        _db.SaveChanges();
    }

    //Dohvat predbilježbi i pripadnih seminara
    public List<PredbiljezbeSeminariView> PredbiljezenePredbiljeze()
    {
        List<PredbiljezbeSeminariView> svePredbiljezbe = null;

        var predbiljezbeSeminari = from pr in _db.Predbiljezba
                                   where pr.Seminar.BrojPredbiljezbi > 0
                                   orderby pr.Id
                                   select new PredbiljezbeSeminariView
                                   {
                                       Adresa = pr.Adresa,
                                       Datum = pr.Datum,
                                       Email = pr.Email,
                                       Id = pr.Id,
                                       IdSeminar = pr.Seminar.Id,
                                       Ime = pr.Ime,
                                       Kontakt = pr.Kontakt,
                                       NazivSeminara = pr.Seminar.Naziv,
                                       Prezime = pr.Prezime,
                                       Status = pr.Status
                                   };
        svePredbiljezbe = predbiljezbeSeminari.ToList();
        return svePredbiljezbe;
    }

    //Pretraga predbiljezbi s pripadnim seminarima
    public List<PredbiljezbeSeminariView> PretragaPredbiljezbu(string unos)
    {
        unos = unos.ToLower();

        var pretraga = (from pr in _db.Predbiljezba
                        where pr.Ime.ToLower().Contains(unos)
                        || pr.Prezime.ToLower().Contains(unos)
                        || pr.Adresa.ToLower().Contains(unos)
                        || pr.Email.ToLower().Contains(unos)
                        || pr.Kontakt.ToLower().Contains(unos)
                        || pr.Seminar.Naziv.ToLower().Contains(unos)
                        select new PredbiljezbeSeminariView
                        {
                            Adresa = pr.Adresa,
                            Datum = pr.Datum,
                            Email = pr.Email,
                            Id = pr.Id,
                            IdSeminar = pr.Seminar.Id,
                            Ime = pr.Ime,
                            Kontakt = pr.Kontakt,
                            NazivSeminara = pr.Seminar.Naziv,
                            Prezime = pr.Prezime,
                        }).ToList();

        return pretraga;
    }

    //Dohvat objekta tipa PredbiljezbeSeminariView po ID-u

    public PredbiljezbeSeminariView PredbiljezbaSeminarPoIdu(string id)
    {
        var predbiljezba = (from pr in _db.Predbiljezba
                            where pr.Id.ToString() == id
                            select new PredbiljezbeSeminariView
                            {
                                Adresa = pr.Adresa,
                                Email = pr.Email,
                                Id = pr.Id,
                                IdSeminar = pr.Seminar.Id,
                                Ime = pr.Ime,
                                Kontakt = pr.Kontakt,
                                NazivSeminara = pr.Seminar.Naziv,
                                Prezime = pr.Prezime,
                            }).SingleOrDefault();

        return predbiljezba;
    }

    //Dohvat predbilježbe po IDu
    public Predbiljezba PredbiljezbaPoIdu(string id)
    {
        Predbiljezba pred = (from pr in _db.Predbiljezba
                             where pr.Id.ToString() == id
                             select pr).SingleOrDefault();

        return pred;
    }

    //Update-tanje predbilježbem nakon prihvaćanja ili odbijanja
    public void UpdatePredbiljezbe(string id, string status)
    {
        Predbiljezba pred = PredbiljezbaPoIdu(id);
        pred.Status = status;
        _db.SaveChanges();
    }

    //Brisanje predbilježbe
    public void DeletePredbiljezbe(string id)
    {
        Predbiljezba pred = PredbiljezbaPoIdu(id);
        _db.Predbiljezba.Remove(pred);
        _db.SaveChanges();
    }

    //Dohvat PredbiljezbaSeminarView objekta po vrijenosti atributa Status
    public List<PredbiljezbeSeminariView> PredbiljezbaSeminarPoStatusu(string status)
    {
        var predbiljezba = from pr in _db.Predbiljezba
                           where pr.Status == status
                           select new PredbiljezbeSeminariView
                           {
                               Adresa = pr.Adresa,
                               Email = pr.Email,
                               Id = pr.Id,
                               IdSeminar = pr.Seminar.Id,
                               Ime = pr.Ime,
                               Kontakt = pr.Kontakt,
                               NazivSeminara = pr.Seminar.Naziv,
                               Prezime = pr.Prezime,
                               Status = pr.Status
                           };

        return predbiljezba.ToList();
    }

    //Dohvat svih seminara
    public List<Seminar> DohvatSvihSeminara()
    {
        var seminari = (from sem in _db.Seminar
                        select sem).ToList();
        return seminari;
    }

    //Dohvat seminara po vrijednosti atributa Zatvoren
    public List<Seminar> SeminariPoZatvorenosti(bool zatvoren)
    {
        List<Seminar> seminari = null;
        if (zatvoren)
        {
            seminari = (from sem in _db.Seminar
                        where sem.Zatvoren
                        select sem).ToList();
        }
        else
        {
            seminari = (from sem in _db.Seminar
                        where !sem.Zatvoren
                        select sem).ToList();
        }

        return seminari;
    }

    //Spremanje novog seminara
    public void SpremiSeminar(Seminar semi)
    {
        _db.Seminar.Add(semi);
        _db.SaveChanges();
    }

    //Brisanje seminara
    public void BrisanjeSeminara(string id)
    {
        Seminar semi = OdabraniSeminar(id);
        _db.Seminar.Remove(semi);
        _db.SaveChanges();
    }

    //Update-anje seminara
    public void UpdateSeminaraAdmin(Seminar novi, string id)
    {
        Seminar stari = OdabraniSeminar(id);
        stari.BrojPredbiljezbi = novi.BrojPredbiljezbi;
        stari.BrojSati = novi.BrojSati;
        stari.Cijena = novi.Cijena;
        stari.DatumPocetka = novi.DatumPocetka;
        stari.Id = novi.Id;
        stari.Naziv = novi.Naziv;
        stari.Opis = novi.Opis;
        stari.Predavac = novi.Predavac;
        stari.Zatvoren = novi.Zatvoren;
        _db.SaveChanges();

    }

}