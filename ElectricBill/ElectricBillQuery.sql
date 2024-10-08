USE [master]
GO
/****** Object:  Database [ElectricBill]    Script Date: 9/29/2024 11:26:44 PM ******/
CREATE DATABASE [ElectricBill]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'myProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\myProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'myProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\myProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ElectricBill] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ElectricBill].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ElectricBill] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ElectricBill] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ElectricBill] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ElectricBill] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ElectricBill] SET ARITHABORT OFF 
GO
ALTER DATABASE [ElectricBill] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ElectricBill] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ElectricBill] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ElectricBill] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ElectricBill] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ElectricBill] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ElectricBill] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ElectricBill] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ElectricBill] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ElectricBill] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ElectricBill] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ElectricBill] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ElectricBill] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ElectricBill] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ElectricBill] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ElectricBill] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ElectricBill] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ElectricBill] SET RECOVERY FULL 
GO
ALTER DATABASE [ElectricBill] SET  MULTI_USER 
GO
ALTER DATABASE [ElectricBill] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ElectricBill] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ElectricBill] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ElectricBill] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ElectricBill] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ElectricBill] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ElectricBill', N'ON'
GO
ALTER DATABASE [ElectricBill] SET QUERY_STORE = OFF
GO
USE [ElectricBill]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 9/29/2024 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Address_ID] [int] IDENTITY(1,1) NOT NULL,
	[Street] [nchar](50) NOT NULL,
	[City] [nchar](30) NOT NULL,
	[State] [nchar](10) NOT NULL,
	[ZIP] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Address_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdminAccount]    Script Date: 9/29/2024 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminAccount](
	[Admin_ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nchar](30) NOT NULL,
	[Username] [nchar](15) NOT NULL,
	[Password] [nchar](15) NOT NULL,
 CONSTRAINT [PK_AdminAccount] PRIMARY KEY CLUSTERED 
(
	[Admin_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Billing]    Script Date: 9/29/2024 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Billing](
	[Invoice_ID] [int] NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[Name] [nchar](15) NOT NULL,
	[Last_Name] [nchar](30) NOT NULL,
	[Address_ID] [int] NOT NULL,
	[Bill_Amount] [smallmoney] NOT NULL,
	[Payment_Date] [date] NULL,
	[Amount_Paid] [smallmoney] NULL,
	[Payment_Method] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 9/29/2024 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_ID] [int] IDENTITY(1,1) NOT NULL,
	[Account_ID] [int] NOT NULL,
	[Name] [nchar](15) NOT NULL,
	[Last_Name] [nchar](30) NOT NULL,
	[Address_ID] [int] NOT NULL,
	[Phone_Number] [nchar](10) NOT NULL,
	[Email] [nchar](30) NOT NULL,
	[Customer_Since] [date] NOT NULL,
	[Meter_Number] [int] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerAccount]    Script Date: 9/29/2024 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAccount](
	[Account_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[Email] [nchar](30) NOT NULL,
	[Username] [nchar](15) NOT NULL,
	[Password] [nchar](15) NOT NULL,
 CONSTRAINT [PK_CustomerAccount] PRIMARY KEY CLUSTERED 
(
	[Account_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 9/29/2024 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[Invoice_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[Tariff_ID] [int] NOT NULL,
	[Service_Rate_ID] [int] NOT NULL,
	[Meter_Number] [int] NOT NULL,
	[Current_kWh_Use] [int] NOT NULL,
	[Reading_Date] [date] NOT NULL,
	[Supplier_ID] [int] NOT NULL,
	[Electric_Service_Amount] [smallmoney] NOT NULL,
	[Monthly_Service_Tax] [smallmoney] NOT NULL,
	[City_Tax] [smallmoney] NOT NULL,
	[Late_Payment_Charge] [smallmoney] NULL,
	[Total_Cost] [smallmoney] NOT NULL,
	[Due_Date] [date] NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[Invoice_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PowerUsage]    Script Date: 9/29/2024 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PowerUsage](
	[Customer_ID] [int] NOT NULL,
	[Previous_Month_kWh] [int] NOT NULL,
	[Monthly_Average] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceRate]    Script Date: 9/29/2024 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceRate](
	[Service_Rate_ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nchar](15) NOT NULL,
 CONSTRAINT [PK_ServiceRate] PRIMARY KEY CLUSTERED 
(
	[Service_Rate_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 9/29/2024 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Supplier_ID] [int] IDENTITY(1,1) NOT NULL,
	[Supplier_Name] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Supplier_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tariff]    Script Date: 9/29/2024 11:26:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tariff](
	[Tariff_ID] [int] IDENTITY(1,1) NOT NULL,
	[Tariff_Type] [nchar](30) NOT NULL,
	[Description] [nchar](150) NOT NULL,
 CONSTRAINT [PK_Tariff] PRIMARY KEY CLUSTERED 
(
	[Tariff_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Address_ID], [Street], [City], [State], [ZIP]) VALUES (1, N'318 Stillwater Ave W                              ', N'Stillwater                    ', N'MN        ', 55082)
INSERT [dbo].[Address] ([Address_ID], [Street], [City], [State], [ZIP]) VALUES (2, N'1307 W 6th St                                     ', N'Red Wing                      ', N'MN        ', 55066)
INSERT [dbo].[Address] ([Address_ID], [Street], [City], [State], [ZIP]) VALUES (3, N'1070 Putnam Ave                                   ', N'Red Wing                      ', N'MN        ', 55066)
INSERT [dbo].[Address] ([Address_ID], [Street], [City], [State], [ZIP]) VALUES (4, N'1303 Levee Rd                                     ', N'Red Wing                      ', N'MN        ', 55066)
INSERT [dbo].[Address] ([Address_ID], [Street], [City], [State], [ZIP]) VALUES (5, N'135 Cannon River Ave                              ', N'Red Wing                      ', N'MN        ', 55066)
INSERT [dbo].[Address] ([Address_ID], [Street], [City], [State], [ZIP]) VALUES (6, N'2201 Forest St                                    ', N'Hastings                      ', N'MN        ', 55033)
INSERT [dbo].[Address] ([Address_ID], [Street], [City], [State], [ZIP]) VALUES (7, N'430 Lawrence Blvd E                               ', N'Wabasha                       ', N'MN        ', 55981)
INSERT [dbo].[Address] ([Address_ID], [Street], [City], [State], [ZIP]) VALUES (8, N'2000 Dylan Dr                                     ', N'Wabasha                       ', N'MN        ', 55981)
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[AdminAccount] ON 

INSERT [dbo].[AdminAccount] ([Admin_ID], [Email], [Username], [Password]) VALUES (1, N'jason.parker@gmail.com        ', N'jparker        ', N'jpark*4g6Qw!@  ')
INSERT [dbo].[AdminAccount] ([Admin_ID], [Email], [Username], [Password]) VALUES (2, N'mildred.skaar@gmail.com       ', N'mskaar         ', N'mskaa$%&!rjJ   ')
INSERT [dbo].[AdminAccount] ([Admin_ID], [Email], [Username], [Password]) VALUES (3, N'ryan.person@gmail.com         ', N'rperson        ', N'rper*(%)$3grt! ')
INSERT [dbo].[AdminAccount] ([Admin_ID], [Email], [Username], [Password]) VALUES (4, N'lucy.harrison@gmail.com       ', N'lharrison      ', N'lhar@h&;)9!    ')
INSERT [dbo].[AdminAccount] ([Admin_ID], [Email], [Username], [Password]) VALUES (5, N'ivy.miller@gmail.com          ', N'imiller        ', N'imil4&9)_!kLp  ')
SET IDENTITY_INSERT [dbo].[AdminAccount] OFF
GO
INSERT [dbo].[Billing] ([Invoice_ID], [Customer_ID], [Name], [Last_Name], [Address_ID], [Bill_Amount], [Payment_Date], [Amount_Paid], [Payment_Method]) VALUES (4, 2, N'John           ', N'Hampton                       ', 1, 66.2100, CAST(N'2024-10-04' AS Date), 66.2100, N'Credit    ')
INSERT [dbo].[Billing] ([Invoice_ID], [Customer_ID], [Name], [Last_Name], [Address_ID], [Bill_Amount], [Payment_Date], [Amount_Paid], [Payment_Method]) VALUES (5, 3, N'Susan          ', N'Schmidt                       ', 2, 80.7700, CAST(N'2024-10-01' AS Date), 80.7700, N'Debit     ')
INSERT [dbo].[Billing] ([Invoice_ID], [Customer_ID], [Name], [Last_Name], [Address_ID], [Bill_Amount], [Payment_Date], [Amount_Paid], [Payment_Method]) VALUES (6, 5, N'Catherine      ', N'Harris                        ', 3, 130.0700, CAST(N'2024-10-03' AS Date), 130.0700, N'Check     ')
INSERT [dbo].[Billing] ([Invoice_ID], [Customer_ID], [Name], [Last_Name], [Address_ID], [Bill_Amount], [Payment_Date], [Amount_Paid], [Payment_Method]) VALUES (7, 6, N'Malcom         ', N'Hobart                        ', 4, 90.0900, CAST(N'2024-10-02' AS Date), 90.0900, N'Credit    ')
INSERT [dbo].[Billing] ([Invoice_ID], [Customer_ID], [Name], [Last_Name], [Address_ID], [Bill_Amount], [Payment_Date], [Amount_Paid], [Payment_Method]) VALUES (8, 7, N'Lauren         ', N'McCarthy                      ', 5, 300.6900, CAST(N'2024-10-05' AS Date), 300.6900, N'Credit    ')
INSERT [dbo].[Billing] ([Invoice_ID], [Customer_ID], [Name], [Last_Name], [Address_ID], [Bill_Amount], [Payment_Date], [Amount_Paid], [Payment_Method]) VALUES (9, 9, N'Jessica        ', N'Walker                        ', 6, 55.8400, CAST(N'2024-10-05' AS Date), 55.8400, N'Credit    ')
INSERT [dbo].[Billing] ([Invoice_ID], [Customer_ID], [Name], [Last_Name], [Address_ID], [Bill_Amount], [Payment_Date], [Amount_Paid], [Payment_Method]) VALUES (10, 10, N'Dylan          ', N'Thompson                      ', 7, 101.9400, CAST(N'2024-10-03' AS Date), 101.9400, N'Debit     ')
INSERT [dbo].[Billing] ([Invoice_ID], [Customer_ID], [Name], [Last_Name], [Address_ID], [Bill_Amount], [Payment_Date], [Amount_Paid], [Payment_Method]) VALUES (11, 11, N'Ingrid         ', N'Johnson                       ', 8, 101.9400, CAST(N'2024-10-06' AS Date), 101.9400, N'Check     ')
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Customer_ID], [Account_ID], [Name], [Last_Name], [Address_ID], [Phone_Number], [Email], [Customer_Since], [Meter_Number]) VALUES (2, 1, N'John           ', N'Hampton                       ', 1, N'6513548796', N'john.hapton@gmail.com         ', CAST(N'2009-02-12' AS Date), 13)
INSERT [dbo].[Customer] ([Customer_ID], [Account_ID], [Name], [Last_Name], [Address_ID], [Phone_Number], [Email], [Customer_Since], [Meter_Number]) VALUES (3, 2, N'Susan          ', N'Schmidt                       ', 2, N'7653332125', N'susan.schmidt@gmail.com       ', CAST(N'2014-04-28' AS Date), 234)
INSERT [dbo].[Customer] ([Customer_ID], [Account_ID], [Name], [Last_Name], [Address_ID], [Phone_Number], [Email], [Customer_Since], [Meter_Number]) VALUES (5, 3, N'Catherine      ', N'Harris                        ', 3, N'6524456877', N'catherine.schmidt@gmail.com   ', CAST(N'2008-08-23' AS Date), 9805)
INSERT [dbo].[Customer] ([Customer_ID], [Account_ID], [Name], [Last_Name], [Address_ID], [Phone_Number], [Email], [Customer_Since], [Meter_Number]) VALUES (6, 4, N'Malcom         ', N'Hobart                        ', 4, N'6136667777', N'malcom.hobart@gmail.com       ', CAST(N'2015-03-15' AS Date), 984)
INSERT [dbo].[Customer] ([Customer_ID], [Account_ID], [Name], [Last_Name], [Address_ID], [Phone_Number], [Email], [Customer_Since], [Meter_Number]) VALUES (7, 5, N'Lauren         ', N'McCarthy                      ', 5, N'7612324455', N'lauren.mccarthy@gmal.com      ', CAST(N'2017-07-21' AS Date), 679)
INSERT [dbo].[Customer] ([Customer_ID], [Account_ID], [Name], [Last_Name], [Address_ID], [Phone_Number], [Email], [Customer_Since], [Meter_Number]) VALUES (9, 6, N'Jessica        ', N'Walker                        ', 6, N'6150143345', N'jessica.walker@gmaill.com     ', CAST(N'2019-12-03' AS Date), 1112)
INSERT [dbo].[Customer] ([Customer_ID], [Account_ID], [Name], [Last_Name], [Address_ID], [Phone_Number], [Email], [Customer_Since], [Meter_Number]) VALUES (10, 7, N'Dylan          ', N'Thompson                      ', 7, N'6137514444', N'dylan.thompson@gmail.com      ', CAST(N'2010-11-24' AS Date), 1904)
INSERT [dbo].[Customer] ([Customer_ID], [Account_ID], [Name], [Last_Name], [Address_ID], [Phone_Number], [Email], [Customer_Since], [Meter_Number]) VALUES (11, 9, N'Ingrid         ', N'Johnson                       ', 8, N'7894435789', N'ingrid.johnson@gmail.com      ', CAST(N'2020-01-01' AS Date), 3456)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerAccount] ON 

INSERT [dbo].[CustomerAccount] ([Account_ID], [Customer_ID], [Email], [Username], [Password]) VALUES (1, 2, N'john.hapton@gmail.com         ', N'jhapton        ', N'jhap2!4fg      ')
INSERT [dbo].[CustomerAccount] ([Account_ID], [Customer_ID], [Email], [Username], [Password]) VALUES (2, 3, N'susan.schmidt@gmail.com       ', N'sschmidt       ', N'ssch7%3        ')
INSERT [dbo].[CustomerAccount] ([Account_ID], [Customer_ID], [Email], [Username], [Password]) VALUES (3, 5, N'catherine.schmidt@gmail.com   ', N'charris        ', N'charris($#8    ')
INSERT [dbo].[CustomerAccount] ([Account_ID], [Customer_ID], [Email], [Username], [Password]) VALUES (4, 6, N'malcom.hobart@gmail.com       ', N'mhobart        ', N'mhob$rT2       ')
INSERT [dbo].[CustomerAccount] ([Account_ID], [Customer_ID], [Email], [Username], [Password]) VALUES (5, 7, N'lauren.mccarthy@gmal.com      ', N'lmccarthy      ', N'lmccAr&89ty    ')
INSERT [dbo].[CustomerAccount] ([Account_ID], [Customer_ID], [Email], [Username], [Password]) VALUES (6, 9, N'jessica.walker@gmail.com      ', N'jwalker        ', N'jwalk!@3rtkr   ')
INSERT [dbo].[CustomerAccount] ([Account_ID], [Customer_ID], [Email], [Username], [Password]) VALUES (7, 10, N'dylan.thompson@gmail.com      ', N'dthompson      ', N'dthomp(*$%^!4  ')
INSERT [dbo].[CustomerAccount] ([Account_ID], [Customer_ID], [Email], [Username], [Password]) VALUES (9, 11, N'ingrid.johnson@gmail.com      ', N'ijohnson       ', N'ijohn$$$onN!   ')
SET IDENTITY_INSERT [dbo].[CustomerAccount] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([Invoice_ID], [Customer_ID], [Tariff_ID], [Service_Rate_ID], [Meter_Number], [Current_kWh_Use], [Reading_Date], [Supplier_ID], [Electric_Service_Amount], [Monthly_Service_Tax], [City_Tax], [Late_Payment_Charge], [Total_Cost], [Due_Date]) VALUES (4, 2, 1, 1, 13, 422, CAST(N'2024-09-28' AS Date), 1, 45.3700, 15.7500, 5.0900, NULL, 66.2100, CAST(N'2024-10-15' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Customer_ID], [Tariff_ID], [Service_Rate_ID], [Meter_Number], [Current_kWh_Use], [Reading_Date], [Supplier_ID], [Electric_Service_Amount], [Monthly_Service_Tax], [City_Tax], [Late_Payment_Charge], [Total_Cost], [Due_Date]) VALUES (5, 3, 2, 1, 234, 698, CAST(N'2024-09-28' AS Date), 3, 59.9300, 15.7500, 5.0900, NULL, 80.7700, CAST(N'2024-10-15' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Customer_ID], [Tariff_ID], [Service_Rate_ID], [Meter_Number], [Current_kWh_Use], [Reading_Date], [Supplier_ID], [Electric_Service_Amount], [Monthly_Service_Tax], [City_Tax], [Late_Payment_Charge], [Total_Cost], [Due_Date]) VALUES (6, 5, 4, 2, 9805, 556, CAST(N'2024-09-27' AS Date), 5, 71.9200, 35.0000, 23.1500, NULL, 130.0700, CAST(N'2024-10-20' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Customer_ID], [Tariff_ID], [Service_Rate_ID], [Meter_Number], [Current_kWh_Use], [Reading_Date], [Supplier_ID], [Electric_Service_Amount], [Monthly_Service_Tax], [City_Tax], [Late_Payment_Charge], [Total_Cost], [Due_Date]) VALUES (7, 6, 6, 1, 984, 511, CAST(N'2024-09-26' AS Date), 8, 69.2500, 15.7500, 5.0900, NULL, 90.0900, CAST(N'2024-10-16' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Customer_ID], [Tariff_ID], [Service_Rate_ID], [Meter_Number], [Current_kWh_Use], [Reading_Date], [Supplier_ID], [Electric_Service_Amount], [Monthly_Service_Tax], [City_Tax], [Late_Payment_Charge], [Total_Cost], [Due_Date]) VALUES (8, 7, 5, 3, 679, 1556, CAST(N'2024-09-28' AS Date), 7, 205.6900, 57.0000, 38.0000, NULL, 300.6900, CAST(N'2024-10-15' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Customer_ID], [Tariff_ID], [Service_Rate_ID], [Meter_Number], [Current_kWh_Use], [Reading_Date], [Supplier_ID], [Electric_Service_Amount], [Monthly_Service_Tax], [City_Tax], [Late_Payment_Charge], [Total_Cost], [Due_Date]) VALUES (9, 9, 1, 1, 1112, 369, CAST(N'2024-09-27' AS Date), 10, 35.0000, 15.7500, 5.0900, NULL, 55.8400, CAST(N'2024-10-14' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Customer_ID], [Tariff_ID], [Service_Rate_ID], [Meter_Number], [Current_kWh_Use], [Reading_Date], [Supplier_ID], [Electric_Service_Amount], [Monthly_Service_Tax], [City_Tax], [Late_Payment_Charge], [Total_Cost], [Due_Date]) VALUES (10, 10, 1, 1, 1904, 701, CAST(N'2024-09-27' AS Date), 4, 81.1000, 15.7500, 5.0900, NULL, 101.9400, CAST(N'2014-10-13' AS Date))
INSERT [dbo].[Invoice] ([Invoice_ID], [Customer_ID], [Tariff_ID], [Service_Rate_ID], [Meter_Number], [Current_kWh_Use], [Reading_Date], [Supplier_ID], [Electric_Service_Amount], [Monthly_Service_Tax], [City_Tax], [Late_Payment_Charge], [Total_Cost], [Due_Date]) VALUES (11, 11, 2, 2, 3456, 865, CAST(N'2024-09-28' AS Date), 9, 114.3500, 35.0000, 23.1500, NULL, 172.5000, CAST(N'2014-10-16' AS Date))
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
INSERT [dbo].[PowerUsage] ([Customer_ID], [Previous_Month_kWh], [Monthly_Average]) VALUES (2, 395, 545)
INSERT [dbo].[PowerUsage] ([Customer_ID], [Previous_Month_kWh], [Monthly_Average]) VALUES (3, 720, 621)
INSERT [dbo].[PowerUsage] ([Customer_ID], [Previous_Month_kWh], [Monthly_Average]) VALUES (5, 466, 590)
INSERT [dbo].[PowerUsage] ([Customer_ID], [Previous_Month_kWh], [Monthly_Average]) VALUES (6, 505, 513)
INSERT [dbo].[PowerUsage] ([Customer_ID], [Previous_Month_kWh], [Monthly_Average]) VALUES (7, 2011, 1794)
INSERT [dbo].[PowerUsage] ([Customer_ID], [Previous_Month_kWh], [Monthly_Average]) VALUES (9, 401, 392)
INSERT [dbo].[PowerUsage] ([Customer_ID], [Previous_Month_kWh], [Monthly_Average]) VALUES (10, 695, 799)
INSERT [dbo].[PowerUsage] ([Customer_ID], [Previous_Month_kWh], [Monthly_Average]) VALUES (11, 1027, 903)
GO
SET IDENTITY_INSERT [dbo].[ServiceRate] ON 

INSERT [dbo].[ServiceRate] ([Service_Rate_ID], [Type]) VALUES (1, N'Residential    ')
INSERT [dbo].[ServiceRate] ([Service_Rate_ID], [Type]) VALUES (2, N'Commercial     ')
INSERT [dbo].[ServiceRate] ([Service_Rate_ID], [Type]) VALUES (3, N'Industrial     ')
SET IDENTITY_INSERT [dbo].[ServiceRate] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name]) VALUES (1, N'East River Electric Power Co-op                   ')
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name]) VALUES (2, N'Great River Energy                                ')
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name]) VALUES (3, N'Hutchinson Utilities Commission                   ')
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name]) VALUES (4, N'Missouri River Energy                             ')
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name]) VALUES (5, N'Xcel Energy                                       ')
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name]) VALUES (6, N'Willmar Municipal Utilities                       ')
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name]) VALUES (7, N'People''s Co-op Tri-County Electric                ')
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name]) VALUES (8, N'Southern Minnesota Municipal Power Agency         ')
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name]) VALUES (9, N'Otter Tail Power Company                          ')
INSERT [dbo].[Supplier] ([Supplier_ID], [Supplier_Name]) VALUES (10, N'Rochester Public Utilities Commission             ')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[Tariff] ON 

