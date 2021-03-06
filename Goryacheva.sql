USE [master]
GO
/****** Object:  Database [Lombard]    Script Date: 02.07.2022 13:26:00 ******/
CREATE DATABASE [Lombard]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Lombard', FILENAME = N'C:\Users\2020-9\Desktop\MSSQL14.SQLEXPRESS\MSSQL\DATA\Lombard.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Lombard_log', FILENAME = N'C:\Users\2020-9\Desktop\MSSQL14.SQLEXPRESS\MSSQL\DATA\Lombard_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Lombard] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Lombard].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Lombard] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Lombard] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Lombard] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Lombard] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Lombard] SET ARITHABORT OFF 
GO
ALTER DATABASE [Lombard] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Lombard] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Lombard] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Lombard] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Lombard] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Lombard] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Lombard] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Lombard] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Lombard] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Lombard] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Lombard] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Lombard] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Lombard] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Lombard] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Lombard] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Lombard] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Lombard] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Lombard] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Lombard] SET  MULTI_USER 
GO
ALTER DATABASE [Lombard] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Lombard] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Lombard] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Lombard] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Lombard] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Lombard] SET QUERY_STORE = OFF
GO
USE [Lombard]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 02.07.2022 13:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id_Client] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Phone] [nvarchar](11) NULL,
	[Passport] [nvarchar](50) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id_Client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoodsSold]    Script Date: 02.07.2022 13:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsSold](
	[Id_GoodsSold] [int] IDENTITY(1,1) NOT NULL,
	[Id_Sotrudnik] [int] NULL,
	[DateOsSale] [datetime] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_GoodsSold] PRIMARY KEY CLUSTERED 
(
	[Id_GoodsSold] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grafik]    Script Date: 02.07.2022 13:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grafik](
	[Id_Grafik] [int] IDENTITY(1,1) NOT NULL,
	[Id_Sotrudnik] [int] NULL,
	[Id_Status] [int] NULL,
	[Sum] [float] NULL,
	[DueDateForPayment] [datetime] NULL,
	[ActualDateForPayment] [datetime] NULL,
 CONSTRAINT [PK_Grafik] PRIMARY KEY CLUSTERED 
(
	[Id_Grafik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 02.07.2022 13:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id_Products] [int] IDENTITY(1,1) NOT NULL,
	[Id_Sotrudnik] [int] NULL,
	[Id_Client] [int] NULL,
	[NameProducts] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[DeliveryDate] [datetime] NULL,
	[AssessedValue] [float] NULL,
	[BailAmount] [float] NULL,
	[SumVikup] [float] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id_Products] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sotrudnik]    Script Date: 02.07.2022 13:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sotrudnik](
	[Id_Sotrudnik] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Sotrudnik] PRIMARY KEY CLUSTERED 
