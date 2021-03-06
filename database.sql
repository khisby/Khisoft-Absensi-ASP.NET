USE [master]
GO
/****** Object:  Database [absensi]    Script Date: 01/07/2020 13.41.36 ******/
CREATE DATABASE [absensi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'absensi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\absensi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'absensi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\absensi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [absensi] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [absensi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [absensi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [absensi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [absensi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [absensi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [absensi] SET ARITHABORT OFF 
GO
ALTER DATABASE [absensi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [absensi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [absensi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [absensi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [absensi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [absensi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [absensi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [absensi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [absensi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [absensi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [absensi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [absensi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [absensi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [absensi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [absensi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [absensi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [absensi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [absensi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [absensi] SET  MULTI_USER 
GO
ALTER DATABASE [absensi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [absensi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [absensi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [absensi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [absensi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [absensi] SET QUERY_STORE = OFF
GO
USE [absensi]
GO
/****** Object:  Table [dbo].[absensi.absensi]    Script Date: 01/07/2020 13.41.36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[absensi.absensi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tanggal] [date] NOT NULL,
	[jam_masuk] [time](7) NOT NULL,
	[jam_keluar] [time](7) NOT NULL,
	[id_karyawan] [int] NOT NULL,
 CONSTRAINT [PK_absensi.absensi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[absensi.karyawan]    Script Date: 01/07/2020 13.41.36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[absensi.karyawan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nip] [int] NOT NULL,
	[nama] [nchar](255) NOT NULL,
	[alamat] [nchar](255) NOT NULL,
	[id_upah] [int] NOT NULL,
 CONSTRAINT [PK_absensi.karyawan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[absensi.upah]    Script Date: 01/07/2020 13.41.36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[absensi.upah](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nama_golongan] [nchar](255) NOT NULL,
	[gaji] [int] NOT NULL,
 CONSTRAINT [PK_absensi.upah] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_absensi.karyawan]    Script Date: 01/07/2020 13.41.36 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_absensi.karyawan] ON [dbo].[absensi.karyawan]
(
	[nip] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[absensi.absensi]  WITH CHECK ADD  CONSTRAINT [FK_absensi.absensi_absensi.karyawan] FOREIGN KEY([id_karyawan])
REFERENCES [dbo].[absensi.karyawan] ([id])
GO
ALTER TABLE [dbo].[absensi.absensi] CHECK CONSTRAINT [FK_absensi.absensi_absensi.karyawan]
GO
ALTER TABLE [dbo].[absensi.karyawan]  WITH CHECK ADD  CONSTRAINT [FK_absensi.karyawan_absensi.upah] FOREIGN KEY([id_upah])
REFERENCES [dbo].[absensi.upah] ([id])
GO
ALTER TABLE [dbo].[absensi.karyawan] CHECK CONSTRAINT [FK_absensi.karyawan_absensi.upah]
GO
USE [master]
GO
ALTER DATABASE [absensi] SET  READ_WRITE 
GO
