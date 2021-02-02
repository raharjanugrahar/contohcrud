USE [master]
GO
/****** Object:  Database [assessmentdb]    Script Date: 1/26/2021 6:06:58 PM ******/
CREATE DATABASE [assessmentdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'assessmentdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\assessmentdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'assessmentdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\assessmentdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [assessmentdb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [assessmentdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [assessmentdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [assessmentdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [assessmentdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [assessmentdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [assessmentdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [assessmentdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [assessmentdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [assessmentdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [assessmentdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [assessmentdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [assessmentdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [assessmentdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [assessmentdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [assessmentdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [assessmentdb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [assessmentdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [assessmentdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [assessmentdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [assessmentdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [assessmentdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [assessmentdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [assessmentdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [assessmentdb] SET RECOVERY FULL 
GO
ALTER DATABASE [assessmentdb] SET  MULTI_USER 
GO
ALTER DATABASE [assessmentdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [assessmentdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [assessmentdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [assessmentdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [assessmentdb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'assessmentdb', N'ON'
GO
ALTER DATABASE [assessmentdb] SET QUERY_STORE = OFF
GO
USE [assessmentdb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [assessmentdb]
GO
/****** Object:  Table [dbo].[ltcourierfee]    Script Date: 1/26/2021 6:06:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ltcourierfee](
	[WeightID] [int] NOT NULL,
	[CourierID] [int] NOT NULL,
	[StartKg] [int] NOT NULL,
	[EndKg] [int] NULL,
	[Price] [decimal](10, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mscourier]    Script Date: 1/26/2021 6:06:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mscourier](
	[CourierID] [int] NOT NULL,
	[CourierName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CourierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mspayment]    Script Date: 1/26/2021 6:06:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mspayment](
	[PaymentID] [int] NOT NULL,
	[PaymentName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[msproduct]    Script Date: 1/26/2021 6:06:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msproduct](
	[ProductID] [int] NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[Weight] [float] NOT NULL,
	[Price] [decimal](10, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mssales]    Script Date: 1/26/2021 6:06:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mssales](
	[SalesID] [int] NOT NULL,
	[SalesName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trinvoice]    Script Date: 1/26/2021 6:06:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trinvoice](
	[InvoiceNo] [varchar](10) NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[InvoiceTo] [varchar](500) NOT NULL,
	[ShipTo] [varchar](500) NOT NULL,
	[SalesID] [int] NOT NULL,
	[CourierID] [int] NOT NULL,
	[PaymentType] [int] NOT NULL,
	[CourierFee] [decimal](10, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trinvoicedetail]    Script Date: 1/26/2021 6:06:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trinvoicedetail](
	[InvoiceNo] [varchar](10) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Weight] [float] NOT NULL,
	[Qty] [smallint] NOT NULL,
	[Price] [decimal](10, 0) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[ltcourierfee] ([WeightID], [CourierID], [StartKg], [EndKg], [Price]) VALUES (1, 1, 1, 2, CAST(8000 AS Decimal(10, 0)))
GO
INSERT [dbo].[ltcourierfee] ([WeightID], [CourierID], [StartKg], [EndKg], [Price]) VALUES (2, 1, 3, 4, CAST(9500 AS Decimal(10, 0)))
GO
INSERT [dbo].[ltcourierfee] ([WeightID], [CourierID], [StartKg], [EndKg], [Price]) VALUES (3, 2, 1, 2, CAST(7500 AS Decimal(10, 0)))
GO
INSERT [dbo].[ltcourierfee] ([WeightID], [CourierID], [StartKg], [EndKg], [Price]) VALUES (4, 2, 3, 4, CAST(8500 AS Decimal(10, 0)))
GO
INSERT [dbo].[ltcourierfee] ([WeightID], [CourierID], [StartKg], [EndKg], [Price]) VALUES (5, 3, 1, 2, CAST(10000 AS Decimal(10, 0)))
GO
INSERT [dbo].[ltcourierfee] ([WeightID], [CourierID], [StartKg], [EndKg], [Price]) VALUES (6, 3, 3, 4, CAST(10000 AS Decimal(10, 0)))
GO
INSERT [dbo].[ltcourierfee] ([WeightID], [CourierID], [StartKg], [EndKg], [Price]) VALUES (7, 1, 5, 10, CAST(10500 AS Decimal(10, 0)))
GO
INSERT [dbo].[ltcourierfee] ([WeightID], [CourierID], [StartKg], [EndKg], [Price]) VALUES (8, 2, 5, 10, CAST(9500 AS Decimal(10, 0)))
GO
INSERT [dbo].[ltcourierfee] ([WeightID], [CourierID], [StartKg], [EndKg], [Price]) VALUES (9, 3, 5, 10, CAST(12000 AS Decimal(10, 0)))
GO
INSERT [dbo].[mscourier] ([CourierID], [CourierName]) VALUES (1, N'JNE')
GO
INSERT [dbo].[mscourier] ([CourierID], [CourierName]) VALUES (2, N'J&T')
GO
INSERT [dbo].[mscourier] ([CourierID], [CourierName]) VALUES (3, N'Wahana')
GO
INSERT [dbo].[mspayment] ([PaymentID], [PaymentName]) VALUES (1, N'Cash')
GO
INSERT [dbo].[mspayment] ([PaymentID], [PaymentName]) VALUES (2, N'COD')
GO
INSERT [dbo].[msproduct] ([ProductID], [ProductName], [Weight], [Price]) VALUES (1, N'Tepung', 1.5, CAST(10000 AS Decimal(10, 0)))
GO
INSERT [dbo].[msproduct] ([ProductID], [ProductName], [Weight], [Price]) VALUES (7, N'Bluband', 0.25, CAST(8000 AS Decimal(10, 0)))
GO
INSERT [dbo].[msproduct] ([ProductID], [ProductName], [Weight], [Price]) VALUES (9, N'Beras', 1, CAST(64000 AS Decimal(10, 0)))
GO
INSERT [dbo].[msproduct] ([ProductID], [ProductName], [Weight], [Price]) VALUES (10, N'Eskrim', 0.5, CAST(20000 AS Decimal(10, 0)))
GO
INSERT [dbo].[msproduct] ([ProductID], [ProductName], [Weight], [Price]) VALUES (11, N'Kentang', 1, CAST(15000 AS Decimal(10, 0)))
GO
INSERT [dbo].[mssales] ([SalesID], [SalesName]) VALUES (1, N'Andy')
GO
INSERT [dbo].[mssales] ([SalesID], [SalesName]) VALUES (2, N'Jessica')
GO
INSERT [dbo].[trinvoice] ([InvoiceNo], [InvoiceDate], [InvoiceTo], [ShipTo], [SalesID], [CourierID], [PaymentType], [CourierFee]) VALUES (N'IN0001', CAST(N'2015-06-23T00:00:00.000' AS DateTime), N'Invoice Orang 1', N'Ship Orang 1', 1, 1, 1, CAST(0 AS Decimal(10, 0)))
GO
INSERT [dbo].[trinvoice] ([InvoiceNo], [InvoiceDate], [InvoiceTo], [ShipTo], [SalesID], [CourierID], [PaymentType], [CourierFee]) VALUES (N'IN0002', CAST(N'2019-02-27T00:00:00.000' AS DateTime), N'Invoice Orang 2', N'Ship Orang 2', 2, 2, 2, CAST(0 AS Decimal(10, 0)))
GO
INSERT [dbo].[trinvoicedetail] ([InvoiceNo], [ProductID], [Weight], [Qty], [Price]) VALUES (N'IN0001', 1, 1.5, 3, CAST(10000 AS Decimal(10, 0)))
GO
INSERT [dbo].[trinvoicedetail] ([InvoiceNo], [ProductID], [Weight], [Qty], [Price]) VALUES (N'IN0001', 7, 0.25, 1, CAST(8000 AS Decimal(10, 0)))
GO
INSERT [dbo].[trinvoicedetail] ([InvoiceNo], [ProductID], [Weight], [Qty], [Price]) VALUES (N'IN0001', 9, 2, 3, CAST(64000 AS Decimal(10, 0)))
GO
INSERT [dbo].[trinvoicedetail] ([InvoiceNo], [ProductID], [Weight], [Qty], [Price]) VALUES (N'IN0002', 7, 0.25, 1, CAST(8000 AS Decimal(10, 0)))
GO
INSERT [dbo].[trinvoicedetail] ([InvoiceNo], [ProductID], [Weight], [Qty], [Price]) VALUES (N'IN0002', 10, 0.5, 3, CAST(20000 AS Decimal(10, 0)))
GO
INSERT [dbo].[trinvoicedetail] ([InvoiceNo], [ProductID], [Weight], [Qty], [Price]) VALUES (N'IN0002', 9, 2, 2, CAST(64000 AS Decimal(10, 0)))
GO
ALTER TABLE [dbo].[ltcourierfee] ADD  DEFAULT (NULL) FOR [EndKg]
GO
ALTER TABLE [dbo].[ltcourierfee] ADD  DEFAULT (NULL) FOR [Price]
GO
ALTER TABLE [dbo].[ltcourierfee]  WITH CHECK ADD  CONSTRAINT [FK_ltcourierfee_mscourier] FOREIGN KEY([CourierID])
REFERENCES [dbo].[mscourier] ([CourierID])
GO
ALTER TABLE [dbo].[ltcourierfee] CHECK CONSTRAINT [FK_ltcourierfee_mscourier]
GO
ALTER TABLE [dbo].[trinvoice]  WITH CHECK ADD  CONSTRAINT [FK_trinvoice_mscourier] FOREIGN KEY([CourierID])
REFERENCES [dbo].[mscourier] ([CourierID])
GO
ALTER TABLE [dbo].[trinvoice] CHECK CONSTRAINT [FK_trinvoice_mscourier]
GO
ALTER TABLE [dbo].[trinvoice]  WITH CHECK ADD  CONSTRAINT [FK_trinvoice_mssales] FOREIGN KEY([SalesID])
REFERENCES [dbo].[mssales] ([SalesID])
GO
ALTER TABLE [dbo].[trinvoice] CHECK CONSTRAINT [FK_trinvoice_mssales]
GO
ALTER TABLE [dbo].[trinvoicedetail]  WITH CHECK ADD  CONSTRAINT [FK_trinvoicedetail_msproduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[msproduct] ([ProductID])
GO
ALTER TABLE [dbo].[trinvoicedetail] CHECK CONSTRAINT [FK_trinvoicedetail_msproduct]
GO
ALTER TABLE [dbo].[trinvoicedetail]  WITH CHECK ADD  CONSTRAINT [FK_trinvoicedetail_trinvoice] FOREIGN KEY([InvoiceNo])
REFERENCES [dbo].[trinvoice] ([InvoiceNo])
GO
ALTER TABLE [dbo].[trinvoicedetail] CHECK CONSTRAINT [FK_trinvoicedetail_trinvoice]
GO
USE [master]
GO
ALTER DATABASE [assessmentdb] SET  READ_WRITE 
GO
