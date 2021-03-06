USE [Algebra]
GO
/****** Object:  Table [dbo].[Predbiljezba]    Script Date: 3.4.2017. 17:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Predbiljezba](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Datum] [datetime2](7) NOT NULL,
	[Ime] [nvarchar](50) NOT NULL,
	[Prezime] [nvarchar](50) NOT NULL,
	[Adresa] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[IdSeminar] [int] NOT NULL,
	[Status] [nvarchar](10) NULL,
	[Kontakt] [nvarchar](15) NULL,
 CONSTRAINT [PK_Predbiljezba] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Predbiljezba] ON 

INSERT [dbo].[Predbiljezba] ([Id], [Datum], [Ime], [Prezime], [Adresa], [Email], [IdSeminar], [Status], [Kontakt]) VALUES (7, CAST(N'2017-03-08 19:52:15.7428100' AS DateTime2), N'Matija', N'Maček', N'Kamenica 27, Lepoglava', N'matijamacek@gmail.com', 1, N'Prihvaćena', N'042701433')
INSERT [dbo].[Predbiljezba] ([Id], [Datum], [Ime], [Prezime], [Adresa], [Email], [IdSeminar], [Status], [Kontakt]) VALUES (8, CAST(N'2017-03-08 19:52:33.8464791' AS DateTime2), N'Mihaela', N'Maček', N'Đure Arnolda 8, Ivanec', N'macekica@gmail.com', 2, N'Prihvaćena', N'098975136')
INSERT [dbo].[Predbiljezba] ([Id], [Datum], [Ime], [Prezime], [Adresa], [Email], [IdSeminar], [Status], [Kontakt]) VALUES (9, CAST(N'2017-03-08 19:52:55.4972177' AS DateTime2), N'Jelena', N'Krtanjek', N'Kamenica 28, Lepoglava', N'jkrtanjek@gmail.com', 8, N'Odbijena', N'054658755')
INSERT [dbo].[Predbiljezba] ([Id], [Datum], [Ime], [Prezime], [Adresa], [Email], [IdSeminar], [Status], [Kontakt]) VALUES (10, CAST(N'2017-03-08 19:53:14.1806816' AS DateTime2), N'Joco', N'Kučenjak', N'Hrvatskih pavlina 3, Lepoglava', N'knjizara.macek@gmail.com', 1, N'Prihvaćena', N'042792352')
INSERT [dbo].[Predbiljezba] ([Id], [Datum], [Ime], [Prezime], [Adresa], [Email], [IdSeminar], [Status], [Kontakt]) VALUES (11, CAST(N'2017-03-08 19:53:33.6073384' AS DateTime2), N'Antonija', N'Kranjčec', N'Višnjica bb, Višnjica', N'apavlicic@gmail.com', 8, N'Odbijena', N'45754856')
INSERT [dbo].[Predbiljezba] ([Id], [Datum], [Ime], [Prezime], [Adresa], [Email], [IdSeminar], [Status], [Kontakt]) VALUES (13, CAST(N'2017-03-09 19:25:13.7968910' AS DateTime2), N'Erik', N'Degen', N'Trpimirova 3', N'degenerik@gmail.com', 2, N'Prihvaćena', N'')
INSERT [dbo].[Predbiljezba] ([Id], [Datum], [Ime], [Prezime], [Adresa], [Email], [IdSeminar], [Status], [Kontakt]) VALUES (14, CAST(N'2017-03-09 20:07:50.3256513' AS DateTime2), N'LeBron', N'James', N'Akron, Ohio', N'lbj@lbj.com', 5, NULL, N'')
INSERT [dbo].[Predbiljezba] ([Id], [Datum], [Ime], [Prezime], [Adresa], [Email], [IdSeminar], [Status], [Kontakt]) VALUES (15, CAST(N'2017-03-09 20:09:33.0031661' AS DateTime2), N'Dwayne', N'Wade', N'Chicago', N'dwade@cg.com', 10, NULL, N'')
SET IDENTITY_INSERT [dbo].[Predbiljezba] OFF
ALTER TABLE [dbo].[Predbiljezba]  WITH CHECK ADD  CONSTRAINT [FK_Predbiljezba_Seminar] FOREIGN KEY([IdSeminar])
REFERENCES [dbo].[Seminar] ([Id])
GO
ALTER TABLE [dbo].[Predbiljezba] CHECK CONSTRAINT [FK_Predbiljezba_Seminar]
GO
