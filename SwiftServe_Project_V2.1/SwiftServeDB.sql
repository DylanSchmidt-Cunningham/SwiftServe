USE [master]
GO
/****** Object:  Database [SwiftServe]    Script Date: 2018-11-18 2:16:40 AM ******/
CREATE DATABASE [SwiftServe]
 CONTAINMENT = NONE
 ON  PRIMARY 
 /* Uncomment the address string that works for your environment: lab computers are ..\MSSQL13.MSSQLSERVER2016\.., Dylan's computer is just ..\MSSQL13.MSSQLSERVER\.. */
( NAME = N'SwiftServe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\SwiftServe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
/*( NAME = N'SwiftServe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER2016\MSSQL\DATA\SwiftServe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )*/
 LOG ON 
( NAME = N'SwiftServe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\SwiftServe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
/*( NAME = N'SwiftServe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER2016\MSSQL\DATA\SwiftServe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )*/
GO
ALTER DATABASE [SwiftServe] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SwiftServe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SwiftServe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SwiftServe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SwiftServe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SwiftServe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SwiftServe] SET ARITHABORT OFF 
GO
ALTER DATABASE [SwiftServe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SwiftServe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SwiftServe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SwiftServe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SwiftServe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SwiftServe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SwiftServe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SwiftServe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SwiftServe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SwiftServe] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SwiftServe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SwiftServe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SwiftServe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SwiftServe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SwiftServe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SwiftServe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SwiftServe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SwiftServe] SET RECOVERY FULL 
GO
ALTER DATABASE [SwiftServe] SET  MULTI_USER 
GO
ALTER DATABASE [SwiftServe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SwiftServe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SwiftServe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SwiftServe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SwiftServe] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SwiftServe', N'ON'
GO
ALTER DATABASE [SwiftServe] SET QUERY_STORE = OFF
GO
USE [SwiftServe]
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
USE [SwiftServe]
GO
/****** Object:  Table [dbo].[CustomerAccount]    Script Date: 2018-11-18 2:16:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAccount](
	[Firstname] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[CentennialEmail] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[Phonenumber] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NULL,
	[Activationcode] [nvarchar](50) NULL,
 CONSTRAINT [PK_CustomerAccount] PRIMARY KEY CLUSTERED 
(
	[CentennialEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerLogin]    Script Date: 2018-11-18 2:16:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerLogin](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CustomerLogin] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu_Images]    Script Date: 2018-11-18 2:16:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu_Images](
	[Name] [varchar](50) NOT NULL,
	[MenuItemName] [varchar](50) NOT NULL,
	[RestaurantName] [varchar](50) NOT NULL,
	[Image] [image] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_Menu_Images] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu_Items]    Script Date: 2018-11-18 2:16:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu_Items](
	[Name] [varchar](50) NOT NULL,
	[RestaurantName] [varchar](50) NOT NULL,
	[Price] [smallmoney] NOT NULL,
	[InStock] [bit] NOT NULL,
	[Visible] [bit] NOT NULL,
 CONSTRAINT [PK_Menu_Items] PRIMARY KEY CLUSTERED 
(
	[Name] ASC,
	[RestaurantName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2018-11-18 2:16:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CentennialEmail] [nvarchar](50) NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[DelayTime] [int] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Semitotal] [smallmoney] NOT NULL,
	[Taxes] [smallmoney] NOT NULL,
	[ServiceCharge] [smallmoney] NOT NULL,
	[Total] AS [Semitotal] + [Taxes] + [ServiceCharge],
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order_Items]    Script Date: 2018-11-18 2:16:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Items](
	[OrderID] [int] NOT NULL,
	[MenuItemName] [varchar](50) NOT NULL,
	[RestaurantName] [varchar](50) NOT NULL,
	[Price] [smallmoney] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Subtotal]  AS ([Quantity]*[Price]),
 CONSTRAINT [PK_Order_Items] PRIMARY KEY CLUSTERED 
(
	[MenuItemName] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Restaurant]    Script Date: 2018-11-18 2:16:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurant](
	[Name] [varchar](50) NOT NULL,
	[Website] [varchar](50) NOT NULL,
	[PhoneNo] [varchar](10) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Restaurant] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_DelayTime]  DEFAULT ((20)) FOR [DelayTime]
GO
ALTER TABLE [dbo].[CustomerAccount]  WITH CHECK ADD  CONSTRAINT [FK_customerLogin_customerAccount] FOREIGN KEY([CentennialEmail])
REFERENCES [dbo].[CustomerLogin] ([Username])
GO
ALTER TABLE [dbo].[CustomerAccount] CHECK CONSTRAINT [FK_customerLogin_customerAccount]
GO
ALTER TABLE [dbo].[Menu_Images]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Images_Menu_Items] FOREIGN KEY([MenuItemName], [RestaurantName])
REFERENCES [dbo].[Menu_Items] ([Name], [RestaurantName])
GO
ALTER TABLE [dbo].[Menu_Images] CHECK CONSTRAINT [FK_Menu_Images_Menu_Items]
GO
ALTER TABLE [dbo].[Menu_Items]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Restaurant] FOREIGN KEY([RestaurantName])
REFERENCES [dbo].[Restaurant] ([Name])
GO
ALTER TABLE [dbo].[Menu_Items] CHECK CONSTRAINT [FK_Menu_Restaurant]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_CustomerAccount] FOREIGN KEY([CentennialEmail])
REFERENCES [dbo].[CustomerAccount] ([CentennialEmail])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_CustomerAccount]
GO
ALTER TABLE [dbo].[Order_Items]  WITH CHECK ADD  CONSTRAINT [FK_Order_Items_Menu_Items] FOREIGN KEY([MenuItemName], [RestaurantName])
REFERENCES [dbo].[Menu_Items] ([Name], [RestaurantName])
GO
ALTER TABLE [dbo].[Order_Items] CHECK CONSTRAINT [FK_Order_Items_Menu_Items]
GO
ALTER TABLE [dbo].[Order_Items]  WITH CHECK ADD  CONSTRAINT [FK_Order_Items_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Order_Items] CHECK CONSTRAINT [FK_Order_Items_Orders]
GO
ALTER TABLE [dbo].[Menu_Items]  WITH CHECK ADD  CONSTRAINT [CK_Menu_Items_Price_GTE_Zero] CHECK  (([Price]>=(0)))
GO
ALTER TABLE [dbo].[Menu_Items] CHECK CONSTRAINT [CK_Menu_Items_Price_GTE_Zero]
GO
ALTER TABLE [dbo].[Order_Items]  WITH CHECK ADD  CONSTRAINT [CK_Order_Items_Price_GTE_Zero] CHECK  (([Price]>=(0)))
GO
ALTER TABLE [dbo].[Order_Items] CHECK CONSTRAINT [CK_Order_Items_Price_GTE_Zero]
GO
ALTER TABLE [dbo].[Order_Items]  WITH CHECK ADD  CONSTRAINT [CK_Order_Items_Quantity_GT_Zero] CHECK  (([Quantity]>(0)))
GO
ALTER TABLE [dbo].[Order_Items] CHECK CONSTRAINT [CK_Order_Items_Quantity_GT_Zero]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [CK_Orders_Delay_GTE_20] CHECK  (([DelayTime]>=(20)))
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [CK_Orders_Delay_GTE_20]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [CK_Orders_Delay_LTE_60] CHECK  (([DelayTime]<=(60)))
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [CK_Orders_Delay_LTE_60]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [CK_Orders_Tax_GTE_Zero] CHECK  (([Taxes]>=(0)))
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [CK_Orders_Tax_GTE_Zero]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [CK_Orders_Semitotal_GTE_Zero] CHECK  (([Semitotal]>=(0)))
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [CK_Orders_Semitotal_GTE_Zero]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [CK_Orders_ServiceCharge_GTE_Zero] CHECK  (([ServiceCharge]>=(0)))
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [CK_Orders_ServiceCharge_GTE_Zero]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [CK_Orders_Status_Options] CHECK  (([Status]='Complete' OR [Status]='In Progress' OR [Status]='New'))
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [CK_Orders_Status_Options]
GO
ALTER TABLE [dbo].[Restaurant]  WITH CHECK ADD  CONSTRAINT [CK_Rest_PhoneNo] CHECK  (([PhoneNo] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Restaurant] CHECK CONSTRAINT [CK_Rest_PhoneNo]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price cannot be negative' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu_Items', @level2type=N'CONSTRAINT',@level2name=N'CK_Menu_Items_Price_GTE_Zero'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Price cannot be negative' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order_Items', @level2type=N'CONSTRAINT',@level2name=N'CK_Order_Items_Price_GTE_Zero'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quantity must be at least 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order_Items', @level2type=N'CONSTRAINT',@level2name=N'CK_Order_Items_Quantity_GT_Zero'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Delay time cannot be negative' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'CONSTRAINT',@level2name=N'CK_Orders_Delay_GTE_20'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Delay is at most 60 minutes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'CONSTRAINT',@level2name=N'CK_Orders_Delay_LTE_60'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Taxes cannot be negative' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'CONSTRAINT',@level2name=N'CK_Orders_Tax_GTE_Zero'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Semitotal cannot be negative' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'CONSTRAINT',@level2name=N'CK_Orders_Semitotal_GTE_Zero'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ServiceCharge cannot be negative' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'CONSTRAINT',@level2name=N'CK_Orders_ServiceCharge_GTE_Zero'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status must be ''New'', ''In Progress'', or ''Complete''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'CONSTRAINT',@level2name=N'CK_Orders_Status_Options'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'check the format of the restaurant''s phone number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Restaurant', @level2type=N'CONSTRAINT',@level2name=N'CK_Rest_PhoneNo'
GO
USE [master]
GO
ALTER DATABASE [SwiftServe] SET  READ_WRITE 
GO
