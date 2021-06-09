USE [master]
GO
/****** Object:  Database [IASDB]    Script Date: 6/9/2021 1:05:09 PM ******/
CREATE DATABASE [IASDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IASDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\IASDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'IASDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\IASDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [IASDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IASDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IASDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IASDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IASDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IASDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IASDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [IASDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IASDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IASDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IASDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IASDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IASDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IASDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IASDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IASDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IASDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IASDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IASDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IASDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IASDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IASDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IASDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IASDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IASDB] SET RECOVERY FULL 
GO
ALTER DATABASE [IASDB] SET  MULTI_USER 
GO
ALTER DATABASE [IASDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IASDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IASDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IASDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [IASDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'IASDB', N'ON'
GO
USE [IASDB]
GO
/****** Object:  Table [dbo].[attendancestatustable]    Script Date: 6/9/2021 1:05:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[attendancestatustable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_attendancestatus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[attendancetable]    Script Date: 6/9/2021 1:05:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[attendancetable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[interneeid] [int] NOT NULL,
	[reportDatetime] [datetime] NOT NULL,
	[leaveDatetime] [datetime] NOT NULL,
	[statusid] [int] NOT NULL,
 CONSTRAINT [PK_attendancetable] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[batchtable]    Script Date: 6/9/2021 1:05:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[batchtable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[batch] [nvarchar](50) NOT NULL,
	[sponsor] [nvarchar](100) NULL,
 CONSTRAINT [PK_batchtable] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[interneetable]    Script Date: 6/9/2021 1:05:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[interneetable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[batchid] [int] NOT NULL,
	[userid] [int] NOT NULL,
	[supervisorid] [int] NOT NULL,
 CONSTRAINT [PK_interneetable] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[managerstable]    Script Date: 6/9/2021 1:05:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[managerstable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[designation] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ManagersTable] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[supervisortable]    Script Date: 6/9/2021 1:05:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supervisortable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
 CONSTRAINT [PK_superisourtable] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usertable]    Script Date: 6/9/2021 1:05:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usertable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[password] [nvarchar](64) NOT NULL,
	[fname] [nvarchar](100) NOT NULL,
	[cnic] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_usertable] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[attendancestatustable] ON 

INSERT [dbo].[attendancestatustable] ([id], [status]) VALUES (1, N'Absent')
INSERT [dbo].[attendancestatustable] ([id], [status]) VALUES (2, N'Present')
INSERT [dbo].[attendancestatustable] ([id], [status]) VALUES (3, N'Public Holiday')
INSERT [dbo].[attendancestatustable] ([id], [status]) VALUES (4, N'Leave')
SET IDENTITY_INSERT [dbo].[attendancestatustable] OFF
SET IDENTITY_INSERT [dbo].[attendancetable] ON 

INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (100, 2, CAST(N'2021-02-01T09:45:00.000' AS DateTime), CAST(N'2021-02-01T16:53:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (101, 2, CAST(N'2021-02-02T09:45:00.000' AS DateTime), CAST(N'2021-02-02T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (102, 2, CAST(N'2021-02-03T09:45:00.000' AS DateTime), CAST(N'2021-02-03T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (103, 2, CAST(N'2021-02-04T09:45:00.000' AS DateTime), CAST(N'2021-02-04T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (104, 2, CAST(N'2021-02-05T09:45:00.000' AS DateTime), CAST(N'2021-02-05T16:53:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (105, 2, CAST(N'2021-02-06T09:45:00.000' AS DateTime), CAST(N'2021-02-06T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (106, 2, CAST(N'2021-02-07T09:45:00.000' AS DateTime), CAST(N'2021-02-07T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (107, 2, CAST(N'2021-02-08T09:45:00.000' AS DateTime), CAST(N'2021-02-08T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (108, 2, CAST(N'2021-02-09T09:45:00.000' AS DateTime), CAST(N'2021-02-09T16:53:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (109, 2, CAST(N'2021-02-10T09:45:00.000' AS DateTime), CAST(N'2021-02-10T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (110, 2, CAST(N'2021-02-11T09:45:00.000' AS DateTime), CAST(N'2021-02-11T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (111, 2, CAST(N'2021-02-12T09:45:00.000' AS DateTime), CAST(N'2021-02-12T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (112, 2, CAST(N'2021-02-13T09:45:00.000' AS DateTime), CAST(N'2021-02-13T16:53:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (113, 2, CAST(N'2021-02-14T09:45:00.000' AS DateTime), CAST(N'2021-02-14T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (114, 2, CAST(N'2021-02-15T09:45:00.000' AS DateTime), CAST(N'2021-02-15T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (115, 2, CAST(N'2021-02-16T09:45:00.000' AS DateTime), CAST(N'2021-02-16T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (116, 2, CAST(N'2021-02-17T09:45:00.000' AS DateTime), CAST(N'2021-02-17T16:53:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (117, 2, CAST(N'2021-02-18T09:45:00.000' AS DateTime), CAST(N'2021-02-18T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (118, 2, CAST(N'2021-02-19T09:45:00.000' AS DateTime), CAST(N'2021-02-19T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (119, 2, CAST(N'2021-02-20T09:45:00.000' AS DateTime), CAST(N'2021-02-20T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (120, 2, CAST(N'2021-02-21T09:45:00.000' AS DateTime), CAST(N'2021-02-21T16:53:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (121, 2, CAST(N'2021-02-22T09:45:00.000' AS DateTime), CAST(N'2021-02-22T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (122, 2, CAST(N'2021-02-23T09:45:00.000' AS DateTime), CAST(N'2021-02-23T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (123, 2, CAST(N'2021-02-24T09:45:00.000' AS DateTime), CAST(N'2021-02-24T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (124, 2, CAST(N'2021-02-25T09:45:00.000' AS DateTime), CAST(N'2021-02-25T16:53:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (125, 2, CAST(N'2021-02-26T09:45:00.000' AS DateTime), CAST(N'2021-02-26T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (126, 2, CAST(N'2021-02-27T09:45:00.000' AS DateTime), CAST(N'2021-02-27T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (127, 2, CAST(N'2021-02-28T09:45:00.000' AS DateTime), CAST(N'2021-02-28T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (130, 2, CAST(N'2021-03-01T09:45:00.000' AS DateTime), CAST(N'2021-03-01T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (131, 2, CAST(N'2021-03-02T09:45:00.000' AS DateTime), CAST(N'2021-03-02T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (132, 2, CAST(N'2021-03-03T09:45:00.000' AS DateTime), CAST(N'2021-03-03T16:53:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (133, 2, CAST(N'2021-03-04T09:45:00.000' AS DateTime), CAST(N'2021-03-04T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (134, 2, CAST(N'2021-03-05T09:45:00.000' AS DateTime), CAST(N'2021-03-05T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (135, 2, CAST(N'2021-03-06T09:45:00.000' AS DateTime), CAST(N'2021-03-06T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (136, 2, CAST(N'2021-03-07T09:45:00.000' AS DateTime), CAST(N'2021-03-07T16:53:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (137, 2, CAST(N'2021-03-08T09:45:00.000' AS DateTime), CAST(N'2021-03-08T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (138, 2, CAST(N'2021-03-09T09:45:00.000' AS DateTime), CAST(N'2021-03-09T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (139, 2, CAST(N'2021-03-10T09:45:00.000' AS DateTime), CAST(N'2021-03-10T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (140, 2, CAST(N'2021-03-11T09:45:00.000' AS DateTime), CAST(N'2021-03-11T16:53:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (141, 2, CAST(N'2021-03-12T09:45:00.000' AS DateTime), CAST(N'2021-03-12T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (142, 2, CAST(N'2021-03-13T09:45:00.000' AS DateTime), CAST(N'2021-03-13T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (143, 2, CAST(N'2021-03-14T09:45:00.000' AS DateTime), CAST(N'2021-03-14T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (144, 2, CAST(N'2021-03-15T09:45:00.000' AS DateTime), CAST(N'2021-03-15T16:53:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (145, 2, CAST(N'2021-03-16T09:45:00.000' AS DateTime), CAST(N'2021-03-16T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (146, 2, CAST(N'2021-03-17T09:45:00.000' AS DateTime), CAST(N'2021-03-17T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (147, 2, CAST(N'2021-03-18T09:45:00.000' AS DateTime), CAST(N'2021-03-18T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (148, 2, CAST(N'2021-03-19T09:45:00.000' AS DateTime), CAST(N'2021-03-19T16:53:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (149, 2, CAST(N'2021-03-20T09:45:00.000' AS DateTime), CAST(N'2021-03-20T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (150, 2, CAST(N'2021-03-21T09:45:00.000' AS DateTime), CAST(N'2021-03-21T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (151, 2, CAST(N'2021-03-22T09:45:00.000' AS DateTime), CAST(N'2021-03-22T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (152, 2, CAST(N'2021-03-23T09:45:00.000' AS DateTime), CAST(N'2021-03-23T16:53:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (153, 2, CAST(N'2021-03-24T09:45:00.000' AS DateTime), CAST(N'2021-03-24T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (154, 2, CAST(N'2021-03-25T09:45:00.000' AS DateTime), CAST(N'2021-03-25T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (155, 2, CAST(N'2021-03-26T09:45:00.000' AS DateTime), CAST(N'2021-03-26T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (156, 2, CAST(N'2021-03-27T09:45:00.000' AS DateTime), CAST(N'2021-03-27T16:53:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (157, 2, CAST(N'2021-03-28T09:45:00.000' AS DateTime), CAST(N'2021-03-28T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (158, 2, CAST(N'2021-03-29T09:45:00.000' AS DateTime), CAST(N'2021-03-29T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (159, 2, CAST(N'2021-03-30T09:45:00.000' AS DateTime), CAST(N'2021-03-30T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (160, 2, CAST(N'2021-03-31T09:45:00.000' AS DateTime), CAST(N'2021-03-31T16:53:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (161, 2, CAST(N'2021-04-01T09:45:00.000' AS DateTime), CAST(N'2021-04-01T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (162, 2, CAST(N'2021-04-02T09:45:00.000' AS DateTime), CAST(N'2021-04-02T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (163, 2, CAST(N'2021-04-03T09:45:00.000' AS DateTime), CAST(N'2021-04-03T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (164, 2, CAST(N'2021-04-04T09:45:00.000' AS DateTime), CAST(N'2021-04-04T16:53:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (165, 2, CAST(N'2021-04-05T09:45:00.000' AS DateTime), CAST(N'2021-04-05T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (166, 2, CAST(N'2021-04-06T09:45:00.000' AS DateTime), CAST(N'2021-04-06T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (167, 2, CAST(N'2021-04-07T09:45:00.000' AS DateTime), CAST(N'2021-04-07T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (168, 2, CAST(N'2021-04-08T09:45:00.000' AS DateTime), CAST(N'2021-04-08T16:53:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (169, 2, CAST(N'2021-04-09T09:45:00.000' AS DateTime), CAST(N'2021-04-09T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (170, 2, CAST(N'2021-04-10T09:45:00.000' AS DateTime), CAST(N'2021-04-10T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (171, 2, CAST(N'2021-04-11T09:45:00.000' AS DateTime), CAST(N'2021-04-11T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (172, 2, CAST(N'2021-04-12T09:45:00.000' AS DateTime), CAST(N'2021-04-12T16:53:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (173, 2, CAST(N'2021-04-13T09:45:00.000' AS DateTime), CAST(N'2021-04-13T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (174, 2, CAST(N'2021-04-14T09:45:00.000' AS DateTime), CAST(N'2021-04-14T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (175, 2, CAST(N'2021-04-15T09:45:00.000' AS DateTime), CAST(N'2021-04-15T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (176, 2, CAST(N'2021-04-16T09:45:00.000' AS DateTime), CAST(N'2021-04-16T16:53:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (177, 2, CAST(N'2021-04-17T09:45:00.000' AS DateTime), CAST(N'2021-04-17T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (178, 2, CAST(N'2021-04-18T09:45:00.000' AS DateTime), CAST(N'2021-04-18T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (179, 2, CAST(N'2021-04-19T09:45:00.000' AS DateTime), CAST(N'2021-04-19T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (180, 2, CAST(N'2021-04-20T09:45:00.000' AS DateTime), CAST(N'2021-04-20T16:53:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (181, 2, CAST(N'2021-04-21T09:45:00.000' AS DateTime), CAST(N'2021-04-21T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (182, 2, CAST(N'2021-04-22T09:45:00.000' AS DateTime), CAST(N'2021-04-22T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (183, 2, CAST(N'2021-04-23T09:45:00.000' AS DateTime), CAST(N'2021-04-23T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (184, 2, CAST(N'2021-04-24T09:45:00.000' AS DateTime), CAST(N'2021-04-24T16:53:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (185, 2, CAST(N'2021-04-25T09:45:00.000' AS DateTime), CAST(N'2021-04-25T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (186, 2, CAST(N'2021-04-26T09:45:00.000' AS DateTime), CAST(N'2021-04-26T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (187, 2, CAST(N'2021-04-27T09:45:00.000' AS DateTime), CAST(N'2021-04-27T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (188, 2, CAST(N'2021-04-28T09:45:00.000' AS DateTime), CAST(N'2021-04-28T16:53:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (189, 2, CAST(N'2021-04-29T09:45:00.000' AS DateTime), CAST(N'2021-04-29T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (190, 2, CAST(N'2021-04-30T09:45:00.000' AS DateTime), CAST(N'2021-04-30T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (192, 2, CAST(N'2021-05-01T09:45:00.000' AS DateTime), CAST(N'2021-05-01T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (193, 2, CAST(N'2021-05-02T09:45:00.000' AS DateTime), CAST(N'2021-05-02T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (194, 2, CAST(N'2021-05-03T09:45:00.000' AS DateTime), CAST(N'2021-05-03T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (195, 2, CAST(N'2021-05-04T09:45:00.000' AS DateTime), CAST(N'2021-05-04T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (196, 2, CAST(N'2021-05-05T09:45:00.000' AS DateTime), CAST(N'2021-05-05T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (197, 2, CAST(N'2021-05-06T09:45:00.000' AS DateTime), CAST(N'2021-05-06T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (198, 2, CAST(N'2021-05-07T09:45:00.000' AS DateTime), CAST(N'2021-05-07T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (199, 2, CAST(N'2021-05-08T09:45:00.000' AS DateTime), CAST(N'2021-05-08T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (200, 2, CAST(N'2021-05-09T09:45:00.000' AS DateTime), CAST(N'2021-05-09T16:53:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (201, 2, CAST(N'2021-05-10T09:45:00.000' AS DateTime), CAST(N'2021-05-10T16:53:00.000' AS DateTime), 3)
GO
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (202, 2, CAST(N'2021-05-11T09:45:00.000' AS DateTime), CAST(N'2021-05-11T16:53:00.000' AS DateTime), 3)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (203, 2, CAST(N'2021-05-12T09:45:00.000' AS DateTime), CAST(N'2021-05-12T16:53:00.000' AS DateTime), 3)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (204, 2, CAST(N'2021-05-13T09:45:00.000' AS DateTime), CAST(N'2021-05-13T16:53:00.000' AS DateTime), 3)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (205, 2, CAST(N'2021-05-14T09:45:00.000' AS DateTime), CAST(N'2021-05-14T16:53:00.000' AS DateTime), 3)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (206, 2, CAST(N'2021-05-15T09:45:00.000' AS DateTime), CAST(N'2021-05-15T16:53:00.000' AS DateTime), 3)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (207, 2, CAST(N'2021-05-16T09:45:00.000' AS DateTime), CAST(N'2021-05-16T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (208, 2, CAST(N'2021-05-17T09:45:00.000' AS DateTime), CAST(N'2021-05-17T16:53:00.000' AS DateTime), 4)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (209, 2, CAST(N'2021-05-18T09:45:00.000' AS DateTime), CAST(N'2021-05-18T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (210, 2, CAST(N'2021-05-19T09:45:00.000' AS DateTime), CAST(N'2021-05-19T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (211, 2, CAST(N'2021-05-20T09:45:00.000' AS DateTime), CAST(N'2021-05-20T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (212, 2, CAST(N'2021-05-21T09:45:00.000' AS DateTime), CAST(N'2021-05-21T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (213, 2, CAST(N'2021-05-22T09:45:00.000' AS DateTime), CAST(N'2021-05-22T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (214, 2, CAST(N'2021-05-23T09:45:00.000' AS DateTime), CAST(N'2021-05-23T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (215, 2, CAST(N'2021-05-24T09:45:00.000' AS DateTime), CAST(N'2021-05-24T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (216, 2, CAST(N'2021-05-25T09:45:00.000' AS DateTime), CAST(N'2021-05-25T16:53:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (219, 2, CAST(N'2021-05-27T14:47:31.347' AS DateTime), CAST(N'2021-05-27T21:55:31.347' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (220, 4, CAST(N'2021-05-27T22:53:01.430' AS DateTime), CAST(N'2021-05-28T06:01:01.430' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (221, 4, CAST(N'2021-05-28T01:03:50.623' AS DateTime), CAST(N'2021-05-28T08:11:50.623' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (222, 2, CAST(N'2021-05-28T10:49:18.317' AS DateTime), CAST(N'2021-05-28T17:57:18.317' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (223, 2, CAST(N'2021-05-26T09:30:00.000' AS DateTime), CAST(N'2021-05-26T16:38:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (224, 4, CAST(N'2021-05-01T09:30:00.000' AS DateTime), CAST(N'2021-05-01T16:38:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (225, 4, CAST(N'2021-05-11T09:30:00.000' AS DateTime), CAST(N'2021-05-11T16:38:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (226, 4, CAST(N'2021-05-19T09:30:00.000' AS DateTime), CAST(N'2021-05-19T16:38:00.000' AS DateTime), 4)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (227, 4, CAST(N'2021-05-18T09:30:00.000' AS DateTime), CAST(N'2021-05-18T16:38:00.000' AS DateTime), 3)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (228, 4, CAST(N'2021-05-03T09:30:00.000' AS DateTime), CAST(N'2021-05-03T16:38:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (229, 4, CAST(N'2021-05-06T09:30:00.000' AS DateTime), CAST(N'2021-05-06T16:38:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (233, 4, CAST(N'2021-05-10T09:33:00.000' AS DateTime), CAST(N'2021-05-10T16:41:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (234, 4, CAST(N'2021-05-07T09:48:00.000' AS DateTime), CAST(N'2021-05-07T16:56:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (235, 4, CAST(N'2021-05-08T09:41:00.000' AS DateTime), CAST(N'2021-05-08T16:49:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (236, 4, CAST(N'2021-05-12T09:56:00.000' AS DateTime), CAST(N'2021-05-12T17:04:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (237, 4, CAST(N'2021-05-04T09:33:00.000' AS DateTime), CAST(N'2021-05-04T16:43:00.000' AS DateTime), 4)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (238, 4, CAST(N'2021-05-15T09:47:00.000' AS DateTime), CAST(N'2021-05-15T17:10:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (239, 2, CAST(N'2021-05-29T08:41:52.387' AS DateTime), CAST(N'2021-05-29T15:43:52.387' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (240, 4, CAST(N'2021-05-29T09:16:25.837' AS DateTime), CAST(N'2021-05-29T16:28:25.837' AS DateTime), 4)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (241, 4, CAST(N'2021-05-25T09:46:00.000' AS DateTime), CAST(N'2021-05-25T17:13:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (254, 2, CAST(N'2021-06-08T13:10:54.347' AS DateTime), CAST(N'2021-06-08T20:10:54.347' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (255, 2, CAST(N'2021-06-01T09:30:00.000' AS DateTime), CAST(N'2021-06-01T16:30:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (256, 2, CAST(N'2021-06-02T09:30:00.000' AS DateTime), CAST(N'2021-06-02T16:30:00.000' AS DateTime), 1)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (257, 2, CAST(N'2021-06-05T09:30:00.000' AS DateTime), CAST(N'2021-06-05T16:30:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (258, 2, CAST(N'2021-06-04T09:30:00.000' AS DateTime), CAST(N'2021-06-04T16:30:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (259, 2, CAST(N'2021-06-07T09:30:00.000' AS DateTime), CAST(N'2021-06-07T16:30:00.000' AS DateTime), 4)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (260, 2, CAST(N'2021-06-03T09:30:00.000' AS DateTime), CAST(N'2021-06-03T16:30:00.000' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (261, 2, CAST(N'2021-06-09T10:53:37.670' AS DateTime), CAST(N'2021-06-09T17:53:37.670' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (262, 7, CAST(N'2021-06-09T11:14:42.720' AS DateTime), CAST(N'2021-06-09T18:14:42.720' AS DateTime), 2)
INSERT [dbo].[attendancetable] ([id], [interneeid], [reportDatetime], [leaveDatetime], [statusid]) VALUES (263, 7, CAST(N'2021-06-05T09:30:00.000' AS DateTime), CAST(N'2021-06-05T16:30:00.000' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[attendancetable] OFF
SET IDENTITY_INSERT [dbo].[batchtable] ON 

INSERT [dbo].[batchtable] ([id], [batch], [sponsor]) VALUES (1, N'2021', N'KPITB')
SET IDENTITY_INSERT [dbo].[batchtable] OFF
SET IDENTITY_INSERT [dbo].[interneetable] ON 

INSERT [dbo].[interneetable] ([id], [batchid], [userid], [supervisorid]) VALUES (2, 1, 5, 1)
INSERT [dbo].[interneetable] ([id], [batchid], [userid], [supervisorid]) VALUES (4, 1, 7, 1)
INSERT [dbo].[interneetable] ([id], [batchid], [userid], [supervisorid]) VALUES (7, 1, 11, 1)
SET IDENTITY_INSERT [dbo].[interneetable] OFF
SET IDENTITY_INSERT [dbo].[managerstable] ON 

INSERT [dbo].[managerstable] ([id], [userid], [designation]) VALUES (1, 8, N'Office Manager')
SET IDENTITY_INSERT [dbo].[managerstable] OFF
SET IDENTITY_INSERT [dbo].[supervisortable] ON 

INSERT [dbo].[supervisortable] ([id], [userid]) VALUES (1, 9)
SET IDENTITY_INSERT [dbo].[supervisortable] OFF
SET IDENTITY_INSERT [dbo].[usertable] ON 

INSERT [dbo].[usertable] ([id], [username], [email], [password], [fname], [cnic]) VALUES (5, N'Ali', N'ali@gmail.com', N'12345', N'naeem', N'17101-2345678-1')
INSERT [dbo].[usertable] ([id], [username], [email], [password], [fname], [cnic]) VALUES (7, N'Ahmad', N'ahmad@gmail.com', N'12345', N'naeem', N'17101-1234568-9')
INSERT [dbo].[usertable] ([id], [username], [email], [password], [fname], [cnic]) VALUES (8, N'Faiza', N'faiza@gmail.com', N'12345', N'faizan', N'17201-9876543-1')
INSERT [dbo].[usertable] ([id], [username], [email], [password], [fname], [cnic]) VALUES (9, N'faisal', N'Faisal@gmail.com', N'12345', N'sher ali', N'17201-2346950-3')
INSERT [dbo].[usertable] ([id], [username], [email], [password], [fname], [cnic]) VALUES (10, N'Naeem', N'naeem@gmail.com', N'12345', N'Muhammad', N'17101-2345678-1')
INSERT [dbo].[usertable] ([id], [username], [email], [password], [fname], [cnic]) VALUES (11, N'Salman Khan', N'salman@gmail.com', N'12345', N'alam zeb', N'17201-4321345-1')
SET IDENTITY_INSERT [dbo].[usertable] OFF
ALTER TABLE [dbo].[attendancetable] ADD  CONSTRAINT [DF_attendancetable_LeaveDatetime]  DEFAULT ('2021-05-28 5:30') FOR [leaveDatetime]
GO
ALTER TABLE [dbo].[attendancetable]  WITH CHECK ADD  CONSTRAINT [FK_attendancetable_attendancestatus] FOREIGN KEY([statusid])
REFERENCES [dbo].[attendancestatustable] ([id])
GO
ALTER TABLE [dbo].[attendancetable] CHECK CONSTRAINT [FK_attendancetable_attendancestatus]
GO
ALTER TABLE [dbo].[attendancetable]  WITH CHECK ADD  CONSTRAINT [FK_attendancetable_interneetable] FOREIGN KEY([interneeid])
REFERENCES [dbo].[interneetable] ([id])
GO
ALTER TABLE [dbo].[attendancetable] CHECK CONSTRAINT [FK_attendancetable_interneetable]
GO
ALTER TABLE [dbo].[interneetable]  WITH CHECK ADD  CONSTRAINT [FK_interneetable_batchtable] FOREIGN KEY([batchid])
REFERENCES [dbo].[batchtable] ([id])
GO
ALTER TABLE [dbo].[interneetable] CHECK CONSTRAINT [FK_interneetable_batchtable]
GO
ALTER TABLE [dbo].[interneetable]  WITH CHECK ADD  CONSTRAINT [FK_interneetable_superisourtable] FOREIGN KEY([supervisorid])
REFERENCES [dbo].[supervisortable] ([id])
GO
ALTER TABLE [dbo].[interneetable] CHECK CONSTRAINT [FK_interneetable_superisourtable]
GO
ALTER TABLE [dbo].[interneetable]  WITH CHECK ADD  CONSTRAINT [FK_interneetable_usertable] FOREIGN KEY([userid])
REFERENCES [dbo].[usertable] ([id])
GO
ALTER TABLE [dbo].[interneetable] CHECK CONSTRAINT [FK_interneetable_usertable]
GO
ALTER TABLE [dbo].[managerstable]  WITH CHECK ADD  CONSTRAINT [FK_ManagersTable_usertable] FOREIGN KEY([userid])
REFERENCES [dbo].[usertable] ([id])
GO
ALTER TABLE [dbo].[managerstable] CHECK CONSTRAINT [FK_ManagersTable_usertable]
GO
ALTER TABLE [dbo].[supervisortable]  WITH CHECK ADD  CONSTRAINT [FK_superisourtable_usertable] FOREIGN KEY([userid])
REFERENCES [dbo].[usertable] ([id])
GO
ALTER TABLE [dbo].[supervisortable] CHECK CONSTRAINT [FK_superisourtable_usertable]
GO
USE [master]
GO
ALTER DATABASE [IASDB] SET  READ_WRITE 
GO
