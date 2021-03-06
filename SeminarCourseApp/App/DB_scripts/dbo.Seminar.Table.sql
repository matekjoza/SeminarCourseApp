USE [Algebra]
GO
/****** Object:  Table [dbo].[Seminar]    Script Date: 3.4.2017. 17:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seminar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](50) NOT NULL,
	[Opis] [nvarchar](500) NULL,
	[DatumPocetka] [date] NOT NULL,
	[Predavac] [nvarchar](50) NOT NULL,
	[BrojSati] [int] NOT NULL,
	[Cijena] [money] NULL,
	[BrojPredbiljezbi] [int] NULL CONSTRAINT [DF_Seminar_BrojPredbiljezbi]  DEFAULT ((0)),
	[Zatvoren] [bit] NOT NULL,
 CONSTRAINT [PK_Seminar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Seminar] ON 

INSERT [dbo].[Seminar] ([Id], [Naziv], [Opis], [DatumPocetka], [Predavac], [BrojSati], [Cijena], [BrojPredbiljezbi], [Zatvoren]) VALUES (1, N'Programer internet aplikacija - C# i ASP.NET', N'Razvoj modernih aplikacija poput web trgovina, društvene aplikacije poput foruma, složene aplikacije prema specifikacijama korisnika, aplikacije za upravljanje sadržajem (CMS), uz učenje osnova manipuliranja bazama podataka.', CAST(N'2017-03-14' AS Date), N'Ivan Ivić', 160, 5500.0000, 2, 1)
INSERT [dbo].[Seminar] ([Id], [Naziv], [Opis], [DatumPocetka], [Predavac], [BrojSati], [Cijena], [BrojPredbiljezbi], [Zatvoren]) VALUES (2, N'Programer internet aplikacija - PHP i MySQL', N'Upoznavanje najraširenije "open-source" platforme za izradu web aplikacija. Kako je struktura i sintaksa jezija relativno jednostavna, a povezivanje s bazama podataka lagano, PHP je jedan od najpoželjnijih programskih jezika današnjice.', CAST(N'2017-03-23' AS Date), N'Miroslav Klemm', 160, 5000.0000, 2, 0)
INSERT [dbo].[Seminar] ([Id], [Naziv], [Opis], [DatumPocetka], [Predavac], [BrojSati], [Cijena], [BrojPredbiljezbi], [Zatvoren]) VALUES (3, N'Programer mobilnih aplikacija - ANDROID', N'Samostalna izrada aplikacija za mobilnu platformu Android, temeljem programskog jezika Java, uz dizajn i implementaciju baza podataka kroz MS SQL, SQLite, Transact SQL. Cilje je razraditi i dizajnirati aplikaciju za mobilnu platformu, te postaviti aplikaciju na servis Google Play.', CAST(N'2017-05-08' AS Date), N'Jasmin Lasić', 180, 8000.0000, 0, 0)
INSERT [dbo].[Seminar] ([Id], [Naziv], [Opis], [DatumPocetka], [Predavac], [BrojSati], [Cijena], [BrojPredbiljezbi], [Zatvoren]) VALUES (5, N'Digitalni marketing u turizmu', N'Učenje osnova digitalnog marketinga, optimizacije web stranica i vođenja AdWords kampanja.', CAST(N'2017-03-20' AS Date), N'Marijan Konjuh', 20, 2500.0000, 1, 0)
INSERT [dbo].[Seminar] ([Id], [Naziv], [Opis], [DatumPocetka], [Predavac], [BrojSati], [Cijena], [BrojPredbiljezbi], [Zatvoren]) VALUES (6, N'CAD specijalist', N'Potpuno svladavanje AutoCAD-ovog sučelja, korištenje naprednih naredbi za crtanje, izrada složenih ravninskih crteža, uz poimanje 3D prostora i snalaženja u njemu.', CAST(N'2017-03-27' AS Date), N'Klementina Narančić', 150, 6000.0000, 0, 0)
INSERT [dbo].[Seminar] ([Id], [Naziv], [Opis], [DatumPocetka], [Predavac], [BrojSati], [Cijena], [BrojPredbiljezbi], [Zatvoren]) VALUES (7, N'Administrator baza podataka', N'Administriranje, razvijanje i implementiranje baze podataka, uz upoznavanje vertikale izrade relacijskog modela baze podataka. Napredno korištenje programskog jezika SQL.', CAST(N'2017-05-08' AS Date), N'Biserka Jukić', 170, 7500.0000, 0, 0)
INSERT [dbo].[Seminar] ([Id], [Naziv], [Opis], [DatumPocetka], [Predavac], [BrojSati], [Cijena], [BrojPredbiljezbi], [Zatvoren]) VALUES (8, N'Knjigovođa', N'Osposobljavanje za vođenje poslovnih knjiga u knjigovodstvenom servisu ili tvrtki. Izrada obračuna plaća, sastavljanje izvještaja za porezne i statističke svrhe, te godišnje porezne prijave.', CAST(N'2017-04-24' AS Date), N'Mario Majkić', 130, 6000.0000, 2, 0)
INSERT [dbo].[Seminar] ([Id], [Naziv], [Opis], [DatumPocetka], [Predavac], [BrojSati], [Cijena], [BrojPredbiljezbi], [Zatvoren]) VALUES (9, N'ECDL operater', N'Samostalno obavljanje poslova na računalu i snalaženje u operativnom sustavu Windows. Upoznavanje osnova MS Office paketa: MS Word, MS Excel, MS Outlook i Internet Explorer.', CAST(N'2017-03-27' AS Date), N'Milorad Krivokapić', 120, 5000.0000, 0, 0)
INSERT [dbo].[Seminar] ([Id], [Naziv], [Opis], [DatumPocetka], [Predavac], [BrojSati], [Cijena], [BrojPredbiljezbi], [Zatvoren]) VALUES (10, N'Voditelj prodaje', N'Upoznavanje uloge prodajnog odjela u malom, srednjem ili velikom poduzeću. Unapređenje komunikacije i vještine slušanja u svrhu ostvarenja ciljeva. Istraživanje i rješavanje prigovora kupaca. Učenje osnova CRM alata.', CAST(N'2017-04-03' AS Date), N'Amalija Mueller', 160, 6000.0000, 1, 0)
SET IDENTITY_INSERT [dbo].[Seminar] OFF