(
	[Id_Sotrudnik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 02.07.2022 13:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id_Status] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id_Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([Id_Client], [Surname], [Name], [Patronymic], [Phone], [Passport]) VALUES (1, N'Горячева', N'Валерия', N'Ильинична', N'89137664523', N'125858 1475')
INSERT [dbo].[Client] ([Id_Client], [Surname], [Name], [Patronymic], [Phone], [Passport]) VALUES (2, N'Великанова', N'Марина ', N'Михайловна', N'89137485748', N'147828 2525')
INSERT [dbo].[Client] ([Id_Client], [Surname], [Name], [Patronymic], [Phone], [Passport]) VALUES (3, N'Голубева', N'Мария', N'Александровна', N'85248924524', N'147265 2561')
INSERT [dbo].[Client] ([Id_Client], [Surname], [Name], [Patronymic], [Phone], [Passport]) VALUES (4, N'Ермакова ', N'Валерия', N'Борисовна', N'86554325636', N'254624 2453')
INSERT [dbo].[Client] ([Id_Client], [Surname], [Name], [Patronymic], [Phone], [Passport]) VALUES (5, N'Климова ', N'Анастасия', N'Олеговна', N'89245225365', N'245236 2565')
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[GoodsSold] ON 

INSERT [dbo].[GoodsSold] ([Id_GoodsSold], [Id_Sotrudnik], [DateOsSale], [Price]) VALUES (1, 2, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 4500)
SET IDENTITY_INSERT [dbo].[GoodsSold] OFF
GO
SET IDENTITY_INSERT [dbo].[Grafik] ON 

INSERT [dbo].[Grafik] ([Id_Grafik], [Id_Sotrudnik], [Id_Status], [Sum], [DueDateForPayment], [ActualDateForPayment]) VALUES (1, 1, 1, 1500, CAST(N'2022-06-12T00:00:00.000' AS DateTime), CAST(N'2022-05-14T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Grafik] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id_Products], [Id_Sotrudnik], [Id_Client], [NameProducts], [Type], [DeliveryDate], [AssessedValue], [BailAmount], [SumVikup]) VALUES (1, 2, 4, N'Часы', N'Украшения', CAST(N'2021-06-12T00:00:00.000' AS DateTime), 1250, 1200, 500)
INSERT [dbo].[Products] ([Id_Products], [Id_Sotrudnik], [Id_Client], [NameProducts], [Type], [DeliveryDate], [AssessedValue], [BailAmount], [SumVikup]) VALUES (2, 1, 2, N'Сережки', N'Украшения', CAST(N'2022-02-15T00:00:00.000' AS DateTime), 5000, 3500, 1250)
INSERT [dbo].[Products] ([Id_Products], [Id_Sotrudnik], [Id_Client], [NameProducts], [Type], [DeliveryDate], [AssessedValue], [BailAmount], [SumVikup]) VALUES (3, 3, 5, N'Телефон', N'Техника', CAST(N'2022-04-25T00:00:00.000' AS DateTime), 10000, 5000, 2500)
INSERT [dbo].[Products] ([Id_Products], [Id_Sotrudnik], [Id_Client], [NameProducts], [Type], [DeliveryDate], [AssessedValue], [BailAmount], [SumVikup]) VALUES (4, 4, 1, N'Ноутбук', N'Техника', CAST(N'2022-08-14T00:00:00.000' AS DateTime), 25000, 15000, 5000)
INSERT [dbo].[Products] ([Id_Products], [Id_Sotrudnik], [Id_Client], [NameProducts], [Type], [DeliveryDate], [AssessedValue], [BailAmount], [SumVikup]) VALUES (5, 5, 3, N'Кольцо', N'Украшения', CAST(N'2022-06-14T00:00:00.000' AS DateTime), 3650, 1000, 1000)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Sotrudnik] ON 

INSERT [dbo].[Sotrudnik] ([Id_Sotrudnik], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (1, N'Михайлов', N'Олег', N'Олегович', N'Oleg', N'Oleg')
INSERT [dbo].[Sotrudnik] ([Id_Sotrudnik], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (2, N'Смирнова', N'Анна', N'Николаевна', N'Anna', N'Anna')
INSERT [dbo].[Sotrudnik] ([Id_Sotrudnik], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (3, N'Петров ', N'Иван ', N'Иваныч', N'Ivan', N'Ivan')
INSERT [dbo].[Sotrudnik] ([Id_Sotrudnik], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (4, N'Иванова', N'Ольга', N'Сергеевна', N'Olga', N'Olga')
INSERT [dbo].[Sotrudnik] ([Id_Sotrudnik], [Surname], [Name], [Patronymic], [Login], [Password]) VALUES (5, N'Петрова', N'Мария', N'Владимировна', N'Maria', N'Maria')
SET IDENTITY_INSERT [dbo].[Sotrudnik] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id_Status], [Name]) VALUES (1, N'Принят')
INSERT [dbo].[Status] ([Id_Status], [Name]) VALUES (2, N'Просрочен')
INSERT [dbo].[Status] ([Id_Status], [Name]) VALUES (3, N'Отменен')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
ALTER TABLE [dbo].[GoodsSold]  WITH CHECK ADD  CONSTRAINT [FK_GoodsSold_Sotrudnik] FOREIGN KEY([Id_Sotrudnik])
REFERENCES [dbo].[Sotrudnik] ([Id_Sotrudnik])
GO
ALTER TABLE [dbo].[GoodsSold] CHECK CONSTRAINT [FK_GoodsSold_Sotrudnik]
GO
ALTER TABLE [dbo].[Grafik]  WITH CHECK ADD  CONSTRAINT [FK_Grafik_Sotrudnik] FOREIGN KEY([Id_Sotrudnik])
REFERENCES [dbo].[Sotrudnik] ([Id_Sotrudnik])
GO
ALTER TABLE [dbo].[Grafik] CHECK CONSTRAINT [FK_Grafik_Sotrudnik]
GO
ALTER TABLE [dbo].[Grafik]  WITH CHECK ADD  CONSTRAINT [FK_Grafik_Status] FOREIGN KEY([Id_Status])
REFERENCES [dbo].[Status] ([Id_Status])
GO
ALTER TABLE [dbo].[Grafik] CHECK CONSTRAINT [FK_Grafik_Status]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Client] FOREIGN KEY([Id_Client])
REFERENCES [dbo].[Client] ([Id_Client])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Client]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Sotrudnik] FOREIGN KEY([Id_Sotrudnik])
REFERENCES [dbo].[Sotrudnik] ([Id_Sotrudnik])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Sotrudnik]
GO
USE [master]
GO
ALTER DATABASE [Lombard] SET  READ_WRITE 
GO
