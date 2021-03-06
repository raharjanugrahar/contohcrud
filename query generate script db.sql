USE [master]
GO
/****** Object:  Database [assessmentdb]    Script Date: 2/1/2021 8:28:35 PM ******/
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
ALTER DATABASE [assessmentdb] SET  DISABLE_BROKER 
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
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [assessmentdb]
GO
/****** Object:  Table [dbo].[ltcourierfee]    Script Date: 2/1/2021 8:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ltcourierfee](
	[CourierID] [int] IDENTITY(1,1) NOT NULL,
	[StartKg] [int] NULL,
	[WeightID] [int] NULL,
	[EndKg] [int] NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ltcourierfee] PRIMARY KEY CLUSTERED 
(
	[CourierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mscourier]    Script Date: 2/1/2021 8:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mscourier](
	[CourierID] [int] IDENTITY(1,1) NOT NULL,
	[CourierName] [nvarchar](50) NULL,
 CONSTRAINT [PK_mscourier] PRIMARY KEY CLUSTERED 
(
	[CourierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mspayment]    Script Date: 2/1/2021 8:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mspayment](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentName] [nvarchar](50) NULL,
 CONSTRAINT [PK_mspayment] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[msproduct]    Script Date: 2/1/2021 8:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msproduct](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NULL,
	[Weight] [float] NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_msproduct] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mssales]    Script Date: 2/1/2021 8:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mssales](
	[SalesID] [int] IDENTITY(1,1) NOT NULL,
	[SalesName] [nvarchar](max) NULL,
 CONSTRAINT [PK_mssales] PRIMARY KEY CLUSTERED 
(
	[SalesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[trinvoice]    Script Date: 2/1/2021 8:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trinvoice](
	[InvoiceNo] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceDate] [smalldatetime] NULL,
	[InvoiceTo] [nvarchar](max) NULL,
	[ShipTo] [nvarchar](max) NULL,
	[SalesID] [int] NULL,
	[CourierID] [int] NULL,
	[PaymentType] [int] NULL,
	[CourierFee] [decimal](18, 0) NULL,
 CONSTRAINT [PK_\] PRIMARY KEY CLUSTERED 
(
	[InvoiceNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[trinvoicedetail]    Script Date: 2/1/2021 8:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trinvoicedetail](
	[InvoiceNo] [int] NULL,
	[ProductID] [int] NULL,
	[Weight] [float] NULL,
	[Qty] [int] NULL,
	[Price] [decimal](18, 0) NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[mscourier] ON 

GO
INSERT [dbo].[mscourier] ([CourierID], [CourierName]) VALUES (1, N'JNE')
GO
INSERT [dbo].[mscourier] ([CourierID], [CourierName]) VALUES (2, N'J&T')
GO
INSERT [dbo].[mscourier] ([CourierID], [CourierName]) VALUES (3, N'Wahana')
GO
SET IDENTITY_INSERT [dbo].[mscourier] OFF
GO
SET IDENTITY_INSERT [dbo].[mspayment] ON 

GO
INSERT [dbo].[mspayment] ([PaymentID], [PaymentName]) VALUES (1, N'Cash')
GO
INSERT [dbo].[mspayment] ([PaymentID], [PaymentName]) VALUES (2, N'COD')
GO
SET IDENTITY_INSERT [dbo].[mspayment] OFF
GO
SET IDENTITY_INSERT [dbo].[msproduct] ON 

GO
INSERT [dbo].[msproduct] ([ProductID], [ProductName], [Weight], [Price]) VALUES (1, N'Tepung', 1.5, CAST(10000 AS Decimal(18, 0)))
GO
INSERT [dbo].[msproduct] ([ProductID], [ProductName], [Weight], [Price]) VALUES (2, N'Bluband', 0.25, CAST(8000 AS Decimal(18, 0)))
GO
INSERT [dbo].[msproduct] ([ProductID], [ProductName], [Weight], [Price]) VALUES (3, N'Beras', 1, CAST(64000 AS Decimal(18, 0)))
GO
INSERT [dbo].[msproduct] ([ProductID], [ProductName], [Weight], [Price]) VALUES (4, N'Eskrim', 0.5, CAST(20000 AS Decimal(18, 0)))
GO
INSERT [dbo].[msproduct] ([ProductID], [ProductName], [Weight], [Price]) VALUES (5, N'Kentang', 1, CAST(15000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[msproduct] OFF
GO
SET IDENTITY_INSERT [dbo].[mssales] ON 

GO
INSERT [dbo].[mssales] ([SalesID], [SalesName]) VALUES (1, N'Andy')
GO
INSERT [dbo].[mssales] ([SalesID], [SalesName]) VALUES (2, N'Jessica')
GO
SET IDENTITY_INSERT [dbo].[mssales] OFF
GO
SET IDENTITY_INSERT [dbo].[trinvoice] ON 

GO
INSERT [dbo].[trinvoice] ([InvoiceNo], [InvoiceDate], [InvoiceTo], [ShipTo], [SalesID], [CourierID], [PaymentType], [CourierFee]) VALUES (1, CAST(N'2015-06-23T00:00:00' AS SmallDateTime), N'Invoice Orang 1', N'Ship Orang 1', 1, 1, 1, CAST(0 AS Decimal(18, 0)))
GO
INSERT [dbo].[trinvoice] ([InvoiceNo], [InvoiceDate], [InvoiceTo], [ShipTo], [SalesID], [CourierID], [PaymentType], [CourierFee]) VALUES (2, CAST(N'2019-02-27T00:00:00' AS SmallDateTime), N'Invoice Orang 2', N'Ship Orang 2', 2, 2, 2, CAST(0 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[trinvoice] OFF
GO
INSERT [dbo].[trinvoicedetail] ([InvoiceNo], [ProductID], [Weight], [Qty], [Price]) VALUES (1, 1, 1.5, 3, CAST(10000 AS Decimal(18, 0)))
GO
INSERT [dbo].[trinvoicedetail] ([InvoiceNo], [ProductID], [Weight], [Qty], [Price]) VALUES (1, 7, 0.25, 1, CAST(8000 AS Decimal(18, 0)))
GO
INSERT [dbo].[trinvoicedetail] ([InvoiceNo], [ProductID], [Weight], [Qty], [Price]) VALUES (1, 9, 2, 3, CAST(64000 AS Decimal(18, 0)))
GO
INSERT [dbo].[trinvoicedetail] ([InvoiceNo], [ProductID], [Weight], [Qty], [Price]) VALUES (2, 7, 0.25, 1, CAST(8000 AS Decimal(18, 0)))
GO
INSERT [dbo].[trinvoicedetail] ([InvoiceNo], [ProductID], [Weight], [Qty], [Price]) VALUES (2, 10, 0.5, 3, CAST(20000 AS Decimal(18, 0)))
GO
INSERT [dbo].[trinvoicedetail] ([InvoiceNo], [ProductID], [Weight], [Qty], [Price]) VALUES (2, 9, 2, 2, CAST(64000 AS Decimal(18, 0)))
GO
USE [master]
GO
ALTER DATABASE [assessmentdb] SET  READ_WRITE 
GO
