USE [Algebra]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3.4.2017. 17:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5c322270-7d03-4321-a109-ed7016a2d798', NULL, 0, N'ABQDPqzM/FRXYgAhdMs+BcZ901ynb3n48LLViOnA9dLEHB/yPYZQLmkzLof8OYPCYg==', N'1f633fcb-167a-44e0-8577-0fcf4bcd6a0f', NULL, 0, 0, NULL, 0, 0, N'direktor')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8fa77405-2f9d-4ce2-a68a-2aec590c5414', NULL, 0, N'AEQlULc3SCkJEjn6lSMT5aIb0UFFE6refKJsBVgKg6pzgwkeWFydHvk65LfkNyUJdg==', N'2718ea99-21d4-41c4-96eb-397df167af30', NULL, 0, 0, NULL, 0, 0, N'administrator')
