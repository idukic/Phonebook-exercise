/*
*
*   MANUALLY CREATE DATABASE AND EXECUTE THIS SCRIPT!!!
*
*/

CREATE TABLE [dbo].[Persons](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhoneNumbers]    Script Date: 10.4.2014. 18:15:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneNumbers](
	[PhoneID] [int] IDENTITY(1,1) NOT NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[PersonID] [int] NOT NULL,
 CONSTRAINT [PK_PhoneNumbers] PRIMARY KEY CLUSTERED 
(
	[PhoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Persons] ON 

INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName]) VALUES (1, N'Ana', N'Anders')
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName]) VALUES (2, N'Bill', N'Bennett')
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName]) VALUES (3, N'Cloe', N'Cruz')
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName]) VALUES (4, N'Diego', N'Dewey')
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName]) VALUES (5, N'Ena', N'Ebihan')
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName]) VALUES (6, N'Fran', N'Feuer')
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName]) VALUES (7, N'Giovanni', N'Gavelli')
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName]) VALUES (8, N'Hari', N'Humar')
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName]) VALUES (9, N'Isabel', N'Ian')
INSERT [dbo].[Persons] ([PersonID], [FirstName], [LastName]) VALUES (10, N'Joseph', N'Jacks')
SET IDENTITY_INSERT [dbo].[Persons] OFF
SET IDENTITY_INSERT [dbo].[PhoneNumbers] ON 

INSERT [dbo].[PhoneNumbers] ([PhoneID], [PhoneNumber], [PersonID]) VALUES (1, N'555-0111', 1)
INSERT [dbo].[PhoneNumbers] ([PhoneID], [PhoneNumber], [PersonID]) VALUES (2, N'555-0122', 1)
INSERT [dbo].[PhoneNumbers] ([PhoneID], [PhoneNumber], [PersonID]) VALUES (3, N'555-0211', 2)
INSERT [dbo].[PhoneNumbers] ([PhoneID], [PhoneNumber], [PersonID]) VALUES (4, N'555-0311', 3)
INSERT [dbo].[PhoneNumbers] ([PhoneID], [PhoneNumber], [PersonID]) VALUES (6, N'555-0411', 4)
INSERT [dbo].[PhoneNumbers] ([PhoneID], [PhoneNumber], [PersonID]) VALUES (7, N'555-0422', 4)
INSERT [dbo].[PhoneNumbers] ([PhoneID], [PhoneNumber], [PersonID]) VALUES (8, N'555-0433', 4)
INSERT [dbo].[PhoneNumbers] ([PhoneID], [PhoneNumber], [PersonID]) VALUES (9, N'555-0511', 5)
INSERT [dbo].[PhoneNumbers] ([PhoneID], [PhoneNumber], [PersonID]) VALUES (10, N'555-0611', 6)
INSERT [dbo].[PhoneNumbers] ([PhoneID], [PhoneNumber], [PersonID]) VALUES (11, N'555-0622', 6)
INSERT [dbo].[PhoneNumbers] ([PhoneID], [PhoneNumber], [PersonID]) VALUES (12, N'555-0711', 7)
INSERT [dbo].[PhoneNumbers] ([PhoneID], [PhoneNumber], [PersonID]) VALUES (13, N'555-0722', 7)
INSERT [dbo].[PhoneNumbers] ([PhoneID], [PhoneNumber], [PersonID]) VALUES (14, N'555-0811', 8)
INSERT [dbo].[PhoneNumbers] ([PhoneID], [PhoneNumber], [PersonID]) VALUES (15, N'555-0911', 9)
INSERT [dbo].[PhoneNumbers] ([PhoneID], [PhoneNumber], [PersonID]) VALUES (16, N'555-0922', 9)
INSERT [dbo].[PhoneNumbers] ([PhoneID], [PhoneNumber], [PersonID]) VALUES (17, N'555-1011', 10)
SET IDENTITY_INSERT [dbo].[PhoneNumbers] OFF
ALTER TABLE [dbo].[PhoneNumbers]  WITH CHECK ADD  CONSTRAINT [FK_PhoneNumbers_PhoneNumbers] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Persons] ([PersonID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhoneNumbers] CHECK CONSTRAINT [FK_PhoneNumbers_PhoneNumbers]
GO
USE [master]
GO
ALTER DATABASE [Phonebook] SET  READ_WRITE 
GO
