USE [master]
GO
/****** Object:  Database [Source]    Script Date: 11/12/2024 11:58:40 AM ******/
CREATE DATABASE [Source]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Source', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Source.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Source_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Source_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Source] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Source].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Source] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Source] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Source] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Source] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Source] SET ARITHABORT OFF 
GO
ALTER DATABASE [Source] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Source] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Source] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Source] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Source] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Source] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Source] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Source] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Source] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Source] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Source] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Source] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Source] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Source] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Source] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Source] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Source] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Source] SET RECOVERY FULL 
GO
ALTER DATABASE [Source] SET  MULTI_USER 
GO
ALTER DATABASE [Source] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Source] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Source] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Source] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Source] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Source] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Source', N'ON'
GO
ALTER DATABASE [Source] SET QUERY_STORE = ON
GO
ALTER DATABASE [Source] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Source]
GO
/****** Object:  Table [dbo].[data_flow]    Script Date: 11/12/2024 11:58:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_flow](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cet] [datetime] NULL,
	[lset] [datetime] NULL,
	[table_name] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hocsinh]    Script Date: 11/12/2024 11:58:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hocsinh](
	[MaHS_NK] [char](4) NOT NULL,
	[Hovaten] [nvarchar](20) NULL,
	[ngaysinh] [date] NULL,
	[gioitinh] [nvarchar](3) NULL,
	[malopNK] [char](2) NULL,
	[createdDate] [datetime] NULL,
	[updatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHS_NK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lop_hoc]    Script Date: 11/12/2024 11:58:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lop_hoc](
	[MaLop_NK] [char](2) NOT NULL,
	[tenlop] [varchar](10) NULL,
	[siso] [tinyint] NULL,
	[createdDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLop_NK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[hocsinh] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[hocsinh] ADD  DEFAULT (getdate()) FOR [updatedDate]
GO
ALTER TABLE [dbo].[lop_hoc] ADD  CONSTRAINT [DF_siso]  DEFAULT ((0)) FOR [siso]
GO
ALTER TABLE [dbo].[lop_hoc] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[lop_hoc] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[hocsinh]  WITH CHECK ADD FOREIGN KEY([malopNK])
REFERENCES [dbo].[lop_hoc] ([MaLop_NK])
GO
USE [master]
GO
ALTER DATABASE [Source] SET  READ_WRITE 
GO