INSERT [dbo].[Tariff] ([Tariff_ID], [Tariff_Type], [Description]) VALUES (1, N'Simple                        ', N'The cost of energy is based on units consumed                                                                                                         ')
INSERT [dbo].[Tariff] ([Tariff_ID], [Tariff_Type], [Description]) VALUES (2, N'Flat rate                     ', N'Different types of consumers are charged at different uniform per unit rates                                                                          ')
INSERT [dbo].[Tariff] ([Tariff_ID], [Tariff_Type], [Description]) VALUES (3, N'Block rate                    ', N'A given block of energy is charged at a specified rate and other blocks are charged at progressively reduced rates                                    ')
INSERT [dbo].[Tariff] ([Tariff_ID], [Tariff_Type], [Description]) VALUES (4, N'Two part                      ', N'The total charged is split between fixed charges (proportional to maximum demand) and running charges (proportional to units consumed)                ')
INSERT [dbo].[Tariff] ([Tariff_ID], [Tariff_Type], [Description]) VALUES (5, N'Maximum demand                ', N'Similar to two part tariff but maximum demand is measured with a max. demand meter                                                                    ')
INSERT [dbo].[Tariff] ([Tariff_ID], [Tariff_Type], [Description]) VALUES (8, N'Power factor                  ', N'The efficiency of the system depends on the power factor. Low power factor means high loss and poor efficiency, penalizing the customer               ')
INSERT [dbo].[Tariff] ([Tariff_ID], [Tariff_Type], [Description]) VALUES (9, N'Three part                    ', N'The total charged is split between a fixed charge, a semi-fixed charge and a running charge                                                           ')
SET IDENTITY_INSERT [dbo].[Tariff] OFF
GO
USE [master]
GO
ALTER DATABASE [ElectricBill] SET  READ_WRITE 
GO
